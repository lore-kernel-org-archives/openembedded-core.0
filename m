Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id A9C7D7610A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jul 2015 15:16:51 +0000 (UTC)
Received: by pdbbh15 with SMTP id bh15so31932054pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jul 2015 08:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=lh9WaehWvID2xTa+HmEhf1hBqO1sagg2EuTzSbazhDc=;
	b=pu6CjRfMx3nS3J168QH05Sci+CKZ6WZ/9aqGg0hOb3js6h2nuufxIbgX1SN8CYlaXD
	CQbwrCqQq5lTckkvrGDBLyQqSt+QldqyGyB9R/fLz93X3DIl6sBtfel8PAPOsp/WzzJc
	ZCmuFfDaFwT6fEV6T2mJosXWzYVJBeFXBL6h5ah2gLLLSswK720YotKe/Vf+sqP35EF8
	UYEb9nTd0R6Bifkg6Z6A3Lpv6h/5T6Fvqr5XciBfa2WVBAGRBYuylBfcnxW1qQmzeGR7
	/jwtS4uKkO8lGhsKVwcx3gBB8R0OP4WnIuLBka57YHiem9b30BafV9sBMuX5CV7uZKz7
	dyPA==
X-Received: by 10.70.100.105 with SMTP id ex9mr40999285pdb.115.1437232611939; 
	Sat, 18 Jul 2015 08:16:51 -0700 (PDT)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	bx7sm14612629pdb.82.2015.07.18.08.16.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Jul 2015 08:16:49 -0700 (PDT)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id D6C59FC12F6; Sat, 18 Jul 2015 08:16:35 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jul 2015 08:16:21 -0700
Message-Id: <fb8a9ff4719f36ff5972b057efdd6ec62e658536.1437232180.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1437232180.git.akuster808@gmail.com>
References: <cover.1437232180.git.akuster808@gmail.com>
In-Reply-To: <cover.1437232180.git.akuster808@gmail.com>
References: <cover.1437232180.git.akuster808@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 14/25] gpgme: fix CVE-2014-3564
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
X-List-Received-Date: Sat, 18 Jul 2015 15:16:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Kai Kang <kai.kang@windriver.com>

Backport patch to fix CVE-2014-3564.

http://git.gnupg.org/cgi-bin/gitweb.cgi?p=gpgme.git;a=commit;h=2cbd76f

(From OE-Core rev: 421e21b08a6a32db88aaf46033ca503a99e49b74)

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>

Conflicts:
	meta/recipes-support/gpgme/gpgme_1.4.3.bb
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
index ca1e5f9..f16677e 100644
--- a/meta/recipes-support/gpgme/gpgme_1.4.3.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.4.3.bb
@@ -11,7 +11,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/gpgme/gpgme-${PV}.tar.bz2 \
            file://disable_gpgconf_check.patch \
-           file://gpgme.pc"
+           file://gpgme.pc \
+           file://gpgme-fix-CVE-2014-3564.patch \
+          "
 
 SRC_URI[md5sum] = "334e524cffa8af4e2f43ae8afe585672"
 SRC_URI[sha256sum] = "2d1cc12411753752d9c5b9037e6fd3fd363517af720154768cc7b46b60120496"
-- 
1.9.1


