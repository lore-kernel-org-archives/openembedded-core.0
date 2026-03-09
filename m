Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A377F3C25E
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 13:29:17 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14252.1773062956218691395
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 06:29:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j7G0paGZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: stondo@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-79881805788so122521267b3.0
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 06:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773062955; x=1773667755; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wl57JXew2r6uFcc9e/r4WPeGJYquYvBxMZAgrnb/Hhc=;
        b=j7G0paGZDwZ1C0IyCaiptmFxlk4M0bR/nwYAzI3QAM2UV56CwlONZM3ogPw8/yTrp4
         L/uwtpRSndOceuZKycBcBq9lZHUy6X6bQXiUfMYRiXcQEd8izPJ6Kkc22GL38069bQpQ
         L7dAP3qGOt0aEmpQ55qxfuR+l2RWZ9pMToNQRZqDihoZiQZXdVqbVtbS/Xo7IU4Ivj0I
         BqM0wpYSTDciLrHWDpeKBm5VZFHKlOICfQxMz/l08doMaAkkBCEHkiJ3qqYPEs7minaV
         IHNvVHRFGekpv83JgilNb5WJxBQe7CsshTM6MlU5cKqy0SQhJ+lRrMvZNxeLuZto/Mgl
         FEQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773062955; x=1773667755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wl57JXew2r6uFcc9e/r4WPeGJYquYvBxMZAgrnb/Hhc=;
        b=Gi3bPz8i1OP1y8qEdcL8vt+oo+zndqZwDAdLlGNTbNl7Jqhoue3t0OV9S9Lun6K9ls
         f8jruVpECHYpS5kz1bwQfBzPyl3gXSV016899O8tZfKz3wTCU7gFIZWETpe5DzAToWG5
         hLVnWVCWIYjLIfAekq5uuF1XxEen7OHSj4GfydW5wHEqaEBVB1rUkrJu5tzSUzd6b0z/
         +aeuKPWm9o/FXEtAbTOphSVrQdkurDzFXGSLizgcHrMW9JsERgERYdPRpeV2l37ushhB
         gO37tWKYev9cQZhUMaFuMmntzWl6Z2C4bvRtDTvxzUzJ6v5VV1iW6RZBkXgaXihgAhMc
         /3Bw==
X-Gm-Message-State: AOJu0Yz5k8iifN0F7CrJyJ8Cqd8cBxINf6UsWBinzIgl6VzU6bPzQUyQ
	7eciwJpl5f+6/F2jbHA55MS/Oap615sm8VqQq2R4wkGDas3aFc38KfZWW0zTNw==
X-Gm-Gg: ATEYQzyoK2qhz5XNnvsCqkF0pM44AlqrKmfpAMED02gT9c9rhWXh181l2WG3SGBNO89
	147zH+nLfX9G11JdlbiUHJjvK/ScYGykFRHDWJZdZ0od2wP6wQID1BaVZ/jn+AHgLLzcFp/cfXj
	RqmPQQ8K0MzgHROHo5W2UTblRlGhsVgxa5ae4V4asW/OyHsMxYm+ns69WmBYIO8iSdWmeOudKmk
	4U1egFNS49zwd+CxDgpXRXsgXDcpsEoyVepROWYmYcFcqenbIZZdOpriXbH0D+yurnaULbymari
	orkDu6nmk+XmTFjxOcrQ5UzAkvOLS3/pM8lwYnBjJpXWVY62zsqyZ+70sv1tZuRY/VcpwaKoJLg
	oQSHuNV5iaEVLCFcaUzjO/ZmBWQaaI6FtApVLTfwiRjDBDSF6BhUp+E6Yhune17HZARAzPz14nv
	K1qq4NcTra7yBNkEqRzx8sI5f21hJAboE5rhxigdBajhh5V5fMacyuGNiGq2HKegAm+BwvKUfXk
	RPuceeQ
X-Received: by 2002:a05:690c:84:b0:794:d3e6:a503 with SMTP id 00721157ae682-798dd67c443mr103448287b3.24.1773062955092;
        Mon, 09 Mar 2026 06:29:15 -0700 (PDT)
Received: from fedora (mob-194-230-161-149.cgn.sunrise.net. [194.230.161.149])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-798dee6afd5sm44299437b3.45.2026.03.09.06.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 06:29:14 -0700 (PDT)
From: stondo@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ross.Burton@arm.com,
	jpewhacker@gmail.com,
	stefano.tondo.ext@siemens.com,
	Peter.Marko@siemens.com,
	adrian.freihofer@siemens.com,
	mathieu.dubois-briand@bootlin.com
Subject: [OE-core][PATCH v8 3/7] spdx30: Add ecosystem-specific PURL generation via bbclasses
Date: Mon,  9 Mar 2026 14:28:50 +0100
Message-ID: <20260309132854.128375-4-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260309132854.128375-1-stondo@gmail.com>
References: <cover.1772805096.git.stefano.tondo.ext@siemens.com>
 <20260309132854.128375-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 13:29:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232712

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
index 344e8b4bec..aec69ebfd3 100644
--- a/meta/classes-recipe/npm.bbclass
+++ b/meta/classes-recipe/npm.bbclass
@@ -354,4 +354,11 @@ FILES:${PN} += " \
     ${nonarch_libdir} \
 "
 
+# Generate ecosystem-specific Package URL for SPDX
+def npm_spdx_name(d):
+    bpn = d.getVar('BPN')
+    return bpn[4:] if bpn.startswith('node-') else bpn
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


