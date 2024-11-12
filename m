Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B656DD41D7F
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 09:25:15 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.82726.1731403510603683725
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 01:25:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZG+infog;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731403511; x=1762939511;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=hKQ8mBgTtzWBnIrVtPTy/DW6jGiTPHWBleaPzPzLngc=;
  b=ZG+infog9y1A+XJDgnIDJzNTyFKkxkDMXLV9q7FxoSXGJgG9HUi4y+4e
   pcziH1duZwRr+uVpoQKm7sVTOuEylJWIkS7otG8CSuZR0LAEmhF/la6gQ
   YJn5IUQo25mxJSMeYJqLxC5hPTBzVgyCDst00AZjvygvc6hx/S1GvarAA
   q/sfEqmjrnDL8Byknz67EmaxSJz0tEZzMt6aUbId5fRgqgFx/AqBpI5Z6
   EH2RACC/9mMQKOwF2HlHlRLRGZh45d6//UD+dGLwkHkAMyzR7i/cLKiKk
   HTJlfXYZ/pL3j6npxCqZiC14RmPCtZguyKXpB+9kAY7NIkQVv0G1NW6Kh
   Q==;
X-CSE-ConnectionGUID: EQ+sfrxvToiy2Tn5NUbreA==
X-CSE-MsgGUID: FE/NsvlNTySy+dj+H3RSRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="168413867"
X-IronPort-AV: E=Sophos;i="6.12,147,1728918000"; 
   d="scan'208";a="168413867"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 18:25:06 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 57217D5013
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:04 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id DEB5C28CD9
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:03 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 746D420071A35
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:03 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 243251A000A;
	Tue, 12 Nov 2024 17:25:03 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 12/47] iptables: upgrade 1.8.10 -> 1.8.11
Date: Tue, 12 Nov 2024 17:24:08 +0800
Message-Id: <1731403483-21399-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
References: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28792.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28792.006
X-TMASE-Result: 10--0.165500-10.000000
X-TMASE-MatchedRID: 242WXRytjV6jz0nOeth/yaoXHZz/dXlxWfgivgcUPZNIyDY579vwTAyf
	XeYFOVFH6oHv+vDBrw3vOpaxrqKQ/WFqPXSLpNdAuce7gFxhKa1MkOX0UoduuaShvRjfn4cU6+f
	8731wcoUILxoCYZ47qepe9co8GDkGZWMJGq5h2T4ReM8i8p3vgFK6+0HOVoSoNS9A3X1uuOAkwl
	cMmOSp1NAeoNFELB9Q4Vy0vwSgD3D8YXm3VyrsLsYv//yaWh0DczQnRrpmbEnfc2Xd6VJ+yiu5i
	Q9EM64EvnCllUJsUcvOyd98r1P+4QYcH09cOokp+GYt8f/VhTsth3LBMeXue3d17Y6gGqDCyG9t
	Ju7z9B30YXQzpNvE/M+iRK5D7iW3XHEPHmpuRH0URSScn+QSXgGlEJORGTlJ+gtHj7OwNO19R4S
	s0oUmJy1oraBFnDQ38sRBYiKIc5YFpwBFlQdYtEU8txuTTilzbi8JBDo0rRRCMQkzKHlvbbdU2a
	S3ztAiUflEmzrMu+xPTg6Ry48r8PIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 09:25:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207002

From: Wang Mingyu <wangmy@fujitsu.com>

0001-configure-Add-option-to-enable-disable-libnfnetlink.patch
0002-nft-ruleparse-Add-missing-braces-around-ternary.patch
removed since they're included in 1.8.11

Changelog:
 https://netfilter.org/projects/iptables/files/changes-iptables-1.8.11.txt

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ption-to-enable-disable-libnfnetlink.patch | 53 -------------------
 ...se-Add-missing-braces-around-ternary.patch | 37 -------------
 ...{iptables_1.8.10.bb => iptables_1.8.11.bb} |  4 +-
 3 files changed, 1 insertion(+), 93 deletions(-)
 delete mode 100644 meta/recipes-extended/iptables/iptables/0001-configure-Add-option-to-enable-disable-libnfnetlink.patch
 delete mode 100644 meta/recipes-extended/iptables/iptables/0002-nft-ruleparse-Add-missing-braces-around-ternary.patch
 rename meta/recipes-extended/iptables/{iptables_1.8.10.bb => iptables_1.8.11.bb} (95%)

diff --git a/meta/recipes-extended/iptables/iptables/0001-configure-Add-option-to-enable-disable-libnfnetlink.patch b/meta/recipes-extended/iptables/iptables/0001-configure-Add-option-to-enable-disable-libnfnetlink.patch
deleted file mode 100644
index 0fe2261511..0000000000
--- a/meta/recipes-extended/iptables/iptables/0001-configure-Add-option-to-enable-disable-libnfnetlink.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 653db8b938166db7833135f615b90c38a3f27a30 Mon Sep 17 00:00:00 2001
-From: "Maxin B. John" <maxin.john@intel.com>
-Date: Thu, 25 Apr 2024 10:51:02 +0200
-Subject: [PATCH] configure: Add option to enable/disable libnfnetlink
-
-Default behavior (autodetecting) does not change, but specifying
-either option would explicitly disable or enable libnfnetlink support,
-and if the library is not found in the latter case, ./configure will error
-out.
-
-Upstream-Status: Backport [https://git.netfilter.org/iptables/commit/?id=653db8b938166db7833135f615b90c38a3f27a30]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-Signed-off-by: Phil Sutter <phil@nwl.cc>
----
- configure.ac | 13 +++++++++++--
- 1 file changed, 11 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index d99fa3b9..2293702b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -63,6 +63,9 @@ AC_ARG_WITH([pkgconfigdir], AS_HELP_STRING([--with-pkgconfigdir=PATH],
- AC_ARG_ENABLE([nftables],
- 	AS_HELP_STRING([--disable-nftables], [Do not build nftables compat]),
- 	[enable_nftables="$enableval"], [enable_nftables="yes"])
-+AC_ARG_ENABLE([libnfnetlink],
-+    AS_HELP_STRING([--disable-libnfnetlink], [Do not use netfilter netlink library]),
-+    [enable_libnfnetlink="$enableval"], [enable_libnfnetlink="auto"])
- AC_ARG_ENABLE([connlabel],
- 	AS_HELP_STRING([--disable-connlabel],
- 	[Do not build libnetfilter_conntrack]),
-@@ -113,8 +116,14 @@ AM_CONDITIONAL([ENABLE_SYNCONF], [test "$enable_nfsynproxy" = "yes"])
- AM_CONDITIONAL([ENABLE_NFTABLES], [test "$enable_nftables" = "yes"])
- AM_CONDITIONAL([ENABLE_CONNLABEL], [test "$enable_connlabel" = "yes"])
- 
--PKG_CHECK_MODULES([libnfnetlink], [libnfnetlink >= 1.0],
--	[nfnetlink=1], [nfnetlink=0])
-+# If specified explicitly on the command line, error out when library was not found
-+# Otherwise, disable and continue
-+AS_IF([test "x$enable_libnfnetlink" = "xyes"],
-+	[PKG_CHECK_MODULES([libnfnetlink], [libnfnetlink >= 1.0],
-+			   [nfnetlink=1])],
-+      [test "x$enable_libnfnetlink" = "xauto"],
-+	[PKG_CHECK_MODULES([libnfnetlink], [libnfnetlink >= 1.0],
-+			   [nfnetlink=1], [nfnetlink=0])])
- AM_CONDITIONAL([HAVE_LIBNFNETLINK], [test "$nfnetlink" = 1])
- 
- if test "x$enable_bpfc" = "xyes" || test "x$enable_nfsynproxy" = "xyes"; then
--- 
-2.39.2
-
diff --git a/meta/recipes-extended/iptables/iptables/0002-nft-ruleparse-Add-missing-braces-around-ternary.patch b/meta/recipes-extended/iptables/iptables/0002-nft-ruleparse-Add-missing-braces-around-ternary.patch
deleted file mode 100644
index 4cbc8bdaf4..0000000000
--- a/meta/recipes-extended/iptables/iptables/0002-nft-ruleparse-Add-missing-braces-around-ternary.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 2026b08bce7fe87b5964f7912e1eef30f04922c1 Mon Sep 17 00:00:00 2001
-From: Phil Sutter <phil@nwl.cc>
-Date: Fri, 26 Jan 2024 18:43:10 +0100
-Subject: [PATCH] nft: ruleparse: Add missing braces around ternary
-
-The expression evaluated the sum before the ternay, consequently not
-adding target->size if tgsize was zero.
-
-Identified by ASAN for a simple rule using standard target:
-| # ebtables -A INPUT -s de:ad:be:ef:0:00 -j RETURN
-| # ebtables -D INPUT -s de:ad:be:ef:0:00 -j RETURN
-| =================================================================
-| ==18925==ERROR: AddressSanitizer: heap-buffer-overflow on address 0x603000000120 at pc 0x7f627a4c75c5 bp 0x7ffe882b5180 sp 0x7ffe882b4928
-| READ of size 8 at 0x603000000120 thread T0
-| [...]
-
-Upstream-Status: Backport [2026b08bce7fe87b5964f7912e1eef30f04922c1]
-
-Fixes: 2a6eee89083c8 ("nft-ruleparse: Introduce nft_create_target()")
-Signed-off-by: Phil Sutter <phil@nwl.cc>
----
- iptables/nft-ruleparse.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/iptables/nft-ruleparse.c b/iptables/nft-ruleparse.c
-index 0bbdf44faf..3b1cbe4fa1 100644
---- a/iptables/nft-ruleparse.c
-+++ b/iptables/nft-ruleparse.c
-@@ -94,7 +94,7 @@ __nft_create_target(struct nft_xt_ctx *ctx, const char *name, size_t tgsize)
- 	if (!target)
- 		return NULL;
- 
--	size = XT_ALIGN(sizeof(*target->t)) + tgsize ?: target->size;
-+	size = XT_ALIGN(sizeof(*target->t)) + (tgsize ?: target->size);
- 
- 	target->t = xtables_calloc(1, size);
- 	target->t->u.target_size = size;
diff --git a/meta/recipes-extended/iptables/iptables_1.8.10.bb b/meta/recipes-extended/iptables/iptables_1.8.11.bb
similarity index 95%
rename from meta/recipes-extended/iptables/iptables_1.8.10.bb
rename to meta/recipes-extended/iptables/iptables_1.8.11.bb
index a94e4749ae..686dc5afe5 100644
--- a/meta/recipes-extended/iptables/iptables_1.8.10.bb
+++ b/meta/recipes-extended/iptables/iptables_1.8.11.bb
@@ -13,10 +13,8 @@ SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.xz \
            file://iptables.rules \
            file://ip6tables.service \
            file://ip6tables.rules \
-           file://0001-configure-Add-option-to-enable-disable-libnfnetlink.patch \
-           file://0002-nft-ruleparse-Add-missing-braces-around-ternary.patch \
            "
-SRC_URI[sha256sum] = "5cc255c189356e317d070755ce9371eb63a1b783c34498fb8c30264f3cc59c9c"
+SRC_URI[sha256sum] = "d87303d55ef8c92bcad4dd3f978b26d272013642b029425775f5bad1009fe7b2"
 
 SYSTEMD_SERVICE:${PN} = "\
     iptables.service \
-- 
2.34.1


