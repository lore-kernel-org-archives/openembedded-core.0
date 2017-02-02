Return-Path: <koen.kooi@linaro.org>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4039871988
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Feb 2017 10:29:00 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id r141so82246611wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Feb 2017 02:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=+l8R//01tBMJrF7d6wF1VDlMflwV9DQsHDLK7xBqdu4=;
	b=g3Qp3Tl1Tjo76jzMFqesXmibMN5aRmIWrBHvVy0J5ylyhqNRzS0i0WiZrTJyMrBP5m
	h7Lv8xwoOAdEoEPd5tQxx50jnh0uW3BMX8/sXyxwclTR5JPPv6xOgpiGG6/OF5eiF/XT
	Dz8iZ7XX56LFc9pxXz0jBcD7MOI3z2haulfPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+l8R//01tBMJrF7d6wF1VDlMflwV9DQsHDLK7xBqdu4=;
	b=VrI6nak3QB6Anbnt186+zdutsaq77AAb/F9qedymp9me/NICER8+HAGyLucWv+E/EP
	yRBVwO+dxWODgcGuVFYT8/OxKBjYc5vBVb8/953SLmMjq1tXe9JviwI4HjHtq9ZuUoXK
	jPuX6aSzNUmEcYsHRCa8tnnaw2EBv3R9bK/pzEKoc5pSFDkytDsPhqkX3V+NKUpVcYug
	z/P2AbKCJLN8LVU8IcjDYoxwFNHxNPlF4YFxn9yvcuHsm7mxnui5fUmX7wqQW4RyFP00
	fGEtbzq/iE72JrdkYRzsX/Gf7JVBx4J8LRGKGr8yY6EWxYSzLDKG8eodlZIMQbyi6M7s
	jFaw==
X-Gm-Message-State: AIkVDXITSlRAIIZBpEOjpWKQBHWcT9+yykSoO8JTNLYxMsiN0yRjyqTsb2Po2bC097OJLjdY
X-Received: by 10.28.93.68 with SMTP id r65mr7220482wmb.133.1486031340628;
	Thu, 02 Feb 2017 02:29:00 -0800 (PST)
Received: from localhost.localdomain (ip4da29576.direct-adsl.nl.
	[77.162.149.118]) by smtp.gmail.com with ESMTPSA id
	q4sm39024438wrc.35.2017.02.02.02.28.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Feb 2017 02:28:59 -0800 (PST)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Feb 2017 11:28:28 +0100
Message-Id: <20170202102828.19819-1-koen.kooi@linaro.org>
X-Mailer: git-send-email 2.9.3
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCH] gdb 7.12: fix armv8b build
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
X-List-Received-Date: Thu, 02 Feb 2017 10:29:02 -0000

Backport fix from GDB upstream to fix big-endian aarch64 build.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta/recipes-devtools/gdb/gdb-7.12.inc             |  1 +
 .../cb93dc7f262978bafe36397a41a56e409a302042.patch | 42 ++++++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-devtools/gdb/gdb/cb93dc7f262978bafe36397a41a56e409a302042.patch

diff --git a/meta/recipes-devtools/gdb/gdb-7.12.inc b/meta/recipes-devtools/gdb/gdb-7.12.inc
index 2faddc5..7eea65f 100644
--- a/meta/recipes-devtools/gdb/gdb-7.12.inc
+++ b/meta/recipes-devtools/gdb/gdb-7.12.inc
@@ -15,6 +15,7 @@ SRC_URI = "http://ftp.gnu.org/gnu/gdb/gdb-${PV}.tar.xz \
            file://0008-Use-exorted-definitions-of-SIGRTMIN.patch \
            file://0009-Change-order-of-CFLAGS.patch \
            file://0010-resolve-restrict-keyword-conflict.patch \
+	   file://cb93dc7f262978bafe36397a41a56e409a302042.patch \
 "
 SRC_URI[md5sum] = "a0a3a00f7499b0c5278ba8676745d180"
 SRC_URI[sha256sum] = "834ff3c5948b30718343ea57b11cbc3235d7995c6a4f3a5cecec8c8114164f94"
diff --git a/meta/recipes-devtools/gdb/gdb/cb93dc7f262978bafe36397a41a56e409a302042.patch b/meta/recipes-devtools/gdb/gdb/cb93dc7f262978bafe36397a41a56e409a302042.patch
new file mode 100644
index 0000000..a3f488a
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/cb93dc7f262978bafe36397a41a56e409a302042.patch
@@ -0,0 +1,42 @@
+From cb93dc7f262978bafe36397a41a56e409a302042 Mon Sep 17 00:00:00 2001
+From: Yao Qi <yao.qi@linaro.org>
+Date: Mon, 24 Oct 2016 10:59:11 +0100
+Subject: [PATCH] [GDBserver] Fix conversion warning
+
+I got the following warning if I build GDBserver for aarch64_be-linux-gnu,
+
+git/gdb/gdbserver/linux-aarch64-low.c:1539:39: error: invalid conversion from 'void*' to 'uint32_t* {aka unsigned int*}' [-fpermissive]
+   uint32_t *le_buf = xmalloc (byte_len);
+                                       ^
+The patch is to fix the warning.
+
+gdb/gdbserver:
+
+2016-10-24  Yao Qi  <yao.qi@linaro.org>
+
+	PR server/20733
+	* linux-aarch64-low.c (append_insns): Cast the return value to
+	'uint32_t *'.
+
+Upstream-status: Backport
+
+---
+ gdb/gdbserver/linux-aarch64-low.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gdb/gdbserver/linux-aarch64-low.c b/gdb/gdbserver/linux-aarch64-low.c
+index e54a8ba..ae80cdd 100644
+--- a/gdb/gdbserver/linux-aarch64-low.c
++++ b/gdb/gdbserver/linux-aarch64-low.c
+@@ -1536,7 +1536,7 @@ append_insns (CORE_ADDR *to, size_t len, const uint32_t *buf)
+ {
+   size_t byte_len = len * sizeof (uint32_t);
+ #if (__BYTE_ORDER == __BIG_ENDIAN)
+-  uint32_t *le_buf = xmalloc (byte_len);
++  uint32_t *le_buf = (uint32_t *) xmalloc (byte_len);
+   size_t i;
+ 
+   for (i = 0; i < len; i++)
+-- 
+2.9.3
+
-- 
2.9.3


