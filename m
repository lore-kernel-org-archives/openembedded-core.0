Return-Path: <andre.draszik@gmail.com>
Received: from mail-yb1-f194.google.com (mail-yb1-f194.google.com
	[209.85.219.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6E9CE7C11A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 14:45:44 +0000 (UTC)
Received: by mail-yb1-f194.google.com with SMTP id i6so1127139ybo.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 06:45:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=7u4xqIPRyr2GAUfZ2Fu0L+DRWcCEr3bM9Tzse0wkrg0=;
	b=A9W9KTaL7zbFHQ0yb7PeNKSZwSzL0B0JDP+d+3WU5wIB0ZuV7aqV/W/oxBvU6f9X9P
	oc0kKKjmCFFqtahnuF0PdW1M1J6P1N25o06Eh9E9pDf9YSwo5N/Y0ALOByRBiQr1NqcF
	ehlEESVDpGpDGqT7TLIggpSYSDH8ZMrLZ6TuQZ/r8pqblvkjDCTtxXA9qhDGDN2Zqg3j
	zWp0slL0gYnhnMKkyamqsUUxsQT/Y78NY/CilgiAVKQQUuRCGkPSj6XcLnEGGMXXG+aB
	LNGRhzYJX9nan3kmzCfk8i/4VT17mV+E4dEklHcVvzSp7pJUR33H6TWZrESrpTBPDs4+
	2Agw==
X-Gm-Message-State: AJcUukdWU3xgCsAHAINvLx59JV3syc7kuT+JJ0f+qKqi+xMFFTeK24kd
	oNzEVdh4ZLA4/Cdn6HRgSRLncfGr
X-Google-Smtp-Source: ALg8bN7fWeiqZ+zqs2laiuU6I5ytqiMHJ5nrgbLD9OKlHqSaFMTNinuLTy7zVCcgQjs75L9Ohqs1Uw==
X-Received: by 2002:a25:6652:: with SMTP id z18mr3202939ybm.242.1547563545264; 
	Tue, 15 Jan 2019 06:45:45 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	i13sm1261220ywe.53.2019.01.15.06.45.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jan 2019 06:45:44 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2019 14:45:22 +0000
Message-Id: <20190115144525.29388-13-git@andred.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190115144525.29388-1-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
	<20190115144525.29388-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v2 12/15] util-linux: simplify meta-package RDEPENDS / RRECOMMENDS
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
X-List-Received-Date: Tue, 15 Jan 2019 14:45:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

The util-linux meta-package now simply RRECOMMENDS all
subpackages created. There is no distinction between what
it previously recommended or depended on for existing
packages.

This is to streamline the dependencies and to make things
less surprising.

[YOCTO #13058]

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 3cf1a18419..f3c3ae65c8 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -33,16 +33,14 @@ PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'pylibmount', 'util-linux-pyl
 
 python apply_update_alternative_renames_prepend () {
     def pkg_hook(f, pkg, file_regex, output_pattern, modulename):
+        pn = d.getVar('PN')
+        d.appendVar('RRECOMMENDS_%s' % pn, ' %s' % pkg)
+
         if d.getVar('ALTERNATIVE_' + pkg):
             return
         if d.getVarFlag('ALTERNATIVE_LINK_NAME', modulename):
             d.setVar('ALTERNATIVE_' + pkg, modulename)
 
-    def pkg_hook_with_recommends(f, pkg, file_regex, output_pattern, modulename):
-        pn = d.getVar('PN')
-        d.appendVar('RRECOMMENDS_%s' % pn, ' %s' % pkg)
-        pkg_hook(f, pkg, file_regex, output_pattern, modulename)
-
     do_split_packages(d, root='${base_sbindir}',
                       file_regex=r'(.*)', output_pattern='${PN}-%s',
                       description='${PN} %s',
@@ -54,11 +52,11 @@ python apply_update_alternative_renames_prepend () {
     do_split_packages(d, root='${sbindir}',
                       file_regex=r'(.*)', output_pattern='${PN}-%s',
                       description='${PN} %s',
-                      hook=pkg_hook_with_recommends, extra_depends='', prepend=True)
+                      hook=pkg_hook, extra_depends='', prepend=True)
     do_split_packages(d, root='${bindir}',
                       file_regex=r'(.*)', output_pattern='${PN}-%s',
                       description='${PN} %s',
-                      hook=pkg_hook_with_recommends, extra_depends='', prepend=True)
+                      hook=pkg_hook, extra_depends='', prepend=True)
 }
 
 PACKAGES_DYNAMIC = "^util-linux-.*"
@@ -108,12 +106,6 @@ FILES_${PN}-setarch = "${bindir}/linux32 ${bindir}/linux64 ${bindir}/uname26"
 RCONFLICTS_util-linux-blkid = "e2fsprogs-blkid"
 RREPLACES_util-linux-blkid = "e2fsprogs-blkid"
 
-RDEPENDS_${PN} = "util-linux-umount util-linux-swaponoff util-linux-losetup util-linux-sulogin util-linux-lsblk"
-RDEPENDS_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'util-linux-runuser util-linux-su', '', d)}"
-
-RRECOMMENDS_${PN} += "${PN}-blockdev ${PN}-cfdisk ${PN}-ctrlaltdel ${PN}-fdisk ${PN}-mkswap ${PN}-nologin ${PN}-pivot-root ${PN}-switch-root"
-RRECOMMENDS_${PN} += "${PN}-dmesg ${PN}-kill ${PN}-more ${PN}-mount ${PN}-mountpoint"
-
 RRECOMMENDS_${PN}_class-native = ""
 RRECOMMENDS_${PN}_class-nativesdk = ""
 RDEPENDS_${PN}_class-native = ""
-- 
2.20.1


