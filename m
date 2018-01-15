Return-Path: <mcrowe@brightsign.biz>
Received: from relay.appriver.com (relay101a.appriver.com [207.97.230.14])
	by mail.openembedded.org (Postfix) with ESMTP id 37EB671D79
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jan 2018 17:15:20 +0000 (UTC)
X-Note: This Email was scanned by AppRiver SecureTide
X-Note-AR-ScanTimeLocal: 01/15/2018 12:12:17 PM
X-Note: SecureTide Build: 12/19/2017 1:37:44 PM UTC (2.6.27.2)
X-Note: Filtered by 10.238.11.161
X-Note-AR-Scan: None - PIPE
Received: by relay.appriver.com (CommuniGate Pro PIPE 6.1.7)
	with PIPE id 280406398; Mon, 15 Jan 2018 12:12:17 -0500
Received: from [213.210.30.29] (HELO elite.brightsign)
	by relay.appriver.com (CommuniGate Pro SMTP 6.1.7)
	with ESMTPS id 280406320; Mon, 15 Jan 2018 12:12:12 -0500
Received: from chuckie.brightsign ([fd44:d8b8:cab5:cb01::19] helo=chuckie)
	by elite.brightsign with esmtp (Exim 4.89)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1eb8Ls-000Ft0-Lm; Mon, 15 Jan 2018 17:15:16 +0000
Received: from mac by chuckie with local (Exim 4.89)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1eb8Ls-0001s2-Ky; Mon, 15 Jan 2018 17:15:16 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Jan 2018 17:15:11 +0000
Message-Id: <20180115171511.7139-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.11.0
X-Note: This Email was scanned by AppRiver SecureTide
X-Note-AR-ScanTimeLocal: 01/15/2018 12:12:12 PM
X-Note: SecureTide Build: 12/19/2017 1:37:44 PM UTC (2.6.27.2)
X-Note: Filtered by 10.238.11.161
X-Policy: brightsign.biz
X-Primary: brightsign.biz@brightsign.biz
X-Virus-Scan: V-
X-Note: ICH-CT/SI:0-0/SG:1 1/1/0001 12:00:00 AM
X-Note-SnifferID: 0
X-Note: TCH-CT/SI:0-59/SG:1 1/15/2018 12:11:34 PM
X-GBUdb-Analysis: 0, 213.210.30.29, Ugly c=0.518388 p=-0.960784 Source Normal
X-Signature-Violations: 0-0-0-6736-c
X-Note: Spam Tests Failed: 
X-Country-Path: ->->United Kingdom->United States
X-Note-Sending-IP: 213.210.30.29
X-Note-Reverse-DNS: elite.brightsigndigital.co.uk
X-Note-Return-Path: mcrowe@brightsign.biz
X-Note: User Rule Hits: 
X-Note: Global Rule Hits: G298 G299 G300 G301 G305 G306 G438 
X-Note: Encrypt Rule Hits: 
X-Note: Mail Class: VALID
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCHv2] rpm: backport configure fix for multiple users/groups with ID 0
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
X-List-Received-Date: Mon, 15 Jan 2018 17:15:21 -0000

Backport upstream configure fix for hosts that have multiple users with UID
0 or groups with GID 0.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 ...ure-cope-with-multiple-users-groups-with-.patch | 43 ++++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_4.14.0.bb            |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/0001-Make-configure-cope-with-multiple-users-groups-with-.patch

diff --git a/meta/recipes-devtools/rpm/files/0001-Make-configure-cope-with-multiple-users-groups-with-.patch b/meta/recipes-devtools/rpm/files/0001-Make-configure-cope-with-multiple-users-groups-with-.patch
new file mode 100644
index 0000000000..31024bd7e8
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-Make-configure-cope-with-multiple-users-groups-with-.patch
@@ -0,0 +1,43 @@
+Upstream-Status: Backport [https://github.com/rpm-software-management/rpm/commit/a3652af66fa2a1f272d771323fee019f23d350f5]
+
+From 68a7b60f89419e53a4bd3c412f816f0576ffd8c4 Mon Sep 17 00:00:00 2001
+From: Mike Crowe <mac@mcrowe.com>
+Date: Thu, 4 Jan 2018 14:39:51 +0000
+Subject: [PATCH] Make configure cope with multiple users/groups with ID 0
+
+If /etc/passwd contains multiple users with UID 0 then user_with_uid0 will
+contain a line feed which results in config.h containing:
+
+ #define UID_0_USER "root
+
+(i.e. without a closing quote.)
+
+The same problem occurs with /etc/group.
+
+Let's only emit the first match in each case so that there is only ever a
+single result.
+
+Signed-off-by: Mike Crowe <mac@mcrowe.com>
+
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index ab8ca4f54..5259ad243 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -996,8 +996,8 @@ if test "$with_dmalloc" = yes ; then
+   LIBS="$LIBS -ldmalloc"
+ fi
+ 
+-user_with_uid0=$(awk -F: '$3==0 {print $1}' /etc/passwd)
+-group_with_gid0=$(awk -F: '$3==0 {print $1}' /etc/group)
++user_with_uid0=$(awk -F: '$3==0 {print $1;exit}' /etc/passwd)
++group_with_gid0=$(awk -F: '$3==0 {print $1;exit}' /etc/group)
+ AC_DEFINE_UNQUOTED([UID_0_USER],["$user_with_uid0"],[Get the user name having userid 0])
+ AC_DEFINE_UNQUOTED([GID_0_GROUP],["$group_with_gid0"],[Get the group name having groupid 0])
+ 
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/rpm/rpm_4.14.0.bb b/meta/recipes-devtools/rpm/rpm_4.14.0.bb
index e4e9c3e634..aa2579e3bf 100644
--- a/meta/recipes-devtools/rpm/rpm_4.14.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.14.0.bb
@@ -40,6 +40,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.14.x \
            file://0003-rpmstrpool.c-make-operations-over-string-pools-threa.patch \
            file://0004-build-pack.c-remove-static-local-variables-from-buil.patch \
            file://0001-perl-disable-auto-reqs.patch \
+           file://0001-Make-configure-cope-with-multiple-users-groups-with-.patch \
            "
 
 PE = "1"
-- 
2.11.0



