Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10406.1794406653002459750
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 06:17:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=IEY6AUmp;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D06D16F8
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 06:17:29 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 30D433F632
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 06:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794406652; bh=RTJMkmm4ggxtsLqcQgDNqYgOWS3QiuBEFkFGlqRJn3I=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=IEY6AUmp8jKPnzQIFdw4+6cFUKe48kEZyeOWwKuPUDKBvCyKyLJnqIfaAc5oQ2uP6
	 Nn0hNC5bfAFm4CaJPo+ywnCgMF3m6BVnJ5jR+yEg21lCSKNIHJRrShSVcajJW9+pDV
	 N0NC/Ncin3rhaIjGrIpz4K/1inZ5loQu4iA1/sLM=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 3/6] python3: don't copy from UNPACKDIR to WORKDIR
Date: Wed, 11 Nov 2026 14:17:23 +0000
Message-ID: <20261111141726.1496785-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111141726.1496785-1-ross.burton@arm.com>
References: <20261111141726.1496785-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 14:17:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250032
Content-Type: text/plain; charset="utf-8"

There's no need to copy files from UNPACKDIR to WORKDIR, we can just do
the work in UNPACKDIR.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3_3.14.10.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.14.10.bb b/meta/recip=
es-devtools/python/python3_3.14.10.bb
index c57868bf709..574b8e31d41 100644
--- a/meta/recipes-devtools/python/python3_3.14.10.bb
+++ b/meta/recipes-devtools/python/python3_3.14.10.bb
@@ -475,11 +475,8 @@ do_create_manifest() {
     # e.g. BerkeleyDB is an optional build dependency so it may or may n=
ot
     # be present, we must ensure it is.
=20
-    cp ${UNPACKDIR}/create_manifest3.py ${WORKDIR}
-    cp ${UNPACKDIR}/python3-manifest.json ${WORKDIR}
-    cp ${UNPACKDIR}/get_module_deps3.py ${WORKDIR}
-    cd ${WORKDIR}
     # This needs to be executed by python-native and NOT by HOST's pytho=
n
+    cd ${UNPACKDIR}
     nativepython3 create_manifest3.py ${PYTHON_MAJMIN}
     cp python3-manifest.json.new ${THISDIR}/python3/python3-manifest.jso=
n
 }
--=20
2.43.0

