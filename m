Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 62DF87E466
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2019 04:27:07 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id w22so4296531pgi.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 21:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=J9JEnrHBPoERwbGe2XwkfnhbWpvrRgtQICnVLFvCkXM=;
	b=NwtyfY1uJ7JJ6jCbYF1lQZVCzJjDbaKZ4qyQPiXefvpYrMPLBB/sTUyGtlIHguqvwV
	srj099Wjp6S87Tq/qpikTSTLqmOXEetacAe7cNLrBWt9ZQBf1tigjqeMBfTywMHrcXIS
	OPMccV0OjEbHJDBd7aMGy2t8RoXFJdpl1WnTPCqxu39mGKiniN0hEYE+yPj55Rp7tZkj
	iQee2qDYPuzZMCxZ33Rbv2AFlB4OJsRujxbYAm5vJP+77SWv4RNv4jkvUcWWHHSCxSME
	alppmozVyfI+5g02hvW0Nb+1022P7sHfqkqQpnNsl94ovHWC4IvRo6hHGruDv8G34I/Z
	E8kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=J9JEnrHBPoERwbGe2XwkfnhbWpvrRgtQICnVLFvCkXM=;
	b=VrARg0Efhw1irC858gGOG2uBPbmUDPzc/VqcQAIbGR45JItBtxcoOZaqdXxMBE55fe
	5l7hzsyIizFAa15uBoGcN94+Of68dMBugtmTHBXNWhmJGSWdae/dU0ElfN9MRyGv7/D0
	J0j+9nks9ZwQEUCb8NxHL8MrWYeNr8Uoi5XY7LetUXPY+Fc6QMdOGG1x+XfMnglpmypM
	04ArRptS4X3GzdbdvLUHXFzTsotzM2PuUhste7TZGXwe+FLNw7rfUXpU08hEzzqTNbcG
	y3jD9SgLrYsYg0R62at8wsVVKjNIT1Hx8soIT0y+Vfs7cc9XrB13ZigLYvFGYXMsOu3d
	wY1A==
X-Gm-Message-State: APjAAAWfHW5jHc2D6BsBf+TFzPoeQXXf7WGkf3pDlk8yew/hBbtNmo3R
	3pMAlPWcOYn/2hyOdUwRCt73hjK8WhA=
X-Google-Smtp-Source: APXvYqw90DqucW+DHHwBMtgLx6EtxdHGXfHQptbaHoHOnLbTHDWlMzDKcrm6h1qYq6LRUgHu0hU9Og==
X-Received: by 2002:aa7:8c12:: with SMTP id
	c18mr111842037pfd.194.1558672027735; 
	Thu, 23 May 2019 21:27:07 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::e252])
	by smtp.gmail.com with ESMTPSA id
	g22sm1004097pfo.28.2019.05.23.21.27.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 May 2019 21:27:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 May 2019 21:26:59 -0700
Message-Id: <20190524042659.24616-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] ofono: Add TEMP_FAILURE_RETRY optional definition
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
X-List-Received-Date: Fri, 24 May 2019 04:27:07 -0000
Content-Transfer-Encoding: 8bit

Fixes build with musl where TEMP_FAILURE_RETRY is not provided

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...tional-TEMP_FAILURE_RETRY-macro-copy.patch | 36 +++++++++++++++++++
 meta/recipes-connectivity/ofono/ofono_1.29.bb |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-connectivity/ofono/ofono/0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch

diff --git a/meta/recipes-connectivity/ofono/ofono/0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch b/meta/recipes-connectivity/ofono/ofono/0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch
new file mode 100644
index 0000000000..8a5a300adc
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono/0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch
@@ -0,0 +1,36 @@
+From 22b52db4842611ac31a356f023fc09595384e2ad Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 23 May 2019 18:11:22 -0700
+Subject: [PATCH] mbim: add an optional TEMP_FAILURE_RETRY macro copy
+
+Fixes build on musl which does not provide this macro
+
+Upstream-Status: Submitted [https://lists.ofono.org/pipermail/ofono/2019-May/019370.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ drivers/mbimmodem/mbim-private.h | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/drivers/mbimmodem/mbim-private.h b/drivers/mbimmodem/mbim-private.h
+index e159235..51693ea 100644
+--- a/drivers/mbimmodem/mbim-private.h
++++ b/drivers/mbimmodem/mbim-private.h
+@@ -21,6 +21,15 @@
+ 
+ #define align_len(len, boundary) (((len)+(boundary)-1) & ~((boundary)-1))
+ 
++#ifndef TEMP_FAILURE_RETRY
++#define TEMP_FAILURE_RETRY(expression) ({     \
++  __typeof(expression) __result;              \
++  do {                                        \
++    __result = (expression);                  \
++  } while (__result == -1 && errno == EINTR); \
++  __result; })
++#endif
++
+ enum mbim_control_message {
+ 	MBIM_OPEN_MSG = 0x1,
+ 	MBIM_CLOSE_MSG = 0x2,
+-- 
+2.21.0
+
diff --git a/meta/recipes-connectivity/ofono/ofono_1.29.bb b/meta/recipes-connectivity/ofono/ofono_1.29.bb
index b5838e19bf..900a6d26d9 100644
--- a/meta/recipes-connectivity/ofono/ofono_1.29.bb
+++ b/meta/recipes-connectivity/ofono/ofono_1.29.bb
@@ -7,6 +7,7 @@ SRC_URI  = "\
   file://0001-build-Add-check-for-explicit_bzero-support.patch \
   file://0001-main-Quiet-ld-errors-with-external-ell.patch \
   file://0001-Makefile.am-Don-t-overwrite-src_ofonod_DEPENDENCIES.patch \
+  file://0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch \
 "
 SRC_URI[md5sum] = "4fa0372630ff03f223452e4d05efa8f8"
 SRC_URI[sha256sum] = "67f0f8e5740dea5b46309e40667d1e560be39c90ef08dd01ff9e9ce8e61f0679"
-- 
2.21.0


