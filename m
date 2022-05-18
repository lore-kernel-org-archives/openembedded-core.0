Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5A74C43217
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 10:58:55 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web08.3405.1652871533876738192
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:58:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Nk30SJ0h;
 spf=pass (domain: gmail.com, ip: 209.85.218.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id z2so3056964ejj.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ePHila+e450ZlzuXH6R9vYvX3ll89ejEvebnLt7ZGR0=;
        b=Nk30SJ0hcg2lR4CtsbQty/bzkOXTgyl0XiCvfLwKOOvl6psNWe9b0HRJ68KbyN49Ch
         9joTVU/smvaFCMnNqhq6BnDqY2QT8b3zS0aN2GQsk7RXO1Z4ClXppRqqrJ7XfiELINHf
         f+2XBRdufmBNKwe25HawjnizZPUZ3NhvSoHtw9QiysL/d0WShGWzjZp/v8UUfj06klmO
         Vja7dvmhIVT2ZpawrJbiqnyROYgLIeTbmLSaqR/+ZpTYUE5kt3ScO0JrqVDmt6Aiz0gb
         IrPNtF/sGWe8pCLvyIzUD9r+6w5+5qNehm6UzYNolHdrGQLoiFzOs1pT5teJMrAc32jB
         VBRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ePHila+e450ZlzuXH6R9vYvX3ll89ejEvebnLt7ZGR0=;
        b=X/VWYcnwmZT4u8DHOh5+gzcMqNqRpKpIOlNUu/HUfpldSUp/e5kHTGn+TboSpkbV5Q
         hzgsYUIYgDN7utAbqbiwT1KYhknH/+OLX9EE34PQQPCTVwUU8BDsdHz3c4EfSKmkcTdS
         urrrfBkA4pFx1TzevME3/276zjDV04KRGulOWAJ775sjqVW8EI3Il6F3yYOA+Gmsq6oP
         t8LNw//NOWGeGsGtaIXowcL3dYknxltvGJ3K8BDwQjR5Y3rlOvhPV/hrNVMLluBx8aML
         zeuIDI3/j3QkmH/n7eYMJlObRvVPZrx0maYE3wSvnlR5D7bMCx/XePE65WJXM+SaBFMu
         Bo3Q==
X-Gm-Message-State: AOAM530zdy+e8Zf0RYQhbjp8ISsO0Km9e11tf12CUym638Jpwy8piOgO
	wfDVCpHtBn60zytVegjaJyoby/Z6VWk=
X-Google-Smtp-Source: 
 ABdhPJy7T1APm1YxpSLysyYweJNyFIWwiVl9YHZlrRgqwMkemCGyH+8ESwQ2R4ZkbkPd3hnFUn1iLQ==
X-Received: by 2002:a17:907:9720:b0:6f4:31d4:925f with SMTP id
 jg32-20020a170907972000b006f431d4925fmr23934238ejc.658.1652871532404;
        Wed, 18 May 2022 03:58:52 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 qs24-20020a170906459800b006f3ef214da9sm861524ejc.15.2022.05.18.03.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 03:58:51 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/49] iptables: upgrade 1.8.7 -> 1.8.8
Date: Wed, 18 May 2022 12:57:59 +0200
Message-Id: <20220518105843.3299331-5-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220518105843.3299331-1-alex@linutronix.de>
References: <20220518105843.3299331-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 10:58:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165802

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ed.h-add-missing-sys.types.h-include.patch | 30 +++++++++++++++++++
 .../iptables/iptables/format-security.patch   | 30 +++++++++++++++++++
 .../{iptables_1.8.7.bb => iptables_1.8.8.bb}  | 11 +++++--
 3 files changed, 69 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/iptables/iptables/0001-iptables-xshared.h-add-missing-sys.types.h-include.patch
 create mode 100644 meta/recipes-extended/iptables/iptables/format-security.patch
 rename meta/recipes-extended/iptables/{iptables_1.8.7.bb => iptables_1.8.8.bb} (90%)

diff --git a/meta/recipes-extended/iptables/iptables/0001-iptables-xshared.h-add-missing-sys.types.h-include.patch b/meta/recipes-extended/iptables/iptables/0001-iptables-xshared.h-add-missing-sys.types.h-include.patch
new file mode 100644
index 0000000000..17dd032434
--- /dev/null
+++ b/meta/recipes-extended/iptables/iptables/0001-iptables-xshared.h-add-missing-sys.types.h-include.patch
@@ -0,0 +1,30 @@
+From 796b8f6fc1e584c27c42ba302f623fd1c5aa0667 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Tue, 17 May 2022 10:56:59 +0200
+Subject: [PATCH] iptables/xshared.h: add missing sys.types.h include
+
+This resolves the build error under musl:
+
+| ../../../../../../../workspace/sources/iptables/iptables/xshared.h:83:56: error: unknown type name 'u_int16_t'; did you mean 'uint16_t'?
+|    83 | set_option(unsigned int *options, unsigned int option, u_int16_t *invflg,
+|       |                                                        ^~~~~~~~~
+|       |                                                        uint16_t
+
+Upstream-Status: Submitted [via email to phil@nwl.cc]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ iptables/xshared.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/iptables/xshared.h b/iptables/xshared.h
+index 14568bb..73b1017 100644
+--- a/iptables/xshared.h
++++ b/iptables/xshared.h
+@@ -6,6 +6,7 @@
+ #include <stdint.h>
+ #include <netinet/in.h>
+ #include <net/if.h>
++#include <sys/types.h>
+ #include <linux/netfilter_arp/arp_tables.h>
+ #include <linux/netfilter_ipv4/ip_tables.h>
+ #include <linux/netfilter_ipv6/ip6_tables.h>
diff --git a/meta/recipes-extended/iptables/iptables/format-security.patch b/meta/recipes-extended/iptables/iptables/format-security.patch
new file mode 100644
index 0000000000..be1e077b49
--- /dev/null
+++ b/meta/recipes-extended/iptables/iptables/format-security.patch
@@ -0,0 +1,30 @@
+From b72eb12ea5a61df0655ad99d5048994e916be83a Mon Sep 17 00:00:00 2001
+From: Phil Sutter <phil@nwl.cc>
+Date: Fri, 13 May 2022 16:51:58 +0200
+Subject: xshared: Fix build for -Werror=format-security
+
+Gcc complains about the omitted format string.
+
+Signed-off-by: Phil Sutter <phil@nwl.cc>
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ iptables/xshared.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/iptables/xshared.c b/iptables/xshared.c
+index fae5ddd5..a8512d38 100644
+--- a/iptables/xshared.c
++++ b/iptables/xshared.c
+@@ -1307,7 +1307,7 @@ static void check_empty_interface(struct xtables_args *args, const char *arg)
+ 		return;
+ 
+ 	if (args->family != NFPROTO_ARP)
+-		xtables_error(PARAMETER_PROBLEM, msg);
++		xtables_error(PARAMETER_PROBLEM, "%s", msg);
+ 
+ 	fprintf(stderr, "%s", msg);
+ }
+-- 
+cgit v1.2.3
+
diff --git a/meta/recipes-extended/iptables/iptables_1.8.7.bb b/meta/recipes-extended/iptables/iptables_1.8.8.bb
similarity index 90%
rename from meta/recipes-extended/iptables/iptables_1.8.7.bb
rename to meta/recipes-extended/iptables/iptables_1.8.8.bb
index 3b41882841..54d027220b 100644
--- a/meta/recipes-extended/iptables/iptables_1.8.7.bb
+++ b/meta/recipes-extended/iptables/iptables_1.8.8.bb
@@ -12,12 +12,14 @@ SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2 \
            file://0001-configure-Add-option-to-enable-disable-libnfnetlink.patch \
            file://0001-Makefile.am-do-not-install-etc-ethertypes.patch \
            file://0002-configure.ac-only-check-conntrack-when-libnfnetlink-enabled.patch \
+           file://format-security.patch \
            file://iptables.service \
            file://iptables.rules \
            file://ip6tables.service \
            file://ip6tables.rules \
+           file://0001-iptables-xshared.h-add-missing-sys.types.h-include.patch \
            "
-SRC_URI[sha256sum] = "c109c96bb04998cd44156622d36f8e04b140701ec60531a10668cfdff5e8d8f0"
+SRC_URI[sha256sum] = "71c75889dc710676631553eb1511da0177bbaaf1b551265b912d236c3f51859f"
 
 SYSTEMD_SERVICE:${PN} = "\
     iptables.service \
@@ -28,6 +30,8 @@ inherit autotools pkgconfig systemd
 
 EXTRA_OECONF = "--with-kernel=${STAGING_INCDIR}"
 
+CFLAGS:append:libc-musl = " -D__UAPI_DEF_ETHHDR=0"
+
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 
@@ -41,6 +45,9 @@ do_configure:prepend() {
     # Remove some libtool m4 files
     # Keep ax_check_linker_flags.m4 which belongs to autoconf-archive.
     rm -f libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltversion.m4
+
+    # Copy a header to fix out of tree builds
+    cp -f ${S}/libiptc/linux_list.h ${S}/include/libiptc/
 }
 
 IPTABLES_RULES_DIR ?= "${sysconfdir}/${BPN}"
@@ -108,7 +115,7 @@ RDEPENDS:${PN}-apply = "${PN} bash"
 
 # Include the symlinks as well in respective packages
 FILES:${PN}-module-xt-conntrack += "${libdir}/xtables/libxt_state.so"
-FILES:${PN}-module-xt-ct += "${libdir}/xtables/libxt_NOTRACK.so"
+FILES:${PN}-module-xt-ct += "${libdir}/xtables/libxt_NOTRACK.so ${libdir}/xtables/libxt_REDIRECT.so"
 
 ALLOW_EMPTY:${PN}-modules = "1"
 
-- 
2.30.2


