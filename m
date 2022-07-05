Return-Path: <yogesh.tyagi@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF50AC433EF
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 02:49:24 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web09.80370.1656989361394087309
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jul 2022 19:49:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=duRycabg;
 spf=pass (domain: intel.com, ip: 192.55.52.88,
 mailfrom: yogesh.tyagi@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656989361; x=1688525361;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7/Nu4xAf4A3yPbUcWyi+Kp9OIR9sQLrLl29m/F4wNVc=;
  b=duRycabg5M1bOFFOr/vcl9RrglovGsULatcOF0wC+H/D/FlCG3Snq84g
   G1i0N8UOGetdesCi6QVHKEZzCtkA2644kD8woR4Xe/m15Fgcrr52Khm6s
   MLQY0vX8zGHhO0zFXVhrCkIEbZvNbX0o0pQzeVWOMScZtColQkVPtJENZ
   DSxdPeLevgMfZuSswlcAF6ffNSUgR1JYLWUEM1NVzbHUU1d6eDkfEhePc
   +7L0m0OCzHKlPR6771rAcZYakJywWvXMje2uwzKzEEOqVXNvKQaUW8rWw
   ZJcFwr6+LHWeeZTrIlfbZoLIRVj/i7OyeP24ZVXSiq9ka8oyuNQk6kvkD
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10398"; a="308773000"
X-IronPort-AV: E=Sophos;i="5.92,245,1650956400";
   d="scan'208";a="308773000"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2022 19:49:21 -0700
X-IronPort-AV: E=Sophos;i="5.92,245,1650956400";
   d="scan'208";a="590233720"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 04 Jul 2022 19:49:20 -0700
From: Yogesh Tyagi <yogesh.tyagi@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] testimage : remove curl-ptest from rpm index
Date: Tue,  5 Jul 2022 10:49:11 +0800
Message-Id: <20220705024911.42354-1-yogesh.tyagi@intel.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Jul 2022 02:49:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167631

When creating rpm index for dnf runtime tests, currently all the package
starting with curl are getting included. Now curl-ptest is getting enabled
through another patch but we don't want rpm index to be created for
curl-ptest since it fetches lot of perl dependencies. This patch removes
curl-ptest from rpm index.

Signed-off-by: Yogesh Tyagi <yogesh.tyagi@intel.com>
---
 meta/classes/testimage.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 8ffaeab284..7898223bce 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -472,6 +472,9 @@ def create_rpm_index(d):
         package_list = glob.glob(idx_path + "*/*.rpm")
 
         for pkg in package_list:
+            if os.path.basename(pkg).startswith(("curl-ptest")):
+                bb.utils.remove(pkg)
+
             if not os.path.basename(pkg).startswith(("rpm", "run-postinsts", "busybox", "bash", "update-alternatives", "libc6", "curl", "musl")):
                 bb.utils.remove(pkg)
 
-- 
2.36.1


