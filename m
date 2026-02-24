Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12DB9F357A0
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:25:11 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21460.1771943101456830680
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:25:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=a/yYUP+g;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4806bf39419so49183045e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943099; x=1772547899; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H+6GSdf8pS2pGu381hGK9CTGN+FL5DoljphyBV7lIY0=;
        b=a/yYUP+gDUZDSx5m4xgkg2aD3ECjeYVIHPCYA9Cw6yZ5WpIOb/qio/7OHPDkOQfZG+
         nGmVR3UITfoebUBIM91HzH9O5Xz94WzSbP5/jap+vfC/MKvLSBdfdfjmMA30wFpfpQOZ
         enyCoaHe3rSxwW7221kjQmEq+p6CVFKAGJw0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943099; x=1772547899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H+6GSdf8pS2pGu381hGK9CTGN+FL5DoljphyBV7lIY0=;
        b=TBn9ICXawwsXNEjsDrx4/2jVrbMfFqduwx67IVn2Jv/BWWV95RvBjE1pbJn09XpvSf
         DJf+05bDQNTJf09kNkuieI7+TBY4AgGVi2f1G+P0K+Tc8MZ1k3zxLJeWp9FKeX/KkTzU
         ns0+TN6jEZaSDLIDQ0TRjrVDCY+G6V4nUtz7HlX86M/H1r5slSIVm5GycrrnsbN4YlL7
         eTfSxz6p9jyAVSfVUHZyWSq1cwHWS1tlZ5VVHnHR0GaWA0plJu1C7sGfsRdpU8/0DVoN
         UZJhkozCw78jaTVKLDa27Y3fu33EpZuhH1C/W+CGCYC8v31/V4qgm+2r34Ua8YWToHsr
         Nc5Q==
X-Gm-Message-State: AOJu0YyAnwyVA7tQjrkTBnEs9PGeWFgTj+PY6bjEm4IvN3YNGRHMJf1j
	eJOJMiVGZOCYkFq3fkeq0A4vzpnoVopKBFvQBN+M/YLLBW4xcbch6MU9fNOGN+/af9E8S7+Kgas
	Zf6C5
X-Gm-Gg: AZuq6aLWvML4/j+RzvY8rbcLfF0kXS5V/9lCeK394Xk39K0CT86X4C6kc+0tOW8fKJS
	v0npsKTbGx18+O9mAn0TlQ25Zij2pAGyGNV/RDFg/JRE0Nbub2CXXWiKvSWr6ug/KT2c6L673BZ
	KuYGWgnIbhWdCc4xcJ1MY343ZT9lHm/NF8XYDQNu+1q07vvir2u6fy118tPieDfNLjrBDssEgFK
	BgLi2RGNbukPAtCUKSHZjPPmbZPhyACzMMPeOB/TVaz+d4huhZ7MeThRZiG/ThGRsIQAPGpUXfr
	M1lduC6idA5kGF4DL+g5mda7ECoprdnO9vzh34OrNRvq77eKBditR9l8/u8qRG8Gx6ffUzO4IZB
	Wj7C+6muiPvJq5l72Be4ePlXPEDFShBaKMbOxhJHdTXq9+oGS3B1byP2YAqBDK9UOxkKV47YvN8
	OffUtJCFHE+wZVQooWj0ygXGCyy4QR+3ncSt0AuFhm5+8KeJ5lKtQhibN+zChlywGK4JxIXOD9o
	rjzl6UXYKAl5RZbpCNYbtakQ07FCjOmwA==
X-Received: by 2002:a05:600c:81c8:b0:47d:403a:277 with SMTP id 5b1f17b1804b1-483bd7253cbmr2509155e9.4.1771943099449;
        Tue, 24 Feb 2026 06:24:59 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7507adsm2047455e9.9.2026.02.24.06.24.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:24:59 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/38] expat: patch CVE-2026-25210
Date: Tue, 24 Feb 2026 15:24:00 +0100
Message-ID: <075bfc938aefc369ed6bca177627cb1f8dd5dfca.1771942869.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771942869.git.yoann.congal@smile.fr>
References: <cover.1771942869.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:25:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231774

From: Peter Marko <peter.marko@siemens.com>

Pick patches from [1].

[1] https://github.com/libexpat/libexpat/pull/1075

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../expat/expat/CVE-2026-25210-01.patch       | 27 ++++++++++++++
 .../expat/expat/CVE-2026-25210-02.patch       | 37 +++++++++++++++++++
 .../expat/expat/CVE-2026-25210-03.patch       | 28 ++++++++++++++
 meta/recipes-core/expat/expat_2.5.0.bb        |  3 ++
 4 files changed, 95 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-25210-01.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-25210-02.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-25210-03.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-25210-01.patch b/meta/recipes-core/expat/expat/CVE-2026-25210-01.patch
new file mode 100644
index 00000000000..cdd5f13338c
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-25210-01.patch
@@ -0,0 +1,27 @@
+From 7ddea353ad3795f7222441274d4d9a155b523cba Mon Sep 17 00:00:00 2001
+From: Matthew Fernandez <matthew.fernandez@gmail.com>
+Date: Thu, 2 Oct 2025 17:15:15 -0700
+Subject: [PATCH] lib: Make a doubling more readable
+
+Suggested-by: Sebastian Pipping <sebastian@pipping.org>
+
+CVE: CVE-2026-25210
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/7ddea353ad3795f7222441274d4d9a155b523cba]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/xmlparse.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 8cf29257..2f9adffc 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -2977,7 +2977,7 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+             tag->name.strLen = convLen;
+             break;
+           }
+-          bufSize = (int)(tag->bufEnd - tag->buf) << 1;
++          bufSize = (int)(tag->bufEnd - tag->buf) * 2;
+           {
+             char *temp = (char *)REALLOC(parser, tag->buf, bufSize);
+             if (temp == NULL)
diff --git a/meta/recipes-core/expat/expat/CVE-2026-25210-02.patch b/meta/recipes-core/expat/expat/CVE-2026-25210-02.patch
new file mode 100644
index 00000000000..d690a6e8fa7
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-25210-02.patch
@@ -0,0 +1,37 @@
+From 8855346359a475c022ec8c28484a76c852f144d9 Mon Sep 17 00:00:00 2001
+From: Matthew Fernandez <matthew.fernandez@gmail.com>
+Date: Thu, 2 Oct 2025 17:15:15 -0700
+Subject: [PATCH] lib: Realign a size with the `REALLOC` type signature it is
+ passed into
+
+Note that this implicitly assumes `tag->bufEnd >= tag->buf`, which should
+already be guaranteed true.
+
+CVE: CVE-2026-25210
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/8855346359a475c022ec8c28484a76c852f144d9]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/xmlparse.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 2f9adffc..ee18a87f 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -2966,7 +2966,6 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+         const char *fromPtr = tag->rawName;
+         toPtr = (XML_Char *)tag->buf;
+         for (;;) {
+-          int bufSize;
+           int convLen;
+           const enum XML_Convert_Result convert_res
+               = XmlConvert(enc, &fromPtr, rawNameEnd, (ICHAR **)&toPtr,
+@@ -2977,7 +2976,7 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+             tag->name.strLen = convLen;
+             break;
+           }
+-          bufSize = (int)(tag->bufEnd - tag->buf) * 2;
++          const size_t bufSize = (size_t)(tag->bufEnd - tag->buf) * 2;
+           {
+             char *temp = (char *)REALLOC(parser, tag->buf, bufSize);
+             if (temp == NULL)
diff --git a/meta/recipes-core/expat/expat/CVE-2026-25210-03.patch b/meta/recipes-core/expat/expat/CVE-2026-25210-03.patch
new file mode 100644
index 00000000000..d8b38874286
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-25210-03.patch
@@ -0,0 +1,28 @@
+From 9c2d990389e6abe2e44527eeaa8b39f16fe859c7 Mon Sep 17 00:00:00 2001
+From: Matthew Fernandez <matthew.fernandez@gmail.com>
+Date: Thu, 2 Oct 2025 17:15:15 -0700
+Subject: [PATCH] lib: Introduce an integer overflow check for tag buffer
+ reallocation
+
+Suggested-by: Sebastian Pipping <sebastian@pipping.org>
+
+CVE: CVE-2026-25210
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/9c2d990389e6abe2e44527eeaa8b39f16fe859c7]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/xmlparse.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index ee18a87f..d8c54c38 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -2976,6 +2976,8 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+             tag->name.strLen = convLen;
+             break;
+           }
++          if (SIZE_MAX / 2 < (size_t)(tag->bufEnd - tag->buf))
++            return XML_ERROR_NO_MEMORY;
+           const size_t bufSize = (size_t)(tag->bufEnd - tag->buf) * 2;
+           {
+             char *temp = (char *)REALLOC(parser, tag->buf, bufSize);
diff --git a/meta/recipes-core/expat/expat_2.5.0.bb b/meta/recipes-core/expat/expat_2.5.0.bb
index ae661947c3a..c22dad2bbc1 100644
--- a/meta/recipes-core/expat/expat_2.5.0.bb
+++ b/meta/recipes-core/expat/expat_2.5.0.bb
@@ -31,6 +31,9 @@ SRC_URI = "https://github.com/libexpat/libexpat/releases/download/R_${VERSION_TA
 	   file://CVE-2024-50602-01.patch \
 	   file://CVE-2024-50602-02.patch \
 	   file://CVE-2026-24515.patch \
+	   file://CVE-2026-25210-01.patch \
+	   file://CVE-2026-25210-02.patch \
+	   file://CVE-2026-25210-03.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/libexpat/libexpat/releases/"

