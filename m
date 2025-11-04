Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1465ACCF9E3
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 04:34:30 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11041.1762230861111743361
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 20:34:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YbGOLOoK;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b9a5b5b47bfso1343835a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 20:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762230860; x=1762835660; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hqgn4pgbRjUljwzrNqES0T3oAzQObarvcBowsr9mKVA=;
        b=YbGOLOoK7nNhBYlrcajJ90Hgc+h6UhLT//DeezhHccURUcBLXKHy2NdntDAKL3KTy2
         lpoRVDT42IA0JQzwLxF86pdVNDKXr+6NqqH8vNdyfKoN5PWtlkQTIEFhFbUkccqQkSDw
         d9Qaave0+HOdiVF342Rx+9Hoy5JV0slz+VvKN3JV2/fINL8KG5f1ee9vqa5ne/mzinDQ
         /mkhdAjgW/BR8zc41sWfQ4gomv0v7RB/a7rA6tCKYs/lrbU8aESJLemBqL1e0gv7PbxH
         lIyd+RTqMibcF1034vJgzfsePlKoKqq6SVsa27frUYc5eNOBXxypAFvbkdYrYJFD/NJ9
         1Twg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762230860; x=1762835660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hqgn4pgbRjUljwzrNqES0T3oAzQObarvcBowsr9mKVA=;
        b=ZKZ+LPb47FpD6hKdyIF6/f/UMBvNSGyHVZXP0v0FHFZNy3BgZ0bRt7gtF/n3z2MG9o
         3SjmlHZyWQMGrTuwGdzJtBH4l0OS5ERyyYKDREx103xEXOr9wMqul44wrrU4aM686Xi1
         JVxafZMM0O8Hq9so+jmYGeWWqRvwqFHq045FaGS7TSRiU4493VUYV22QJO/RU2OEf8CH
         zBvPvgrsxf1qF0QYf3vqd+d+M79C00i9+A4g19Ul4LG/ZD/+2zhbRyiMr79yK1iJ0Zka
         jlXw1eVSrjNDYB9I9XEJLhKvk6IQqiCex4bsBES2P+wa/lW/BADqE04DBpysbZHxLSWh
         ksKw==
X-Gm-Message-State: AOJu0YyhhhdgVKZ1PlDfEJChWIDCe8kqLcZXQ/5wTOpxP5/iprqzOtil
	LNZl0GPD/3ar5q6EgSgqeg4uubEu2wkbkIEX/O2Jv7x7l6zERrywEVk0Sej6nrz2
X-Gm-Gg: ASbGncsnRf8pY8NhZ+T0gQ1WI00gBQIrMfHxkGSs3jLAUrmgzWesHx50z75I7Bq4K0n
	QzOvARz5IFr0q9fbcHLEk8NSOqanSVWKsryg59WlqnMzRn9UuWQ4jRDx+MedGu6/2BR4w2MxyJ6
	/UlkDk8glvf0LyF+DKKhMTKdQlI/BPAWCWoS3ylDbAcDyCeEUAwVurF6S2kO0DA6T9zgcmu5xST
	VgYhjlW33AaJvqs5fXEe5gw43tBnXNBaSQAEcjY9mhO2WA/15ru/0ZlEmS8bKA43eEgSY9AgXxW
	MwjnpzNq/Cifo7IB+iZYHpl9XNNmIPSQaukLfzbXfbYtJ34sk0eS5o0rCVjc1YK9OHrTdsfF+87
	8YpHvcddk510Eua1jtvACbCOwjThlKkwgqHyh+72TTkQMMGJdd+uHd23yOEuWWf84X/Kje8rjc2
	4w+YMm771hFSU+jg==
X-Google-Smtp-Source: AGHT+IFISNvdoUz401cutTIbTBQQEOwPXRFoOwqotckeTcuR4eaWnrdEctMqYQOdQAXkMDRzA2+cmQ==
X-Received: by 2002:a17:902:e543:b0:295:64ed:849f with SMTP id d9443c01a7336-29564ed8764mr126833605ad.23.1762230860282;
        Mon, 03 Nov 2025 20:34:20 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601a74214sm9147025ad.97.2025.11.03.20.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 20:34:20 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH v2 3/4] libevdev: upgrade 1.13.4 -> 1.13.5
Date: Tue,  4 Nov 2025 17:34:05 +1300
Message-ID: <20251104043406.1086244-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104043406.1086244-1-ankur.tyagi85@gmail.com>
References: <20251104043406.1086244-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Nov 2025 04:34:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225709

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
- sync event codes with kernel 6.16
- change the bit to shift to ULL
- sync headers with kernel 6.17

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libevdev/{libevdev_1.13.4.bb => libevdev_1.13.5.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libevdev/{libevdev_1.13.4.bb => libevdev_1.13.5.bb} (87%)

diff --git a/meta/recipes-support/libevdev/libevdev_1.13.4.bb b/meta/recipes-support/libevdev/libevdev_1.13.5.bb
similarity index 87%
rename from meta/recipes-support/libevdev/libevdev_1.13.4.bb
rename to meta/recipes-support/libevdev/libevdev_1.13.5.bb
index 3ff64bd04b..a42bd38489 100644
--- a/meta/recipes-support/libevdev/libevdev_1.13.4.bb
+++ b/meta/recipes-support/libevdev/libevdev_1.13.5.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=80c550b3197bcb8da7d7557ebcc3fc46 \
                     "
 
 SRC_URI = "http://www.freedesktop.org/software/libevdev/${BP}.tar.xz"
-SRC_URI[sha256sum] = "f00ab8d42ad8b905296fab67e13b871f1a424839331516642100f82ad88127cd"
+SRC_URI[sha256sum] = "89918ae7b7c13936e6482604a77a2bfbbb74544c5d039fde01c3fa1bdf639987"
 
 inherit autotools pkgconfig
 

