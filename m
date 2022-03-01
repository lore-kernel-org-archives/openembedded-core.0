Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55C19C433FE
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 09:13:51 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web11.6232.1646126030572014759
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 01:13:50 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: liezhi.yang@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 2219Dm5J017890
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 1 Mar 2022 01:13:48 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 2219Dlgq019748
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 1 Mar 2022 01:13:48 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 1 Mar 2022 01:13:47 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 1 Mar 2022 01:13:47 -0800
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 1 Mar 2022 01:13:47 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2 1/1] coreutils: Disable statx for native build
Date: Tue, 1 Mar 2022 01:13:47 -0800
Message-ID: 
 <f1ea35e3fb1b3f6714c709929f51fda5a29e9d2b.1646126004.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1646126004.git.liezhi.yang@windriver.com>
References: <cover.1646126004.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Mar 2022 09:13:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162536

The statx requires glibc >= 2.28 and linux kernel >= 4.11, but coreutils's
configure only checks glibc compatibility for statx syscall but fail to check
kernel support, e.g.:

RedHat Enterprise Linux Server 7.6 (Maipo)
Host kernel: 3.10.0-1127.8.2.el7.x86_64
Docker OS: Ubuntu 20.04.1 LTS

$ bitbake coreutils-native
find the binary ls and run it as "ls -l ."
The result is something like: "?????????. ? ? ? ? ? foo"

This is because glibc is 2.31 (Ubunut 20.04 in docker) which has statx,
but host's kernel is 3.10.0 (CentOS 7) which doesn't support statx.

Disable statx for native build to fix the problem.

Original from: Davi Poyastro <davi.poyastro@nokia.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/coreutils/coreutils_9.0.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-core/coreutils/coreutils_9.0.bb b/meta/recipes-core/coreutils/coreutils_9.0.bb
index e4633949f42..e4a948c7e5f 100644
--- a/meta/recipes-core/coreutils/coreutils_9.0.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.0.bb
@@ -151,6 +151,13 @@ ALTERNATIVE_LINK_NAME[uptime.1] = "${mandir}/man1/uptime.1"
 ALTERNATIVE_LINK_NAME[kill.1] = "${mandir}/man1/kill.1"
 ALTERNATIVE_LINK_NAME[stat.1] = "${mandir}/man1/stat.1"
 
+# The statx() requires glibc >= 2.28 and linux kernel >= 4.11, it doesn't work
+# when glibc >= 2.28 ((Ubuntu 20.04 in docker) and kernel < 4.11 (Host OS
+# CentOS 7), we can check kernel version and disable it, but that would cause
+# two different signatures for coreutils-native, so disable it unconditionally
+# for deterministic build.
+EXTRA_OECONF:append:class-native = " ac_cv_func_statx=0"
+
 python __anonymous() {
     for prog in d.getVar('base_bindir_progs').split():
         d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('base_bindir'), prog))
-- 
2.31.1


