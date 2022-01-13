Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4435C433EF
	for <webhook@archiver.kernel.org>; Thu, 13 Jan 2022 21:39:25 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.3635.1642109965012129775
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 13:39:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57,
 mailfrom: mark.hatle@kernel.crashing.org)
Received: from [192.168.2.107] ([70.99.78.137])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 20DLdNi2027744
	for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 15:39:24 -0600
Message-ID: <e21133e4-c640-e3b5-9a66-b7756f09119d@kernel.crashing.org>
Date: Thu, 13 Jan 2022 15:39:22 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [OE-core] [PATCH] sanity: Drop TUNEABI, TUNEABI_WHITELIST,
 TUNEABI_OVERRIDE
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <20220113212704.1727295-1-richard.purdie@linuxfoundation.org>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <20220113212704.1727295-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jan 2022 21:39:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160533

Just as confirmation, places I know this code was used are no longer being used.

(Toolchains now pretty much all come from YP sources vs a magic binary)

--Mark

On 1/13/22 3:27 PM, Richard Purdie wrote:
> These were added nearly a decade ago but there are no users in OE-Core. I
> checked with the likely users and they seem to have no current usage either.
> Therefore remove them.
> 
> If needed for some prebuilt library somewhere, they could be implemented
> in the layer using them instead but I doubt these are in use any longer.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   meta/classes/sanity.bbclass  | 42 ------------------------------------
>   meta/conf/documentation.conf |  3 ---
>   2 files changed, 45 deletions(-)
> 
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 0e20589b22d..f288b4c84c9 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -185,37 +185,6 @@ def raise_sanity_error(msg, d, network_error=False):
>       
>       %s""" % msg)
>   
> -# Check flags associated with a tuning.
> -def check_toolchain_tune_args(data, tune, multilib, errs):
> -    found_errors = False
> -    if check_toolchain_args_present(data, tune, multilib, errs, 'CCARGS'):
> -        found_errors = True
> -    if check_toolchain_args_present(data, tune, multilib, errs, 'ASARGS'):
> -        found_errors = True
> -    if check_toolchain_args_present(data, tune, multilib, errs, 'LDARGS'):
> -        found_errors = True
> -
> -    return found_errors
> -
> -def check_toolchain_args_present(data, tune, multilib, tune_errors, which):
> -    args_set = (data.getVar("TUNE_%s" % which) or "").split()
> -    args_wanted = (data.getVar("TUNEABI_REQUIRED_%s:tune-%s" % (which, tune)) or "").split()
> -    args_missing = []
> -
> -    # If no args are listed/required, we are done.
> -    if not args_wanted:
> -        return
> -    for arg in args_wanted:
> -        if arg not in args_set:
> -            args_missing.append(arg)
> -
> -    found_errors = False
> -    if args_missing:
> -        found_errors = True
> -        tune_errors.append("TUNEABI for %s requires '%s' in TUNE_%s (%s)." %
> -                       (tune, ' '.join(args_missing), which, ' '.join(args_set)))
> -    return found_errors
> -
>   # Check a single tune for validity.
>   def check_toolchain_tune(data, tune, multilib):
>       tune_errors = []
> @@ -247,17 +216,6 @@ def check_toolchain_tune(data, tune, multilib):
>               bb.debug(2, "  %s: %s" % (feature, valid_tunes[feature]))
>           else:
>               tune_errors.append("Feature '%s' is not defined." % feature)
> -    whitelist = localdata.getVar("TUNEABI_WHITELIST")
> -    if whitelist:
> -        tuneabi = localdata.getVar("TUNEABI:tune-%s" % tune)
> -        if not tuneabi:
> -            tuneabi = tune
> -        if True not in [x in whitelist.split() for x in tuneabi.split()]:
> -            tune_errors.append("Tuning '%s' (%s) cannot be used with any supported tuning/ABI." %
> -                (tune, tuneabi))
> -        else:
> -            if not check_toolchain_tune_args(localdata, tuneabi, multilib, tune_errors):
> -                bb.debug(2, "Sanity check: Compiler args OK for %s." % tune)
>       if tune_errors:
>           return "Tuning '%s' has the following errors:\n" % tune + '\n'.join(tune_errors)
>   
> diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
> index f63f4b223a1..6b50ad08a8b 100644
> --- a/meta/conf/documentation.conf
> +++ b/meta/conf/documentation.conf
> @@ -440,9 +440,6 @@ TOOLCHAIN_TARGET_TASK[doc] = "This variable lists packages the OpenEmbedded buil
>   TOPDIR[doc] = "The Build Directory. BitBake automatically sets this variable. The OpenEmbedded build system uses the Build Directory when building images."
>   TRANSLATED_TARGET_ARCH[doc] = "A sanitized version of TARGET_ARCH. This variable is used where the architecture is needed in a value where underscores are not allowed."
>   TUNE_PKGARCH[doc] = "The package architecture understood by the packaging system to define the architecture, ABI, and tuning of output packages."
> -TUNEABI[doc] = "An underlying ABI used by a particular tuning in a given toolchain layer. This feature allows providers using prebuilt libraries to check compatibility of a tuning against their selection of libraries."
> -TUNEABI_OVERRIDE[doc] = "If set, ignores TUNEABI_WHITELIST."
> -TUNEABI_WHITELIST[doc] = "A whitelist of permissible TUNEABI values.  If the variable is not set, all values are allowed."
>   TUNECONFLICTS[doc] = "List of conflicting features for a given feature."
>   TUNEVALID[doc] = "Descriptions, stored as flags, of valid tuning features."
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160532): https://lists.openembedded.org/g/openembedded-core/message/160532
> Mute This Topic: https://lists.openembedded.org/mt/88407256/3616948
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mark.hatle@kernel.crashing.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

