Return-Path: <adongare@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8705DEF36EE
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 07:02:50 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8607.1773039767291029755
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 00:02:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Q9SpQg/G;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3135; q=dns/txt;
  s=iport01; t=1773039767; x=1774249367;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9uwV+BqYrE9qLM2LeBsreYz3MZePcTEhAlbsjSY3BEU=;
  b=Q9SpQg/GhghoA5O9ZvSnDuh9gJj8H7vpfRDnC+WDwJupwMFxn1mtEsux
   9Ax+0BCiBLZaRxsi1iM+n88RT1v/zls2orE4e06Z4Y6WIpuc3QCNPMFPR
   xdpyb/TFyOdO/VVbIZeQGnFNkoEwTDNdJDzZGZx4lf9u+32aUueA8dz1m
   Vgbja43dWEDsaOV0OxkLFMR1K6KBkkxzIr/REzeJ4WobTaFcU0HjjkTYg
   l99lmZ1MuC/8d58pr1WB49FcgVGskhZLYY6/TIdqpmqyEr0o9seBsNZL0
   /I+z7w/dEo4KQ5PraDAYFiNzeeSZQnPtb/e3xjTcNLuA3sb5Q0fsdsuwu
   w==;
X-CSE-ConnectionGUID: j+vylmm3RNGusx+esaSH5Q==
X-CSE-MsgGUID: TrOHm8rVRSWzoMulk49o1w==
X-IPAS-Result: =?us-ascii?q?A0CfBQCub65p/5D/Ja1aHgEBCxIMggULgkgPcV5DSQOWS?=
 =?us-ascii?q?J4dgX8PAQEBDz0UBAEBhQeNIgImNAkOAQIEAQEBAQMCAwEBAQEBAQEBAQEBC?=
 =?us-ascii?q?wEBBQEBAQIBBwWBDhOGTw2GWgECASoLAUYsAwECWiMhG4JnAYJzAxGpdoF5M?=
 =?us-ascii?q?4EBg2gCQ0/bJgELFAGBOIU8iBlbGAGEeicbG4FygRWDaIEFgVwBAYEnEYZsB?=
 =?us-ascii?q?IIiehSBYR6FQQaLVkiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBCxsHB?=
 =?us-ascii?q?YUgD4hydG6BE4MEAwsYDUgRLDcUGwQ+bgeNaz6CNIEOASuBRWcRkxSST6EOC?=
 =?us-ascii?q?iiDdIwelToaM4VbpRALmHuLNoJTllCEaIFoPIFHCwdwFYMiCUkZD444g2mBf?=
 =?us-ascii?q?8dRJjIOLgIHCwEBAwmRagEngVUBAQ?=
IronPort-Data: A9a23:7D+aLazYeoCzSrDAFXl6t+dmxyrEfRIJ4+MujC+fZmUNrF6WrkUHm
 mEfXj2COPmPZmOjfdB3aY3i/UgD6JDTyd9hGgI9+FhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4iaT/H3Ygf/hWYvajNMsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJEN1I5wc/+MsO0dh6
 OcIaz0WZyuj2tvjldpXSsE07igiBNPgMIVavjRryivUSK55B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cP3WjOX9PYH46tO6kgX/weidVgFmUvqEwpWPUyWSd1ZCzYIeEJYPWHp49ckCwm
 njh32GpGC8gD+ONzh+Y9nHw1+iWgnauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBWS4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:Gp78oK0uzCQEBXhoy3tp8wqjBLkkLtp133Aq2lEZdPWaSKOlfq
 eV7ZEmPHDP6Qr5NEtMpTniAtjjfZq/z/5ICOAqVN/INjUO01HHEGgN1+ffKkXbak7DHio379
 YGT0C4Y+eAaWRHsQ==
X-Talos-CUID: =?us-ascii?q?9a23=3Ag0DM3GvXSXCtgY5zEw7rhmZU6IsnMWPMyHLVeHW?=
 =?us-ascii?q?eJntyWP6YUlar2P5dxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AxQ4CKQ7ZDWOHkepLyv2J17COxoxU+YOODRAXr68?=
 =?us-ascii?q?9hNuDEDF0OGvMi22oF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,109,1770595200"; 
   d="scan'208";a="685977433"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 09 Mar 2026 07:02:46 +0000
Received: from sjc-ads-10055.cisco.com (sjc-ads-10055.cisco.com [10.30.210.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 393811800049D;
	Mon,  9 Mar 2026 07:02:46 +0000 (GMT)
Received: by sjc-ads-10055.cisco.com (Postfix, from userid 1870532)
	id D814ACC12A6; Mon,  9 Mar 2026 00:02:45 -0700 (PDT)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com, to@cisco.com,
	Anil Dongare <adongare@cisco.com>
Subject: [OE-core] [Whinlatter] [PATCH 1/2] vim v9.1.1683: Fix CVE-2026-25749
Date: Mon,  9 Mar 2026 00:02:31 -0700
Message-ID: <20260309070233.4148849-1-adongare@cisco.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.210.59, sjc-ads-10055.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 07:02:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232678

From: Anil Dongare <adongare@cisco.com>

Upstream Repository: https://github.com/vim/vim.git

Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2026-25749
Type: Security Fix
CVE: CVE-2026-25749
Score: 6.6
Patch: https://github.com/vim/vim/commit/0714b15940b2

Signed-off-by: Anil Dongare <adongare@cisco.com>
---
 .../vim/files/CVE-2026-25749.patch            | 57 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-25749.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-25749.patch b/meta/recipes-support/vim/files/CVE-2026-25749.patch
new file mode 100644
index 0000000000..1e3779d3c4
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-25749.patch
@@ -0,0 +1,57 @@
+From 04c5e03c2c638e6c82c250f7b612eab29fe7d9ba Mon Sep 17 00:00:00 2001
+From: Christian Brabandt <cb@256bit.org>
+Date: Thu, 5 Feb 2026 18:51:54 +0000
+Subject: [PATCH] patch 9.1.2132: [security]: buffer-overflow in 'helpfile'
+ option handling
+
+Problem:  [security]: buffer-overflow in 'helpfile' option handling by
+          using strcpy without bound checks (Rahul Hoysala)
+Solution: Limit strncpy to the length of the buffer (MAXPATHL)
+
+Github Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-5w93-4g67-mm43
+
+CVE: CVE-2026-25749
+Upstream-Status: Backport [https://github.com/vim/vim/commit/0714b15940b2]
+
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+(cherry picked from commit 0714b15940b245108e6e9d7aa2260dd849a26fa9)
+Signed-off-by: Anil Dongare <adongare@cisco.com>
+---
+ src/tag.c                 | 2 +-
+ src/testdir/test_help.vim | 9 +++++++++
+ 2 files changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/src/tag.c b/src/tag.c
+index 6912e8743..a32bbb245 100644
+--- a/src/tag.c
++++ b/src/tag.c
+@@ -3348,7 +3348,7 @@ get_tagfname(
+	    if (tnp->tn_hf_idx > tag_fnames.ga_len || *p_hf == NUL)
+		return FAIL;
+	    ++tnp->tn_hf_idx;
+-	    STRCPY(buf, p_hf);
++	    vim_strncpy(buf, p_hf, MAXPATHL - 1);
+	    STRCPY(gettail(buf), "tags");
+ #ifdef BACKSLASH_IN_FILENAME
+	    slash_adjust(buf);
+diff --git a/src/testdir/test_help.vim b/src/testdir/test_help.vim
+index dac153d86..f9e4686bb 100644
+--- a/src/testdir/test_help.vim
++++ b/src/testdir/test_help.vim
+@@ -222,4 +222,13 @@ func Test_helptag_navigation()
+ endfunc
+
+
++" This caused a buffer overflow
++func Test_helpfile_overflow()
++  let _helpfile = &helpfile
++  let &helpfile = repeat('A', 5000)
++  help
++  helpclose
++  let &helpfile = _helpfile
++endfunc
++
+ " vim: shiftwidth=2 sts=2 expandtab
+--
+2.43.7
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index c730f1d0cf..044117a57f 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -16,6 +16,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://disable_acl_header_check.patch \
            file://0001-src-Makefile-improve-reproducibility.patch \
            file://no-path-adjust.patch \
+           file://CVE-2026-25749.patch \
            "
 
 PV .= ".1683"
-- 
2.44.1


