Return-Path: <jason.m.bills@linux.intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E9CECCD185
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 14:59:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by mx.groups.io with SMTP id smtpd.web11.19362.1760540379009164211
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Oct 2025 07:59:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=a1pLBaX0;
 spf=pass (domain: linux.intel.com, ip: 192.198.163.15, mailfrom: jason.m.bills@linux.intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760540379; x=1792076379;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7zqV7BWYq4cT589wQs4C1pt+AyCqWXLRKOPLuocCDqU=;
  b=a1pLBaX0R6ePMvoa7vYwsdbutv+Ws7TfyDWvkgyNPXKTV8numw02NhlK
   FWJDRXn51XcX0rkGh4pr/cxtp3zMa9g+BKugH/3i8rhV8cli3SRtzetyO
   0u0RkdBH90kl20qOACessy1/ZGEo0VNSv8n+hrBagSQv4ozVcpyTOFYld
   yhtEXZo8E3Vf3biGB2DeTku3IRU8y9pg3zy1p9rVaOj2LaruZQhElvXfp
   5UZzf3+SHfPmRi2o/lDrY0PcnpuVUzpI7XXd0Q9/iKW3d7DsR7pONBo+m
   bqjHyrq0JgDVOD9Hu/lcaJN2ktydaGN/ZvbrpL9HtpqxNBW8xW6nMknfx
   Q==;
X-CSE-ConnectionGUID: wsfluFmVQM6Xv881bQ+zew==
X-CSE-MsgGUID: nR4koN2PQrK0WVNHMl0r1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62812917"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="62812917"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 07:59:38 -0700
X-CSE-ConnectionGUID: QPd7BIhhRN2RYWncgtg7Zg==
X-CSE-MsgGUID: byAXYD4CQ/Clpr5bcAf6ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="186217085"
Received: from hercules.jf.intel.com ([10.243.48.33])
  by orviesa003.jf.intel.com with ESMTP; 15 Oct 2025 07:59:38 -0700
From: "Jason M. Bills" <jason.m.bills@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Cc: "Jason M. Bills" <jason.m.bills@linux.intel.com>
Subject: [PATCH] systemd.bbclass: support template files with dots
Date: Wed, 15 Oct 2025 07:59:36 -0700
Message-ID: <20251015145936.857490-1-jason.m.bills@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 14:59:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224896

If the SYSTEMD_SERVICE variable contains a template instance that has
dots in the name such as "xyz.openbmc_project.my@instance.service", the
regex splits on all the dots resulting in the following python
exception:

Exception: ValueError: too many values to unpack (expected 3)

To continue to support service files with dots in the name, this changes
to first split only on the '@' to isolate the name, then split the
second half on the dot to get the remaining two parameters.

Confirmed when building that the three parameters for template instances
without dots came out the same and that template instances with dots
include the full name with dots in the first parameter.

Signed-off-by: Jason M. Bills <jason.m.bills@linux.intel.com>
---
 meta/classes-recipe/systemd.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/systemd.bbclass
index 5a0550b287..fcd47809b2 100644
--- a/meta/classes-recipe/systemd.bbclass
+++ b/meta/classes-recipe/systemd.bbclass
@@ -247,7 +247,8 @@ python systemd_populate_packages() {
                 if not systemd_service_exists(service, user, d):
                     continue
                 if '@' in service and '@.' not in service:
-                    (servicename, instance, service_type) = re.split('[@.]', service)
+                    (servicename, postfix) = service.split('@')
+                    (instance, service_type) = postfix.split('.')
                     template_services.setdefault(servicename + '@.' + service_type, []).append(instance)
                 else:
                     template_services.setdefault(service, [])

