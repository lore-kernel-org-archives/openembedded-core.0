Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 613F6CD8C91
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 22:34:26 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6270.1780698856246052124
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2026 15:34:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2hz7OEgv;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45ef6565cfdso1170772f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 15:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1780698855; x=1781303655; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SAmvLPkFhWnd5HXo8z71joFsBaF2cCC91SDOVLFaa3c=;
        b=2hz7OEgvFclJg3srpGxtU63qzAsBQgraTYVA3k4nIoDeslGXO7BENm84UWWkA7x6gC
         nzzG19fkLQyVWNDWH5u1QJFHvCcpSWV9CWkIYosAhB7nFsMmIf8tXyxkPVzCrNH3bP5r
         2bGk8X7UYHw1dU8rq5ZCugxZZe2j2KV5SuPS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780698855; x=1781303655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SAmvLPkFhWnd5HXo8z71joFsBaF2cCC91SDOVLFaa3c=;
        b=tNj/GGQ05bWdINNHNwJZubIkqqvSOPZpVxURI4FkZ/CKFTUx5I/IDLJ/NNEBJJE/Tr
         2baexFDtlkPwR1n4UddW0IOVXhduwsEzTT1l+zd33YkA5tjZBysoJMcvH1ZlPaMMiM0l
         cPAcB4idQOOXrzbvNh0/9uxjBplQIqNrKlgG1zcRhaB5t9i2QICFdtXVEBXO2qL7QgqY
         oBLjMgrhPSzjpMseZYuLM9owSN8GurLMCYHAOeqMPyCKfmgskFgp9s0DXTaDX1RNWbzs
         DspC2/GDWUH2QPb/IF+R/T2qFRdmmtVOEIWP1UYoaE/thYZ7zjfxdlave6zZt9Z1/fU3
         SuLw==
X-Gm-Message-State: AOJu0Ywuwh6ewPuZEacET296XQv38PDZ87keZcVBKTaCjeOr3GFNxRkD
	QyTiflbsJzOsqbXrNxXXeLCJQIA4QG4SMHRbJien+ozaNAegiKgp6wb53KQ299MqAIKvAmPpJmj
	r/oIO
X-Gm-Gg: Acq92OFHudC067hWvo68BB437xAnncO31zyMSdBeZtAu7MFBe8liXuwKC1N0tGIFRkm
	ARqXu3BG8AN+2m/0MrMyoNvwUoXpMRSVl0oK6dZp+QrNHomZDV6OaXMNOpcONKjacXPfBayy1x3
	3p2s6n0NcFfa8a1oTyOzG+fRi+yehNsBASSd/t0hZ+/r0G+QLJIaN6NrubErL5JxU6lWfPeSvMP
	n6Evb/krDuw8qDksb55PcbO56j2oCjZl3C9JxJ6Nb3jDoNUNdKWkE/FndDMEPKUouOhtv1WZhhy
	HxPmqKuACceODh7iwJyKohM0kohuqqnL/wLNtfQ1borwGA+ov6ES9aQNgw2PNGoq0aGbL86fECX
	s6m2IhlmAU78MRRnGPJYLtjGb4BvBIc+Wug4QQu4XTK57wAApChc4BdAt1qste0RmiX2jm3EOmn
	qeeeGIHS9JzHgGFWZBx7tppyTTbwB7gBm3e0JsxT0kvtQbuSbe4WsWmaI0DZvFJJn5tqnpoDulU
	2PkPexnumva28jjD0cA3tgmHvH4JUsQm8ELqDY=
X-Received: by 2002:a05:600c:4fc6:b0:488:aa33:dcbd with SMTP id 5b1f17b1804b1-490c2615bdemr93799705e9.26.1780698854592;
        Fri, 05 Jun 2026 15:34:14 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00b3e1ccc1be2b2798.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:b3e1:ccc1:be2b:2798])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2e4b18sm22132409f8f.10.2026.06.05.15.34.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 15:34:14 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/25] python3-requests: backport fix for CVE-2026-25645
Date: Sat,  6 Jun 2026 00:33:47 +0200
Message-ID: <b23ec9773d67f8767904731afa86fe5ede08f97f.1780698373.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780698373.git.yoann.congal@smile.fr>
References: <cover.1780698373.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 22:34:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238189

From: Ross Burton <ross.burton@arm.com>

When unpacking zip files requests uses predictable paths. Backport a fix
to use randomly generated pathnames to mitigate injection attacks.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fe846d71b647fb06e6a87cb45a2dd9b0889e2891)
Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python3-requests/CVE-2026-25645.patch     | 46 +++++++++++++++++++
 .../python/python3-requests_2.32.4.bb         |  7 ++-
 2 files changed, 49 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3-requests/CVE-2026-25645.patch

diff --git a/meta/recipes-devtools/python/python3-requests/CVE-2026-25645.patch b/meta/recipes-devtools/python/python3-requests/CVE-2026-25645.patch
new file mode 100644
index 00000000000..3bebba65726
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-requests/CVE-2026-25645.patch
@@ -0,0 +1,46 @@
+From 66d21cb07bd6255b1280291c4fafb71803cdb3b7 Mon Sep 17 00:00:00 2001
+From: Nate Prewitt <nate.prewitt@gmail.com>
+Date: Wed, 25 Mar 2026 08:57:56 -0600
+Subject: [PATCH] Merge commit from fork
+
+Prior to version 2.33.0, the `requests.utils.extract_zipped_paths()` utility function
+uses a predictable filename when extracting files from zip archives into the system
+temporary directory. If the target file already exists, it is reused without validation.
+A local attacker with write access to the temp directory could pre-create a malicious
+file that would be loaded in place of the legitimate one. Standard usage of the Requests
+library is not affected by this vulnerability. Only applications that call
+`extract_zipped_paths()` directly are impacted. Starting in version 2.33.0, the library
+extracts files to a non-deterministic location. If developers are unable to upgrade,
+they can set `TMPDIR` in their environment to a directory with restricted write access.
+
+CVE: CVE-2026-25645
+Upstream-Status: Backport [https://github.com/psf/requests/commit/66d21cb07bd6255b1280291c4fafb71803cdb3b7]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ src/requests/utils.py | 13 +++++++------
+ 1 file changed, 7 insertions(+), 6 deletions(-)
+
+diff --git a/src/requests/utils.py b/src/requests/utils.py
+index d8803e6e91..54959bb8ab 100644
+--- a/src/requests/utils.py
++++ b/src/requests/utils.py
+@@ -282,12 +282,13 @@ def extract_zipped_paths(path):
+         return path
+ 
+     # we have a valid zip archive and a valid member of that archive
+-    tmp = tempfile.gettempdir()
+-    extracted_path = os.path.join(tmp, member.split("/")[-1])
+-    if not os.path.exists(extracted_path):
+-        # use read + write to avoid the creating nested folders, we only want the file, avoids mkdir racing condition
+-        with atomic_open(extracted_path) as file_handler:
+-            file_handler.write(zip_file.read(member))
++    suffix = os.path.splitext(member.split("/")[-1])[-1]
++    fd, extracted_path = tempfile.mkstemp(suffix=suffix)
++    try:
++        os.write(fd, zip_file.read(member))
++    finally:
++        os.close(fd)
++
+     return extracted_path
+ 
+ 
diff --git a/meta/recipes-devtools/python/python3-requests_2.32.4.bb b/meta/recipes-devtools/python/python3-requests_2.32.4.bb
index b86ecfba52d..9ebdd4f08aa 100644
--- a/meta/recipes-devtools/python/python3-requests_2.32.4.bb
+++ b/meta/recipes-devtools/python/python3-requests_2.32.4.bb
@@ -3,13 +3,12 @@ HOMEPAGE = "https://requests.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-SRC_URI:append:class-nativesdk = " \
-           file://environment.d-python3-requests.sh \
-"
+inherit pypi python_setuptools_build_meta
 
 SRC_URI[sha256sum] = "27d0316682c8a29834d3264820024b62a36942083d52caf2f14c0591336d3422"
 
-inherit pypi python_setuptools_build_meta
+SRC_URI += "file://CVE-2026-25645.patch"
+SRC_URI:append:class-nativesdk = " file://environment.d-python3-requests.sh"
 
 do_install:append:class-nativesdk() {
 	mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d

