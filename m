Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2974C433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 20:02:08 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web09.3092.1643918528142649106
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 12:02:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CW9GshYX;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id
 h20-20020a17090adb9400b001b518bf99ffso11039251pjv.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 12:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WrnsW/0XKRFy0AyPwUMgzwrimhLY+1i2c+wg/ycL1gw=;
        b=CW9GshYXpuQhMNFb+m6x/DmEDep4+vKqP/lWF3jyVuFuzPXmLuOqrdoT6G9LHBkQC7
         MQc2+pmaT8giFDWRaNbGrcFCCREXWGn7E2ptsn9x4MULhI6r4Ocglw7Bq/Yw7JoiWd6O
         ZKFkQ8OBYRBkxElR6TkMDqYg/C8laUnZylHiZE7wCriAcHF3dd3TWZ/iWD2A9X6iUyic
         NbyyluLmGIEa9dznTjEnu6N6JSxc8yRo7WpyjYVE5Z/VRzwGq3hCZWrT5/xEgmVEc1R/
         zegRJDQEz2K0glTc4O0f2v9QASkvRSw5LyniqWBeXQqx2U2ECcFndt5mvZiLIE7vcejV
         RSAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WrnsW/0XKRFy0AyPwUMgzwrimhLY+1i2c+wg/ycL1gw=;
        b=oduLE0ym2QIyAvjsWryr7e4JluRZnEqcRpiCFKvKjAASRlSVbhMmkwUVaqnhU5iR2F
         qxcUAWbgxJrl8pdYLmvijWoYEOb+sBydggRHBR6gTn7509NT1cX3qmrTu+Pwu5uQU8Xw
         qlCa/kQKjwvlGWhpvaUgC/ROsh5RCszSiT1dd2OAzsghkK+e1IdyC6xiPkw47QhoyH3P
         XXS9AYB5Zj8dWGly/gcIv91RWWa6sPyZAAyn4uwkKFqb5GL3rilJ89FovKqyXHCdPUIm
         jwwSKVR6bcZJVcEULeFYYKTLSrzmn8+B+6JvrirtDxFVEl361oBkl7tTy2auGV982m9v
         ntGg==
X-Gm-Message-State: AOAM530aNOFznTv4UsOPq/awYrRGir1HhoGOPdd1AUK8+xAOjBwCVy5+
	6vaCnM191JIWjuZed7mOnKWfSVAkq7ne7w==
X-Google-Smtp-Source: 
 ABdhPJwLQgobhmnXe1uUupA+s6OfTry9DpAuQ4CBFptW92mM2DrDb1NLf2BT9t9zxWQNualcxQTA7g==
X-Received: by 2002:a17:902:6f10:: with SMTP id
 w16mr10985949plk.142.1643918527391;
        Thu, 03 Feb 2022 12:02:07 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::fb6e])
        by smtp.gmail.com with ESMTPSA id
 ck21sm10235963pjb.51.2022.02.03.12.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 12:02:06 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] meta: Remove libsegfault and catchsegv
Date: Thu,  3 Feb 2022 12:02:03 -0800
Message-Id: <20220203200203.3703888-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220203200203.3703888-1-raj.khem@gmail.com>
References: <20220203200203.3703888-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Feb 2022 20:02:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161316

Glibc has dropped them starting with 2.35 see [1]

[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=65ccd641bacea33be23d51da737c2de7543d0f5e

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tclibc-glibc.inc | 2 +-
 meta/recipes-core/glibc/glibc-package.inc | 5 +----
 meta/recipes-core/musl/musl_git.bb        | 2 +-
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta/conf/distro/include/tclibc-glibc.inc b/meta/conf/distro/include/tclibc-glibc.inc
index 32464909972..f4855dce111 100644
--- a/meta/conf/distro/include/tclibc-glibc.inc
+++ b/meta/conf/distro/include/tclibc-glibc.inc
@@ -16,7 +16,7 @@ PREFERRED_PROVIDER_virtual/libc-locale ?= "glibc-locale"
 
 CXXFLAGS += "-fvisibility-inlines-hidden"
 
-LIBC_DEPENDENCIES = "libsegfault \
+LIBC_DEPENDENCIES = "\
 		     glibc \
 		     glibc-dbg \
 		     glibc-dev \
diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index d854d918594..90dec6735f8 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -1,6 +1,6 @@
 INHIBIT_SYSROOT_STRIP = "1"
 
-PACKAGES = "${PN}-dbg catchsegv sln nscd ldconfig ldd tzcode glibc-thread-db ${PN}-pic libmemusage malloc-debug libnss-db libsegfault ${PN}-pcprofile libsotruss ${PN} ${PN}-utils glibc-extra-nss ${PN}-dev ${PN}-staticdev ${PN}-doc ${PN}-src"
+PACKAGES = "${PN}-dbg sln nscd ldconfig ldd tzcode glibc-thread-db ${PN}-pic libmemusage malloc-debug libnss-db ${PN}-pcprofile libsotruss ${PN} ${PN}-utils glibc-extra-nss ${PN}-dev ${PN}-staticdev ${PN}-doc ${PN}-src"
 
 # The ld.so in this glibc supports the GNU_HASH
 RPROVIDES:${PN} = "eglibc rtld(GNU_HASH)"
@@ -29,7 +29,6 @@ FILES:${PN} = "${libc_baselibs} ${bindir}/ld.so ${libexecdir}/* ${sysconfdir}/ld
 RRECOMMENDS:${PN} = "${@bb.utils.contains('DISTRO_FEATURES', 'ldconfig', '${MLPREFIX}ldconfig', '', d)}"
 FILES:ldconfig = "${base_sbindir}/ldconfig"
 FILES:ldd = "${bindir}/ldd"
-FILES:libsegfault = "${base_libdir}/libSegFault*"
 FILES:libmemusage = "${base_libdir}/libmemusage.so"
 FILES:malloc-debug = "${base_libdir}/libc_malloc_debug.so.0"
 FILES:libnss-db = "${base_libdir}/libnss_db.so.* ${base_libdir}/libnss_db-*.so ${localstatedir}/db/Makefile ${localstatedir}/db/makedbs.sh"
@@ -47,8 +46,6 @@ FILES:nscd = "${sbindir}/nscd* ${sysconfdir}/init.d/nscd ${systemd_system_unitdi
 FILES:${PN}-mtrace = "${bindir}/mtrace"
 FILES:tzcode = "${bindir}/tzselect ${sbindir}/zic ${bindir}/zdump"
 FILES:${PN}-utils = "${bindir}/* ${sbindir}/*"
-FILES:catchsegv = "${bindir}/catchsegv"
-RDEPENDS:catchsegv = "libsegfault"
 FILES:${PN}-pcprofile = "${base_libdir}/libpcprofile.so"
 FILES:glibc-thread-db = "${base_libdir}/libthread_db.so.* ${base_libdir}/libthread_db-*.so"
 RPROVIDES:${PN}-dev += "libc-dev"
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 34f4c1e98d6..1e33ad5317b 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -78,7 +78,7 @@ FILES:${PN}-dev =+ "${libdir}/libcrypt.a ${libdir}/libdl.a ${libdir}/libm.a \
 
 RDEPENDS:${PN}-dev += "linux-libc-headers-dev bsd-headers-dev libssp-nonshared-staticdev"
 RPROVIDES:${PN}-dev += "libc-dev virtual-libc-dev"
-RPROVIDES:${PN} += "ldd libsegfault rtld(GNU_HASH)"
+RPROVIDES:${PN} += "ldd rtld(GNU_HASH)"
 
 LEAD_SONAME = "libc.so"
 INSANE_SKIP:${PN}-dev = "staticdev"
-- 
2.35.1


