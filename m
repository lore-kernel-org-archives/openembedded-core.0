Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4243DE77180
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 14:08:11 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.20314.1734012490486915898
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Dec 2024 06:08:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=XacubqLk;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2ee50ffcf14so1524889a91.0
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 06:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1734012490; x=1734617290; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rYIpv+KSh1Honqji24K0LJuAzhFMX6i97a4Wtx352y8=;
        b=XacubqLkIKGDadQumy/p+NwL7SFOibnO9OwtYgqDLxuyOziSYljUfxdklWUlHbDWcj
         cuirfxpFSvvTQSkg/GLfj9lZ1tjH4MjfnOg4EIkMcwNp023uta3veJZov/+BoCbaF4A0
         fnAzk5jk67cF6kjsEhHDzjS3/ovGvDRez/C1sAS7twdxqiFFaPU1gwUpb4odEcT6i82Z
         aLRaYEOM6b5shw1bQa/dEfTz0ag4jOJ8NUq+gC5ZmD1jUESrWfm2G/4rbOeL9M/3jYwO
         LB1VJfwAg5tU+PTZC23LauYk+j+EoYnIDxsh1QrSdYXT1p6jVdC6oGo/ipkKBPT1aDkt
         mMDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734012490; x=1734617290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rYIpv+KSh1Honqji24K0LJuAzhFMX6i97a4Wtx352y8=;
        b=qXB6RMbO/SUZFC/QutDkAZ9Fw+Of8wvC6KrY8/ku/yEBM3dErsGReruNy1aXpggLnG
         Y3zNUPNoP/HgxPpVNh1/MUl/pwkNCTMbQT3wx7W6dYjG1RG7H0NGf61XwJ2jx7IWDurJ
         OvT5NJH8O09c7Rr7rvSFuVXxglVi6AdNrXBWiz2xZ9WxMdn35Hmkj6eYLztDFAGttaZM
         5zJ0vllWvk8/b8QjcBB0oYhJwQNbZRNtaT0MYTp6wveXD5HYdEoGSC2sUwHEdksRmOkr
         Qo2yIcUQl+VU16/4DPl0eLrAiuiKUckkkD+0mMfh49osqq1Y2k0ji8OTyJszjajdlgjE
         c1SA==
X-Gm-Message-State: AOJu0YxRaZ/ee0RlfsaZ/FwdalSjQuAq7lEb40htlyyOUp7fj0dScgV+
	ywz9wgbqwSPfTWxzVMwB9Ba+8y3p+IqOpGPp8jxhh1D0fqaaUCYGlR8g2YEkGEsS3X1KKgg4hPF
	2
X-Gm-Gg: ASbGncvwQeBAPkFYHWbVR+M/LUbj33B+dUhoOmFM5/SHTEP1WPfiMXLJAe71Iz6wA6h
	9AWCc51Y2qqnKlMWI8zjYb2DYjJJTcqcsILYfqPgpMSwG25PYjgP1GrgYDTHhFYgG8xXloAkxJE
	w5/XVCfZ91Uxpe3kh5Yq90MMRRBFAwXm73OxB4XcfWrg6cdT7UUSi/3vYg/x56YX82QOVUx8JN4
	DVxQ0E8y8RSpTHS3M+c62UDvY42ppozncZ3CDqj47pqwQ==
X-Google-Smtp-Source: AGHT+IF5AF4V43tGW7jGVZdFW92KZTLiE6+Ov7Y2b0pz8BI47jBgwoi1hM8lFLoW2BSFcOMjSBvmEA==
X-Received: by 2002:a17:90b:1810:b0:2ef:ad48:7175 with SMTP id 98e67ed59e1d1-2f13ac98c80mr4946767a91.15.1734012489125;
        Thu, 12 Dec 2024 06:08:09 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21630fee27bsm88847705ad.269.2024.12.12.06.08.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 06:08:08 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 03/12] libarchive: fix CVE-2024-48957 & CVE-2024-48958
Date: Thu, 12 Dec 2024 06:07:49 -0800
Message-Id: <4f6a2eea1476bc7be1d55b6b6051c4b65d4d97fa.1734012352.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1734012352.git.steve@sakoman.com>
References: <cover.1734012352.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 14:08:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208637

From: Hitendra Prajapati <hprajapati@mvista.com>

Backport fixes for:

* CVE-2024-48957 - Upstream-Status: Backport from https://github.com/libarchive/libarchive/commit/3006bc5d02ad3ae3c4f9274f60c1f9d2d834734b
* CVE-2024-48958 - Upstream-Status: Backport from https://github.com/libarchive/libarchive/commit/a1cb648d52f5b6d3f31184d9b6a7cbca628459b7

(From OE-Core rev: 8b520c3cea136591128f6601718c23334afd7a55)

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libarchive/CVE-2024-48957.patch           | 36 +++++++++++++++++
 .../libarchive/CVE-2024-48958.patch           | 40 +++++++++++++++++++
 .../libarchive/libarchive_3.7.4.bb            |  5 ++-
 3 files changed, 80 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2024-48957.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2024-48958.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2024-48957.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2024-48957.patch
new file mode 100644
index 0000000000..98877cf72c
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2024-48957.patch
@@ -0,0 +1,36 @@
+From 3006bc5d02ad3ae3c4f9274f60c1f9d2d834734b Mon Sep 17 00:00:00 2001
+From: Wei-Cheng Pan <legnaleurc@gmail.com>
+Date: Mon, 29 Apr 2024 06:53:19 +0900
+Subject: [PATCH] fix: OOB in rar audio filter (#2149)
+
+This patch ensures that `src` won't move ahead of `dst`, so `src` will
+not OOB. Similar situation like in a1cb648.
+
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/3006bc5d02ad3ae3c4f9274f60c1f9d2d834734b]
+CVE: CVE-2024-48957
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ libarchive/archive_read_support_format_rar.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/libarchive/archive_read_support_format_rar.c b/libarchive/archive_read_support_format_rar.c
+index 79669a8..95a91dc 100644
+--- a/libarchive/archive_read_support_format_rar.c
++++ b/libarchive/archive_read_support_format_rar.c
+@@ -3714,6 +3714,13 @@ execute_filter_audio(struct rar_filter *filter, struct rar_virtual_machine *vm)
+     memset(&state, 0, sizeof(state));
+     for (j = i; j < length; j += numchannels)
+     {
++      /*
++       * The src block should not overlap with the dst block.
++       * If so it would be better to consider this archive is broken.
++       */
++      if (src >= dst)
++        return 0;
++
+       int8_t delta = (int8_t)*src++;
+       uint8_t predbyte, byte;
+       int prederror;
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2024-48958.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2024-48958.patch
new file mode 100644
index 0000000000..de266e9d95
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2024-48958.patch
@@ -0,0 +1,40 @@
+From a1cb648d52f5b6d3f31184d9b6a7cbca628459b7 Mon Sep 17 00:00:00 2001
+From: Wei-Cheng Pan <legnaleurc@gmail.com>
+Date: Mon, 29 Apr 2024 06:50:22 +0900
+Subject: [PATCH] fix: OOB in rar delta filter (#2148)
+
+Ensure that `src` won't move ahead of `dst`, so `src` will not OOB.
+Since `dst` won't move in this function, and we are only increasing `src`
+position, this check should be enough. It should be safe to early return
+because this function does not allocate resources.
+
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/a1cb648d52f5b6d3f31184d9b6a7cbca628459b7]
+CVE: CVE-2024-48958
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ libarchive/archive_read_support_format_rar.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/libarchive/archive_read_support_format_rar.c b/libarchive/archive_read_support_format_rar.c
+index 95a91dc..4fc6626 100644
+--- a/libarchive/archive_read_support_format_rar.c
++++ b/libarchive/archive_read_support_format_rar.c
+@@ -3612,7 +3612,15 @@ execute_filter_delta(struct rar_filter *filter, struct rar_virtual_machine *vm)
+   {
+     uint8_t lastbyte = 0;
+     for (idx = i; idx < length; idx += numchannels)
++    {
++      /*
++       * The src block should not overlap with the dst block.
++       * If so it would be better to consider this archive is broken.
++       */
++      if (src >= dst)
++        return 0;
+       lastbyte = dst[idx] = lastbyte - *src++;
++    }
+   }
+ 
+   filter->filteredblockaddress = length;
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.4.bb b/meta/recipes-extended/libarchive/libarchive_3.7.4.bb
index da85764116..6e406611f9 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.4.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.4.bb
@@ -30,7 +30,10 @@ PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd,"
 EXTRA_OECONF += "--enable-largefile --without-iconv"
 
 SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz"
-SRC_URI += "file://configurehack.patch"
+SRC_URI += "file://configurehack.patch \
+            file://CVE-2024-48957.patch \
+            file://CVE-2024-48958.patch \
+	"
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
 SRC_URI[sha256sum] = "7875d49596286055b52439ed42f044bd8ad426aa4cc5aabd96bfe7abb971d5e8"
-- 
2.34.1


