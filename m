Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72935D778A2
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 18:04:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1637.1769191497694368123
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jan 2026 10:04:57 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C47D01476
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 10:04:50 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0475E3F694
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 10:04:56 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/8] perf: inherit the pkgconfig class
Date: Fri, 23 Jan 2026 18:04:42 +0000
Message-ID: <20260123180448.2997378-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260123180448.2997378-1-ross.burton@arm.com>
References: <20260123180448.2997378-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 18:04:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229904

Perf uses pkg-config, so should inherit the class.

Also remove the sedding of PKG_CONFIG, we pass it in as an argument to
make via EXTRA_OEMAKE so the sed is redundant.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-kernel/perf/perf.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/=
perf.bb
index b69ba2ac12..7a58088462 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -55,7 +55,7 @@ do_configure[depends] +=3D "virtual/kernel:do_shared_wo=
rkdir"
=20
 PROVIDES =3D "virtual/perf"
=20
-inherit linux-kernel-base kernel-arch manpages
+inherit linux-kernel-base kernel-arch manpages pkgconfig
=20
 # needed for building the tools/perf Python bindings
 inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3ta=
rgetconfig', '', d)}
@@ -349,7 +349,6 @@ do_configure:prepend () {
         sed -i 's,CC =3D $(CROSS_COMPILE)gcc,#CC,' ${S}/tools/perf/Makef=
ile.perf
         sed -i 's,AR =3D $(CROSS_COMPILE)ar,#AR,' ${S}/tools/perf/Makefi=
le.perf
         sed -i 's,LD =3D $(CROSS_COMPILE)ld,#LD,' ${S}/tools/perf/Makefi=
le.perf
-        sed -i 's,PKG_CONFIG =3D $(CROSS_COMPILE)pkg-config,#PKG_CONFIG,=
' ${S}/tools/perf/Makefile.perf
     fi
     if [ -e "${S}/tools/lib/api/Makefile" ]; then
         sed -i 's,CC =3D $(CROSS_COMPILE)gcc,#CC,' ${S}/tools/lib/api/Ma=
kefile
--=20
2.43.0


