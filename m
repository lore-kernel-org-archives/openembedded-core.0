Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 431D1106288E
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 12:29:34 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20258.1773232171327340003
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 05:29:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=axaaCNYD;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4852fdb36a8so50063245e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 05:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773232169; x=1773836969; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CJUbWaK6rkrcV9OcBK7ciV+/JW4XqAfF3uDGhQ0K/G8=;
        b=axaaCNYDr0biWqC7UgMglmTlOlellFiGYA7Yr0+GUOux3YIs3jzuPO/bxuZPp2TQki
         +k5FI6YTU0p/Vfn/l1apeGp+e7iJJ4q49HuSPjfYlWxqpMOACvu547DR6bwq/OLZJNnU
         qeIx5arfgotsRRI+u/N4185iwWv9jFKZuYU0+28uZFfX/16hWk+eapR1ZP0QiTGh5el5
         wZ7qzzOjO7EePrtBRKAtjo/QsyBzlyGDWa4EA2SdivaHJDYVaoV5GV4V1d0b80aolMma
         AddRG2/bWoWCNg+xkJNEiHpi69pJGFn2MmmWK4FfjJoCs7jDU2UFfSeTLN/HOonAQepV
         x/5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773232169; x=1773836969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CJUbWaK6rkrcV9OcBK7ciV+/JW4XqAfF3uDGhQ0K/G8=;
        b=ElCEf8DCvmqgFlaKcNkvw1SK9rO3TLKXh+AhxFiT56W6YmvXeSCGB2PgvgZ2ZQBBKG
         c+5sTrPoIhyZ8FoyNuFwvfqkcMXjMnhaCIsBx1NxduHDKgdWAoPrti8ak/5b1zRG1753
         JnL6FD0GCvJMzGuUdhraUQobB+mLJ3ElIUaemPm2tmCWdwse4+DV0H0oAib2uM1whhiU
         uHbblfUYdUZnplY/P/QAzRAe8FAApiTEFuh1UnzqFw4p6ZS5iiG2+5AXQLrsErJaAaIl
         ltKJXNUxryr3oBL9Rh91hE8hBrMJ7aAmPbNR6NYfdtN9Z3rxLuEvrZciJxLqXVTgSpIU
         MQWw==
X-Gm-Message-State: AOJu0Yx4Wd8oAZ5dNYaE4CijUGqS8Kzg65988an88SMzATMnKFkueU6+
	zONgsU1TjHBj5XG/PNGwiLUe1ublna+TSPw/NsZspTSUyBOcqcqgAyEB/YD1/g==
X-Gm-Gg: ATEYQzzap+rZl+zxKi6qN2hUaZKBz3RGZt1QhMplq2CVj+xJIxr36xTiFsazJ1SztJg
	0CAWykIT1eQHUOdDK2JbmZdyqC1tlFUfjlfhyFzH+dzQKyqvMi/iJIWy2t9BuQtebF+pXLGX/p3
	RwIY+U7/ZrnpmOZBd7Stl/E/K/lY/MpCuyAJ+bb3ca/Xf2lt8es3DdVD7Vms+x/FYEhTxgQy2s9
	IJSZL8b+rx73LE33tMWmaxxIbWZV4nLwz9Br2aC1WU2XGUTJDfD+xvnQGkDTqdq3ooVnKxzOCEz
	HN6eGs7YrOLbqxNH5Hap8mnMGUjzXXdR6ze0a9q7kt1UgbCK7L5ApsNmU8WJhXiHnLRNJCzpdsi
	u2mEjKHYzePHS41uyBy+RakMce35sqDe4X1a+KkujzhIEWJ6J+Fmvon2isBQ7XNNR17sBIIj50t
	d7m/Y3H6jKvlXYGJNRX01BUkidy/j6TWv28h83r8yxpMbOG5ocrS571w==
X-Received: by 2002:a05:600c:8b45:b0:485:40db:d40c with SMTP id 5b1f17b1804b1-4854b0cbcd0mr33478875e9.3.1773232169460;
        Wed, 11 Mar 2026 05:29:29 -0700 (PDT)
Received: from fedora (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854ad5ee37sm39671515e9.2.2026.03.11.05.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 05:29:29 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH 4/4] gtk4: Fix a build error in examples/application8
Date: Wed, 11 Mar 2026 13:29:22 +0100
Message-ID: <20260311122922.4160133-4-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260311122922.4160133-1-zboszor@gmail.com>
References: <20260311122922.4160133-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 12:29:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232875

Add a backported patch from master to use underscore instead of
space in a generated filename. This fixes the build error:

| /usr/bin/ld: cannot find examples/application8/exampleapp8.p/meson-generated_.._exampleapp8: No such file or directory
| /usr/bin/ld: cannot find resources.c.o: No such file or directory

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 ...-t-use-space-in-meson-generated-file.patch | 34 +++++++++++++++++++
 meta/recipes-gnome/gtk+/gtk4_4.20.3.bb        |  2 ++
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-gnome/gtk+/gtk4/0001-application8-Don-t-use-space-in-meson-generated-file.patch

diff --git a/meta/recipes-gnome/gtk+/gtk4/0001-application8-Don-t-use-space-in-meson-generated-file.patch b/meta/recipes-gnome/gtk+/gtk4/0001-application8-Don-t-use-space-in-meson-generated-file.patch
new file mode 100644
index 0000000000..2a79fc637d
--- /dev/null
+++ b/meta/recipes-gnome/gtk+/gtk4/0001-application8-Don-t-use-space-in-meson-generated-file.patch
@@ -0,0 +1,34 @@
+From d26453923a21de0d908af3bf83c69263aaee5705 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?=
+ <zboszor@gmail.com>
+Date: Wed, 11 Mar 2026 07:02:10 +0100
+Subject: [PATCH] application8: Don't use space in meson generated filename
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+All other example apps use underscore, examples/application8
+has a build error:
+
+| /usr/bin/ld: cannot find examples/application8/exampleapp8.p/meson-generated_.._exampleapp8: No such file or directory
+| /usr/bin/ld: cannot find resources.c.o: No such file or directory
+
+Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gtk/-/merge_requests/9627]
+---
+ examples/application8/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/examples/application8/meson.build b/examples/application8/meson.build
+index f2e1d7cea9..77987d554a 100644
+--- a/examples/application8/meson.build
++++ b/examples/application8/meson.build
+@@ -1,4 +1,4 @@
+-app8_resources = gnome.compile_resources('exampleapp8 resources',
++app8_resources = gnome.compile_resources('exampleapp8_resources',
+   'exampleapp.gresource.xml',
+   source_dir: meson.current_source_dir())
+ 
+-- 
+2.53.0
+
diff --git a/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb b/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb
index ef9a05f7fe..0cca44fb5c 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb
@@ -35,6 +35,8 @@ LIC_FILES_CHKSUM = " \
 
 SRC_URI[archive.sha256sum] = "2873f2903088a66c71173ea2ed85ffae266a66b972c3a4842bbb2f6f187ec153"
 
+SRC_URI += "file://0001-application8-Don-t-use-space-in-meson-generated-file.patch"
+
 S = "${UNPACKDIR}/${GNOMEBN}-${PV}"
 
 CVE_PRODUCT = "gnome:gtk"
-- 
2.53.0


