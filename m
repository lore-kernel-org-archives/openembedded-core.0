Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91892C77B75
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 07:40:58 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.15936.1684827653949875132
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 May 2023 00:40:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=bTMmflL3;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3AA3B240014;
	Tue, 23 May 2023 07:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684827651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KoDdXlARs/sGHO2xzAAY/6mZ6n1l3DCYmBIrT/k6ROM=;
	b=bTMmflL3GeOfNIhZfb0eNwEdKftskxs+8ovNNiP0BgSH726jELfznbpkh/T7VIKTEZgTMM
	EidCQdELK/kUy3+yEU23M8ORIAfqfw0TtJWDsNlQrKAGz3k4bRf6bCSKmhWolTuxcxK6fZ
	MgpA51DdpNW6OJty36jUyo3Gz5ZIyG/y0wzuW84fVA52vhWp3punCMcOOJXe31KQEOfscL
	zGTiSWZc9skCAlc/Hom/szyH1obNMR97ffa9JYtZkGL+ZP3rde/4GzYlHrHNA4Fnia3Nk1
	mYzrbrdNihgU6vVI5p19qcCsPkrQ4Nzpj06bS8JcRRF+Imv29W+rJo/LZU6NgQ==
Date: Tue, 23 May 2023 09:40:49 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: luca.ceresoli@bootlin.com, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] Issues with kernel.bbclass default "S" value
Message-ID: <20230523094049.77874439@booty>
In-Reply-To: <17607A9B07F730BC.26337@lists.openembedded.org>
References: <17607A9B07F730BC.26337@lists.openembedded.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 May 2023 07:40:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181627

Hello Bruce,

On Fri, 19 May 2023 09:24:21 +0200
"Luca Ceresoli via lists.openembedded.org"
<luca.ceresoli=bootlin.com@lists.openembedded.org> wrote:

> Hello,
> 
> I have been facing some troubles while writing a very simple recipe
> inheriting kernel.bbclass to build a mainline kernel.
> 
> The error message is:
> 
>   ... do_populate_lic: QA Issue: ... LIC_FILES_CHKSUM points to an invalid file: .../work-shared/.../kernel-source/COPYING [license-checksum]
> 
> After my investigation, this turned out to happen when not setting S in
> the recipe, which results in an empty work-shared/.../kernel-source
> directory.
> 
> If S in not set in the recipe, kernel.bbclass sets it to
> ${STAGING_KERNEL_DIR} (${TMPDIR}/work-shared/${MACHINE}/kernel-source).
> This means that in do_symlink_kernsrc(), the 'if s != kernsrc' never
> triggers. By reading the code under that if, it appears to assume that
> STAGING_KERNEL_DIR somehow contains the kernel sources already, however
> I haven't found any code that is supposed to unpack it there. Also, in
> all my tests with S not set in the recipe I had the kernel expanded
> inside the WORKDIR, never in STAGING_KERNEL_DIR.
> 
> I have considered two use cases:
> 
>  * When fetching from git, setting S is mandatory, thus one shouldn't
>    expect things to work without setting it. However the error message
>    is totally misleading
> 
>  * When fetching a tarball and without setting S, the same misleading
>    error message appears. However not setting S is totally normal for
>    regular recipes fetching a tarball, thus it's hard to blame the
>    recipe developer for not setting S. It would be even more nice to
>    produce an explanatory error message such as "Please set S when
>    using kernel.bbclass".
> 
> However I am most likely missing other relevant use cases.
> 
> I started writing a patch to add such an error message, but I soon
> realized that writing the most appropriate 'if' to trigger the message
> would require me to understand something:
> 
>  * In which use cases does it make sense to have S ==
>    STAGING_KERNEL_DIR?
> 
>  * How is the kernel expected to be unpacked in STAGING_KERNEL_DIR when
>    S == STAGING_KERNEL_DIR?
> 
> Another, related question: are non-core layers expected to set
> STAGING_KERNEL_DIR? My understanding is that it is set in
> kernel.bbclass (and a few other oe-core classes) for others to read,
> never to be modified elsewhere. The ref manual is vague about this, I'd
> be glad to clarify it.

Do you have an opinion about these question?

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

