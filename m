Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C904C7EE2E
	for <webhook@archiver.kernel.org>; Sun, 22 Jun 2025 15:02:42 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.27816.1750604558839552977
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Jun 2025 08:02:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=bw2w1eFN;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-747c2cc3419so2252756b3a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Jun 2025 08:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750604558; x=1751209358; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vldijVURK8bjd5smqrrrfGC7EqyKyZtxSEq+H83TDLI=;
        b=bw2w1eFN3+HNYCIcOgWPssqIO/YHygEF2W66Hv3FaKZg6EMrtJjYZtKqrtO7Pap7zt
         WPXhryzOtLujF5E8wOPsFmQlbaIM9nhrbDM3PyUqLubKku/7szKNS/x+NqkBnQ5n9Qva
         VTPEPydwkHTA98kDaPMZa5MgFQFmlGOypz8GUPybD0BR71DIXt9lmWZsvbzuO0KJtbiU
         1yo9KXcbki73Q9bzIP3p2MmMM9sbg0UzDC6sEOLPcwUmAbW3d2cNlWu9O8GEZbfD3+ox
         IQBr/FUtn7dKPxBEITip/vlTcY8KhMf5DDwra53KC4nqhM/l6Rcg0SGMW8qh+etmIzB8
         m2dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750604558; x=1751209358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vldijVURK8bjd5smqrrrfGC7EqyKyZtxSEq+H83TDLI=;
        b=pGl5MXwwpMBNI5/ga03PjI6njiOT0PcsvTuEa9g1KpY+irwqJK+K07pBmeMQX43517
         2OVXgjlhnewCLyz+k4tvTFWncsFFcJqftSB4c/9CFI030BQWnkTfHV+eXjrMmNpBJg/e
         VOjEaEZYLkj7SxtiPw6P2UhXvfw99UIxiqv0VguCaa9AxdTuG9N5QRj2ncjoLrcS193m
         ZNgens6AhFtgDSbvSqimOr5qCEWZb95wu4WndDQIN0Ig+v5RHFARFcnSQIrB2JEImOqY
         ja6kfdN+Yw3R2wAAsX+pSWdxXibj3KAxKjhoLlLE7fR/i3Hue43psc0TJ1X2U9/N1zKK
         0B/w==
X-Gm-Message-State: AOJu0YyfJqB53Kg4SSgf+KkDR/S8K8rnaOjH7eg57dGs3DjqmFoMNW6e
	qeLA0yowueflFnXKp7yc7Xe9PuaHJydYWApfU3YBPwD8rhrSu4oHtPdZ7lWHrq4rD9HyfNw1M9S
	42cIbhSQ=
X-Gm-Gg: ASbGncsQFX1jqqiRQwzvjPYSyizxkW2mG3Gn4s+4sRw2nZ4m9IDEmbvHe91lrAuc+wd
	6t0wdmHrRqpQS+6S4BBNbhngiVu/xQAxxt+CFLOD9t7v/5dmGW+zsT9l/CRieIb+yXtqGfMrKnz
	2gmCXYlIKZwCs6nBs7C+w7DI2MyCRfM2cjXRK8U77i3l/CUdKvZcmsRsnEcLKbioTj6F5+PgzzM
	jxGO4d7kyEOwkwPcyCfZj5iezPSjFYsSQ9nt58GTdHpQLnyTH+p6L9VmnJKrUeM5UuIm+bDEdRV
	eAd1TYWJQVSnzcLrPb0erp/YOpj9WhPKVU765QtTO0rCNIxZYpIqGA==
X-Google-Smtp-Source: AGHT+IFtHKpNEXvzAvlb1xNxonFYu3Ld8AwM8lkvezQjojP+1zef2rrYTW58mp3WA5obOnzVhcmMsw==
X-Received: by 2002:a05:6a00:2450:b0:736:50d1:fc84 with SMTP id d2e1a72fcca58-7490dabc137mr13245666b3a.21.1750604557940;
        Sun, 22 Jun 2025 08:02:37 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4a75:9ad8:d661:8bd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a46eb71sm6222521b3a.22.2025.06.22.08.02.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 08:02:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/14] libsoup-2.4: fix CVE-2025-4948
Date: Sun, 22 Jun 2025 08:00:05 -0700
Message-ID: <d5af0295d26f8967dfe49a53ffa6f275e249d087.1750604257.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750604257.git.steve@sakoman.com>
References: <cover.1750604257.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Jun 2025 15:02:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219188

From: Changqing Li <changqing.li@windriver.com>

Refer:
http://gitlab.gnome.org/GNOME/libsoup/-/issues/449

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-4948.patch   | 38 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.2.bb             |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4948.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4948.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4948.patch
new file mode 100644
index 0000000000..b15b8c763d
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4948.patch
@@ -0,0 +1,38 @@
+From dfdc9b3cc73e6fe88cc12792ba00e14642572339 Mon Sep 17 00:00:00 2001
+From: Milan Crha <mcrha@redhat.com>
+Date: Thu, 15 May 2025 17:49:11 +0200
+Subject: [PATCH] soup-multipart: Verify boundary limits for multipart body
+
+It could happen that the boundary started at a place which resulted into
+a negative number, which in an unsigned integer is a very large value.
+Check the body size is not a negative value before setting it.
+
+Closes https://gitlab.gnome.org/GNOME/libsoup/-/issues/449
+
+Part-of: <https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/463>
+
+CVE: CVE-2025-4948
+Upstream-Status: Backport
+[https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/463/diffs?commit_id=f2f28afe0b3b2b3009ab67d6874457ec6bac70c0]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-multipart.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libsoup/soup-multipart.c b/libsoup/soup-multipart.c
+index dd93973..ce2fc10 100644
+--- a/libsoup/soup-multipart.c
++++ b/libsoup/soup-multipart.c
+@@ -214,7 +214,7 @@ soup_multipart_new_from_message (SoupMessageHeaders *headers,
+ 		 */
+ 		part_body = soup_buffer_new_subbuffer (flattened,
+ 						       split - flattened->data,
+-						       end - 2 - split);
++						       end - 2 >= split ? end - 2 - split : 0);
+ 		g_ptr_array_add (multipart->bodies, part_body);
+ 
+ 		start = end;
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
index 347fe1aa21..aa2903030d 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
@@ -40,6 +40,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-4969.patch \
            file://CVE-2025-32907.patch \
            file://CVE-2025-46421.patch \
+           file://CVE-2025-4948.patch \
           "
 SRC_URI[sha256sum] = "f0a427656e5fe19e1df71c107e88dfa1b2e673c25c547b7823b6018b40d01159"
 
-- 
2.43.0


