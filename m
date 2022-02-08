Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B709C433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 22:53:16 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web12.19031.1644360795658480472
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 14:53:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Bei2/QUe;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id
 g15-20020a17090a67cf00b001b7d5b6bedaso434045pjm.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 14:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aopk71Tfvu+RD28yKEr7Tj1ggZEq8JXFFRjUbcSiVY0=;
        b=Bei2/QUek3DH3RPJNhH+ZBjo3pADyn6AVHYPE5/j5D5e1f6WrMZQicWBXOPfOl4TL7
         hIhVm5ewCbV3buRTyMvfmJKL0T010t62vQz9uj/NHnPB2Ns2RpZfqSoFQq0tgTn9ERhH
         KUTS4dl6cnIbiyOjlB5RZF1ReDW/xkhZmF/JCG5zjS5+PUq/bTvBzCFyitkKWDvL8d9a
         Scbu/G2TaKzKXebP0xK30lZ+Sg5T6a/SzKlLoIQ8fHgrbiqFhI46o5hkSbIDC2j0YiM+
         9j8TYTJCdC/JXMe7kKvbyEvmmu+QZwqy2Cgz+owX36+OQQ+T68L1Rqx95mLxb+aq0Sv6
         rJ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aopk71Tfvu+RD28yKEr7Tj1ggZEq8JXFFRjUbcSiVY0=;
        b=l3ceXDbqVeqcTcJjU4DiuKsJk0cHmNEcOWWdH86f0j2L6SN3TKo+IYRp5qmzjFJt/4
         qbCz1slSj9OoALMxiiWDv2fJOfmIa6mw1JEjfT9JfBaUqXzVjs69raJ343iHIe61BS6J
         CjJvShJebxoFVPT2u9yzs3WTNtnGpNobl1wgpXwPasZCnTw+kNForq9KZ4BTUAucwMJh
         pKQUjL5WFh0ywgcHmQ9lFhvZICF9oyNLuJVN34co9lH0ZTckeafbx2zu2myyCMMBDQV8
         HZ2TOoF98+/mycZW/gjtyeUoV8DwWzh5pI9jACPiwUDs52LD0aqGBavrlPYjLf8gXUYL
         ls9Q==
X-Gm-Message-State: AOAM531XJ/5eOzovGMbFonRfIFx6TWDX33WXQXpR1qJC5jN3+3taYT1g
	Ve6N+ktghvZrnDwgComzc+A7/69MFb8ZxA==
X-Google-Smtp-Source: 
 ABdhPJxasPCIYbTiYS01eMHktL9pZ1oaMzM6SJ3Wfqh0nxYNMQONSyUd0xB5gu1tBbyaNniKplBRbQ==
X-Received: by 2002:a17:90a:2e03:: with SMTP id
 q3mr224887pjd.184.1644360794772;
        Tue, 08 Feb 2022 14:53:14 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::fb6e])
        by smtp.gmail.com with ESMTPSA id
 nm15sm1781228pjb.17.2022.02.08.14.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 14:53:14 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH v3 2/3] meta: Remove libsegfault and catchsegv
Date: Tue,  8 Feb 2022 14:53:09 -0800
Message-Id: <20220208225310.1685131-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220208225310.1685131-1-raj.khem@gmail.com>
References: <20220208225310.1685131-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Feb 2022 22:53:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161530

Glibc has dropped them starting with 2.35 see [1]

[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=65ccd641bacea33be23d51da737c2de7543d0f5e

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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
index ca9d6e0531e..b8095f25158 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -1,6 +1,6 @@
 INHIBIT_SYSROOT_STRIP = "1"
 
-PACKAGES = "${PN}-dbg catchsegv sln nscd ldconfig ldd ldso tzcode glibc-thread-db ${PN}-pic libmemusage malloc-debug libnss-db libsegfault ${PN}-pcprofile libsotruss ${PN} ${PN}-utils glibc-extra-nss ${PN}-dev ${PN}-staticdev ${PN}-doc ${PN}-src"
+PACKAGES = "${PN}-dbg sln nscd ldconfig ldd ldso tzcode glibc-thread-db ${PN}-pic libmemusage malloc-debug libnss-db ${PN}-pcprofile libsotruss ${PN} ${PN}-utils glibc-extra-nss ${PN}-dev ${PN}-staticdev ${PN}-doc ${PN}-src"
 
 # The ld.so in this glibc supports the GNU_HASH
 RPROVIDES:${PN} = "eglibc rtld(GNU_HASH)"
@@ -29,7 +29,6 @@ FILES:${PN} = "${libc_baselibs} ${libexecdir}/* ${sysconfdir}/ld.so.conf"
 RRECOMMENDS:${PN} = "${@bb.utils.contains('DISTRO_FEATURES', 'ldconfig', '${MLPREFIX}ldconfig', '', d)}"
 FILES:ldconfig = "${base_sbindir}/ldconfig"
 FILES:ldd = "${bindir}/ldd"
-FILES:libsegfault = "${base_libdir}/libSegFault*"
 FILES:ldso = "${bindir}/ld.so"
 FILES:libmemusage = "${base_libdir}/libmemusage.so"
 FILES:malloc-debug = "${base_libdir}/libc_malloc_debug.so.0"
@@ -48,8 +47,6 @@ FILES:nscd = "${sbindir}/nscd* ${sysconfdir}/init.d/nscd ${systemd_system_unitdi
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


