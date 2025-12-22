Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D47D4E69199
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:15 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87667.1766434085866063884
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eB2cXlZK;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b7ffa421f1bso932181466b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434084; x=1767038884; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0qcCuII9KORQdVqRxibiMaIM3YvRApVr500IY3nd7Ew=;
        b=eB2cXlZK6Q8dhmX6+stCAy4WcEyVdPKfV3bY5dVpjVClgSl2JMd88gtkCJZ5XYXLds
         VDs/Z0+G4onT9f2XLLodzD6HXPtTh2zTrCw7Dh31ikAxUUVAtHh4yS42sBv0paSucyb/
         Lcu/Y26BEyEoX71lGCWOnkLRnjOxH/mgqOsJ2RwRJyPvRyyzv8mJ2uPDIVDu3hjF6fVh
         ahpPWh5vY94qid6WmqPvq20nzxo4HMEJmUNlZTcDd+QeYiool1GH90Rln5sifXSgr3aw
         LrF+a9ktj7R+F6ygumBR8za3grQzFCTVfgUV/azGuIKBHgr814ReHk+39oIld6hPJSpw
         9xGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434084; x=1767038884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0qcCuII9KORQdVqRxibiMaIM3YvRApVr500IY3nd7Ew=;
        b=KmoJnqsrCrRdpeWdD7UVniLfbbl3PNbbGu+9B5eWjUnFV4YUaL+wuwc04gI/fnIByt
         lt4B+Zvh+u+7CBITLOtid7ptQRi5vnn5DbeMLLEYkGkByYkaCkeMCShxYZQYKK0E5/UX
         Oe4OT2uWnX7hIqMmhvey8Xzjog0ZvrjEYrHz/s/H0pQZSyHM9AxfvikBnbfW/jQxqyMd
         5qhB9ODR8gjw49sMi/bNyUecdr+Fixf87+JmwYQPOqU/f1z0pusiIGvshhldtrfTZrqr
         G+qTxpTE0TI+ooKNouHzlFxvfnAB4V9f46TM6MnDI/ZwFIc5x6v26l05f6oFobSxPGaU
         1SMw==
X-Gm-Message-State: AOJu0Ywc9U5AIcuw6nNI7rGL4QpefEozwGk/n5XtXNZFA2is0Zlvz6D1
	m35EIBQ1xM7p0/YGZVE5CEwPnZMBdK0aWO45XNqGmNEK2XThUUrswJjPTdwykw==
X-Gm-Gg: AY/fxX7PAX4suKfdwra4E4IyPbK1i2OyVMLzNKgZerWxYz1iWAlmgHhIGRxL5RdfHKW
	IGCHHHQrsE0KEsyDb6uVBU8jXhuiEOmx0ggDIVWF9qt1om/c6NvlvM8FtRquYgviQL1BRKaAoRE
	HMzGBPMe5BaaZTCETZU11AevSyL2mMKuox/YmbYentDJzPZw690RF6gAAZLWXG03unOn6zvvDnl
	IIS6AIMxc70z/EDeJEyo9J3xexRGUrJiGAxkMn4SnDkRMF/1nj8IbgBz5kWzZiYP/0nmtDDOPR3
	khXdCnQMEBP/I9pZBkbFFFXOX74EVm9Vj5hyM9ifEXmG8LmFzsIb/bKCkwijiEyi2sUW9kLeJ6p
	ZHMMyxfodLCL5brlIPcjqao8nJ2Ebwwr9Rvlr68LXGWZGynACiv2WNvcU9fI8cVNXTD4FtbGyxh
	0lFrzd+SSIMQ7Zt3aX27Tm5Q6dr8oARQbXKwTMzV0JCxpMsM8=
X-Google-Smtp-Source: AGHT+IERos1WHYN8FoVRxuLOfXQYXQgD8XIUL85HhGTR51p1gOrqWZ7J4Wm91X4AQjME6KhsyJ9Qsg==
X-Received: by 2002:a17:906:fd88:b0:b80:1108:42c with SMTP id a640c23a62f3a-b802043fc76mr1834607066b.12.1766434084056;
        Mon, 22 Dec 2025 12:08:04 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:03 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 025/114] kbd: upgrade 2.8.0 -> 2.9.0
Date: Mon, 22 Dec 2025 21:06:07 +0100
Message-ID: <20251222200739.2278706-25-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228350

From: Alexander Kanavin <alex@linutronix.de>

Backport a patch to address installation ownership issues under
pseudo.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ly-necessary-metadata-during-install.patch | 54 +++++++++++++++++++
 .../kbd/{kbd_2.8.0.bb => kbd_2.9.0.bb}        |  3 +-
 2 files changed, 56 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/kbd/kbd/0001-Preserve-only-necessary-metadata-during-install.patch
 rename meta/recipes-core/kbd/{kbd_2.8.0.bb => kbd_2.9.0.bb} (93%)

diff --git a/meta/recipes-core/kbd/kbd/0001-Preserve-only-necessary-metadata-during-install.patch b/meta/recipes-core/kbd/kbd/0001-Preserve-only-necessary-metadata-during-install.patch
new file mode 100644
index 0000000000..87275040c1
--- /dev/null
+++ b/meta/recipes-core/kbd/kbd/0001-Preserve-only-necessary-metadata-during-install.patch
@@ -0,0 +1,54 @@
+From d9d1c22592b6ce21bf455a22bca9000bf9b3fe61 Mon Sep 17 00:00:00 2001
+From: Alexey Gladkov <legion@kernel.org>
+Date: Wed, 10 Sep 2025 10:45:25 +0200
+Subject: [PATCH] Preserve only necessary metadata during install
+
+"cp -a" tries to preserve all attributes if possible. This implies
+preserving mode, any ACL, xattr permissions, and security context.
+
+In some cases (such as fakeroot), it is not possible to preserve that
+all attributes are preserved.
+
+  cp: failed to preserve ownership for /tmp/.pkgmk/pkg/usr/share/kbd/keymaps/i386/qwertz/sr-latin.map.gz: Operation not supported
+
+To avoid this, we will require that only the necessary attributes be
+preserved. It is important for us to preserve the simlinks.
+
+Signed-off-by: Alexey Gladkov <legion@kernel.org>
+Upstream-Status: Backport [https://github.com/legionus/kbd/commit/db82eb6f86e6c0b8ac4260e88b88d66e1cd7c077]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ data/Makefile.am | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/data/Makefile.am b/data/Makefile.am
+index a730062..4d2ae3d 100644
+--- a/data/Makefile.am
++++ b/data/Makefile.am
+@@ -44,21 +44,21 @@ endif
+ 
+ install-consolefonts: $(SRC_FONTDIR) $(SRC_PARTIALDIR)
+ 	mkdir -p -m 755 -- $(DESTDIR)$(datadir)/$(FONTDIR)
+-	cp -a -- $(SRC_FONTDIR)/* $(DESTDIR)$(datadir)/$(FONTDIR)/
++	cp -dPR -- $(SRC_FONTDIR)/* $(DESTDIR)$(datadir)/$(FONTDIR)/
+ 	mkdir -p -m 755 -- $(DESTDIR)$(datadir)/$(FONTDIR)/$(PARTIALDIR)
+-	cp -a -- $(SRC_PARTIALDIR)/* $(DESTDIR)$(datadir)/$(FONTDIR)/$(PARTIALDIR)/
++	cp -dPR -- $(SRC_PARTIALDIR)/* $(DESTDIR)$(datadir)/$(FONTDIR)/$(PARTIALDIR)/
+ 
+ install-consoletrans:
+ 	mkdir -p -m 755 -- $(DESTDIR)$(datadir)/$(TRANSDIR)
+-	cp -a -- $(srcdir)/$(TRANSDIR)/* $(DESTDIR)$(datadir)/$(TRANSDIR)/
++	cp -dPR -- $(srcdir)/$(TRANSDIR)/* $(DESTDIR)$(datadir)/$(TRANSDIR)/
+ 
+ install-unimaps:
+ 	mkdir -p -m 755 -- $(DESTDIR)$(datadir)/$(UNIMAPDIR)
+-	cp -a -- $(srcdir)/$(UNIMAPDIR)/* $(DESTDIR)$(datadir)/$(UNIMAPDIR)/
++	cp -dPR -- $(srcdir)/$(UNIMAPDIR)/* $(DESTDIR)$(datadir)/$(UNIMAPDIR)/
+ 
+ install-keymaps: $(SRC_KEYMAPDIR)
+ 	mkdir -p -m 755 -- $(DESTDIR)$(datadir)/$(KEYMAPDIR)
+-	cp -ar -- $(SRC_KEYMAPDIR)/* $(DESTDIR)$(datadir)/$(KEYMAPDIR)/
++	cp -dPR -- $(SRC_KEYMAPDIR)/* $(DESTDIR)$(datadir)/$(KEYMAPDIR)/
+ 	cd "$(DESTDIR)$(datadir)/$(KEYMAPDIR)"; \
+ 	  for f in $(IGNORE_KEYMAPS); do ! test -e "$$f" || rm -f -- "$$f"; done
+ 	rm -f $(DESTDIR)$(datadir)/$(KEYMAPDIR)/ppc
diff --git a/meta/recipes-core/kbd/kbd_2.8.0.bb b/meta/recipes-core/kbd/kbd_2.9.0.bb
similarity index 93%
rename from meta/recipes-core/kbd/kbd_2.8.0.bb
rename to meta/recipes-core/kbd/kbd_2.9.0.bb
index ababa09918..ae07979733 100644
--- a/meta/recipes-core/kbd/kbd_2.8.0.bb
+++ b/meta/recipes-core/kbd/kbd_2.9.0.bb
@@ -24,9 +24,10 @@ RPROVIDES:${PN} = "console-tools"
 RCONFLICTS:${PN} = "console-tools"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.xz \
+           file://0001-Preserve-only-necessary-metadata-during-install.patch \
            "
 
-SRC_URI[sha256sum] = "01f5806da7d1d34f594b7b2a6ae1ab23215344cf1064e8edcd3a90fef9776a11"
+SRC_URI[sha256sum] = "fb3197f17a99eb44d22a3a1a71f755f9622dd963e66acfdea1a45120951b02ed"
 
 # 'gzip -n' is set due to https://github.com/legionus/kbd/issues/124
 EXTRA_OECONF = "--disable-tests --enable-compress='gzip -n'"
-- 
2.47.3


