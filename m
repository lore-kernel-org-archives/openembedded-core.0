Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C26EC35FFB
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 04:39:01 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.4272.1742272736822482794
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 21:38:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TDtW8B6y;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-224341bbc1dso95530895ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 21:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742272736; x=1742877536; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YuJt1g/9ppwR1m/5BtS6hGuBR2Z96SDqB5DNVxB93qg=;
        b=TDtW8B6yP1UHvm+uYrN7kOobDa5VzsVmNHiR0QTXWsVKLiioqkXFwINrNTtg32b/6k
         WJXA4SSF7j8wL3IRh/t5BC0PPHMCPFq9jBUQ1DmPa80Ig8y/5RY0C5M4bD7Jf3JgSuCc
         +bW1o5CJuYpRHbqCxrq5sYFmsYb53bMBCWKSFVz7hsuXM7Bm7+ZcEabTXd8up+ESCs46
         slR6BVEmEDiHti7/H3NF8jf6yPDECBvorqHVpiu19ee/ecJbWlskj4qsvvWcdSzWEED4
         GwKmVc1K/mJxEgppPIUd1nYukUoUIUzx0oL01bAaIativtaLMDzsUgew/g3n9ycYrrUG
         60qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742272736; x=1742877536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YuJt1g/9ppwR1m/5BtS6hGuBR2Z96SDqB5DNVxB93qg=;
        b=seP75Aao6kwl8GIWWRQTFsPHSq4XbwVq100+XDX/JwGRHySfOVh/h3LCCVw2lsqh5V
         blbvhF6GI6xZ2mYNUiP3ogJm4hM8oEUwCN4oTgjuepQ9rs5E535zAJbW3LdlfuQqPuh/
         /jtzPEp2RvSEfHEfJFCMB9HIkgedHCDXFAGju6bEqdItKY3NU46W+Z4oBB/geP5mYv3b
         RB9xZMojsuNyGb5iaZieYP7Bi84wmVD9Gm6EOCvI7OjA0aptRWPdC5vDYFHLCmKYNAJb
         UexgIOtFihkIhgZHq0zDoZjcyWdsx+RaQJxkAigUCs8396upBOZURi8XE5EJfZNg1KxX
         B+4Q==
X-Gm-Message-State: AOJu0YxE5/5Ue0UFU/6aFNsTh3OBWwpvYOF5f/WnBDpqszn6bim/yWVE
	8xwKcBegAwj4RUTdiKGapVnmwrOuiTSC3toF4hEC10UtdBzBrXbQbDuU75r7
X-Gm-Gg: ASbGncuZCkq3+MacE+gd1VGMSCt3Myn5RMqn584q1yaifyfYEFNjEPu0K4NfBU3JgeQ
	v7MpDGK+d/LbQl2SzwVMvM8P1IGcO4xAhM36l1mDEp88+kHGRDSWp4d5J5ndhUnmzOzo+Fi8fOi
	t7Q6Mx3aNhNQvhr490ezktNmZiAzHb1OhrffhfV78wijwmskajxgsPuflBz9W1zxWYqP+9HLsJY
	QuPlN7q9azYsdK+3YujCSmblmTEbVrRjA7x57/U628QozRN2l1hTgOXxMbazNkj+5F49mZnorlb
	JJyk0X9tgP738BYqduNKcq9FqpKJUnjKv707
X-Google-Smtp-Source: AGHT+IE0fDa2pkckxsdOg6Z0U3ji8gXaw5X7mHvzSO3+XyIOcpek4tT+BDE6ocm1xK5ysov5YJ7wDQ==
X-Received: by 2002:a17:903:1664:b0:225:abd2:5e39 with SMTP id d9443c01a7336-2262c583437mr27326675ad.30.1742272735847;
        Mon, 17 Mar 2025 21:38:55 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bbc8c6sm84112375ad.160.2025.03.17.21.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 21:38:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 07/24] bluez: Fix build with GCC-15
Date: Mon, 17 Mar 2025 21:38:27 -0700
Message-ID: <20250318043846.2422141-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250318043846.2422141-1-raj.khem@gmail.com>
References: <20250318043846.2422141-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 04:39:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213141

gcc-15 switched to -std=c23 by default:

    https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=55e3bd376b2214e200fa76d12b67ff259b06c212

As a result `bluez` fails the build as:

    src/shared/ad.c:1090:24: error: incompatible types when returning type '_Bool' but 'const char *' was expected
     1090 |                 return false;
          |                        ^~~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  3 +
 ...-shared-ad-fix-std-c23-build-failure.patch | 34 +++++++++++
 ...ared-shell-fix-std-c23-build-failure.patch | 34 +++++++++++
 ...tt-helpers-fix-std-c23-build-failure.patch | 58 +++++++++++++++++++
 4 files changed, 129 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-shared-ad-fix-std-c23-build-failure.patch
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0002-shared-shell-fix-std-c23-build-failure.patch
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0003-shared-gatt-helpers-fix-std-c23-build-failure.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index d31f4e2295e..d6268721037 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -70,6 +70,9 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
            file://0001-test-gatt-Fix-hung-issue.patch \
            file://0001-gdbus-define-MAX_INPUT-for-musl.patch \
+           file://0001-shared-ad-fix-std-c23-build-failure.patch \
+           file://0002-shared-shell-fix-std-c23-build-failure.patch \
+           file://0003-shared-gatt-helpers-fix-std-c23-build-failure.patch \
            "
 S = "${WORKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-shared-ad-fix-std-c23-build-failure.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-shared-ad-fix-std-c23-build-failure.patch
new file mode 100644
index 00000000000..82eaed79298
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-shared-ad-fix-std-c23-build-failure.patch
@@ -0,0 +1,34 @@
+From 5c4cbf5cb95e4fc1a53545af52b420a8008b3ffa Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Wed, 20 Nov 2024 13:02:56 +0000
+Subject: [PATCH 1/3] shared/ad: fix -std=c23 build failure
+
+gcc-15 switched to -std=c23 by default:
+
+    https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=55e3bd376b2214e200fa76d12b67ff259b06c212
+
+As a result `bluez` fails the build as:
+
+    src/shared/ad.c:1090:24: error: incompatible types when returning type '_Bool' but 'const char *' was expected
+     1090 |                 return false;
+          |                        ^~~~~
+
+Upstream-Status: Backport [https://web.git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=da5b5b0ecb1ead38676768ef78d46449d404bdc0]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/shared/ad.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/shared/ad.c b/src/shared/ad.c
+index d08ce7a..dac381b 100644
+--- a/src/shared/ad.c
++++ b/src/shared/ad.c
+@@ -1087,7 +1087,7 @@ bool bt_ad_add_name(struct bt_ad *ad, const char *name)
+ const char *bt_ad_get_name(struct bt_ad *ad)
+ {
+ 	if (!ad)
+-		return false;
++		return NULL;
+ 
+ 	return ad->name;
+ }
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0002-shared-shell-fix-std-c23-build-failure.patch b/meta/recipes-connectivity/bluez5/bluez5/0002-shared-shell-fix-std-c23-build-failure.patch
new file mode 100644
index 00000000000..9ea622601b1
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0002-shared-shell-fix-std-c23-build-failure.patch
@@ -0,0 +1,34 @@
+From 408510d751e9482fe965e5dd96fbac7f9ee2ef62 Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Wed, 20 Nov 2024 13:03:29 +0000
+Subject: [PATCH 2/3] shared/shell: fix -std=c23 build failure
+
+gcc-15 switched to -std=c23 by default:
+
+    https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=55e3bd376b2214e200fa76d12b67ff259b06c212
+
+As a result `bluez` fails the build as:
+
+    src/shared/shell.c:365:24: error: incompatible types when returning type '_Bool' but 'struct input *' was expected
+      365 |                 return false;
+          |                        ^~~~~
+
+Upstream-Status: Backport [https://web.git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=4d60826865c760cc4e5718b6414746a394768110]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/shared/shell.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/shared/shell.c b/src/shared/shell.c
+index a8fa876..aa6c16c 100644
+--- a/src/shared/shell.c
++++ b/src/shared/shell.c
+@@ -362,7 +362,7 @@ static struct input *input_new(int fd)
+ 
+ 	io = io_new(fd);
+ 	if (!io)
+-		return false;
++		return NULL;
+ 
+ 	input = new0(struct input, 1);
+ 	input->io = io;
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0003-shared-gatt-helpers-fix-std-c23-build-failure.patch b/meta/recipes-connectivity/bluez5/bluez5/0003-shared-gatt-helpers-fix-std-c23-build-failure.patch
new file mode 100644
index 00000000000..996bb048acf
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0003-shared-gatt-helpers-fix-std-c23-build-failure.patch
@@ -0,0 +1,58 @@
+From 7c07bb10f57c80467bc3079d45dac4d3839927d0 Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Wed, 20 Nov 2024 13:03:55 +0000
+Subject: [PATCH 3/3] shared/gatt-helpers: fix -std=c23 build failure
+
+gcc-15 switched to -std=c23 by default:
+
+    https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=55e3bd376b2214e200fa76d12b67ff259b06c212
+
+As a result `bluez` fails the build as:
+
+    src/shared/gatt-helpers.c:1136:24: error: incompatible types when returning type '_Bool' but 'struct bt_gatt_request *' was expected
+     1136 |                 return false;
+          |                        ^~~~~
+    src/shared/gatt-helpers.c:1250:24: error: incompatible types when returning type '_Bool' but 'struct bt_gatt_request *' was expected
+     1250 |                 return false;
+          |                        ^~~~~
+    src/shared/gatt-helpers.c:1478:24: error: incompatible types when returning type '_Bool' but 'struct bt_gatt_request *' was expected
+     1478 |                 return false;
+          |                        ^~~~~
+
+Upstream-Status: Backport [https://web.git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=6f3111eb680df9c13502aacd65554846a9e13a3f]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/shared/gatt-helpers.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/shared/gatt-helpers.c b/src/shared/gatt-helpers.c
+index 50fcb26..f1fa630 100644
+--- a/src/shared/gatt-helpers.c
++++ b/src/shared/gatt-helpers.c
+@@ -1133,7 +1133,7 @@ struct bt_gatt_request *bt_gatt_discover_included_services(struct bt_att *att,
+ 	uint8_t pdu[6];
+ 
+ 	if (!att)
+-		return false;
++		return NULL;
+ 
+ 	op = new0(struct bt_gatt_request, 1);
+ 	op->att = att;
+@@ -1247,7 +1247,7 @@ struct bt_gatt_request *bt_gatt_discover_characteristics(struct bt_att *att,
+ 	uint8_t pdu[6];
+ 
+ 	if (!att)
+-		return false;
++		return NULL;
+ 
+ 	op = new0(struct bt_gatt_request, 1);
+ 	op->att = att;
+@@ -1475,7 +1475,7 @@ struct bt_gatt_request *bt_gatt_discover_descriptors(struct bt_att *att,
+ 	uint8_t pdu[4];
+ 
+ 	if (!att)
+-		return false;
++		return NULL;
+ 
+ 	op = new0(struct bt_gatt_request, 1);
+ 	op->att = att;

