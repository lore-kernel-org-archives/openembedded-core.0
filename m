Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CB20C43217
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 14:28:12 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.44942.1669904891337123978
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 06:28:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=4F3Y7pFA;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id w2so478633pfq.12
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 06:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e8Eylsft4HgXGcyynYjReSJVRF+RUNLi4eDrTRq8mx8=;
        b=4F3Y7pFAZ7sDR1HCIIvNcMfGc/nUrOuHrC8hpQImRwPjqKyZ9OwEJL00rijgbqooUc
         q+FjTLWL0EOhLiy8l6cOcHln/7w6FHyB1nVYfJAQy6NcRDS3Msi3l2+c/y3ImhhSRbiG
         VYYMOTuWmJBJAEc4+d+BIsPr+3almqjeTP5CwTFcv126bfzMPnqVPHFlxQmKFB/6bsCi
         1zzvHvf2N/tpxZM/9KzEXLlFjA4p+9vSsW87fd7dZEk1koRZNXoi66Shz84DaZYDgrTB
         YdBkzMS8/u3aytCyy/+BYeb53BMrDsNyM0aUdiZoyyryT3OL/kv7YRp+aewj35ivrs0a
         GK/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e8Eylsft4HgXGcyynYjReSJVRF+RUNLi4eDrTRq8mx8=;
        b=W+VkoFg3CBCcsy3zXDJhsO/5YiJehPtGIHFDXLY3oDsvHX4Im2fD+RX2jN4OFOmBrb
         w/s1dvM4PK6HHwLglrfmMKS1aA4GVTkmKRUS3Au8Mn3qbqbI37hN0gGNiXn8HpSkHidL
         bl3eYh+rSI5lgwbcFrl2XPVsxlD6uaHocduncrVpp4hmJ/OcQbeiJZyg+yRiJBX6E1Xj
         6o5xXt2wrnKZTr+XPc1VxSeMZ1uOP8+NbP8ATT54cZfUqK+QH3UCy0KYxEnz2Yfda0kW
         Zt/I19HLvJJ1dWm1+ifai+a1Dr5xBcjcxugg5dJ8QjdSk8ivOG4yr86N2RCi9MINnTV6
         VZBQ==
X-Gm-Message-State: ANoB5plTLVhQNSEaMaXL/yKpA0cLsXOd+cSF3kxEMW1oyCareU5dRkD2
	gwC1TYaa0fG23RyWydgrgrX9d6jB1EPfcb+kq0g=
X-Google-Smtp-Source: AA0mqf7r5vewhjroMZshKrzDwIz7rSiErUfBlVAZL9qCh24JEaKHxcM9HgF6X2MbcCL7PJWfk7uO7A==
X-Received: by 2002:a63:c46:0:b0:476:ed2a:6228 with SMTP id 6-20020a630c46000000b00476ed2a6228mr41966467pgm.137.1669904890121;
        Thu, 01 Dec 2022 06:28:10 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id b14-20020a17090a6ace00b00218e8a0d7f0sm4908308pjm.22.2022.12.01.06.28.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 06:28:09 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 21/23] resolvconf: make it work
Date: Thu,  1 Dec 2022 04:27:15 -1000
Message-Id: <66d85b2d841e6d3281f47ef9a39aa5483aad35d0.1669904703.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669904703.git.steve@sakoman.com>
References: <cover.1669904703.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 14:28:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174107

From: Chen Qi <Qi.Chen@windriver.com>

The current resolvconf does not work. Make it work with the
following changes.
1. Install normalize-resolvconf, which is used by resolvconf.
2. Add dependencies: sed, util-linux-flock.
   util-linux-flock is needed by our busybox does not support '-w'
   by default. sed is needed because we want to avoid package
   QA issue complaining sed is needed by no one provides it.
3. Add a patch to replace 'readlink -m' with 'readlink -l'.
   This could avoid the runtime dependency on coreutils. The replacement
   is safe as /etc always exits in OE's system.
4. Remove allarch inheritage. This is because the above RDEPENDS
   change does not allow this any more. test_sstate_allarch_samesigs
   would fail if we don't do this.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 1b0581fd241cc9de2feda896aefbf055dc0099dc)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...01-avoid-using-m-option-for-readlink.patch | 37 +++++++++++++++++++
 .../resolvconf/resolvconf_1.91.bb             |  9 +++--
 2 files changed, 42 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-connectivity/resolvconf/resolvconf/0001-avoid-using-m-option-for-readlink.patch

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf/0001-avoid-using-m-option-for-readlink.patch b/meta/recipes-connectivity/resolvconf/resolvconf/0001-avoid-using-m-option-for-readlink.patch
new file mode 100644
index 0000000000..ab32f26754
--- /dev/null
+++ b/meta/recipes-connectivity/resolvconf/resolvconf/0001-avoid-using-m-option-for-readlink.patch
@@ -0,0 +1,37 @@
+From 6bf2bb136a0b3961339369bc08e58b661fba0edb Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Thu, 17 Nov 2022 17:26:30 +0800
+Subject: [PATCH] avoid using -m option for readlink
+
+Use a more widely used option '-f' instead of '-m' here to
+avoid dependency on coreutils.
+
+Looking at the git history of the resolvconf repo, the '-m'
+is deliberately used. And it wants to depend on coreutils.
+But in case of OE, the existence of /etc is ensured, and busybox
+readlink provides '-f' option, so we can just use '-f'. In this
+way, the coreutils dependency is not necessary any more.
+
+Upstream-Status: Inappropriate [OE Specific]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ etc/resolvconf/update.d/libc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/etc/resolvconf/update.d/libc b/etc/resolvconf/update.d/libc
+index 1c4f6bc..f75d22c 100755
+--- a/etc/resolvconf/update.d/libc
++++ b/etc/resolvconf/update.d/libc
+@@ -57,7 +57,7 @@ fi
+ report_warning() { echo "$0: Warning: $*" >&2 ; }
+ 
+ resolv_conf_is_symlinked_to_dynamic_file() {
+-	[ -L ${ETC}/resolv.conf ] && [ "$(readlink -m ${ETC}/resolv.conf)" = "$DYNAMICRSLVCNFFILE" ]
++	[ -L ${ETC}/resolv.conf ] && [ "$(readlink -f ${ETC}/resolv.conf)" = "$DYNAMICRSLVCNFFILE" ]
+ }
+ 
+ if ! resolv_conf_is_symlinked_to_dynamic_file ; then
+-- 
+2.17.1
+
diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb
index 94fd2c1a70..3f1b75d07d 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb
@@ -9,10 +9,11 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
 AUTHOR = "Thomas Hood"
 HOMEPAGE = "http://packages.debian.org/resolvconf"
-RDEPENDS:${PN} = "bash"
+RDEPENDS:${PN} = "bash sed util-linux-flock"
 
 SRC_URI = "git://salsa.debian.org/debian/resolvconf.git;protocol=https;branch=unstable \
            file://99_resolvconf \
+           file://0001-avoid-using-m-option-for-readlink.patch \
            "
 
 SRCREV = "859209d573e7aec0e95d812c6b52444591a628d1"
@@ -23,8 +24,6 @@ S = "${WORKDIR}/git"
 # so we check the latest upstream from a directory that does get updated
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/r/resolvconf/"
 
-inherit allarch
-
 do_compile () {
 	:
 }
@@ -39,12 +38,14 @@ do_install () {
 	fi
 	install -d ${D}${base_libdir}/${BPN}
 	install -d ${D}${sysconfdir}/${BPN}
+	install -d ${D}${nonarch_base_libdir}/${BPN}
 	ln -snf ${localstatedir}/run/${BPN} ${D}${sysconfdir}/${BPN}/run
 	install -d ${D}${sysconfdir} ${D}${base_sbindir}
 	install -d ${D}${mandir}/man8 ${D}${docdir}/${P}
 	cp -pPR etc/resolvconf ${D}${sysconfdir}/
 	chown -R root:root ${D}${sysconfdir}/
 	install -m 0755 bin/resolvconf ${D}${base_sbindir}/
+	install -m 0755 bin/normalize-resolvconf ${D}${nonarch_base_libdir}/${BPN}
 	install -m 0755 bin/list-records ${D}${base_libdir}/${BPN}
 	install -d ${D}/${sysconfdir}/network/if-up.d
 	install -m 0755 debian/resolvconf.000resolvconf.if-up ${D}/${sysconfdir}/network/if-up.d/000resolvconf
@@ -64,4 +65,4 @@ pkg_postinst:${PN} () {
 	fi
 }
 
-FILES:${PN} += "${base_libdir}/${BPN}"
+FILES:${PN} += "${base_libdir}/${BPN} ${nonarch_base_libdir}/${BPN}"
-- 
2.25.1


