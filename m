Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1693C6FD1F
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 15:20:11 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.16124.1678375210689528935
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 07:20:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lRJJoNgH;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id m25-20020a7bcb99000000b003e7842b75f2so1459557wmi.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 07:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678375209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zQlu1jbTyY0Uz5bH/HffKVnluoif8pFSNENmWksU65c=;
        b=lRJJoNgHAUkzskkK0/w/wgDtVCQWgaXV5Ufi+wIxmSBK4a0v6cDaElrfTBVmeSG7AH
         dR6ZQtUkz2Sc0xBtA/Um3JqND+steOEOQDKVBXh927k4qhChDAnf1f/CWb1WBC1T3WHD
         JlYMvBwfmUrgfOtuSeBx7GuFFmkfABi3d6mKWmWKt+ssF3rwUBHAQ67SFBM14KnkrNWk
         lLxfjEHmfEx/63zOend76eqbHTemhMRqNjsf0cJWCsa4pal4JtW/nX0yf94hrhERTb7D
         5YVh/V2hvZGuKPMzH29WeKCQ+RfNdBO5ylIBkHKwUQwwUZd4iSNfqq+3UEWLctax/wrb
         RvzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678375209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zQlu1jbTyY0Uz5bH/HffKVnluoif8pFSNENmWksU65c=;
        b=c0pyOyl+4TBXEPGtO3nC2W+UMQG4jLKFJ0LHTBtWDcfAwWUhvCcJcv8vtBIbBR6Bo6
         geEsKKJzEWHQbbvX9LdknKRp4GZdWsSKy3BWxKM/uUwV/Z/s9VRnJTSaecke87N0BQhF
         QtMeOwnQJjH81Sqo7hfSp2w10N0wS1sRSd8RCHMHvIAgYsCZZ/gfjTd/qCnAEGPqhag8
         tme2eqVtC8Zo/p7cjwzpBfhFayERu7/r0kIII35l0wBRZJuywS/PORTGwAwTVu186iXn
         9g9uy2q3uMKz++w3yXse3R2BTVS4a6hdgi7sW98yDuHWI3gRMqwfuIZ/hZ9E1mmmoQJi
         WX7A==
X-Gm-Message-State: AO0yUKWbE81beAI07dnASDdTAC0ius6lcaWFYyF+m76i3jEBGc32iU37
	FOK4m2KuBg0sFy0vIW7xCRKiemmuheE=
X-Google-Smtp-Source: AK7set+be2K/1Ki0MiDjckQ9/l0nMTxh8ctzLkO0qmWKZ/6htX58qBbvZZ9XVvmlLfi0SKvlIeGeew==
X-Received: by 2002:a05:600c:348d:b0:3eb:9822:2907 with SMTP id a13-20020a05600c348d00b003eb98222907mr16651181wmq.4.1678375209154;
        Thu, 09 Mar 2023 07:20:09 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s10-20020adfea8a000000b002c7e1a39adcsm18314521wrm.23.2023.03.09.07.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 07:20:08 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 09/26] iptables: update 1.8.8 -> 1.8.9
Date: Thu,  9 Mar 2023 16:19:41 +0100
Message-Id: <20230309151958.3619193-9-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230309151958.3619193-1-alex@linutronix.de>
References: <20230309151958.3619193-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 15:20:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178234

Replace one format string fixing patch with another format string fixing patch.
(one problem fixed upstream, another introduced)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ption-to-enable-disable-libnfnetlink.patch | 10 ++---
 ...d.h-add-missing-sys.types.h-include.patch} |  9 +++--
 ...le.am-do-not-install-etc-ethertypes.patch} | 17 +++++----
 ...-check-conntrack-when-libnfnetlink-.patch} | 10 ++---
 .../iptables/iptables/format-security.patch   | 37 ++++++++++---------
 .../{iptables_1.8.8.bb => iptables_1.8.9.bb}  | 16 ++++----
 6 files changed, 53 insertions(+), 46 deletions(-)
 rename meta/recipes-extended/iptables/iptables/{0001-iptables-xshared.h-add-missing-sys.types.h-include.patch => 0002-iptables-xshared.h-add-missing-sys.types.h-include.patch} (84%)
 rename meta/recipes-extended/iptables/iptables/{0001-Makefile.am-do-not-install-etc-ethertypes.patch => 0003-Makefile.am-do-not-install-etc-ethertypes.patch} (71%)
 rename meta/recipes-extended/iptables/iptables/{0002-configure.ac-only-check-conntrack-when-libnfnetlink-enabled.patch => 0004-configure.ac-only-check-conntrack-when-libnfnetlink-.patch} (89%)
 rename meta/recipes-extended/iptables/{iptables_1.8.8.bb => iptables_1.8.9.bb} (90%)

diff --git a/meta/recipes-extended/iptables/iptables/0001-configure-Add-option-to-enable-disable-libnfnetlink.patch b/meta/recipes-extended/iptables/iptables/0001-configure-Add-option-to-enable-disable-libnfnetlink.patch
index 03c36ccbc2..0c2c97cdc8 100644
--- a/meta/recipes-extended/iptables/iptables/0001-configure-Add-option-to-enable-disable-libnfnetlink.patch
+++ b/meta/recipes-extended/iptables/iptables/0001-configure-Add-option-to-enable-disable-libnfnetlink.patch
@@ -1,7 +1,7 @@
-From c46db7c2e1f63ec525835553587e70c635565310 Mon Sep 17 00:00:00 2001
+From 698ed332e2c592235d2b737c545ac25ad0970e15 Mon Sep 17 00:00:00 2001
 From: "Maxin B. John" <maxin.john@intel.com>
 Date: Tue, 21 Feb 2017 11:16:31 +0200
-Subject: [PATCH] configure: Add option to enable/disable libnfnetlink
+Subject: [PATCH 1/4] configure: Add option to enable/disable libnfnetlink
 
 This changes the configure behaviour from autodetecting
 for libnfnetlink to having an option to disable it explicitly
@@ -15,7 +15,7 @@ Signed-off-by: Maxin B. John <maxin.john@intel.com>
  1 file changed, 7 insertions(+), 3 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index eda7871..03ddc50 100644
+index bc2ed47b..e27745e5 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -63,6 +63,9 @@ AC_ARG_WITH([pkgconfigdir], AS_HELP_STRING([--with-pkgconfigdir=PATH],
@@ -28,7 +28,7 @@ index eda7871..03ddc50 100644
  AC_ARG_ENABLE([connlabel],
  	AS_HELP_STRING([--disable-connlabel],
  	[Do not build libnetfilter_conntrack]),
-@@ -115,9 +118,10 @@ if test "x$enable_bpfc" = "xyes" || test "x$enable_nfsynproxy" = "xyes"; then
+@@ -117,9 +120,10 @@ if test "x$enable_bpfc" = "xyes" || test "x$enable_nfsynproxy" = "xyes"; then
  	AC_CHECK_LIB(pcap, pcap_compile,, AC_MSG_ERROR(missing libpcap library required by bpf compiler or nfsynproxy tool))
  fi
  
@@ -43,5 +43,5 @@ index eda7871..03ddc50 100644
  if test "x$enable_nftables" = "xyes"; then
  	PKG_CHECK_MODULES([libmnl], [libmnl >= 1.0], [mnl=1], [mnl=0])
 -- 
-2.4.0
+2.30.2
 
diff --git a/meta/recipes-extended/iptables/iptables/0001-iptables-xshared.h-add-missing-sys.types.h-include.patch b/meta/recipes-extended/iptables/iptables/0002-iptables-xshared.h-add-missing-sys.types.h-include.patch
similarity index 84%
rename from meta/recipes-extended/iptables/iptables/0001-iptables-xshared.h-add-missing-sys.types.h-include.patch
rename to meta/recipes-extended/iptables/iptables/0002-iptables-xshared.h-add-missing-sys.types.h-include.patch
index 17dd032434..9621d46c09 100644
--- a/meta/recipes-extended/iptables/iptables/0001-iptables-xshared.h-add-missing-sys.types.h-include.patch
+++ b/meta/recipes-extended/iptables/iptables/0002-iptables-xshared.h-add-missing-sys.types.h-include.patch
@@ -1,7 +1,7 @@
-From 796b8f6fc1e584c27c42ba302f623fd1c5aa0667 Mon Sep 17 00:00:00 2001
+From d4699d2169fe2d91d0f1f4369d40d2e5f42b8877 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Tue, 17 May 2022 10:56:59 +0200
-Subject: [PATCH] iptables/xshared.h: add missing sys.types.h include
+Subject: [PATCH 2/4] iptables/xshared.h: add missing sys.types.h include
 
 This resolves the build error under musl:
 
@@ -17,7 +17,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 1 insertion(+)
 
 diff --git a/iptables/xshared.h b/iptables/xshared.h
-index 14568bb..73b1017 100644
+index 0ed9f3c2..b1413834 100644
 --- a/iptables/xshared.h
 +++ b/iptables/xshared.h
 @@ -6,6 +6,7 @@
@@ -28,3 +28,6 @@ index 14568bb..73b1017 100644
  #include <linux/netfilter_arp/arp_tables.h>
  #include <linux/netfilter_ipv4/ip_tables.h>
  #include <linux/netfilter_ipv6/ip6_tables.h>
+-- 
+2.30.2
+
diff --git a/meta/recipes-extended/iptables/iptables/0001-Makefile.am-do-not-install-etc-ethertypes.patch b/meta/recipes-extended/iptables/iptables/0003-Makefile.am-do-not-install-etc-ethertypes.patch
similarity index 71%
rename from meta/recipes-extended/iptables/iptables/0001-Makefile.am-do-not-install-etc-ethertypes.patch
rename to meta/recipes-extended/iptables/iptables/0003-Makefile.am-do-not-install-etc-ethertypes.patch
index aa51265822..cbc97572ec 100644
--- a/meta/recipes-extended/iptables/iptables/0001-Makefile.am-do-not-install-etc-ethertypes.patch
+++ b/meta/recipes-extended/iptables/iptables/0003-Makefile.am-do-not-install-etc-ethertypes.patch
@@ -1,7 +1,7 @@
-From a4ed9fc8da720585f853d2ca6ffd30e2fa4d1247 Mon Sep 17 00:00:00 2001
+From 28291b41bc3717f51e8d9d465f0100f1ca99dc26 Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <trevor.gamblin@windriver.com>
 Date: Wed, 9 Mar 2022 12:50:39 -0500
-Subject: [PATCH] Makefile.am: do not install /etc/ethertypes
+Subject: [PATCH 3/4] Makefile.am: do not install /etc/ethertypes
 
 The /etc/ethertypes is provided by netbase since 6.0[1].
 Do not instal the file in ebtables, otherwise there would be a conflict:
@@ -20,21 +20,22 @@ Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
 ---
- Makefile.am | 1 -
- 1 file changed, 1 deletion(-)
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index 799bf8b8..2eb1843f 100644
+index 451c3cb2..5125238c 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -18,7 +18,6 @@ SUBDIRS         += iptables
+@@ -20,7 +20,7 @@ EXTRA_DIST	= autogen.sh iptables-test.py xlate-test.py
  
  if ENABLE_NFTABLES
  confdir		= $(sysconfdir)
--dist_conf_DATA	= etc/ethertypes
+-dist_conf_DATA	= etc/ethertypes etc/xtables.conf
++dist_conf_DATA	= etc/xtables.conf
  endif
  
  .PHONY: tarball
 -- 
-2.35.1
+2.30.2
 
diff --git a/meta/recipes-extended/iptables/iptables/0002-configure.ac-only-check-conntrack-when-libnfnetlink-enabled.patch b/meta/recipes-extended/iptables/iptables/0004-configure.ac-only-check-conntrack-when-libnfnetlink-.patch
similarity index 89%
rename from meta/recipes-extended/iptables/iptables/0002-configure.ac-only-check-conntrack-when-libnfnetlink-enabled.patch
rename to meta/recipes-extended/iptables/iptables/0004-configure.ac-only-check-conntrack-when-libnfnetlink-.patch
index 7842c6408a..20c40c4039 100644
--- a/meta/recipes-extended/iptables/iptables/0002-configure.ac-only-check-conntrack-when-libnfnetlink-enabled.patch
+++ b/meta/recipes-extended/iptables/iptables/0004-configure.ac-only-check-conntrack-when-libnfnetlink-.patch
@@ -1,7 +1,7 @@
-From 26090b3dbcdf6a11e60535da949b726a6e86426d Mon Sep 17 00:00:00 2001
+From e7aa1dd2831f9bb5d0603c5e5027387ad7721b00 Mon Sep 17 00:00:00 2001
 From: "Maxin B. John" <maxin.john@intel.com>
 Date: Tue, 21 Feb 2017 11:49:07 +0200
-Subject: [PATCH] configure.ac:
+Subject: [PATCH 4/4] configure.ac:
  only-check-conntrack-when-libnfnetlink-enabled.patch
 
 Package libnetfilter-conntrack depends on package libnfnetlink. iptables
@@ -28,10 +28,10 @@ Signed-off-by: Maxin B. John <maxin.john@intel.com>
  1 file changed, 4 insertions(+), 2 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 03ddc50..523caea 100644
+index e27745e5..528f1bb5 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -172,10 +172,12 @@ if test "$nftables" != 1; then
+@@ -158,10 +158,12 @@ if test "$nftables" != 1; then
  fi
  
  if test "x$enable_connlabel" = "xyes"; then
@@ -47,5 +47,5 @@ index 03ddc50..523caea 100644
  		blacklist_modules="$blacklist_modules connlabel";
  		echo "WARNING: libnetfilter_conntrack not found, connlabel match will not be built";
 -- 
-2.4.0
+2.30.2
 
diff --git a/meta/recipes-extended/iptables/iptables/format-security.patch b/meta/recipes-extended/iptables/iptables/format-security.patch
index be1e077b49..fae920f0a8 100644
--- a/meta/recipes-extended/iptables/iptables/format-security.patch
+++ b/meta/recipes-extended/iptables/iptables/format-security.patch
@@ -1,30 +1,31 @@
-From b72eb12ea5a61df0655ad99d5048994e916be83a Mon Sep 17 00:00:00 2001
+From ed4082a7405a5838c205a34c1559e289949200cc Mon Sep 17 00:00:00 2001
 From: Phil Sutter <phil@nwl.cc>
-Date: Fri, 13 May 2022 16:51:58 +0200
-Subject: xshared: Fix build for -Werror=format-security
+Date: Thu, 12 Jan 2023 14:38:44 +0100
+Subject: extensions: NAT: Fix for -Werror=format-security
 
-Gcc complains about the omitted format string.
+Have to pass either a string literal or format string to xt_xlate_add().
 
+Fixes: f30c5edce0413 ("extensions: Merge SNAT, DNAT, REDIRECT and MASQUERADE")
 Signed-off-by: Phil Sutter <phil@nwl.cc>
-Upstream-Status: Backport
+Upstream-Status: Backport [https://git.netfilter.org/iptables/commit/?id=ed4082a7405a5838c205a34c1559e289949200cc]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
 ---
- iptables/xshared.c | 2 +-
+ extensions/libxt_NAT.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/iptables/xshared.c b/iptables/xshared.c
-index fae5ddd5..a8512d38 100644
---- a/iptables/xshared.c
-+++ b/iptables/xshared.c
-@@ -1307,7 +1307,7 @@ static void check_empty_interface(struct xtables_args *args, const char *arg)
- 		return;
+diff --git a/extensions/libxt_NAT.c b/extensions/libxt_NAT.c
+index da9f2201..2a634398 100644
+--- a/extensions/libxt_NAT.c
++++ b/extensions/libxt_NAT.c
+@@ -424,7 +424,7 @@ __NAT_xlate(struct xt_xlate *xl, const struct nf_nat_range2 *r,
+ 	if (r->flags & NF_NAT_RANGE_PROTO_OFFSET)
+ 		return 0;
  
- 	if (args->family != NFPROTO_ARP)
--		xtables_error(PARAMETER_PROBLEM, msg);
-+		xtables_error(PARAMETER_PROBLEM, "%s", msg);
- 
- 	fprintf(stderr, "%s", msg);
- }
+-	xt_xlate_add(xl, tgt);
++	xt_xlate_add(xl, "%s", tgt);
+ 	if (strlen(range_str))
+ 		xt_xlate_add(xl, " to %s", range_str);
+ 	if (r->flags & NF_NAT_RANGE_PROTO_RANDOM) {
 -- 
 cgit v1.2.3
 
diff --git a/meta/recipes-extended/iptables/iptables_1.8.8.bb b/meta/recipes-extended/iptables/iptables_1.8.9.bb
similarity index 90%
rename from meta/recipes-extended/iptables/iptables_1.8.8.bb
rename to meta/recipes-extended/iptables/iptables_1.8.9.bb
index 54d027220b..dc91973548 100644
--- a/meta/recipes-extended/iptables/iptables_1.8.8.bb
+++ b/meta/recipes-extended/iptables/iptables_1.8.9.bb
@@ -8,18 +8,18 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://iptables/iptables.c;beginline=13;endline=25;md5=c5cffd09974558cf27d0f763df2a12dc \
 "
 
-SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2 \
-           file://0001-configure-Add-option-to-enable-disable-libnfnetlink.patch \
-           file://0001-Makefile.am-do-not-install-etc-ethertypes.patch \
-           file://0002-configure.ac-only-check-conntrack-when-libnfnetlink-enabled.patch \
-           file://format-security.patch \
+SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.xz \
            file://iptables.service \
            file://iptables.rules \
            file://ip6tables.service \
            file://ip6tables.rules \
-           file://0001-iptables-xshared.h-add-missing-sys.types.h-include.patch \
+           file://0001-configure-Add-option-to-enable-disable-libnfnetlink.patch \
+           file://0002-iptables-xshared.h-add-missing-sys.types.h-include.patch \
+           file://0003-Makefile.am-do-not-install-etc-ethertypes.patch \
+           file://0004-configure.ac-only-check-conntrack-when-libnfnetlink-.patch \
+           file://format-security.patch \
            "
-SRC_URI[sha256sum] = "71c75889dc710676631553eb1511da0177bbaaf1b551265b912d236c3f51859f"
+SRC_URI[sha256sum] = "ef6639a43be8325a4f8ea68123ffac236cb696e8c78501b64e8106afb008c87f"
 
 SYSTEMD_SERVICE:${PN} = "\
     iptables.service \
@@ -116,8 +116,10 @@ RDEPENDS:${PN}-apply = "${PN} bash"
 # Include the symlinks as well in respective packages
 FILES:${PN}-module-xt-conntrack += "${libdir}/xtables/libxt_state.so"
 FILES:${PN}-module-xt-ct += "${libdir}/xtables/libxt_NOTRACK.so ${libdir}/xtables/libxt_REDIRECT.so"
+FILES:${PN}-module-xt-nat += "${libdir}/xtables/libxt_SNAT.so ${libdir}/xtables/libxt_DNAT.so ${libdir}/xtables/libxt_MASQUERADE.so"
 
 ALLOW_EMPTY:${PN}-modules = "1"
 
 INSANE_SKIP:${PN}-module-xt-conntrack = "dev-so"
 INSANE_SKIP:${PN}-module-xt-ct = "dev-so"
+INSANE_SKIP:${PN}-module-xt-nat = "dev-so"
-- 
2.30.2


