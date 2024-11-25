Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CBF0D58070
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 12:01:33 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.17201.1732536092679359763
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 04:01:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QtpqUkPw;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4315abed18aso38856805e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 04:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732536091; x=1733140891; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=foMwucFQ7fd48bbQsBpXpKNDm5wL4qaSSl3wlS1zg/w=;
        b=QtpqUkPw/C1qeR+fYCQdJea8ZSM9wHLGINfOekOOuiSTkJsIrIfVw4WIcwcWCEwsFW
         hvz5PzAxjoMdOpfdyHNvQz22i5awv/hkezpM/t1V8D9QxKwxl/w5xl2ntMxK3WoNGW2B
         pxr8Xo3iQFCaKmoYMbPzfWALoajV19Au3eowYc3HVIlQS3uMHPCGSngQpZRYNo5uVWcu
         Fu0QLHHtlXIj1OnU27IrjH2x0MrCVgBXjf6sOBOkta+zE6ifsra60s2PevG4OCXpQAu6
         2mBuhkb+tr+KEiga2ms8/AlqKRm9yTnqvkdqWbBU4rkwIbP6SKe7iLomiuVVaZV3hr+M
         03pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732536091; x=1733140891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=foMwucFQ7fd48bbQsBpXpKNDm5wL4qaSSl3wlS1zg/w=;
        b=XwEhtHSvgLhh9yEfTpDObbcUcffOkYq8G5thwM1zNXgneEyGKkhmV8Dpv5QQ8hwwcv
         J+3gsn09F2pYdfPnZczPjL7Na66wpEQdpr70itjkFMGJgPbwYJlegmwVLZpMwLdwp5rC
         ZZAj5U8+NZC30ex5bF7YeDKUofmARozfsc1xGV4r70grGwrcDn2gOPMlySrI9lW1EO4q
         PiTz/13uVIu/2+TT1kB8+cwrZMjKPHSEMjxal7gupMaAM3MPD4CKpJQfXBLg/lPJ00PP
         0nClqqDAxe8Z+OiRut29YnaeMwsVpjfuhem2JXESG4SjlWdJCPw2rzfb1uWhQ8/2PDyX
         5C+Q==
X-Gm-Message-State: AOJu0YzOt3X0f8xozeLKPbzZ0mGJwxJWGS0/KiI7SxepN9qugduOrXZO
	m4uCie40WDBFeXxH+UtEgQ+nEmT7Oy/7tsjjNyDgk2H1gS9Gf8z3Zly+rw==
X-Gm-Gg: ASbGnculKNfeJ/RxohCvVJRL+cUbCB5PJEvG7sEzkYxSXuB4cKqfRQZbl/R92eXzdt9
	hlY6D0recOvpdjr2Q+fDPFp5x/bV2BZGYpZsMGq1iVWMbCK2InP/iy0wWEVX8yVOlw3FPBd2hCw
	2xTlCncyZc/Z1uKE8TpRssZD6XVi8egELtjW/I9MG84u/0FIM6eizOkTMLvQZWYn+iIz4nSgCDu
	topoi5czQUOr9HTBRbEGciiMu2jgXdBZ552viJ0XFOPUFa8+E9Qwv0HI+CiNzPX3uc7stMnxUDE
	Bk/91NWz374=
X-Google-Smtp-Source: AGHT+IHLnvKEcPlkZmmFUcVKlwUdN5aqg8jkcHsHJsVKMth02vz+8efjLbTe7jSmgBcWeGqTvJiW7g==
X-Received: by 2002:a05:600c:1f89:b0:431:52f5:f48d with SMTP id 5b1f17b1804b1-433ce4e7b75mr124779455e9.31.1732536090601;
        Mon, 25 Nov 2024 04:01:30 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4349e80e51esm44881115e9.33.2024.11.25.04.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 04:01:30 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/35] base-passwd: upgrade 3.6.4 -> 3.6.5
Date: Mon, 25 Nov 2024 13:00:54 +0100
Message-Id: <20241125120127.2205232-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241125120127.2205232-1-alex.kanavin@gmail.com>
References: <20241125120127.2205232-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 12:01:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207749

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-Add-a-shutdown-group.patch            |  2 +-
 .../0001-base-passwd-Add-the-sgx-group.patch   |  4 ++--
 ...instead-of-bin-bash-for-the-root-user.patch |  4 ++--
 ...ot-since-we-do-not-have-an-etc-shadow.patch |  4 ++--
 ...input-group-for-the-dev-input-devices.patch |  4 ++--
 .../base-passwd/0005-Add-kvm-group.patch       |  2 +-
 .../base-passwd/0007-Add-wheel-group.patch     | 18 +++++++++++++-----
 ...se-passwd_3.6.4.bb => base-passwd_3.6.5.bb} |  2 +-
 8 files changed, 24 insertions(+), 16 deletions(-)
 rename meta/recipes-core/base-passwd/{base-passwd_3.6.4.bb => base-passwd_3.6.5.bb} (98%)

diff --git a/meta/recipes-core/base-passwd/base-passwd/0001-Add-a-shutdown-group.patch b/meta/recipes-core/base-passwd/base-passwd/0001-Add-a-shutdown-group.patch
index 33b0b5820d6..60e755fd9ad 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0001-Add-a-shutdown-group.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0001-Add-a-shutdown-group.patch
@@ -1,4 +1,4 @@
-From 49371dfc984ac895d658d01108e8bf58675ce8c9 Mon Sep 17 00:00:00 2001
+From 03150b2575c5ec1ba30726d30d47303627e6fc60 Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Fri, 29 Apr 2022 13:32:27 +0000
 Subject: [PATCH] Add a shutdown group
diff --git a/meta/recipes-core/base-passwd/base-passwd/0001-base-passwd-Add-the-sgx-group.patch b/meta/recipes-core/base-passwd/base-passwd/0001-base-passwd-Add-the-sgx-group.patch
index e1340e1b70c..41dfc271787 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0001-base-passwd-Add-the-sgx-group.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0001-base-passwd-Add-the-sgx-group.patch
@@ -1,4 +1,4 @@
-From 9e57771d138ac423d5139b984b8c869122ce4976 Mon Sep 17 00:00:00 2001
+From 6ad8995014cc30c932a8b4dae066c56ae33a107f Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alexk@zuma.ai>
 Date: Fri, 28 Jul 2023 10:28:57 +0100
 Subject: [PATCH] base-passwd: Add the sgx group
@@ -17,7 +17,7 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/group.master b/group.master
-index d34d2b832d43..e54fd1d2c6dc 100644
+index d34d2b8..e54fd1d 100644
 --- a/group.master
 +++ b/group.master
 @@ -34,6 +34,7 @@ video:*:44:
diff --git a/meta/recipes-core/base-passwd/base-passwd/0002-Use-bin-sh-instead-of-bin-bash-for-the-root-user.patch b/meta/recipes-core/base-passwd/base-passwd/0002-Use-bin-sh-instead-of-bin-bash-for-the-root-user.patch
index 09f8cfea9c6..61b3ed38d79 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0002-Use-bin-sh-instead-of-bin-bash-for-the-root-user.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0002-Use-bin-sh-instead-of-bin-bash-for-the-root-user.patch
@@ -1,4 +1,4 @@
-From 4411fc0df77566d52bee11ec0bad4be30a96e99e Mon Sep 17 00:00:00 2001
+From 54bb95b9c4532f9cbe634dd43798ce37c93d6f50 Mon Sep 17 00:00:00 2001
 From: Scott Garman <scott.a.garman@intel.com>
 Date: Fri, 29 Apr 2022 13:32:27 +0000
 Subject: [PATCH] Use /bin/sh instead of /bin/bash for the root user
@@ -12,7 +12,7 @@ Signed-off-by: Scott Garman <scott.a.garman@intel.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/passwd.master b/passwd.master
-index 7cd4e24..041685a 100644
+index 90514a5..bd3efc2 100644
 --- a/passwd.master
 +++ b/passwd.master
 @@ -1,4 +1,4 @@
diff --git a/meta/recipes-core/base-passwd/base-passwd/0003-Remove-for-root-since-we-do-not-have-an-etc-shadow.patch b/meta/recipes-core/base-passwd/base-passwd/0003-Remove-for-root-since-we-do-not-have-an-etc-shadow.patch
index 06222ab04ce..6b13d4c9673 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0003-Remove-for-root-since-we-do-not-have-an-etc-shadow.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0003-Remove-for-root-since-we-do-not-have-an-etc-shadow.patch
@@ -1,4 +1,4 @@
-From 13a1a284a134d18a454625a5b4485c0d99079ae9 Mon Sep 17 00:00:00 2001
+From 03406451d66a9d561d6e32a181248e5a0bd58d58 Mon Sep 17 00:00:00 2001
 From: Scott Garman <scott.a.garman@intel.com>
 Date: Fri, 29 Apr 2022 13:32:28 +0000
 Subject: [PATCH] Remove "*" for root since we do not have an /etc/shadow
@@ -10,7 +10,7 @@ Signed-off-by: Scott Garman <scott.a.garman@intel.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/passwd.master b/passwd.master
-index 041685a..31a84d4 100644
+index bd3efc2..66e9033 100644
 --- a/passwd.master
 +++ b/passwd.master
 @@ -1,4 +1,4 @@
diff --git a/meta/recipes-core/base-passwd/base-passwd/0004-Add-an-input-group-for-the-dev-input-devices.patch b/meta/recipes-core/base-passwd/base-passwd/0004-Add-an-input-group-for-the-dev-input-devices.patch
index 394a0f01d32..85739d5b478 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0004-Add-an-input-group-for-the-dev-input-devices.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0004-Add-an-input-group-for-the-dev-input-devices.patch
@@ -1,4 +1,4 @@
-From c5f012750f8102ff54af73ccc2d2b7bfa1f26db4 Mon Sep 17 00:00:00 2001
+From 662da5251f3f9634c583eeccc8242a05393d37be Mon Sep 17 00:00:00 2001
 From: Darren Hart <dvhart@linux.intel.com>
 Date: Fri, 29 Apr 2022 13:32:28 +0000
 Subject: [PATCH] Add an input group for the /dev/input/* devices
@@ -10,7 +10,7 @@ Signed-off-by: Darren Hart <dvhart@linux.intel.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/group.master b/group.master
-index 1b5e2fb..cea9d60 100644
+index 72108a8..7d794b2 100644
 --- a/group.master
 +++ b/group.master
 @@ -12,6 +12,7 @@ uucp:*:10:
diff --git a/meta/recipes-core/base-passwd/base-passwd/0005-Add-kvm-group.patch b/meta/recipes-core/base-passwd/base-passwd/0005-Add-kvm-group.patch
index 0101637e9e7..65a9ef53a36 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0005-Add-kvm-group.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0005-Add-kvm-group.patch
@@ -1,4 +1,4 @@
-From 74fc91ee809bc902f79144ee2277fa3e368c30d0 Mon Sep 17 00:00:00 2001
+From c6e5c31cd276f69a4db479188efb3ab3e0f35dd8 Mon Sep 17 00:00:00 2001
 From: Jacob Kroon <jacob.kroon@gmail.com>
 Date: Wed, 30 Jan 2019 04:53:48 +0000
 Subject: [PATCH] Add kvm group
diff --git a/meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group.patch b/meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group.patch
index d77122789d5..a4d2dd875b0 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group.patch
@@ -1,3 +1,7 @@
+From fc9790b768971d5b9e9b6d215bc29885a646c335 Mon Sep 17 00:00:00 2001
+From: Louis Rannou <lrannou@baylibre.com>
+Date: Thu, 15 Jun 2023 13:43:55 +0200
+Subject: [PATCH] base-passwd: add the wheel group
 
 We need to have a wheel group which has some system privileges to consult the
 systemd journal or manage printers with cups.
@@ -7,11 +11,15 @@ Upstream says the group does not exist by default.
 Upstream-Status: Inappropriate [enable feature]
 
 Signed-off-by: Louis Rannou <lrannou@baylibre.com>
-Index: base-passwd-3.5.26/group.master
-===================================================================
---- base-passwd-3.5.29.orig/group.master
-+++ base-passwd-3.5.29/group.master
-@@ -38,5 +38,6 @@
+---
+ group.master | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/group.master b/group.master
+index 7fdd8bf..d34d2b8 100644
+--- a/group.master
++++ b/group.master
+@@ -37,5 +37,6 @@ kvm:*:47:
  staff:*:50:
  games:*:60:
  shutdown:*:70:
diff --git a/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb b/meta/recipes-core/base-passwd/base-passwd_3.6.5.bb
similarity index 98%
rename from meta/recipes-core/base-passwd/base-passwd_3.6.4.bb
rename to meta/recipes-core/base-passwd/base-passwd_3.6.5.bb
index df4889f220e..47c15e55414 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.6.5.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://launchpad.net/debian/+archive/primary/+files/${BPN}_${PV}.tar
            file://0001-base-passwd-Add-the-sgx-group.patch \
            "
 
-SRC_URI[sha256sum] = "4b5232c5910932215b87bbde6f3c6c9a97021fe7902bd837b1ede8cc0be84a65"
+SRC_URI[sha256sum] = "bd30ab67b1f8029d3e70d3419e5033fb4595ab91c91307c3b7c00978e8d111b2"
 
 # the package is taken from launchpad; that source is static and goes stale
 # so we check the latest upstream from a directory that does get updated
-- 
2.39.5


