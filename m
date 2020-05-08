Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.3659.1588905070213633207
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2020 19:31:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 0482UmsL002497
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 7 May 2020 19:30:58 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Thu, 7 May 2020 19:30:37 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] rpm: fix file conflicts for MIPS64 N32
Date: Fri, 8 May 2020 10:30:32 +0800
Message-ID: <1588905032-44016-3-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588905032-44016-1-git-send-email-changqing.li@windriver.com>
References: <1588905032-44016-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
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
Fixed by  perform a 'last-in-wins' resolution when "neither is preferred".

refer:
https://github.com/rpm-software-management/rpm/issues/193
https://git.openembedded.org/openembedded-core/commit/meta/recipes-devtools/rpm?id=36c225704daa58b98a4b7f2ef315eb944d8628b5

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...ction.c-fix-file-conflicts-for-MIPS64-N32.patch | 58 ++++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_4.14.2.1.bb          |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N32.patch

diff --git a/meta/recipes-devtools/rpm/files/0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N32.patch b/meta/recipes-devtools/rpm/files/0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N32.patch
new file mode 100644
index 0000000..b515075
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N32.patch
@@ -0,0 +1,58 @@
+From 1ed066fc6fa7d7afffe3545c4e3ea937529e6c49 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 7 May 2020 17:40:58 +0800
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
+Fixed by performing a 'last-in-wins' resolution when "neither is preferred".
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ lib/transaction.c | 13 ++++++++++++-
+ 1 file changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/lib/transaction.c b/lib/transaction.c
+index 67b9db5..82386b8 100644
+--- a/lib/transaction.c
++++ b/lib/transaction.c
+@@ -391,7 +391,18 @@ static int handleColorConflict(rpmts ts,
+ 		    rpmfsSetAction(ofs, ofx, FA_CREATE);
+ 		rpmfsSetAction(fs, fx, FA_SKIPCOLOR);
+ 		rConflicts = 0;
+-	    }
++	    }else {
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
+2.7.4
+
diff --git a/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb b/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
index 17255dc..3e2c6d1 100644
--- a/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
@@ -44,6 +44,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.14.x \
            file://0001-mono-find-provides-requires-do-not-use-monodis-from-.patch \
            file://0001-Rip-out-partial-support-for-unused-MD2-and-RIPEMD160.patch \
            file://0001-rpmplugins.c-call-dlerror-prior-to-dlsym.patch \
+           file://0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N32.patch \
            "
 
 PE = "1"
-- 
2.7.4

