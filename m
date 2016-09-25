Return-Path: <bkylerussell@gmail.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id 70725600E2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Sep 2016 11:43:52 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id r145so9590611ior.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Sep 2016 04:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=42cRKHDL8F6WHeN0diVr3Jqmy38+faWH2QHDMead/D0=;
	b=XRtd9hyYER7d4aaOkRyq6uTbPV657yn1tsDlO0w0aGksU9jum/34boRZcEScd6AaDv
	RC2spWANHOzN+UbmLfvF6/SSHzxxvlAdKp0LZKarppKDOPlnZr5AvEUcFXjsbjYU2KxR
	4T2mDUgTMPVzM/yD6CjlpfiD4K3U0eAV9tIJkR+FiN8WWL9mKfPrzUBICpyLcyhMfDsr
	6fPyg2BrqFN11zO3h46cEV7jjVHkHY/l1dFaVdFe34cx9d23l8oXnV6U92KjtVwBVxbm
	n3PjcWYDhrhM9KiK/VskVZWG3muWS9l9G0su05v+V1keIwXmh3bo0UyS7UjcD47c2FeM
	dMJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=42cRKHDL8F6WHeN0diVr3Jqmy38+faWH2QHDMead/D0=;
	b=jyzRoTpr2ychlTUmb1KgzYqJOvPYqquY0xm1yO0oe02XRyUPmBQlLzn08yBHRB3OrR
	hbPE4SdPdM6KJG8mGNhuv8Rw8bqTEqSN+YCDvVuHIJ7NmBhG0p10VWj5Dqh1vI0iZmJ3
	k0ytOncukjwmVTfjrxs37w2QtuWRoAICL5fGFCBaivhpMpk9q99YiFfxWtDsNnIjTuwE
	JYWZdwqNOQIF3MM/78/dDt5pXYZV1bpQB3Ks5KKPZg55T7NrhOGN4XgEKVgTPeJT970R
	GXad4lMuAbwXV3P2dRpTx1jIZYtinQPIdVkAFM3XsNzZZ4esWFIMkhL7GPZovgWDlfHA
	27Og==
X-Gm-Message-State: AE9vXwOsxzmitAi9a4ffmCre4W+gtCfkbNri+nj44kPPDuKWi3pe3YoFzDttfhU3RWBRwQ==
X-Received: by 10.107.41.81 with SMTP id p78mr17461091iop.78.1474803834244;
	Sun, 25 Sep 2016 04:43:54 -0700 (PDT)
Received: from brrussell-Latitude-E6530.lexmark.com
	([2605:a000:1707:fb:f946:2bd9:6244:c21d])
	by smtp.gmail.com with ESMTPSA id u62sm6316670iod.6.2016.09.25.04.43.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 25 Sep 2016 04:43:53 -0700 (PDT)
From: Kyle Russell <bkylerussell@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 25 Sep 2016 07:43:32 -0400
Message-Id: <1474803812-9489-1-git-send-email-bkylerussell@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta][PATCH] bootchart2: Allocate space on heap for collector chunks
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
X-List-Received-Date: Sun, 25 Sep 2016 11:43:53 -0000

Nicer for embedded devices which may have smaller stack limitations.

Signed-off-by: Kyle Russell <bkylerussell@gmail.com>
---
 ...llector-Allocate-space-on-heap-for-chunks.patch | 45 ++++++++++++++++++++++
 .../bootchart2/bootchart2_0.14.8.bb                |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-devtools/bootchart2/bootchart2/0001-collector-Allocate-space-on-heap-for-chunks.patch

diff --git a/meta/recipes-devtools/bootchart2/bootchart2/0001-collector-Allocate-space-on-heap-for-chunks.patch b/meta/recipes-devtools/bootchart2/bootchart2/0001-collector-Allocate-space-on-heap-for-chunks.patch
new file mode 100644
index 0000000..7a8813e
--- /dev/null
+++ b/meta/recipes-devtools/bootchart2/bootchart2/0001-collector-Allocate-space-on-heap-for-chunks.patch
@@ -0,0 +1,45 @@
+From 09505532b49573663fb4ff4dad424dc2ef4c1f84 Mon Sep 17 00:00:00 2001
+From: Kyle Russell <bkylerussell@gmail.com>
+Date: Wed, 13 Jul 2016 17:30:00 -0400
+Subject: [PATCH] collector: Allocate space on heap for chunks
+
+Nicer for embedded devices which may have smaller stack limitations.
+
+Upstream-Status: Submitted [https://github.com/xrmx/bootchart/pull/74]
+
+Signed-off-by: Kyle Russell <bkylerussell@gmail.com>
+---
+ collector/dump.c | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/collector/dump.c b/collector/dump.c
+index e673b5b..2f094b4 100644
+--- a/collector/dump.c
++++ b/collector/dump.c
+@@ -184,12 +184,12 @@ static void dump_buffers (DumpState *s)
+ 	log ("reading %d chunks (of %d) ...\n", max_chunk, s->map.max_chunk);
+ 	for (i = 0; i < max_chunk; i++) {
+ 		FILE *output;
+-		char buffer[CHUNK_SIZE];
+-		Chunk *c = (Chunk *)&buffer;
++		char *buffer = malloc(CHUNK_SIZE);
++		Chunk *c = (Chunk *)buffer;
+ 		size_t addr = (size_t) s->map.chunks[i];
+ 
+ 		lseek (s->mem, addr, SEEK_SET);
+-		read (s->mem, &buffer, CHUNK_SIZE);
++		read (s->mem, buffer, CHUNK_SIZE);
+ 		/*      log ("type: '%s' len %d\n",
+ 			c->dest_stream, (int)c->length); */
+ 
+@@ -197,6 +197,7 @@ static void dump_buffers (DumpState *s)
+ 		fwrite (c->data, 1, c->length, output);
+ 		bytes_dumped += c->length;
+ 		fclose (output);
++                free(buffer);
+ 	}
+ 	log ("wrote %ld kb\n", (long)(bytes_dumped+1023)/1024);
+ }
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb b/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb
index fdebb64..4f01734 100644
--- a/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb
+++ b/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb
@@ -93,6 +93,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.\d+)*)"
 SRC_URI = "git://github.com/mmeeks/bootchart.git \
            file://bootchartd_stop.sh \
            file://0001-Fixed-Missing-default-value-for-BOOTLOG_DEST.patch \
+           file://0001-collector-Allocate-space-on-heap-for-chunks.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.7.4


