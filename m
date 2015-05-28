Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6CD0965D6E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 May 2015 01:32:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t4S1W8pK012956
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 May 2015 18:32:09 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Wed, 27 May 2015 18:32:08 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <randy.macleod@windriver.com>
Date: Thu, 28 May 2015 09:26:14 +0800
Message-ID: <1c155493649d2ee3de410c68699c3883eeae0b81.1432775689.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1432775689.git.kai.kang@windriver.com>
References: <cover.1432775689.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] gpgme: fix CVE-2014-3564
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
X-List-Received-Date: Thu, 28 May 2015 01:32:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Backport patch to fix CVE-2014-3564.

http://git.gnupg.org/cgi-bin/gitweb.cgi?p=gpgme.git;a=commit;h=2cbd76f

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../gpgme-1.4.3/gpgme-fix-CVE-2014-3564.patch      | 56 ++++++++++++++++++++++
 meta/recipes-support/gpgme/gpgme_1.4.3.bb          |  4 +-
 2 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/gpgme/gpgme-1.4.3/gpgme-fix-CVE-2014-3564.patch

diff --git a/meta/recipes-support/gpgme/gpgme-1.4.3/gpgme-fix-CVE-2014-3564.patch b/meta/recipes-support/gpgme/gpgme-1.4.3/gpgme-fix-CVE-2014-3564.patch
new file mode 100644
index 0000000..c728f58
--- /dev/null
+++ b/meta/recipes-support/gpgme/gpgme-1.4.3/gpgme-fix-CVE-2014-3564.patch
@@ -0,0 +1,56 @@
+Upstream-Status: Backport
+
+Backport patch to fix CVE-2014-3564.
+
+http://git.gnupg.org/cgi-bin/gitweb.cgi?p=gpgme.git;a=commit;h=2cbd76f7911fc215845e89b50d6af5ff4a83dd77
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+From 2cbd76f7911fc215845e89b50d6af5ff4a83dd77 Mon Sep 17 00:00:00 2001
+From: Werner Koch <wk@gnupg.org>
+Date: Wed, 30 Jul 2014 11:04:55 +0200
+Subject: [PATCH 1/1] Fix possible realloc overflow for gpgsm and uiserver
+ engines.
+
+After a realloc (realloc is also used for initial alloc) the allocated
+size if the buffer is not correctly recorded.  Thus an overflow can be
+introduced by receiving data with different line lengths in a specific
+order.  This is not easy exploitable because libassuan constructs the
+line.  However a crash has been reported and thus it might be possible
+to constructs an exploit.
+
+CVE-id: CVE-2014-3564
+Reported-by: TomÃ¡Å¡ Trnka
+---
+ src/engine-gpgsm.c    | 2 +-
+ src/engine-uiserver.c | 2 +-
+ 3 files changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/src/engine-gpgsm.c b/src/engine-gpgsm.c
+index 8ec1598..3a83757 100644
+--- a/src/engine-gpgsm.c
++++ b/src/engine-gpgsm.c
+@@ -836,7 +836,7 @@ status_handler (void *opaque, int fd)
+ 	      else
+ 		{
+ 		  *aline = newline;
+-		  gpgsm->colon.attic.linesize += linelen + 1;
++		  gpgsm->colon.attic.linesize = *alinelen + linelen + 1;
+ 		}
+ 	    }
+ 	  if (!err)
+diff --git a/src/engine-uiserver.c b/src/engine-uiserver.c
+index 2738c36..a7184b7 100644
+--- a/src/engine-uiserver.c
++++ b/src/engine-uiserver.c
+@@ -698,7 +698,7 @@ status_handler (void *opaque, int fd)
+ 	      else
+ 		{
+ 		  *aline = newline;
+-		  uiserver->colon.attic.linesize += linelen + 1;
++		  uiserver->colon.attic.linesize = *alinelen + linelen + 1;
+ 		}
+ 	    }
+ 	  if (!err)
+-- 
+2.1.4
diff --git a/meta/recipes-support/gpgme/gpgme_1.4.3.bb b/meta/recipes-support/gpgme/gpgme_1.4.3.bb
index cba3589..f804578 100644
--- a/meta/recipes-support/gpgme/gpgme_1.4.3.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.4.3.bb
@@ -11,7 +11,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/gpgme/gpgme-${PV}.tar.bz2 \
            file://gpgme.pc \
-           file://pkgconfig.patch"
+           file://pkgconfig.patch \
+           file://gpgme-fix-CVE-2014-3564.patch \
+          "
 
 SRC_URI[md5sum] = "334e524cffa8af4e2f43ae8afe585672"
 SRC_URI[sha256sum] = "2d1cc12411753752d9c5b9037e6fd3fd363517af720154768cc7b46b60120496"
-- 
1.9.1


