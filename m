Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7341C677C4
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 19:38:39 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.96528.1749584315072715682
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 12:38:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=a9myqkFk;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7406c6dd2b1so206619b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 12:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749584314; x=1750189114; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AS/m67inTHt7YFn9ROWlOYyUO8vyBUDb5T0uaRXBwHw=;
        b=a9myqkFk5/kuUWQOvZwE0W3LMAh/C5vnu24ZCJThW0Qu/bvxGsXgQVftaUtGFuWnfa
         gSQxnnqGMDSn9/0v4ZMyyKQn6RgoYpsnY3hW/IydbQpH7HzcphP5/4qlg8k4A74JjyAh
         hwZ7tYX0GjfqVrcMJHaWAkQUr7qQocwGNKXGA/xXOvGiveknCHHtBUx+nv8/EF27vxlQ
         RpKNEJZFgvZYH5Uk/OU/oNAWq4nfDAyHQj4wrRWdA3Jcyx6f2h/QvTH3HzOqXLSq0sGz
         mj+TEW6FZ1uppSczSfdTw+kW1kayyUF174TVHkY0ym05+m+LeaCdBlJ8V2rv89FdcunV
         WbyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749584314; x=1750189114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AS/m67inTHt7YFn9ROWlOYyUO8vyBUDb5T0uaRXBwHw=;
        b=r6QZajyCft78tmZ+MLvz41GuzHlJsPcYvV8B9ADDsHb5l205WTHkwZ4Yt7Hmnv4QhR
         v5zxdTsl2wPeDbcvjC6IqCZm7GJjp30j3ZlobLav60uxgIaLRfuRG0/0OVKBpKWLICSI
         EHp19/tAFl3nUNUdzQULnYyEjsFgiJ0IPspB1xXEhXRloMJOaE8v70mh05YPjneYW7iz
         vBWPkNIfLdYCnaxYAPTCYTtqb7ixIHFzA32QzQM1yfFF0zK7viyBtBcZXdPFjJfst6ua
         8oxJx+ljlWub+CQdOne6t4j5Of7EggJ7ymWMtFx+mKuAAhUYahtH+EX5hkNI7U3QGFyQ
         Wz9g==
X-Gm-Message-State: AOJu0Yw8Ik/YqQGPbagJDO3zim37J2+t0TVJo96DCCfVuslA7ckAs8RH
	qjCxAbZrBIluaJfjrB9yihyX6SorqfGVlwH9hJc/82bca4Y7afISSL39yBFww3UxEnmx0MrDVd0
	DZNoU
X-Gm-Gg: ASbGncvaZdqIMnSh/xacp8HjqL+ALDJ7yICvCQckeGX6NUeoxnQwEbh+AaCohxZh33S
	CCbQI50CiLf1QN8LjaS10xK/E3bYJr2fyxHm6wThA1CFz3tNr1pjlvXiRWCqJvOGYn1II6QtzNp
	SgU8iO9J9pIoWu1NROIE/Uq2vM7Eekn4SoCy1LV+VgTqgbE8ydIT4kD4Nz/zIv8txRjnOjcNIMc
	I1aTIya+pNnv5QiXOwDNlOOgcPAqmQ0D9+XUtKfecwGplu3P/0BHxfy80XWssGBRR9ew4/ffckc
	NeSLquXJkWgt5P/lxa3AP26bSwn8u9U0KTRbzXlFkgzbkAnKWKELiQ==
X-Google-Smtp-Source: AGHT+IFQtsNgFAxM0UhnDk1PdUU1o7FpHa9ggRES8iYQwrGjNlFV9NXV/61heSPE4DrqSPhdGvAMcA==
X-Received: by 2002:a05:6a21:9212:b0:215:dacf:5746 with SMTP id adf61e73a8af0-21f86fb0d29mr768825637.19.1749584314276;
        Tue, 10 Jun 2025 12:38:34 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5f7827c0sm7198595a12.62.2025.06.10.12.38.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 12:38:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/15] taglib: fix CVE-2023-47466
Date: Tue, 10 Jun 2025 12:38:10 -0700
Message-ID: <bcf0102e0e9ecf55106eafcc4c2ad8b2e7ad762b.1749584149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749584149.git.steve@sakoman.com>
References: <cover.1749584149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 19:38:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218426

From: Jiaying Song <jiaying.song.cn@windriver.com>

TagLib before 2.0 allows a segmentation violation and application crash
during tag writing via a crafted WAV file in which an id3 chunk is the
only valid chunk.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2023-47466

Upstream patch:
https://github.com/taglib/taglib/commit/dfa33bec0806cbb45785accb8cc6c2048a7d40cf

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../taglib/files/CVE-2023-47466.patch         | 38 +++++++++++++++++++
 meta/recipes-support/taglib/taglib_1.12.bb    |  4 +-
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/taglib/files/CVE-2023-47466.patch

diff --git a/meta/recipes-support/taglib/files/CVE-2023-47466.patch b/meta/recipes-support/taglib/files/CVE-2023-47466.patch
new file mode 100644
index 0000000000..8ea8793e0a
--- /dev/null
+++ b/meta/recipes-support/taglib/files/CVE-2023-47466.patch
@@ -0,0 +1,38 @@
+From 41c1c2b3609fc542e357cc80185d90a9a6fccc1a Mon Sep 17 00:00:00 2001
+From: Urs Fleisch <ufleisch@users.sourceforge.net>
+Date: Sun, 5 Nov 2023 14:40:18 +0100
+Subject: [PATCH] Fix crash with invalid WAV files (#1163) (#1164)
+
+With specially crafted WAV files having the "id3 " chunk as the
+only valid chunk, when trying to write the tags, the existing
+"id3 " chunk is removed, and then vector::front() is called on
+the now empty chunks vector.
+Now it is checked if the vector is empty to avoid the crash.
+
+CVE: CVE-2023-47466
+
+Upstream-Status: Backport
+[https://github.com/taglib/taglib/commit/dfa33bec0806cbb45785accb8cc6c2048a7d40cf]
+
+Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
+---
+ taglib/riff/rifffile.cpp | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/taglib/riff/rifffile.cpp b/taglib/riff/rifffile.cpp
+index 005551f..f615e6c 100644
+--- a/taglib/riff/rifffile.cpp
++++ b/taglib/riff/rifffile.cpp
+@@ -361,6 +361,9 @@ void RIFF::File::writeChunk(const ByteVector &name, const ByteVector &data,
+ 
+ void RIFF::File::updateGlobalSize()
+ {
++  if(d->chunks.empty())
++    return;
++
+   const Chunk first = d->chunks.front();
+   const Chunk last  = d->chunks.back();
+   d->size = last.offset + last.size + last.padding - first.offset + 12;
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/taglib/taglib_1.12.bb b/meta/recipes-support/taglib/taglib_1.12.bb
index 47ad8aacb6..51e03888b4 100644
--- a/meta/recipes-support/taglib/taglib_1.12.bb
+++ b/meta/recipes-support/taglib/taglib_1.12.bb
@@ -9,7 +9,9 @@ LIC_FILES_CHKSUM = "file://COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c \
 
 DEPENDS = "zlib"
 
-SRC_URI = "http://taglib.github.io/releases/${BP}.tar.gz"
+SRC_URI = "http://taglib.github.io/releases/${BP}.tar.gz \
+           file://CVE-2023-47466.patch \
+          "
 
 SRC_URI[md5sum] = "4313ed2671234e029b7af8f97c84e9af"
 SRC_URI[sha256sum] = "7fccd07669a523b07a15bd24c8da1bbb92206cb19e9366c3692af3d79253b703"
-- 
2.43.0


