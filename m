Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0355CD342F
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:31:14 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9404.1777739468660835895
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:31:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LMvsFAI9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43d7e23defbso1549982f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 09:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777739466; x=1778344266; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FSkm2D3YdB1p3VWEBmP9MWpDmtDDeRoOxzQc+tRNmu4=;
        b=LMvsFAI9gkdqc9gwh6FS8Sla8tE7XdwLz+3q6BiXFcVKmM/qdi7WlY/ID9kDrPPRCZ
         VuMKKRQqMYDckFF5cNGusRHr9tZaS/t1C0ISQB8Y1bJCbPpDMhSGzpwsF93k8g2S1KMw
         jiJTa7PdCNKsuuLQbiuYVxAsJx9iR3Lh11tjI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777739466; x=1778344266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FSkm2D3YdB1p3VWEBmP9MWpDmtDDeRoOxzQc+tRNmu4=;
        b=pCmOtVDJf1JSRKczsCfEO6akrXYEv8rBF0ueUpmZFHmASYzslIPo0WIbMoWHkJDcpu
         zvnk0mXWRYvVOVlAA+MKrHNe/PXjtRqCIFDHtFKeliicmcx9v/OffNDuylfQGMOVNyA0
         2+Xu/FXJRroreDU0vscEH1F35Lae4hAG1DeNSMieOpapcFg+q/49I19OOGylZ4lE3fQB
         xBv3vMcccLuyWx1lSPEn+LFHnkjfyXi1x3nCg0pN9bvrUWK7arqc5jMXtKAFLvtSbXQ6
         KORfAa7h92EoYPetiWJ4rKQ/A0bBxt1EXXdY7c4i7Pj1Z0yYakZcKwD8xtK+iEj0yDoQ
         p4Dg==
X-Gm-Message-State: AOJu0Ywka4nMKg6Vdv8On0FOSO6y+DiELqcYxS8aQjkU0hpm0eVVqc++
	mSKD7s2KybWuwgv4uWzMkjIo/Q9w0Qur5krLUkcGHqTFyg+eXW3i8pGlCUbDWQ50L97R/YJzY56
	6rCoOkky0HpMUZsBrOTI6pI0GFxE7Hco7skSrzAwqps+h6+VLja35mvRZwbmzEwoFlHzmJxHzvV
	cH2K9IIzWzLyavNV0=
X-Gm-Gg: AeBDieujQDj5pZJbrx484VTFjEAVbUu9b8vKWAnyGjasJvDdOk+c9WrbJJqP0W2gV4x
	mIZFxGjWMMlzof7WCAlw2cjtVzcAISf4CzgVPXvKh0L8ioVMTJRR/RyWJcs7JaWJStxw2PWI7V0
	Z4MSFMCywbcBfsAhhTeuHiW+QO0yr6I3XJzhkq2T2N5JfkhcPLmb3xbLHPsj142GJLoWNMqfqIH
	siwiwzVHbdd7gVlSCbg+g33mAfa1fAjl/TUp6+o/myc90nOVYOYi8vjegd8kUlbzSogwvmBxht6
	2++tundAJKHPp47x0mXXYBwkA2zGmoSjN1/V4PXH+Qjp4ZwaAnXzjsf+WKJkUTonxsuWyGyZ5qJ
	PxAV+N3iTW+l4lHuiYGzElRwGL7zijZf+oOY9xiMKF1n67XsRbFJmsVoFTXovorH8+97NuhI2Sh
	qiwjdUBSagGczaPbBQj7IqpZ5hZkxVSNc+uscaqCivgRWlLQyUSLbexo4l4Q4gB5E=
X-Received: by 2002:a05:6000:61e:b0:43d:7b90:fa23 with SMTP id ffacd0b85a97d-44bb65df7c8mr5552539f8f.29.1777739466412;
        Sat, 02 May 2026 09:31:06 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm11971926f8f.31.2026.05.02.09.31.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:31:04 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 46/62] python3-requests: upgrade 2.32.5 -> 2.33.1
Date: Sat,  2 May 2026 17:29:06 +0100
Message-ID: <20260502162929.1377831-46-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
References: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:31:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236355

Drop backported patch now included.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python3-requests/CVE-2026-25645.patch     | 46 -------------------
 ...s_2.32.5.bb => python3-requests_2.33.1.bb} |  5 +-
 2 files changed, 2 insertions(+), 49 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-requests/CVE-2026-25645.patch
 rename meta/recipes-devtools/python/{python3-requests_2.32.5.bb => python3-requests_2.33.1.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-requests/CVE-2026-25645.patch b/meta/recipes-devtools/python/python3-requests/CVE-2026-25645.patch
deleted file mode 100644
index 3bebba65726..00000000000
--- a/meta/recipes-devtools/python/python3-requests/CVE-2026-25645.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 66d21cb07bd6255b1280291c4fafb71803cdb3b7 Mon Sep 17 00:00:00 2001
-From: Nate Prewitt <nate.prewitt@gmail.com>
-Date: Wed, 25 Mar 2026 08:57:56 -0600
-Subject: [PATCH] Merge commit from fork
-
-Prior to version 2.33.0, the `requests.utils.extract_zipped_paths()` utility function
-uses a predictable filename when extracting files from zip archives into the system
-temporary directory. If the target file already exists, it is reused without validation.
-A local attacker with write access to the temp directory could pre-create a malicious
-file that would be loaded in place of the legitimate one. Standard usage of the Requests
-library is not affected by this vulnerability. Only applications that call
-`extract_zipped_paths()` directly are impacted. Starting in version 2.33.0, the library
-extracts files to a non-deterministic location. If developers are unable to upgrade,
-they can set `TMPDIR` in their environment to a directory with restricted write access.
-
-CVE: CVE-2026-25645
-Upstream-Status: Backport [https://github.com/psf/requests/commit/66d21cb07bd6255b1280291c4fafb71803cdb3b7]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- src/requests/utils.py | 13 +++++++------
- 1 file changed, 7 insertions(+), 6 deletions(-)
-
-diff --git a/src/requests/utils.py b/src/requests/utils.py
-index d8803e6e91..54959bb8ab 100644
---- a/src/requests/utils.py
-+++ b/src/requests/utils.py
-@@ -282,12 +282,13 @@ def extract_zipped_paths(path):
-         return path
- 
-     # we have a valid zip archive and a valid member of that archive
--    tmp = tempfile.gettempdir()
--    extracted_path = os.path.join(tmp, member.split("/")[-1])
--    if not os.path.exists(extracted_path):
--        # use read + write to avoid the creating nested folders, we only want the file, avoids mkdir racing condition
--        with atomic_open(extracted_path) as file_handler:
--            file_handler.write(zip_file.read(member))
-+    suffix = os.path.splitext(member.split("/")[-1])[-1]
-+    fd, extracted_path = tempfile.mkstemp(suffix=suffix)
-+    try:
-+        os.write(fd, zip_file.read(member))
-+    finally:
-+        os.close(fd)
-+
-     return extracted_path
- 
- 
diff --git a/meta/recipes-devtools/python/python3-requests_2.32.5.bb b/meta/recipes-devtools/python/python3-requests_2.33.1.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-requests_2.32.5.bb
rename to meta/recipes-devtools/python/python3-requests_2.33.1.bb
index 3477a5d83e9..f9c1f1f8ee9 100644
--- a/meta/recipes-devtools/python/python3-requests_2.32.5.bb
+++ b/meta/recipes-devtools/python/python3-requests_2.33.1.bb
@@ -5,10 +5,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "dbba0bac56e100853db0ea71b82b4dfd5fe2bf6d3754a8893c3af500cec7d7cf"
+SRC_URI[sha256sum] = "18817f8c57c6263968bc123d237e3b8b08ac046f5456bd1e307ee8f4250d3517"
 
-SRC_URI += "file://CVE-2026-25645.patch"
-SRC_URI:append:class-nativesdk = " file://environment.d-python3-requests.sh"
+SRC_URI += "file://environment.d-python3-requests.sh"
 
 do_install:append:class-nativesdk() {
 	mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d

