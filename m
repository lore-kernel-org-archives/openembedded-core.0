Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id ABF937F282
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2019 12:52:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46NkHs1Q2pz56
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2019 14:52:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1567601561;
	bh=lCOghGCkDxgTacMGqUoFg82TOhA10x5Gy67ECS5723E=;
	h=From:To:Subject:Date:From;
	b=rAOm4YISPNzT81Y5tHX6qjpvL3Pxq6futz/7op8VUrmf4pmZ9jC1jLh0Tt+EsIucR
	QvDJ2ZNCxPy7DPWkA3eNObVB7M9Ljjq2JVBhp0ROHryXe+DD5TWPYjvaHKoECdGzhk
	oB21M0CLMO1KdvbxVDiqmFN1nTqd40vMB4JOTysMPOkDL4i6El88d4oqHWZSex6w82
	YuWwcGXPf331Tj3WJ5wH3V4MgZ8EtsPMeG3+jescbfsJtO/jeXYn2Zo/2CEkUfpl31
	LIR35PJD8hSpASdX2r98GDLKJtjm6QNZvr73vtad5vzZq6G8D4WuyG1o9vsJ6XC4H8
	P4IM5VJyeKBVy7w5EsKmdvB8EtODeDPWicJk1dPqWwY8fXFNW1bz1lBbr/n5Qxb+zE
	pRHrgLaSHaal3v7pdAk7oqsTD8VtO2/1uANXdcH849lBUmoTDxAoyvYS07ykM1jPdZ
	uoKVvXugFX+LuD9tMznid+aRPDxDmH9lBwJ46Hh9jUbpdTtW8Ka32/Tlehl6HsTvdW
	HZBGDudC80EDRLlS/Ouy/ThI02+p/iY71h8Iy0Kn5fC/cmY/Z1Dq+FWVytANqVudDx
	g919mJNfDV0dOLUaG9fvkDdCGMHuLosg6lHqSxy/jso2u8cnMhPcWoo5QlWn6JvpAO
	J/d8i9UjzUIwQXT1YUr2c/I4=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Sep 2019 15:52:40 +0300
Message-Id: <20190904125240.5672-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] systemd: Update to the latest 242 branch
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
X-List-Received-Date: Wed, 04 Sep 2019 12:52:42 -0000

Remove patch for issue fixed upstream.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-core/systemd/systemd.inc         |  2 +-
 ...Fix-incorrect-use-of-OpenSSL-BUF_MEM.patch | 41 -------------------
 meta/recipes-core/systemd/systemd_242.bb      |  1 -
 3 files changed, 1 insertion(+), 43 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-resolved-Fix-incorrect-use-of-OpenSSL-BUF_MEM.patch

diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 491361ccca..1912715617 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,7 +14,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "07f0549ffe3413f0e78b656dd34d64681cbd8f00"
+SRCREV = "f875dced33462641e1fb7875d2f9a8cd8e8c2fcc"
 SRCBRANCH = "v242-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH}"
 
diff --git a/meta/recipes-core/systemd/systemd/0001-resolved-Fix-incorrect-use-of-OpenSSL-BUF_MEM.patch b/meta/recipes-core/systemd/systemd/0001-resolved-Fix-incorrect-use-of-OpenSSL-BUF_MEM.patch
deleted file mode 100644
index f0ae1db60d..0000000000
--- a/meta/recipes-core/systemd/systemd/0001-resolved-Fix-incorrect-use-of-OpenSSL-BUF_MEM.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 18bddeaaf225d5becfc10cd2c6a1d037c90574a2 Mon Sep 17 00:00:00 2001
-From: Tomas Mraz <tmraz@fedoraproject.org>
-Date: Tue, 11 Jun 2019 15:10:21 +0200
-Subject: [PATCH] resolved: Fix incorrect use of OpenSSL BUF_MEM
-
-Fixes: #12763
-Upstream-Status: Backport [Not yet released]
-  https://github.com/systemd/systemd/commit/18bddeaaf225d5becfc10cd2c6a1d037c90574a2
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
----
- src/resolve/resolved-dnstls-openssl.c | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/src/resolve/resolved-dnstls-openssl.c b/src/resolve/resolved-dnstls-openssl.c
-index f269e4d6487f..5d9223007581 100644
---- a/src/resolve/resolved-dnstls-openssl.c
-+++ b/src/resolve/resolved-dnstls-openssl.c
-@@ -6,6 +6,7 @@
- 
- #include <openssl/bio.h>
- #include <openssl/err.h>
-+#include <string.h>
- 
- #include "io-util.h"
- #include "resolved-dns-stream.h"
-@@ -34,9 +35,11 @@ static int dnstls_flush_write_buffer(DnsStream *stream) {
-                         return ss;
-                 } else {
-                         stream->dnstls_data.write_buffer->length -= ss;
--                        stream->dnstls_data.write_buffer->data += ss;
- 
-                         if (stream->dnstls_data.write_buffer->length > 0) {
-+                                memmove(stream->dnstls_data.write_buffer->data,
-+                                        stream->dnstls_data.write_buffer->data + ss,
-+                                        stream->dnstls_data.write_buffer->length);
-                                 stream->dnstls_events |= EPOLLOUT;
-                                 return -EAGAIN;
-                         }
--- 
-2.17.1
-
diff --git a/meta/recipes-core/systemd/systemd_242.bb b/meta/recipes-core/systemd/systemd_242.bb
index 6fbb854886..04cd9a2864 100644
--- a/meta/recipes-core/systemd/systemd_242.bb
+++ b/meta/recipes-core/systemd/systemd_242.bb
@@ -23,7 +23,6 @@ SRC_URI += "file://touchscreen.rules \
            file://0004-rules-whitelist-hd-devices.patch \
            file://0005-rules-watch-metadata-changes-in-ide-devices.patch \
            file://99-default.preset \
-           file://0001-resolved-Fix-incorrect-use-of-OpenSSL-BUF_MEM.patch \
            "
 
 # patches needed by musl
-- 
2.17.1


