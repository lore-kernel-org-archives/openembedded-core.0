Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CCEDCD5BDE
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 06:58:33 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14367.1779865106540700539
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2026 23:58:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=o/9+1sOd;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CA95D1A36DC
	for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 06:58:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A1A80601A1;
	Wed, 27 May 2026 06:58:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CD9DD10888BA2;
	Wed, 27 May 2026 08:58:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779865103; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MvSivpLNB2njJL/pilzmC/t2hEBtXRLvNpw0RD2EqNI=;
	b=o/9+1sOdFbf6nxwpH2at3/9VGxLW0KZL0BIVYz1EgSuUC5AoDqw+kEhBFj/Kf94er5/Ucm
	7tMttwdKcbJC9nLancwXhHKpxyAX4v726vFqQuQFD9nvTLGCVN7C0Pz1s/nulnHbPhGnS5
	JgwhSfkuBD5tJHZASHoIeMhKHqC1XHwmTPXoHsP9R+YOdQCB45Ph8aEi3CTXdmo86EbuIy
	4ezp2os4BixSUC2k57tVb3jqEqj3M2c9yTViPTtGWkk/hJLN+DwYzBxunNOvbTkuIQJmV6
	0AiekQHa+QbXDJgumF5gATpQ6VJx/NqVLX5y0kXSLVsaY1HLNXjYixiBSOvUXA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 27 May 2026 08:58:20 +0200
Message-Id: <DIT9IRDXGA86.1L3TDJD2YLDWY@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <rybczynska@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 1/2] uboot-sign: sign SPL FIT
 configurations instead of images
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260526094042.54135-1-marta.rybczynska@ygreky.com>
In-Reply-To: <20260526094042.54135-1-marta.rybczynska@ygreky.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 06:58:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237631

On Tue May 26, 2026 at 11:40 AM CEST, Marta Rybczynska via lists.openembedd=
ed.org wrote:
> From: Marta Rybczynska <rybczynska@gmail.com>
>
> The SPL FIT signing path was signing individual images, but not the confi=
guration.
>
> Introduce signing of configuration with images under a separate option SP=
L_SIGN_CONF,
> enabled by default. It implies changes in the DTB content.
>
> The old behaviour is possible with SPL_SIGN_INDIVIDUAL, but should be rem=
oved in
> a subsequent patch.
>
> Signed-off-by: Marta Rybczynska <rybczynska@gmail.com>

Hi Marta,

Thanks for the new version. I believe we still have two selftest
failures because of it:

2026-05-26 16:34:33,908 - oe-selftest - INFO - fitimage.UBootFitImageTests.=
test_sign_standalone_uboot_atf_tee_fit_image (subunit.RemotedTestCase)
2026-05-26 16:34:33,909 - oe-selftest - INFO -  ... FAIL
...
ERROR: u-boot-1_2026.04-r0 do_uboot_assemble_fitimage: Execution of '/srv/p=
okybuild/yocto-worker/oe-selftest-armhost/build/build-st-2700759/tmp/work/q=
emuarm-poky-linux-gnueabi/u-boot/2026.04/temp/run.do_uboot_assemble_fitimag=
e.3572291' failed with exit code 1
...
| Signature written to 'u-boot-fitImage', node '/configurations/conf/signat=
ure'
| Public key written to 'spl/u-boot-spl.dtb', node '/signature/key-spl-oe-s=
elftest'
| Signature check bad (error 1)
| Verifying Hash Integrity for node 'conf'... sha256,rsa2048:spl-oe-selftes=
t+
| sha256,rsa2048:spl-oe-selftest-
|  error!
| Verification failed for '(null)' hash node in 'conf' config node
| Failed to verify required signature 'key-spl-cascaded-oe-selftest'
| WARNING: exit code 1 from a shell command.
...
2026-05-26 16:35:33,469 - oe-selftest - INFO - fitimage.UBootFitImageTests.=
test_sign_standalone_uboot_fit_image (subunit.RemotedTestCase)
2026-05-26 16:35:33,469 - oe-selftest - INFO -  ... FAIL
...
ERROR: u-boot-1_2026.04-r0 do_uboot_assemble_fitimage: Execution of '/srv/p=
okybuild/yocto-worker/oe-selftest-armhost/build/build-st-2700759/tmp/work/q=
emuarm-poky-linux-gnueabi/u-boot/2026.04/temp/run.do_uboot_assemble_fitimag=
e.3689059' failed with exit code 1
...
| Signature written to 'u-boot-fitImage', node '/configurations/conf/signat=
ure'
| Public key written to 'spl/u-boot-spl.dtb', node '/signature/key-spl-oe-s=
elftest'
| Signature check bad (error 1)
| Verifying Hash Integrity for node 'conf'... sha256,rsa2048:spl-oe-selftes=
t+
| sha256,rsa2048:spl-oe-selftest-
|  error!
| Verification failed for '(null)' hash node in 'conf' config node
| Failed to verify required signature 'key-spl-cascaded-oe-selftest'
| WARNING: exit code 1 from a shell command.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3999
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3905
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3770

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


