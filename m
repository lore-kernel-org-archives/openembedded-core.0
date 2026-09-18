Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 761CDC982DA
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 10:12:07 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7744.1789726324352823051
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Sep 2026 03:12:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=MdpXKZl7;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5222; q=dns/txt;
  s=iport01; t=1789726324; x=1790935924;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/4Waw1PufmU1Jw1ZGK3wrsq6JH9VPSzj9c0/GsHeNME=;
  b=MdpXKZl7vS0X51wo9T/iqy+VYqzkL5vyH/ImSabkyaw5dfXsCZGg2WvE
   vOwV0vaOkuyb86uTUXuh5ew7yzbYrU0kqqywOw5CzAcmcwLzdKXruUpDL
   nRfe+Yu7A/eMY3yVAw2V83eeqFPem5PFmZ7NA+MxJzL1ZF/SOWz2hN+xy
   r84RfozSTN4tLrCfTnfV5je8dtiu0/jqNJjlx1kwflZgCmbAumK3HxehY
   BAGJUTEcW3McRk3rlz2lkDEzeRnwOWfCHsplYa9TrOCPsY2cZjt6E0IZJ
   JbnQx3uk95siNaoFci1Gz2mw/k5mlgqKtJ28hWmsN8KChxFrFQOOEQqBa
   w==;
X-CSE-ConnectionGUID: YUUeV/aJTLKoOmdb10Di4Q==
X-CSE-MsgGUID: DkUVSk03RnuiNNxNjA56ow==
X-IPAS-Result: =?us-ascii?q?A0BFAgANDq1q/43/Ja1aglmCV3VhQkkDlkeeHhSBag8BA?=
 =?us-ascii?q?QEPRA0EAQGFBY4JAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDZASAQIBNQFGLAMBAlojIRuCZwGCdAIBEcJVgiyBAYR+2zIBCxQBB?=
 =?us-ascii?q?YEzhT+IIl0ZhHwnGxuBcoEVg2mBBQGBWwKBIwSGfgSCInoSgVoebkqRFUiBH?=
 =?us-ascii?q?gNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBBxsGBYEdgSeCGiMZNnqBCV6BK?=
 =?us-ascii?q?ylgARAXgQeCCAKCVIIBAgFJQw4HRVMJJ0EKEkcpIggSCQETGjALfhgNSBEsN?=
 =?us-ascii?q?xUZBD5uB49KH4JaAT1RAQckgQUqFkAJHhEMBaVUoQ8KKIN2jCKVOhozhVulE?=
 =?us-ascii?q?pkIizeCU5YDTSuEPoFoPIFZcBU7gmcJShkPjjmDa8w5JDULAy8BAQcCBw4DC?=
 =?us-ascii?q?4FokAACJgeBTwEB?=
IronPort-Data: A9a23:WER8LqDICapA9xVW/3jiw5YqxClBgxIJ4kV8jS/XYbTApGh0hDYFy
 DFOUG+PafmMZWH3cot/bIrk8htSv8XUydBqOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCCCM/n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXGthh
 fuo+5eBYA78h2YuWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE8shTAX9xNK8k3sVwJmRC/
 6VABDFRV0XW7w626OrTpuhEnM8vKozveYgYoHwllW2fBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGY2BPjDS0Un1lM/BJ8gleGzhmHXeDxDo1XTrq0yi4TW5FErjeC9aYuFJLRmQ+15nXumn
 WGepF7/HxA8Esy5yxPYrHWz07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KIpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:WS7wWqOwIZLcsMBcTu2jsMiBIKoaSvp037Dk7S9MoHtuA6mlfq
 +V/cjzuSWYtN9zYgBDpTn/Asm9qBrnnPYfi7X5Vo3NYOCJggeVxahZnO/fKkXbak7D398Y87
 t8eK5jD9C1J117gcHmpDScKb8bsb66GGTCv5am85+rJjsaDZ1d0w==
X-Talos-CUID: 9a23:5dv2+WyDcYzN+pwS5IoLBgUlJ/0oTDrU7kv0AEifDGpjEeW5SAOprfY=
X-Talos-MUID: =?us-ascii?q?9a23=3AK3/7Lw7QjtasZ4MHt4sUiLhFxoxE4JmQM0NVyq8?=
 =?us-ascii?q?ApsiiEzxWOR7A0jOoF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,103,1787011200"; 
   d="scan'208";a="525081986"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 18 Sep 2026 10:12:01 +0000
Received: from sjc-ads-8099.cisco.com (sjc-ads-8099.cisco.com [171.68.208.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id 7D439180001AD;
	Fri, 18 Sep 2026 10:12:01 +0000 (GMT)
Received: by sjc-ads-8099.cisco.com (Postfix, from userid 1887503)
	id 23B15CC1611; Fri, 18 Sep 2026 03:12:01 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][wrynose][PATCH v2] vim: Fix CVE-2026-28417 hostname regression
Date: Fri, 18 Sep 2026 03:12:01 -0700
Message-Id: <20260918101201.2899386-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-8099.cisco.com [171.68.208.137];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 171.68.208.137, sjc-ads-8099.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 10:12:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246208

From: Devansh Patel <devanshp@cisco.com>

The older Vim patch 9.2.0073 fixed CVE-2026-28417 by tightening netrw
hostname validation. That CVE fix requires follow-up regression patches
because it rejects valid hostnames containing optional ports or
underscores.

Vim 9.2.0340 already contains that CVE fix and patch 9.2.0089, which
corrects optional-port handling. It still needs patch 9.2.0553 to accept
underscores, so backport that commit and retain its _gateway regression
test.

The netrw history hunk is adapted to preserve Wrynose's existing
multi-line history and append the upstream 2026 May 28 entry. The
src/version.c hunk is omitted because this backport does not change the
recipe version or Vim's upstream patch-number table.

[1] https://github.com/vim/vim/commit/79348dbbc09332130f4c86045e1541d68514fcc1
[2] https://github.com/vim/vim/commit/a6198523fb28a50d96945458792cdb4787d3cdda
[3] https://github.com/vim/vim/commit/93d177cd2b69bac58fc51a5a514d7bc71e264b11
[4] https://github.com/vim/vim/security/advisories/GHSA-m3xh-9434-g336

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
Changes in v2:
- Refreshed the patch against current Wrynose so the netrw history hunk applies cleanly.
- Renamed the embedded patch because Wrynose requires only one regression commit.
- Clarified the netrw header adaptation in Backport Changes.

 .../vim/files/CVE-2026-28417-regression.patch | 65 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-28417-regression.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-28417-regression.patch b/meta/recipes-support/vim/files/CVE-2026-28417-regression.patch
new file mode 100644
index 0000000000..e5d947b737
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-28417-regression.patch
@@ -0,0 +1,65 @@
+From a058d0dcd289ddb934b30125ac732f737bf89eb7 Mon Sep 17 00:00:00 2001
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
+- Wrynose's netrw header uses a chronological change-history list instead
+  of upstream's "Last Change:" field, so add the equivalent 2026 May 28
+  history entry.
+- Omitted src/version.c because this backport does not change the recipe's
+  Vim version or its upstream patch-number table.
+
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+(cherry picked from commit 93d177cd2b69bac58fc51a5a514d7bc71e264b11)
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ runtime/pack/dist/opt/netrw/autoload/netrw.vim | 5 +++--
+ src/testdir/test_plugin_netrw.vim              | 1 +
+ 2 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/runtime/pack/dist/opt/netrw/autoload/netrw.vim b/runtime/pack/dist/opt/netrw/autoload/netrw.vim
+index c240bbd13..54be15b3f 100644
+--- a/runtime/pack/dist/opt/netrw/autoload/netrw.vim
++++ b/runtime/pack/dist/opt/netrw/autoload/netrw.vim
+@@ -24,6 +24,7 @@
+ " 2026 Mar 01 by Vim Project include portnumber in hostname checking #19533
+ " 2026 Apr 01 by Vim Project use fnameescape() with netrw#FileUrlEdit()
+ " 2026 Apr 05 by Vim Project Fix netrw#RFC2396() #19913
++" 2026 May 28 by Vim Project allow underscores in hostname checking #20344
+ " 2026 Jun 16 by Vim Project Fix filename escaping in local file deletion
+ " Copyright:  Copyright (C) 2016 Charles E. Campbell {{{1
+ "             Permission is hereby granted to use and distribute this code,
+@@ -2604,8 +2605,8 @@ function s:NetrwValidateHostname(hostname)
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
+diff --git a/src/testdir/test_plugin_netrw.vim b/src/testdir/test_plugin_netrw.vim
+index a0a3915f5..8d7167793 100644
+--- a/src/testdir/test_plugin_netrw.vim
++++ b/src/testdir/test_plugin_netrw.vim
+@@ -574,6 +574,7 @@ endfunc
+ func Test_netrw_hostname()
+   let valid_hostnames = [
+   \   'localhost',
++  \   '_gateway',
+   \   '127.0.0.1',
+   \   '::1',
+   \   '0:0:0:0:0:0:0:1',
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 77f681410a..ce02c8b92d 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -45,6 +45,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-73076.patch \
            file://CVE-2026-73077.patch \
            file://CVE-2026-73078.patch \
+           file://CVE-2026-28417-regression.patch \
            "
 
 PV .= ".0340"

