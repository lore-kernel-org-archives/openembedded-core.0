Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E530FEC0E8
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 17:15:25 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2663.1774372518769667251
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 10:15:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HdZjTtvu;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-486fe655187so53275935e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 10:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774372517; x=1774977317; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wETWTqGBvIWwo6HMkLI2RYn4pwsI8mimLqFkKyv2x3c=;
        b=HdZjTtvuzi30CgRP6ovMzOpTjAQ9/fFWrVm3eeCB+AX454IPTUhojRzk8H1JYaJhwU
         2S3ZoUPqORE60wtiw4lsIV0mikiFg8RS5Y9aHqfWzuoObLMG7ucTPB982F/H06YpWQst
         Z+mm3LrtKojtCzviS+qOLL4zHK5u4FPY8NPuU2mdEElPmd9np9B5FwdXxv6+0dqcyToQ
         D7Z6XeeI9xkUyJ6m49bW/7FaPTIphIboyqnzbstSIUSKq0K5a9XzKt+9y6CDrspIIURx
         Y7ku+5YvcX2+PhX+zprNWWorXFKbOE5qtxXXNbyTCanh23iqB+31QXPps0kMWv5yB1m7
         q9zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774372517; x=1774977317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wETWTqGBvIWwo6HMkLI2RYn4pwsI8mimLqFkKyv2x3c=;
        b=L+ickXYwUKXxhQKixYHUL8XO/poKlnoEyZo1M8XoAImihQnts0w3YFfrO2SMlnJO0R
         nKjNhWrBNNGordf56ZaMnB/o4VpUf7sqTsjcIK2NNman9KjtQamHKlzRp9qdi8h7MC5i
         32opVHtIXWn3fGxvCX2v5lxWviSmVwjR5RLpHcYN6cgpTBonep4SDJ8k/wxmz/wBapFd
         8C9Dygspo4MhKJKyRHHo652fT0lWF68DQ4NCI6JnONnEBvXi+jq3t1VYhqgvYYGIzlxu
         kH5lzRhgRumPevCGRXOas9F8z5xpUMsITS1kBAL8yZa8x0GMadJ/13xT/1vDFh9dn6AM
         hsew==
X-Gm-Message-State: AOJu0YxP053ptOcOABeJIM4OQat1ejzQwFb8vAThcHhSEtcryYyr00cT
	1McmkAA/hMLjHXDuDZY8QEftYT5His1aF7SntsgKquA7a6p8M2K3+hTrgZqqBCD/
X-Gm-Gg: ATEYQzxgp3RdmXKFzzv3Vy9SmB9gMzG91MPmklW8sHrrquUTRKt/XpKIRmTrQGLDz2b
	ZN+tMCKPhKXpLkl/r+Ed0a8oUQeG1BLoGKT+9mpzMh0rL5EpcladyYsxHmPo0cCA5MWvTYq3Ph0
	fOicbvoKr1x9eWiILi3jXRYpJynv+5kTuqLEqec9e3k4QOIuslkUGPlczfFMfCViYyTPWyt93AU
	pLjz7lT9paEHYW75dhruKmprVhBKmZrMqBNn7jRCGNX8anrTEU/31nFaXv+DSX0LPxJkeg/dFmn
	iKe863H/HoDjntcHLNTHpl3ihyPADm5xfm2VTO9/bP+ewc+XYQ5/5daiWxXUokmFCT7hwhWDYUS
	Aip2oz6ljfI0S/wci9Q+Qw6DWPYEVh2Z1Q0dx/5gTR/h9AXCm/fUD9zlvZun5aiZogP7dtsKPEl
	b9aq4klPGGALNHKgD22AG7PT7E73CmSyaUD9bohvT9mTR4Sb7qjt44BBdZ7exzDJedYgarAuUlt
	xLSUYok5+JGdL7CDgh1m6QJmQ==
X-Received: by 2002:a05:600c:64c9:b0:485:3a03:cee1 with SMTP id 5b1f17b1804b1-487160b8be7mr7526715e9.33.1774372516695;
        Tue, 24 Mar 2026 10:15:16 -0700 (PDT)
Received: from fedora (mob-194-230-148-205.cgn.sunrise.net. [194.230.148.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487165bea11sm2168665e9.1.2026.03.24.10.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 10:15:16 -0700 (PDT)
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
Date: Tue, 24 Mar 2026 18:15:00 +0100
Message-ID: <20260324171502.689012-4-stefano.tondo.ext@siemens.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324132958.2316491-1-stondo@gmail.com>
References: <20260324132958.2316491-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 17:15:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233817

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


