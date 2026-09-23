Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 166FCC9830B
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 14:40:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8615.1790174449263919412
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 07:40:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=TGW16Lru;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 456981476
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 07:40:45 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 701BE3F86C
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 07:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790174448; bh=ePG9y+wlUuB7dSwEMT7+4OW0TfGSG/MODeb/VgSU0zE=;
	h=From:To:Subject:Date:From;
	b=TGW16LruYB3Meot5Olk42Y9p85PWacT7kNuJtjYLIROxn89Cbq2mPI8h7ExTgLeaF
	 wlYOqyaXI8dO2zbKg8fPXarynCjFvPyiz+AgQe9TJ8yvTQ/IZuZEjUyby0qHwogFIN
	 9+cRZQlJs4pPLcxMQ9YHyu+oW1+TPdtu8b5h3dEI=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] classes/gnomebase: improve gnome_verdir() logic
Date: Wed, 23 Sep 2026 15:40:44 +0100
Message-ID: <20260923144044.312117-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 14:40:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246526

libsecret released 0.21.8.2, which broke our gnome_verdir() logic used
to construct a SRC_URI.

Rewrite the logic, using the code that the GNOME servers use to generate
these URLs in the first place. This looks at the major version, if it's
above 40 then just the major version is used, otherwise the first two
components are used.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/gnomebase.bbclass | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/gnomebase.bbclass b/meta/classes-recipe/=
gnomebase.bbclass
index 57933dda71a..69f1e37e082 100644
--- a/meta/classes-recipe/gnomebase.bbclass
+++ b/meta/classes-recipe/gnomebase.bbclass
@@ -5,7 +5,16 @@
 #
=20
 def gnome_verdir(v):
-    return ".".join(v.split(".")[:-1]) or v
+    # Upstream treats a major of 40+ as a flag day to switch between maj=
or.minor
+    # versioned directories, or just major.
+    # See get_majmin() in
+    # https://gitlab.gnome.org/Infrastructure/openshift-images/gnome-rel=
ease-service/-/blob/main/gnome_release_service/gnome_release_system/utils=
.py
+    parts =3D v.split(".")
+    major =3D int(parts[0])
+    if major >=3D 40:
+        return major
+    else:
+        return ".".join(parts[:2])
=20
=20
 GNOME_COMPRESS_TYPE ?=3D "xz"
--=20
2.43.0


