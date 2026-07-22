Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FF4AC531D1
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 17:24:11 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5455.1784741041983153472
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 10:24:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=aeHwm21x;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4954d383e64so31688875e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784741040; x=1785345840; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=U0QyTfYaCzszJFLLLSFhTT7QUhHu+dKuo3U2nBrWr8k=;
        b=aeHwm21xK3w2sbwNhBIZ8IxFO5N6xYgKN1zcJ7ROamfiBpn837YX0TbUGn9aeseNAZ
         FWXdb1rzc7bRwHMW0TrZPjgtx/PQXuArsr3JQZgnDgkOxF18EyVeqYCx6RGOkKOEu+nr
         HskkmURrIFfYm1M67sPn88txSUPwABId+UOIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784741040; x=1785345840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=U0QyTfYaCzszJFLLLSFhTT7QUhHu+dKuo3U2nBrWr8k=;
        b=V6YMBtO+R1pX49FIcAyRZ0lPcKAGndazvU7xE5s9PdxIsaaW1/z7LahWoxZXxhRPfc
         ebCQxaJOZGcxKEoOSROgXQ3dAkvQYtl0ZN6V12UHdaMkScabse6hUO+j0irS6OHmBr5v
         13ausu6gkilxeYw41Lb3ixpYv5u1hhGwgHt6RfWzvHydtpMA7gB0nWRAoomx/WIwsxZh
         KzQIQuRbmgdEYNfXELBH2QF76X7JNrL9Oh1R3cjw6l+L5DnXdrsiiSwd47rdjLKmRvHu
         C8DyE97/p7J6UYJ0FLg0Mc0G5zUFiVNoBc26/GPbvZcS82QO4RUlL4saQKC1jrQAv1YZ
         PMEA==
X-Gm-Message-State: AOJu0YwAIjvxp4fd6b3jyzCgDn60+YCo9FOPgfzQdpd0JlbHyMvsP2tA
	rG39Fe7YgOuNphSErJq7/D6QjNkFrzmzm+PFWpllAiPfuljg5/9HsNWtiED1VsSYfNeNlX6I1nZ
	T2kG4u3U=
X-Gm-Gg: AR+sD12cri0/uuAZoc1WLm0OkFMDKD0m3MWf3iXhHty5QuQmYzNbWbIkr5d2reDofRY
	3Ng252eAUUPesP79cpVfp8iVJ8Rc2iq7G+1BpsrJIDng3phP/2RWVmAMZnixh9C+/ZWsO/tgjaz
	N/Q53d2ImSuV4tsVXnxvEIffhYDSY9auAl2+0ml3qr5SUga6A9T9JLFu2DWsObBNlOQ5QOcJRuP
	un6BMJ08SM7wUQCES+Eht8EFQDVnnBCrM7Krya727ViJ0OmAkeF5O01w/kIB6M3w96mmYAJOOHV
	g6Xa4OoeNJMqJXY5hX8g3YFULynpFGhf0q0R7/7fcrHmxziakQPEU0Z62hbZv6+Rya8Zj7/nW6V
	A66muSgPuPpHm8MI2Pb1EgyIMLxnusBLxQs+fWttq69oHmsxUB4qqMgTT/NuBREnhtETQ4qNCFo
	xfYBYuWux8b1rpMc8QOcrZSkeFFrd3xv5bLxVpI9vnnasX4U0LbExN2FiEexkKSyDdDVvWLFGvV
	evLYmzwXkV4
X-Received: by 2002:a05:600c:524a:b0:495:641a:bd3f with SMTP id 5b1f17b1804b1-495641abe94mr140370045e9.13.1784741040107;
        Wed, 22 Jul 2026 10:24:00 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653c8760sm148275275e9.14.2026.07.22.10.23.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 10:23:59 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 05/27] expat: fix CVE-2026-56410
Date: Wed, 22 Jul 2026 19:23:18 +0200
Message-ID: <63cdc2b7257b31bbb486762aebcd5e42f04dca8e.1784740870.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784740870.git.yoann.congal@smile.fr>
References: <cover.1784740870.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 17:24:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241715

From: Deepak Rathore <deeratho@cisco.com>

These patches apply the upstream fixes shown in [1] and [2], as
referenced by [3].

[1] https://github.com/libexpat/libexpat/commit/deeb97f7c88d17a16b0ea2521a13733abc283347
[2] https://github.com/libexpat/libexpat/commit/cee20e91bf14dc7f6d2fc48f0d70d86b2dc3afea
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-56410

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../expat/expat/CVE-2026-56410_p1.patch       | 40 ++++++++++++++++++
 .../expat/expat/CVE-2026-56410_p2.patch       | 41 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.7.5.bb        |  2 +
 3 files changed, 83 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56410_p1.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56410_p2.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-56410_p1.patch b/meta/recipes-core/expat/expat/CVE-2026-56410_p1.patch
new file mode 100644
index 00000000000..aa4378f1b77
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56410_p1.patch
@@ -0,0 +1,40 @@
+From 759b77a8439bcbf57c86900bc472d46d8ef70c92 Mon Sep 17 00:00:00 2001
+From: netliomax25-code <netliomax25@gmail.com>
+Date: Fri, 29 May 2026 17:51:25 +0530
+Subject: [PATCH] xmlwf: protect resolveSystemId from integer overflow
+
+CVE: CVE-2026-56410
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/deeb97f7c88d17a16b0ea2521a13733abc283347]
+
+Backport Changes:
+- Adjust the removed allocation line for Wrynose's explicit malloc cast while
+  keeping upstream's overflow checks and final allocation logic.
+
+(cherry picked from commit deeb97f7c88d17a16b0ea2521a13733abc283347)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/xmlwf/xmlfile.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/expat/xmlwf/xmlfile.c b/expat/xmlwf/xmlfile.c
+index c4eb839f..31a40209 100644
+--- a/expat/xmlwf/xmlfile.c
++++ b/expat/xmlwf/xmlfile.c
+@@ -138,8 +138,13 @@ resolveSystemId(const XML_Char *base, const XML_Char *systemId,
+ #endif
+   )
+     return systemId;
+-  *toFree = (XML_Char *)malloc((tcslen(base) + tcslen(systemId) + 2)
+-                               * sizeof(XML_Char));
++  const size_t charsRequired = tcslen(base) + tcslen(systemId) + 2;
++
++  /* Detect and prevent integer overflow */
++  if (charsRequired > SIZE_MAX / sizeof(XML_Char))
++    return systemId;
++
++  *toFree = malloc(charsRequired * sizeof(XML_Char));
+   if (! *toFree)
+     return systemId;
+   tcscpy(*toFree, base);
+-- 
+2.43.7
diff --git a/meta/recipes-core/expat/expat/CVE-2026-56410_p2.patch b/meta/recipes-core/expat/expat/CVE-2026-56410_p2.patch
new file mode 100644
index 00000000000..71f3122602a
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56410_p2.patch
@@ -0,0 +1,41 @@
+From f16fa442eaa81bfceec5302d977219959eaac7b7 Mon Sep 17 00:00:00 2001
+From: netliomax25-code <netliomax25@gmail.com>
+Date: Sat, 30 May 2026 11:28:51 +0530
+Subject: [PATCH] xmlwf: guard each operator in resolveSystemId length sum
+
+CVE: CVE-2026-56410
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/cee20e91bf14dc7f6d2fc48f0d70d86b2dc3afea]
+
+(cherry picked from commit cee20e91bf14dc7f6d2fc48f0d70d86b2dc3afea)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/xmlwf/xmlfile.c | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/expat/xmlwf/xmlfile.c b/expat/xmlwf/xmlfile.c
+index 31a40209..15c69217 100644
+--- a/expat/xmlwf/xmlfile.c
++++ b/expat/xmlwf/xmlfile.c
+@@ -139,9 +139,17 @@ resolveSystemId(const XML_Char *base, const XML_Char *systemId,
+ #endif
+   )
+     return systemId;
+-  const size_t charsRequired = tcslen(base) + tcslen(systemId) + 2;
++  const size_t baseLen = tcslen(base);
++  const size_t systemIdLen = tcslen(systemId);
+ 
+-  /* Detect and prevent integer overflow */
++  /* Detect and prevent integer overflow in the addition (without risking
++     underflow) */
++  if (baseLen > SIZE_MAX - systemIdLen || baseLen > SIZE_MAX - systemIdLen - 2)
++    return systemId;
++
++  const size_t charsRequired = baseLen + systemIdLen + 2;
++
++  /* Detect and prevent integer overflow in the multiplication */
+   if (charsRequired > SIZE_MAX / sizeof(XML_Char))
+     return systemId;
+ 
+-- 
+2.43.7
+
diff --git a/meta/recipes-core/expat/expat_2.7.5.bb b/meta/recipes-core/expat/expat_2.7.5.bb
index 789fd7e077b..5c93b15484e 100644
--- a/meta/recipes-core/expat/expat_2.7.5.bb
+++ b/meta/recipes-core/expat/expat_2.7.5.bb
@@ -24,6 +24,8 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-56408.patch;striplevel=2 \
            file://CVE-2026-56404.patch;striplevel=2 \
            file://CVE-2026-56405.patch;striplevel=2 \
+           file://CVE-2026-56410_p1.patch;striplevel=2 \
+           file://CVE-2026-56410_p2.patch;striplevel=2 \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"

