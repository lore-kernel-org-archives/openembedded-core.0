Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id B86A960110
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2019 06:50:36 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id v28so956995pgk.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 22:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=b9Ux8I34oHe8csJLuZpYP9bDTAhps8VY5lQA+sNtKJ0=;
	b=k2ZdBOGtyLzR17ASb3yZSnLLkA6rVqF8ufPhCpv5nR4aL5OjdaUZ4s0JQTJrOy744l
	jCz66wwdcinag8e4SPoNvzTbxELB04L2L2yhf0h21WIwqlDOcYOy5dbANUF4iz0FaMsM
	Y90uxIEzPlsiFOGP5pCU/wU8pdbrDJkmacbzCezgJa/0hmhv3hAok31kNoV2R7Flrt/+
	JeeG+voTtsEoBOWNfbba5OhNqons4MaEUFaixT2KvHP95zyPUc3QEPwppfquXzlA91/P
	nh/Xf6vYDFXbqqDhFnOO1HUu88xf3P+GPBZFyhn++YpUshfZWvYhHMYn+yagGK6E6RSL
	YxTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=b9Ux8I34oHe8csJLuZpYP9bDTAhps8VY5lQA+sNtKJ0=;
	b=rI7i7F56/fOkGsi803wAYFJ13hCPkqUoA+Scdjnf+u2AfRdKaM6CeGaDnk0dklZM15
	j0WGJ3sBncsTsMtpdtQ9ykfcwat4dL+MzNzCGRuUR8L9VTLe+GWLKpLT7gMAdwPjc9je
	ahXujzUMB93kw8Py7Dyg0b1SCaCOt2Zdjrh6982V8RFPOw0DndHwCZbCoRhRFnKtSY3z
	pIZod92kiDHxZE5HH2HEt96KxOknCSRbpnyBLEoV/JaE0hLcZVcCP0OPt4TI9RdhcF0A
	ratS+GTOs6JGdoziz2YPTykWTyzMgxOb8Rv+jg/aC43l3sw1aXO/uVIqUMKVNBlPml23
	u2Jw==
X-Gm-Message-State: AJcUukfDzTEYGtxy/EfzWOcDXnyQvtcifZB1nG7FTRBERgytwZBy90Ah
	tbVPrEAkFBPaUOL89E8vQgeUJF2O
X-Google-Smtp-Source: ALg8bN4PXXye8Qlaquk8F0a8QuiNIQFsVIkXhKxwzyV5O3GTjtKn7HWcUUJo5wrnFTWNyNQb7iiCbQ==
X-Received: by 2002:a65:534b:: with SMTP id w11mr30699246pgr.125.1548917437020;
	Wed, 30 Jan 2019 22:50:37 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::26b6])
	by smtp.gmail.com with ESMTPSA id
	o85sm1080044pfi.105.2019.01.30.22.50.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jan 2019 22:50:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2019 22:50:12 -0800
Message-Id: <20190131065016.21887-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190131065016.21887-1-raj.khem@gmail.com>
References: <20190131065016.21887-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/6] xinput-calibrator: Fix build with clang/libc++
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
X-List-Received-Date: Thu, 31 Jan 2019 06:50:36 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ....hh-Include-string-to-get-std-string.patch | 28 +++++++++++++++++++
 .../xinput-calibrator_git.bb                  |  4 ++-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/xinput-calibrator/xinput-calibrator/0001-calibrator.hh-Include-string-to-get-std-string.patch

diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator/0001-calibrator.hh-Include-string-to-get-std-string.patch b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator/0001-calibrator.hh-Include-string-to-get-std-string.patch
new file mode 100644
index 0000000000..37617600d5
--- /dev/null
+++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator/0001-calibrator.hh-Include-string-to-get-std-string.patch
@@ -0,0 +1,28 @@
+From 79bc507b48d4acd3dec8a85ab6b341b872d44a05 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 29 Jan 2019 22:40:24 -0800
+Subject: [PATCH] calibrator.hh: Include <string> to get std::string
+
+Found with libc++
+
+Upstream-Status: Submitted [https://github.com/tias/xinput_calibrator/pull/76]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/calibrator.hh | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/calibrator.hh b/src/calibrator.hh
+index a6f9504..e75bcef 100644
+--- a/src/calibrator.hh
++++ b/src/calibrator.hh
+@@ -29,6 +29,7 @@
+ #include <X11/Xlib.h>
+ #include <stdio.h>
+ #include <vector>
++#include <string>
+ 
+ // XXX: we currently don't handle lines that are longer than this
+ #define MAX_LINE_LEN 1024
+-- 
+2.20.1
+
diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
index 68e62ea6d9..9873d3f33f 100644
--- a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
+++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
@@ -14,7 +14,9 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRCREV = "03dadf55109bd43d3380f040debe9f82f66f2f35"
 SRC_URI = "git://github.com/tias/xinput_calibrator.git \
            file://30xinput_calibrate.sh \
-           file://Allow-xinput_calibrator_pointercal.sh-to-be-run-as-n.patch"
+           file://Allow-xinput_calibrator_pointercal.sh-to-be-run-as-n.patch \
+           file://0001-calibrator.hh-Include-string-to-get-std-string.patch \
+           "
 
 S = "${WORKDIR}/git"
 
-- 
2.20.1


