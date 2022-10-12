Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B0ECC433FE
	for <webhook@archiver.kernel.org>; Wed, 12 Oct 2022 07:46:37 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web09.17953.1665560790804276435
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Oct 2022 00:46:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Xs6csgmW;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 19BC84000C;
	Wed, 12 Oct 2022 07:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1665560788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uQIs1Z2nwkd1yffv29RIU7NBp0UU6P1DWIT739+dx0c=;
	b=Xs6csgmWNaMoW/Vj/6dVEiEPEVCliFg5Vsk/zbrgJBuDa+NlfPsi1ss2xOsWFqk0iVh2u/
	enGCC8C/SHH5PLQzcp+FL5672L4WC8/oeQ30mvCeJItulRhp2MqsHHeD6+LQibLPiBaQDX
	jKjkt4/Jt87kXyUvzs2h8DTOUyBvNgA0s/CvhU5rjCvo/pbzbaxIGNMh33pqiKzbwFJlre
	IwOtGHi9Vtif7pEmi0mYlZq2UE17Kfbr+jXvCKl8guWbPGNoOzkbiP+kS0Q20gCMCtZkav
	nlASI43Q6hQDODAz/znRVnaACZlkNoXa6/lr3Y2lYDTZG7UR5IK6RinHuKMqPQ==
Message-ID: <c20e232c-0c22-491a-28ad-e4c61b28395d@bootlin.com>
Date: Wed, 12 Oct 2022 09:46:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][dunfell][PATCH] rsync: fix CVE-2022-29154
Content-Language: en-US
To: vkumbhar <vkumbhar@mvista.com>
References: <20221011154943.39162-1-vkumbhar@mvista.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20221011154943.39162-1-vkumbhar@mvista.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Oct 2022 07:46:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171655

Hi again Vivek

On 10/11/22 17:49, vkumbhar wrote:
> Source: https://git.samba.org/?p=rsync.git;a=patch;h=b7231c7d02cfb65d291af74ff66e7d8c507ee871
> MR: 120436
> Type: Security Fix
> Disposition: Backport from https://git.samba.org/?p=rsync.git;a=patch;h=b7231c7d02cfb65d291af74ff66e7d8c507ee871
> ChangeID: c343a62e84fc2bd4793bda2f45e603a1347d0672
> Description:
>      CVE-2022-29154 rsync: remote arbitrary files write inside the
>
> Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> ---
>   .../rsync/files/0001-CVE-2022-29154.patch     | 335 ++++++++++++++++++
>   meta/recipes-devtools/rsync/rsync_3.1.3.bb    |   1 +
>   2 files changed, 336 insertions(+)
>   create mode 100644 meta/recipes-devtools/rsync/files/0001-CVE-2022-29154.patch


There is also another issue in the way your patches are sent.

If I apply your patch through "git am", the author of the commit is:
vkumbhar <vkumbhar@mvista.com>
instead of
Vivek Kumbhar <vkumbhar@mvista.com>

Because of this issue, the maintainer has to manually fix this field 
when accepting your patch. Worse, if he doesn't catch this, that's 
harder to fix afterwards.

You may be able to fix this by running:

git config --global sendemail.from "vkumbhar@mvista.com"
This should add a "From" field to the sent patch which "git am" should 
be able to match with your name.

At least this worked for me. See 
https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded#Sending_using_git-send-email

Could you send your V2 after doing this? You could send it to me again 
through private-email first.

Thanks in advance
Michael.
-- 

Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


