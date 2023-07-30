Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4A95C41513
	for <webhook@archiver.kernel.org>; Sun, 30 Jul 2023 18:01:21 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.77627.1690740076943513018
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jul 2023 11:01:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=X/QO1tzm;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-686f8614ce5so3422445b3a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 11:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690740076; x=1691344876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ePO2UITYbS9YyTnK4ZWJtiWt9tOgBC8B2TeH7o2k+Y0=;
        b=X/QO1tzm1yni/YNvMuV/mQ+T6J2nHmsdetUt0kjXBUIVh+XIkq8FOxVl3nJjKO8p+m
         8wmmFRBAdznZLbZyUfHAjBn13zeoijrf0Ks4KY9gzWvJRBMM9w9xXcXuEG+6IEDDntZA
         cAKZuNoWmSoUmXwle6RLHgd/HUvbSr3v9VToJpfEpSmslXHvHRGHOj4RQsSV39niE2aU
         MwTjh1ZvNLg+naboEHT5MLEA1HyFtgt6gCyAWPxhldNiCBj4hM6L/U98lX/GCAfLtfGE
         oWjFu8U26We5seiVUsKDdGAORT5i58N1Chbc386l/TGd7iMrvCMUzzo1YXpPQOQ5elVg
         cxXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690740076; x=1691344876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ePO2UITYbS9YyTnK4ZWJtiWt9tOgBC8B2TeH7o2k+Y0=;
        b=kwIMcz+qppJg99FJB6b2wZIJ76dDlaPZprCvoBPf9Z6CDh3pA/5Hd0DYIPJqJpUy23
         dTpr+x2kk7WMOYirU3ZPjpij68xfH2ubjEzDq52dG5diBh/oRJ6zaguKkVVgPqZ+4G86
         qc5Sbbrgb3Vbv0FyfEm25Z5IDABFNl0MpuSkumh5CcVqcWwMuQK+cr6BU0S32vaaGBwL
         2PNIwRhrzG3fNGCzL1TkcNKwupuYmEGG+yWZtJjIJUmbZN+/g/xVZvrGf2AGUQYx7qa2
         ektEMNiMPKPGSdCVXiUjky0V+ZigjHeEG+Zgm/Ceeegoi6xylTegS8ntE/KpbDkDh2eQ
         aFiQ==
X-Gm-Message-State: ABy/qLZb3wqu4kjicXbxqbV8Vgan+s6wkPi6GlC2H/EOYht3Cc221yg1
	7YpNIDbv0oiFxBZDPVhwT37N9fH/bNBElQs2JVzscA==
X-Google-Smtp-Source: APBJJlHrm5EibHNARK3PKhDHuxbQ8mfrsuQduX8vyNiYm6iKcXo2aKFF9yMSpOpQjC0VYjsG+15Qtw==
X-Received: by 2002:a05:6a00:1415:b0:686:22de:6365 with SMTP id l21-20020a056a00141500b0068622de6365mr8469843pfu.8.1690740076005;
        Sun, 30 Jul 2023 11:01:16 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id e9-20020a62ee09000000b0066e7a540ea5sm6150494pfi.205.2023.07.30.11.01.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 11:01:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/30] python3: upgrade 3.10.9 -> 3.10.12
Date: Sun, 30 Jul 2023 08:00:32 -1000
Message-Id: <4df594dbc1b391afbe703f663fb2d5c9e9d35078.1690739937.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690739937.git.steve@sakoman.com>
References: <cover.1690739937.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 18:01:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185087

From: Tim Orling <ticotimo@gmail.com>

Security and bugfix updates.

* Drop cve-2023-24329.patch as it is merged in 3.10.12

CVE: CVE-2023-24329

Includes openssl 1.1.1u which addresses:
CVE: CVE-2023-0286
CVE: CVE-2022-4304
CVE: CVE-2022-4203

https://docs.python.org/release/3.10.12/whatsnew/changelog.html#python-3-10-12-final
https://docs.python.org/release/3.10.12/whatsnew/changelog.html#python-3-10-11-final
https://docs.python.org/release/3.10.12/whatsnew/changelog.html#python-3-10-10-final

License-Update: Update Copyright years to include 2023

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../python/python3/cve-2023-24329.patch       | 50 -------------------
 .../{python3_3.10.9.bb => python3_3.10.12.bb} |  5 +-
 2 files changed, 2 insertions(+), 53 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/cve-2023-24329.patch
 rename meta/recipes-devtools/python/{python3_3.10.9.bb => python3_3.10.12.bb} (98%)

diff --git a/meta/recipes-devtools/python/python3/cve-2023-24329.patch b/meta/recipes-devtools/python/python3/cve-2023-24329.patch
deleted file mode 100644
index d47425d239..0000000000
--- a/meta/recipes-devtools/python/python3/cve-2023-24329.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 72d356e3584ebfb8e813a8e9f2cd3dccf233c0d9 Mon Sep 17 00:00:00 2001
-From: "Miss Islington (bot)"
- <31488909+miss-islington@users.noreply.github.com>
-Date: Sun, 13 Nov 2022 11:00:25 -0800
-Subject: [PATCH] gh-99418: Make urllib.parse.urlparse enforce that a scheme
- must begin with an alphabetical ASCII character. (GH-99421)
-
-Prevent urllib.parse.urlparse from accepting schemes that don't begin with an alphabetical ASCII character.
-
-RFC 3986 defines a scheme like this: `scheme = ALPHA *( ALPHA / DIGIT / "+" / "-" / "." )`
-RFC 2234 defines an ALPHA like this: `ALPHA = %x41-5A / %x61-7A`
-
-The WHATWG URL spec defines a scheme like this:
-`"A URL-scheme string must be one ASCII alpha, followed by zero or more of ASCII alphanumeric, U+002B (+), U+002D (-), and U+002E (.)."`
-(cherry picked from commit 439b9cfaf43080e91c4ad69f312f21fa098befc7)
-
-Co-authored-by: Ben Kallus <49924171+kenballus@users.noreply.github.com>
---- end original header ---
-
-CVE: CVE-2023-24329
-
-Upstream-Status: Backport [see below]
-
-Taken from https://github.com/python/cpython.git
-commit 72d356e3584ebfb8e813a8e9f2cd3dccf233c0d9
-
-CVE fix extracted; test case and update to NEWS abandoned.
-Defuzzed.
-
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
----
- Lib/urllib/parse.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Lib/urllib/parse.py b/Lib/urllib/parse.py
-index 26ddf30..1c53acb 100644
---- a/Lib/urllib/parse.py
-+++ b/Lib/urllib/parse.py
-@@ -469,7 +469,7 @@ def urlsplit(url, scheme='', allow_fragments=True):
-         clear_cache()
-     netloc = query = fragment = ''
-     i = url.find(':')
--    if i > 0:
-+    if i > 0 and url[0].isascii() and url[0].isalpha():
-         for c in url[:i]:
-             if c not in scheme_chars:
-                 break
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/python/python3_3.10.9.bb b/meta/recipes-devtools/python/python3_3.10.12.bb
similarity index 98%
rename from meta/recipes-devtools/python/python3_3.10.9.bb
rename to meta/recipes-devtools/python/python3_3.10.12.bb
index 4ecc7614bb..74f1defc95 100644
--- a/meta/recipes-devtools/python/python3_3.10.9.bb
+++ b/meta/recipes-devtools/python/python3_3.10.12.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "Python is a programming language that lets you work more quickly
 LICENSE = "PSF-2.0"
 SECTION = "devel/python"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a1822df8d0f068628ca6090aedc5bfc8"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fcf6b249c2641540219a727f35d8d2c2"
 
 SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://run-ptest \
@@ -35,7 +35,6 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-setup.py-Do-not-detect-multiarch-paths-when-cross-co.patch \
            file://deterministic_imports.patch \
            file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
-           file://cve-2023-24329.patch \
            "
 
 SRC_URI:append:class-native = " \
@@ -44,7 +43,7 @@ SRC_URI:append:class-native = " \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
-SRC_URI[sha256sum] = "5ae03e308260164baba39921fdb4dbf8e6d03d8235a939d4582b33f0b5e46a83"
+SRC_URI[sha256sum] = "afb74bf19130e7a47d10312c8f5e784f24e0527981eab68e20546cfb865830b8"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.34.1


