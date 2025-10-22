Return-Path: <jason.m.bills@linux.intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D4A4CCD1AB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 15:05:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by mx.groups.io with SMTP id smtpd.web11.11903.1761145523464194386
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Oct 2025 08:05:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=RixkjoDw;
 spf=pass (domain: linux.intel.com, ip: 192.198.163.8, mailfrom: jason.m.bills@linux.intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761145524; x=1792681524;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gykRfUNXfHYxb46WVy864twwqDT7K6Ko/G/HYz3Ulnk=;
  b=RixkjoDw2ppSrTU2c2Drw/+31XxENSB9myBXnkvu0PwrKt33XMjK0X7S
   YPvhImmfzv8TaSM7G0RNWxD6vMIGtCxYU5MSsJ+adq9nEhCTBz0L4F9mI
   sQ2jeApuJ4gbvNJYJGR+VJYzwRJNVS7KvIlQ1wTQJm7YxV2X3u7QRnGlm
   MBInSDbPsFOemSRJl5kfODgPMYMHWOg9kqbXk1Ruvw2grqND/YnSy5CQT
   +s5wgUu4DVRxsfXI4G5jbFb5nCCmF5ap1hca3aYYcUkjxyLbGuhtXg5+s
   a3DGdPpJuloBF/hilxf6VohK3uZm/8Pu/NJfUyHr8jBU4d7u7kuy1LOua
   A==;
X-CSE-ConnectionGUID: mGzX4wcOQAS8kQ6RD1PXCA==
X-CSE-MsgGUID: wbNU7N2uSEGQZblIpEcfNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80925242"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="80925242"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 08:05:23 -0700
X-CSE-ConnectionGUID: ifuRAjxuTk6JkiLCNYycvw==
X-CSE-MsgGUID: 0CRf2bL6RUWwahn/4N/jPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="183109642"
Received: from hercules.jf.intel.com ([10.243.48.33])
  by orviesa010.jf.intel.com with ESMTP; 22 Oct 2025 08:05:23 -0700
From: "Jason M. Bills" <jason.m.bills@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Cc: "Jason M. Bills" <jason.m.bills@linux.intel.com>,
	Ross Burton <Ross.Burton@arm.com>
Subject: [PATCH v2] systemd.bbclass: support template files with dots
Date: Wed, 22 Oct 2025 08:05:17 -0700
Message-ID: <20251022150517.153368-1-jason.m.bills@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 15:05:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225198

If the SYSTEMD_SERVICE variable contains a template instance that has
dots in the name such as "xyz.openbmc_project.my@instance.service", the
regex splits on all the dots resulting in the following python
exception:

Exception: ValueError: too many values to unpack (expected 3)

To continue to support service files with dots in the name, this changes
to first split only on the '@' to isolate the name, then split the
second half on the last dot to get the remaining two parameters.
Splitting on the last dot allows dots in the instance name, as well.

Confirmed when building that the three parameters for template instances
without dots came out the same and that template instances with dots
include the full name with dots in the first parameter.

Confirmed when using an instance name with dots that the full instance
name came out correctly with dots.

CC: Ross Burton <Ross.Burton@arm.com>
Signed-off-by: Jason M. Bills <jason.m.bills@linux.intel.com>
---
changes in v2:
- Changed the postfix split to rsplit only once to support instance
  names with dots.
---
 meta/classes-recipe/systemd.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/systemd.bbclass
index 5a0550b287..562e71fb56 100644
--- a/meta/classes-recipe/systemd.bbclass
+++ b/meta/classes-recipe/systemd.bbclass
@@ -247,7 +247,8 @@ python systemd_populate_packages() {
                 if not systemd_service_exists(service, user, d):
                     continue
                 if '@' in service and '@.' not in service:
-                    (servicename, instance, service_type) = re.split('[@.]', service)
+                    (servicename, postfix) = service.split('@')
+                    (instance, service_type) = postfix.rsplit('.', 1)
                     template_services.setdefault(servicename + '@.' + service_type, []).append(instance)
                 else:
                     template_services.setdefault(service, [])

