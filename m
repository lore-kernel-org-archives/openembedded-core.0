Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE48FD1A610
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 12:33:07 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9015.1767961979698895000
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jan 2026 04:33:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=vkBfmo3w;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 49923C1F6DD;
	Fri,  9 Jan 2026 12:32:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8DD3A60734;
	Fri,  9 Jan 2026 12:32:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 811C9103C88FC;
	Fri,  9 Jan 2026 13:32:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767961976; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SR912I9EV5rmio+OYfzGFthvIPHYoM0yyQwhorNYIP8=;
	b=vkBfmo3wMNHP9vVPEMGJ34ZGo6tvYoz4lBC2Gd5stO8Mbre3MPz+dog050Jwlq2pEi/4wv
	C8hYqD9QGG5tCg8BEexRArzb7u+hzXC5k2WHzHiUVtts/Tcgji5G4OMvWR/X8eZm1EJy3U
	jWuBQwV+0qtcbbTnqYUrR70qU9LEZsW4l5TTNbmBUqrTIUMK/fevwZmDiorOUu4PR+nY96
	/Kl/+Nv/6r7tD2djr2aqyhTrbZQgT0CD81rj/qQ1VgH5t0+fJhjkAOf0fEqwO7xR+G9NBe
	DhW46u0D2jmk23a/1oRTST7+drTzM1NblzGPoSJnegkThgEoFxbDaIJGep9/TQ==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	thomas.perrot@bootlin.com,
	raj.khem@gmail.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [whinlatter][PATCH v1 1/2] mesa: fix build error with llvmpipe gallium driver
Date: Fri,  9 Jan 2026 13:32:31 +0100
Message-ID: <20260109123232.1199822-2-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260109123232.1199822-1-joaomarcos.costa@bootlin.com>
References: <20260109123232.1199822-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 12:33:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229104

For RISC-V, and if the PACKAGECONFIG 'gallium-llvm' is enabled, mesa's
do_compile fails due to a change in setObjectLinkingLayerCreator's
signature. This change was first included in LLVM v21.

This issue is further described below:
https://gitlab.freedesktop.org/mesa/mesa/-/issues/13852

Backport the fix - from upstream - to Whinlatter.

Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
---
 .../files/0001-gallivm-support-LLVM-21.patch  | 56 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-gallivm-support=
-LLVM-21.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-gallivm-support-LLVM-2=
1.patch b/meta/recipes-graphics/mesa/files/0001-gallivm-support-LLVM-21.p=
atch
new file mode 100644
index 0000000000..cf3bdd36cf
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-gallivm-support-LLVM-21.patch
@@ -0,0 +1,56 @@
+From cd129dbf8af2d16b1243f2ce287ff69c6a5dc557 Mon Sep 17 00:00:00 2001
+From: no92 <no92.mail@gmail.com>
+Date: Wed, 27 Aug 2025 16:02:31 +0200
+Subject: gallivm: support LLVM 21
+
+LLVM PR#146819 changed the signature of `setObjectLinkingLayerCreator`,
+dropping the Triple argument. The PR was first included in the LLVM 21
+series, and the new signature is gated behind a version check for that.
+
+`LLVMOrcThreadSafeContextGetContext` was removed in LLVM commit b18e5b6,
+and the ORC examples in the LLVM tree seem to just create a context
+instead, which we replicate here.
+
+With this commit, mesa successfully builds the llvmpipe gallium driver
+on riscv64 with LLVM 21.1.0.
+
+Closes: https://gitlab.freedesktop.org/mesa/mesa/-/issues/13785
+Closes: https://gitlab.freedesktop.org/mesa/mesa/-/issues/13852
+
+Reviewed-by: David Heidelberg <david@ixit.cz>
+Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/3702=
7>
+
+Upstream-Status: Backport [https://cgit.freedesktop.org/mesa/mesa/commit=
/?id=3Dcd129dbf8af2d16b1243f2ce287ff69c6a5dc557]
+---
+ src/gallium/auxiliary/gallivm/lp_bld_init_orc.cpp | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/src/gallium/auxiliary/gallivm/lp_bld_init_orc.cpp b/src/gal=
lium/auxiliary/gallivm/lp_bld_init_orc.cpp
+index 6651ea439da..e5d8e461dd6 100644
+--- a/src/gallium/auxiliary/gallivm/lp_bld_init_orc.cpp
++++ b/src/gallium/auxiliary/gallivm/lp_bld_init_orc.cpp
+@@ -339,7 +339,12 @@ LPJit::LPJit() :jit_dylib_count(0) {
+          .setJITTargetMachineBuilder(std::move(JTMB))
+ #ifdef USE_JITLINK
+          .setObjectLinkingLayerCreator(
++#if LLVM_VERSION_MAJOR >=3D 21
++            /* LLVM 21 removed the Triple argument */
++            [&](ExecutionSession &ES) {
++#else
+             [&](ExecutionSession &ES, const llvm::Triple &TT) {
++#endif
+                return std::make_unique<ObjectLinkingLayer>(
+                   ES, ExitOnErr(llvm::jitlink::InProcessMemoryManager::=
Create()));
+             })
+@@ -551,7 +556,7 @@ init_gallivm_state(struct gallivm_state *gallivm, co=
nst char *name,
+    gallivm->cache =3D cache;
+=20
+    gallivm->_ts_context =3D context->ref;
+-   gallivm->context =3D LLVMOrcThreadSafeContextGetContext(context->ref=
);
++   gallivm->context =3D LLVMContextCreate();
+=20
+    gallivm->module_name =3D LPJit::get_unique_name(name);
+    gallivm->module =3D LLVMModuleCreateWithNameInContext(gallivm->modul=
e_name,
+--=20
+cgit v1.2.3
+
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
index 3124db0986..a35dff3347 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -17,6 +17,7 @@ PE =3D "2"
 SRC_URI =3D "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patc=
h \
            file://0001-freedreno-don-t-encode-build-path-into-binaries.p=
atch \
+           file://0001-gallivm-support-LLVM-21.patch \
 "
=20
 SRC_URI[sha256sum] =3D "bb6243e7a6f525febfa1e6ab50827ca4d4bfdad73812377b=
0ca9b6c50998b03e"
--=20
2.47.0


