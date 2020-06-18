Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com [209.85.167.195])
 by mx.groups.io with SMTP id smtpd.web12.10584.1592494976213015995
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2020 08:42:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=AfrvfHyG;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.195, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f195.google.com with SMTP id a21so5464003oic.8
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2020 08:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version:in-reply-to:references
         :content-transfer-encoding;
        bh=pHomapl0sQxEA5dOAFsz5j0Z+A2c0w5Y01ZRGmDwRYA=;
        b=AfrvfHyGhXFocbL3Fg4nJwynFVffnb2GGrf4KvCnpjh/KyGa4PcN9VitW7QJvwnjnu
         eaTCyBztAfarz9Q+ACuEwKm2+Mx2ceLOErBnnqAQkWv0KKH96a0wlQqSPT9dG2HmuJ2f
         PVARbVG3ZPZMf++8/pRkyjvftO4h6YmZaUe1oDPSQnTgl6IsvEXCuEBcvHukAFiMlmJ2
         1ODhsmoTZq9/GSxxbxMkakNQH3AWMJuiGXySyhHwx9ZD0X2LkAiiupcb8x8ncZ83h88b
         C/Qsiq4g7nK+FGO9zPU0aHhgGMcP3VzbvjWtql0LeGSAMflFFFLHokcg0w1tZ7FgXUzZ
         eKcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :in-reply-to:references:content-transfer-encoding;
        bh=pHomapl0sQxEA5dOAFsz5j0Z+A2c0w5Y01ZRGmDwRYA=;
        b=d2gX63kX6iJ5kK/CbCSX+1NznXkL4okRJYssS6vHSozDv7zUNaL2w/fUl/amlRBklA
         ZKKjq/3j9wGaywuy0/fdvfQi68vNnwefaCTCDBjkNK1hjgE8EgS4WylHrkuZCdLzTerT
         psFOvMhjhjO7+Rivj9iisp6RbvjqD57WrALk07wp11QRB3jAcvvCsR2Ha5dCCPjBNxwL
         PNcO0G5lx8kXMCaMQgqEyaqUyFxnkkqe3CLRiAc77rPnMzX11+NDsISUhjxXR/xU4Jwq
         0lvrvme9CuMVIAagMV91TBauJPFmmYOqBdb1vlEBPMK9MjYtC9wR++G6DXREiObSna3q
         k11g==
X-Gm-Message-State: AOAM5320g2QNwiSqFivMXxJHIbem2/5eBraqEXkPiOhViBuwCWbk8qbF
	8lvLSYRnv75MTAsKoosEB4wLvjaVz057iw==
X-Google-Smtp-Source: ABdhPJx5c+E16JyMRKSR1LwZn2KsRJCZZF+6x5aeHzKM+M4NXiAq9GlJeGVLLIfv8tWgypsE2+ls5g==
X-Received: by 2002:aca:1217:: with SMTP id 23mr3371850ois.125.1592494975066;
        Thu, 18 Jun 2020 08:42:55 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id r7sm768843oor.9.2020.06.18.08.42.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 08:42:54 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 16/21] squashfs-tools: Backport fix for compiling with gcc 10
Date: Thu, 18 Jun 2020 05:40:46 -1000
Message-Id: <41bf4adead2033ff1a59e016daef05244d8a38d9.1592492076.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
In-Reply-To: <cover.1592492076.git.steve@sakoman.com>
References: <cover.1592492076.git.steve@sakoman.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jacob Kroon <jacob.kroon@gmail.com>

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bae1603a27fadcfa7257801167f28db3ff02dc97)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ols-fix-build-failure-against-gcc-10.patch | 45 +++++++++++++++++++
 .../squashfs-tools/squashfs-tools_git.bb      |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-devtools/squashfs-tools/files/0001-squashfs-tools-fix-build-failure-against-gcc-10.patch

diff --git a/meta/recipes-devtools/squashfs-tools/files/0001-squashfs-tools-fix-build-failure-against-gcc-10.patch b/meta/recipes-devtools/squashfs-tools/files/0001-squashfs-tools-fix-build-failure-against-gcc-10.patch
new file mode 100644
index 0000000000..fc881862ea
--- /dev/null
+++ b/meta/recipes-devtools/squashfs-tools/files/0001-squashfs-tools-fix-build-failure-against-gcc-10.patch
@@ -0,0 +1,45 @@
+From 94e1911ca24726b7cb3efe2f8b9eb7a784757e18 Mon Sep 17 00:00:00 2001
+From: Sergei Trofimovich <slyfox@gentoo.org>
+Date: Sun, 26 Jan 2020 18:35:13 +0000
+Subject: [PATCH] squashfs-tools: fix build failure against gcc-10
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+On gcc-10 (and gcc-9 -fno-common) build fails as:
+
+```
+cc ... -o mksquashfs
+ld: read_fs.o:(.bss+0x0):
+  multiple definition of `fwriter_buffer'; mksquashfs.o:(.bss+0x400c90): first defined here
+ld: read_fs.o:(.bss+0x8):
+  multiple definition of `bwriter_buffer'; mksquashfs.o:(.bss+0x400c98): first defined here
+```
+
+gcc-10 will change the default from -fcommon to fno-common:
+https://gcc.gnu.org/PR85678.
+
+The error also happens if CFLAGS=-fno-common passed explicitly.
+
+Reported-by: Toralf Förster
+Bug: https://bugs.gentoo.org/706456
+Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
+Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
+Upstream-Status: Backport [https://github.com/plougher/squashfs-tools/commit/fe2f5da4b0f8994169c53e84b7cb8a0feefc97b5]
+---
+ squashfs-tools/mksquashfs.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/squashfs-tools/mksquashfs.h b/squashfs-tools/mksquashfs.h
+index 1beefef..b650306 100644
+--- a/squashfs-tools/mksquashfs.h
++++ b/squashfs-tools/mksquashfs.h
+@@ -143,7 +143,7 @@ struct append_file {
+ #endif
+ 
+ extern struct cache *reader_buffer, *fragment_buffer, *reserve_cache;
+-struct cache *bwriter_buffer, *fwriter_buffer;
++extern struct cache *bwriter_buffer, *fwriter_buffer;
+ extern struct queue *to_reader, *to_deflate, *to_writer, *from_writer,
+ 	*to_frag, *locked_fragment, *to_process_frag;
+ extern struct append_file **file_mapping;
diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
index 9bcf026ce2..b06951df36 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://../COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 PV = "4.4"
 SRCREV = "52eb4c279cd283ed9802dd1ceb686560b22ffb67"
 SRC_URI = "git://github.com/plougher/squashfs-tools.git;protocol=https \
+           file://0001-squashfs-tools-fix-build-failure-against-gcc-10.patch;striplevel=2 \
 "
 
 S = "${WORKDIR}/git/squashfs-tools"
-- 
2.17.1

