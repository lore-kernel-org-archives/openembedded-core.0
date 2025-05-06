Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5F07C3ABBC
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 15:14:25 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.78807.1746544461416315267
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 May 2025 08:14:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=PHRFFI7S;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2255003f4c6so61031685ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 08:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1746544461; x=1747149261; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v97+OY7rR0O083VD/Cg9JeHcjDQgniLgcwWVCsfp5Sk=;
        b=PHRFFI7SEbLfl3cGsnu6M4oQ5RzvY9ewRL99uIjh4/DMvy+0zKirJVIWm1xjApmZrA
         DvPwKX1gwv1CFTqW2u04qWdIQ7m1OcoQPmnQ46Q/Hh7mroiwgvR0Vh+6AZ5BeoP4485T
         nX38IdItQjCI4wgEn5xV00FoyIMbB8MgRUFTS8hF1bAwfjJzU30NSmdncHsRuD/Ve3N1
         QWUNzCNoFQbCYbUJqqZcI3iHmhECUxjxovvi58rfOHPYqE6lkSUaDZQ4/ZVoIILwa7l2
         YVKoFw2FOFKzVohARkgET3DYQAlha/v9xdHxqrv/AqR0jbWkbDXAEeDRchHu15LuZGy2
         qEKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746544461; x=1747149261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v97+OY7rR0O083VD/Cg9JeHcjDQgniLgcwWVCsfp5Sk=;
        b=h4P2R2DWbAz5vLDj23NzY72lIMNAYgfbRJk0VEi/JBeTLYlXpvolc8UUxXCRRuA3hj
         SqIMOZLwJl/92LU68LThj0dtw50+x+S0LMat9d5lGv56sFiwgoiV9Lenr2uDgtlsmbin
         dKTEsHA8L7KR6nVcloRzWWk5YBIAU3dg9A9RTxYNpYHdt1fFXU/qIFaGHfecb1wlIOYM
         CH6KXZkvRRqoRkXLUjb0qnt4CmLHSOLUod841w6yhJRxNIulvIPkPeMEyqMz6fmpBrg3
         s7rb+UTIr6tXGMGjTYxcXMfkRJV47duwa4trGUsIYeTh1MXFF63PrE1B6c4FzUihuWMf
         mzWw==
X-Gm-Message-State: AOJu0YysCSSyfmrPB9XHUvKKs/Z469SUeaFU9ZqvGLU6/cEb+rgAAsOt
	pPhhn5Ps3rDnM5chdK+rYzm1c/KN25W4HCkbC0ON0jGYRJwwQvm4gDP4I8f8BBufNxBX1oPeJy0
	6
X-Gm-Gg: ASbGncsg4UXM6TmjuxEZMS7YcPBWgET5DwZad3wqaAu9rCKwTBDapJqyhKkDdR1c9Gx
	2VxM+21vlL6+OyCDSNGt8RntTgnleTzoJbh7KjkPFk6oEHrLbPDPQrbkbVtQyuiLZT1aQ3O4BCF
	Mksd53RZ3XGq1qh11axMdd7Gw4Wmkk7ynUjeuLRJnjlrvLzM0Sg+Lau/YLveZLGqLbUQStLLhbo
	AVUJJGJncyPnpraJeBlo0d7G4YDeg6nlit2S3NGBQMtco/6QlsvItGdMYRbHTwpmzY+LeJ7sqzg
	zjd3VLwET72jiH2Gr7luAGDT6Wt587Ea
X-Google-Smtp-Source: AGHT+IGTKBw/iHhaMWrr6E6GGIIKrhzEH3UONE1Mh0JQVK0GJkX+Sb585ZOW8wKgS8EM7BZnnaLiSQ==
X-Received: by 2002:a17:903:234e:b0:224:26fd:82e5 with SMTP id d9443c01a7336-22e1038ea74mr269246665ad.48.1746544460685;
        Tue, 06 May 2025 08:14:20 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:8d37:c5d1:328a:ee43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1521fa58sm75222545ad.150.2025.05.06.08.14.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 08:14:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 7/7] bluez5: backport a patch to fix btmgmt -i
Date: Tue,  6 May 2025 08:13:59 -0700
Message-ID: <5961d8e42e89fad5a5465d686e3d7a3c5b271c58.1746544207.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746544207.git.steve@sakoman.com>
References: <cover.1746544207.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 15:14:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216064

From: Jeroen Hofstee <jhofstee@victronenergy.com>

Without this patch btmgmt will always use hci0 in
non interactive mode.

Signed-off-by: Jeroen Hofstee <jhofstee@victronenergy.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 ...ndex-option-for-non-interactive-mode.patch | 29 +++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/toolsbtmgmt-fix-index-option-for-non-interactive-mode.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 731bfa0e40..53d8644159 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -57,6 +57,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
            file://0001-test-gatt-Fix-hung-issue.patch \
            file://0001-adapter-Fix-up-address-type-when-loading-keys.patch \
+           file://toolsbtmgmt-fix-index-option-for-non-interactive-mode.patch \
            "
 S = "${WORKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/toolsbtmgmt-fix-index-option-for-non-interactive-mode.patch b/meta/recipes-connectivity/bluez5/bluez5/toolsbtmgmt-fix-index-option-for-non-interactive-mode.patch
new file mode 100644
index 0000000000..f4e14be146
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/toolsbtmgmt-fix-index-option-for-non-interactive-mode.patch
@@ -0,0 +1,29 @@
+From f00d5546c9e989dd68ce0de0190cd0e043b0f1f5 Mon Sep 17 00:00:00 2001
+From: Arjan Opmeer <arjan.opmeer@gmail.com>
+Date: Tue, 9 Jul 2024 13:55:41 +0200
+Subject: [PATCH] tools/btmgmt: Fix --index option for non-interactive mode
+
+In non-interactive mode the --index option does not work because the
+call to mgmt_set_index() is made after bt_shell_attach().
+
+Fixes: https://github.com/bluez/bluez/issues/893
+
+Upstream-Status: Backport [https://github.com/bluez/bluez/commit/f00d5546c9e989dd68ce0de0190cd0e043b0f1f5]
+---
+ tools/btmgmt.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/btmgmt.c b/tools/btmgmt.c
+index 9b7f851bd8..436c2bb21f 100644
+--- a/tools/btmgmt.c
++++ b/tools/btmgmt.c
+@@ -51,8 +51,8 @@ int main(int argc, char *argv[])
+ 		return EXIT_FAILURE;
+ 	}
+ 
+-	bt_shell_attach(fileno(stdin));
+ 	mgmt_set_index(index_option);
++	bt_shell_attach(fileno(stdin));
+ 	status = bt_shell_run();
+ 
+ 	mgmt_remove_submenu();
-- 
2.43.0


