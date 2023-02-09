Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C963AC05027
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 13:02:47 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web11.13936.1675947758734189221
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Feb 2023 05:02:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=bcY0RFyV;
 spf=pass (domain: intel.com, ip: 192.55.52.151, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675947758; x=1707483758;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/vNCU/V8VLfGXEbOzl7XGst13em7XkosSK+wKuedK0M=;
  b=bcY0RFyV4EXIDN9BTsIxFKm36nPg0QCQKUV475wVIu/xHoQuUtpxE0eB
   LtFvzXGZW493wUdGUvdR18TdI+8IA5wS8zmi1roqcltHq93FD0fCs1hZj
   Co1rs1gKYQXXMO3vcgGvbjjoyZnEz4qCM7d0LM+O4bH7cQuti9B+mvV33
   anLYb1cZ6pLmMXqdgjxOxk8l29QZU3RQOl7E2IU9C6K3u3M4aicrPBtOQ
   4+UpkSgw0kmNP6zLj3Tl5MNKu3+7QikRHfsFCNAchHFkj3YD1bdEQaxAF
   JLayI1x+QdcSkdSkzY2Er/mXMO5w5vRUldwt1fM9zqmapgYOHXkjvDVtj
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="310453789"
X-IronPort-AV: E=Sophos;i="5.97,283,1669104000"; 
   d="scan'208";a="310453789"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 05:02:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="645263712"
X-IronPort-AV: E=Sophos;i="5.97,283,1669104000"; 
   d="scan'208";a="645263712"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga006.jf.intel.com with ESMTP; 09 Feb 2023 05:02:37 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [patch][master][langdale] libgit2: upgrade to 1.5.1
Date: Thu,  9 Feb 2023 21:02:29 +0800
Message-Id: <20230209130229.3224043-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 13:02:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176953

From: Chee Yang Lee <chee.yang.lee@intel.com>

This is a security release to address CVE-2023-22742: when compiled
using the optional, included libssh2 backend, libgit2 fails to verify
SSH keys by default.

When using an SSH remote with the optional, included libssh2 backend,
libgit2 does not perform certificate checking by default. Prior versions
of libgit2 require the caller to set the `certificate_check` field of
libgit2's `git_remote_callbacks` structure - if a certificate check
callback is not set, libgit2 does not perform any certificate checking.
This means that by default - without configuring a certificate check
callback, clients will not perform validation on the server SSH keys and
may be subject to a man-in-the-middle attack.

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 .../libgit2/{libgit2_1.5.0.bb => libgit2_1.5.1.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libgit2/{libgit2_1.5.0.bb => libgit2_1.5.1.bb} (78%)

diff --git a/meta/recipes-support/libgit2/libgit2_1.5.0.bb b/meta/recipes-support/libgit2/libgit2_1.5.1.bb
similarity index 78%
rename from meta/recipes-support/libgit2/libgit2_1.5.0.bb
rename to meta/recipes-support/libgit2/libgit2_1.5.1.bb
index ee4d79b11a..59866ce385 100644
--- a/meta/recipes-support/libgit2/libgit2_1.5.0.bb
+++ b/meta/recipes-support/libgit2/libgit2_1.5.1.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=112e6bb421dea73cd41de09e777f2d2c"
 
 DEPENDS = "curl openssl zlib libssh2 libgcrypt libpcre2"
 
-SRC_URI = "git://github.com/libgit2/libgit2.git;branch=main;protocol=https"
-SRCREV = "fbea439d4b6fc91c6b619d01b85ab3b7746e4c19"
+SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v1.5;protocol=https"
+SRCREV = "42e5db98b963ae503229c63e44e06e439df50e56"
 
 S = "${WORKDIR}/git"
 
-- 
2.37.3


