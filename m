Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
	[209.85.210.169])
	by mail.openembedded.org (Postfix) with ESMTP id 63A966D4B6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Sep 2019 02:59:29 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id b13so20336056pfo.8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Sep 2019 19:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=IBsb8KGV3o1XPIeGQA3RA6oDUpxvPwZQ/XqELAEcHH4=;
	b=RRQLnTEe3RSivSYjwIUemxjsOSnGdr0BWb7Kv3J15uxMiBgICGuwFQsF1KeeqAgQlE
	yCGUmcJqA7Hi1Ff6wf9crwFNFLbAKz1/FwPeuv8l4/pF8BHsZu+4o+tiKYMt/WE1xf1p
	J3OZGYnku+qf7pMYabq3Ds5bTO/zXB8mC/MVLerYJXYib65h5lptW6YUaJ235pdrTnlM
	BZlRhdqFLCKtf/x+yzKQuyxJeX13d5rPBPT371Vj57Qvo7CLb0Cna/D3SeQGw2/DEDB6
	8DHTfpRouXbtmZNVmMfUd03IOuLXnU+SMY3UTuTcAj+FfWV3NiBQVzZXmc2KpWJdTXBa
	TX/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=IBsb8KGV3o1XPIeGQA3RA6oDUpxvPwZQ/XqELAEcHH4=;
	b=MWjOiiizlFBVT4ZLZ0viiAkc2FnUKnso62DqIZ6R5jHZtKKPwoycIyfkRqaqDyTxzq
	utQp5xU+gBIlkm3j3CGvoUJrWkmG7GhPiOGP9JxMUYCaZY/nJJLcX5wne+QPb+AUVG80
	sgdg+s4B9/YBIE9dj8B+iQxy534zTPVf6xzAxsDJDH212WrG+udz6ZfPnzPX9gSKNsnL
	Nr6hg9+rQFR67O26ovp692H5Euj8Y89zhV0WcYQGXXytElcnqD5aVGfzDVcdo6YGRoaQ
	EEdaT3IuPgRNUVIPApJ0Hcul87uquT+DgTdDvdNNb/1sW0Lfc0zK+n3+Pck4QdME2phY
	I56Q==
X-Gm-Message-State: APjAAAWuEXwYDPfcSFAl2ySWVudZQFFwiiBZad6N+Qb9f5MerhRE9gwI
	OS3G1TjeJntnNmYd7a4Rgnhnji2txCw=
X-Google-Smtp-Source: APXvYqyh69MRiNvUuJMUIaEs0xILYnUILopiGGW8h7xz1sp5LJkPnYnIyCE3F7JT4RJk0etAqvM1Gw==
X-Received: by 2002:aa7:85d0:: with SMTP id z16mr62897pfn.206.1568516370027;
	Sat, 14 Sep 2019 19:59:30 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	6sm54699668pfa.162.2019.09.14.19.59.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 14 Sep 2019 19:59:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 14 Sep 2019 19:59:21 -0700
Message-Id: <20190915025922.3859296-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH 1/2] glibc: Move DISTRO_FEATURE specific do_install code for target recipe only
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
X-List-Received-Date: Sun, 15 Sep 2019 02:59:30 -0000
Content-Transfer-Encoding: 8bit

nativesdk-glibc should be spared of recompile when the distro features
are changed e.g. ldconfig is not in
DISTRO_FEATURES, this happens when sdk with musl and another one with
glibc is built

Fixes
Variable do_install value changed:
...
-DISTRO_FEATURES{ldconfig} = Set
+DISTRO_FEATURES{ldconfig} = Unset

Signed-off-by: Khem Raj <raj.khem@gmail.com>

s
---
 meta/recipes-core/glibc/glibc-package.inc | 39 ++++++++++++-----------
 1 file changed, 20 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 9b1e7b7903..2e8f9f3e02 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -83,14 +83,6 @@ do_install_append () {
 		rm -f ${D}${infodir}/dir
 	fi
 
-	if ! ${@bb.utils.contains('DISTRO_FEATURES', 'ldconfig', 'true', 'false', d)}; then
-		# The distro doesn't want these files so let's not install them
-		rm -f ${D}${sysconfdir}/ld.so.conf
-		rm -f ${D}${base_sbindir}/ldconfig
-		# This directory will be empty now so remove it too.
-		rmdir ${D}${sysconfdir}
-	fi
-
 	install -d ${D}${sysconfdir}/init.d
 	install -d ${D}${localstatedir}/db/nscd
 	install -m 0755 ${S}/nscd/nscd.init ${D}${sysconfdir}/init.d/nscd
@@ -102,6 +94,26 @@ do_install_append () {
 	install -d ${D}${systemd_unitdir}/system
 	install -m 0644 ${S}/nscd/nscd.service ${D}${systemd_unitdir}/system/
 
+	# The dynamic loader will have been installed into
+	# ${base_libdir}. However, if that isn't going to end up being
+	# available in the ABI-mandated location, then a symlink must
+        # be created.
+
+	if [ -n "${ARCH_DYNAMIC_LOADER}" -a ! -e "${D}${root_prefix}/lib/${ARCH_DYNAMIC_LOADER}" ]; then
+		install -d ${D}${root_prefix}/lib
+		ln -s ${@oe.path.relative('${root_prefix}/lib', '${base_libdir}')}/${ARCH_DYNAMIC_LOADER} \
+				${D}${root_prefix}/lib/${ARCH_DYNAMIC_LOADER}
+	fi
+}
+
+do_install_append_class-target() {
+	if ! ${@bb.utils.contains('DISTRO_FEATURES', 'ldconfig', 'true', 'false', d)}; then
+		# The distro doesn't want these files so let's not install them
+		rm -f ${D}${sysconfdir}/ld.so.conf
+		rm -f ${D}${base_sbindir}/ldconfig
+		# This directory will be empty now so remove it too.
+		rmdir ${D}${sysconfdir}
+	fi
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
 		install -d ${D}${sysconfdir}/tmpfiles.d
 		echo "d /run/nscd 755 root root -" \
@@ -114,18 +126,7 @@ do_install_append () {
 			> ${D}${sysconfdir}/default/volatiles/98_nscd
 	fi
 
-	# The dynamic loader will have been installed into
-	# ${base_libdir}. However, if that isn't going to end up being
-	# available in the ABI-mandated location, then a symlink must
-        # be created.
-
-	if [ -n "${ARCH_DYNAMIC_LOADER}" -a ! -e "${D}${root_prefix}/lib/${ARCH_DYNAMIC_LOADER}" ]; then
-		install -d ${D}${root_prefix}/lib
-		ln -s ${@oe.path.relative('${root_prefix}/lib', '${base_libdir}')}/${ARCH_DYNAMIC_LOADER} \
-				${D}${root_prefix}/lib/${ARCH_DYNAMIC_LOADER}
-	fi
 }
-
 do_install_append_aarch64 () {
 	do_install_armmultilib
 }
-- 
2.23.0


