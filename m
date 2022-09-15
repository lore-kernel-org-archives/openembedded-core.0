Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 762F5ECAAD3
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 13:02:02 +0000 (UTC)
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by mx.groups.io with SMTP id smtpd.web10.9677.1663246912233585302
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 06:01:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm3
 header.b=rKbe4KJt;
 spf=pass (domain: gherzan.com, ip: 64.147.123.21,
 mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id A8513320030E;
	Thu, 15 Sep 2022 09:01:49 -0400 (EDT)
Received: from imap41 ([10.202.2.91])
  by compute3.internal (MEProxy); Thu, 15 Sep 2022 09:01:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1663246909; x=1663333309; bh=/QcV/62hnL
	PGmRgIQAbDMvhdrPEtxh+mVJYUubkrIE0=; b=rKbe4KJtspxdeeSZ3DRZpxSK5W
	woh3+ggr6VyPL10OgTHviS3FUzPEOZ0xkfPuqhIbwOYdqdffQtndNnTcx7tjFZ1t
	sooks0aJ1HBkIdzI6vWppdVeHga8cGbvHuaVC0p2Rhnh5ZJEGEzNxJ1ONmSZdXMU
	OVCaTVG5dCKd/Zj1dK99JF1lTE3zh+NZcchsgiii5V61MeaNJHVFEY6iJseM2sMv
	fFHrpypXCjeHfpT/V1v3OQOJ6b4TlMW5cVW9N5hQuhm5qTqV9p8iT5atCULfpJlN
	sqz+UjMNSqqr4GQOVNLv3uNngKFXyc4JTt9T/5+epS/PBtIJTkLa7oyaBtbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1663246909; x=1663333309; bh=/QcV/62hnLPGmRgIQAbDMvhdrPEt
	xh+mVJYUubkrIE0=; b=C9tNl8+a7u0PF0/0+qFx+90Zb0WMDsdyeBC3hc2hcKzr
	1cVTkN6zqo4Mgf8IFXC/ytROPIPUtNX3KniP2GZx4j1K3WpqeLKx1wuFtGHLSzJS
	jmgIeXARriVn02Hwfh9OFzQG6Jikzfkvuf3YIY8yks+uI3b1xAYMndlwXc7xf8au
	olyhrmqd1tfkVvNnzxATBkXdN79O286iobWQg+h7vf8TlGkNTkXCq5/JdqFyWZYN
	/0cMiiopDD0umpo5P+xMJWHpW4Sa4QNwMuu1j+YTbAvoYAOiVwHFLYSp7BObMnlz
	GQPlpiXEJreX+emY5lQZ/OURZ3ywtx2WdITAP+PJbQ==
X-ME-Sender: <xms:PCIjY51J3CanoJaLmIo2zELixXDHDIl-aJ26wSuU0pTJVskvZJlJDg>
    <xme:PCIjYwGCoMByOG_coWw0LnPeaH78Wc3TrpW3nPNZ10VO7XDWbnxHkBdyY_aWlqLrc
    bIz-xGR4xlxkyieXok>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrfedukedgiedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvvefutgesth
    dtredtreertdenucfhrhhomhepfdetnhgurhgvihcuifhhvghriigrnhdfuceorghnughr
    vghisehghhgvrhiirghnrdgtohhmqeenucggtffrrghtthgvrhhnpeelhfduheeiudegje
    ejgfeuudegveffudeuhfdvgfethfegvdegueejleegieekudenucffohhmrghinhepohhp
    vghnvghmsggvugguvggurdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:PCIjY56YcOcVgD4Gtm_fK_CU6eVHyAy_PHJFGPIoXevDO5zkbo6dUA>
    <xmx:PCIjY21bmq6daz-GTZHszVyeMkoZy-PZIIBGUhoIl64CSmmw_3VFbA>
    <xmx:PCIjY8GfnBBoXbKQOv5Zjnf0IUZ0fI7dcY998MwiDG1T-jis9yNXqA>
    <xmx:PSIjY_yTWF7hRUdDYEdxGk-1gDvz-0I1x6053YPQT7IEjDEeNXcVPQ>
Feedback-ID: i68994715:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 6C0FF234007E; Thu, 15 Sep 2022 09:01:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-935-ge4ccd4c47b-fm-20220914.001-ge4ccd4c4
Mime-Version: 1.0
Message-Id: <2bf3fecd-0837-430f-8f64-00779a5855c3@www.fastmail.com>
In-Reply-To: <20220915125045.1641790-1-andrei@gherzan.com>
References: <20220915125045.1641790-1-andrei@gherzan.com>
Date: Thu, 15 Sep 2022 14:01:24 +0100
From: "Andrei Gherzan" <andrei@gherzan.com>
To: openembedded <openembedded-core@lists.openembedded.org>
Cc: "Andrei Gherzan" <andrei.gherzan@huawei.com>
Subject: Re: [PATCH] grub: Allow build on armv7ve/a with softfp
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 13:02:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170696

Hi,

On Thu, 15 Sep 2022, at 13:50, Andrei Gherzan wrote:
> From: Andrei Gherzan <andrei.gherzan@huawei.com>
>
> Grub tries to force the compilation in softfp mode for some known target
> CPU. That is because it doesn't use floats or doubles and there are
> known limitations of using a configuration with hardfp. There are though
> target CPUs that grub won't know how to configure failing with something
> similar to:
>
> | checking for options to get soft-float... no
> | configure: error: could not force soft-float
>
> This change relaxes a bit the COMPATIBLE_HOST restriction to only apply
> for hardfp configuration even for arm7ve/a.
>
> Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
> ---
>  meta/recipes-bsp/grub/grub2.inc | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
> index 47ea561002..6c9952d2d7 100644
> --- a/meta/recipes-bsp/grub/grub2.inc
> +++ b/meta/recipes-bsp/grub/grub2.inc
> @@ -43,9 +43,18 @@ CVE_CHECK_IGNORE += "CVE-2021-46705"
> 
>  DEPENDS = "flex-native bison-native gettext-native"
> 
> -COMPATIBLE_HOST = 
> '(x86_64.*|i.86.*|arm.*|aarch64.*|riscv.*)-(linux.*|freebsd.*)'
> -COMPATIBLE_HOST:armv7a = 'null'
> -COMPATIBLE_HOST:armv7ve = 'null'
> +GRUB_COMPATIBLE_HOST = 
> '(x86_64.*|i.86.*|arm.*|aarch64.*|riscv.*)-(linux.*|freebsd.*)'
> +COMPATIBLE_HOST = "${GRUB_COMPATIBLE_HOST}"
> +# Grub doesn't support hard float toolchain and won't be able to 
> forcefully
> +# disable it on some of the target CPUs. See 'configure.ac' for
> +# supported/unsupported CPUs in hardfp.
> +COMPATIBLE_HOST:armv7a = "${@'null' if d.getVar('TUNE_CCARGS_MFLOAT') 
> == 'hardfp' else d.getVar('GRUB_COMPATIBLE_HOST')}"
> +COMPATIBLE_HOST:armv7ve = "${@'null' if d.getVar('TUNE_CCARGS_MFLOAT') 
> == 'hardfp' else d.getVar('GRUB_COMPATIBLE_HOST')}"
> +
> +# Grub doesn't use float or doubles and tries to disable forcefully 
> floating
> +# point at configure time. That dynamic flags configuration doesn't 
> always work
> +# (for example on arm 32bit) so force the compilation in softfp.
> +TUNE_CCARGS_MFLOAT:class-target = "softfp"

Please ignore this v1 patch as the above was not supposed to be part of the patch. I've sent a cleaned up v2: https://lists.openembedded.org/g/openembedded-core/message/170695

Thanks,
Andrei

