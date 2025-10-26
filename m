Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E61ACCCF9E5
	for <webhook@archiver.kernel.org>; Sun, 26 Oct 2025 13:23:15 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.10218.1761484993565053410
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Oct 2025 06:23:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=b61ZGo6I;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C20EF1A169C;
	Sun, 26 Oct 2025 13:23:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 885F3606E7;
	Sun, 26 Oct 2025 13:23:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D916A102F24B6;
	Sun, 26 Oct 2025 14:23:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761484990; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JjsLv+w37aTL+ZgzOGY5K290QU/9CrVfWWiYNv5Efp0=;
	b=b61ZGo6IJ3cywHZZm2POTFNWyDgfHf9V1wPBuOdDosRQnzJtj7FxIba+5/c9gNUOLOZcD1
	T3QWzbHjoglC9SWMdl9BZmW1CLjiP0sfEbTYNhc3wZz5SKdkHbPSlcDu3Tm2fb/2iV5Pvk
	/cZH2XvxzfuQZmBuo4X14p2Mxa9uMeZtNmp2fjbn/lD1F1YXrRVMG9ivoKtLER4dLnL+MG
	uHRVSv6E4i/x+z1yJ8NdzC1vhA44DjtAqgpcpbEnaS/WkXMYItGcrixl+4w9z4+eV/SX/R
	BM9pvaxoxjZICVMGmQi+Se+tvK0oDL3BWhD1DazWhL8FKtePKRK7sWZLZXkgAw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 26 Oct 2025 14:23:04 +0100
Message-Id: <DDSABAGDJDZ8.O3KH5LWYYAAW@bootlin.com>
Subject: Re: [OE-core] [PATCH] rust-target-config: Set elfv2 ABI for
 powerpc64 when using ppc64p9le tune
Cc: <Sundeep.Kokkonda@windriver.com>, <Deepesh.Varatharajan@windriver.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <deepesh.varatharajan@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251023161522.994070-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20251023161522.994070-1-Deepesh.Varatharajan@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Oct 2025 13:23:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225315

On Thu Oct 23, 2025 at 6:15 PM CEST, Deepesh via lists.openembedded.org Var=
atharajan wrote:
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> For the powerpc64 machine with ppc64p9le tune, the supported ABI is elfv2
> but the default elfv1 ABI is used and this causes link-time errors such a=
s:
>
>     ABI version 1 is not compatible with ABI version 2 output
>
> To resolve this, the powerpc64 machine with ppc64p9le tune is updated
> with elfv2 ABI otherwise, default to elfv1 ABI. This change ensures
> consistent ABI behavior across LLVM and Rust builds.
>
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---

Hi Deepesh,

It looks like this is making the
sstatetests.SStateHashSameSigs2.test_sstate_nativesdk_samesigs_multilib
test fail:

2025-10-26 08:51:57,797 - oe-selftest - INFO - sstatetests.SStateHashSameSi=
gs2.test_sstate_nativesdk_samesigs_multilib (subunit.RemotedTestCase)
2025-10-26 08:51:57,797 - oe-selftest - INFO -  ... FAIL
...
AssertionError: {'nat[45104 chars]o/do_fetch': 'bdd296fda030801a2ec723f040e=
d3f24[267479 chars]6d3'} !=3D {'nat[45104 chars]o/do_install': 'ef30ed01cb1=
6a4f54ae283891c27ba[267479 chars]6d3'}
- {'adwaita-icon-theme/do_collect_spdx_deps': 'e9c8aa9cb0da1323bf4df9c65737=
8e80fea1073a8965b8a3a93d343cb1682b32',
-  'adwaita-icon-theme/do_compile': 'c77f720ad728595247f0191ce3f416d1bbb294=
52cb6ddd29abcf4ef5b7d5675c',
-  'adwaita-icon-theme/do_configure': 'c42cce9d1f3dfc4af7d4ee6896de1148dea9=
2979785fc33826d877747b2d07e5',
-  'adwaita-icon-theme/do_create_package_spdx': '701aeb10f9e4da9c6d1ab2c1d9=
7d2b43c621b5cbd5b90c89cfc4f49123ed28fb',
-  'adwaita-icon-theme/do_create_spdx': 'c7b48fa5ee7aa7e2183567d8eecf53bd1e=
f32266d89c55b05a75f1e2e91a0f54',
+ {'adwaita-icon-theme/do_collect_spdx_deps': '26bf70dce8eafe543e4577a0a25c=
e6c70f70a8c43413115a7e428c2fd00e2242',
+  'adwaita-icon-theme/do_compile': 'b83691bddde426f52318e31a2fab6e17807abe=
ceb5ccc7441f1008f6c77e5291',
+  'adwaita-icon-theme/do_configure': '6e38f74c8d0a14e3229cdf96058639c1f926=
9bf34e035c83874a0713256b6dd9',
+  'adwaita-icon-theme/do_create_package_spdx': '57a8b2eee13c7e4df83c7c88cf=
b2f0acd479f072c11a082a14acc5345fcf8228',
+  'adwaita-icon-theme/do_create_spdx': '72ee25314fee38c71794368ce1030dc9ce=
103a5e10ca09c3412066effad6e684',

...

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/2744
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2596
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/2506

Can you have look at these errors?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


