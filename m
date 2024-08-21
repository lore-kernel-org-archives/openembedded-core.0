Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2984C5472C
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 12:50:43 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.18866.1724244637303776790
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Aug 2024 05:50:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=tE6pLmkm;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-70d28023accso4878375b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 05:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1724244636; x=1724849436; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sWfqdwuqT3PXvfYs1OWWaLZMfp8HRdH9BmrvbBP0Cqs=;
        b=tE6pLmkmApTieXgCewQIlwhTaMsOtEiOIoQbtWK80+/3BGFhcfBBnkZqFToKn/ENAQ
         YV/OtsiNRoxuiimefBBpa5+6P9od1arTLz+v0cJ8M+/W5zKlodMoLswlQ8pBkGnaVpK1
         CQP3fmiecmBEmZjwqmd3LIAHR8oiZP0XhmXOoItS373hTZfFtQMn+7ggllVD53grPuSa
         1n8SIxg5Q68BIToYRum3tRwbA1V8LPLCXPu4P8CYo8oYoqBK4mAI0sgyIS5lWKxPaLoh
         bG3lJ+XhLZ9GZf1/kdcZzsm62aVTW9s/Hooc6iAjWY1M/rS9RJgrB22LncmpNhzS5J1H
         U49g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724244636; x=1724849436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sWfqdwuqT3PXvfYs1OWWaLZMfp8HRdH9BmrvbBP0Cqs=;
        b=KmfH8t8FXUUAbeZS3x4YOOue0FDTQREtYoaeWNryQrW/yZB9pGEWU1XwvRo2Gxw8jV
         rnkWY/JJ1bYO3nSTCecnn/gAAt3/KHz0uB3j8bHkR2c3CJ3VI4nAedN/JMmLTIC0/kYS
         u3xRCe8m0uoxvccIxxislbS9jHRyEFIB6wyWUrjp2vhORucq+7EEUctClIIJcogQ1/T1
         1tCPwoP5ZOvRj0cRAOj58eahd9okHXpNMQeArSJ+5/tCYemH949k6eRFaJkeDeQUO0Dw
         UsgAsWHNqtmSgfB9Zk7DxeC2Mfjwk4nxTeoA6tNe+6YFXLs4ce2uKkrwD1Fsx7Nywoq4
         s7Kg==
X-Gm-Message-State: AOJu0Yxu0ytj2lKEQcNnDHztfo99q5ahMkyrrUju0cMDOnvB7EVZd+el
	M5G9rQGb3SJu7qI9MROQua8qQJCBzb9zdZ2PvyxrGAU77kDrmq1FwameXej8A/QtAlSRKDeV5Bt
	eSis=
X-Google-Smtp-Source: AGHT+IEvbjO3c58YL29UwEeGVViygDjNozFUe6daymooDOnmNzQhuhfBGqhPf22cqWQ+hdY4tztPZw==
X-Received: by 2002:a05:6a00:9a9:b0:70d:265a:eec6 with SMTP id d2e1a72fcca58-714234c08a3mr2889314b3a.13.1724244636349;
        Wed, 21 Aug 2024 05:50:36 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7142a8a481dsm691789b3a.36.2024.08.21.05.50.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 05:50:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/18] ruby: Backport fix for CVE-2024-27282
Date: Wed, 21 Aug 2024 05:50:12 -0700
Message-Id: <1103182ac9ae5139a5c3d7381007f61c1f7d91a6.1724244509.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1724244509.git.steve@sakoman.com>
References: <cover.1724244509.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 12:50:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203589

From: Ashish Sharma <asharma@mvista.com>

Upstream-Status: Backport [https://github.com/ruby/ruby/commit/989a2355808a63fc45367785c82ffd46d18c900a]

Signed-off-by: Ashish Sharma <asharma@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ruby/ruby/CVE-2024-27282.patch            | 28 +++++++++++++++++++
 meta/recipes-devtools/ruby/ruby_3.2.2.bb      |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-27282.patch

diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-27282.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-27282.patch
new file mode 100644
index 0000000000..dde7979278
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-27282.patch
@@ -0,0 +1,28 @@
+From 989a2355808a63fc45367785c82ffd46d18c900a Mon Sep 17 00:00:00 2001
+From: Hiroshi SHIBATA <hsbt@ruby-lang.org>
+Date: Fri, 12 Apr 2024 15:01:47 +1000
+Subject: [PATCH] Fix Use-After-Free issue for Regexp
+
+Co-authored-by: Isaac Peka <7493006+isaac-peka@users.noreply.github.com>
+
+Upstream-Status: Backport [https://github.com/ruby/ruby/commit/989a2355808a63fc45367785c82ffd46d18c900a]
+CVE: CVE-2024-27282
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+
+ regexec.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/regexec.c b/regexec.c
+index 73694ab14a0b0a..140691ad42489f 100644
+--- a/regexec.c
++++ b/regexec.c
+@@ -3449,8 +3449,8 @@ match_at(regex_t* reg, const UChar* str, const UChar* end,
+     CASE(OP_MEMORY_END_PUSH_REC)  MOP_IN(OP_MEMORY_END_PUSH_REC);
+       GET_MEMNUM_INC(mem, p);
+       STACK_GET_MEM_START(mem, stkp); /* should be before push mem-end. */
+-      STACK_PUSH_MEM_END(mem, s);
+       mem_start_stk[mem] = GET_STACK_INDEX(stkp);
++      STACK_PUSH_MEM_END(mem, s);
+       MOP_OUT;
+       JUMP;
+ 
diff --git a/meta/recipes-devtools/ruby/ruby_3.2.2.bb b/meta/recipes-devtools/ruby/ruby_3.2.2.bb
index 5c2b07e5e4..f1aff315b7 100644
--- a/meta/recipes-devtools/ruby/ruby_3.2.2.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.2.2.bb
@@ -34,6 +34,7 @@ SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            file://CVE-2023-36617_1.patch \
            file://CVE-2023-36617_2.patch \
            file://CVE-2024-27281.patch \
+           file://CVE-2024-27282.patch \
            "
 UPSTREAM_CHECK_URI = "https://www.ruby-lang.org/en/downloads/"
 
-- 
2.34.1


