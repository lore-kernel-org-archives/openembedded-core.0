Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A908C4332F
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 07:32:50 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.127535.1671089563284812274
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Dec 2022 23:32:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: enedino.org, ip: 13.77.154.182, mailfrom: alejandro@enedino.org)
Received: from alsamon-xub.lan (cpe-68-201-55-29.elp.res.rr.com [68.201.55.29])
	by linux.microsoft.com (Postfix) with ESMTPSA id 6032520B87E0;
	Wed, 14 Dec 2022 23:32:42 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6032520B87E0
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
To: openembedded-core@lists.openembedded.org
Cc: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Subject: [PATCH 2/2] rust: Enable baremetal targets
Date: Thu, 15 Dec 2022 00:32:24 -0700
Message-Id: <20221215073224.3061128-2-alejandro@enedino.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221215073224.3061128-1-alejandro@enedino.org>
References: <20221215073224.3061128-1-alejandro@enedino.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 07:32:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174562

Allow rust to build for baremetal targets by generating the proper target
triple, follow the format specified by rusts Triple [1], that is:

<arch>-<vendor>-<os>-<abi>

This is done automatically based on both TARGET_OS and TCLIBC.

For example, a riscv64 baremetal target triple would look like this:
riscv64gc-poky-none-elf

matching rusts own target triple for riscv64 according to platform-suppor=
t [2]

[1] https://docs.rs/target-lexicon/latest/target_lexicon/struct.Triple.ht=
ml
[2] https://doc.rust-lang.org/stable/rustc/platform-support.html

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.o=
rg>
---
 meta/classes-recipe/rust-common.bbclass        | 6 ++++++
 meta/classes-recipe/rust-target-config.bbclass | 5 ++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/rust-common.bbclass b/meta/classes-recip=
e/rust-common.bbclass
index 3338de7502..0f72e45e8c 100644
--- a/meta/classes-recipe/rust-common.bbclass
+++ b/meta/classes-recipe/rust-common.bbclass
@@ -66,6 +66,12 @@ def rust_base_triple(d, thing):
     elif "musl" in os:
         libc =3D "-musl"
         os =3D "linux"
+    elif "elf" in os:
+        libc =3D "-elf"
+        os =3D "none"
+    elif "eabi" in os:
+        libc =3D "-eabi"
+        os =3D "none"
=20
     return arch + vendor + '-' + os + libc
=20
diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classe=
s-recipe/rust-target-config.bbclass
index 2710b4325d..7fd7128bcf 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -355,7 +355,10 @@ def rust_gen_target(d, thing, wd, arch):
     tspec['target-c-int-width'] =3D d.getVarFlag('TARGET_C_INT_WIDTH', a=
rch_abi)
     tspec['target-endian'] =3D d.getVarFlag('TARGET_ENDIAN', arch_abi)
     tspec['arch'] =3D arch_to_rust_target_arch(rust_arch)
-    tspec['os'] =3D "linux"
+    if "baremetal" in d.getVar('TCLIBC'):
+        tspec['os'] =3D "none"
+    else:
+        tspec['os'] =3D "linux"
     if "musl" in tspec['llvm-target']:
         tspec['env'] =3D "musl"
     else:
--=20
2.34.1


