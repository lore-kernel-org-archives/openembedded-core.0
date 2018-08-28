Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id B4C5378A0F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 10:23:23 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id f21-v6so1343640wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 03:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=3G7gqNNtffc9mGWhvCZlDfPQZufx3mbB/04MUE4G9r4=;
	b=fAB3+McS4VKIcBNIWpGqmg1atsECV1znqLGjPMyUe2Lq9aEPTRZLOhzRb4F9Py4Arp
	kckbqkSc7Jvc3oCYZtsOuyCVFyUieqSQlwJKDuZ3LNPEgrajL8fZ1rH98HLCC1ckMPRC
	w1P8HIqvHfZj2+IiQ2Oowc8g0z0SGwgJV6hXT305g64/rQdSinuvIj26dpXBVIssaem6
	sPksMdKwCVVqEQI8qjwvk2iXyrwZOZX9Grull5fN9NrTNTxeZpFNtb7aNAuciYUwZefG
	etIZcVmRV53w+9GiRoIJD2K/XAmDiOIEhpm/dq08+JkWHGsqLMmlPz9cIy1lrWQqOwKv
	lpMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=3G7gqNNtffc9mGWhvCZlDfPQZufx3mbB/04MUE4G9r4=;
	b=R7M+O5km1YJ/t20a7k4JglVaQCnoWGtfJYE7F4CiKnYywu6LjI112wo2usWz3gH2Iv
	BqnZjmB8jdc838ZSwrw3JC1jqAdRvN+CmaH/PfnD/FDZ3gxh6n4KyxKZBbS3b8wc3ugY
	+8TsMcPBup2waa11MptdegQqTM4ps4rY259gW4N//9O1/i1qmvN7aE52vcKjKHP2kDap
	k8ymrtJi8GKzXCVTX9NNusF2nWompW2pFrdzJHD7r2FRQbkrvyDwG5LY4A+ltJtQtxa+
	BrZGem1zkuq4SRckaj/6XjlapMEWn5LWW/prNFDxk+0jOzeqKhDtx8VvtD1BPB/q5k/W
	CsDw==
X-Gm-Message-State: APzg51A6Y3g6ZSFEALFu0KyL18QlGgLkBPNuwxgAKaSt43ibbbg+iMQj
	sfaiOOS6cVjLmdPDPgnRwLJyrg51
X-Google-Smtp-Source: ANB0Vdbp6nvtebrLrhb3S7Ja1u0IU2GY/+K83ylwX5A6NbgjvxSWu2lg2UlozB4zFolcj8h/2d7AIQ==
X-Received: by 2002:a1c:b143:: with SMTP id
	a64-v6mr1005649wmf.114.1535451803819; 
	Tue, 28 Aug 2018 03:23:23 -0700 (PDT)
Received: from localhost.localdomain ([79.140.126.226])
	by smtp.gmail.com with ESMTPSA id
	198-v6sm771823wmm.0.2018.08.28.03.23.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 28 Aug 2018 03:23:22 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Aug 2018 12:23:12 +0200
Message-Id: <b0f6196af47cab59f634fbffea7121a684dd4ad0.1535451643.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1535451643.git.alex.kanavin@gmail.com>
References: <cover.1535451643.git.alex.kanavin@gmail.com>
Subject: [RFC PATCH 1/6] openssl: rename openssl 1.0.x to openssl10 and make openssl 1.1.x the default version
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
X-List-Received-Date: Tue, 28 Aug 2018 10:23:24 -0000

From: Alexander Kanavin <alexander.kanavin@linux.intel.com>

I believe the time has come to do this: openssl 1.0 upstream support stops at the end
of 2019, and we do not want a situation where a supported YP release contains an
unsupported version of a critical security component.

Openssl 1.0 can still be utilized by depending on 'openssl10' recipe.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/conf/distro/include/default-versions.inc      |  3 ---
 meta/conf/distro/include/maintainers.inc           |  1 +
 .../{openssl => files}/environment.d-openssl.sh    |  0
 ...build-with-clang-using-external-assembler.patch |  0
 .../0001-allow-manpages-to-be-disabled.patch       |  0
 ...penssl-force-soft-link-to-avoid-rare-race.patch |  0
 .../Makefiles-ptest.patch                          |  0
 .../Use-SHA256-not-MD5-as-default-digest.patch     |  0
 .../configure-musl-target.patch                    |  0
 .../configure-targets.patch                        |  0
 .../debian/c_rehash-compat.patch                   |  0
 .../debian/debian-targets.patch                    |  0
 .../debian/man-dir.patch                           |  0
 .../debian/man-section.patch                       |  0
 .../debian/no-rpath.patch                          |  0
 .../debian/no-symbolic.patch                       |  0
 .../{openssl-1.0.2p => openssl10}/debian/pic.patch |  0
 .../debian1.0.2/block_digicert_malaysia.patch      |  0
 .../debian1.0.2/block_diginotar.patch              |  0
 .../debian1.0.2/soname.patch                       |  0
 .../debian1.0.2/version-script.patch               |  0
 .../engines-install-in-libdir-ssl.patch            |  0
 .../{openssl-1.0.2p => openssl10}/oe-ldflags.patch |  0
 .../openssl-c_rehash.sh                            |  0
 .../openssl-fix-des.pod-error.patch                |  0
 .../openssl_fix_for_x32.patch                      |  0
 .../{openssl-1.0.2p => openssl10}/parallel.patch   |  0
 .../{openssl-1.0.2p => openssl10}/ptest-deps.patch |  0
 .../ptest_makefile_deps.patch                      |  0
 .../reproducible-cflags.patch                      |  0
 .../reproducible-mkbuildinf.patch                  |  0
 .../{openssl-1.0.2p => openssl10}/run-ptest        |  0
 .../shared-libs.patch                              |  0
 .../{openssl_1.0.2p.bb => openssl10_1.0.2p.bb}     | 31 ++++++++++++++++------
 34 files changed, 24 insertions(+), 11 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl => files}/environment.d-openssl.sh (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/0001-Fix-build-with-clang-using-external-assembler.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/0001-allow-manpages-to-be-disabled.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/0001-openssl-force-soft-link-to-avoid-rare-race.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/Makefiles-ptest.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/Use-SHA256-not-MD5-as-default-digest.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/configure-musl-target.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/configure-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian/c_rehash-compat.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian/debian-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian/man-dir.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian/man-section.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian/no-rpath.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian/no-symbolic.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian/pic.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian1.0.2/block_digicert_malaysia.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian1.0.2/block_diginotar.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian1.0.2/soname.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian1.0.2/version-script.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/engines-install-in-libdir-ssl.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/oe-ldflags.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/openssl-c_rehash.sh (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/openssl-fix-des.pod-error.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/openssl_fix_for_x32.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/parallel.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/ptest-deps.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/ptest_makefile_deps.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/reproducible-cflags.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/reproducible-mkbuildinf.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/run-ptest (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/shared-libs.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl_1.0.2p.bb => openssl10_1.0.2p.bb} (91%)

diff --git a/meta/conf/distro/include/default-versions.inc b/meta/conf/distro/include/default-versions.inc
index 3d88e8f..a6f3313 100644
--- a/meta/conf/distro/include/default-versions.inc
+++ b/meta/conf/distro/include/default-versions.inc
@@ -2,6 +2,3 @@
 # Default preferred versions
 #
 
-PREFERRED_VERSION_openssl ?= "1.0.%"
-PREFERRED_VERSION_openssl-native ?= "1.0.%"
-PREFERRED_VERSION_nativesdk-openssl ?= "1.0.%"
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 98b661d..c76f81f 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -503,6 +503,7 @@ RECIPE_MAINTAINER_pn-nss-myhostname = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-ofono = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-openssh = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-openssl = "Alexander Kanavin <alex.kanavin@gmail.com>"
+RECIPE_MAINTAINER_pn-openssl10 = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-opkg = "Alejandro del Castillo <alejandro.delcastillo@ni.com>"
 RECIPE_MAINTAINER_pn-opkg-arch-config = "Alejandro del Castillo <alejandro.delcastillo@ni.com>"
 RECIPE_MAINTAINER_pn-opkg-keyrings = "Alejandro del Castillo <alejandro.delcastillo@ni.com>"
diff --git a/meta/recipes-connectivity/openssl/openssl/environment.d-openssl.sh b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl/environment.d-openssl.sh
rename to meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2p/0001-Fix-build-with-clang-using-external-assembler.patch b/meta/recipes-connectivity/openssl/openssl10/0001-Fix-build-with-clang-using-external-assembler.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2p/0001-Fix-build-with-clang-using-external-assembler.patch
rename to meta/recipes-connectivity/openssl/openssl10/0001-Fix-build-with-clang-using-external-assembler.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2p/0001-allow-manpages-to-be-disabled.patch b/meta/recipes-connectivity/openssl/openssl10/0001-allow-manpages-to-be-disabled.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2p/0001-allow-manpages-to-be-disabled.patch
rename to meta/recipes-connectivity/openssl/openssl10/0001-allow-manpages-to-be-disabled.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2p/0001-openssl-force-soft-link-to-avoid-rare-race.patch b/meta/recipes-connectivity/openssl/openssl10/0001-openssl-force-soft-link-to-avoid-rare-race.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2p/0001-openssl-force-soft-link-to-avoid-rare-race.patch
rename to meta/recipes-connectivity/openssl/openssl10/0001-openssl-force-soft-link-to-avoid-rare-race.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2p/Makefiles-ptest.patch b/meta/recipes-connectivity/openssl/openssl10/Makefiles-ptest.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2p/Makefiles-ptest.patch
rename to meta/recipes-connectivity/openssl/openssl10/Makefiles-ptest.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2p/Use-SHA256-not-MD5-as-default-digest.patch b/meta/recipes-connectivity/openssl/openssl10/Use-SHA256-not-MD5-as-default-digest.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2p/Use-SHA256-not-MD5-as-default-digest.patch
rename to meta/recipes-connectivity/openssl/openssl10/Use-SHA256-not-MD5-as-default-digest.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2p/configure-musl-target.patch b/meta/recipes-connectivity/openssl/openssl10/configure-musl-target.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2p/configure-musl-target.patch
rename to meta/recipes-connectivity/openssl/openssl10/configure-musl-target.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2p/configure-targets.patch b/meta/recipes-connectivity/openssl/openssl10/configure-targets.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2p/configure-targets.patch
rename to meta/recipes-connectivity/openssl/openssl10/configure-targets.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2p/debian/c_rehash-compat.patch b/meta/recipes-connectivity/openssl/openssl10/debian/c_rehash-compat.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2p/debian/c_rehash-compat.patch
rename to meta/recipes-connectivity/openssl/openssl10/debian/c_rehash-compat.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2p/debian/debian-targets.patch b/meta/recipes-connectivity/openssl/openssl10/debian/debian-targets.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2p/debian/debian-targets.patch
rename to meta/recipes-connectivity/openssl/openssl10/debian/debian-targets.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2p/debian/man-dir.patch b/meta/recipes-connectivity/openssl/openssl10/debian/man-dir.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2p/debian/man-dir.patch
rename to meta/recipes-connectivity/openssl/openssl10/debian/man-dir.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2p/debian/man-section.patch b/meta/recipes-connectivity/openssl/openssl10/debian/man-section.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2p/debian/man-section.patch
rename to meta/recipes-connectivity/openssl/openssl10/debian/man-section.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2p/debian/no-rpath.patch b/meta/recipes-connectivity/openssl/openssl10/debian/no-rpath.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2p/debian/no-rpath.patch
rename to meta/recipes-connectivity/openssl/openssl10/debian/no-rpath.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2p/debian/no-symbolic.patch b/meta/recipes-connectivity/openssl/openssl10/debian/no-symbolic.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2p/debian/no-symbolic.patch
rename to meta/recipes-connectivity/openssl/openssl10/debian/no-symbolic.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2p/debian/pic.patch b/meta/recipes-connectivity/openssl/openssl10/debian/pic.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2p/debian/pic.patch
rename to meta/recipes-connectivity/openssl/openssl10/debian/pic.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2p/debian1.0.2/block_digicert_malaysia.patch b/meta/recipes-connectivity/openssl/openssl10/debian1.0.2/block_digicert_malaysia.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2p/debian1.0.2/block_digicert_malaysia.patch
rename to meta/recipes-connectivity/openssl/openssl10/debian1.0.2/block_digicert_malaysia.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2p/debian1.0.2/block_diginotar.patch b/meta/recipes-connectivity/openssl/openssl10/debian1.0.2/block_diginotar.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2p/debian1.0.2/block_diginotar.patch
rename to meta/recipes-connectivity/openssl/openssl10/debian1.0.2/block_diginotar.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2p/debian1.0.2/soname.patch b/meta/recipes-connectivity/openssl/openssl10/debian1.0.2/soname.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2p/debian1.0.2/soname.patch
rename to meta/recipes-connectivity/openssl/openssl10/debian1.0.2/soname.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2p/debian1.0.2/version-script.patch b/meta/recipes-connectivity/openssl/openssl10/debian1.0.2/version-script.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2p/debian1.0.2/version-script.patch
rename to meta/recipes-connectivity/openssl/openssl10/debian1.0.2/version-script.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2p/engines-install-in-libdir-ssl.patch b/meta/recipes-connectivity/openssl/openssl10/engines-install-in-libdir-ssl.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2p/engines-install-in-libdir-ssl.patch
rename to meta/recipes-connectivity/openssl/openssl10/engines-install-in-libdir-ssl.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2p/oe-ldflags.patch b/meta/recipes-connectivity/openssl/openssl10/oe-ldflags.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2p/oe-ldflags.patch
rename to meta/recipes-connectivity/openssl/openssl10/oe-ldflags.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2p/openssl-c_rehash.sh b/meta/recipes-connectivity/openssl/openssl10/openssl-c_rehash.sh
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2p/openssl-c_rehash.sh
rename to meta/recipes-connectivity/openssl/openssl10/openssl-c_rehash.sh
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2p/openssl-fix-des.pod-error.patch b/meta/recipes-connectivity/openssl/openssl10/openssl-fix-des.pod-error.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2p/openssl-fix-des.pod-error.patch
rename to meta/recipes-connectivity/openssl/openssl10/openssl-fix-des.pod-error.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2p/openssl_fix_for_x32.patch b/meta/recipes-connectivity/openssl/openssl10/openssl_fix_for_x32.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2p/openssl_fix_for_x32.patch
rename to meta/recipes-connectivity/openssl/openssl10/openssl_fix_for_x32.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2p/parallel.patch b/meta/recipes-connectivity/openssl/openssl10/parallel.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2p/parallel.patch
rename to meta/recipes-connectivity/openssl/openssl10/parallel.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2p/ptest-deps.patch b/meta/recipes-connectivity/openssl/openssl10/ptest-deps.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2p/ptest-deps.patch
rename to meta/recipes-connectivity/openssl/openssl10/ptest-deps.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2p/ptest_makefile_deps.patch b/meta/recipes-connectivity/openssl/openssl10/ptest_makefile_deps.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2p/ptest_makefile_deps.patch
rename to meta/recipes-connectivity/openssl/openssl10/ptest_makefile_deps.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2p/reproducible-cflags.patch b/meta/recipes-connectivity/openssl/openssl10/reproducible-cflags.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2p/reproducible-cflags.patch
rename to meta/recipes-connectivity/openssl/openssl10/reproducible-cflags.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2p/reproducible-mkbuildinf.patch b/meta/recipes-connectivity/openssl/openssl10/reproducible-mkbuildinf.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2p/reproducible-mkbuildinf.patch
rename to meta/recipes-connectivity/openssl/openssl10/reproducible-mkbuildinf.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2p/run-ptest b/meta/recipes-connectivity/openssl/openssl10/run-ptest
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2p/run-ptest
rename to meta/recipes-connectivity/openssl/openssl10/run-ptest
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2p/shared-libs.patch b/meta/recipes-connectivity/openssl/openssl10/shared-libs.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2p/shared-libs.patch
rename to meta/recipes-connectivity/openssl/openssl10/shared-libs.patch
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2p.bb b/meta/recipes-connectivity/openssl/openssl10_1.0.2p.bb
similarity index 91%
rename from meta/recipes-connectivity/openssl/openssl_1.0.2p.bb
rename to meta/recipes-connectivity/openssl/openssl10_1.0.2p.bb
index dbcb000..b7297fc 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2p.bb
+++ b/meta/recipes-connectivity/openssl/openssl10_1.0.2p.bb
@@ -11,8 +11,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f475368924827d06d4b416111c8bdb77"
 DEPENDS = "hostperl-runtime-native"
 DEPENDS_append_class-target = " openssl-native"
 
-PROVIDES += "openssl10"
-
 SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://run-ptest \
            file://openssl-c_rehash.sh \
@@ -56,6 +54,8 @@ SRC_URI_append_class-nativesdk = " \
 SRC_URI[md5sum] = "ac5eb30bf5798aa14b1ae6d0e7da58df"
 SRC_URI[sha256sum] = "50a98e07b1a89eb8f6a99477f262df71c6fa7bef77df4dc83025a2845c827d00"
 
+S = "${WORKDIR}/openssl-${PV}"
+
 UPSTREAM_CHECK_REGEX = "openssl-(?P<pver>1\.0.+)\.tar"
 
 inherit pkgconfig siteinfo multilib_header ptest manpages
@@ -326,20 +326,35 @@ do_install_ptest () {
 # file to be installed for both the base openssl package and the libcrypto
 # package since the base openssl package depends on the libcrypto package.
 
-PACKAGES =+ "libcrypto libssl openssl-conf ${PN}-engines ${PN}-misc"
+PACKAGES =+ "libcrypto10 libssl10 openssl10-conf ${PN}-engines ${PN}-misc"
 
-FILES_libcrypto = "${libdir}/libcrypto${SOLIBS}"
-FILES_libssl = "${libdir}/libssl${SOLIBS}"
-FILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf"
+FILES_libcrypto10 = "${libdir}/libcrypto${SOLIBS}"
+FILES_libssl10 = "${libdir}/libssl${SOLIBS}"
+FILES_openssl10-conf = "${sysconfdir}/ssl/openssl.cnf"
 FILES_${PN}-engines = "${libdir}/ssl/engines/*.so ${libdir}/engines"
 FILES_${PN}-misc = "${libdir}/ssl/misc"
 FILES_${PN} =+ "${libdir}/ssl/*"
 FILES_${PN}_append_class-nativesdk = " ${SDKPATHNATIVE}/environment-setup.d/openssl.sh"
 
-CONFFILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf"
+CONFFILES_openssl10-conf = "${sysconfdir}/ssl/openssl.cnf"
 
-RRECOMMENDS_libcrypto += "openssl-conf"
+RRECOMMENDS_libcrypto10 += "openssl10-conf"
 RDEPENDS_${PN}-misc = "${@bb.utils.filter('PACKAGECONFIG', 'perl', d)}"
 RDEPENDS_${PN}-ptest += "${PN}-misc make perl perl-module-filehandle bc"
 
 BBCLASSEXTEND = "native nativesdk"
+PACKAGE_PREPROCESS_FUNCS += "openssl_package_preprocess"
+
+# openssl 1.0 development files and executable binaries clash with openssl 1.1
+# files when installed into target rootfs. So we don't put them into
+# packages, but they continue to be provided via target sysroot for
+# cross-compilation on the host, if some software still depends on openssl 1.0.
+openssl_package_preprocess () {
+        for file in `find ${PKGD} -name *.h -o -name *.pc -o -name *.so`; do
+                rm $file
+        done
+        rm ${PKGD}/usr/bin/openssl
+        rm ${PKGD}/usr/bin/c_rehash
+        rmdir ${PKGD}/usr/bin
+
+}
-- 
2.7.4


