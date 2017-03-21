Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id EAEEC71D7E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Mar 2017 04:07:17 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id r137so16335435pfr.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 21:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=6x5DnFvc+JqBBtHmnew0+K6xkNYjxZvLxLpw9jA5wqk=;
	b=LHFVgZuDNs0/dDkxxttu23orGjWFGTLl4fIkF9i1KXPeKPOZGp9O3AVLqJLXhU1m/z
	NlJ0PGAuDVSMccsVKEcfH1DsJuDees4urRXXTy4Ktco9D36idyyYQSEYRNyyEJZnh6hl
	d5FhpYkRrWA/640C5ZA7749F1OUpa/KIz7cUIpmV9iwyGuwk7krxQPQHXEXVpipszoEV
	nXny1ykd2YX8KNfva2EoTEbckb5AsTwlynMn/LjzCXPHHRg4YThsEzFfVYmMEn8SGSFi
	UFh7HH4g+KaHdv4dbik9/0prN2PdlDEbOHU7iY5aPMMta+iZ6ebQRqODGbfUCwpfXX7c
	jYlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6x5DnFvc+JqBBtHmnew0+K6xkNYjxZvLxLpw9jA5wqk=;
	b=SxEf7PgUWyLP6WtTGB7bbjcJ3K2esUAcb3EFDmGi4wU/thdvLSpt/DWptMM3Q6sk9R
	ge+ffD1g+nvXejD+qJA2fRPsA0nvprFVnceU5aCw7Kti59QrcWB0aftT/MTTlMgkDFBT
	SiE1vMn/c/QVetIA4B5QHiRNi+ua6R4m4Vw07cWmwDbbzE4tE1YIr/DoPB+89X2p0Ggd
	fdE5hbCkdv+rkCWj4buM+jwfNvq8isfBNBk7hlIg/B+kmC7tGFuH3jHzVkVMtd7nQ6Tg
	2PQPBLmL+iv718RUqw2zBH1rm38UoLlB1BQnTyBcOiOi5R4dqh13HxT5rYYFy1aJCCAp
	bfoA==
X-Gm-Message-State: AFeK/H2guIutQRsPg4B6oyFhIps3GW7XIdXyKL2W225f5uGDEx/vIx7QFJ/Ae28NZIT7mQ==
X-Received: by 10.84.218.75 with SMTP id f11mr4151871plm.146.1490069239036;
	Mon, 20 Mar 2017 21:07:19 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	y5sm35875421pfd.33.2017.03.20.21.07.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Mar 2017 21:07:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Mar 2017 21:07:06 -0700
Message-Id: <20170321040706.14787-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
Subject: [PATCH] libcomps: Fix/optimize building with clang
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
X-List-Received-Date: Tue, 21 Mar 2017 04:07:18 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-Make-__comps_objmrtree_all-static-inline.patch | 35 ++++++++++++++++++++++
 meta/recipes-devtools/libcomps/libcomps_git.bb     |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-devtools/libcomps/libcomps/0001-Make-__comps_objmrtree_all-static-inline.patch

diff --git a/meta/recipes-devtools/libcomps/libcomps/0001-Make-__comps_objmrtree_all-static-inline.patch b/meta/recipes-devtools/libcomps/libcomps/0001-Make-__comps_objmrtree_all-static-inline.patch
new file mode 100644
index 0000000000..864098e592
--- /dev/null
+++ b/meta/recipes-devtools/libcomps/libcomps/0001-Make-__comps_objmrtree_all-static-inline.patch
@@ -0,0 +1,35 @@
+From 91a324f8771818b81017fdf4daaad0c8c4b6987c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 20 Mar 2017 11:38:54 -0700
+Subject: [PATCH] Make __comps_objmrtree_all() static inline
+
+This helps compilers to scope the symbol correctly
+and apply the inlining optimizations, clang e.g.
+emits the functions and calls in code which is
+suboptimal, therefore give a little help to compiler
+this function is not used anywhere else to have
+a global scope.
+
+Usptream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libcomps/src/comps_objmradix.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libcomps/src/comps_objmradix.c b/libcomps/src/comps_objmradix.c
+index 9be6648..55f7793 100644
+--- a/libcomps/src/comps_objmradix.c
++++ b/libcomps/src/comps_objmradix.c
+@@ -604,7 +604,7 @@ inline void comps_objmrtree_pair_destroy_v(void * pair) {
+     free(pair);
+ }
+ 
+-inline COMPS_HSList* __comps_objmrtree_all(COMPS_ObjMRTree * rt, char keyvalpair) {
++static inline COMPS_HSList* __comps_objmrtree_all(COMPS_ObjMRTree * rt, char keyvalpair) {
+     COMPS_HSList *to_process, *ret;
+     COMPS_HSListItem *hsit, *oldit;
+     size_t x;
+-- 
+2.12.0
+
diff --git a/meta/recipes-devtools/libcomps/libcomps_git.bb b/meta/recipes-devtools/libcomps/libcomps_git.bb
index 8ff13b26b6..db4481bc8c 100644
--- a/meta/recipes-devtools/libcomps/libcomps_git.bb
+++ b/meta/recipes-devtools/libcomps/libcomps_git.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "git://github.com/rpm-software-management/libcomps.git \
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            file://0002-Set-library-installation-path-correctly.patch \
+           file://0001-Make-__comps_objmrtree_all-static-inline.patch \
            "
 
 PV = "0.1.8+git${SRCPV}"
-- 
2.12.0


