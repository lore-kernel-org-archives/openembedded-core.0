Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A70B71075269
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 16:50:05 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17748.1774025398018252441
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 09:49:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EPq5HCgV;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4853e1ce427so7768305e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 09:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774025396; x=1774630196; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ls1UDLDCD1jxOHvKl4hO48AAskAjKnISa9I2igIpNdI=;
        b=EPq5HCgVHbI4xHwoJ+ceLoF2aZqoNBHISbKcFaVAui5yTPkRPXMS/2tc2/IW0NNsjj
         OZQdvv4MmQUQY9zR8sSGUPxVQYXpzTOiRzq8u/GJzmQcb5qKBrX8sP6M5OPPZXL/E8E+
         rvQld7baWtQdR30FZtbTnzYnsfcQqxmQNqjuW9xtbwd/18nsmC3+lkupHi+q0vyOJlez
         kDo6KXlYKxWcfolPeI+6ymZKmCVDfrq1za83bjGjktwcPHDzTFLHF1dOmgiR/T58GtQY
         9YI5JoP9gd0pWr90xmLWBRjTdk7GmTV4YpYD6Ma4PynBuYMQEXP6navQhnrt19ixYzJB
         p03A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774025396; x=1774630196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ls1UDLDCD1jxOHvKl4hO48AAskAjKnISa9I2igIpNdI=;
        b=hMReBb4xyRauck1oOUIyPsupPFRKr/k90Tlh46+TeRH0HlMe+aHkEiEn1lr9LthOg5
         690xL4xAxELySK598bB3iP6VubNtGjuTUF1F85X5QNUWV/3G2QIxY6sUg8/P5r3Inh0p
         VkqPzAxTnbseAxJRnvmwD57GTMbU4siopV10q2XlWuDxSCmUHZtY7RXDAeSfjmgYM7yy
         4yVH0PsVQ3WQzC5U/oj3ZeTNlpTVYvsYBUowEMwFNnFs7pgICkN0nwX6M9d8fsb7bsVZ
         HwQ/KKogVgTzGIuH1/GsrG/Xev88SkJYVP3GZwW8YRZlszdfAaOEA54kWKtZJJp3w5Kf
         zcmA==
X-Gm-Message-State: AOJu0Yxye7cN60O/rt34xoLTsZJ5CiYV666SLpgiTIISDhPG+y92xUeO
	vPA5wcqHn9IbonmZPE1X706CeuQhOi1V+6ZG3mkiLbd1OiOw717ZVbGLVOcAHs49
X-Gm-Gg: ATEYQzxiPPEI1ExYAdFR8h/y8SSRb+3V106c0ndSz6QtX/KVShsKOCGrfZcszLYVFfM
	npCm8xvILKeZykVapEwhmSdLk1cVsIUSm5c3IqreE0JUnLEt+810pK1Dmc2VeEUNdxvywFp1jqH
	pGClLtTlGTA9too+bka8Eea9u9LM6RkaT/lYZsDTR+DycG1DwCmwFeNol1gEyvSGfgbQFJvWJ5R
	J+8V+usBRoQ6QdeTi7kzwuaxUMEUJwglJXYCtHZWiY1Tm5Sc/LtnOPbnfSgxy+CNpdI/oNEu2jY
	ILrNHg0EDz6XxLMjgpOJ1W87mrIcJ5EX6nUA0Oala8Uox/8LhTkEPox4RUVeM1nOxx4XI9J/0+a
	4QRZ1MYUKvqWGzHso3kMEM2gup1zUN8sfq65SAN9JlwVnN/M8Bv3ZK/FdDmQ9Vy2922ygXMbEZ2
	P0oGvOPsY9YrcJBN/LscE6vuSI6cgvq1M0xQi7ElnE4p/Z2A==
X-Received: by 2002:a05:600c:3b8c:b0:486:d76c:fa51 with SMTP id 5b1f17b1804b1-486ff03ffa5mr49013895e9.27.1774025396003;
        Fri, 20 Mar 2026 09:49:56 -0700 (PDT)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe6d91fbsm73018905e9.3.2026.03.20.09.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 09:49:55 -0700 (PDT)
From: stondo@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	richard.purdie@linuxfoundation.org,
	stefano.tondo.ext@siemens.com,
	Peter.Marko@siemens.com,
	adrian.freihofer@siemens.com
Subject: [OE-core][PATCH v10 3/7] spdx30: Add ecosystem-specific PURL generation via bbclasses
Date: Fri, 20 Mar 2026 17:49:47 +0100
Message-ID: <20260320164951.128572-4-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320164951.128572-1-stondo@gmail.com>
References: <20260312153845.164369-1-stondo@gmail.com>
 <20260320164951.128572-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 16:50:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233623

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

Generate ecosystem-specific Package URLs for recipes that inherit
common language and package-manager classes.

Add class-level SPDX_PACKAGE_URLS entries for Cargo, CPAN, Go modules,
npm, and PyPI so source download enrichment can attach ecosystem PURLs
without recipe-specific duplication.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/classes-recipe/cargo_common.bbclass |  3 +++
 meta/classes-recipe/cpan.bbclass         | 11 +++++++++++
 meta/classes-recipe/go-mod.bbclass       |  3 +++
 meta/classes-recipe/npm.bbclass          |  7 +++++++
 meta/classes-recipe/pypi.bbclass         |  3 +++
 5 files changed, 27 insertions(+)

diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-recipe/cargo_common.bbclass
index bc44ad7918..0d3edfe4a7 100644
--- a/meta/classes-recipe/cargo_common.bbclass
+++ b/meta/classes-recipe/cargo_common.bbclass
@@ -240,3 +240,6 @@ EXPORT_FUNCTIONS do_configure
 # https://github.com/rust-lang/libc/issues/3223
 # https://github.com/rust-lang/libc/pull/3175
 INSANE_SKIP:append = " 32bit-time"
+
+# Generate ecosystem-specific Package URL for SPDX
+SPDX_PACKAGE_URLS =+ "pkg:cargo/${BPN}@${PV} "
diff --git a/meta/classes-recipe/cpan.bbclass b/meta/classes-recipe/cpan.bbclass
index bb76a5b326..87ebed124a 100644
--- a/meta/classes-recipe/cpan.bbclass
+++ b/meta/classes-recipe/cpan.bbclass
@@ -68,4 +68,15 @@ cpan_do_install () {
 	done
 }
 
+# Generate ecosystem-specific Package URL for SPDX
+def cpan_spdx_name(d):
+	bpn = d.getVar('BPN')
+	if bpn.startswith('perl-'):
+		return bpn[5:]
+	elif bpn.startswith('libperl-'):
+		return bpn[8:]
+	return bpn
+
+SPDX_PACKAGE_URLS =+ "pkg:cpan/${@cpan_spdx_name(d)}@${PV} "
+
 EXPORT_FUNCTIONS do_configure do_compile do_install
diff --git a/meta/classes-recipe/go-mod.bbclass b/meta/classes-recipe/go-mod.bbclass
index a15dda8f0e..0f5835f26e 100644
--- a/meta/classes-recipe/go-mod.bbclass
+++ b/meta/classes-recipe/go-mod.bbclass
@@ -32,3 +32,6 @@ do_compile[dirs] += "${B}/src/${GO_WORKDIR}"
 # Make go install unpack the module zip files in the module cache directory
 # before the license directory is polulated with license files.
 addtask do_compile before do_populate_lic
+
+# Generate ecosystem-specific Package URL for SPDX
+SPDX_PACKAGE_URLS =+ "pkg:golang/${GO_IMPORT}@${PV} "
diff --git a/meta/classes-recipe/npm.bbclass b/meta/classes-recipe/npm.bbclass
index 344e8b4bec..7bb791d543 100644
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
+SPDX_PACKAGE_URLS =+ "pkg:npm/${@npm_spdx_name(d)}@${PV} "
+
 EXPORT_FUNCTIONS do_configure do_compile do_install
diff --git a/meta/classes-recipe/pypi.bbclass b/meta/classes-recipe/pypi.bbclass
index 1372d85e8d..e2d054af6d 100644
--- a/meta/classes-recipe/pypi.bbclass
+++ b/meta/classes-recipe/pypi.bbclass
@@ -55,3 +55,6 @@ UPSTREAM_CHECK_URI ?= "https://pypi.org/simple/${@pypi_normalize(d)}/"
 UPSTREAM_CHECK_REGEX ?= "${UPSTREAM_CHECK_PYPI_PACKAGE}-(?P<pver>(\d+[\.\-_]*)+).(tar\.gz|tgz|zip|tar\.bz2)"
 
 CVE_PRODUCT ?= "python:${PYPI_PACKAGE}"
+
+# Generate ecosystem-specific Package URL for SPDX
+SPDX_PACKAGE_URLS =+ "pkg:pypi/${@pypi_normalize(d)}@${PV} "
-- 
2.53.0


