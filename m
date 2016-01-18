Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 6DAA8700FD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 17:11:15 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id b66so20209473qkf.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 09:11:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=ENbLyg17wakpuTHhIFaBKXBR2KHBtk/ZNOGTBnbu8H4=;
	b=TMJJvYbKVV2qcs2vnQG4F6bwe01khWKqMQoZWzsKnbd+YTeiD2Ginm7V3oS6Fyd+KV
	l/C02I027pf5JovUgzNMf0E4DJPHDtZTPVcLj86YbPKG3GYJOMwDQO+dX+6z/tbZysD+
	Qb8Wyi6X00AjcrwGA+mgB7jZqUyCJGsTYiAgjbuEj14CSnU1p9Bi9lB/4nDG6rANcAi/
	4qNY3KtITi5MyCmtRPZdnvZDUzR8vKRpfdL6dKIT9OV2m1CLnCzCs7y6o7Imh0Ogz7w8
	Vu61T8lazJ6Q7ZKMK1z+AEM+jSZ75JP6wMZ6jcOS7s1Tp2MYLzlxC6aBNfxTq9jSkGei
	istw==
X-Gm-Message-State: ALoCoQnz75DsZWlJXPSYxzifuPbwTXiISAOWvqXpFwNeR7yiro3VL3DofDf8hxqYol5lkr9acTqnmsXdJFxiFlh6+kbt1h0lKg==
X-Received: by 10.55.40.3 with SMTP id o3mr32125524qkh.92.1453137076424;
	Mon, 18 Jan 2016 09:11:16 -0800 (PST)
Received: from localhost ([177.127.4.194]) by smtp.gmail.com with ESMTPSA id
	b6sm10511059qkh.12.2016.01.18.09.11.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Jan 2016 09:11:13 -0800 (PST)
Received: by localhost (sSMTP sendmail emulation);
	Mon, 18 Jan 2016 15:11:08 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Jan 2016 15:11:07 -0200
Message-Id: <1453137067-10751-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.7.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] libnewt: Fix linking error due missing symbols
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
X-List-Received-Date: Mon, 18 Jan 2016 17:11:16 -0000

The NEWT library links with 'slang' which requires 'tinfo' for
successful linking, this adds the 'tinfo' to the linking libraries.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 ...-Add-tinfo-library-to-the-linking-librari.patch | 26 ++++++++++++++++++++++
 meta/recipes-extended/newt/libnewt_0.52.18.bb      |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta/recipes-extended/newt/files/Makefile.in-Add-tinfo-library-to-the-linking-librari.patch

diff --git a/meta/recipes-extended/newt/files/Makefile.in-Add-tinfo-library-to-the-linking-librari.patch b/meta/recipes-extended/newt/files/Makefile.in-Add-tinfo-library-to-the-linking-librari.patch
new file mode 100644
index 0000000..bc55582
--- /dev/null
+++ b/meta/recipes-extended/newt/files/Makefile.in-Add-tinfo-library-to-the-linking-librari.patch
@@ -0,0 +1,26 @@
+From fad40cfc18a42946a9a9e440c3434cd6b847ff9d Mon Sep 17 00:00:00 2001
+From: Otavio Salvador <otavio@ossystems.com.br>
+Date: Mon, 18 Jan 2016 17:05:19 +0000
+Subject: [PATCH] Makefile.in: Add tinfo library to the linking libraries
+Organization: O.S. Systems Software LTDA.
+
+Upstream-Status: Pending
+
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+---
+ Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index a85d00f..98b85f9 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -1,4 +1,4 @@
+-LIBS = -lslang @LIBS@
++LIBS = -lslang -ltinfo @LIBS@
+ LIBTCL = @TCL_LIB_FLAG@
+ 
+ CC = @CC@
+-- 
+2.1.4
+
diff --git a/meta/recipes-extended/newt/libnewt_0.52.18.bb b/meta/recipes-extended/newt/libnewt_0.52.18.bb
index 302e418..293c1a8 100644
--- a/meta/recipes-extended/newt/libnewt_0.52.18.bb
+++ b/meta/recipes-extended/newt/libnewt_0.52.18.bb
@@ -21,6 +21,7 @@ SRC_URI = "https://fedorahosted.org/releases/n/e/newt/newt-${PV}.tar.gz \
            file://remove_slang_include.patch \
            file://fix_SHAREDDIR.patch \
            file://cross_ar.patch \
+           file://Makefile.in-Add-tinfo-library-to-the-linking-librari.patch \
 "
 
 SRC_URI[md5sum] = "685721bee1a318570704b19dcf31d268"
-- 
2.7.0


