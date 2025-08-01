Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31F34C87FCB
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 09:56:37 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.84095.1754042187630141744
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 02:56:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=cyDCVHcO;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 27C1C43217;
	Fri,  1 Aug 2025 09:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754042185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hFOb75iDgQqhb6HSJ7Yi6EwuDIKTZtJN/aGDAajChBk=;
	b=cyDCVHcO7YyxvtoZmY8tP90z6onDawKva5HdCkl5OTJXaqp84MDQD5J2L5ac4bms3tcPf+
	9aZtqK2e+z0tqw0mmlwjaE2q8ZXAgVd8r1h62/yynLwCfIcSrCFAzU6NyRi2n5QmQTIqOb
	PPZukgaBKLpJhxS8SxorcG5nSt/HFmC89BoVBendlee86wN4aNNE8kn9joJZylNI3B9zda
	NghjqdtF7viYUXB7UtQSuFdwrigiWuxyBgVulHjHfVtFa7uCf3RH7GdkiTuL3ACiUo/Vv/
	sUctCafo0ZL3ijmMjNJ6U+wMKBkcuCaku4zlUxOxotUJZNrs3VBjw3xSbtCQRQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 01 Aug 2025 11:56:24 +0200
Message-Id: <DBR027884PSE.3LDB5GXMMT6YN@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Vincent Davis Jr" <vince@underview.tech>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v5 1/3] bootimg_pcbios: initial import of grub
 legacy bios boot
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250801021607.511597-2-vince@underview.tech>
In-Reply-To: <20250801021607.511597-2-vince@underview.tech>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddutdeffeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkhffvuffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeeggfehgfegjeefvdefleffkefhleekveeffeffteevhfetueelhfekgfeijefhnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmeguugeimedvgeeftdemfhekudejmeekfegvtdemugejsggrmeekudeludenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemugguieemvdegfedtmehfkedujeemkeefvgdtmegujegsrgemkeduledupdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepvhhinhgtvgesuhhnuggvrhhvihgvfidrthgvtghhpdhrtghpthhtohepohhpvghnv
 ghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 09:56:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221225

On Fri Aug 1, 2025 at 4:16 AM CEST, Vincent Davis Jr wrote:
> Moves syslinux config file creation,
> partition prepare, and mbr install
> tasks into there own seperate functions
> before removal from SourcePlugin class
> functions.
>
> Add 3 new functions for creation of
> grub config, preparing boot partition
> to contain grub config and modules,
> and install grub boot.img to resulting
> wic image.
>
> Signed-off-by: Vincent Davis Jr <vince@underview.tech>
> ---

Hi Vincent,

It looks like this is breaking some tests:

ERROR: core-image-minimal-dev-1.0-r0 do_image_wic: Execution of '/srv/pokyb=
uild/yocto-worker/qemux86/build/build/tmp/work/qemux86-poky-linux/core-imag=
e-minimal-dev/1.0/temp/run.do_image_wic.2578330' failed with exit code 1
...
| output: Error: Can't have the end before the start! (start sector=3D2048 =
length=3D0)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/30/builds/2118
https://autobuilder.yoctoproject.org/valkyrie/#/builders/78/builds/2172

Can you have a look at these failures please?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


