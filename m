Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web12.10487.1628177789493146082
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Aug 2021 08:36:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=15NWpEd2;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.53, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f53.google.com with SMTP id e13-20020a056830200db02904f06fa2790cso5562681otp.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Aug 2021 08:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=SwJpEjhBhOK/uJP+tsCyobpDnncGn+Hg+fZkZyCv5ww=;
        b=15NWpEd2rNxoplRFwUYQtfrFlItnDUx9Jj8khpkUvilcddEtZlbab9YHWoLIlvXHif
         BOX8eQ44dVth5+OwU0Jt3DUPU5GmvExZPxAECkezJkti0KceynuG+ZSoh+xIT4VPZdq8
         LKVGTzeK04d0BunBTR8vhexy2AJCKfogYJ8ovp3+yvp3z69Yf8C52m9bZ3KHN/IBQcpl
         XwNOh55trKnWtdO+3bEYRjeX5gyFePh1Iem88tpvEd7WweqSK+DfWSitXMnz4zX4zS+t
         4oOCiGh0agPI3sYOze65Z+6M2etkxglzqWqex7NFybac0yrQjdnn97on2hj5rX6FVF0R
         6VZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SwJpEjhBhOK/uJP+tsCyobpDnncGn+Hg+fZkZyCv5ww=;
        b=cA1QH+2Cz3fOqqWmlYoGBfG/a/JAR/srFCAwKcH4R222lOM8QvoN/3QG6dS3xWI3Tt
         4FxA0xqyr5TBmKw15C1ShmU933xGXVNfKF2ZjLJnG+uqudRNnD/Lexkr53VzlTUBAT/H
         V4a5hQOQ+6TvZF0S2G7cYvY4ML3FvIHEkJFAr72EcPt96GqwKmDkqdcLqI13Mfrdt+CV
         qonpKXIsVU/9ZDGrBtmvh0ib0/te/REPXjhPORng3IqDHHRKDeudyxgoDntvdVyg9fJg
         opZAKEX6OU+VLxhzjhMpvlbbjqFAo/UuRRharvaL+mM3PaOGSqdYFsBaPcnnkRvSjJyD
         WBdw==
X-Gm-Message-State: AOAM532vDHJURGCFCQOEYTzW4q0EkxO+U7OPvg+lHzaAC31TIsc5IyMC
	bgjK7C1gNNXC8mAGhJUd+DbJlErnVh9zTCh4
X-Google-Smtp-Source: ABdhPJxAj95aYQ0LChtG8/HxjK66OtfexJOtatQMf5O7D5yXEFsDQLMYqTvnnHCPARJI5X66b+o3rQ==
X-Received: by 2002:a9d:7c99:: with SMTP id q25mr4224201otn.266.1628177788399;
        Thu, 05 Aug 2021 08:36:28 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id bf41sm1103076oib.41.2021.08.05.08.36.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 08:36:28 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 15/33] glew: fix Makefile race
Date: Thu,  5 Aug 2021 05:33:52 -1000
Message-Id: <098e9a98ef31211d9a217ab1fde4655b81a7b56d.1628176985.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628176985.git.steve@sakoman.com>
References: <cover.1628176985.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross@burtonini.com>

Fix a Makefile race resulting in the target creating a directory being
executed after the target to write into that directory.

[ YOCTO #14485 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e90c1d3b80e35fb685d4b321972743771eb2c2c0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0001-Fix-build-race-in-Makefile.patch     | 56 +++++++++++++++++++
 meta/recipes-graphics/glew/glew_2.2.0.bb      |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-graphics/glew/glew/0001-Fix-build-race-in-Makefile.patch

diff --git a/meta/recipes-graphics/glew/glew/0001-Fix-build-race-in-Makefile.patch b/meta/recipes-graphics/glew/glew/0001-Fix-build-race-in-Makefile.patch
new file mode 100644
index 0000000000..7edcfe8de8
--- /dev/null
+++ b/meta/recipes-graphics/glew/glew/0001-Fix-build-race-in-Makefile.patch
@@ -0,0 +1,56 @@
+Upstream-Status: Submitted [https://github.com/nigels-com/glew/pull/311]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 0ce0a85597db48a2fca619bd95e34af091e54ae8 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Thu, 22 Jul 2021 16:31:11 +0100
+Subject: [PATCH] Fix build race in Makefile
+
+The current rule for the binaries is:
+
+glew.bin: glew.lib bin bin/$(GLEWINFO.BIN) bin/$(VISUALINFO.BIN)
+
+In parallel builds, all of those targets happen at the same time. This
+means that 'bin' can happen *after* 'bin/$(GLEWINFO.BIN)', which is a
+problem as the 'bin' target's responsibility is to create the directory
+that the other target writes into.
+
+Solve this by not having a separate 'create directory' target which is
+fundamentally racy, and simply mkdir in each target which writes into it.
+---
+ Makefile | 9 ++++-----
+ 1 file changed, 4 insertions(+), 5 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index d0e4614..04af44c 100644
+--- a/Makefile
++++ b/Makefile
+@@ -171,21 +171,20 @@ VISUALINFO.BIN.OBJ := $(VISUALINFO.BIN.OBJ:.c=.o)
+ # Don't build glewinfo or visualinfo for NaCL, yet.
+ 
+ ifneq ($(filter nacl%,$(SYSTEM)),)
+-glew.bin: glew.lib bin
++glew.bin: glew.lib
+ else
+-glew.bin: glew.lib bin bin/$(GLEWINFO.BIN) bin/$(VISUALINFO.BIN) 
++glew.bin: glew.lib bin/$(GLEWINFO.BIN) bin/$(VISUALINFO.BIN)
+ endif
+ 
+-bin:
+-	mkdir bin
+-
+ bin/$(GLEWINFO.BIN): $(GLEWINFO.BIN.OBJ) $(LIB.SHARED.DIR)/$(LIB.SHARED)
++	@mkdir -p $(dir $@)
+ 	$(CC) $(CFLAGS) -o $@ $(GLEWINFO.BIN.OBJ) $(BIN.LIBS)
+ ifneq ($(STRIP),)
+ 	$(STRIP) -x $@
+ endif
+ 
+ bin/$(VISUALINFO.BIN): $(VISUALINFO.BIN.OBJ) $(LIB.SHARED.DIR)/$(LIB.SHARED)
++	@mkdir -p $(dir $@)
+ 	$(CC) $(CFLAGS) -o $@ $(VISUALINFO.BIN.OBJ) $(BIN.LIBS)
+ ifneq ($(STRIP),)
+ 	$(STRIP) -x $@
+-- 
+2.25.1
+
diff --git a/meta/recipes-graphics/glew/glew_2.2.0.bb b/meta/recipes-graphics/glew/glew_2.2.0.bb
index 8948444e08..92b6083648 100644
--- a/meta/recipes-graphics/glew/glew_2.2.0.bb
+++ b/meta/recipes-graphics/glew/glew_2.2.0.bb
@@ -6,6 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ac251558de685c6b9478d89be3149c2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/glew/glew/${PV}/glew-${PV}.tgz \
+           file://0001-Fix-build-race-in-Makefile.patch \
            file://no-strip.patch"
 
 SRC_URI[md5sum] = "3579164bccaef09e36c0af7f4fd5c7c7"
-- 
2.25.1

