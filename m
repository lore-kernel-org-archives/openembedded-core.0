Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07A85C433FE
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 07:24:24 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web10.5734.1646119462668668031
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 23:24:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: liezhi.yang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 2217OLno007003
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 23:24:21 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 28 Feb 2022 23:24:21 -0800
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 28 Feb 2022 23:24:21 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/1] coreutils: fix statx failure on native builds
Date: Mon, 28 Feb 2022 23:24:20 -0800
Message-ID: 
 <373dcd3613b74ba10dba54f5116576bc172c222f.1646119426.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1646119426.git.liezhi.yang@windriver.com>
References: <cover.1646119426.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Mar 2022 07:24:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162525

From: Davi Poyastro <davi.poyastro@nokia.com>

Coreutils configure only checks glibc compatibility for statx
syscall but fail to check kernel support.

Fixed on RedHat Enterprise Linux Server 7.6 (Maipo)
Host kernel: 3.10.0-1127.8.2.el7.x86_64
Docker distro: Ubuntu 20.04.1 LTS

$ bitbake coreutils-native
find the binary ls and run it as "ls -l ."
The result is something like: "?????????. ? ? ? ? ? foo"

Signed-off-by: Davi Poyastro <davi.poyastro@nokia.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/coreutils/coreutils_9.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/coreutils/coreutils_9.0.bb b/meta/recipes-core/coreutils/coreutils_9.0.bb
index e4633949f42..40fad72bbf4 100644
--- a/meta/recipes-core/coreutils/coreutils_9.0.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.0.bb
@@ -152,6 +152,11 @@ ALTERNATIVE_LINK_NAME[kill.1] = "${mandir}/man1/kill.1"
 ALTERNATIVE_LINK_NAME[stat.1] = "${mandir}/man1/stat.1"
 
 python __anonymous() {
+    from distutils.version import LooseVersion
+    # statx syscall require glibc >= 2.28 and linux kernel >= 4.11
+    if LooseVersion(os.uname().release) < LooseVersion('4.11'):
+        d.appendVar("EXTRA_OECONF_class-native", " ac_cv_func_statx=0")
+
     for prog in d.getVar('base_bindir_progs').split():
         d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('base_bindir'), prog))
 
-- 
2.31.1


