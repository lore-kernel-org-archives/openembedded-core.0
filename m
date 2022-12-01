Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55CB5C43217
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 14:23:52 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.44643.1669904631557759715
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 06:23:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=zXmVKw4s;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d3so1762945plr.10
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 06:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e8Eylsft4HgXGcyynYjReSJVRF+RUNLi4eDrTRq8mx8=;
        b=zXmVKw4sGy0nRDnuEb31TMKyfxWbO+jzbL773K1jLQpYeb6f3Tw/0IZpl4RGtylk0s
         Nxs7pD9oJ11bW3eAsOM6K82Pj8BQsEh+tGmHaPmGZ2JP1ZU2F2WyX200LIvQP8LXSCNS
         8POcVttyvsDf7XLFjzFhfiW8F2dzP8GFWXEX12dd0MmCl443MzoTQ+e1fTbTdXa+/YiI
         JUxU0w4PsozX5KMUUMcbuSIhlvDyAATGwE+rNjZ4Rk1L9hvkSnwy6uoDqaPYvj1VgDa0
         /4zdiPHOieRp5v5FzM5sGjOmnjPp8bPTIZeRa8nzEx370BQ994PxuLQ32eOjrWKcaR5I
         gp/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e8Eylsft4HgXGcyynYjReSJVRF+RUNLi4eDrTRq8mx8=;
        b=AalnRXw/LioKg3RsuVckrQI+ZeyJVuzee1Xg4BbtPKU/jg+n/5mH3uSQ8A/CyE0XsM
         mT6KzZc4Il0eDJapfIms7nMpXc8BzuaZTsphP5Iu9Y7Hy63/7LUaBBflhP5vro70ZjZU
         OU7GZM8olfyD6XUUUtxJyXWZ9gZjedYnEGEhK8YrrPczWM2Y32JIdRQAhKtlDvBvSLgM
         OYv33nIscZ1yRB8wnCfs24USEseJnAW9p5Li/mJ8Qtt1CZfMx3Pttul0aUCUYrQ8NIkI
         aA4Ck/R4obX0jIpOXuAR3Us82HTEw6Ef9LJyiNfd2DQ/Xi+z6rF5frf1G9Q21HDnP3Aw
         cchQ==
X-Gm-Message-State: ANoB5pnW8dNVWgK+LU/udvq+q20vN9O1U4o+F9HREfKwuLR+eDiQ6jg5
	R4wmOOUT4GxAQ/DLO3Z6kdD+shMfT+/RMQ4CuUE=
X-Google-Smtp-Source: AA0mqf4QeFFbEL1dGJ8SywOki+v+x47uQtJ73T7NmWhUIZi/BPx8jZOghmWSvWtXfRqno5TduIITLA==
X-Received: by 2002:a17:902:7b84:b0:189:6623:61c9 with SMTP id w4-20020a1709027b8400b00189662361c9mr33128146pll.121.1669904630088;
        Thu, 01 Dec 2022 06:23:50 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id p2-20020a622902000000b00575acb243besm3300615pfp.1.2022.12.01.06.23.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 06:23:49 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 21/22] resolvconf: make it work
Date: Thu,  1 Dec 2022 04:22:51 -1000
Message-Id: <aba0164359347e062cf64bcc6bb34ed08c2377b5.1669904433.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669904433.git.steve@sakoman.com>
References: <cover.1669904433.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 14:23:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174084

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


