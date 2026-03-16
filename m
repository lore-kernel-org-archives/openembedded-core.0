Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3333F46435
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 09:30:09 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46892.1773653408651982555
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 02:30:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=RyyfjXzP;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48541edecf9so47155405e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 02:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773653407; x=1774258207; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QAtv6vR8EZH3EXwedp3FkGUvYBMCtzz2v1RHK6PD5GY=;
        b=RyyfjXzPYqq/11X2rcfXdZ+7VuswkdPIlG0s+sXFusuR69+JSrMnFkK4ZTKL3ZPyNI
         yRs2duMxkjCp6Sn27j77q5PpfHQpbL6ul2CyfG1hs8VHBg0gu+/lUdEbW3TsJp2rFE8S
         85deQKdQijVjBD3S/nidInJ0fuol82gKjAbos=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773653407; x=1774258207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QAtv6vR8EZH3EXwedp3FkGUvYBMCtzz2v1RHK6PD5GY=;
        b=nUfo5gVpDCCXRRmG6Wap3s+NEGPqGa/wxrx548dR9gAOBDE3QIuKLNW8JZHOs+8flM
         k9WJCApb4cIT2JVdlwW2gY4pJlXQNiqKiSx50afvvotD/Wq/ktYT7TS7ddwCof83YVWa
         j6PA6wyjx5k+T95JPKliAsxELNHEx6AnCx3bqqPMtFsW39QjfLdb6vuz13/0GkM632Qf
         b/HroFQQGoMVpfOn5GTWzjnbmcD1ZRkUbFFcBIVz4R5/FGiNgHE2x+ti4TF0H3hkiD69
         nxwkheISCiEw4TimAv78SVJyN4OP031iv+MFSBLHNEi7rFL3oyLAxIUCuy4Sk9ZhUVQi
         6c6Q==
X-Gm-Message-State: AOJu0YwqRP9mGZx/qrL3YyJS/QU+IoNIY2HWjAA4MbD6OYDZiw4fw1kR
	fnhCi6dwgSe98hZ40QpaExApXZm6/OK/a892TbJb6SNFu36iQc1JX2QFQAotJEbThTanhAmytxw
	5+lE/
X-Gm-Gg: ATEYQzziZsNuYCVsFU2r79JO3iZk2ESA6qadpm6QTzZ2fIAuZcGd/eb9OGLmDcHzUND
	iO3Cu1BTWEBKiavGBWv9Komdy0ewCCZCxb0UKdBTfmfl3gP+ozjPLp5nqv+WBrpURxNofIuu7ev
	l1se7cACtxIRkyuQ8Gp5TJ2ti8gx+iLQWImp+zlQH4YXx7MfXBN+CpkjSYebkMyL+C67NkieTIX
	zy2nlbIGdg9Wa61NQis6poFXhRA84YtHNm7Ol7bZJgQSDiBykQZ1h9G+/+/O7APKYz0QN70Cv07
	KqjByM8BmST2VIc1HPkRa1pPrsPGg0UntWy/HKSmecLUNuNXE1UHDuelKOT9B18iHavoJXeBK9x
	xZft3k7ccm7JBERermuTG9miz6F1Aga1mw/z0WrnoPzY2bwRVpRYseOuQvcUM75MeemNlGXWLIW
	YvJM2scxEWGQ/7Lwaak9BCV+8JnoWXhCP7VmSjBhBVFYbYL90YAF5xzl8sjcKoqkNsBqz9nm5mL
	UN08fZ/a6xPJi1JLA74qtueAbjIww45nw==
X-Received: by 2002:a05:600c:49a1:b0:485:4bd1:4c74 with SMTP id 5b1f17b1804b1-4855670c0damr126976955e9.32.1773653406563;
        Mon, 16 Mar 2026 02:30:06 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557a732cesm91138265e9.12.2026.03.16.02.30.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:30:06 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/17] tiff: patch CVE-2025-61143
Date: Mon, 16 Mar 2026 10:28:26 +0100
Message-ID: <944f481d214bebeaf51769d77fe16cd93cbff351.1773652940.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773652940.git.yoann.congal@smile.fr>
References: <cover.1773652940.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 09:30:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233229

From: Peter Marko <peter.marko@siemens.com>

Pick patch from merge request mentioned in NVD report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libtiff/tiff/CVE-2025-61143.patch         | 44 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-61143.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2025-61143.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-61143.patch
new file mode 100644
index 00000000000..ed0438fec97
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-61143.patch
@@ -0,0 +1,44 @@
+From 4d28af5fe61b1760f10981f5072ff1e6fd44f210 Mon Sep 17 00:00:00 2001
+From: Lee Howard <faxguy@howardsilvan.com>
+Date: Fri, 5 Sep 2025 21:44:49 +0000
+Subject: [PATCH] tiffcrop: avoid nullptr dereference
+
+Fixes #734
+
+CVE: CVE-2025-61143
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/4d28af5fe61b1760f10981f5072ff1e6fd44f210]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ tools/tiffcrop.c   | 2 +-
+ tools/tiffdither.c | 5 +++++
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index ae414efc..1cbb49b6 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -2561,7 +2561,7 @@ main(int argc, char* argv[])
+ 
+     if (dump.outfile != NULL)
+       {
+-      dump_info (dump.outfile, dump.format, "", "Completed run for %s", TIFFFileName(out));
++      dump_info (dump.outfile, dump.format, "", "Completed run for %s", out ? TIFFFileName(out) : "(not opened)");
+       fclose (dump.outfile);
+       }
+     }
+diff --git a/tools/tiffdither.c b/tools/tiffdither.c
+index 3c64fdc0..405527c7 100644
+--- a/tools/tiffdither.c
++++ b/tools/tiffdither.c
+@@ -84,6 +84,11 @@ fsdither(TIFF* in, TIFF* out)
+ 	    fprintf(stderr, "Out of memory.\n");
+ 	    goto skip_on_error;
+ 	}
++	if (imagewidth > TIFFScanlineSize(in))
++	{
++	    fprintf(stderr, "Image width exceeds scanline size.\n");
++	    goto skip_on_error;
++	}
+ 
+ 	/*
+ 	 * Get first line
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index 84c3028b458..4c2b0a800b4 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -65,6 +65,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2025-9900.patch \
            file://CVE-2025-8961.patch \
            file://CVE-2025-9165.patch \
+           file://CVE-2025-61143.patch \
            "
 
 SRC_URI[sha256sum] = "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8"

