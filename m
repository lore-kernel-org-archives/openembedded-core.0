Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13038C7115A
	for <webhook@archiver.kernel.org>; Sun, 22 Jun 2025 15:02:42 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.27814.1750604555720903326
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Jun 2025 08:02:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xF887AXg;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-748e63d4b05so1903966b3a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Jun 2025 08:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750604555; x=1751209355; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tbWgZqHfS+F/5HoVasyb5ToWyi+szyBjs95mLy1EFkg=;
        b=xF887AXgcV6HpblwJ9qosG3lHMGRH7n9vNg+keOpWNwunIIPKbquaO+5QQE82txC/3
         QtWTl4bXhY6nrJ9dSKjG5zSDhFqpY5kDU4kLy2r0Sp/3Q0RkSQdP18iRGIDV7fiOacgM
         z5dgb8c2yuR3h2jlkG6SAFx0rJvsAtzmZFUhFWlBzJAfQrbNq8HHOAmoT5p1VbkG/oGu
         ktXVqquatEI6g5v4eFa9ncK5SzlcOwDvXsI/yZHMonAROPFL/ATWD50dK7vyKsryyHOx
         /v3jyxEd3y5gQZlpGEygBvXPwXsj7iHBFUBQNJ8k/HtZ69bi6wPPUqnwyz7gCQLImHLt
         kimg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750604555; x=1751209355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tbWgZqHfS+F/5HoVasyb5ToWyi+szyBjs95mLy1EFkg=;
        b=eKhTctg2DHc5j8EJ3IxrmzXPmyTbkgZd2giJIS13b6ZUj1WgB9trsLxWNhCV8Kax2O
         tpzDc4PF4sojSH8ijYVH2D3C0x0Z4ZcJJzKoahoLgo8YU7ZUn5YqlqNLWbKyKvR3tdc6
         DzAMZm8eAqXRerS8ExpbpTE/R2Ness05+SBqLrCYY1/lQTaChDbyUW/fO6ua+4i76Xak
         CpwImUnQcpcXlCACfQvYyKy7+a8qWy7hBvCCKFDTPiZsCwfqogBdv5JfSW+jdTP5tO4f
         meqhSOKY0FIUUK6qCG6yJCNCD8Zy07A/8dB0zrlno3G0XXAwQXK+ihunhO6I6OtUg5c/
         ztLg==
X-Gm-Message-State: AOJu0YzHfxU1mIzU2+azI6iFiF+qnYZL9tbLhG8u7VDvcksoFzaaRzR4
	5bf5GPRkIlMGJZEU5Pu1wt9Biq+9pe1wLmLITsK1XmU1WzJuL6rl6fkejkxtvg+jYF8WT8YPVIj
	4jWMhYXU=
X-Gm-Gg: ASbGnctwJuxwLXXyBrU3Ra74Xih3c1Hzc3v1ZBpc1lFM60lRkgwh8hICBJOtu6/w75d
	1MvtR3ftIQJnLmzHOo+IxTT69Qo6o6L77YbcrxGr2dt+cjgaIqcISmcHiWGX9AmWcV5j10yw0Ve
	6KYrJF5AsXqz+tfOBmPw07zuxJIP9vEN8SfiMkNlLPx+p8YbVWiUI3MhZ2e7z0zztQqDp/a0Vzx
	sHl+vVb5XAxZHVf6US9w0tnw4QaZjMZ0ceHH/eV9CZYj6+B2nULrMZoBKg2qiPv7v9EzyAH616J
	c31h+KGOkz00tZvlhpmK4rJqKhWki4orD4kvZfFEp87+Fxz9ysMAlp0A52U/FNyS
X-Google-Smtp-Source: AGHT+IFQKSSz/6x3wu4R+5i8843Jw69jUrWr0wbGZ6TI3RIIcAfcvS/KlZ479ZCCdIJrox5SqRHmgw==
X-Received: by 2002:a05:6a00:13a4:b0:749:4cd:108e with SMTP id d2e1a72fcca58-7490d6618ebmr10745824b3a.10.1750604554875;
        Sun, 22 Jun 2025 08:02:34 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4a75:9ad8:d661:8bd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a46eb71sm6222521b3a.22.2025.06.22.08.02.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 08:02:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/14] libsoup-2.4: fix CVE-2025-32907
Date: Sun, 22 Jun 2025 08:00:03 -0700
Message-ID: <e6d9dd16d9b70cc8d3a9ca8b2fc542d547b456b9.1750604257.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750604257.git.steve@sakoman.com>
References: <cover.1750604257.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Jun 2025 15:02:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219186

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/428

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-32907.patch  | 39 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.2.bb             |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32907.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32907.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32907.patch
new file mode 100644
index 0000000000..41dd3ff3f4
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32907.patch
@@ -0,0 +1,39 @@
+From 8158b4084dcba2a233dfcb7359c53ab2840148f7 Mon Sep 17 00:00:00 2001
+From: Milan Crha <mcrha@redhat.com>
+Date: Tue, 15 Apr 2025 12:17:39 +0200
+Subject: [PATCH 1/2] soup-message-headers: Correct merge of ranges
+
+It had been skipping every second range, which generated an array
+of a lot of insane ranges, causing large memory usage by the server.
+
+Closes #428
+
+Part-of: <https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/452>
+
+CVE: CVE-2025-32907
+Upstream-Status: Backport
+[https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/452/diffs?commit_id=9bb92f7a685e31e10e9e8221d0342280432ce836]
+
+Test part not applied since test codes use some functions not in this
+version
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-message-headers.c |   1 +
+ 1 files changed, 1 insertions(+)
+
+diff --git a/libsoup/soup-message-headers.c b/libsoup/soup-message-headers.c
+index 78b2455..00b9763 100644
+--- a/libsoup/soup-message-headers.c
++++ b/libsoup/soup-message-headers.c
+@@ -1024,6 +1024,7 @@ soup_message_headers_get_ranges_internal (SoupMessageHeaders  *hdrs,
+ 			if (cur->start <= prev->end) {
+ 				prev->end = MAX (prev->end, cur->end);
+ 				g_array_remove_index (array, i);
++				i--;
+ 			}
+ 		}
+ 	}
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
index 11552df80a..38307fa3d5 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
@@ -38,6 +38,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32052.patch \
            file://CVE-2025-32053.patch \
            file://CVE-2025-4969.patch \
+           file://CVE-2025-32907.patch \
           "
 SRC_URI[sha256sum] = "f0a427656e5fe19e1df71c107e88dfa1b2e673c25c547b7823b6018b40d01159"
 
-- 
2.43.0


