Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62D2DCD6E7C
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 15:15:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10565.1780672516301345316
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2026 08:15:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=aZaJLHa5;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E7D8432F4
	for <openembedded-core@lists.openembedded.org>; Fri,  5 Jun 2026 08:15:10 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 624243F86F
	for <openembedded-core@lists.openembedded.org>; Fri,  5 Jun 2026 08:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780672515; bh=rjtTSGJeooyEdFi5PkoF+rN2aJ251uf9f7hv8VOE9wc=;
	h=From:To:Subject:Date:From;
	b=aZaJLHa5JGhvSZuYEipn8kynjBDTNCPEUSQ5AY6jFMlPlafjpKUhSBbVRvurfeC0A
	 /sb5ARgtXeHBhmLERE2JXhimWP7vRFxUMBfBGlM7v1xqHODb3L5MbwVrHFfRyRXzN8
	 Nke1YNHCoPcsHyemB4MAuREo9RNmqEP9WI0Dzr4A=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] libedit: upgrade 20251016 -> 20260512
Date: Fri,  5 Jun 2026 16:15:08 +0100
Message-ID: <20260605151511.3522627-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 15:15:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238173

Drop the __STDC_ISO_10646__ patch as this is no longer needed: the build
would #error out if it wasn't defined.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../libedit/libedit/stdc-predef.patch         | 26 -------------------
 ...0251016-3.1.bb =3D> libedit_20260512-3.1.bb} |  6 ++---
 2 files changed, 2 insertions(+), 30 deletions(-)
 delete mode 100644 meta/recipes-devtools/libedit/libedit/stdc-predef.pat=
ch
 rename meta/recipes-devtools/libedit/{libedit_20251016-3.1.bb =3D> libed=
it_20260512-3.1.bb} (72%)

diff --git a/meta/recipes-devtools/libedit/libedit/stdc-predef.patch b/me=
ta/recipes-devtools/libedit/libedit/stdc-predef.patch
deleted file mode 100644
index 0ce6d127a94..00000000000
--- a/meta/recipes-devtools/libedit/libedit/stdc-predef.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 32918b3a91d9fe4719bba78a44ec3262a2994e68 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 31 Jul 2019 10:48:19 -0700
-Subject: [PATCH] libedit: Move from meta-oe
-
-__STDC_ISO_10646__ is defined in stdc-predef.h
-therefore include it to see if its there on a platform
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/chartype.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/chartype.h b/src/chartype.h
-index bcdb293..92327d3 100644
---- a/src/chartype.h
-+++ b/src/chartype.h
-@@ -29,6 +29,7 @@
- #ifndef _h_chartype_f
- #define _h_chartype_f
-=20
-+#include <stdc-predef.h>
- /* Ideally we should also test the value of the define to see if it
-  * supports non-BMP code points without requiring UTF-16, but nothing
-  * seems to actually advertise this properly, despite Unicode 3.1 havin=
g
diff --git a/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb b/meta=
/recipes-devtools/libedit/libedit_20260512-3.1.bb
similarity index 72%
rename from meta/recipes-devtools/libedit/libedit_20251016-3.1.bb
rename to meta/recipes-devtools/libedit/libedit_20260512-3.1.bb
index 2ea75bba878..897bfbd6f62 100644
--- a/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb
+++ b/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb
@@ -10,10 +10,8 @@ DEPENDS =3D "ncurses"
=20
 inherit autotools
=20
-SRC_URI =3D "http://www.thrysoee.dk/editline/${BP}.tar.gz \
-           file://stdc-predef.patch \
-          "
-SRC_URI[sha256sum] =3D "21362b00653bbfc1c71f71a7578da66b5b5203559d43134d=
2dd7719e313ce041"
+SRC_URI =3D "http://www.thrysoee.dk/editline/${BP}.tar.gz"
+SRC_URI[sha256sum] =3D "432d5e7ea8b0116dd39f2eca7bc11d0eed77faa6b77ea526=
ace89907c23ea4a0"
=20
 # configure hardcodes /usr/bin search path bypassing HOSTTOOLS
 CACHED_CONFIGUREVARS +=3D "ac_cv_path_NROFF=3D/bin/false"
--=20
2.43.0


