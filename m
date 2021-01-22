Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.8313.1611319933509232664
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jan 2021 04:52:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C4FF11B3
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Jan 2021 04:52:12 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2768B3F66E
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Jan 2021 04:52:12 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] lib/oe/package_manager: ensure repodata is wiped
Date: Fri, 22 Jan 2021 12:52:05 +0000
Message-Id: <20210122125207.4049388-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

When building package indexes for RPM feeds, delete repodata first to
be absolutely sure that the indexes are up to date.

We've seen some mysterious failures where the repodata doesn't match
the repository, so hopefully this will stop that happening.

[ YOCTO #14190 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oe/package_manager/rpm/__init__.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oe/package_manager/rpm/__init__.py b/meta/lib/oe/pa=
ckage_manager/rpm/__init__.py
index 898184442f..6df0092281 100644
--- a/meta/lib/oe/package_manager/rpm/__init__.py
+++ b/meta/lib/oe/package_manager/rpm/__init__.py
@@ -33,6 +33,9 @@ class RpmIndexer(Indexer):
 class RpmSubdirIndexer(RpmIndexer):
     def write_index(self):
         bb.note("Generating package index for %s" %(self.deploy_dir))
+        # Remove the existing repodata to ensure that we re-generate it =
no matter what
+        bb.utils.remove(os.path.join(self.deploy_dir, "repodata"), recur=
se=3DTrue)
+
         self.do_write_index(self.deploy_dir)
         for entry in os.walk(self.deploy_dir):
             if os.path.samefile(self.deploy_dir, entry[0]):
--=20
2.25.1

