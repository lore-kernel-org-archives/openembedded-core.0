Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 025CAC678D7
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 14:09:05 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.197079.1673964535072720118
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jan 2023 06:09:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=DMok5Ek4;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id q23-20020a17090a065700b002290913a521so15000449pje.5
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 06:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CDoRjFpad+CPJM0jCkDPvybCoyCHc/SHvMJugMa7dXw=;
        b=DMok5Ek4uSDBcsBEx9oyzBfaFObZm91I2zQASnfK6P+rnCp0RYYp4qCd63M4KbcOxZ
         5tqh0J6YPvGenKMP17CYWnMalUN0AwQ/iULwEAHODwZ85pBE1rxuETn0V1Sl3MoPggJA
         fGnz0RMWPNZooMaMYQkFtuFBuQEmXD3dl0wujtJ8iK2iQ/PIpCLqXYgoU+PBRNXkZ7WF
         gW3mJCK1phDs6qE591Eqt4WElub4bITBJFgDjUUiG+KM3mBoHQOLrFgBqP+oKBYwtrFV
         8Z58i9dge8tioJiLRpTAhzOSTN8vWsNOZsUPP6diNmwKJ+XSveTUg/cUU5Nm6IQH/Uwm
         jlmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CDoRjFpad+CPJM0jCkDPvybCoyCHc/SHvMJugMa7dXw=;
        b=xMJoNbJRRmF8vzuUkfl6aTcE1mk0tDP8R2dDo0KPSUvhBLph7Qkq0QIiyi3OG+POAG
         Kc8hkq/vPb9FmEEeGe6n+ToiDR5u9VdPNfHfa1EVpBnqH4RxjayvsQYrIqRDfuy316QW
         /W5NJYkm/RAAhs19ZBafVnF0MzPhzeqEAu1BlRwaZeHLB11l0ySJOwswfFjw+qSLcalU
         E+jzqTEwpcEfgLa4DZDl6kZ6MeIP2Q3xH4xwFb1f1G0lPvVsEUaOFMdihV6Vy9wZjvmV
         hcLDOPWY2cJ8Wcc/LhckMNaDGEuQv8a0W/faiQXVDhz+sFggNNTY+fqWCBTkJR7wzcc3
         A8tw==
X-Gm-Message-State: AFqh2koOblcKmSx1DFHjkjiKf1FTHr0QccR/FXsk6/GTABfjxUl38MtO
	NAIHtkigKC/PdOa/jYB/+KvVqL+qoIZMtOQbW6o=
X-Google-Smtp-Source: AMrXdXtLXRCxSkCh+9AgMZQqykkC0qTSvJ/C/oxD3ULIZ5vYnlW6c484iwka5mSeUWPFmOJeHbll4Q==
X-Received: by 2002:a17:903:40cc:b0:194:9ae9:8700 with SMTP id t12-20020a17090340cc00b001949ae98700mr3393064pld.59.1673964540647;
        Tue, 17 Jan 2023 06:09:00 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id y2-20020a17090264c200b001930b7e2c04sm18197788pli.287.2023.01.17.06.08.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 06:09:00 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/9] python3-setuptools: fix for CVE-2022-40897
Date: Tue, 17 Jan 2023 04:08:39 -1000
Message-Id: <f574d8d57ff3fbc38e350e7a90913993081c4fdf.1673964419.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1673964419.git.steve@sakoman.com>
References: <cover.1673964419.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 14:09:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176040

From: Narpat Mali <narpat.mali@windriver.com>

Python Packaging Authority (PyPA) setuptools before 65.5.1 allows remote attackers
to cause a denial of service via HTML in a crafted package or custom PackageIndex
page. There is a Regular Expression Denial of Service (ReDoS) in package_index.py.

CVE: CVE-2022-40897

Upstream-Status: Backport [https://github.com/pypa/setuptools/commit/43a9c9bfa6aa626ec2a22540bea28d2ca77964be]

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...-of-whitespace-to-search-backtrack.-.patch | 31 +++++++++++++++++++
 .../python/python3-setuptools_59.5.0.bb       |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-setuptools/0001-Limit-the-amount-of-whitespace-to-search-backtrack.-.patch

diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-Limit-the-amount-of-whitespace-to-search-backtrack.-.patch b/meta/recipes-devtools/python/python3-setuptools/0001-Limit-the-amount-of-whitespace-to-search-backtrack.-.patch
new file mode 100644
index 0000000000..20a13da7bc
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-Limit-the-amount-of-whitespace-to-search-backtrack.-.patch
@@ -0,0 +1,31 @@
+From 9e9f617a83f6593b476669030b0347d48e831c3f Mon Sep 17 00:00:00 2001
+From: Narpat Mali <narpat.mali@windriver.com>
+Date: Mon, 9 Jan 2023 14:45:05 +0000
+Subject: [PATCH] Limit the amount of whitespace to search/backtrack. Fixes
+ #3659.
+
+CVE: CVE-2022-40897
+
+Upstream-Status: Backport [https://github.com/pypa/setuptools/commit/43a9c9bfa6aa626ec2a22540bea28d2ca77964be]
+
+Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
+---
+ setuptools/package_index.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/setuptools/package_index.py b/setuptools/package_index.py
+index 270e7f3..e93fcc6 100644
+--- a/setuptools/package_index.py
++++ b/setuptools/package_index.py
+@@ -197,7 +197,7 @@ def unique_values(func):
+     return wrapper
+ 
+ 
+-REL = re.compile(r"""<([^>]*\srel\s*=\s*['"]?([^'">]+)[^>]*)>""", re.I)
++REL = re.compile(r"""<([^>]*\srel\s{0,10}=\s{0,10}['"]?([^'" >]+)[^>]*)>""", re.I)
+ # this line is here to fix emacs' cruddy broken syntax highlighting
+ 
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb b/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
index f2810e18d3..5f2676a04a 100644
--- a/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
@@ -11,6 +11,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 SRC_URI += "\
     file://0001-change-shebang-to-python3.patch \
     file://0001-_distutils-sysconfig-append-STAGING_LIBDIR-python-sy.patch \
+    file://0001-Limit-the-amount-of-whitespace-to-search-backtrack.-.patch \
 "
 
 SRC_URI[sha256sum] = "d144f85102f999444d06f9c0e8c737fd0194f10f2f7e5fdb77573f6e2fa4fad0"
-- 
2.25.1


