Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 950567F9B9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 21:22:10 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id t1so6209702wrv.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 13:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=SFEm1nVdnNWRlXsS0O1kAyUyXhOtFpff1iExCuDYnt4=;
	b=TC6Ty8BrNLt2JafmrDsce0u4hC74fG3HDKj1R8CWOiP9TZ7fIp3/fICejGz8ebbKEC
	ZnYESdVBcS7V1z2gTdAEy/xPACSaZr7rmQrJOpnIxizBxYtxG3U+u/oaWPZ2rA76UAaj
	IWP0LO5+A5I6J5CxYGACPAhXNRwjt5G6bW06U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=SFEm1nVdnNWRlXsS0O1kAyUyXhOtFpff1iExCuDYnt4=;
	b=UtMJtLA2Lj5oOHL1v3wOCjkbjakz4tmgad++Z3P7SLZc8T8A2dn7ZjlvWyYadXwrMl
	F8b6QPWWIrPu4GCXA6MjrziqzhauyAxKiDqNxDmKqwar5AaNIJUK6l6MUtOYgZXoWeWU
	D7dhVo7iZWxZopu/zTbOJMrzadQG/Jyts4MOtIAT1vhocHrBzANULSLtkKclDbWnsVfx
	70aD0dE2NlF+yRicehm7M0SOOUvtf2ifzqtq80sg8CT3MWZoYpqM7AfRV0K2bhd179QE
	qGSzA1CjZJvnlRdP9MgxmMfps3bORcMiofF6QBebqXKJJ4sP3O9gyvYTkCqjaetnFR81
	fpNw==
X-Gm-Message-State: APjAAAUclLQxxc27kTIm4gu1XaXTea+LAX6jtL33R6h7x0aT6yLC2eeG
	JU5CXcv1NvVT6lB96jeBIsa8gnEldCA=
X-Google-Smtp-Source: APXvYqzxSxhD8LwpHpBXy7XSFMxc5dvBU6HBuEj5cLkBaNhr+uHFpNCgs62PoLjpT/Or7RqCaeQ/9g==
X-Received: by 2002:a5d:6b51:: with SMTP id x17mr14269980wrw.148.1574371330698;
	Thu, 21 Nov 2019 13:22:10 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	e16sm4939533wrj.80.2019.11.21.13.22.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 21 Nov 2019 13:22:10 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Nov 2019 21:22:04 +0000
Message-Id: <20191121212208.4885-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/5] opkg: Add upstream fixes for empty packages
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
X-List-Received-Date: Thu, 21 Nov 2019 21:22:10 -0000
Content-Transfer-Encoding: 8bit

An ipk with a zero size data.tar file caused opkg to crash with a
double free abort. Add the upstream fixes for this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../opkg/opkg/open_inner.patch                | 46 ++++++++++++++++
 .../opkg/opkg/opkg_archive.patch              | 54 +++++++++++++++++++
 meta/recipes-devtools/opkg/opkg_0.4.1.bb      |  2 +
 3 files changed, 102 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg/opkg/open_inner.patch
 create mode 100644 meta/recipes-devtools/opkg/opkg/opkg_archive.patch

diff --git a/meta/recipes-devtools/opkg/opkg/open_inner.patch b/meta/recipes-devtools/opkg/opkg/open_inner.patch
new file mode 100644
index 00000000000..278e099e3ac
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/open_inner.patch
@@ -0,0 +1,46 @@
+From alejandro.delcastillo@ni.com Wed Nov 20 22:35:02 2019
+From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+To: <opkg-devel@googlegroups.com>, <richard.purdie@linuxfoundation.org>
+CC: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+Subject: [opkg][PATCH 2/2] open_inner: add support for empty payloads
+Date: Wed, 20 Nov 2019 16:34:48 -0600
+Message-ID: <20191120223448.26522-3-alejandro.delcastillo@ni.com>
+X-Mailer: git-send-email 2.22.0
+In-Reply-To: <20191120223448.26522-1-alejandro.delcastillo@ni.com>
+References: <20191120223448.26522-1-alejandro.delcastillo@ni.com>
+MIME-Version: 1.0
+Content-Type: text/plain
+Content-Transfer-Encoding: 8bit
+
+Support for empty compressed payloads need to be explicitly enabled on
+libarchive.
+
+Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+
+Upstream-Status: Backport
+---
+ libopkg/opkg_archive.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/libopkg/opkg_archive.c b/libopkg/opkg_archive.c
+index 0e9ccea..f19cece 100644
+--- a/libopkg/opkg_archive.c
++++ b/libopkg/opkg_archive.c
+@@ -618,6 +618,13 @@ static struct archive *open_inner(struct archive *outer)
+         goto err_cleanup;
+     }
+ 
++    r = archive_read_support_format_empty(inner);
++    if (r != ARCHIVE_OK) {
++        opkg_msg(ERROR, "Empty format not supported: %s\n",
++                 archive_error_string(inner));
++        goto err_cleanup;
++    }
++
+     r = archive_read_open(inner, data, NULL, inner_read, inner_close);
+     if (r != ARCHIVE_OK) {
+         opkg_msg(ERROR, "Failed to open inner archive: %s\n",
+-- 
+2.22.0
+
+
diff --git a/meta/recipes-devtools/opkg/opkg/opkg_archive.patch b/meta/recipes-devtools/opkg/opkg/opkg_archive.patch
new file mode 100644
index 00000000000..3e1ebae9530
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/opkg_archive.patch
@@ -0,0 +1,54 @@
+From alejandro.delcastillo@ni.com Wed Nov 20 22:35:01 2019
+Return-Path: <richard.purdie+caf_=rpurdie=rpsys.net@linuxfoundation.org>
+From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+To: <opkg-devel@googlegroups.com>, <richard.purdie@linuxfoundation.org>
+CC: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+Subject: [opkg][PATCH 1/2] opkg_archive.c: avoid double free on uncompress
+ error
+Date: Wed, 20 Nov 2019 16:34:47 -0600
+Message-ID: <20191120223448.26522-2-alejandro.delcastillo@ni.com>
+X-Mailer: git-send-email 2.22.0
+In-Reply-To: <20191120223448.26522-1-alejandro.delcastillo@ni.com>
+References: <20191120223448.26522-1-alejandro.delcastillo@ni.com>
+MIME-Version: 1.0
+Content-Type: text/plain
+Content-Transfer-Encoding: 8bit
+
+The open-inner function calls archive_read_open. On error,
+archive_read_open calls inner_close, which also closes the outter
+archive. On error, return NULL directly to avoid double free.
+
+
+Upstream-Status: Backport
+
+Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+---
+ libopkg/opkg_archive.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libopkg/opkg_archive.c b/libopkg/opkg_archive.c
+index 3d87db1..0e9ccea 100644
+--- a/libopkg/opkg_archive.c
++++ b/libopkg/opkg_archive.c
+@@ -622,7 +622,7 @@ static struct archive *open_inner(struct archive *outer)
+     if (r != ARCHIVE_OK) {
+         opkg_msg(ERROR, "Failed to open inner archive: %s\n",
+                  archive_error_string(inner));
+-        goto err_cleanup;
++        return NULL;
+     }
+ 
+     return inner;
+@@ -683,7 +683,7 @@ static struct archive *extract_outer(const char *filename, const char *arname)
+ 
+     inner = open_inner(outer);
+     if (!inner)
+-        goto err_cleanup;
++        return NULL;
+ 
+     return inner;
+ 
+-- 
+2.22.0
+
+
diff --git a/meta/recipes-devtools/opkg/opkg_0.4.1.bb b/meta/recipes-devtools/opkg/opkg_0.4.1.bb
index 149ee3ca190..f0ae8b36bd1 100644
--- a/meta/recipes-devtools/opkg/opkg_0.4.1.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.4.1.bb
@@ -14,6 +14,8 @@ PE = "1"
 SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz \
            file://opkg.conf \
            file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
+           file://opkg_archive.patch \
+           file://open_inner.patch \
            file://run-ptest \
 "
 
-- 
2.20.1


