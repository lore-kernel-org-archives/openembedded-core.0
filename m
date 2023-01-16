Return-Path: <throos@amazon.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38DAFC46467
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 14:31:08 +0000 (UTC)
Received: from smtp-fw-9102.amazon.com (smtp-fw-9102.amazon.com [207.171.184.29])
 by mx.groups.io with SMTP id smtpd.web10.167669.1673879462452175660
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jan 2023 06:31:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amazon.de header.s=amazon201209 header.b=gweeSzkZ;
 spf=pass (domain: amazon.de, ip: 207.171.184.29, mailfrom: prvs=373bc1990=throos@amazon.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1673879463; x=1705415463;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zL4eWmD5AKiB5nq7+USauUz31J/x1/uLGQTsOU4VLQc=;
  b=gweeSzkZWM3yqnNANuOkMTy8wF4JZCjYB+hAxBAh7y/zsmVMmIuhBxAY
   IfbzFdfzOZl9js71IY6qlMZ/BB70L9Eu/5gwfRAhX+lluOFarM1Xn+NPC
   /AJDlzW2dXsQzIDVvJBXkrK5B+8kc4Yk+sdhP0pb1IxNyOrwl6l3PMSxP
   k=;
X-IronPort-AV: E=Sophos;i="5.97,221,1669075200"; 
   d="scan'208";a="300795035"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO email-inbound-relay-pdx-2c-m6i4x-8c5b1df3.us-west-2.amazon.com) ([10.25.36.210])
  by smtp-border-fw-9102.sea19.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2023 14:30:57 +0000
Received: from EX13D51EUC004.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
	by email-inbound-relay-pdx-2c-m6i4x-8c5b1df3.us-west-2.amazon.com (Postfix) with ESMTPS id CC9F6416B9
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 14:30:55 +0000 (UTC)
Received: from EX19D016EUC001.ant.amazon.com (10.252.51.169) by
 EX13D51EUC004.ant.amazon.com (10.43.164.84) with Microsoft SMTP Server (TLS)
 id 15.0.1497.45; Mon, 16 Jan 2023 14:30:35 +0000
Received: from u182adcbddbfb55.ant.amazon.com (10.43.161.198) by
 EX19D016EUC001.ant.amazon.com (10.252.51.169) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.7; Mon, 16 Jan 2023 14:30:33 +0000
From: <throos@amazon.de>
To: <openembedded-core@lists.openembedded.org>
CC: Thomas Roos <throos@amazon.de>
Subject: [PATCH] devtool: fix devtool finish when gitmodules file is empty
Date: Mon, 16 Jan 2023 15:30:22 +0100
Message-ID: <20230116143022.203889-1-throos@amazon.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.43.161.198]
X-ClientProxiedBy: EX13D36UWA001.ant.amazon.com (10.43.160.71) To
 EX19D016EUC001.ant.amazon.com (10.252.51.169)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 14:31:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175986

From: Thomas Roos <throos@amazon.de>

When a .gitmodules file is exsisting, but empty then devtool finish fails.
This fix is adding an additional check for this.

[YOCTO #14999]

Signed-off-by: Thomas Roos <throos@amazon.de>
---
 meta/classes/externalsrc.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 0deb5dbf5f..26c5803ee6 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -230,7 +230,7 @@ def srctree_hash_files(d, srcdir=None):
             env['GIT_INDEX_FILE'] = tmp_index.name
             subprocess.check_output(['git', 'add', '-A', '.'], cwd=s_dir, env=env)
             git_sha1 = subprocess.check_output(['git', 'write-tree'], cwd=s_dir, env=env).decode("utf-8")
-            if os.path.exists(os.path.join(s_dir, ".gitmodules")):
+            if os.path.exists(os.path.join(s_dir, ".gitmodules")) and os.path.getsize(os.path.join(s_dir, ".gitmodules")) > 0:
                 submodule_helper = subprocess.check_output(["git", "config", "--file", ".gitmodules", "--get-regexp", "path"], cwd=s_dir, env=env).decode("utf-8")
                 for line in submodule_helper.splitlines():
                     module_dir = os.path.join(s_dir, line.rsplit(maxsplit=1)[1])
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





