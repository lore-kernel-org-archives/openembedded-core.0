Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.1366.1599771859798576533
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 14:04:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3FBB511B3
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 14:04:19 -0700 (PDT)
Received: from rossb-vm.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C9CFC3F73C
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 14:04:18 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] cve-update-db-native: use fetch task
Date: Thu, 10 Sep 2020 22:04:13 +0100
Message-Id: <20200910210413.926242-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200910210413.926242-1-ross.burton@arm.com>
References: <20200910210413.926242-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Instead of inventing a new task to fetch the CVE data, use the existing
fetch task.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/cve-check.bbclass                 | 2 +-
 meta/recipes-core/meta/cve-update-db-native.bb | 9 +++++----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbcl=
ass
index 17f64a8a9c..02fef7c205 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -97,7 +97,7 @@ python do_cve_check () {
 }
=20
 addtask cve_check before do_build after do_fetch
-do_cve_check[depends] =3D "cve-update-db-native:do_populate_cve_db"
+do_cve_check[depends] =3D "cve-update-db-native:do_fetch"
 do_cve_check[nostamp] =3D "1"
=20
 python cve_check_cleanup () {
diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipe=
s-core/meta/cve-update-db-native.bb
index 27b4c58d4e..e4e2451bfd 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -24,7 +24,7 @@ python () {
             os.remove(cve_check_db_file)
 }
=20
-python do_populate_cve_db() {
+python do_fetch() {
     """
     Update NVD database with json data feed
     """
@@ -114,7 +114,9 @@ python do_populate_cve_db() {
         conn.close()
 }
=20
-do_populate_cve_db[lockfiles] +=3D "${CVE_CHECK_DB_FILE_LOCK}"
+do_fetch[lockfiles] +=3D "${CVE_CHECK_DB_FILE_LOCK}"
+do_fetch[file-checksums] =3D ""
+do_fetch[vardeps] =3D ""
=20
 def initialize_db(c):
     c.execute("CREATE TABLE IF NOT EXISTS META (YEAR INTEGER UNIQUE, DAT=
E TEXT)")
@@ -206,7 +208,6 @@ def update_db(c, jsondata):
             parse_node_and_insert(c, config, cveId)
=20
=20
-addtask do_populate_cve_db before do_fetch
-do_populate_cve_db[nostamp] =3D "1"
+do_fetch[nostamp] =3D "1"
=20
 EXCLUDE_FROM_WORLD =3D "1"
--=20
2.28.0

