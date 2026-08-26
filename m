Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8E22C61DD3
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 05:30:26 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6158.1787722219337362624
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 22:30:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=E944NdeN;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=8828; q=dns/txt;
  s=iport01; t=1787722219; x=1788931819;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AElnE2nujlGjoUJ4VcxgGzPdd2sry8Jwr7/KRu425aQ=;
  b=E944NdeNdMoOpBki2lol1mPtvLmpLt3tMEA7xD0mtzUXbQaM2IhpgaHN
   KDQuaPcJqdTFXiowM9s9gfExUqjjkjL7kiCKGC1NUPHIUqlk4rJlPgB/u
   Xxa4wyqgrUqtw2U/VgCucVggqLB1lpVwCsCsx0wptbuFScqFcCq2Y0aG6
   wBHGnYBN8l6msOT5FcqiH3dkuwju6OpK/3dnOirBw9HymUo6HVZR0BEuM
   M6qWojYVOzbCZFGSrkxB7aHTLUsfoheiC6t5anXrVc11CnuUM4axFsITk
   93OnAG6/NDjaf5jcV37kzv6wRWCJJCIQq8DqWoOU6he1mRYAWYBjr4Mq1
   A==;
X-CSE-ConnectionGUID: i1H4Dr6SRf+EcnVv2g4sEg==
X-CSE-MsgGUID: db894J2nRb6MOKNIK95Ymg==
X-IPAS-Result: =?us-ascii?q?A0CEAgB8eY5q/5AQJK1aglmCV3ReQ0kDlkeDAZsdFIFqD?=
 =?us-ascii?q?wEBAQ9EDQQBAYUFjW4CJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2GWgECATUBRiwDAQIWA0EjGAkbgmcBgjoDNwMRvkWCLIEBhH3bM?=
 =?us-ascii?q?AELFAEFgTOFP4giXRmEfCcbG4FygRWDaYEFAYEZQgKBGQp8EYV1BIIigQyBW?=
 =?us-ascii?q?h6CTI8eSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4ENGwYFgR2BKIQQI?=
 =?us-ascii?q?xk2fIEJXoErKWABEheBCYIHAoJaggUCAUlDDgdHPgsYDUgRLDcUGQQ+bgeOa?=
 =?us-ascii?q?x+BV3EBAYENASuBBRMXFkAGAx4RCwEFkxOSQaEPCiiDdowilToaM4QEgVelE?=
 =?us-ascii?q?ZkIglmIXoJTllArhD6BaDwigTdwFYMiCUoZD444g2vMGCEnMgsDLwEBBwIHD?=
 =?us-ascii?q?gMLgWiQAiQJgU8BAQ?=
IronPort-Data: A9a23:WKxUkqxnsp76AJZoBpZ6t+dhxyrEfRIJ4+MujC+fZmUNrF6WrkVUy
 GIWW2rSbvmOZ2byeo9/a4ix8B8P7JPUy9RnGwQ+/1hgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 46aT/H3Ygf/hWYkaDxMsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJEBvHdE04LhMO28N2
 PceFi5XYUyYqu3jldpXSsE07igiBMDvOIVavjRryivUSK55B5vCWK7No9Rf2V/chOgXQq2YP
 JRfMGQpNUicC/FMEg9/5JYWkOq2j3/kcyVwo1OOrq1x6G/WpOB0+Oi0YIuMI4DVFa25mG6Ur
 DKXo0ajBCsQavm46hyk0SPxt+rAyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NUF+t/7ESGzbDZpl7GQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:TjMj9KPC5DAtiMBcTu2jsMiBIKoaSvp037Dk7S9MoHtuA6mlfq
 +V/cjzuSWYtN9zYgBDpTn/Asm9qBrnnPYfi7X5Vo3NYOCJggeVxahZnO/fKkXbak7D398Y87
 t8eK5jD9C1J117gcHmpDScKb8bsb66GGTCv5am85+rJjsaDZ1d0w==
X-Talos-CUID: =?us-ascii?q?9a23=3ATPdalGlIlbJuKEYuDoWcsqOhrNrXOXyE7Cv8ORG?=
 =?us-ascii?q?DM2gqZbaTd0HK9/9/vsU7zg=3D=3D?=
X-Talos-MUID: 9a23:l1I3tQTfu4i2MVsARXTgjmEzaOUy5Z6kVmUqsrMnmJjZBCl/bmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,244,1779148800"; 
   d="scan'208";a="818911478"
Received: from alln-l-core-07.cisco.com ([173.36.16.144])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Aug 2026 05:30:18 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-07.cisco.com (Postfix) with ESMTPS id 5D8171800037B;
	Wed, 26 Aug 2026 05:30:18 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id F3340CC12A7; Tue, 25 Aug 2026 22:30:17 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH] vim: Fix CVE-2026-28417 regressions
Date: Tue, 25 Aug 2026 22:30:17 -0700
Message-Id: <20260826053017.51248-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 05:30:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244289

From: Devansh Patel <devanshp@cisco.com>

The older Vim patch 9.2.0073 fixed CVE-2026-28417 by tightening netrw
hostname validation. That CVE fix requires two regression patches
because it rejects valid hostnames that include an optional port or an
underscore.

Backport Vim patches 9.2.0089 and 9.2.0553 in that order. They restore
optional-port and underscore handling while retaining the stricter
validation introduced by the original CVE fix.

Scarthgap's Vim 9.1.1683 source does not contain
test_plugin_netrw.vim, so the upstream test hunks are omitted. The
src/version.c hunks are also omitted because this backport does not
change the recipe version or Vim's upstream patch-number table.

[1] https://github.com/vim/vim/commit/79348dbbc09332130f4c86045e1541d68514fcc1
[2] https://github.com/vim/vim/commit/a6198523fb28a50d96945458792cdb4787d3cdda
[3] https://github.com/vim/vim/commit/93d177cd2b69bac58fc51a5a514d7bc71e264b11
[4] https://github.com/vim/vim/security/advisories/GHSA-m3xh-9434-g336

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 .../files/CVE-2026-28417-regression_p1.patch  | 78 +++++++++++++++++++
 .../files/CVE-2026-28417-regression_p2.patch  | 53 +++++++++++++
 meta/recipes-support/vim/vim.inc              |  2 +
 3 files changed, 133 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-28417-regression_p1.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-28417-regression_p2.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-28417-regression_p1.patch b/meta/recipes-support/vim/files/CVE-2026-28417-regression_p1.patch
new file mode 100644
index 0000000000..0289614bfe
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-28417-regression_p1.patch
@@ -0,0 +1,78 @@
+From a6e9906380af2b51ea4b77234ef77b14cc712f2c Mon Sep 17 00:00:00 2001
+From: Miguel Barro <miguel.barro@live.com>
+Date: Sun, 1 Mar 2026 19:32:29 +0000
+Subject: [PATCH] patch 9.2.0089: netrw: does not take port into account in
+ hostname validation
+
+Problem:  netrw: does not take port into account in hostname validation
+          (after v9.2.0073)
+Solution: Update hostname validation check and test for an optional port
+          number (Miguel Barro)
+
+closes: #19533
+
+CVE: CVE-2026-28417
+Upstream-Status: Backport [https://github.com/vim/vim/commit/a6198523fb28a50d96945458792cdb4787d3cdda]
+
+Backport Changes:
+- Omitted src/testdir/test_plugin_netrw.vim because this test file is not
+  present in the Vim 9.1.1683 source used by Scarthgap.
+- Omitted src/version.c because this backport does not change the recipe's
+  Vim version or its upstream patch-number table.
+
+Signed-off-by: Miguel Barro <miguel.barro@live.com>
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+(cherry picked from commit a6198523fb28a50d96945458792cdb4787d3cdda)
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ runtime/pack/dist/opt/netrw/autoload/netrw.vim | 18 +++++++++++-------
+ 1 file changed, 11 insertions(+), 7 deletions(-)
+
+diff --git a/runtime/pack/dist/opt/netrw/autoload/netrw.vim b/runtime/pack/dist/opt/netrw/autoload/netrw.vim
+index 1b790d250..69eababf1 100644
+--- a/runtime/pack/dist/opt/netrw/autoload/netrw.vim
++++ b/runtime/pack/dist/opt/netrw/autoload/netrw.vim
+@@ -6,6 +6,7 @@
+ " 2025 Aug 07 by Vim Project (netrw#BrowseX() distinguishes remote files #17794)
+ " 2025 Aug 22 by Vim Project netrw#Explore handle terminal correctly #18069
+ " 2026 Feb 27 by Vim Project Make the hostname validation more strict
++" 2026 Mar 01 by Vim Project include portnumber in hostname checking #19533
+ " Copyright:  Copyright (C) 2016 Charles E. Campbell {{{1
+ "             Permission is hereby granted to use and distribute this code,
+ "             with or without modifications, provided that this copyright
+@@ -2575,7 +2576,8 @@ endfunction
+ 
+ " s:NetrwValidateHostname:  Validate that the hostname is valid {{{2
+ " Input:
+-"   hostname, may include an optional username, e.g. user@hostname
++"   hostname, may include an optional username and port number, e.g.
++"       user@hostname:port
+ "   allow a alphanumeric hostname or an IPv(4/6) address
+ " Output:
+ "  true if g:netrw_machine is valid according to RFC1123 #Section 2
+@@ -2584,17 +2586,19 @@ function s:NetrwValidateHostname(hostname)
+   let user_pat = '\%([a-zA-Z0-9._-]\+@\)\?'
+   " Hostname: 1-64 chars, alphanumeric/dots/hyphens.
+   " No underscores. No leading/trailing dots/hyphens.
+-  let host_pat = '[a-zA-Z0-9]\%([-a-zA-Z0-9.]{,62}[a-zA-Z0-9]\)\?$'
++  let host_pat = '[a-zA-Z0-9]\%([-a-zA-Z0-9.]\{0,62}[a-zA-Z0-9]\)\?'
++  " Port: 16 bit unsigned integer
++  let port_pat = '\%(:\d\{1,5\}\)\?$'
+ 
+   " IPv4: 1-3 digits separated by dots
+-  let ipv4_pat = '\%(\d\{1,3}\.\)\{3\}\d\{1,3\}$'
++  let ipv4_pat = '\%(\d\{1,3}\.\)\{3\}\d\{1,3\}'
+ 
+   " IPv6: Hex, colons, and optional brackets
+-  let ipv6_pat = '\[\?\%([a-fA-F0-9:]\{2,}\)\+\]\?$'
++  let ipv6_pat = '\[\?\%([a-fA-F0-9:]\{2,}\)\+\]\?'
+ 
+-  return a:hostname =~? '^'.user_pat.host_pat ||
+-       \ a:hostname =~? '^'.user_pat.ipv4_pat ||
+-       \ a:hostname =~? '^'.user_pat.ipv6_pat
++  return a:hostname =~? '^'.user_pat.host_pat.port_pat ||
++       \ a:hostname =~? '^'.user_pat.ipv4_pat.port_pat ||
++       \ a:hostname =~? '^'.user_pat.ipv6_pat.port_pat
+ endfunction
+ 
+ " NetUserPass: set username and password for subsequent ftp transfer {{{2
diff --git a/meta/recipes-support/vim/files/CVE-2026-28417-regression_p2.patch b/meta/recipes-support/vim/files/CVE-2026-28417-regression_p2.patch
new file mode 100644
index 0000000000..e33c64ac91
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-28417-regression_p2.patch
@@ -0,0 +1,53 @@
+From 047b5dfc3213a42d7db960569f53b37e332f3c76 Mon Sep 17 00:00:00 2001
+From: Christian Brabandt <cb@256bit.org>
+Date: Thu, 28 May 2026 20:53:53 +0000
+Subject: [PATCH] patch 9.2.0553: runtime(netrw): netrw rejects hostnames
+ containing _
+
+Problem:  runtime(netrw): netrw rejects hostnames containing _
+          (lilydjwg)
+Solution: Relax the restriction and allow the underscore
+
+fixes: #20344
+
+CVE: CVE-2026-28417
+Upstream-Status: Backport [https://github.com/vim/vim/commit/93d177cd2b69bac58fc51a5a514d7bc71e264b11]
+
+Backport Changes:
+- Preserved Scarthgap's multi-line netrw change history and appended the
+  upstream 2026 May 28 change instead of replacing it with a single date.
+- Omitted src/testdir/test_plugin_netrw.vim because this test file is not
+  present in the Vim 9.1.1683 source used by Scarthgap.
+- Omitted src/version.c because this backport does not change the recipe's
+  Vim version or its upstream patch-number table.
+
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+(cherry picked from commit 93d177cd2b69bac58fc51a5a514d7bc71e264b11)
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ runtime/pack/dist/opt/netrw/autoload/netrw.vim | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/runtime/pack/dist/opt/netrw/autoload/netrw.vim b/runtime/pack/dist/opt/netrw/autoload/netrw.vim
+index 69eababf1..58aecc81e 100644
+--- a/runtime/pack/dist/opt/netrw/autoload/netrw.vim
++++ b/runtime/pack/dist/opt/netrw/autoload/netrw.vim
+@@ -7,6 +7,7 @@
+ " 2025 Aug 22 by Vim Project netrw#Explore handle terminal correctly #18069
+ " 2026 Feb 27 by Vim Project Make the hostname validation more strict
+ " 2026 Mar 01 by Vim Project include portnumber in hostname checking #19533
++" 2026 May 28 by Vim Project allow underscores in hostname checking #20344
+ " Copyright:  Copyright (C) 2016 Charles E. Campbell {{{1
+ "             Permission is hereby granted to use and distribute this code,
+ "             with or without modifications, provided that this copyright
+@@ -2585,8 +2586,8 @@ function s:NetrwValidateHostname(hostname)
+   " Username:
+   let user_pat = '\%([a-zA-Z0-9._-]\+@\)\?'
+   " Hostname: 1-64 chars, alphanumeric/dots/hyphens.
+-  " No underscores. No leading/trailing dots/hyphens.
+-  let host_pat = '[a-zA-Z0-9]\%([-a-zA-Z0-9.]\{0,62}[a-zA-Z0-9]\)\?'
++  " No leading/trailing dots/hyphens.
++  let host_pat = '[a-zA-Z0-9_]\%([-a-zA-Z0-9._]\{0,62}[a-zA-Z0-9_]\)\?'
+   " Port: 16 bit unsigned integer
+   let port_pat = '\%(:\d\{1,5\}\)\?$'
+ 
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index ec2cedc965..83589d729e 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -30,6 +30,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-28421.patch \
            file://CVE-2026-32249.patch \
            file://CVE-2026-28417.patch \
+           file://CVE-2026-28417-regression_p1.patch \
+           file://CVE-2026-28417-regression_p2.patch \
            file://CVE-2026-45130.patch \
            file://CVE-2026-46483.patch \
            file://CVE-2026-28420.patch \
-- 
2.35.6

