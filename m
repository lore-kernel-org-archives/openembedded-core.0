Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4F5207D70B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2019 09:36:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x849a2Vd007106
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Sep 2019 02:36:02 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 4 Sep 2019 02:36:01 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 4 Sep 2019 05:35:53 -0400
Message-ID: <20190904093555.59494-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190904093555.59494-1-kai.kang@windriver.com>
References: <20190904093555.59494-1-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v2 1/3] cups: redefine CUPS_SERVERBIN
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
X-List-Received-Date: Wed, 04 Sep 2019 09:36:01 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Redefine CUPS_SERVERBIN to "$libexecdir/cups" for cups which solves file
confliction when multilib is enabled.

| Error: Transaction check error:
|   file /lib/systemd/system/org.cups.cups-lpd@.service conflicts between
    attempted installs of cups-2.2.11-r0.core2_64 and lib32-cups-2.2.11-r0.core2_32

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-extended/cups/cups.inc                  |  2 +-
 meta/recipes-extended/cups/cups/cups_serverbin.patch | 10 ++++++++--
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 46fb2dded3..e303f3424d 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -67,7 +67,7 @@ do_install () {
 
 	# Remove /var/run from package as cupsd will populate it on startup
 	rm -fr ${D}/${localstatedir}/run
-	rmdir ${D}/${libdir}/${BPN}/driver
+	rmdir ${D}/${libexecdir}/${BPN}/driver
 
 	# Fix the pam configuration file permissions
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'true', 'false', d)}; then
diff --git a/meta/recipes-extended/cups/cups/cups_serverbin.patch b/meta/recipes-extended/cups/cups/cups_serverbin.patch
index f7b44a7bc1..85c6af1071 100644
--- a/meta/recipes-extended/cups/cups/cups_serverbin.patch
+++ b/meta/recipes-extended/cups/cups/cups_serverbin.patch
@@ -4,6 +4,12 @@ e.g. ppc64 where base libdir is lib64 this does not go well
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Upstream-Status: Inappropriate [OE config specific]
 
+Update on 20190904:
+Redefine CUPS_SERVERBIN to "$libexecdir/cups" which solves file confliction
+when multilib is enabled.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
 Index: cups-1.4.6/config-scripts/cups-directories.m4
 ===================================================================
 --- cups-1.4.6.orig/config-scripts/cups-directories.m4	2009-04-12 16:04:51.000000000 -0700
@@ -13,7 +19,7 @@ Index: cups-1.4.6/config-scripts/cups-directories.m4
  		# All others
  		INSTALL_SYSV="install-sysv"
 -		CUPS_SERVERBIN="$exec_prefix/lib/cups"
-+		CUPS_SERVERBIN="$libdir/cups"
++		CUPS_SERVERBIN="$libexecdir/cups"
  		;;
  esac
  
@@ -26,7 +32,7 @@ Index: cups-1.4.6/configure
  		# All others
  		INSTALL_SYSV="install-sysv"
 -		CUPS_SERVERBIN="$exec_prefix/lib/cups"
-+		CUPS_SERVERBIN="$libdir/cups"
++		CUPS_SERVERBIN="$libexecdir/cups"
  		;;
  esac
  
-- 
2.20.0


