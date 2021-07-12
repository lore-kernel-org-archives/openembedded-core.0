Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.11196.1626097927603321342
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jul 2021 06:52:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30A9631B
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 06:52:07 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CFAEE3F7D8
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 06:52:06 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 8/9] tcl: clock.test needs a timezone to be set
Date: Mon, 12 Jul 2021 14:51:58 +0100
Message-Id: <20210712135159.2131269-8-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210712135159.2131269-1-ross.burton@arm.com>
References: <20210712135159.2131269-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/tcltk/tcl/run-ptest | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/tcltk/tcl/run-ptest b/meta/recipes-dev=
tools/tcltk/tcl/run-ptest
index 6d52f34a9f..2406e176ff 100644
--- a/meta/recipes-devtools/tcltk/tcl/run-ptest
+++ b/meta/recipes-devtools/tcltk/tcl/run-ptest
@@ -1,7 +1,11 @@
 #!/bin/sh
=20
+# clock.test needs a timezone to be set
+export TZ=3D"Europe/London"
+export TCL_LIRARY=3D./library
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

