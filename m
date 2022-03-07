Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85864C433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 16:14:19 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web12.28253.1646669657852679751
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 08:14:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57,
 mailfrom: mark.hatle@kernel.crashing.org)
Received: from [192.168.2.236] ([70.99.78.137])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 227GEGXU010993
	for <openembedded-core@lists.openembedded.org>;
 Mon, 7 Mar 2022 10:14:17 -0600
Message-ID: <b5b62038-9549-114c-72b3-cc1acb633aa9@kernel.crashing.org>
Date: Mon, 7 Mar 2022 10:14:15 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [OE-core] [PATCH] sstate: inside the threadedpool don't write to
 the shared localdata
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <20220306210823.53177-1-quaresma.jose@gmail.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <20220306210823.53177-1-quaresma.jose@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 16:14:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162853

Note, it appears this bug is in honister as well.

On 3/6/22 3:08 PM, Jose Quaresma wrote:
> When inside the threadedpool we make a copy of the localdata
> to avoid some race condition, so we need to use this new
> localdata2 and stop write the shared localdata.
> 
> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> ---
>   meta/classes/sstate.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index dc9a2c085b..7aca415159 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -988,7 +988,7 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
>   
>               localdata2 = bb.data.createCopy(localdata)
>               srcuri = "file://" + sstatefile
> -            localdata.setVar('SRC_URI', srcuri)
> +            localdata2.setVar('SRC_URI', srcuri)
>               bb.debug(2, "SState: Attempting to fetch %s" % srcuri)
>   
>               import traceback
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162790): https://lists.openembedded.org/g/openembedded-core/message/162790
> Mute This Topic: https://lists.openembedded.org/mt/89597961/3616948
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mark.hatle@kernel.crashing.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

