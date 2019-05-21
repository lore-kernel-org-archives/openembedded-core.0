Return-Path: <luca.boccassi@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 04EB27E25C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 12:36:44 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id n25so894166wmk.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 05:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=DFh/aacANZhe+y+4kt8taxl3+o9hywR2GYkoWNVU8D0=;
	b=YyMVfUuz/5MA022zZt32BLFvg9EWy9RUaQjNyM0/TjzYjBL9dMM2G/B8qjITsauLK1
	wttp2FF0Uzb0zskgiLoQLinyarriDaFtiBFRZBizoNQatBExWSSvrUoHLwR1l56/n1wW
	CMLioz6Uq/DkeBl2nuKeGPP5wOMHe/ITz4heXDam2zRXxW/4xSaKnawO47N5UeEgKPmR
	n/ciMHU11b68R9kugzLFtQcB0Wl0u4HoRW6xN2cpWn3qMI3mCAT6L7wWqOzjx/Kt1IKh
	IhtPxIKNWseODlvwGp3H3TadcZ4GDBDjw47FcD7uFfXF4qxf7v9dhg6TRtbHnnC3sVZH
	/nYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=DFh/aacANZhe+y+4kt8taxl3+o9hywR2GYkoWNVU8D0=;
	b=hZN7DC8I7Y4Ln1bMpNhsiAbbnV1/Hkv3OwxifnMvmRLsUOyFOxWCAtW9yLrrMbVEzV
	n5/4TVMC1M00bKPu2p7OuGLn/2S6yuiXq5+SefKtQaQ4U/tElYPtdaCz3QMDoyjFIykA
	61pQpH4MdFZjBGqrRFszmh+R69jbaDd48SDs9aukCTy3qH8VqULjcUfLfNa9hwVgKViQ
	smYUizcXsm4TVOvK0Vb3VFjl1S+p9tUG8PmrLtsk9QXzVOEH9aJDlT4y6LYZ+uBGn+PD
	fiRGSqgZomqchV59duj7SPM3NDwZWHMTfQAr4dOF7QozzshSoWD4q6Smd1yPCWDnsa/a
	eF6Q==
X-Gm-Message-State: APjAAAV4g6kOIuPCVT03lNeZi31DBtiA2urA4ZFXA+849T0fGjs8Em4j
	pTe9v59GS6qFBbyNaGH/SGAvl9nD
X-Google-Smtp-Source: APXvYqy4h2G+5UGBHa2S93q0UTgCgzt1K4L4t5DxQ1djQC2XQhrfHF6IFHqQ10jbEbuibzAfOJSKvQ==
X-Received: by 2002:a1c:7e10:: with SMTP id z16mr3399679wmc.98.1558442205393; 
	Tue, 21 May 2019 05:36:45 -0700 (PDT)
Received: from localhost ([88.98.246.218]) by smtp.gmail.com with ESMTPSA id
	n15sm23118514wru.67.2019.05.21.05.36.44
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 21 May 2019 05:36:44 -0700 (PDT)
From: luca.boccassi@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 May 2019 13:36:41 +0100
Message-Id: <20190521123641.16768-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190516210956.19906-1-luca.boccassi@gmail.com>
References: <20190516210956.19906-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Subject: [PATCH v4] python*-setuptools: add separate packages for pkg_resources module
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 May 2019 12:36:45 -0000
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

The pkg_resources Python module is useful by itself, for example for
automatic loading of resources shipped in a Python package.
Add separate packages for it, so that users can depend on them
individually and avoid pulling in the entire setuptools, which
include scripts to download other packages, which might not be
desired on minimal images.

Other distributions like Debian and Ubuntu already split setuptools
and pkg-resources in this way.

The setuptools packages now depend on the new pkg-resources packages,
to avoid regressions for other packages that depend on them
already.

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
v2: restrict new RDEPENDS to class-target. As advised by Alexander, bitbake
    cannot resolve native rdeps that mention package names rather than
    recipe names.
v3: manually add RPROVIDES to the native class instead of restricting the
    RDEPENDS to the target class as a better workaround. Also document why
    the package is being split.
v4: re-send to the correct thread, no changes.

 meta/recipes-devtools/python/python-setuptools.inc | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
index 357aa07086..f49e078697 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
+++ b/meta/recipes-devtools/python/python-setuptools.inc
@@ -37,3 +37,14 @@ do_install_prepend() {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+# The pkg-resources module can be used by itself, without the package downloader
+# and easy_install. Ship it in a separate package so that it can be used by
+# minimal distributions.
+PACKAGES =+ "${PYTHON_PN}-pkg-resources "
+FILES_${PYTHON_PN}-pkg-resources = "${PYTHON_SITEPACKAGES_DIR}/pkg_resources/*"
+# Due to the way OE-Core implemented native recipes, the native class cannot
+# have a dependency on something that is not a recipe name. Work around that by
+# manually setting RPROVIDES.
+RDEPENDS_${PN}_append = " ${PYTHON_PN}-pkg-resources"
+RPROVIDES_append_class-native = " ${PYTHON_PN}-pkg-resources-native"
-- 
2.20.1


