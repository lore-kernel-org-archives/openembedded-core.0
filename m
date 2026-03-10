Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16394FD2D76
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 12:58:08 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39292.1773147478917656795
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 05:57:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mjjBV/QH;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439aeed8a5bso10222538f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 05:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773147477; x=1773752277; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q5JsFY7YxnRQQDa/LgGs5CMsF/shYkeZS6GTvYHz/hM=;
        b=mjjBV/QHMvcUY964cXiBxJIfxtHfIlKVV34Dou3gEsDY/2LGr0Bsi5GX8pyKCWCWNr
         2zKG9SPs5hMHNJUr5B+pj5t1kuuVgT3T83hBc3ak0O+0DCXTZWAJ8uIo1i1UWbZyIZVd
         C2WDNUze1FLPViMuKCCoE8bjxKQ9USWYJDSAteOtrrt56HMG3+uuz3g9tuk2fE61EB4g
         Gt+L+P95xbINc3S6lLxmcbmE1nh06BnNj5f6XntliBW4xsyr08/tbJf0T/9eD7nNbl20
         lXjFTjXvQnYxFGBQRxkAae2g6ucINuaUuiLotfetbiuHtkf61Qhjd+pkIh/kxsAhQMgX
         HEIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773147477; x=1773752277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q5JsFY7YxnRQQDa/LgGs5CMsF/shYkeZS6GTvYHz/hM=;
        b=a8iUOjpjYGvNzitFns+2eAdIf9Q4WFnRX5iup2VEUeviPZlep/a6xGPMJPTUU6GcAy
         /t8NGfSaQJUVEcfMKlzJ0uTGGMEWDaMlHFQNheIxHD4/eUwflO7yKDzzUXDzdmrcpaSN
         LS9FhC/p8HF8yzEcujo9ietR637ZKuCXvjYqy/8uoumtWWtIXOA+w65ISd3FFCAvb2R4
         oxbHJTPzwxIOi4bCmR19Re7O/YhNGQFKo2ZE6b0CihHrM1o31DOXcYiEcKQvQOm3WlT/
         +2lWL3tI8fn7bhPmWO+NbwwA2gw9CQwF7udOM56JOPY1yM/4wycc4xXrKdw+EMh6xriz
         XyMg==
X-Gm-Message-State: AOJu0YzBA2r/+DV2YQI2Sf25IDUB0wBgQU34grViycKXe4h2ZDdOjMeI
	QFS3dAH6DhlUtfvMe7rKIJTLliPffs4ksMbK3AalWqgKfPZ+avCvMlwBzEMBBA==
X-Gm-Gg: ATEYQzzOyh2veOa1+/Q/VR+9bWxG3csjbgfbnXMybax47sXekBf7kdSGeKWF8YidG6B
	K3m5lKKGVCqMn8Bm9HBqCIiGCNMYnHTQQY1WfKXJvWvrHgLVUPP2En+0I0DOVrHcBfsgjezBw74
	2apDSGR0vkaRaZmFwIK2pgYrp4Gv2n+OmYOqnv3LcmTPcKxjpkpgcMrXGKBzy7O5VyrWYc7At6l
	FBUsliklp4Lu93/mF9h9QQlj0oASKZT25nHp11vCeTbE9NbxLMeNwMUc3Qh2IX1uNjjSxJ5JaH3
	jM8uf+W4nWHgdd84GwmtalC7NOCFyvMkGl1wO42uWzjAjswn45l3Oc22ui36MbhNEdEk2trgv+h
	Ch2FJW7TtzTakyqki3nDVjcLbA2bVvH47KqrJxNtNNOtDG7mqOIYh2ua7sHWpQyNA9TDXaw5kPQ
	+2H3ZGI7qhHkoRp14zmwMq0Nvko/kT/8coJUuCeRQVMbb4SpQQ7gbZX0E945s=
X-Received: by 2002:a5d:5f85:0:b0:439:b486:ba7f with SMTP id ffacd0b85a97d-439da8920a4mr26078599f8f.49.1773147477091;
        Tue, 10 Mar 2026 05:57:57 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae57401sm29782290f8f.38.2026.03.10.05.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 05:57:56 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/3] pypi.bbclass: set UPSTREAM_CHECK_PYPI_PACKAGE from PYPI_PACKAGE
Date: Tue, 10 Mar 2026 13:57:50 +0100
Message-ID: <20260310125750.2240849-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260310125750.2240849-1-alex.kanavin@gmail.com>
References: <20260310125750.2240849-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 12:58:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232782

From: Alexander Kanavin <alex@linutronix.de>

This aligns the tarball upstream check regex (set from former variable)
with existing tarball name (set from the latter).

Previously the regex used a 'normalized' value (_ replaced with -)
which wasn't matching the actual tarballs, and required setting both
variables whenever PYPI_PACKAGE default wasn't suitable and had to be
set in the recipe.

I have confirmed that 'devtool check-upgrade-status' doesn't break.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-recipe/pypi.bbclass                               | 3 +--
 meta/recipes-devtools/python/python3-booleanpy_5.0.bb          | 1 -
 .../recipes-devtools/python/python3-coherent-licensed_0.5.2.bb | 1 -
 meta/recipes-devtools/python/python3-cryptography-vectors.bb   | 1 -
 meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb        | 1 -
 meta/recipes-devtools/python/python3-git_3.1.43.bb             | 1 -
 .../python/python3-hatch-fancy-pypi-readme_25.1.0.bb           | 1 -
 meta/recipes-devtools/python/python3-hatch-vcs_0.5.0.bb        | 1 -
 .../python/python3-jsonschema-specifications_2025.9.1.bb       | 1 -
 .../python/python3-license-expression_30.4.4.bb                | 1 -
 meta/recipes-devtools/python/python3-meson-python_0.19.0.bb    | 1 -
 meta/recipes-devtools/python/python3-pdm-backend_2.4.7.bb      | 1 -
 meta/recipes-devtools/python/python3-pdm-build-locked_0.3.7.bb | 1 -
 meta/recipes-devtools/python/python3-poetry-core_2.3.1.bb      | 1 -
 meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb  | 1 -
 .../python/python3-pyproject-metadata_0.11.0.bb                | 1 -
 meta/recipes-devtools/python/python3-pysocks_1.7.1.bb          | 1 -
 meta/recipes-devtools/python/python3-pytest-subtests_0.15.0.bb | 1 -
 .../recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb | 1 -
 meta/recipes-devtools/python/python3-roman-numerals_4.1.0.bb   | 1 -
 meta/recipes-devtools/python/python3-rpds-py_0.30.0.bb         | 1 -
 meta/recipes-devtools/python/python3-ruamel-yaml_0.19.1.bb     | 1 -
 .../recipes-devtools/python/python3-semantic-version_2.10.0.bb | 1 -
 meta/recipes-devtools/python/python3-setuptools-rust_1.12.0.bb | 1 -
 meta/recipes-devtools/python/python3-setuptools-scm_9.2.2.bb   | 1 -
 meta/recipes-devtools/python/python3-sphinx-argparse_0.5.2.bb  | 1 -
 meta/recipes-devtools/python/python3-sphinx-rtd-theme_3.1.0.bb | 1 -
 .../python/python3-sphinxcontrib-applehelp_2.0.0.bb            | 1 -
 .../python/python3-sphinxcontrib-devhelp_2.0.0.bb              | 1 -
 .../python/python3-sphinxcontrib-htmlhelp_2.1.0.bb             | 1 -
 .../python/python3-sphinxcontrib-qthelp_2.0.0.bb               | 1 -
 .../python/python3-sphinxcontrib-serializinghtml_2.0.0.bb      | 1 -
 .../python/python3-sphinxcontrib-svg2pdfconverter_2.0.0.bb     | 1 -
 .../python/python3-trove-classifiers_2026.1.14.14.bb           | 1 -
 .../python/python3-typing-extensions_4.15.0.bb                 | 1 -
 meta/recipes-devtools/python/python3-uv-build_0.10.4.bb        | 1 -
 36 files changed, 1 insertion(+), 37 deletions(-)

diff --git a/meta/classes-recipe/pypi.bbclass b/meta/classes-recipe/pypi.bbclass
index 1372d85e8d..9d46c035f6 100644
--- a/meta/classes-recipe/pypi.bbclass
+++ b/meta/classes-recipe/pypi.bbclass
@@ -43,8 +43,7 @@ SECTION = "devel/python"
 SRC_URI:prepend = "${PYPI_SRC_URI} "
 S = "${UNPACKDIR}/${PYPI_PACKAGE}-${PV}"
 
-# Replace any '_' characters in the pypi URI with '-'s to follow the PyPi website naming conventions
-UPSTREAM_CHECK_PYPI_PACKAGE ?= "${@pypi_normalize(d)}"
+UPSTREAM_CHECK_PYPI_PACKAGE ?= "${PYPI_PACKAGE}"
 
 # Use the simple repository API rather than the potentially unstable project URL
 # More information on the pypi API specification is avaialble here:
diff --git a/meta/recipes-devtools/python/python3-booleanpy_5.0.bb b/meta/recipes-devtools/python/python3-booleanpy_5.0.bb
index e51ad9d2c1..a834cdef7b 100644
--- a/meta/recipes-devtools/python/python3-booleanpy_5.0.bb
+++ b/meta/recipes-devtools/python/python3-booleanpy_5.0.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d118b5feceee598ebeca76e13395c2bd"
 SRC_URI[sha256sum] = "60cbc4bad079753721d32649545505362c754e121570ada4658b852a3a318d95"
 
 PYPI_PACKAGE = "boolean_py"
-UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi setuptools3
 
diff --git a/meta/recipes-devtools/python/python3-coherent-licensed_0.5.2.bb b/meta/recipes-devtools/python/python3-coherent-licensed_0.5.2.bb
index 538154118f..9148fe4e36 100644
--- a/meta/recipes-devtools/python/python3-coherent-licensed_0.5.2.bb
+++ b/meta/recipes-devtools/python/python3-coherent-licensed_0.5.2.bb
@@ -11,6 +11,5 @@ SRC_URI[sha256sum] = "d8071403ce742d3ac3592ddc4fb7057a46caffb415b928b4d52802e5f2
 inherit pypi python_flit_core
 
 PYPI_PACKAGE = "coherent_licensed"
-UPSTREAM_CHECK_PYPI_PACKAGE = "coherent_licensed"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors.bb b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
index 3ed3160072..800bf1b0e0 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
@@ -15,7 +15,6 @@ SRC_URI += "file://0001-pyproject.toml-bump-uv_build-version-requirement.patch \
 SRC_URI[sha256sum] = "ffbccee9455201c01b37c63d65d9f83b362d40c2bed9caac248ebbdfa4e4fc7c"
 
 PYPI_PACKAGE = "cryptography_vectors"
-UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 DEPENDS += "python3-uv-build-native"
 
diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb b/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb
index bc81b362ee..cbd74b4059 100644
--- a/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb
+++ b/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
 SRC_URI[sha256sum] = "221b65e1c2e48de9fd11bf7e8c165adaf91648f49a11f390d086a498386f2984"
 
 PYPI_PACKAGE = "python_dbusmock"
-UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_setuptools_build_meta
 DEPENDS += "python3-setuptools-scm-native"
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index 2126b5e92b..45c988117b 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -9,7 +9,6 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5279a7ab369ba336989dcf2a107e5c8e"
 
 PYPI_PACKAGE = "GitPython"
-UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_setuptools_build_meta
 
diff --git a/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_25.1.0.bb b/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_25.1.0.bb
index 5d8d82edd8..13cc07d76c 100644
--- a/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_25.1.0.bb
+++ b/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_25.1.0.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ba5633c60bd3e243091013aa83b4d807"
 inherit pypi python_hatchling
 
 PYPI_PACKAGE = "hatch_fancy_pypi_readme"
-UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 SRC_URI[sha256sum] = "9c58ed3dff90d51f43414ce37009ad1d5b0f08ffc9fc216998a06380f01c0045"
 
diff --git a/meta/recipes-devtools/python/python3-hatch-vcs_0.5.0.bb b/meta/recipes-devtools/python/python3-hatch-vcs_0.5.0.bb
index 011e28eb81..b8df54a8b3 100644
--- a/meta/recipes-devtools/python/python3-hatch-vcs_0.5.0.bb
+++ b/meta/recipes-devtools/python/python3-hatch-vcs_0.5.0.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=26501cfd0bbddf830ee820e95551fa3d"
 inherit pypi python_hatchling
 
 PYPI_PACKAGE = "hatch_vcs"
-UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 SRC_URI[sha256sum] = "0395fa126940340215090c344a2bf4e2a77bcbe7daab16f41b37b98c95809ff9"
 
diff --git a/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.9.1.bb b/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.9.1.bb
index 5ad761bad3..c324753ef2 100644
--- a/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.9.1.bb
+++ b/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.9.1.bb
@@ -10,7 +10,6 @@ SRC_URI[sha256sum] = "b540987f239e745613c7a9176f3edb72b832a4ac465cf0271228839783
 inherit pypi python_hatchling
 
 PYPI_PACKAGE = "jsonschema_specifications"
-UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 DEPENDS += "python3-hatch-vcs-native"
 
diff --git a/meta/recipes-devtools/python/python3-license-expression_30.4.4.bb b/meta/recipes-devtools/python/python3-license-expression_30.4.4.bb
index 690149123a..7300853b44 100644
--- a/meta/recipes-devtools/python/python3-license-expression_30.4.4.bb
+++ b/meta/recipes-devtools/python/python3-license-expression_30.4.4.bb
@@ -8,7 +8,6 @@ SRC_URI[sha256sum] = "73448f0aacd8d0808895bdc4b2c8e01a8d67646e4188f887375398c761
 
 inherit pypi ptest-python-pytest python_setuptools_build_meta
 PYPI_PACKAGE = "license_expression"
-UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 DEPENDS += "python3-setuptools-scm-native"
 
diff --git a/meta/recipes-devtools/python/python3-meson-python_0.19.0.bb b/meta/recipes-devtools/python/python3-meson-python_0.19.0.bb
index 66e636ef82..530edc9b12 100644
--- a/meta/recipes-devtools/python/python3-meson-python_0.19.0.bb
+++ b/meta/recipes-devtools/python/python3-meson-python_0.19.0.bb
@@ -11,7 +11,6 @@ DEPENDS = " \
 "
 
 PYPI_PACKAGE = "meson_python"
-UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_mesonpy
 SRC_URI[sha256sum] = "9959d198aa69b57fcfd354a34518c6f795b781a73ed0656f4d01660160cc2553"
diff --git a/meta/recipes-devtools/python/python3-pdm-backend_2.4.7.bb b/meta/recipes-devtools/python/python3-pdm-backend_2.4.7.bb
index d542909c50..94d40ac528 100644
--- a/meta/recipes-devtools/python/python3-pdm-backend_2.4.7.bb
+++ b/meta/recipes-devtools/python/python3-pdm-backend_2.4.7.bb
@@ -9,6 +9,5 @@ SRC_URI[sha256sum] = "a509d083850378ce919d41e7a2faddfc57a1764d376913c66731125d6b
 inherit pypi python_pep517
 
 PYPI_PACKAGE = "pdm_backend"
-UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-pdm-build-locked_0.3.7.bb b/meta/recipes-devtools/python/python3-pdm-build-locked_0.3.7.bb
index 3844934d93..8189bc7e56 100644
--- a/meta/recipes-devtools/python/python3-pdm-build-locked_0.3.7.bb
+++ b/meta/recipes-devtools/python/python3-pdm-build-locked_0.3.7.bb
@@ -8,6 +8,5 @@ SRC_URI[sha256sum] = "53428268284125532413434ebfeb8e7a287525516cc5a0a055d63ba63b
 inherit pypi python_pdm
 
 PYPI_PACKAGE = "pdm_build_locked"
-UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 BBCLASSEXTEND += "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-poetry-core_2.3.1.bb b/meta/recipes-devtools/python/python3-poetry-core_2.3.1.bb
index c190bb20dc..705e08d98b 100644
--- a/meta/recipes-devtools/python/python3-poetry-core_2.3.1.bb
+++ b/meta/recipes-devtools/python/python3-poetry-core_2.3.1.bb
@@ -20,7 +20,6 @@ SRC_URI[sha256sum] = "96f791d5d7d4e040f3983d76779425cf9532690e2756a24fd5ca0f86af
 inherit python_poetry_core pypi
 
 PYPI_PACKAGE = "poetry_core"
-UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 RDEPENDS:${PN}:append:class-target = "\
     python3-compression \
diff --git a/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb b/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb
index c68760e293..cdb9fc78c9 100644
--- a/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb
+++ b/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb
@@ -8,7 +8,6 @@ SRC_URI[sha256sum] = "1e859bd5c40fae9448642dd871adf459e5e2084186e8d2c2a79a824c97
 inherit pypi python_flit_core
 
 PYPI_PACKAGE = "pyproject_hooks"
-UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 BBCLASSEXTEND = "native nativesdk"
 
diff --git a/meta/recipes-devtools/python/python3-pyproject-metadata_0.11.0.bb b/meta/recipes-devtools/python/python3-pyproject-metadata_0.11.0.bb
index 02a9064f2a..1e485df338 100644
--- a/meta/recipes-devtools/python/python3-pyproject-metadata_0.11.0.bb
+++ b/meta/recipes-devtools/python/python3-pyproject-metadata_0.11.0.bb
@@ -13,7 +13,6 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=310439af287b0fb4780b2ad6907c256c"
 
 PYPI_PACKAGE = "pyproject_metadata"
-UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_flit_core
 
diff --git a/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb b/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb
index dbf0fb0ee6..207d15d702 100644
--- a/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb
+++ b/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1d457bcffb9661b45f799d4efee72f16"
 SRC_URI[sha256sum] = "3f8804571ebe159c380ac6de37643bb4685970655d3bba243530d6558b799aa0"
 
 PYPI_PACKAGE = "PySocks"
-UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi setuptools3
 
diff --git a/meta/recipes-devtools/python/python3-pytest-subtests_0.15.0.bb b/meta/recipes-devtools/python/python3-pytest-subtests_0.15.0.bb
index 01d2332732..a76c15119d 100644
--- a/meta/recipes-devtools/python/python3-pytest-subtests_0.15.0.bb
+++ b/meta/recipes-devtools/python/python3-pytest-subtests_0.15.0.bb
@@ -10,7 +10,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=242b4e17fa287dcf7aef372f6bc3dcb1"
 SRC_URI[sha256sum] = "cb495bde05551b784b8f0b8adfaa27edb4131469a27c339b80fd8d6ba33f887c"
 
 PYPI_PACKAGE = "pytest_subtests"
-UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_setuptools_build_meta
 
diff --git a/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb b/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb
index 1e60c763d8..242176dd75 100644
--- a/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb
+++ b/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb
@@ -8,7 +8,6 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/python-rfc3339-validator:"
 SRC_URI[sha256sum] = "138a2abdf93304ad60530167e51d2dfb9549521a836871b88d7f4695d0022f6b"
 
 PYPI_PACKAGE = "rfc3339_validator"
-UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi setuptools3
 
diff --git a/meta/recipes-devtools/python/python3-roman-numerals_4.1.0.bb b/meta/recipes-devtools/python/python3-roman-numerals_4.1.0.bb
index 7a97fd3b19..4cab76a2b1 100644
--- a/meta/recipes-devtools/python/python3-roman-numerals_4.1.0.bb
+++ b/meta/recipes-devtools/python/python3-roman-numerals_4.1.0.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENCE.rst;md5=bfcc8b16e42929aafeb9d414360bc2fd"
 
 SRC_URI[sha256sum] = "1af8b147eb1405d5839e78aeb93131690495fe9da5c91856cb33ad55a7f1e5b2"
 PYPI_PACKAGE = "roman_numerals"
-UPSTREAM_CHECK_PYPI_PACKAGE = "roman_numerals"
 
 inherit pypi python_flit_core
 
diff --git a/meta/recipes-devtools/python/python3-rpds-py_0.30.0.bb b/meta/recipes-devtools/python/python3-rpds-py_0.30.0.bb
index bef2cf52d2..173dabeecd 100644
--- a/meta/recipes-devtools/python/python3-rpds-py_0.30.0.bb
+++ b/meta/recipes-devtools/python/python3-rpds-py_0.30.0.bb
@@ -11,7 +11,6 @@ require ${BPN}-crates.inc
 inherit pypi cargo-update-recipe-crates python_maturin ptest-python-pytest
 
 PYPI_PACKAGE = "rpds_py"
-UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 RDEPENDS:${PN}-ptest += " \
     python3-iniconfig \
diff --git a/meta/recipes-devtools/python/python3-ruamel-yaml_0.19.1.bb b/meta/recipes-devtools/python/python3-ruamel-yaml_0.19.1.bb
index 6129bcae13..c27649e35d 100644
--- a/meta/recipes-devtools/python/python3-ruamel-yaml_0.19.1.bb
+++ b/meta/recipes-devtools/python/python3-ruamel-yaml_0.19.1.bb
@@ -5,7 +5,6 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fae78348fee46c087389813e0ebf5ed7"
 
 PYPI_PACKAGE = "ruamel_yaml"
-UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_setuptools_build_meta
 
diff --git a/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb b/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb
index 01eb75f10d..64d1390475 100644
--- a/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb
+++ b/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4fb31e3c1c7eeb8b5e8c07657cdd54e2"
 SRC_URI[sha256sum] = "bdabb6d336998cbb378d4b9db3a4b56a1e3235701dc05ea2690d9a997ed5041c"
 
 PYPI_PACKAGE = "semantic_version"
-UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi setuptools3
 
diff --git a/meta/recipes-devtools/python/python3-setuptools-rust_1.12.0.bb b/meta/recipes-devtools/python/python3-setuptools-rust_1.12.0.bb
index 491f512706..062e97083d 100644
--- a/meta/recipes-devtools/python/python3-setuptools-rust_1.12.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-rust_1.12.0.bb
@@ -12,7 +12,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=011cd92e702dd9e6b1a26157b6fd53f5"
 SRC_URI[sha256sum] = "d94a93f0c97751c17014565f07bdc324bee45d396cd1bba83d8e7af92b945f0c"
 
 PYPI_PACKAGE = "setuptools_rust"
-UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit cargo pypi python_setuptools_build_meta
 
diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_9.2.2.bb b/meta/recipes-devtools/python/python3-setuptools-scm_9.2.2.bb
index 175da34179..d16d79c79f 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_9.2.2.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_9.2.2.bb
@@ -9,7 +9,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=838c366f69b72c5df05c96dff79b35f2"
 SRC_URI[sha256sum] = "1c674ab4665686a0887d7e24c03ab25f24201c213e82ea689d2f3e169ef7ef57"
 
 PYPI_PACKAGE = "setuptools_scm"
-UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_setuptools_build_meta
 
diff --git a/meta/recipes-devtools/python/python3-sphinx-argparse_0.5.2.bb b/meta/recipes-devtools/python/python3-sphinx-argparse_0.5.2.bb
index 554fb3eb51..9299a862f7 100644
--- a/meta/recipes-devtools/python/python3-sphinx-argparse_0.5.2.bb
+++ b/meta/recipes-devtools/python/python3-sphinx-argparse_0.5.2.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENCE.rst;md5=5c1cd8f13774629fee215681e66a1056"
 SRC_URI[sha256sum] = "e5352f8fa894b6fb6fda0498ba28a9f8d435971ef4bbc1a6c9c6414e7644f032"
 
 PYPI_PACKAGE = "sphinx_argparse"
-UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_flit_core
 
diff --git a/meta/recipes-devtools/python/python3-sphinx-rtd-theme_3.1.0.bb b/meta/recipes-devtools/python/python3-sphinx-rtd-theme_3.1.0.bb
index 05e2c097c5..77fcae2546 100644
--- a/meta/recipes-devtools/python/python3-sphinx-rtd-theme_3.1.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinx-rtd-theme_3.1.0.bb
@@ -13,7 +13,6 @@ RDEPENDS:${PN} += " \
 "
 
 PYPI_PACKAGE = "sphinx_rtd_theme"
-UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 SRC_URI[sha256sum] = "b44276f2c276e909239a4f6c955aa667aaafeb78597923b1c60babc76db78e4c"
 
diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb
index a63b7ad014..686a4a17ae 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENCE.rst;md5=c7715857042d4c8c0105999ca0c072c5"
 SRC_URI[sha256sum] = "2f29ef331735ce958efa4734873f084941970894c6090408b079c61b2e1c06d1"
 
 PYPI_PACKAGE = "sphinxcontrib_applehelp"
-UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_flit_core
 
diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb
index abce915a19..9f53973708 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENCE.rst;md5=fd30d9972a142c857a80c9f312e92b93"
 SRC_URI[sha256sum] = "411f5d96d445d1d73bb5d52133377b4248ec79db5c793ce7dbe59e074b4dd1ad"
 
 PYPI_PACKAGE = "sphinxcontrib_devhelp"
-UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_flit_core
 
diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb
index 44885d7dc3..1a15ccd0c4 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENCE.rst;md5=24dce5ef6a13563241c24bc366f48886"
 SRC_URI[sha256sum] = "c9e2916ace8aad64cc13a0d233ee22317f2b9025b9cf3295249fa985cc7082e9"
 
 PYPI_PACKAGE = "sphinxcontrib_htmlhelp"
-UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_flit_core
 
diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb
index 141d1c4862..f51a0ba64b 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENCE.rst;md5=f7a83b72ea86d04827575ec0b63430eb"
 SRC_URI[sha256sum] = "4fe7d0ac8fc171045be623aba3e2a8f613f8682731f9153bb2e40ece16b9bbab"
 
 PYPI_PACKAGE = "sphinxcontrib_qthelp"
-UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_flit_core
 
diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb
index 95ee596b3b..63c55d36ae 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENCE.rst;md5=32a84ac5cd3bbd10c4d479233ad588b6"
 SRC_URI[sha256sum] = "e9d912827f872c029017a53f0ef2180b327c3f7fd23c87229f7a8e8b70031d4d"
 
 PYPI_PACKAGE = "sphinxcontrib_serializinghtml"
-UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_flit_core
 
diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-svg2pdfconverter_2.0.0.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-svg2pdfconverter_2.0.0.bb
index 1bf3e55ebd..82ba8a2dcb 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-svg2pdfconverter_2.0.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-svg2pdfconverter_2.0.0.bb
@@ -8,7 +8,6 @@ SRC_URI[sha256sum] = "ab9c8f1080391e231812d20abf2657a69ee35574563b1014414f953964
 inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "sphinxcontrib_svg2pdfconverter"
-UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 RDEPENDS:${PN} = "python3-sphinx"
 # Only support sphinxcontrib.rsvgconverter for now.
diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2026.1.14.14.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2026.1.14.14.bb
index c334fdfc72..f1b1341246 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2026.1.14.14.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2026.1.14.14.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 SRC_URI[sha256sum] = "00492545a1402b09d4858605ba190ea33243d361e2b01c9c296ce06b5c3325f3"
 
 PYPI_PACKAGE = "trove_classifiers"
-UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
diff --git a/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb b/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb
index 3e3ce33ca8..4ff85bb240 100644
--- a/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb
+++ b/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb
@@ -14,7 +14,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fcf6b249c2641540219a727f35d8d2c2"
 
 # The name on PyPi is slightly different.
 PYPI_PACKAGE = "typing_extensions"
-UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 SRC_URI[sha256sum] = "0cea48d173cc12fa28ecabc3b837ea3cf6f38c6d1136f85cbaaf598984861466"
 
diff --git a/meta/recipes-devtools/python/python3-uv-build_0.10.4.bb b/meta/recipes-devtools/python/python3-uv-build_0.10.4.bb
index 180b44519b..5394fecc97 100644
--- a/meta/recipes-devtools/python/python3-uv-build_0.10.4.bb
+++ b/meta/recipes-devtools/python/python3-uv-build_0.10.4.bb
@@ -18,7 +18,6 @@ require ${BPN}-crates.inc
 inherit pypi python_maturin cargo-update-recipe-crates
 
 PYPI_PACKAGE = "uv_build"
-UPSTREAM_CHECK_PYPI_PACKAGE = "uv_build"
 
 BBCLASSEXTEND = "native"
 INSANE_SKIP:${PN} = "already-stripped"
-- 
2.47.3


