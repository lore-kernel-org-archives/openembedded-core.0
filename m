Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.1353.1599771859484088222
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 14:04:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A54D7113E
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 14:04:18 -0700 (PDT)
Received: from rossb-vm.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 346A03F73C
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 14:04:18 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] cve-update-db-native: add more logging when fetching
Date: Thu, 10 Sep 2020 22:04:12 +0100
Message-Id: <20200910210413.926242-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200910210413.926242-1-ross.burton@arm.com>
References: <20200910210413.926242-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add some debug logging when fetching the CVE data.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipe=
s-core/meta/cve-update-db-native.bb
index 94367f9a94..27b4c58d4e 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -46,6 +46,7 @@ python do_populate_cve_db() {
     try:
         import time
         if time.time() - os.path.getmtime(db_file) < (60*60):
+            bb.debug(2, "Recently updated, skipping")
             return
     except OSError:
         pass
@@ -61,6 +62,7 @@ python do_populate_cve_db() {
     with bb.progress.ProgressHandler(d) as ph, open(os.path.join(d.getVa=
r("TMPDIR"), 'cve_check'), 'a') as cve_f:
         total_years =3D date.today().year + 1 - YEAR_START
         for i, year in enumerate(range(YEAR_START, date.today().year + 1=
)):
+            bb.debug(2, "Updating %d" % year)
             ph.update((float(i + 1) / total_years) * 100)
             year_url =3D BASE_URL + str(year)
             meta_url =3D year_url + ".meta"
@@ -88,6 +90,7 @@ python do_populate_cve_db() {
             c.execute("select DATE from META where YEAR =3D ?", (year,))
             meta =3D c.fetchone()
             if not meta or meta[0] !=3D last_modified:
+                bb.debug(2, "Updating entries")
                 # Clear products table entries corresponding to current =
year
                 c.execute("delete from PRODUCTS where ID like ?", ('CVE-=
%d%%' % year,))
=20
@@ -101,7 +104,8 @@ python do_populate_cve_db() {
                     cve_f.write('Warning: CVE db update error, CVE data =
is outdated.\n\n')
                     bb.warn("Cannot parse CVE data (%s), update failed" =
% e.reason)
                     return
-
+            else:
+                bb.debug(2, "Already up to date (last modified %s)" % la=
st_modified)
             # Update success, set the date to cve_check file.
             if year =3D=3D date.today().year:
                 cve_f.write('CVE database update : %s\n\n' % date.today(=
))
--=20
2.28.0

