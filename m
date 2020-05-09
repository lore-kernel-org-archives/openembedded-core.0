Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.5954.1589007748988515559
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 May 2020 00:02:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 04971qiu030654
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Sat, 9 May 2020 00:02:03 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Sat, 9 May 2020 00:01:42 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <alex.kanavin@gmail.com>
Subject: [PATCH 2/2] rpm: fix file conflicts for MIPS64 N32
Date: Sat, 9 May 2020 15:01:21 +0800
Message-ID: <20200509070121.57173-3-changqing.li@windriver.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200509070121.57173-1-changqing.li@windriver.com>
References: <20200509070121.57173-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

The following error occurred when prefer_color set to 2:
Error: Transaction check error:
  file /sbin/ldconfig conflicts between attempted installs of
ldconfig-2.31+git0+71f2b249a2-r0.mips64_n32 and
lib32-ldconfig-2.31+git0+71f2b249a2-r0.mips32r2
  file /usr/bin/gencat conflicts between attempted installs of
lib32-libc6-utils-2.31+git0+71f2b249a2-r0.mips32r2
...

This was because:
transactions_color = 001 (ELF32) & 010 (ELF64) & 100 (ELF32 N32 MIPS64)
FColor = Current file color (001) & transaction_color (111)
oFcolor = Previous file color (100) & transaction_color (111)

when "neither preferred" happened, handled as conflicts. this is too
restrictive for three way conflicts(mips64/mips64 n32/mips(32)).
Fixed by  perform a 'last-in-wins' resolution when "neither is
preferred".

refer:
https://github.com/rpm-software-management/rpm/issues/193
https://git.openembedded.org/openembedded-core/commit/meta/recipes-devtools/rpm?id=36c225704daa58b98a4b7f2ef315eb944d8628b5

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ....c-fix-file-conflicts-for-MIPS64-N32.patch | 61 +++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_4.15.1.bb       |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N32.patch

diff --git a/meta/recipes-devtools/rpm/files/0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N32.patch b/meta/recipes-devtools/rpm/files/0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N32.patch
new file mode 100644
index 0000000000..c356086998
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N32.patch
@@ -0,0 +1,61 @@
+From 301af100ecda948115dcc47b7e2d09565901b291 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Sat, 9 May 2020 06:18:13 +0000
+Subject: [PATCH] lib/transaction.c: fix file conflicts for MIPS64 N32
+
+This patch is from:
+https://github.com/rpm-software-management/rpm/issues/193
+
+Error: Transaction check error:
+  file /sbin/ldconfig conflicts between attempted installs of
+ldconfig-2.31+git0+71f2b249a2-r0.mips64_n32 and
+lib32-ldconfig-2.31+git0+71f2b249a2-r0.mips32r2
+...
+
+This was because:
+transactions_color = 001 (ELF32) & 010 (ELF64) & 100 (ELF32 N32 MIPS64)
+FColor = Current file color (001) & transaction_color (111)
+oFcolor = Previous file color (100) & transaction_color (111)
+
+In handleColorConflict, it only deal with conditons "new preferred" or
+"old preferred". But not deal with the situation where neither is the
+preferred type. so for tri-lib system, like mips64/mips64 n32/mips(32),
+"Transaction check error" occurred.
+
+Fixed by performing a 'last-in-wins' resolution when "neither is
+preferred".
+
+Upstream-Status: Pending
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ lib/transaction.c | 13 ++++++++++++-
+ 1 file changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/lib/transaction.c b/lib/transaction.c
+index e51cff25a..ca7944a43 100644
+--- a/lib/transaction.c
++++ b/lib/transaction.c
+@@ -389,7 +389,18 @@ static int handleColorConflict(rpmts ts,
+ 		    rpmfsSetAction(ofs, ofx, FA_CREATE);
+ 		rpmfsSetAction(fs, fx, FA_SKIPCOLOR);
+ 		rConflicts = 0;
+-	    }
++            } else {
++                /*
++                 * If neither is already skipped, we skip the old one, and
++                 * install the new one (last in wins).
++                 */
++                if (ofs && !XFA_SKIPPING(rpmfsGetAction(ofs, ofx)) &&
++                    fs && !XFA_SKIPPING(rpmfsGetAction(fs, fx))) {
++                    rpmfsSetAction(ofs, ofx, FA_SKIPCOLOR);
++                    rpmfsSetAction(fs, fx, FA_CREATE);
++                }
++                rConflicts = 0;
++            }
+ 	}
+     }
+ 
+-- 
+2.24.1
+
diff --git a/meta/recipes-devtools/rpm/rpm_4.15.1.bb b/meta/recipes-devtools/rpm/rpm_4.15.1.bb
index 5c1190a3df..8add142461 100644
--- a/meta/recipes-devtools/rpm/rpm_4.15.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.15.1.bb
@@ -39,6 +39,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.15.x \
            file://0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch \
            file://0001-rpmplugins.c-call-dlerror-prior-to-dlsym.patch \
            file://0001-rpmfc.c-do-not-run-file-classification-in-parallel.patch \
+           file://0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N32.patch \
            "
 
 PE = "1"
-- 
2.24.1

