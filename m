Return-Path: <changhyeok.bae@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2866C4167B
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 14:11:33 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.33731.1701267092086586997
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Nov 2023 06:11:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PnOVGcGU;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: changhyeok.bae@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-407acb21f27so8646585e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 06:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701267090; x=1701871890; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dgU6iUZ7/s3Bbr+TlRX9APi8SqQGmEWY1IPMGuFvCQ4=;
        b=PnOVGcGU3NwOSzxtf6eE+vD0Bmhj7auHNJuCBDaiexZDDSOBzsSxIG2fYAkNx9iN8+
         I/5SVTG7FRiiHSEQuJDXoorVrHyfnQjyQ+laxsXpn1OA7blMYvk1dSYoHTlqSxtQaM+g
         PvXR5DZVNXNBmPZBLYTElC65TH2rQxtvUXN72HndTqVXBtn5xdR2VgPbXdUNJulXn30j
         dVugtk5g64kQ0wMgHAhsP25aSrB2nUKjatI0pvtY8l8rESeLfBPcQJymKocpaiJJ4xUo
         ffcpXahW+9lN/m8mz6dzOzpqUnMh0B/fyCGTVgKB/iRChN6tSdT6HqxurwZ3mbacsoEf
         kPsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701267090; x=1701871890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dgU6iUZ7/s3Bbr+TlRX9APi8SqQGmEWY1IPMGuFvCQ4=;
        b=n+2eh9aTNNV9eYaCEUQp/ktZ3V/GlM9ONV2dJXedj3uBiIJaBvvcKQ3S5hwAvSkZIR
         Hp7KkjOYT3pIOYWPA83vbM0hpUxahkGih9iQz4ujTuuuHNTZWDo6MKw0WaD7Q/NTwvaY
         IQTJSjOMsNoQ26ubhJIaEs0CyMXG8ZrksD+C/Pwfq/bJpn6airV08XkR8n6RCNn+rFrl
         ZtKBLlE09Ax+eoW75Lg+M8rA51lrBhZa8PCq2shJS81fk+kCUjMMVmaeQ7dlHXpW/SzK
         hjpq+7nyplGEIGjBjwmd+jMk9NsP8IWOe/TTV0n7sH1kiRoMQrNj7GSDQez4wOVX5B54
         m1rQ==
X-Gm-Message-State: AOJu0YwJdAx6/oGrw1UHDhWX5Re6ctsh46+PjjSZbOWTvN1tDHfAN3hw
	JcOoDyDtGbxZBFYh4ZLOxSmq3B1ecQM=
X-Google-Smtp-Source: AGHT+IF9JaNXXVG/qEEmpyLyyAOmE3mG6ogTAAv2HaiVWeYLNhtEWzwWPKBTvvbEFjzb90G+50a1WQ==
X-Received: by 2002:a05:600c:2047:b0:40b:540b:769a with SMTP id p7-20020a05600c204700b0040b540b769amr1127929wmg.0.1701267089934;
        Wed, 29 Nov 2023 06:11:29 -0800 (PST)
Received: from localhost.localdomain ([217.9.63.39])
        by smtp.gmail.com with ESMTPSA id o8-20020a5d6848000000b0031980294e9fsm17938112wrw.116.2023.11.29.06.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 06:11:29 -0800 (PST)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Changhyeok Bae <changhyeok.bae@gmail.com>
Subject: [OE-core][PATCH] iptables: upgrade 1.8.9 -> 1.8.10
Date: Wed, 29 Nov 2023 14:08:46 +0000
Message-Id: <20231129140846.62061-1-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 14:11:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191451

- 0003-x is not required anymore because to xtables.conf is dropped.
- format-security.patch is already in upstream.
- Other patches are refreshed.

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 ...ption-to-enable-disable-libnfnetlink.patch | 20 ++++-----
 ...ed.h-add-missing-sys.types.h-include.patch | 10 ++---
 ...ile.am-do-not-install-etc-ethertypes.patch | 41 -------------------
 ...y-check-conntrack-when-libnfnetlink-.patch | 12 +++---
 .../iptables/iptables/format-security.patch   | 31 --------------
 .../{iptables_1.8.9.bb => iptables_1.8.10.bb} |  4 +-
 6 files changed, 19 insertions(+), 99 deletions(-)
 delete mode 100644 meta/recipes-extended/iptables/iptables/0003-Makefile.am-do-not-install-etc-ethertypes.patch
 delete mode 100644 meta/recipes-extended/iptables/iptables/format-security.patch
 rename meta/recipes-extended/iptables/{iptables_1.8.9.bb => iptables_1.8.10.bb} (95%)

diff --git a/meta/recipes-extended/iptables/iptables/0001-configure-Add-option-to-enable-disable-libnfnetlink.patch b/meta/recipes-extended/iptables/iptables/0001-configure-Add-option-to-enable-disable-libnfnetlink.patch
index 0c2c97cdc8..8824bf2af7 100644
--- a/meta/recipes-extended/iptables/iptables/0001-configure-Add-option-to-enable-disable-libnfnetlink.patch
+++ b/meta/recipes-extended/iptables/iptables/0001-configure-Add-option-to-enable-disable-libnfnetlink.patch
@@ -1,7 +1,7 @@
-From 698ed332e2c592235d2b737c545ac25ad0970e15 Mon Sep 17 00:00:00 2001
+From 0096c854d5015918ed154dccb3ad472fd06c1010 Mon Sep 17 00:00:00 2001
 From: "Maxin B. John" <maxin.john@intel.com>
 Date: Tue, 21 Feb 2017 11:16:31 +0200
-Subject: [PATCH 1/4] configure: Add option to enable/disable libnfnetlink
+Subject: [PATCH] configure: Add option to enable/disable libnfnetlink
 
 This changes the configure behaviour from autodetecting
 for libnfnetlink to having an option to disable it explicitly
@@ -10,12 +10,13 @@ Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Maxin B. John <maxin.john@intel.com>
+
 ---
  configure.ac | 10 +++++++---
  1 file changed, 7 insertions(+), 3 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index bc2ed47b..e27745e5 100644
+index d99fa3b..d607772 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -63,6 +63,9 @@ AC_ARG_WITH([pkgconfigdir], AS_HELP_STRING([--with-pkgconfigdir=PATH],
@@ -28,9 +29,9 @@ index bc2ed47b..e27745e5 100644
  AC_ARG_ENABLE([connlabel],
  	AS_HELP_STRING([--disable-connlabel],
  	[Do not build libnetfilter_conntrack]),
-@@ -117,9 +120,10 @@ if test "x$enable_bpfc" = "xyes" || test "x$enable_nfsynproxy" = "xyes"; then
- 	AC_CHECK_LIB(pcap, pcap_compile,, AC_MSG_ERROR(missing libpcap library required by bpf compiler or nfsynproxy tool))
- fi
+@@ -113,9 +116,10 @@ AM_CONDITIONAL([ENABLE_SYNCONF], [test "$enable_nfsynproxy" = "yes"])
+ AM_CONDITIONAL([ENABLE_NFTABLES], [test "$enable_nftables" = "yes"])
+ AM_CONDITIONAL([ENABLE_CONNLABEL], [test "$enable_connlabel" = "yes"])
  
 -PKG_CHECK_MODULES([libnfnetlink], [libnfnetlink >= 1.0],
 -	[nfnetlink=1], [nfnetlink=0])
@@ -40,8 +41,5 @@ index bc2ed47b..e27745e5 100644
 +    ])
 +AM_CONDITIONAL([HAVE_LIBNFNETLINK], [test "x$enable_libnfnetlink" = "xyes"])
  
- if test "x$enable_nftables" = "xyes"; then
- 	PKG_CHECK_MODULES([libmnl], [libmnl >= 1.0], [mnl=1], [mnl=0])
--- 
-2.30.2
-
+ if test "x$enable_bpfc" = "xyes" || test "x$enable_nfsynproxy" = "xyes"; then
+ 	PKG_CHECK_MODULES([libpcap], [libpcap], [], [
diff --git a/meta/recipes-extended/iptables/iptables/0002-iptables-xshared.h-add-missing-sys.types.h-include.patch b/meta/recipes-extended/iptables/iptables/0002-iptables-xshared.h-add-missing-sys.types.h-include.patch
index 9621d46c09..a190c7e8ae 100644
--- a/meta/recipes-extended/iptables/iptables/0002-iptables-xshared.h-add-missing-sys.types.h-include.patch
+++ b/meta/recipes-extended/iptables/iptables/0002-iptables-xshared.h-add-missing-sys.types.h-include.patch
@@ -1,7 +1,7 @@
-From d4699d2169fe2d91d0f1f4369d40d2e5f42b8877 Mon Sep 17 00:00:00 2001
+From 465e3ef77f1763d225adc76220e43ee9bd73b178 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Tue, 17 May 2022 10:56:59 +0200
-Subject: [PATCH 2/4] iptables/xshared.h: add missing sys.types.h include
+Subject: [PATCH] iptables/xshared.h: add missing sys.types.h include
 
 This resolves the build error under musl:
 
@@ -12,12 +12,13 @@ This resolves the build error under musl:
 
 Upstream-Status: Submitted [via email to phil@nwl.cc]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+
 ---
  iptables/xshared.h | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/iptables/xshared.h b/iptables/xshared.h
-index 0ed9f3c2..b1413834 100644
+index a200e0d..f543dbf 100644
 --- a/iptables/xshared.h
 +++ b/iptables/xshared.h
 @@ -6,6 +6,7 @@
@@ -28,6 +29,3 @@ index 0ed9f3c2..b1413834 100644
  #include <linux/netfilter_arp/arp_tables.h>
  #include <linux/netfilter_ipv4/ip_tables.h>
  #include <linux/netfilter_ipv6/ip6_tables.h>
--- 
-2.30.2
-
diff --git a/meta/recipes-extended/iptables/iptables/0003-Makefile.am-do-not-install-etc-ethertypes.patch b/meta/recipes-extended/iptables/iptables/0003-Makefile.am-do-not-install-etc-ethertypes.patch
deleted file mode 100644
index cbc97572ec..0000000000
--- a/meta/recipes-extended/iptables/iptables/0003-Makefile.am-do-not-install-etc-ethertypes.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 28291b41bc3717f51e8d9d465f0100f1ca99dc26 Mon Sep 17 00:00:00 2001
-From: Trevor Gamblin <trevor.gamblin@windriver.com>
-Date: Wed, 9 Mar 2022 12:50:39 -0500
-Subject: [PATCH 3/4] Makefile.am: do not install /etc/ethertypes
-
-The /etc/ethertypes is provided by netbase since 6.0[1].
-Do not instal the file in ebtables, otherwise there would be a conflict:
-Error: Transaction test error:
-  file /etc/ethertypes conflicts between attempted installs of
-netbase-1:6.2-r0.corei7_64 and iptables-1.8.7-r0.corei7_64
-
-[1]
-https://salsa.debian.org/md/netbase/-/commit/316680c6a2c3641b6abc76b3eebf88781f609d35)
-
-This patch is based off of the same change made for the ebtables recipe:
-
-http://cgit.openembedded.org/meta-openembedded/tree/meta-networking/recipes-filter/ebtables/ebtables-2.0.11/0001-Makefile.am-do-not-install-etc-ethertypes.patch?h=master
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
----
- Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 451c3cb2..5125238c 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -20,7 +20,7 @@ EXTRA_DIST	= autogen.sh iptables-test.py xlate-test.py
- 
- if ENABLE_NFTABLES
- confdir		= $(sysconfdir)
--dist_conf_DATA	= etc/ethertypes etc/xtables.conf
-+dist_conf_DATA	= etc/xtables.conf
- endif
- 
- .PHONY: tarball
--- 
-2.30.2
-
diff --git a/meta/recipes-extended/iptables/iptables/0004-configure.ac-only-check-conntrack-when-libnfnetlink-.patch b/meta/recipes-extended/iptables/iptables/0004-configure.ac-only-check-conntrack-when-libnfnetlink-.patch
index 20c40c4039..5a022ebc8c 100644
--- a/meta/recipes-extended/iptables/iptables/0004-configure.ac-only-check-conntrack-when-libnfnetlink-.patch
+++ b/meta/recipes-extended/iptables/iptables/0004-configure.ac-only-check-conntrack-when-libnfnetlink-.patch
@@ -1,7 +1,7 @@
-From e7aa1dd2831f9bb5d0603c5e5027387ad7721b00 Mon Sep 17 00:00:00 2001
+From 6832501bbb90a3dab977a4625d0391804c0e795c Mon Sep 17 00:00:00 2001
 From: "Maxin B. John" <maxin.john@intel.com>
 Date: Tue, 21 Feb 2017 11:49:07 +0200
-Subject: [PATCH 4/4] configure.ac:
+Subject: [PATCH] configure.ac:
  only-check-conntrack-when-libnfnetlink-enabled.patch
 
 Package libnetfilter-conntrack depends on package libnfnetlink. iptables
@@ -23,15 +23,16 @@ Upstream-Status: Pending
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
 Signed-off-by: Maxin B. John <maxin.john@intel.com>
+
 ---
  configure.ac | 6 ++++--
  1 file changed, 4 insertions(+), 2 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index e27745e5..528f1bb5 100644
+index d607772..25a8e75 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -158,10 +158,12 @@ if test "$nftables" != 1; then
+@@ -159,10 +159,12 @@ if test "$nftables" != 1; then
  fi
  
  if test "x$enable_connlabel" = "xyes"; then
@@ -46,6 +47,3 @@ index e27745e5..528f1bb5 100644
  	if test "$nfconntrack" -ne 1; then
  		blacklist_modules="$blacklist_modules connlabel";
  		echo "WARNING: libnetfilter_conntrack not found, connlabel match will not be built";
--- 
-2.30.2
-
diff --git a/meta/recipes-extended/iptables/iptables/format-security.patch b/meta/recipes-extended/iptables/iptables/format-security.patch
deleted file mode 100644
index fae920f0a8..0000000000
--- a/meta/recipes-extended/iptables/iptables/format-security.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From ed4082a7405a5838c205a34c1559e289949200cc Mon Sep 17 00:00:00 2001
-From: Phil Sutter <phil@nwl.cc>
-Date: Thu, 12 Jan 2023 14:38:44 +0100
-Subject: extensions: NAT: Fix for -Werror=format-security
-
-Have to pass either a string literal or format string to xt_xlate_add().
-
-Fixes: f30c5edce0413 ("extensions: Merge SNAT, DNAT, REDIRECT and MASQUERADE")
-Signed-off-by: Phil Sutter <phil@nwl.cc>
-Upstream-Status: Backport [https://git.netfilter.org/iptables/commit/?id=ed4082a7405a5838c205a34c1559e289949200cc]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- extensions/libxt_NAT.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/extensions/libxt_NAT.c b/extensions/libxt_NAT.c
-index da9f2201..2a634398 100644
---- a/extensions/libxt_NAT.c
-+++ b/extensions/libxt_NAT.c
-@@ -424,7 +424,7 @@ __NAT_xlate(struct xt_xlate *xl, const struct nf_nat_range2 *r,
- 	if (r->flags & NF_NAT_RANGE_PROTO_OFFSET)
- 		return 0;
- 
--	xt_xlate_add(xl, tgt);
-+	xt_xlate_add(xl, "%s", tgt);
- 	if (strlen(range_str))
- 		xt_xlate_add(xl, " to %s", range_str);
- 	if (r->flags & NF_NAT_RANGE_PROTO_RANDOM) {
--- 
-cgit v1.2.3
-
diff --git a/meta/recipes-extended/iptables/iptables_1.8.9.bb b/meta/recipes-extended/iptables/iptables_1.8.10.bb
similarity index 95%
rename from meta/recipes-extended/iptables/iptables_1.8.9.bb
rename to meta/recipes-extended/iptables/iptables_1.8.10.bb
index dc91973548..cd2f3bce0b 100644
--- a/meta/recipes-extended/iptables/iptables_1.8.9.bb
+++ b/meta/recipes-extended/iptables/iptables_1.8.10.bb
@@ -15,11 +15,9 @@ SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.xz \
            file://ip6tables.rules \
            file://0001-configure-Add-option-to-enable-disable-libnfnetlink.patch \
            file://0002-iptables-xshared.h-add-missing-sys.types.h-include.patch \
-           file://0003-Makefile.am-do-not-install-etc-ethertypes.patch \
            file://0004-configure.ac-only-check-conntrack-when-libnfnetlink-.patch \
-           file://format-security.patch \
            "
-SRC_URI[sha256sum] = "ef6639a43be8325a4f8ea68123ffac236cb696e8c78501b64e8106afb008c87f"
+SRC_URI[sha256sum] = "5cc255c189356e317d070755ce9371eb63a1b783c34498fb8c30264f3cc59c9c"
 
 SYSTEMD_SERVICE:${PN} = "\
     iptables.service \
-- 
2.34.1


