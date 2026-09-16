Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78A6AC982C9
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 16:03:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18616.1789574572881593438
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 09:02:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=k83Afijy;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8EAFD1516
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 09:02:48 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CE35A3F86F
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 09:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789574572; bh=8B8RhInFKceVkvwKqr2lmdzfCJPsASVG8Q7rCJuvBrc=;
	h=From:To:Subject:Date:From;
	b=k83AfijyoKdPPGWg3FwtqNgT+2++NTNcBB0a6ywT/n7Wd8CkjcxdEGwuTIyb+wkYC
	 JKgC2LlgWHipg89mZIkteixkNirAns65+GTtWz41RmCEv+GWx/Dh72zUcCc4OhG/KL
	 N0IwRcMltmBNxTRCHpk28Ew8CBOI6DXEtRGKWZQ4=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] seatd: add PACKAGECONFIG for the man-pages
Date: Wed, 16 Sep 2026 17:02:44 +0100
Message-ID: <20260916160246.276107-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 16:03:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245988

seatd will build manpages if scdoc is present.  Inherit manpages and
add a PACKAGECONFIG so that we build them if they're enabled.

This also removes a floating dependency on scdoc.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/seatd/seatd_0.9.3.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/seatd/seatd_0.9.3.bb b/meta/recipes-core/s=
eatd/seatd_0.9.3.bb
index 72c54d58ab9..82a47196a73 100644
--- a/meta/recipes-core/seatd/seatd_0.9.3.bb
+++ b/meta/recipes-core/seatd/seatd_0.9.3.bb
@@ -10,7 +10,7 @@ SRC_URI =3D "git://git.sr.ht/~kennylevinsen/seatd;proto=
col=3Dhttps;branch=3Dmaster;tag
            file://init"
 SRCREV =3D "daa8196e10b180b8b0caeafa8e5f860eb1bd6706"
=20
-inherit meson pkgconfig systemd update-rc.d useradd
+inherit meson manpages pkgconfig systemd update-rc.d useradd
=20
 # https://www.openwall.com/lists/musl/2020/01/20/3
 CFLAGS:append:libc-musl:powerpc64le =3D " -Wno-error=3Doverflow"
@@ -30,6 +30,7 @@ PACKAGECONFIG ?=3D " \
=20
 PACKAGECONFIG[libseat-builtin] =3D "-Dlibseat-builtin=3Denabled,-Dlibsea=
t-builtin=3Ddisabled"
 PACKAGECONFIG[systemd] =3D "-Dlibseat-logind=3Dsystemd,,systemd"
+PACKAGECONFIG[manpages] =3D "-Dman-pages=3Denabled,-Dman-pages-disabled,=
scdoc-native"
=20
 do_install:append() {
         if [ "${VIRTUAL-RUNTIME_init_manager}" !=3D "systemd" ]; then
--=20
2.43.0


