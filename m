Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BED01067058
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 15:39:03 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24809.1773329934152694100
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 08:38:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TEn/9DWc;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso10973705e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 08:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773329932; x=1773934732; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mONOHvk/OmqCLm44EETWVV+hfJKTNVXf0N35fgzzKWM=;
        b=TEn/9DWcZoCY/NBhAsnTgeXJqgP60EzlXaZXcukAWMwV7HL13QFg+tutsK9QCor13T
         hT8tj2EnRuRaGKWjoFSn8FdfnQJevMudV7zkwPyqAk3I6WuOHYXuqijgDcusYoyqSjI+
         jIrCtteifYMrp/6vLlUH8QHmvNfu9cyNbgFN06AYXOut5VXEVQGGU7x81/MW6CiRh6yB
         57omczWO6E8f7Fai2fXvtXOO3CPp4yHRhdVOASiuyQjmeKK5mlxf8X2w+Xkk4DAl7eBT
         Ehfp2wAzCDDG7NENUBTB7NdtNtSEQ3JGMmTzT1S8//vP20KKRHrscY5lw74x0HCNFMCV
         Znsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773329932; x=1773934732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mONOHvk/OmqCLm44EETWVV+hfJKTNVXf0N35fgzzKWM=;
        b=ap6+eq4fuDv5Quk9tuqcn4zFC53b7VxR90Nb9ny5Mlmmeu0uu/zPIv9z5kAV6umm2n
         Qkqp25zbpd1JiiQKBwiJl5l8zfchswiS7Zrv7xCkQBUkSlLforMt8oET40HwbSVKtGxT
         /5GiZ+CSkEhYm/HzIhVZmUX+LHXn4gGeCaB14oyBKlw4CU93dBdmLDbQX8fNxk/yOt9T
         F0cceDx6wt3w7uqhdutgeNtrqOa/ulfBTvMUy4URifoltq6KyI71pSlycGnT8KAz31sl
         0r0627JgbAVRqbxXSK0sTKTbTjMCbfR4yNxIRJA3ymssumlEM7+QdrMHJKwRMazcPn5w
         dhRg==
X-Gm-Message-State: AOJu0YyDck12pAXRDd7bIgeXX7nIx48W5FkG4jNw78VegPGoFy9ElzXY
	DC4w+kkGwpGf3BC1WhaSSl5WG/a4hmanZjEt4S3lHwLKyhKcFU6t5WN3K/Vnlg==
X-Gm-Gg: ATEYQzxY2tlNOuqJ9taoanzE/QXltkh3gaDPLCTKhaAN7jpE3+5HjztWr2mT/tRBQU6
	kpEGmUNL9qJ10Tw4LIvzGDNClGz1uh+rqRPss7kjZVDE5gdS68wWV0N16VqlWcM03km2Rek5Bda
	34joVRgO0tk/UwB4LaRF/IdHUfHiV0k2/OpkGDSVbqHUEYqvJ7sUVTD7nouH6iNQSDmH8+P6v2S
	1OBRncOKYYXwVz6cQDkHr785ZmmJnMoDpVimV5Gehryfjoo5pK2F3PGJXrQEPmWnTiZugQpF98J
	gsjWSl7UWZ9sn+msxADZ65j3XAM6ccy418aS76CPrGb3lmiENcu+8rnQHQ2GVBbtGd0Mh1SpN0N
	KJv0Am+FYSTjgfG0SX17cREBc92yB1buC054O0CW6KkbbzktYHYudly2FvFWG6ndi6jgrumily/
	XbfgWyJyIolPHUpDKz0f0brXy/hTM+8YhrJ/g=
X-Received: by 2002:a05:600c:4fc9:b0:483:b505:9db7 with SMTP id 5b1f17b1804b1-4854b136cd2mr121062935e9.32.1773329932088;
        Thu, 12 Mar 2026 08:38:52 -0700 (PDT)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b0dcf2asm74857385e9.8.2026.03.12.08.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 08:38:51 -0700 (PDT)
From: stondo@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	Stefano Tondo <stefano.tondo.ext@siemens.com>
Subject: [OE-core][PATCH v9 3/7] spdx30: Add ecosystem-specific PURL generation via bbclasses
Date: Thu, 12 Mar 2026 16:38:41 +0100
Message-ID: <20260312153845.164369-4-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312153845.164369-1-stondo@gmail.com>
References: <20260309132854.128375-1-stondo@gmail.com>
 <20260312153845.164369-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 15:39:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232976

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

Have each ecosystem bbclass set its own Package URL by prepending to
SPDX_PACKAGE_URLS, rather than detecting inherited classes from the
SPDX code. This follows the principle that each class should know how
to describe itself.

The following bbclasses now generate ecosystem PURLs:
  - pypi.bbclass:         pkg:pypi/<normalized-name>@PV
  - npm.bbclass:          pkg:npm/<name>@PV
  - cargo_common.bbclass: pkg:cargo/<name>@PV
  - go-mod.bbclass:       pkg:golang/<GO_IMPORT>@PV
  - cpan.bbclass:         pkg:cpan/<name>@PV

Additional ecosystems (nuget, maven, dotnet) can follow the same
pattern in their respective layers.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/classes-recipe/cargo_common.bbclass |  3 +++
 meta/classes-recipe/cpan.bbclass         | 11 +++++++++++
 meta/classes-recipe/go-mod.bbclass       |  3 +++
 meta/classes-recipe/npm.bbclass          |  7 +++++++
 meta/classes-recipe/pypi.bbclass         |  3 +++
 5 files changed, 27 insertions(+)

diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-recipe/cargo_common.bbclass
index bc44ad7918..e884b344ef 100644
--- a/meta/classes-recipe/cargo_common.bbclass
+++ b/meta/classes-recipe/cargo_common.bbclass
@@ -240,3 +240,6 @@ EXPORT_FUNCTIONS do_configure
 # https://github.com/rust-lang/libc/issues/3223
 # https://github.com/rust-lang/libc/pull/3175
 INSANE_SKIP:append = " 32bit-time"
+
+# Generate ecosystem-specific Package URL for SPDX
+SPDX_PACKAGE_URLS:prepend = "pkg:cargo/${BPN}@${PV} "
diff --git a/meta/classes-recipe/cpan.bbclass b/meta/classes-recipe/cpan.bbclass
index bb76a5b326..355e7e6adf 100644
--- a/meta/classes-recipe/cpan.bbclass
+++ b/meta/classes-recipe/cpan.bbclass
@@ -68,4 +68,15 @@ cpan_do_install () {
 	done
 }
 
+# Generate ecosystem-specific Package URL for SPDX
+def cpan_spdx_name(d):
+    bpn = d.getVar('BPN')
+    if bpn.startswith('perl-'):
+        return bpn[5:]
+    elif bpn.startswith('libperl-'):
+        return bpn[8:]
+    return bpn
+
+SPDX_PACKAGE_URLS:prepend = "pkg:cpan/${@cpan_spdx_name(d)}@${PV} "
+
 EXPORT_FUNCTIONS do_configure do_compile do_install
diff --git a/meta/classes-recipe/go-mod.bbclass b/meta/classes-recipe/go-mod.bbclass
index a15dda8f0e..344712b193 100644
--- a/meta/classes-recipe/go-mod.bbclass
+++ b/meta/classes-recipe/go-mod.bbclass
@@ -32,3 +32,6 @@ do_compile[dirs] += "${B}/src/${GO_WORKDIR}"
 # Make go install unpack the module zip files in the module cache directory
 # before the license directory is polulated with license files.
 addtask do_compile before do_populate_lic
+
+# Generate ecosystem-specific Package URL for SPDX
+SPDX_PACKAGE_URLS:prepend = "pkg:golang/${GO_IMPORT}@${PV} "
diff --git a/meta/classes-recipe/npm.bbclass b/meta/classes-recipe/npm.bbclass
index 344e8b4bec..a0adcfa240 100644
--- a/meta/classes-recipe/npm.bbclass
+++ b/meta/classes-recipe/npm.bbclass
@@ -354,4 +354,11 @@ FILES:${PN} += " \
     ${nonarch_libdir} \
 "
 
+# Generate ecosystem-specific Package URL for SPDX
+def npm_spdx_name(d):
+    bpn = d.getVar('BPN')
+    return bpn[5:] if bpn.startswith('node-') else bpn
+
+SPDX_PACKAGE_URLS:prepend = "pkg:npm/${@npm_spdx_name(d)}@${PV} "
+
 EXPORT_FUNCTIONS do_configure do_compile do_install
diff --git a/meta/classes-recipe/pypi.bbclass b/meta/classes-recipe/pypi.bbclass
index 1372d85e8d..fd5cd7af95 100644
--- a/meta/classes-recipe/pypi.bbclass
+++ b/meta/classes-recipe/pypi.bbclass
@@ -55,3 +55,6 @@ UPSTREAM_CHECK_URI ?= "https://pypi.org/simple/${@pypi_normalize(d)}/"
 UPSTREAM_CHECK_REGEX ?= "${UPSTREAM_CHECK_PYPI_PACKAGE}-(?P<pver>(\d+[\.\-_]*)+).(tar\.gz|tgz|zip|tar\.bz2)"
 
 CVE_PRODUCT ?= "python:${PYPI_PACKAGE}"
+
+# Generate ecosystem-specific Package URL for SPDX
+SPDX_PACKAGE_URLS:prepend = "pkg:pypi/${@pypi_normalize(d)}@${PV} "
-- 
2.53.0


