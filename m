Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6A1CF532F6
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 17:14:54 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2649.1774372488944652009
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 10:14:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=mnenAzUD;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-486ff3a0fc1so36419655e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 10:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774372487; x=1774977287; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wETWTqGBvIWwo6HMkLI2RYn4pwsI8mimLqFkKyv2x3c=;
        b=mnenAzUD+9fabt0HCmQKwWZ3VIiia/pAtjFI7bw9V8RQnBo7+lKnVv5TOh5SUk2D2Q
         rTLA/9sxfeVc9eiH+PU9+A8XqJEOKDFwnZFNCa7K+AAZKo+kik59cRbZBiRp5t2NG0P5
         konORKsO6fXHjmPnq7ePqrlo0G2G5Sqcp6HxB5FWkHMzZjTPo7p1QZobUHv/lxe3I4nE
         fpeYO32SWvvUS1GiARChKMyv/Kv2OwukhKtLlrsZwB70PM6VLN4NdwylPTS00+Js81y2
         bEQ79vMPrE8yMn8oo8gjfJH8Ct8UkBNhvmNgyp8xSNULU7S3dfuf5UEozfgSZ/1C6jbV
         L3mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774372487; x=1774977287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wETWTqGBvIWwo6HMkLI2RYn4pwsI8mimLqFkKyv2x3c=;
        b=lb8jyy/gclCpgarqttZtgLI4ZOx2oYRzLrllIXK0DS0oTrEEQjrmw3TKVJoBoZ3fG7
         dtQOJrU2L6dH+4pD+pOCT+6EFxBulFK4uWE+nujZNeuRpiwDE4KnhXOwPjsRAHGSJzaH
         RxSO9f9i5dz23Yvj/ut075u0MZltIQBpR91FOSY4omOvhSP8v5MfINthW0bfAD3xtZ05
         HP5Jb1o1XhGMTdbND1hMPzZipQ6CND7P8qi+NZeimVBYTBFo9nxj10IUHc4Jeb5Aoc7+
         clLWJD5AAKmoM79Y1MPIS/RuSRRdJbu+Nyjfnk8Zli1qAvFU0z8+LSU2q7HFetRqXP3f
         0U+A==
X-Gm-Message-State: AOJu0YzXSupc1MlUdSUNgq5H15IPfZ0FvvDtNFg23lNMjmrwe9++3/Y5
	loazk0XGI76WHAQZ5ejSIKYQfsa6hXQ10UM1bFDWMYWMEDMbVbunBzV1MbTj7nDq
X-Gm-Gg: ATEYQzw70wTztowl9ilR2nQDx2cWkNbP4/ukWQELDKvQ0vfTa7ETSPXnAFJPSpGyX28
	klcFF0WpGMhxWXKnaPjUyPJh6DhpG1TAOgsgWZX17Ot+FdDFBGEjsYKtWxbBw/r2VJnF1dhAzms
	FEuYGpvbhx0HYW/jclST6oibjXTTgnR9iZ7GHfYAF0fKRWAD54hoF3eGGDdG+tYAkxz0V3pQg0b
	w1ity88fce+wHhASDIk4zCxAuYIz11V/21Hy/M7dF2nSvk2Ck3Ry/acD8UHtY+82qVPFjD9TTIU
	knrFKYYrU1akDEWgn2FJF+3uc7CLduvtDtbyzxEviDRkT90BqewwoVtgbHnupKQ16AF6+rILS0X
	5CQRgT7zQ/OGAcm9iJ6NiSmeBgyIzpkLTmgw40XclmrDi6Qq/vin6a+FZ8TIbgkZvUl9CpDpSyP
	3JPz3EecST5ICahS3xZGDQ5wPu9eJylr4g+BPDGE2iPkyZg8yrYfThRxOwv/Vijbw3O5+EoW9Rq
	st+S5MthFnrcDumnK5y+Ir7Rw==
X-Received: by 2002:a05:600c:1d0e:b0:485:3ec6:e634 with SMTP id 5b1f17b1804b1-48715febda2mr8525915e9.15.1774372486931;
        Tue, 24 Mar 2026 10:14:46 -0700 (PDT)
Received: from fedora (mob-194-230-148-205.cgn.sunrise.net. [194.230.148.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487165e8e0csm1089275e9.1.2026.03.24.10.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 10:14:46 -0700 (PDT)
From: Stefano Tondo <stondo@gmail.com>
X-Google-Original-From: Stefano Tondo <stefano.tondo.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	ross.burton@arm.com,
	jpewhacker@gmail.com,
	stefano.tondo.ext@siemens.com,
	peter.marko@siemens.com,
	adrian.freihofer@siemens.com,
	mathieu.dubois-briand@bootlin.com
Subject: [PATCH v16 3/5] spdx30: Add ecosystem PURLs for recipe classes
Date: Tue, 24 Mar 2026 18:12:44 +0100
Message-ID: <20260324171246.686862-4-stefano.tondo.ext@siemens.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324132958.2316491-1-stondo@gmail.com>
References: <20260324132958.2316491-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 17:14:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233811

Add SPDX_PACKAGE_URLS to recipe classes to generate ecosystem-specific
Package URLs for SPDX 3.0 SBOMs. This enables proper package
identification across different packaging ecosystems.

Classes updated:
- cargo_common.bbclass: pkg:cargo PURLs for Rust crates
- cpan.bbclass: pkg:cpan PURLs for Perl modules (with name normalization)
- go-mod.bbclass: pkg:golang PURLs for Go modules
- npm.bbclass: pkg:npm PURLs for Node.js packages (with name normalization)
- pypi.bbclass: pkg:pypi PURLs for Python packages (with name normalization)

The SPDX_PACKAGE_URLS variable is a space-separated list which
create-spdx-3.0 already reads via set_purls() to populate
software_packageUrl and externalIdentifier on recipe packages.

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
index bb76a5b326..dbf44da9d2 100644
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
index 9d46c035f6..bd21557c60 100644
--- a/meta/classes-recipe/pypi.bbclass
+++ b/meta/classes-recipe/pypi.bbclass
@@ -54,3 +54,6 @@ UPSTREAM_CHECK_URI ?= "https://pypi.org/simple/${@pypi_normalize(d)}/"
 UPSTREAM_CHECK_REGEX ?= "${UPSTREAM_CHECK_PYPI_PACKAGE}-(?P<pver>(\d+[\.\-_]*)+).(tar\.gz|tgz|zip|tar\.bz2)"
 
 CVE_PRODUCT ?= "python:${PYPI_PACKAGE}"
+
+# Generate ecosystem-specific Package URL for SPDX
+SPDX_PACKAGE_URLS =+ "pkg:pypi/${@pypi_normalize(d)}@${PV} "
-- 
2.53.0


