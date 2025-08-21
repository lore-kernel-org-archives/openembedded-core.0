Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A6F5CA0EFA
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 22:43:35 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.2528.1755816214488899034
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 15:43:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N670lUkW;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-61c1a0cd60aso362352a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 15:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755816213; x=1756421013; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7VbKVRKRbwORqCUKn7c5+r3k25uXxoBqOLC5wBOBBxs=;
        b=N670lUkWrquaEsdGJFJdVPXg5qEtc/94ApiHBCCo7fheknCTIOL8AB/Cw5ozwlKX53
         oZma8T9tQASFMh4s2Eh5FrD41t+dCTrZqCBB+FJc6ds43qVPIdve46J13GNclbCOiFLc
         b/N6DGKg7Fs9uLr6B0JTxm/nKHNo0dglK3gh+UlN8rz6Fs8Hr4sC1rG5IcoLQiK20XII
         S7qAwXmwtvK7ArJul0Qc75od3cljj3HhYb+N5byyyxxnOyeWkkuxoeW56oF7f+ZCbdMD
         4WpqZz4MdJhoGvEusZCOAzN5fZP7bx3ADQZzUhvki6g2tbs7C86NyeBtHPqByjCtu2dN
         yc9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755816213; x=1756421013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7VbKVRKRbwORqCUKn7c5+r3k25uXxoBqOLC5wBOBBxs=;
        b=um3HfbD0hjSn20addlM4zJNYkFTcqvcI0mwkJhumOYftpbC5PO3vmAN/IZyDlbW7Mh
         Kn/mN4/1CWe/PSumfanqe6MWptGQ1BN5I0XEwmCxFQO5/AfYOaoJrPzKuiENFK7Nd9xj
         7pB5W46x1QkR/P6C2X/Bm02q8RD2SVYejVJWKF6CFGkFU1SQhwY3OfCNOP6KTK1YyPY/
         7hGwauzrB71o/WF4kRv89uWEc6Y6c1ggL+lmIAL4Shgi9jl+Tm5GNsQTWGmvcC7pf8Lu
         f8nNmvJHp2aOaXjC5dF2oworfxinWkIFLxe5wIIDDUWmf5nqllTn5HD5/msy110lf981
         n6sQ==
X-Gm-Message-State: AOJu0Yy6AsKh7RkN1szjgVagGghLqmqycdEGvyeT4DdCv4C2cgn9lPoV
	K/kHNJTqazFAS92JBnnu1t2jD8jKYKuVfSh5QT7eafovjqVA4qxcTpN1SwfoZw==
X-Gm-Gg: ASbGncuhLFjXBXmyTTvM1akmXj0MyEY8EFQPbTN8eGi1GA5VXZeYgjfujPwZ0ntYQ8a
	eYaS5EGYzTyeNGQbUYMC9XBNRL8aKER8lsViYvDl5xb6uZW0wSi2GBHb0YYtG7yk9uEhClNQwfX
	uMHGixzexS01VKiZ1kaWHR1dcbu9sQA6TF6mPlyUQ5NbZO9nYlrs+i1zIK1aSEUDNts29jWACfm
	ybMZOQ7W3B+8AWUlx8UlTfuy6ZRukW6DuOCgPC1zFiJT8RW6MFjJi4ViucqDJP2P/lKBIy9RbiO
	P+ZqDlH1xxr6YMox0BbG3N8+x3x9UdHT3yDpYgW2/jBdV/ifzJmEm9GknIxC56uoBzj61TwM8c0
	PUzzpFTul4riAr8dQV9wSocd1uffTSrdXcl6g9h+ox9eHXVVXM0FctEkC
X-Google-Smtp-Source: AGHT+IG68M74E+FwYc5BmdAOv3ytuHY3JqO7+o61IBbyhFWDK2HpC73A6NSeFD+daM95bHu58Qzwfg==
X-Received: by 2002:a17:907:7ea0:b0:af9:6e4a:3b55 with SMTP id a640c23a62f3a-afe294da3c0mr74203966b.40.1755816212736;
        Thu, 21 Aug 2025 15:43:32 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-afe0051f99asm290615366b.80.2025.08.21.15.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 15:43:32 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [scarthgap][PATCH 13/15] dbus-glib: fix build with gcc-15
Date: Fri, 22 Aug 2025 00:43:07 +0200
Message-ID: <20250821224314.1690103-13-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250821224314.1690103-1-martin.jansa@gmail.com>
References: <20250821224314.1690103-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 22:43:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222298

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../dbus-glib/fix-build-with-gcc-15.patch     | 37 +++++++++++++++++++
 meta/recipes-core/dbus/dbus-glib_0.112.bb     |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-core/dbus/dbus-glib/fix-build-with-gcc-15.patch

diff --git a/meta/recipes-core/dbus/dbus-glib/fix-build-with-gcc-15.patch b/meta/recipes-core/dbus/dbus-glib/fix-build-with-gcc-15.patch
new file mode 100644
index 0000000000..bf3fcd5b86
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus-glib/fix-build-with-gcc-15.patch
@@ -0,0 +1,37 @@
+From 8c32bc9fa67513f46199bc31498dc1fecbb611bb Mon Sep 17 00:00:00 2001
+From: Simon McVittie <smcv@collabora.com>
+Date: Thu, 13 Mar 2025 14:19:28 +0000
+Subject: [PATCH] dbus-gvalue: Avoid using the reserved word 'bool'
+
+This is reserved in C23 for the equivalent of `<stdbool.h>`.
+
+Bug-Debian: https://bugs.debian.org/1096507
+Signed-off-by: Simon McVittie <smcv@collabora.com>
+Upstream-Status: Backport [https://gitlab.freedesktop.org/dbus/dbus-glib/-/commit/8c32bc9fa67513f46199bc31498dc1fecbb611bb]
+igned-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ dbus/dbus-gvalue.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/dbus/dbus-gvalue.c b/dbus/dbus-gvalue.c
+index 534e90a..788e360 100644
+--- a/dbus/dbus-gvalue.c
++++ b/dbus/dbus-gvalue.c
+@@ -545,11 +545,11 @@ demarshal_basic (DBusGValueMarshalCtx      *context,
+     {
+     case DBUS_TYPE_BOOLEAN:
+       {
+-	dbus_bool_t bool;
++	dbus_bool_t b;
+         if (!G_VALUE_HOLDS (value, G_TYPE_BOOLEAN))
+           goto invalid_type;
+-	dbus_message_iter_get_basic (iter, &bool);
+-	g_value_set_boolean (value, bool);
++	dbus_message_iter_get_basic (iter, &b);
++	g_value_set_boolean (value, b);
+ 	return TRUE;
+       }
+     case DBUS_TYPE_BYTE:
+-- 
+GitLab
+
diff --git a/meta/recipes-core/dbus/dbus-glib_0.112.bb b/meta/recipes-core/dbus/dbus-glib_0.112.bb
index 4acf435694..7312897dd3 100644
--- a/meta/recipes-core/dbus/dbus-glib_0.112.bb
+++ b/meta/recipes-core/dbus/dbus-glib_0.112.bb
@@ -13,6 +13,7 @@ DEPENDS:class-native = "glib-2.0-native dbus-native"
 SRC_URI = "https://dbus.freedesktop.org/releases/dbus-glib/dbus-glib-${PV}.tar.gz \
            file://no-examples.patch \
            file://test-install-makefile.patch \
+           file://fix-build-with-gcc-15.patch \
 "
 SRC_URI[md5sum] = "021e6c8a288df02c227e4aafbf7e7527"
 SRC_URI[sha256sum] = "7d550dccdfcd286e33895501829ed971eeb65c614e73aadb4a08aeef719b143a"

