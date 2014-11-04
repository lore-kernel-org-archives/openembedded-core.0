Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id A770A65C91
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Nov 2014 12:08:05 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id BE0F1F811DD; Tue,  4 Nov 2014 05:08:05 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id A115AF811DB;
	Tue,  4 Nov 2014 05:08:03 -0700 (MST)
Message-ID: <5458C1A5.7060800@mlbassoc.com>
Date: Tue, 04 Nov 2014 05:08:05 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1415100396.23396.17.camel@ted>
In-Reply-To: <1415100396.23396.17.camel@ted>
Subject: Re: [PATCH] bitbake.conf/base.bbclass: Drop PRINC support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Nov 2014 12:08:05 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-11-04 04:26, Richard Purdie wrote:
> PRINC is no longer needed since we have the PR service instead
> which people should be using. Drop the PRINC code.
>
> This has been deprecated with a warning for a while so we can remove it
> now.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index e1b25ff..b2c4f08 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -369,22 +369,6 @@ python () {
>           else:
>               appendVar('EXTRA_OECONF', extraconf)
>
> -    # If PRINC is set, try and increase the PR value by the amount specified
> -    # The PR server is now the preferred way to handle PR changes based on
> -    # the checksum of the recipe (including bbappend).  The PRINC is now
> -    # obsolete.  Return a warning to the user.
> -    princ = d.getVar('PRINC', True)
> -    if princ and princ != "0":
> -        bb.warn("Use of PRINC %s was detected in the recipe %s (or one of its .bbappends)\nUse of PRINC is deprecated.  The PR server should be used to automatically increment the PR.  See: https://wiki.yoctoproject.org/wiki/PR_Service." % (princ, d.getVar("FILE", True)))
> -        pr = d.getVar('PR', True)
> -        pr_prefix = re.search("\D+",pr)
> -        prval = re.search("\d+",pr)
> -        if pr_prefix is None or prval is None:
> -            bb.error("Unable to analyse format of PR variable: %s" % pr)
> -        nval = int(prval.group(0)) + int(princ)
> -        pr = pr_prefix.group(0) + str(nval) + pr[prval.end():]
> -        d.setVar('PR', pr)
> -
>       pn = d.getVar('PN', True)
>       license = d.getVar('LICENSE', True)
>       if license == "INVALID":
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 2a8a37f..8842d6b 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -181,7 +181,6 @@ ASSUME_PROVIDED = "\
>   PN = "${@bb.parse.BBHandler.vars_from_file(d.getVar('FILE'),d)[0] or 'defaultpkgname'}"
>   PV = "${@bb.parse.BBHandler.vars_from_file(d.getVar('FILE'),d)[1] or '1.0'}"
>   PR = "${@bb.parse.BBHandler.vars_from_file(d.getVar('FILE'),d)[2] or 'r0'}"
> -PRINC ?= "0"
>   PF = "${PN}-${EXTENDPE}${PV}-${PR}"
>   EXTENDPE = "${@['','${PE\x7d_'][int(d.getVar('PE',1) or 0) > 0]}"
>   P = "${PN}-${PV}"

Won't this just silently make use of PRINC a no-op?  What about
the users that had their head in the sand for the last few months
but still expect PRINC to have some effect (and maybe don't use
PR server)?  I would think escalating this to an error would make
more sense (and follow other warnings that are now errors).

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

