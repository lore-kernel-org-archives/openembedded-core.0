Return-Path: <throos@amazon.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 294D5C64EC4
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 09:19:15 +0000 (UTC)
Received: from smtp-fw-9103.amazon.com (smtp-fw-9103.amazon.com [207.171.188.200])
 by mx.groups.io with SMTP id smtpd.web10.19401.1677835146535132547
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Mar 2023 01:19:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amazon.de header.s=amazon201209 header.b=D2lAFkjg;
 spf=pass (domain: amazon.de, ip: 207.171.188.200, mailfrom: prvs=4195db054=throos@amazon.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1677835146; x=1709371146;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fmsXQ4ZlRZRNgFNKlNWGjbNyboPnHZLpaA0RVK9T7VA=;
  b=D2lAFkjgiYCpr7I4yvQmVlpW7Y8M1TWpym2Tp8xe3/7PPdrRvNAtuHE3
   87lme7YZaSFxWQWTqlAtddAqn1lLXGI9dcWtehNHZ/PFrOZGKepydf3Zj
   q0MVxx0elvT4KuZY+FPUUKXKRnZkd/wuqHu9YzT/Xyusj1X8CLJBl+U/P
   Q=;
X-IronPort-AV: E=Sophos;i="5.98,230,1673913600"; 
   d="scan'208";a="1108994629"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO email-inbound-relay-iad-1e-m6i4x-3e1fab07.us-east-1.amazon.com) ([10.25.36.214])
  by smtp-border-fw-9103.sea19.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2023 09:18:59 +0000
Received: from EX19D016EUC001.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
	by email-inbound-relay-iad-1e-m6i4x-3e1fab07.us-east-1.amazon.com (Postfix) with ESMTPS id 4871F811B6
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Mar 2023 09:18:57 +0000 (UTC)
Received: from u182adcbddbfb55.ant.amazon.com (10.1.213.17) by
 EX19D016EUC001.ant.amazon.com (10.252.51.169) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.24; Fri, 3 Mar 2023 09:18:55 +0000
From: <throos@amazon.de>
To: <openembedded-core@lists.openembedded.org>
CC: Thomas Roos <throos@amazon.de>
Subject: [PATCH] qemuboot-x86.inc: allow overwrite of QB_CPU To test nested kvm with qemu QB_CPU* needs to be modified. E.g. set to "-cpu Haswell-noTSX-IBRS,vmx=on"
Date: Fri, 3 Mar 2023 10:18:44 +0100
Message-ID: <20230303091844.154993-1-throos@amazon.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.1.213.17]
X-ClientProxiedBy: EX19D041UWA003.ant.amazon.com (10.13.139.105) To
 EX19D016EUC001.ant.amazon.com (10.252.51.169)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 09:19:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177982

From: Thomas Roos <throos@amazon.de>

This allows to overwrite this from local.conf etc.

Signed-off-by: Thomas Roos <throos@amazon.de>
---
 meta/conf/machine/include/x86/qemuboot-x86.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/machine/include/x86/qemuboot-x86.inc b/meta/conf/machine/include/x86/qemuboot-x86.inc
index dd7e7c9384..6ae03633ae 100644
--- a/meta/conf/machine/include/x86/qemuboot-x86.inc
+++ b/meta/conf/machine/include/x86/qemuboot-x86.inc
@@ -1,11 +1,11 @@
 # For runqemu
 IMAGE_CLASSES += "qemuboot"
 QB_SMP ?= "-smp 4"
-QB_CPU:x86 = "-cpu IvyBridge -machine q35,i8042=off"
-QB_CPU_KVM:x86 = "-cpu IvyBridge -machine q35,i8042=off"
+QB_CPU:x86 ?= "-cpu IvyBridge -machine q35,i8042=off"
+QB_CPU_KVM:x86 ?= "-cpu IvyBridge -machine q35,i8042=off"
 
-QB_CPU:x86-64 = "-cpu IvyBridge -machine q35,i8042=off"
-QB_CPU_KVM:x86-64 = "-cpu IvyBridge -machine q35,i8042=off"
+QB_CPU:x86-64 ?= "-cpu IvyBridge -machine q35,i8042=off"
+QB_CPU_KVM:x86-64 ?= "-cpu IvyBridge -machine q35,i8042=off"
 
 QB_AUDIO_DRV = "alsa"
 QB_AUDIO_OPT = "-device AC97"
-- 
2.25.1




Amazon Web Services EMEA SARL
38 avenue John F. Kennedy, L-1855 Luxembourg
Sitz der Gesellschaft: L-1855 Luxemburg
eingetragen im Luxemburgischen Handelsregister unter R.C.S. B186284

Amazon Web Services EMEA SARL, Niederlassung Deutschland
Marcel-Breuer-Str. 12, D-80807 Muenchen
Sitz der Zweigniederlassung: Muenchen
eingetragen im Handelsregister des Amtsgerichts Muenchen unter HRB 242240, USt-ID DE317013094





