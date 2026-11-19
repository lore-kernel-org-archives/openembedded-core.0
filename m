Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16543.1795100352517849330
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 06:59:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=o9xhb1+P;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0849B1575
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 06:59:09 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8A7093F673
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 06:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795100351; bh=Sm9mzKj65Mmwx91fAgeodm4KZgbUGKFlScNeaiE5zRM=;
	h=From:To:Subject:Date:From;
	b=o9xhb1+P+JfkJ/VJok7XbPUsu9s0Ks02IpJYtKKaVcO4swr9svYoriXW8BaAMOSgA
	 sMndeiDh1WiD/IiB6q7M0ZODN/WARCYMyzzkM1Ci14esk1PfBQTjUPpDrGxhh4q9lh
	 m97EV5vJ5RV2nJTUIrFx9Wsv2nYsf4scQBxzoySM=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3-sphinx: remove obsolete __pycache__ deletion
Date: Thu, 19 Nov 2026 14:59:07 +0000
Message-ID: <20261119145907.3851749-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 14:59:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250682
Content-Type: text/plain; charset="utf-8"

The pyc files are reproducible since Python 3.11[1], so this workaround
is no longer needed.

[1] cpython 33d95c6facd ("bpo-37596: Make `set` and `frozenset`
    marshalling deterministic (GH-27926)")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-sphinx_9.2.0.bb | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-sphinx_9.2.0.bb b/meta/=
recipes-devtools/python/python3-sphinx_9.2.0.bb
index fde0777022d..91240e52cb0 100644
--- a/meta/recipes-devtools/python/python3-sphinx_9.2.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinx_9.2.0.bb
@@ -10,11 +10,6 @@ SRC_URI +=3D "file://0001-Revert-singlehtml-deprecate-=
the-fix_refuris-helper-f.pat
=20
 inherit python_flit_core pypi
=20
-do_install:append () {
-	# The cache format of "{None, 'en', 'ja'}" doesn't seem to be consisten=
t (dict ordering?)
-	rm -f ${D}${libdir}/${PYTHON_DIR}/site-packages/sphinx/writers/__pycach=
e__/*latex*
-}
-
 RDEPENDS:${PN} =3D "\
     python3-alabaster \
     python3-babel \
--=20
2.43.0

