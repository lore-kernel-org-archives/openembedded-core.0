Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17741C71134
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 16:09:08 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.91277.1749571740476786512
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 09:09:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zY1dJPy7;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-23636167afeso12668645ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 09:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749571740; x=1750176540; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K0gWXw5a4WG+2PfgGlYw8nxvbB7aV0dJZKycEaN+V/0=;
        b=zY1dJPy7ACnKuyIpUraOsbSNCw6HDw80IbXNBxG29QaDzL7JBF70oM/OeLym7LDzXj
         PIS4tb4zkPIUOfbY2p6E9ewoULQlECnzuRMGXrrmPzQWvkR3/IjkzK9xqR69XqhkjVPV
         J0p9tuuqzPIjezbYv8IU1Kdbxhf6FBOujrHC4pMf8DtSaJOtNpzoN1lvdCS4OZqVgyFF
         9gpdbmWyQvZPq54ULVLFbfGH/7Z+P2qlXB9S7lq7/tKONIKI9NC+78rILcKBq1yVLxUG
         lm/dW/6Sxk1NGi+WEZ9AYua4XJfG4DKv6jduAWpRCeZ/MvLkm+z+FqICUMasPetNWaoc
         BdWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571740; x=1750176540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K0gWXw5a4WG+2PfgGlYw8nxvbB7aV0dJZKycEaN+V/0=;
        b=t079vx4dn39OvFYZoMfOgW0P828BDfee6YIQ+7lgXXVFcf7QOdrfoMw0ZIWKwbmZjb
         NnV28i6n6YUJOwaY/kc0oIcMLIWiB/A3lCOIqMLaDlgTqWDzA88g04NviK5c7goB79dl
         aTNfqXV1jIN/MKeRWWmKq3UGBqQJ/BWarRYApACddQ20+/v3w3+HEKurq4wcCnzEOlcU
         e6Ticpnzpt+jS1YNGkkqjj3Fs42m50zuggGFDmUP3y8Z1Bw4LDup2izeRWIr4oyiwm1w
         qXVX/RsAiIJO0vuct7yjIbM/AP/GZs9hMOYKTwNtKYzsLfKJUx03nh6Y0Bk3R3ExETPx
         /7sQ==
X-Gm-Message-State: AOJu0YzclPFWf+DxVKFOuyg4W657tR2cdvMS/MNoPpflCgHUkEgHYvLt
	+GuALhTE+l4b1/Eb+mOzy6zmM+8/8czgwXZ71y30SBMG/kHDMaiZMiN6xG6+uyvxRdOtiUVnzh0
	wb9HG
X-Gm-Gg: ASbGncsmEp6ISSFOCMG9AwTPIs6629EVdZcLerw6Ol4rjzqQjVA8LH448NGBKOhKvc3
	bicf6BS3/zs3o5sEY4jaQpU3iyyz7Cb++syBDEH1MXTwCvoJx+WkAhkLuoaFtufGtjtH22tz8lg
	uaCP5BbIZPbhv1OZarakIAswaRorrVrf9xXAfinZRXJtCP5KIHxALPanmzhDDGESkU+6/S1LANr
	3Pxu/kYr/eyMfncTDx1hY30BCYFqe/qMgfor4yWsJwzeLXV5XmVc1QEqBnW8dSl3dMryzof/9+n
	c8YBKDvZOrftLSH/KZVk5HNixSIlnKCAm+JS/EE2qfkdTBi2W+8I9g==
X-Google-Smtp-Source: AGHT+IGKtC5ScNmaYC5IrxOXNUPJje0chL34KQ3u/UGLAwekN0mg0ICxaNI+zBZfUBxKT4uLF7S/PQ==
X-Received: by 2002:a17:903:1b4e:b0:235:779:edf0 with SMTP id d9443c01a7336-23601dec500mr251817345ad.50.1749571739655;
        Tue, 10 Jun 2025 09:08:59 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236034056e7sm72597295ad.166.2025.06.10.09.08.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 09:08:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 06/32] libsoup-2.4: fix CVE-2025-32914
Date: Tue, 10 Jun 2025 09:08:19 -0700
Message-ID: <1b3ed35fe9afa00987f64415a43ae9ed4f53e7f3.1749571556.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749571556.git.steve@sakoman.com>
References: <cover.1749571556.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 16:09:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218375

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/450

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-32914.patch  | 35 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32914.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32914.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32914.patch
new file mode 100644
index 0000000000..9f3bb21a25
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32914.patch
@@ -0,0 +1,35 @@
+From ac844b9fc7945c38ea21fb7cf1a49a5c226d7c9c Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Mon, 12 May 2025 16:17:20 +0800
+Subject: [PATCH] Resolve "(CVE-2025-32914) (#YWH-PGM9867-23) OOB Read on
+ libsoup through function "soup_multipart_new_from_message" in
+ soup-multipart.c leads to crash or exit of process"
+
+CVE: CVE-2025-32914
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/450/diffs?commit_id=5bfcf8157597f2d327050114fb37ff600004dbcf]
+
+Test code are not added since some functions not aligned with version
+2.74.3
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-multipart.c |  2 +-
+ 1 files changed, 1 insertions(+), 1 deletion(-)
+
+diff --git a/libsoup/soup-multipart.c b/libsoup/soup-multipart.c
+index a7e550f..dd93973 100644
+--- a/libsoup/soup-multipart.c
++++ b/libsoup/soup-multipart.c
+@@ -181,7 +181,7 @@ soup_multipart_new_from_message (SoupMessageHeaders *headers,
+ 			return NULL;
+ 		}
+ 
+-		split = strstr (start, "\r\n\r\n");
++		split = g_strstr_len (start, body_end - start, "\r\n\r\n");
+ 		if (!split || split > end) {
+ 			soup_multipart_free (multipart);
+ 			soup_buffer_free (flattened);
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index 79ffa19c20..7c1de29fd5 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -21,6 +21,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-2784.patch \
            file://CVE-2024-52530.patch \
            file://CVE-2025-32906.patch \
+           file://CVE-2025-32914.patch \
 "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.43.0


