Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 2F35E739BE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 14:09:11 +0000 (UTC)
Received: by wicmv11 with SMTP id mv11so63107746wic.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 07:09:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=vs/JshCRusQU8EVVPYbMEwsvH3PlRGQajjV+zKjn4bQ=;
	b=aacAlY5V+JWg/c9pe+bdrZ62Iv4fkNn6VYar7OhYtapauCm2RW5K3PWO+29wXXXj/w
	M696fAyYevuPFYPbs0YvqPH2778nqTtw347hHDCEdFWvkdU5ormwYJ9ezArtPRYyTVi8
	dAC309HLhFNYkqT8rW0NMSzdrPLkbB6vn768UY2jC0abdZOVqZVSqzp/dGbwaX/6EgE3
	cqc+9rdC6xvRw+Ajqlmqis+8cgW0rA+UhN3XB4YrSeAm4puRlN1GNm6igBm3elc8+HjK
	BPGXDyRc9JKd4nzwnQoHur0fTMVOACooSTLD1jjtEtWfxRFhNuEhRXAbyISwCtLKyttI
	HFgA==
X-Gm-Message-State: ALoCoQlIZcsZDExfmSWWl8kf5/E+V6iAdhIzCbZw++DB4AUr1EFwwTfhhQpZrUC2cTJ4Ct/W791u
X-Received: by 10.194.86.130 with SMTP id p2mr63186325wjz.99.1436796551636;
	Mon, 13 Jul 2015 07:09:11 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	f3sm14841438wiz.13.2015.07.13.07.09.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Jul 2015 07:09:11 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jul 2015 15:03:05 +0100
Message-Id: <b306a4b740868835ff0e0ac14d8b7ed9afe83091.1436795781.git.ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1436795781.git.ross.burton@intel.com>
References: <cover.1436795781.git.ross.burton@intel.com>
In-Reply-To: <cover.1436795781.git.ross.burton@intel.com>
References: <cover.1436795781.git.ross.burton@intel.com>
Subject: [PATCH 7/7] kernel: fix path assumptions
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
X-List-Received-Date: Mon, 13 Jul 2015 14:09:12 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/kernel.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 76d03dc..d06f6cf 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -211,8 +211,8 @@ kernel_do_compile() {
 
 do_compile_kernelmodules() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
-	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
-		oe_runmake ${PARALLEL_MAKE} modules CC="${KERNEL_CC}" LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
+	if (grep -q -i -e '^CONFIG_MODULES=y$' ${B}/.config); then
+		oe_runmake -C ${B} ${PARALLEL_MAKE} modules CC="${KERNEL_CC}" LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
 	else
 		bbnote "no modules to compile"
 	fi
@@ -260,7 +260,7 @@ emit_depmod_pkgdata() {
 	# Stash data for depmod
 	install -d ${PKGDESTWORK}/kernel-depmod/
 	echo "${KERNEL_VERSION}" > ${PKGDESTWORK}/kernel-depmod/kernel-abiversion
-	cp System.map ${PKGDESTWORK}/kernel-depmod/System.map-${KERNEL_VERSION}
+	cp ${B}/System.map ${PKGDESTWORK}/kernel-depmod/System.map-${KERNEL_VERSION}
 }
 
 PACKAGEFUNCS += "emit_depmod_pkgdata"
@@ -336,7 +336,7 @@ kernel_do_configure() {
 }
 
 do_savedefconfig() {
-	oe_runmake savedefconfig
+	oe_runmake -C ${B} savedefconfig
 }
 do_savedefconfig[nostamp] = "1"
 addtask savedefconfig after do_configure
-- 
2.1.4


