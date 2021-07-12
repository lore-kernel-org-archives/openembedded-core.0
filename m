Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.13542.1626107278773572572
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jul 2021 09:27:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D0561FB
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 09:27:57 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 14C593F774
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 09:27:56 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 8/9] tcl: clock.test needs a timezone to be set
Date: Mon, 12 Jul 2021 17:27:44 +0100
Message-Id: <20210712162745.1302840-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/tcltk/tcl/run-ptest | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/tcltk/tcl/run-ptest b/meta/recipes-dev=
tools/tcltk/tcl/run-ptest
index 6d52f34a9f..a62b703082 100644
--- a/meta/recipes-devtools/tcltk/tcl/run-ptest
+++ b/meta/recipes-devtools/tcltk/tcl/run-ptest
@@ -1,7 +1,11 @@
 #!/bin/sh
=20
+# clock.test needs a timezone to be set
+export TZ=3D"Europe/London"
+export TCL_LIBRARY=3Dlibrary
+
 for i in `ls tests/*.test | awk -F/ '{print $2}'`; do
-    TCL_LIBRARY=3Dlibrary ./tcltest tests/all.tcl -file $i >$i.log 2>&1
+    ./tcltest tests/all.tcl -file $i >$i.log 2>&1
     grep -q -F -e "Files with failing tests:" -e "Test files exiting wit=
h errors:" $i.log
     if [ $? -eq 0 ]; then
         echo "FAIL: $i"
--=20
2.25.1

