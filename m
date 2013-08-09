Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6C3EE6B5DD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2013 22:51:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r79MpT3S021049
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 9 Aug 2013 15:51:29 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Fri, 9 Aug 2013 15:51:28 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 9 Aug 2013 17:51:30 -0500
Message-ID: <1376088690-24013-3-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <1376088690-24013-1-git-send-email-mark.hatle@windriver.com>
References: <1376088690-24013-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 2/2] rpm: Enable compatibility with older RPM packages that have invalid platforms
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
X-List-Received-Date: Fri, 09 Aug 2013 22:51:28 -0000
Content-Type: text/plain

Some LSB packages appear to have the platform set to '%{_target_platform}'
which is not a valid platform field.  This causes a failure of the type:

warning: package lsb-test-core-4.1.15-1.x86_64 is intended for a %{_target_platform} platform

When we detect an invalid platform, fall back and try to construct a new
platform name that may be valid based on the arch and os contents of the
package.  (This should only ever be needed by invalid or older RPM packages.)

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../rpm/rpm/rpm-lsb-compatibility.patch            | 24 ++++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.9.bb             |  3 ++-
 2 files changed, 26 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-lsb-compatibility.patch

diff --git a/meta/recipes-devtools/rpm/rpm/rpm-lsb-compatibility.patch b/meta/recipes-devtools/rpm/rpm/rpm-lsb-compatibility.patch
new file mode 100644
index 0000000..7101e5c
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/rpm-lsb-compatibility.patch
@@ -0,0 +1,24 @@
+Enable platform tag matching workaround in OE.
+
+When installing some LSB packages the 'platform' field in the package
+appears to be invalid.  Instead of relying solely on the platform comparison
+we also want to generate a perceived platform based on the valid rpm contents
+of arch and os.
+
+Upstream-Status: Pending
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+Index: rpm-5.4.9/lib/depends.c
+===================================================================
+--- rpm-5.4.9.orig/lib/depends.c
++++ rpm-5.4.9/lib/depends.c
+@@ -594,7 +594,7 @@ int rpmtsAddInstallElement(rpmts ts, Hea
+ 	    platform = rpmExpand(arch, "-unknown-", os, NULL);
+ 
+ 	rc = rpmPlatformScore(platform, platpat, nplatpat);
+-#if defined(RPM_VENDOR_MANDRIVA)
++#if defined(RPM_VENDOR_MANDRIVA) || defined(RPM_VENDOR_OE)
+ 	/*
+ 	 * If no match on platform tag, we'll try again with arch tag
+ 	 * in case platform tag is inconsistent with it, which is the case
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
index 3f4854e..bd05336 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
@@ -86,7 +86,8 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.9-0.20120508.src.rpm;ex
 	   file://rpm-platform2.patch \
 	   file://rpm-remove-sykcparse-decl.patch \
 	   file://debugedit-segv.patch \
-     file://rpm-platform-file-fix.patch \
+	   file://rpm-platform-file-fix.patch \
+	   file://rpm-lsb-compatibility.patch \
 	  "
 
 # Uncomment the following line to enable platform score debugging
-- 
1.8.3


