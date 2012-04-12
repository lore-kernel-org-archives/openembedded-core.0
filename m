Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SIRWn-0002Nz-Bi
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 23:26:05 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q3CLGinQ006911
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2012 14:16:44 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 12 Apr 2012 14:16:43 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Apr 2012 16:21:23 -0500
Message-ID: <d03c20067d20533415b1af87a73e3ea2315aa21b.1334265557.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1334265557.git.mark.hatle@windriver.com>
References: <cover.1334265557.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 2/2] rpm: Ensure that we check both providename and filepaths
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Apr 2012 21:26:05 -0000
Content-Type: text/plain

In lib/rpmts.c we need to make sure to look for missing dependencies,
such as /bin/sh, in both the providename and filepaths DB.  Previously
the system would key off an initial '/' and only look in the filepaths DB.

This causes problems when a package such as "bash", has a Provides: /bin/sh.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-devtools/rpm/rpm/rpm-resolvedep.patch |   36 ++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    3 +-
 2 files changed, 38 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-resolvedep.patch

diff --git a/meta/recipes-devtools/rpm/rpm/rpm-resolvedep.patch b/meta/recipes-devtools/rpm/rpm/rpm-resolvedep.patch
new file mode 100644
index 0000000..8c01a30
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/rpm-resolvedep.patch
@@ -0,0 +1,36 @@
+lib/rpmts.c: Ensure that we check both providename and filepaths
+
+When looking up a missing dependencies, such as /bin/sh, we need to lookup
+in both the providename and filepaths DB, not just the filepaths DB.
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+--- rpm-5.4.0.orig/lib/rpmts.c	2010-12-27 16:08:25.000000000 -0600
++++ rpm-5.4.0/lib/rpmts.c	2012-04-12 15:01:12.990184067 -0500
+@@ -403,8 +403,8 @@
+ 	if (sdb == NULL)
+ 	    continue;
+ 
+-	/* Look for a matching Provides: in suggested universe. */
+-	rpmtag = (*keyp == '/' ? RPMTAG_FILEPATHS : RPMTAG_PROVIDENAME);
++	rpmtag = RPMTAG_PROVIDENAME;
++       do {
+ 	mi = rpmmiInit(sdb, rpmtag, keyp, keylen);
+ 	while ((h = rpmmiNext(mi)) != NULL) {
+ 	    size_t hnamelen;
+@@ -439,6 +439,15 @@
+ 	    bhnamelen = hnamelen;
+ 	}
+ 	mi = rpmmiFree(mi);
++
++	if (bh == NULL && *keyp == '/' && rpmtag == RPMTAG_PROVIDENAME) {
++	   rpmtag = RPMTAG_FILEPATHS;
++	   continue;
++        }
++
++        break;
++      } while (1);
++
+     }
+ 
+     /* Is there a suggested resolution? */
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.0.bb b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
index 4576f67..a9c9628 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
@@ -45,7 +45,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
 DEPENDS = "bzip2 zlib db openssl elfutils expat libpcre attr acl popt ${extrarpmdeps}"
 extrarpmdeps = "python perl file"
 extrarpmdeps_virtclass-native = "file-native"
-PR = "r35"
+PR = "r36"
 
 # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
 # in order to extract the distribution SRPM into a format we can extract...
@@ -69,6 +69,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.0-0.20101229.src.rpm;ex
 	   file://fix_for_automake_1.11.2.patch \
 	   file://pythondeps.sh \
 	   file://rpmdeps-oecore.patch \
+	   file://rpm-resolvedep.patch \
 	  "
 
 #	   file://rpm-autoconf.patch \
-- 
1.7.3.4



