Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98E00C433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 07:38:40 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web10.19554.1644219519394099054
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 23:38:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: kai.kang@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 2177ccGu027000
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Sun, 6 Feb 2022 23:38:38 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 2177ccsa011002
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Sun, 6 Feb 2022 23:38:38 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 6 Feb 2022 23:38:37 -0800
Received: from pek-kkang-d1.wrs.com (128.224.162.156) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Sun, 6 Feb 2022 23:38:37 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Kai Kang <kai.kang@windriver.com>
Subject: [PATCH] toolchain-scripts.bbclass: use double quotes for exported PS1
Date: Mon, 7 Feb 2022 15:38:34 +0800
Message-ID: <20220207073834.2270628-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Feb 2022 07:38:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161440

From: Kai Kang <kai.kang@windriver.com>

Use double quotes("") rather than single quotes('') for PS1 in
EXPORT_SDK_PS1 which will be exported in SDK environment file. Then it
could set PS1 for SDK env with some variables in host env, such as the
original PS1. The SDK PS1 could be some distinct words plus original PS1
rather than replace the whole original PS1. For example, it could set in
local.conf with

SDK_PS1 = "(oesdk) \${PS1}"

then it just prepends '(oesdk) ' before original PS1 after source the
SDK environment file.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/classes/toolchain-scripts.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index fb6261c91d..8f914cce27 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -8,7 +8,7 @@ TARGET_CC_ARCH:append:libc-musl = " -mmusl"
 # default debug prefix map isn't valid in the SDK
 DEBUG_PREFIX_MAP = ""
 
-EXPORT_SDK_PS1 = "${@ 'export PS1=\'%s\'' % d.getVar('SDK_PS1') if d.getVar('SDK_PS1') else ''}"
+EXPORT_SDK_PS1 = "${@ 'export PS1=\\"%s\\"' % d.getVar('SDK_PS1') if d.getVar('SDK_PS1') else ''}"
 
 # This function creates an environment-setup-script for use in a deployable SDK
 toolchain_create_sdk_env_script () {
-- 
2.33.0


