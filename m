Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3376.1794863080175293237
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 13:04:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=H8T5zMiA;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C58B1682
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 13:04:36 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2CE493F632
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 13:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794863079; bh=phBWrRb4shTpT1ldKqxXIUAbGnMd15VmdbiYI2ZQxHw=;
	h=From:To:Subject:Date:From;
	b=H8T5zMiAGG50FxztckvVaT/+aYoFGhQyHJhIfbf3xyrgoslGcrQ+vAsofagEPz7jN
	 aQCMPW31MRlH0hQfgDrCP9l+y34mnLhn/VWlpOkO2ARZqwMdaBNnD2UjVxfSF/6axH
	 a5SNPXqhrWefzwH3qpbld/czDvN9QYSJFstPQO58=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] python3: don't copy from UNPACKDIR to WORKDIR
Date: Mon, 16 Nov 2026 21:04:31 +0000
Message-ID: <20261116210435.4161338-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 21:04:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250376
Content-Type: text/plain; charset="utf-8"

There's no need to copy files from UNPACKDIR to WORKDIR, we can just do
the work in UNPACKDIR.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3_3.14.10.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.14.10.bb b/meta/recip=
es-devtools/python/python3_3.14.10.bb
index c50c4d4babc..765f93ddc66 100644
--- a/meta/recipes-devtools/python/python3_3.14.10.bb
+++ b/meta/recipes-devtools/python/python3_3.14.10.bb
@@ -498,11 +498,8 @@ do_create_manifest() {
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

