Return-Path: <oobitots@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC2B0C433F5
	for <webhook@archiver.kernel.org>; Wed, 29 Dec 2021 14:42:15 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.web08.52185.1640788934433804532
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Dec 2021 06:42:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=iSHc43Ab;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: oobitots@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=868; q=dns/txt; s=iport;
  t=1640788934; x=1641998534;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+//92xy3iKHuxdt9HgAE9aCsbX1EltZ/Skq2jvRzbmo=;
  b=iSHc43AbqXJmnBYC8iVHR1W3qDSe3U0PC+jZXrt+wC04fl7Lw0IfgmEc
   t0yuaCcuzvvytI6DFss9KMprsj5Dj+E3hDMkhGtAN2mgKCnpLSCUznfcT
   zrU5OSV5CWIoNkbNxcZEd6PfPH5hW4IB+fzlVH3J0z28zLrgljlPFlRpz
   Q=;
X-IronPort-AV: E=Sophos;i="5.88,245,1635206400";
   d="scan'208";a="977704931"
Received: from alln-core-5.cisco.com ([173.36.13.138])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 29 Dec 2021 14:42:13 +0000
Received: from sjc-ads-1466.cisco.com (sjc-ads-1466.cisco.com [171.70.59.158])
	by alln-core-5.cisco.com (8.15.2/8.15.2) with ESMTPS id 1BTEgD5X021713
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 29 Dec 2021 14:42:13 GMT
Received: by sjc-ads-1466.cisco.com (Postfix, from userid 500841)
	id E5678CC128E; Wed, 29 Dec 2021 06:42:12 -0800 (PST)
From: Oleksiy Obitotskyy <oobitots@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksiy Obitotskyy <oobitots@cisco.com>
Subject: [PATCH] package_manager: ipk: Fix host manifest generation
Date: Wed, 29 Dec 2021 06:42:03 -0800
Message-Id: <20211229144203.3534461-1-oobitots@cisco.com>
X-Mailer: git-send-email 2.26.2.Cisco
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.70.59.158, sjc-ads-1466.cisco.com
X-Outbound-Node: alln-core-5.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Dec 2021 14:42:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160050

Since honister host manifest stopped to generate, i.e.
manifest file is empty but all ipks/files into sdk is
ok.

Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
---
 meta/lib/oe/sdk.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index 37b59afd1a..27347667e8 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -115,6 +115,10 @@ def sdk_list_installed_packages(d, target, rootfs_dir=None):
 
         rootfs_dir = [sdk_output, os.path.join(sdk_output, target_path)][target is True]
 
+    if target is False:
+        ipkgconf_sdk_target = d.getVar("IPKGCONF_SDK")
+        d.setVar("IPKGCONF_TARGET", ipkgconf_sdk_target)
+
     img_type = d.getVar('IMAGE_PKGTYPE')
     import importlib
     cls = importlib.import_module('oe.package_manager.' + img_type)
-- 
2.26.2.Cisco


