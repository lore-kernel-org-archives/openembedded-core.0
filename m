Return-Path: <richard@nod.at>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E667C4828F
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 14:01:52 +0000 (UTC)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by mx.groups.io with SMTP id smtpd.web11.20669.1707314503741507698
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Feb 2024 06:01:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=syntax error for token:  (domain: nod.at, ip: 195.201.40.130, mailfrom: richard@nod.at)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id F3A90626FAE2
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Feb 2024 15:01:40 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id cjz8hWnyRyRz; Wed,  7 Feb 2024 15:01:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 74937626FAED;
	Wed,  7 Feb 2024 15:01:40 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id fDvQL_Uf5PVb; Wed,  7 Feb 2024 15:01:40 +0100 (CET)
Received: from blindfold.corp.sigma-star.at (unknown [82.150.214.1])
	by lithops.sigma-star.at (Postfix) with ESMTPSA id 44FF8622623F;
	Wed,  7 Feb 2024 15:01:40 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: openembedded-core@lists.openembedded.org
Cc: Richard Weinberger <richard@nod.at>
Subject: [PATCH] [RFC] kernel.bbclass: Set CROSS_COMPILE_COMPAT
Date: Wed,  7 Feb 2024 15:01:24 +0100
Message-Id: <20240207140125.15974-1-richard@nod.at>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 14:01:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195064

To be able to build with CONFIG_COMPAT_VDSO=3Dy on arm64
an arm32 toolchain is needed by the kernel build system.

This patch implements the necessary logic to locate the arm32
toolchain in an arm64 multilib environment.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
Hi!

This is the least ugly version I came up so far,
please tell me what you think.

Thanks,
//richard

P.s: I tested this only on Kirkstone, yet.
---
 meta/classes-recipe/kernel.bbclass | 33 ++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/ker=
nel.bbclass
index a76aaee5bac4..9a0e95bb1925 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -208,6 +208,39 @@ PACKAGES_DYNAMIC +=3D "^${KERNEL_PACKAGE_NAME}-modul=
e-.*"
 PACKAGES_DYNAMIC +=3D "^${KERNEL_PACKAGE_NAME}-image-.*"
 PACKAGES_DYNAMIC +=3D "^${KERNEL_PACKAGE_NAME}-firmware-.*"
=20
+def get_arm32_prefix(d):
+    arm_prefix =3D ''
+
+    if d.getVar('TARGET_ARCH').startswith('aarch64'):
+        pfxs =3D all_multilib_tune_values(d, 'TARGET_PREFIX').split()
+        for p in pfxs:
+           if p.startswith("arm-"):
+               arm_prefix =3D p
+
+    return arm_prefix
+
+def arm32_full_prefix(d):
+    pfx =3D get_arm32_prefix(d)
+    if pfx =3D=3D '':
+        return ''
+
+    ps =3D all_multilib_tune_values(d, 'STAGING_BINDIR_TOOLCHAIN').split=
()
+    for p in ps:
+        if p.endswith(pfx[:-1]):
+            return p + '/' + pfx
+
+    return ''
+
+def arm32_gcc_dep(d):
+    pfx =3D get_arm32_prefix(d)
+    if pfx !=3D '':
+        return 'virtual/lib32-' + pfx + 'gcc'
+    else:
+        return ''
+
+DEPENDS +=3D "${@arm32_gcc_dep(d)}"
+export CROSS_COMPILE_COMPAT=3D"${@arm32_full_prefix(d)}"
+
 export OS =3D "${TARGET_OS}"
 export CROSS_COMPILE =3D "${TARGET_PREFIX}"
=20
--=20
2.26.2


