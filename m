Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36FD6C433F5
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 15:56:17 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web12.12207.1664466976482275809
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 08:56:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81,
 mailfrom: f_l_k@t-online.de)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout03.t-online.de (Postfix) with SMTP id 0B4907A1C;
	Thu, 29 Sep 2022 17:56:12 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.42.234]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1odvtR-249cB60; Thu, 29 Sep 2022 17:56:09 +0200
Date: Thu, 29 Sep 2022 17:56:04 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] wic-imager-direct.py: use fstab update also for
 root device
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, ross.burton@arm.com
Message-Id: <GXAZIR.UGYTFTPVEII43@t-online.de>
In-Reply-To: 
	<f0eca98f9324c537e2aee3c655258f98372d7926.camel@linuxfoundation.org>
References: <20220929125750.3338743-1-f_l_k@t-online.de>
	<f0eca98f9324c537e2aee3c655258f98372d7926.camel@linuxfoundation.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-NH1xEibgXRvjroon3Ps4"
X-TOI-EXPURGATEID: 150726::1664466969-E4FD107E-E7AC74C2/0/0 CLEAN NORMAL
X-TOI-MSGID: eb2212e7-6ed5-4018-9b9d-7ee69dad2e2a
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Sep 2022 15:56:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171195

--=-NH1xEibgXRvjroon3Ps4
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Do, 29. Sep 2022 um 16:32:40 +0100 schrieb Richard Purdie 
<richard.purdie@linuxfoundation.org>:
> Do we need to worry here about whether we're actually adding a new 
> root
> entry? Is there a case it does need to be preserved?

wic does run the fstab_update by default and adds entries for all vaild 
partitions. Single partitions can be prohibited using 
'--no-fstab-update' in the .wks file. You can choose to use /dev/foo 
format, uuid (--use-uuid) or label (--use-label). The fstab_update can 
also be disabled globally by setting:

WIC_CREATE_EXTRA_ARGS ?= "--no-fstab-update"

In that case the stock fstab file wont be touched by wic at all.

This has been active for some months now but got reverted here
<https://git.yoctoproject.org/poky/commit/?id=e7619f7650e1f545dccba327bbc8d03a7b34fc4e>

because systemd-fstab-generator got confused by trying to create two 
different '-.mount' files.



--=-NH1xEibgXRvjroon3Ps4
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am Do, 29. Sep 2022 um 16:32:40 +0100 schrieb Richard Purdie &lt;richard.purdie@linuxfoundation.org&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Do we need to worry here about whether we're actually adding a new root
entry? Is there a case it does need to be preserved?</div></blockquote><div><br></div><div>wic does run the fstab_update by default and adds entries for all vaild partitions. Single partitions can be prohibited using '--no-fstab-update' in the .wks file. You can choose to use /dev/foo format, uuid (--use-uuid) or label (--use-label). The fstab_update can also be disabled globally by setting: &nbsp;</div><div><br></div><div>WIC_CREATE_EXTRA_ARGS ?= "--no-fstab-update"</div><div><br></div><div>In that case the stock fstab file wont be touched by wic at all.</div><div><br></div><div>This has been active for some months now but got reverted here</div><div><a href="https://git.yoctoproject.org/poky/commit/?id=e7619f7650e1f545dccba327bbc8d03a7b34fc4e">https://git.yoctoproject.org/poky/commit/?id=e7619f7650e1f545dccba327bbc8d03a7b34fc4e</a></div><div><br></div><div>because systemd-fstab-generator got confused by trying to create two different '-.mount' files.</div><div><br></div></div>
--=-NH1xEibgXRvjroon3Ps4--


