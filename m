Return-Path: <jay.shen.teoh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F5DAECAAA1
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 06:38:20 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web10.6981.1663223894020065360
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 23:38:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=NcTO/zzx;
 spf=pass (domain: intel.com, ip: 134.134.136.126,
 mailfrom: jay.shen.teoh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663223894; x=1694759894;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JV5LwZ0w3EcU1LHay3owxBEaqJNPsnWusffZueECKVE=;
  b=NcTO/zzxoepGLgIk2HLL0rrpZt3tVvye9C0uePZwX/AStdPNLrXcY6Zn
   IvR9ZPCHORpToY4gMzaNtmKaR/f6BoGXbWdCLqWRb4Z5CmdAv0waA88k3
   Fzxkvxmig20QGhw9b/rYFTsumRTyy/0SoS6F4GMzteFfEf+PbOi3PzlWD
   /+4nd9GhQ4JX1cH42jvrSa5GsQ2s/OqTF+snT4V9uUPa/KJkdoRxPR9ve
   e9yFfmk5Xd+ujnpTDNUyfO48duI5N97CF0iRh471LUiNMPJmsZgIMV2QP
   cDE+vp7oHcmJLkMnb2kNMdNgvHcyJjuZ/UZ8AhGFUa3xLNtWW2U8Z76i0
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10470"; a="281659045"
X-IronPort-AV: E=Sophos;i="5.93,317,1654585200";
   d="scan'208";a="281659045"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2022 23:38:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,317,1654585200";
   d="scan'208";a="685602203"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by fmsmga004.fm.intel.com with ESMTP; 14 Sep 2022 23:38:12 -0700
From: jay.shen.teoh@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone][PATCH] inetutils: Fix remote DoS vulnerability
 in inetutils-telnetd
Date: Thu, 15 Sep 2022 14:38:10 +0800
Message-Id: <20220915063810.6331-1-jay.shen.teoh@intel.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 06:38:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170680

From: Teoh Jay Shen <jay.shen.teoh@intel.com>

Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
---
 .../inetutils/inetutils/CVE-2022-39028.patch  | 54 +++++++++++++++++++
 .../inetutils/inetutils_2.2.bb                |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2022-39028.patch

diff --git a/meta/recipes-connectivity/inetutils/inetutils/CVE-2022-39028.patch b/meta/recipes-connectivity/inetutils/inetutils/CVE-2022-39028.patch
new file mode 100644
index 0000000000..54040ad74c
--- /dev/null
+++ b/meta/recipes-connectivity/inetutils/inetutils/CVE-2022-39028.patch
@@ -0,0 +1,54 @@
+From d52349fa1b6baac77ffa2c74769636aa2ece2ec5 Mon Sep 17 00:00:00 2001
+From: Erik Auerswald <auerswal@unix-ag.uni-kl.de>
+Date: Sat, 3 Sep 2022 16:58:16 +0200
+Subject: [PATCH] telnetd: Handle early IAC EC or IAC EL receipt
+
+Fix telnetd crash if the first two bytes of a new connection
+are 0xff 0xf7 (IAC EC) or 0xff 0xf8 (IAC EL).
+
+The problem was reported in:
+<https://pierrekim.github.io/blog/2022-08-24-2-byte-dos-freebsd-netbsd-telnetd-netkit-telnetd-inetutils-telnetd-kerberos-telnetd.html>.
+
+* NEWS: Mention fix.
+* telnetd/state.c (telrcv): Handle zero slctab[SLC_EC].sptr and
+zero slctab[SLC_EL].sptr.
+
+CVE: CVE-2022-39028
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/inetutils.git/commit/?id=fae8263e467380483c28513c0e5fac143e46f94f]
+Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
+---
+ telnetd/state.c | 12 +++++++++---
+ 1 file changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/telnetd/state.c b/telnetd/state.c
+index ffc6cba..c2d760f 100644
+--- a/telnetd/state.c
++++ b/telnetd/state.c
+@@ -312,15 +312,21 @@ telrcv (void)
+ 	    case EC:
+ 	    case EL:
+ 	      {
+-		cc_t ch;
++		cc_t ch = (cc_t) (_POSIX_VDISABLE);
+ 
+ 		DEBUG (debug_options, 1, printoption ("td: recv IAC", c));
+ 		ptyflush ();	/* half-hearted */
+ 		init_termbuf ();
+ 		if (c == EC)
+-		  ch = *slctab[SLC_EC].sptr;
++		  {
++		    if (slctab[SLC_EC].sptr)
++		      ch = *slctab[SLC_EC].sptr;
++		  }
+ 		else
+-		  ch = *slctab[SLC_EL].sptr;
++		  {
++		    if (slctab[SLC_EL].sptr)
++		      ch = *slctab[SLC_EL].sptr;
++		  }
+ 		if (ch != (cc_t) (_POSIX_VDISABLE))
+ 		  pty_output_byte ((unsigned char) ch);
+ 		break;
+-- 
+2.37.3
+
diff --git a/meta/recipes-connectivity/inetutils/inetutils_2.2.bb b/meta/recipes-connectivity/inetutils/inetutils_2.2.bb
index 6c9a299b71..d8062e2b21 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_2.2.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_2.2.bb
@@ -21,6 +21,7 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.xz \
            file://tftpd.xinetd.inetutils \
            file://inetutils-1.9-PATH_PROCNET_DEV.patch \
            file://inetutils-only-check-pam_appl.h-when-pam-enabled.patch \
+           file://CVE-2022-39028.patch \
 "
 
 inherit autotools gettext update-alternatives texinfo
-- 
2.36.1


