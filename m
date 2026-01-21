Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6D20C44536
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 15:16:22 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13957.1769008572298565217
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jan 2026 07:16:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Y8Xr1XdO;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 468A54E421C4
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Jan 2026 15:16:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 16F156070A;
	Wed, 21 Jan 2026 15:16:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CDDB8119B1677;
	Wed, 21 Jan 2026 16:16:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769008569; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LHimEfT8kdwZdkvWvn/tm/iQn8fBSmB9uFRSpfMHu+g=;
	b=Y8Xr1XdOUJ4zaUBmHL0i4aSDrtJN5lu+uUELP7NHmdDXG6TST7w0XdR98UK4jBidYkiJJN
	mBUmRFmSUWK+FZXevBW6TfpMZ9rDZkUSUHJYaZk8HhijqEFm9dTeEjq8857zhsM/wvxJfQ
	NZXBOMHdzr3pLnupcgpbuCjYpGgqo27SM9kUUWZOmDRAqMcYLyQwii0J2NZGMQHECYI3Rv
	GqFnjloxtHZUyln3g1QWNTlttW0Xpuamy2lsL/KUJzLiXL7gONY+8Rx796C5p8gAG3GM53
	T6nSXGMm2rRfapIhSTC+QnU43J2PoceRboyYON3cdf5FV+g8k1QdyqtwVmRzFQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Jan 2026 16:16:07 +0100
Message-Id: <DFUD78TMO2O0.1WB04Y9FC5LNH@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <Harish.Sadineni@windriver.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v4 00/16] Enable rust support for linux kernel
References: <20260120182947.857242-1-Harish.Sadineni@windriver.com>
 <843161.1768934499700757613@lists.openembedded.org>
In-Reply-To: <843161.1768934499700757613@lists.openembedded.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jan 2026 15:16:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229815

Hi,

On Tue Jan 20, 2026 at 7:41 PM CET, Harish via lists.openembedded.org Sadin=
eni wrote:
> This patch series was tested on Autobuilder:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3193
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3056

Thanks for your efforts on this. However I think it triggers issues in othe=
r
builders as you can see from this a-full run (a-full is the complete Autobu=
ilder
testing run):

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3101

For example, the first failure in the list (beaglebone builder):

| error: linking with `/srv/pokybuild/yocto-worker/beaglebone/build/build/t=
mp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-rust/1.92.0/wrapper/build-=
rust-ccld` failed: exit status: 1
|   |
|   =3D note:  "/srv/pokybuild/yocto-worker/beaglebone/build/build/tmp/work=
/x86_64-nativesdk-pokysdk-linux/nativesdk-rust/1.92.0/wrapper/build-rust-cc=
ld" "-m64" "/tmp/rustcBDQQCc/symbols.o" "<75 object files omitted>" "-Wl,--=
as-needed" "-Wl,-Bstatic" "<sysroot>/lib/rustlib/x86_64-unknown-linux-gnu/l=
ib/{libstd-*,libpanic_unwind-*,libobject-*,libmemchr-*,libaddr2line-*,libgi=
mli-*,libcfg_if-*,librustc_demangle-*,libstd_detect-*,libhashbrown-*,librus=
tc_std_workspace_alloc-*,libminiz_oxide-*,libadler2-*,libunwind-*,liblibc-*=
,librustc_std_workspace_core-*,liballoc-*,libcore-*,libcompiler_builtins-*}=
.rlib" "-Wl,-Bdynamic" "-lgcc_s" "-lutil" "-lrt" "-lpthread" "-lm" "-ldl" "=
-lc" "-L" "/tmp/rustcBDQQCc/raw-dylibs" "-Wl,--eh-frame-hdr" "-Wl,-z,noexec=
stack" "-L" "/srv/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/x8=
6_64-nativesdk-pokysdk-linux/nativesdk-rust/1.92.0/recipe-sysroot/usr/local=
/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/lib" "-L" "<s=
ysroot>/lib/rustlib/x86_64-unknown-linux-gnu/lib" "-o" "/srv/pokybuild/yoct=
o-worker/beaglebone/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nat=
ivesdk-rust/1.92.0/sources/rustc-1.92.0-src/build/bootstrap/debug/deps/rust=
doc-92c720c010da8c74" "-Wl,--gc-sections" "-pie" "-Wl,-z,relro,-z,now" "-no=
defaultlibs" "-lz" "-lzstd"
|   =3D note: some arguments are omitted. use `--verbose` to show all linke=
r arguments
|   =3D note: /srv/pokybuild/yocto-worker/beaglebone/build/build/tmp/hostto=
ols/ld: cannot find /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-p=
okysdk-linux/lib/libm.so.6: No such file or directory
|           /srv/pokybuild/yocto-worker/beaglebone/build/build/tmp/hosttool=
s/ld: cannot find /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pok=
ysdk-linux/lib/libmvec.so.1: No such file or directory
|           collect2: error: ld returned 1 exit status


https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/builds/3084
https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/5052191/raw_inlin=
e

Can you have a look at these failures?

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


