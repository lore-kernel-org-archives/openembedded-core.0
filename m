Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 249747422C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jan 2016 00:31:12 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id gi1so30413276pac.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Jan 2016 16:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=rGX/oKcwLpU1m7Vc2//hGZeJFQw2vfK47lViqbH9MJI=;
	b=dSxMCOvvtrJPWgTRK3vGVv4Vg3QFMlieIGotKYMvAEA+Quc1Vrq/94DoPD8Ygv6hzY
	CWXxevSyGzXEK38UMTT2ehNbjCnRZcKluhVWZX8mgZAvEL/dtke5Bp/SJnocAVD1ZVov
	zGzrQtJ+P7sCJqGynUxR1z4bifKHEMNiAIasWe9n+vC7OfLUV5DpxK6bd0XjcfmdGZPr
	djy9cOCpnYyLLPeBp6fy5tshskuPgTf6M75HiKNCPJtPzzkSkD7PXFMc8OWs0btF5GuH
	kCquPPOak64LBoH3XitP+9MujgfoQwB3QhoqGCHt4eZfHXGHLOpkvZNKd3dEUgVE5WOe
	lBBg==
X-Received: by 10.66.149.7 with SMTP id tw7mr44728828pab.72.1452385873210;
	Sat, 09 Jan 2016 16:31:13 -0800 (PST)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	x80sm13702544pfi.72.2016.01.09.16.31.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Jan 2016 16:31:10 -0800 (PST)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id ECED8FCC845; Sat,  9 Jan 2016 16:30:50 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Jan 2016 16:30:41 -0800
Message-Id: <a782fbc056aca03b9853e3debc46d379b436cdd1.1452385571.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1452385571.git.akuster808@gmail.com>
References: <cover.1452385571.git.akuster808@gmail.com>
In-Reply-To: <cover.1452385571.git.akuster808@gmail.com>
References: <cover.1452385571.git.akuster808@gmail.com>
Subject: [PATCH 15/20] libxml2: CVE-2015-8035
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
X-List-Received-Date: Sun, 10 Jan 2016 00:31:12 -0000

From: Sona Sarmadi <sona.sarmadi@enea.com>

Fixes DoS when parsing specially crafted XML document
if XZ support is enabled.

References:
https://bugzilla.gnome.org/show_bug.cgi?id=757466

Upstream correction:
https://git.gnome.org/browse/libxml2/commit/?id=
f0709e3ca8f8947f2d91ed34e92e38a4c23eae63

Signed-off-by: Tudor Florea <tudor.florea@enea.com>
Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-core/libxml/libxml2.inc               |  1 +
 .../libxml/libxml2/CVE-2015-8035.patch             | 35 ++++++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-8035.patch

diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/libxml/libxml2.inc
index 15a2421..d5e263b 100644
--- a/meta/recipes-core/libxml/libxml2.inc
+++ b/meta/recipes-core/libxml/libxml2.inc
@@ -24,6 +24,7 @@ SRC_URI = "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz;name=libtar \
            file://libxml2-CVE-2014-3660.patch \
            file://0001-CVE-2015-1819-Enforce-the-reader-to-run-in-constant-.patch \
            file://CVE-2015-7942.patch \
+           file://CVE-2015-8035.patch \
           "
 
 BINCONFIG = "${bindir}/xml2-config"
diff --git a/meta/recipes-core/libxml/libxml2/CVE-2015-8035.patch b/meta/recipes-core/libxml/libxml2/CVE-2015-8035.patch
new file mode 100644
index 0000000..d08693f
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2015-8035.patch
@@ -0,0 +1,35 @@
+From f0709e3ca8f8947f2d91ed34e92e38a4c23eae63 Mon Sep 17 00:00:00 2001
+From: Daniel Veillard <veillard@redhat.com>
+Date: Tue, 3 Nov 2015 15:31:25 +0800
+Subject: CVE-2015-8035 Fix XZ compression support loop
+
+For https://bugzilla.gnome.org/show_bug.cgi?id=757466
+DoS when parsing specially crafted XML document if XZ support
+is compiled in (which wasn't the case for 2.9.2 and master since
+Nov 2013, fixed in next commit !)
+
+Upstream-Status: Backport
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+
+---
+ xzlib.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/xzlib.c b/xzlib.c
+index 0dcb9f4..1fab546 100644
+--- a/xzlib.c
++++ b/xzlib.c
+@@ -581,6 +581,10 @@ xz_decomp(xz_statep state)
+             xz_error(state, LZMA_DATA_ERROR, "compressed data error");
+             return -1;
+         }
++        if (ret == LZMA_PROG_ERROR) {
++            xz_error(state, LZMA_PROG_ERROR, "compression error");
++            return -1;
++        }
+     } while (strm->avail_out && ret != LZMA_STREAM_END);
+ 
+     /* update available output and crc check value */
+-- 
+cgit v0.11.2
+
-- 
1.9.1


