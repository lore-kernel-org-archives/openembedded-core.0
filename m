Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id E4B2C6B40A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2013 09:01:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r7891vA0014409
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Aug 2013 05:01:58 -0400 (EDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Thu, 8 Aug 2013 02:01:56 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 8 Aug 2013 17:01:52 +0800
Message-ID: <9facc9593dc27237a07ebd620b9d7c9d9541f20a.1375952210.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1375952210.git.hongxu.jia@windriver.com>
References: <cover.1375952210.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] libdbm-sqlite-perl: add version 1.40
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Aug 2013 09:01:59 -0000
Content-Type: text/plain

DBD::SQLite is a Perl DBI driver for SQLite, that includes the entire
thing in the distribution. So in order to get a fast transaction capable
RDBMS working for your perl project you simply have to install this
module, and nothing else.

There is a perl script for test, while variable PERL_DBM_TEST is assigned
the value '1', the script will be added, and you could run the script to
test whether DBD::SQLite is working properly.

[YOCTO #4128]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../perl/files/sqlite-perl-test.pl                 | 69 ++++++++++++++++++++++
 .../perl/libdbm-sqlite-perl_1.40.bb                | 40 +++++++++++++
 2 files changed, 109 insertions(+)
 create mode 100755 meta/recipes-extended/perl/files/sqlite-perl-test.pl
 create mode 100644 meta/recipes-extended/perl/libdbm-sqlite-perl_1.40.bb

diff --git a/meta/recipes-extended/perl/files/sqlite-perl-test.pl b/meta/recipes-extended/perl/files/sqlite-perl-test.pl
new file mode 100755
index 0000000..40f5916
--- /dev/null
+++ b/meta/recipes-extended/perl/files/sqlite-perl-test.pl
@@ -0,0 +1,69 @@
+#! /usr/bin/env perl
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program; if not, write to the Free Software Foundation.
+#
+# Copyright (C) 2013 Wind River Systems, Inc.
+#
+# - It tests DBI and DBD::SQLite could work correctly which means one could
+#   manipulate sqlite database in perl
+# - The test includes create/insert/update/delete/select, the five important
+#   things one can do with a table
+use DBI;
+
+sub execute_sql {
+    my $dbh = $_[0];
+    my $sql = $_[1];
+    my $sth = $dbh->prepare($sql)
+        or die "Couldn't prepare statement: " . $dbh->errstr;
+    $sth->execute();
+    print "$sql\n";
+    return $sth;
+}
+
+sub select_all {
+    my $dbh = $_[0];
+    my $table = $_[1];
+    my $sth = &execute_sql($dbh, "Select * from $table");
+
+    print "-----------------------------------\n";
+    while (@data = $sth->fetchrow_array()) {
+        my $name = $data[0];
+        my $id = $data[1];
+        print "$name: $id\n";
+    }
+    print "\n";
+
+    $sth->finish;
+    return $sth;
+}
+
+# A private, temporary in-memory database is created for the connection.
+# This in-memory database will vanish when the database connection is
+# closed. It is handy for your library tests.
+my $dbfile = ":memory:";
+my $dbh = DBI->connect("DBI:SQLite:dbname=$dbfile","","")
+        or die "Couldn't connect to database: " . DBI->errstr;
+print "Connect to SQLite's in-memory database\n";
+
+&execute_sql($dbh, "Create table tbl1(name varchar(10), id smallint)");
+&execute_sql($dbh, "Insert into tbl1 values('yocto',10)");
+&execute_sql($dbh, "Insert into tbl1 values('windriver', 20)");
+&select_all($dbh, "tbl1");
+
+&execute_sql($dbh, "Update tbl1 set name = 'oe-core' where id = 10");
+&execute_sql($dbh, "Delete from tbl1 where id = 20");
+&select_all($dbh, "tbl1");
+
+$dbh->disconnect;
+print "Test Success\n"
diff --git a/meta/recipes-extended/perl/libdbm-sqlite-perl_1.40.bb b/meta/recipes-extended/perl/libdbm-sqlite-perl_1.40.bb
new file mode 100644
index 0000000..f3a05d2
--- /dev/null
+++ b/meta/recipes-extended/perl/libdbm-sqlite-perl_1.40.bb
@@ -0,0 +1,40 @@
+SUMMARY = "A Perl DBI driver for SQLite"
+DESCRIPTION = "DBD::SQLite is a Perl DBI driver for SQLite, that includes the entire \
+thing in the distribution. So in order to get a fast transaction capable \
+RDBMS working for your perl project you simply have to install this \
+module, and nothing else. \
+"
+HOMEPAGE = "http://search.cpan.org/~ishigaki/DBD-SQLite/"
+
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+DEPENDS += "libdbi-perl-native"
+RDEPENDS_${PN} += "libdbi-perl \
+                   sqlite3 \
+                   perl-module-constant \
+                   perl-module-locale \
+                   perl-module-tie-hash \
+"
+PR = "r0"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1726e2117494ba3e13e1c3d93f795360"
+
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/I/IS/ISHIGAKI/DBD-SQLite-${PV}.tar.gz \
+           file://sqlite-perl-test.pl \
+"
+
+SRC_URI[md5sum] = "b9876882186499583428b14cf5c0e29c"
+SRC_URI[sha256sum] = "21fb65e740b6265512c82232b4ad8f75c19ac84c216830112656274eb8e375fb"
+
+S = "${WORKDIR}/DBD-SQLite-${PV}"
+
+inherit cpan
+
+BBCLASSEXTEND = "native"
+
+do_install_append() {
+    if [ ${PERL_DBM_TEST} = "1" ]; then
+        install -m 755 -D ${WORKDIR}/sqlite-perl-test.pl ${D}/${bindir}/sqlite-perl-test.pl
+    fi
+}
+
-- 
1.8.1.2


