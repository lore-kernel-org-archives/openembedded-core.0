Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15C09C7EE24
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 17:23:54 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.39294.1683653032747905583
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 May 2023 10:23:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=FKWqpR/J;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-965ac4dd11bso1220673566b.2
        for <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 10:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683653031; x=1686245031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tu0akmkggmQjVuKzvxKHQ39ItkrZb9I0nG2h/1+wCxI=;
        b=FKWqpR/J9NkVsuUcbSqiNKEciWXwinfI/fEgAUENzT0+Mq8SvgctujShFYRkYE67NJ
         J/M5G2EQOvrVF9azGcfhwsCaRBNA9CyBLqiEhiJ+u8652I1WcvF2DlFEgDEkX3nzrdgE
         EjNmG1wiFMAc2nkoY/Cd54sGOtDVuniMfWCv+6REGjp9yMO3p7nu9k8zbL/6jpeRp3Yw
         CFL1WyLuyXTJZjiuPsgupg3vln8l/6BZ0VVDstcGCA6th9SRspax02sg25orvAKjuvMC
         L1lZSIiMPsiAOzvRyty6V3VfwvH+R+t/J4Mk9dPseT1af7YOKn7XA4vqHHEYh3iJe6XX
         FmHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683653031; x=1686245031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tu0akmkggmQjVuKzvxKHQ39ItkrZb9I0nG2h/1+wCxI=;
        b=Agr96BjDvfsQ0079xyzvPP/uUfk5DZdB3YYrnId82WG5C4NOvxTuzllx1xDzrOl2CJ
         Nomg/BIC8l77daVuiA2GzNGtaQwx67Z50tN+NHac+BopNF2iUtDq1usnbUX0fafp14mz
         pcdd7pjsSl6s1wEj4VA4Jr6NqaGhmILABFsykEd+jRpyPdc6eFPBzbNoFZYjBb/05WMa
         wLc5BpZQGZWmhT3idHGCZ7hVfBU0+JmmDvK8uH+uNciqi7/qz5WcSN7hNvbjwj7pjvpR
         y9GiDmI/Sg9hNAZkEjC+hozNEyTddvaDJwxtJRXDwEToYKBvdOgCiB/Xv0yqsUdYYAOC
         KYbg==
X-Gm-Message-State: AC+VfDxU8kyL1eNjsWWYJr8AvMkZkykJI32Ecw4wgnR7CAmxU1jyejBV
	mZ37Nab58y3hIO2rNlycrufsKrcVBmk=
X-Google-Smtp-Source: ACHHUZ6+7T3xOUYFA3rdldE6heSkDSNebwoRfFsmdrvPZCWnNG6olBc1ZCKwVpu6ywa3aeI1i3ieDA==
X-Received: by 2002:a17:907:842:b0:94e:c8c:42ec with SMTP id ww2-20020a170907084200b0094e0c8c42ecmr12631313ejb.20.1683653030902;
        Tue, 09 May 2023 10:23:50 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id jz24-20020a17090775f800b0096347ef816dsm1578252ejc.64.2023.05.09.10.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 10:23:50 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/27] ppp: upgrade 2.4.9 -> 2.5.0
Date: Tue,  9 May 2023 19:23:22 +0200
Message-Id: <20230509172344.1516743-5-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230509172344.1516743-1-alex@linutronix.de>
References: <20230509172344.1516743-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 17:23:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181060

Convert the build from handcrafted makefiles to autotools;
this makes all custom tweaks in the recipe unnecessary, and
allows removing all patches.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...1-ppp-fix-build-against-5.15-headers.patch | 36 --------------
 .../ppp/ppp/CVE-2022-4603.patch               | 48 -------------------
 .../ppp/ppp/makefix.patch                     | 40 ----------------
 .../ppp/{ppp_2.4.9.bb => ppp_2.5.0.bb}        | 31 ++----------
 4 files changed, 3 insertions(+), 152 deletions(-)
 delete mode 100644 meta/recipes-connectivity/ppp/ppp/0001-ppp-fix-build-against-5.15-headers.patch
 delete mode 100644 meta/recipes-connectivity/ppp/ppp/CVE-2022-4603.patch
 delete mode 100644 meta/recipes-connectivity/ppp/ppp/makefix.patch
 rename meta/recipes-connectivity/ppp/{ppp_2.4.9.bb => ppp_2.5.0.bb} (77%)

diff --git a/meta/recipes-connectivity/ppp/ppp/0001-ppp-fix-build-against-5.15-headers.patch b/meta/recipes-connectivity/ppp/ppp/0001-ppp-fix-build-against-5.15-headers.patch
deleted file mode 100644
index c91246dbf5c..00000000000
--- a/meta/recipes-connectivity/ppp/ppp/0001-ppp-fix-build-against-5.15-headers.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From aba3273273e826c6dc90f197ca9a3e800e826891 Mon Sep 17 00:00:00 2001
-From: Bruce Ashfield <bruce.ashfield@gmail.com>
-Date: Fri, 5 Nov 2021 12:41:35 -0400
-Subject: [PATCH] ppp: fix build against 5.15 headers
-
-The 5.15 kernel has removed ipx support, along with the userspace
-visible header.
-
-This support wasn't used previously (as it hasn't been very well
-maintained in the kernel for several years), so we can simply
-disable it in our build and wait for upstream to do a release that
-drops the support.
-
-Upstream-Status: Inappropriate [OE-specific configuration/headers]
-
-Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
----
- pppd/Makefile.linux | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/pppd/Makefile.linux b/pppd/Makefile.linux
-index 22837c5..23b9b22 100644
---- a/pppd/Makefile.linux
-+++ b/pppd/Makefile.linux
-@@ -91,7 +91,7 @@ MAXOCTETS=y
- 
- INCLUDE_DIRS= -I../include
- 
--COMPILE_FLAGS= -DHAVE_PATHS_H -DIPX_CHANGE -DHAVE_MMAP -pipe
-+COMPILE_FLAGS= -DHAVE_PATHS_H -DHAVE_MMAP -pipe
- 
- CFLAGS= $(COPTS) $(COMPILE_FLAGS) $(INCLUDE_DIRS) '-DDESTDIR="@DESTDIR@"'
- 
--- 
-2.25.1
-
diff --git a/meta/recipes-connectivity/ppp/ppp/CVE-2022-4603.patch b/meta/recipes-connectivity/ppp/ppp/CVE-2022-4603.patch
deleted file mode 100644
index 4325b1d6b02..00000000000
--- a/meta/recipes-connectivity/ppp/ppp/CVE-2022-4603.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From a75fb7b198eed50d769c80c36629f38346882cbf Mon Sep 17 00:00:00 2001
-From: Paul Mackerras <paulus@ozlabs.org>
-Date: Thu, 4 Aug 2022 12:23:08 +1000
-Subject: [PATCH] pppdump: Avoid out-of-range access to packet buffer
-
-This fixes a potential vulnerability where data is written to spkt.buf
-and rpkt.buf without a check on the array index.  To fix this, we
-check the array index (pkt->cnt) before storing the byte or
-incrementing the count.  This also means we no longer have a potential
-signed integer overflow on the increment of pkt->cnt.
-
-Fortunately, pppdump is not used in the normal process of setting up a
-PPP connection, is not installed setuid-root, and is not invoked
-automatically in any scenario that I am aware of.
-
-Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- pppdump/pppdump.c | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/pppdump/pppdump.c b/pppdump/pppdump.c
-index 2b815fc9..b85a8627 100644
---- a/pppdump/pppdump.c
-+++ b/pppdump/pppdump.c
-@@ -297,6 +297,10 @@ dumpppp(f)
- 			    printf("%s aborted packet:\n     ", dir);
- 			    q = "    ";
- 			}
-+			if (pkt->cnt >= sizeof(pkt->buf)) {
-+			    printf("%s over-long packet truncated:\n     ", dir);
-+			    q = "    ";
-+			}
- 			nb = pkt->cnt;
- 			p = pkt->buf;
- 			pkt->cnt = 0;
-@@ -400,7 +404,8 @@ dumpppp(f)
- 			c ^= 0x20;
- 			pkt->esc = 0;
- 		    }
--		    pkt->buf[pkt->cnt++] = c;
-+		    if (pkt->cnt < sizeof(pkt->buf))
-+			pkt->buf[pkt->cnt++] = c;
- 		    break;
- 		}
- 	    }
diff --git a/meta/recipes-connectivity/ppp/ppp/makefix.patch b/meta/recipes-connectivity/ppp/ppp/makefix.patch
deleted file mode 100644
index fce068cae02..00000000000
--- a/meta/recipes-connectivity/ppp/ppp/makefix.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-We were seeing reproducibility issues where one host would use the internal 
-logwtmp wrapper, another would use the one in libutil. The issue was that in
-some cases the "\#include" was making it to CC, in others, "#include". The
-issue seems to be related to shell escaping.
-
-The root cause looks to be:
-http://git.savannah.gnu.org/cgit/make.git/commit/?id=c6966b323811c37acedff05b576b907b06aea5f4
-
-Instead of relying on shell quoting, use make to indirect the variable
-and avoid the problem.
-
-See https://github.com/paulusmack/ppp/issues/233
-
-Upstream-Status: Backport [https://github.com/paulusmack/ppp/commit/b4430f7092ececdff2504d5f3393a4c6528c3686]
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Index: ppp-2.4.9/pppd/Makefile.linux
-===================================================================
---- ppp-2.4.9.orig/pppd/Makefile.linux
-+++ ppp-2.4.9/pppd/Makefile.linux
-@@ -80,7 +80,8 @@ PLUGIN=y
- #USE_SRP=y
- 
- # Use libutil; test if logwtmp is declared in <utmp.h> to detect
--ifeq ($(shell echo '\#include <utmp.h>' | $(CC) -E - 2>/dev/null | grep -q logwtmp && echo yes),yes)
-+UTMPHEADER = "\#include <utmp.h>"
-+ifeq ($(shell echo $(UTMPHEADER) | $(CC) -E - 2>/dev/null | grep -q logwtmp && echo yes),yes)
- USE_LIBUTIL=y
- endif
- 
-@@ -143,7 +144,8 @@ CFLAGS   += -DHAS_SHADOW
- #LIBS     += -lshadow $(LIBS)
- endif
- 
--ifeq ($(shell echo '\#include <crypt.h>' | $(CC) -E - >/dev/null 2>&1 && echo yes),yes)
-+CRYPTHEADER = "\#include <crypt.h>"
-+ifeq ($(shell echo $(CRYPTHEADER) | $(CC) -E - >/dev/null 2>&1 && echo yes),yes)
- CFLAGS  += -DHAVE_CRYPT_H=1
- LIBS	+= -lcrypt
- endif
diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.9.bb b/meta/recipes-connectivity/ppp/ppp_2.5.0.bb
similarity index 77%
rename from meta/recipes-connectivity/ppp/ppp_2.4.9.bb
rename to meta/recipes-connectivity/ppp/ppp_2.5.0.bb
index 7e3ae43b58e..4b052f8ed96 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.4.9.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.5.0.bb
@@ -12,7 +12,6 @@ LIC_FILES_CHKSUM = "file://pppd/ccp.c;beginline=1;endline=29;md5=e2c43fe6e81ff77
                     file://chat/chat.c;beginline=1;endline=15;md5=0d374b8545ee5c62d7aff1acbd38add2"
 
 SRC_URI = "https://download.samba.org/pub/${BPN}/${BP}.tar.gz \
-           file://makefix.patch \
            file://pon \
            file://poff \
            file://init \
@@ -24,31 +23,15 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/${BP}.tar.gz \
            file://ppp_on_boot \
            file://provider \
            file://ppp@.service \
-           file://0001-ppp-fix-build-against-5.15-headers.patch \
-           file://CVE-2022-4603.patch \
            "
 
-SRC_URI[sha256sum] = "f938b35eccde533ea800b15a7445b2f1137da7f88e32a16898d02dee8adc058d"
+SRC_URI[sha256sum] = "5cae0e8075f8a1755f16ca290eb44e6b3545d3f292af4da65ecffe897de636ff"
 
-inherit autotools-brokensep systemd
+inherit autotools systemd
 
-TARGET_CC_ARCH += " ${LDFLAGS}"
-EXTRA_OEMAKE = "CC='${CC}' STRIPPROG=${STRIP} MANDIR=${D}${datadir}/man/man8 INCDIR=${D}${includedir} LIBDIR=${D}${libdir}/pppd/${PV} BINDIR=${D}${sbindir}"
-EXTRA_OECONF = "--disable-strip"
-
-# Package Makefile computes CFLAGS, referencing COPTS.
-# Typically hard-coded to '-O2 -g' in the Makefile's.
-#
-EXTRA_OEMAKE += ' COPTS="${CFLAGS} -I${STAGING_INCDIR}/openssl -I${S}/include"'
-
-EXTRA_OECONF:append:libc-musl = " --disable-ipxcp"
-
-do_configure () {
-	oe_runconf
-}
+EXTRA_OECONF += "--with-openssl=${STAGING_EXECPREFIXDIR}"
 
 do_install:append () {
-	make install-etcppp ETCDIR=${D}/${sysconfdir}/ppp
 	mkdir -p ${D}${bindir}/ ${D}${sysconfdir}/init.d
 	mkdir -p ${D}${sysconfdir}/ppp/ip-up.d/
 	mkdir -p ${D}${sysconfdir}/ppp/ip-down.d/
@@ -68,12 +51,6 @@ do_install:append () {
 	install -m 0644 ${WORKDIR}/ppp@.service ${D}${systemd_system_unitdir}
 	sed -i -e 's,@SBINDIR@,${sbindir},g' \
 	       ${D}${systemd_system_unitdir}/ppp@.service
-	rm -rf ${D}/${mandir}/man8/man8
-	chmod u+s ${D}${sbindir}/pppd
-}
-
-do_install:append:libc-musl () {
-	install -Dm 0644 ${S}/include/net/ppp_defs.h ${D}${includedir}/net/ppp_defs.h
 }
 
 CONFFILES:${PN} = "${sysconfdir}/ppp/pap-secrets ${sysconfdir}/ppp/chap-secrets ${sysconfdir}/ppp/options"
@@ -96,5 +73,3 @@ SUMMARY:${PN}-password = "Plugin for PPP to get passwords via a pipe"
 SUMMARY:${PN}-l2tp     = "Plugin for PPP for l2tp support"
 SUMMARY:${PN}-tools    = "Additional tools for the PPP package"
 
-# Ignore compatibility symlink rp-pppoe.so->pppoe.so
-INSANE_SKIP:${PN}-oe += "dev-so"
-- 
2.30.2


