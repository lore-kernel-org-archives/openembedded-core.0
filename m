Return-Path: <christopher.w.clark@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id A878378CF0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 20:16:57 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id t17-v6so2753367ply.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 13:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=zG4AtVOvl+vs5P7JIftz6JhpPu7uRDYc/8kratBAEp8=;
	b=j3EvN0OSODQjGb54OSMZZl0s5Ey1xNwHzjAqj6VocyK0UnbZigDjEGfjCx+za09NZk
	1JGPk39wIFxrmSajRFuthxC33jBe7dnCqnTh6CXX2k6EjnUZVPENXAXRditvAnLQg68u
	y6My7kRwviGR9M8AXU1oETsYPryhihN7yna5MLnE4C50InKp7Gbuz/vrwhtyMgQTktca
	ZtbA48V3LB22Iwhd7L4wzmKkL7FFeXCqTc7GHpzU6HrdCe36U3YsJ5ikwFItoqkOKnrd
	jLrRcQAFMdIyCA4qC6q3ZGF5p8Wyh2rypLvPpTG5zp25mlyKdFEfFEDKPjm9ar5iw6cy
	AbQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zG4AtVOvl+vs5P7JIftz6JhpPu7uRDYc/8kratBAEp8=;
	b=Cw3197puEbCgaO6i2RjppDDqaSBJ62Vy7nY1hsdDARsx9pJDqslz4vR/1joZObC5GZ
	NlxahbTF46i/FsHUmQkgF+IGiUDlEYk14Zeriz7db/ldXV8RN6ane08ML97zOiFk0v17
	71nLXExC7svZMAzGX82kRiuhkMYcuDeN8cBoaXtz2/s7QekFbet9WW8luPFvTLlsVOhX
	U1amUkNesDSbbsRF3e/RT8vptprmsNWq8v16GA/o02cPceLfxqQj3v2a+M7qx/0R+O5Y
	Sgj/J6ykHZ8CBmWxmUPYKqsi1uRnaEOullNRznVAKjPDcgHdmfk0z29IYjtfxuaVw2Nx
	LXKQ==
X-Gm-Message-State: AOUpUlGPoN8h/tzUoSC1JGT1u9g6QkG6rr/zF9ydEenirgaDsAjmeEq3
	T0bnpVyxEkYxm1fAY8mtoknuvmtq7/o=
X-Google-Smtp-Source: AAOMgpdCFWvoogpuazaFkkOeyf24leS5DPYVuGEAmpwkS9aEowZO+WXUo4xGTWWzUAVfhsDypxtsfg==
X-Received: by 2002:a17:902:7b96:: with SMTP id
	w22-v6mr7320317pll.24.1532722618474; 
	Fri, 27 Jul 2018 13:16:58 -0700 (PDT)
Received: from WorkStation-T3500.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id
	v22-v6sm13596372pfi.60.2018.07.27.13.16.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Jul 2018 13:16:57 -0700 (PDT)
From: Christopher Clark <christopher.w.clark@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jul 2018 13:16:47 -0700
Message-Id: <1532722607-21244-1-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v4] binutils : enable x86_64-pep for producing EFI binaries on x86/x86-64
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
X-List-Received-Date: Fri, 27 Jul 2018 20:16:57 -0000

On x86 and x86_64 architectures, add the x86_64-pep emulation support
to the linker to enable production of Portable Executables for EFI
binaries.

Enables building the EFI variant of the Xen hypervisor.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---

Changes in v4: unbreak non-x86/x86-64: only supply the configure flag
               "--enable-targets=" if also supplying a value to it.

 meta/recipes-devtools/binutils/binutils.inc | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index 37813dd..e269bdb 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -74,12 +74,17 @@ EXTRA_OECONF = "--program-prefix=${TARGET_PREFIX} \
                 --enable-deterministic-archives \
                 --enable-plugins \
                 ${LDGOLD} \
-                ${@bb.utils.contains('DISTRO_FEATURES', 'multiarch', '--enable-64-bit-bfd', '', d)}"
+                ${@bb.utils.contains('DISTRO_FEATURES', 'multiarch', '--enable-64-bit-bfd', '', d)} \
+                ${ENABLE_EXTRA_TARGETS}"
 
 LDGOLD_class-native = ""
 LDGOLD_class-crosssdk = ""
 LDGOLD ?= "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '--enable-gold=default --enable-threads', '--enable-gold --enable-ld=default --enable-threads', d)}"
 
+ARCH_EFI_EMULATION_x86-64 = "x86_64-pep"
+ARCH_EFI_EMULATION_x86 = "x86_64-pep"
+ENABLE_EXTRA_TARGETS ?= "${@ "--enable-targets=" + d.getVar('ARCH_EFI_EMULATION') if d.getVar('ARCH_EFI_EMULATION') else ""}"
+
 # This is necessary due to a bug in the binutils Makefiles
 # EXTRA_OEMAKE = "configure-build-libiberty all"
 
-- 
2.7.4


