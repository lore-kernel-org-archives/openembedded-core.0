Return-Path: <throos@amazon.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51011C77B6E
	for <webhook@archiver.kernel.org>; Fri, 14 Apr 2023 14:34:42 +0000 (UTC)
Received: from smtp-fw-80006.amazon.com (smtp-fw-80006.amazon.com [99.78.197.217])
 by mx.groups.io with SMTP id smtpd.web11.11171.1681482874037599431
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Apr 2023 07:34:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amazon.de header.s=amazon201209 header.b=wBGYqro+;
 spf=pass (domain: amazon.de, ip: 99.78.197.217, mailfrom: prvs=461effbcb=throos@amazon.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1681482874; x=1713018874;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gmHGm2O4dDBZjQpTO3oUMLMS1Hq2k4xSM0LWSYvu/ok=;
  b=wBGYqro+6zXV05ummPPb0Q5HREwqLnjdC7gud3kKfnzyte4MFbeMnctY
   wpZesYZjf2llQYPC1c8+91C5VlSGJtx0A9xcxFWVi/3onWkYBjti9G6GL
   83wmN1tcwPKIS61brHD+TvgPEqfcrKdUnlt0tJZgDP1BcdVGxAbq62aXd
   c=;
X-IronPort-AV: E=Sophos;i="5.99,197,1677542400"; 
   d="scan'208";a="204508312"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO email-inbound-relay-iad-1a-m6i4x-96feee09.us-east-1.amazon.com) ([10.25.36.210])
  by smtp-border-fw-80006.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 14:34:31 +0000
Received: from EX19D016EUC001.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
	by email-inbound-relay-iad-1a-m6i4x-96feee09.us-east-1.amazon.com (Postfix) with ESMTPS id A38EE438AE
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Apr 2023 14:34:30 +0000 (UTC)
Received: from u182adcbddbfb55.ant.amazon.com (10.85.99.97) by
 EX19D016EUC001.ant.amazon.com (10.252.51.169) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 14 Apr 2023 14:34:28 +0000
From: <throos@amazon.de>
To: <openembedded-core@lists.openembedded.org>
CC: Thomas Roos <throos@amazon.de>
Subject: [PATCH] oeqa/utils/metadata.py: Fix running oe-selftest running with no distro set
Date: Fri, 14 Apr 2023 16:34:17 +0200
Message-ID: <20230414143417.310198-1-throos@amazon.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.85.99.97]
X-ClientProxiedBy: EX19D037UWC003.ant.amazon.com (10.13.139.231) To
 EX19D016EUC001.ant.amazon.com (10.252.51.169)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Apr 2023 14:34:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179999

From: Thomas Roos <throos@amazon.de>

This will use default values when no distribution is set.

[YOCTO #15086]

Signed-off-by: Thomas Roos <throos@amazon.de>
---
 meta/lib/oeqa/utils/metadata.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/utils/metadata.py b/meta/lib/oeqa/utils/metadata.py
index 8013aa684d..15ec190c4a 100644
--- a/meta/lib/oeqa/utils/metadata.py
+++ b/meta/lib/oeqa/utils/metadata.py
@@ -27,9 +27,9 @@ def metadata_from_bb():
     data_dict = get_bb_vars()
 
     # Distro information
-    info_dict['distro'] = {'id': data_dict['DISTRO'],
-                           'version_id': data_dict['DISTRO_VERSION'],
-                           'pretty_name': '%s %s' % (data_dict['DISTRO'], data_dict['DISTRO_VERSION'])}
+    info_dict['distro'] = {'id': data_dict.get('DISTRO', 'NODISTRO'),
+                                'version_id': data_dict.get('DISTRO_VERSION', 'NO_DISTRO_VERSION'),
+                                'pretty_name': '%s %s' % (data_dict.get('DISTRO', 'NODISTRO'), data_dict.get('DISTRO_VERSION', 'NO_DISTRO_VERSION'))}
 
     # Host distro information
     os_release = get_os_release()
-- 
2.34.1




Amazon Web Services EMEA SARL
38 avenue John F. Kennedy, L-1855 Luxembourg
Sitz der Gesellschaft: L-1855 Luxemburg
eingetragen im Luxemburgischen Handelsregister unter R.C.S. B186284

Amazon Web Services EMEA SARL, Niederlassung Deutschland
Marcel-Breuer-Str. 12, D-80807 Muenchen
Sitz der Zweigniederlassung: Muenchen
eingetragen im Handelsregister des Amtsgerichts Muenchen unter HRB 242240, USt-ID DE317013094





