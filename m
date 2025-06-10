Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2D23C71135
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 19:34:39 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.95770.1749584079238304082
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 12:34:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=v6ERyNRm;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-31329098ae8so170840a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 12:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749584078; x=1750188878; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wUMXU8bKC6jc5d/v6/sTjrHlWpiSMBY5stw13AqwoaQ=;
        b=v6ERyNRmInRJ0nhrfhpdFrLgRZ0vfvhm3HiE/urzKeCHM5o0ytYdCm3Ixqz3yjvmM2
         CeUMBT3cr7apSJArzHNo4nk/1GSAL2zR9nKM6X/maGwBUp6Ql4yzVcCzuiPZFjviQ4bT
         EKd+VObv8GK/ruChWwP6wu3sh/sDdI4umEhIcdIR74fvXcOU/QKWm/jY4aBDuebyps/6
         q+0pbC/ATUH99F1HwSDsanakO8TDjKY/Wo9ovXGdvc/70dWDErcbrsMKbk2fDn3dfnd0
         KUYAa9Exfft1dVgZSXw6n9ZiXNb/U7k02REtGDojHPD2/2nlZN410uESPDmtjEdxvNEZ
         BNAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749584078; x=1750188878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wUMXU8bKC6jc5d/v6/sTjrHlWpiSMBY5stw13AqwoaQ=;
        b=gJXbow4fY+OekNpBkY52oIhfCHZXctYOHfk8NhIxqxMz7Qtd+jI6Coop1aKx7N5o2J
         4gJp6Tf90JkTQv3qsBAjOY69HfO+RGS3rm3F16ELtUGAwZh69vmpt5nCXW/EKPTVD4E3
         VuWmto8GUlteQm9bVTP0BUPpQMXtAYh7FX1IcYrctx6glUJJxgyXwz8QddFkdzmWgqeY
         oKl5A2FWzLyfEMtX1KHHeOh2SJjWmsgVuwaQLpzDiqtQg6jexDOWLITZ7BstYliqjwx9
         UoZ7fKwZ5OrMxigr05EQiAQwVxkYoB3AsBGHrw84mAgvHdFlb7WRyqVchCpvDYpJYc0T
         qKNw==
X-Gm-Message-State: AOJu0YzZ28cNqEcdrpVzFcN48yNUTKjrOadBKgCcx4IisRbhSNYmqUCm
	b50qwJbhpDi4OISQgakNI5CRwKNCQb+/HFsjPV7zqqTR8L6luRkHaaVzb6SzYH8QUVsjrXR0D4i
	29M66
X-Gm-Gg: ASbGncuSsZwEgfLK5QcbNyCfPXoCBPO7pTgk+TW/r01URfx1cGjaQsQO7zeHZolWNm1
	DJJS+pj5zmeJfX5BbkzlGBmUmfBjcmnFV9VI4nSu8KmYCCC9OOo5Vmyj2H2U4TXKa47lATLUL4P
	EpGlALdZhpCBZhnnrEatyHPNIiZ0sTOhAez3Bg/6roQcBMtXTxyllWedYhHUvpl7z+e5BRhIxN6
	46QmliGMNvRRhE/tqhkYnyROpzNBDsIVR9Ua4/D2QAvap5d8AvUi8UAzYoT0AUjSY2k7d88ej2P
	kiNgZ9UtV1yhQZ5akT91iK2R90lv1pWqDQJg7WROvYmEVe0bd0ytrJO+OlvKUrAm
X-Google-Smtp-Source: AGHT+IHYf0Txq+68JiLH6IB0JZkaV2nXcYpKXBPe5iquhUC3oInyOtgq6DBJVgHhowisUI1yIQFsXA==
X-Received: by 2002:a17:90b:5403:b0:2fa:1e56:5d82 with SMTP id 98e67ed59e1d1-313af98de56mr708507a91.17.1749584078424;
        Tue, 10 Jun 2025 12:34:38 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313b10c7a88sm73897a91.33.2025.06.10.12.34.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 12:34:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/16] libsoup-2.4: fix CVE-2025-4948
Date: Tue, 10 Jun 2025 12:34:03 -0700
Message-ID: <b4fb5cd0d3385989842ad5a84d34cf451679c59a.1749583904.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749583904.git.steve@sakoman.com>
References: <cover.1749583904.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 19:34:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218413

From: Changqing Li <changqing.li@windriver.com>

Refer:
http://gitlab.gnome.org/GNOME/libsoup/-/issues/449

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-4948.patch   | 38 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |  1 +
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
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index 4a00dafe47..5c834e394a 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -37,6 +37,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32052.patch \
            file://CVE-2025-32050.patch \
            file://CVE-2025-46421.patch \
+           file://CVE-2025-4948.patch \
 "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.43.0


