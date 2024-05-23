Return-Path: <emil.kronborg@protonmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 285D7C25B75
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 12:56:01 +0000 (UTC)
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by mx.groups.io with SMTP id smtpd.web10.14635.1716468954693789770
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 May 2024 05:55:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@protonmail.com header.s=protonmail3 header.b=BVpr7rtS;
 spf=pass (domain: protonmail.com, ip: 185.70.43.16, mailfrom: emil.kronborg@protonmail.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1716468953; x=1716728153;
	bh=8cJFhY5XgEb2NQH9lCZKGaJtMc8QzTcE92KSgVcVbGM=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=BVpr7rtSaPXT+ZBg1uAReCreUc4KeYbcp5/ZdHWbAq1X3mn5MZ3nWN+unj5w6qCUU
	 Qo6YTpO8wTXvGoldotpTG5+2pbzbrpRbtR10uc6QH5qZRVFH7BlQow8YlJxPF7Xxvc
	 FHcback9l7U/2x+ADptdG0cPNxAGXEX7+JiIh2gaC0bNLPgITajqBFmPjYjtTNEMDI
	 U7jn0KepZ0OoCS9Leg5MlufuAoySdM/RXlpKvTC7Nt97lJImbh2JJ/CQsFIoMEW9M5
	 p7m2YrYZhjZdiI8dZWb7mzTrrOwHBahvwomsNuQVQZ4YwMAGVApfLIvOTGR1zdxZGi
	 9mo7Dv/JcWDcg==
Date: Thu, 23 May 2024 12:55:49 +0000
To: openembedded-core@lists.openembedded.org
From: Emil Kronborg <emil.kronborg@protonmail.com>
Cc: rasmus.villemoes@prevas.dk
Subject: [PATCH] insane.bbclass: fix HOST_ variable names
Message-ID: <20240523125543.45993-1-emil.kronborg@protonmail.com>
Feedback-ID: 20949900:user:proton
X-Pm-Message-ID: 455afc519e1dfb12f50c257bed53a64630c7a009
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 May 2024 12:56:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199791

Commit cd25e5544ca3 ("insane: use HOST_ variables, not TARGET_ to
determine the cross system") updated the variables themselves, but not
their names. To prevent confusion, match the Python variable name to the
BitBake variable name.

Signed-off-by: Emil Kronborg <emil.kronborg@protonmail.com>
---
 meta/classes-global/insane.bbclass | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insan=
e.bbclass
index 99736830b9a8..d6124ef121a8 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -334,12 +334,12 @@ def package_qa_check_arch(path,name,d, elf, messages)=
:
     if not elf:
         return
=20
-    target_os   =3D d.getVar('HOST_OS')
-    target_arch =3D d.getVar('HOST_ARCH')
+    host_os   =3D d.getVar('HOST_OS')
+    host_arch =3D d.getVar('HOST_ARCH')
     provides =3D d.getVar('PROVIDES')
     bpn =3D d.getVar('BPN')
=20
-    if target_arch =3D=3D "allarch":
+    if host_arch =3D=3D "allarch":
         pn =3D d.getVar('PN')
         oe.qa.add_message(messages, "arch", pn + ": Recipe inherits the al=
larch class, but has packaged architecture-specific binaries")
         return
@@ -356,12 +356,12 @@ def package_qa_check_arch(path,name,d, elf, messages)=
:
=20
     #if this will throw an exception, then fix the dict above
     (machine, osabi, abiversion, littleendian, bits) \
-        =3D oe.elf.machine_dict(d)[target_os][target_arch]
+        =3D oe.elf.machine_dict(d)[host_os][host_arch]
=20
     # Check the architecture and endiannes of the binary
     is_32 =3D (("virtual/kernel" in provides) or bb.data.inherits_class("m=
odule", d)) and \
-            (target_os =3D=3D "linux-gnux32" or target_os =3D=3D "linux-mu=
slx32" or \
-            target_os =3D=3D "linux-gnu_ilp32" or re.match(r'mips64.*32', =
d.getVar('DEFAULTTUNE')))
+            (host_os =3D=3D "linux-gnux32" or host_os =3D=3D "linux-muslx3=
2" or \
+            host_os =3D=3D "linux-gnu_ilp32" or re.match(r'mips64.*32', d.=
getVar('DEFAULTTUNE')))
     is_bpf =3D (oe.qa.elf_machine_to_string(elf.machine()) =3D=3D "BPF")
     if not ((machine =3D=3D elf.machine()) or is_32 or is_bpf):
         oe.qa.add_message(messages, "arch", "Architecture did not match (%=
s, expected %s) in %s" % \

base-commit: 50f78cb9de68cd4317f34321dfdb06d72ce5d3c6
--=20
2.45.1



