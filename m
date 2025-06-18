Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C64E6C71157
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 13:01:26 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web10.6693.1750251682371965160
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 06:01:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=mJxlFkUb;
 spf=pass (domain: baylibre.com, ip: 209.85.161.42, mailfrom: tgamblin@baylibre.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-60b8a9be972so1551562eaf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 06:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750251681; x=1750856481; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=MwPmC4rB7OScgZGMULM/tOFBwkzQyDxae5kaoIAMOhs=;
        b=mJxlFkUboR2gbT/fbsfVZhSBtHyHvBnfe7m4IP3cytMPSYztn8N4p3d/JD61OhFX5u
         aSgU+fJqLaZLdzhyRjP1yOvrtO9zLLgHCbtBucLwFm2iWvYMlc5Mx11SMnpQIRTDyEjo
         UOOxTbOcihZBROE951t20uguLFfaqtIbeffugvbKdLc3nYs4uLt4JiNcaZVxdD3URjvK
         0F+GR9pRH+dWZSksQpLHjcRu3sWye6KdNrPjc1e/qthLI6hn7ln2RXCZUAbPJ9CboxH7
         Q7DYpqUJRGmoPvNQJMboTdJ5ggf59Omb0ANZx9hrmwakiP1x0lQgMn9X8O8hWWMsJ/tA
         VyxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750251681; x=1750856481;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MwPmC4rB7OScgZGMULM/tOFBwkzQyDxae5kaoIAMOhs=;
        b=h4LQN66IlnVYulGDCuBN7AFMj/RMfjxmn4W6NuC8F1iSEqK2BsWPzScGuyEMcxvaoK
         QrFKAbM6Jyaz0b+wFC19jFfI6JMdXUB8khGBAtpgXXKOaMr2boRGc2/U4az4Iu8N1+xp
         OpkNZkXitkgb7swq5CYkOiMysyrUdzeFnLtCR0thCJegRCmOgY5hoPskW/yOQ+1U1Rji
         5jRREIkm3ILs5IQAGkS9Vsq0Zhr9N9lkhtWW69FHMBPxiUyutX9l9VeRygkRyjm/Hgnv
         9gvvOUi32Tcv4itHRThwlLbGw/0ixhA7Q7aM5Ewl7pJtkWias0GmFnQU3ZyyJwv5t46G
         fOsQ==
X-Gm-Message-State: AOJu0YywTbtApdX/DP/qFAqvqK3WQhDBkucpWsu4SIVD0bI2gvKO9Mzx
	ZiMbwEIW+b/1yn2LuGAvXtcSkIvhZ7M+dzbNR6sYnSIbKRil/GfomTopN9T+aKtp4BbOj5sibQE
	d4fkJdTk=
X-Gm-Gg: ASbGncsExEowonJMFOYY1E1HxfTy2vYsrAH8XojvmilmjVJ7rse6QBnA0dZ+l/Thy0c
	y/kEVz4sbOTvPvob2DCWNdmYQQj8cHgsgIcB6zxnA3S9k8K1NAWnm7s1DAS3U+NHY47uHPtw4Ce
	ocy44u9HjZTJ2EIjEs9z6psV7gXhnCsLjhWVn62G73fwN/TCM/uXlW7ayrDHInCkjWMgI9Cfa9c
	dxs61FEOkyjd5l05Yi1iDpTCqcHo1eXJnSC4eYq3/ciUJXTXdOFu3FHjw8oW9kz26yOpdZPZLqo
	k3eAjR2rwlH7ZZTh9kJe1QOI1mWx9Vbpyx58L2hPlg8R4zMq1eTTbIno3XX4pWq0j6Vm5X5Rcn3
	mSxVo/p0X8XA3fdCGH1VGUQ==
X-Google-Smtp-Source: AGHT+IFMBoi6kHmid1EtpWDdLbsH9+MscNIeiqrrImhWv51T8CnSW6/CscMfyS9PaEtf2kHOLn5O2g==
X-Received: by 2002:a05:6102:442b:b0:4e5:9c06:39d8 with SMTP id ada2fe7eead31-4e7f60f09fcmr12543397137.5.1750251666841;
        Wed, 18 Jun 2025 06:01:06 -0700 (PDT)
Received: from localhost (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a72a2e94desm71398731cf.20.2025.06.18.06.01.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 06:01:06 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH] unzip: Fix build with GCC-15
Date: Wed, 18 Jun 2025 09:01:03 -0400
Message-ID: <20250618130103.3905926-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 13:01:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219008

From: Khem Raj <raj.khem@gmail.com>

Add a patch to remove redundant declarations

(From OE-Core rev: 20ae2ce01f5114f6df67c0cfb6d820fc1513cdcc)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Backport this to scarthgap so that it can build on systems with gcc 15
(e.g. Fedora 42).

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/recipes-extended/unzip/unzip/gcc15.patch | 17 +++++++++++++++++
 meta/recipes-extended/unzip/unzip_6.0.bb      |  1 +
 2 files changed, 18 insertions(+)
 create mode 100644 meta/recipes-extended/unzip/unzip/gcc15.patch

diff --git a/meta/recipes-extended/unzip/unzip/gcc15.patch b/meta/recipes-extended/unzip/unzip/gcc15.patch
new file mode 100644
index 0000000000..42a2f81681
--- /dev/null
+++ b/meta/recipes-extended/unzip/unzip/gcc15.patch
@@ -0,0 +1,17 @@
+Do not redefine gmtime(), localtime()
+
+They are already provided by system time.h header
+
+Upstream-Status: Inactive-Upstream [need a new release]
+
+Sign-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/unix/unxcfg.h
++++ b/unix/unxcfg.h
+@@ -117,7 +117,6 @@ typedef struct stat z_stat;
+ #  endif
+ #else
+ #  include <time.h>
+-   struct tm *gmtime(), *localtime();
+ #endif
+ 
+ #if (defined(BSD4_4) || (defined(SYSV) && defined(MODERN)))
diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
index c13e7a008e..0a88b4c092 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -32,6 +32,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/UnZip%206.x%20%28latest%29/UnZip%206.0/
         file://CVE-2022-0530.patch \
         file://0001-configure-Add-correct-system-headers-and-prototypes-.patch \
         file://0001-unix-configure-fix-detection-for-cross-compilation.patch \
+        file://gcc15.patch \
 "
 UPSTREAM_VERSION_UNKNOWN = "1"
 
-- 
2.49.0


