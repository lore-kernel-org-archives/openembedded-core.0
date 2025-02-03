Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E1B0C02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 18:33:32 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by mx.groups.io with SMTP id smtpd.web10.95770.1738607607024357645
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 10:33:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=kwnthPeH;
 spf=pass (domain: posteo.com, ip: 185.67.36.65, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id C24DB240027
	for <openembedded-core@lists.openembedded.org>; Mon,  3 Feb 2025 19:33:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1738607604; bh=dG9c1NrZwjVlDZ+8Y4hdin6R9xoHsbpNn7txrZm6sAY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=kwnthPeHe5tMvP3hqRWvbjWLZnM8JjPzRur4uefLTITqytvC+2/hRDUvUvsb36ZkW
	 2dp4O9tEs0+9GX7g7B/iJAtadQwu5X9qFaOLaZWcSH4eG9GEyGT06hHGRwnpu1cSqe
	 vOs4BsaUhSFRnEFaMEXXVRdNDeg68kIl6oLfEWGjrx0RhTiij4x7/lVNT8xiY7zoSH
	 aljvQu692sgcL4H6bLST9Jcbl8PjsbO1vGnehl04YnuTYRTyqEl1cHa1nGrldETblu
	 NbYU46Jp56i0An2sua3oClsOoONMrQI8oDErHSgs7MF3jqp7j4R2WI2IPqGPALy7YJ
	 VdLtrIe/EKWdA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Ymw9c05Qxz9rxP;
	Mon,  3 Feb 2025 19:33:23 +0100 (CET)
From: simone.p.weiss@posteo.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [PATCH] libseccomp: Upgrade 2.5.5 -> 2.6
Date: Mon,  3 Feb 2025 18:26:43 +0000
Message-Id: <20250203182643.20919-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 18:33:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210730

From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>

Changelog:
- Update the syscall table for Linux v6.13
- Add support for new arches: SuperH little and big endian, LoongArch, an=
d
  32-bit Motorola 68000
- Add multiplexed syscall support for more arches: MIPS, SuperH, and PPC
- Consolidate and simplify handling of multiplexed syscalls
- Add support for the SECCOMP_FILTER_FLAG_WAIT_KILLABLE_RECV flag
- Add support for transactions with the seccomp_transaction_start(),
  seccomp_transaction_commit(), and seccomp_transaction_reject() APIs
- Add a seccomp_precompute() API to generate the seccomp BPF filter prior=
 to
  seccomp_load() or seccomp_export_bpf_mem()
- Add support for binary tree filters without syscalls
- Add support for the kernel=E2=80=99s implementation change of
  SECCOMP_IOCTL_NOTIF_ID_VALID
- Add Python binding support for retrieving the notification file descrip=
tor
- Improved tooling to help track syscall table updates in the Linux kerne=
l
- Handle EINVAL error from the kernel when the WAIT_KILLABLE_RECV flag is
  erroneously provided to the kernel
- Fix a seccomp userspace notification issue where the file descriptor wa=
s
  being requested more than once
- Fix a bug where the internal filter state could be corrupted when a fil=
ter
  rule addition fails
- Fix potential memory leak in the internal management of filter snapshot=
s
- Utilize Cython rather than distutils in the Python bindings, due to
  distutils=E2=80=99 deprecation
- Many test and CI improvements and fixes
- Many documentation improvements and updates

Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
---
 .../libseccomp/{libseccomp_2.5.5.bb =3D> libseccomp_2.6.0.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libseccomp/{libseccomp_2.5.5.bb =3D> libsecc=
omp_2.6.0.bb} (96%)

diff --git a/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb b/meta/r=
ecipes-support/libseccomp/libseccomp_2.6.0.bb
similarity index 96%
rename from meta/recipes-support/libseccomp/libseccomp_2.5.5.bb
rename to meta/recipes-support/libseccomp/libseccomp_2.6.0.bb
index 478e5f4289..949799fc82 100644
--- a/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb
+++ b/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb
@@ -7,9 +7,9 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7c13b3376cea0c=
e68d2d2da0a1b3a72c"
=20
 DEPENDS +=3D "gperf-native"
=20
-SRCREV =3D "f0b04ab0b4fc0bc2cde6da1f407b4a487fe6d78f"
+SRCREV =3D "c7c0caed1d04292500ed4b9bb386566053eb9775"
=20
-SRC_URI =3D "git://github.com/seccomp/libseccomp.git;branch=3Drelease-2.=
5;protocol=3Dhttps \
+SRC_URI =3D "git://github.com/seccomp/libseccomp.git;branch=3Drelease-2.=
6;protocol=3Dhttps \
            file://run-ptest \
            "
=20
--=20
2.39.5


