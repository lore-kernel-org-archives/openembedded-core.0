Return-Path: <jiaqing.zhao@linux.intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91B3AC433EF
	for <webhook@archiver.kernel.org>; Sat, 30 Apr 2022 02:48:44 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web08.18515.1651286914150547358
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 19:48:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=U3lTiC+G;
 spf=none, err=permanent DNS error (domain: linux.intel.com,
 ip: 192.55.52.151, mailfrom: jiaqing.zhao@linux.intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651286915; x=1682822915;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Out1twPqIwF4mnGODklRs6afXaD8Fyo9Vxz40/jlYw0=;
  b=U3lTiC+GkaWRxvv/5h+R7ktV6U9qVcyaUrJW+LgXVQo7APbWlFFdFxGB
   aVBDMd2mLfOOejPcJDvWkYCOACnwEduNKsE4lV0qiqEQZLId8gAw++mfR
   GcZn/JAyjv0i6T980hW1NsbvXT2eIi0RTEwCVu0sRVE1MwC0op/9JZ4dP
   AcC0EUrKxglw89myshHwtQV6xdXMoQe9iIoVqmbYpwLCGHuTpJZvbKgoZ
   4sdoiaZzSlOIsgGvasb/I5SEDOiEtbaZkT9uvOdspPJMSbtFofjvJxDUV
   0T+ATuY/ANlxd3SSL2Aa6aE4rPKzJaDXWo866XssbQFk9TYZyePEbSPVk
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10332"; a="247377497"
X-IronPort-AV: E=Sophos;i="5.91,187,1647327600";
   d="scan'208";a="247377497"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 19:48:35 -0700
X-IronPort-AV: E=Sophos;i="5.91,187,1647327600";
   d="scan'208";a="560687067"
Received: from unknown (HELO jiaqingz-bmcdev-container.sh.intel.com)
 ([10.239.138.232])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 19:48:34 -0700
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Subject: [PATCH v3 2/3] sed: Specify shell for "nobody" user in run-ptest
Date: Sat, 30 Apr 2022 10:48:11 +0800
Message-Id: <20220430024812.745583-3-jiaqing.zhao@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430024812.745583-1-jiaqing.zhao@linux.intel.com>
References: <20220430024812.745583-1-jiaqing.zhao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Apr 2022 02:48:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165064

ptest testsuite/panic-tests.sh of sed need to be run as a non-root user
so that the expected "sed: couldn't open temporary file <filename>:
Permission denied" error can be generated. After disabling default
shell for "nobody", a shell needs to be specified for running ptest.

Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
---
 meta/recipes-extended/sed/sed/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/sed/sed/run-ptest b/meta/recipes-extended/sed/sed/run-ptest
index 993d7d5d75..0460c7961f 100644
--- a/meta/recipes-extended/sed/sed/run-ptest
+++ b/meta/recipes-extended/sed/sed/run-ptest
@@ -2,4 +2,4 @@
 
 chown nobody testsuite
 chown nobody ../ptest
-su nobody -c "make test-suite.log"
+su nobody -s /bin/sh -c "make test-suite.log"
-- 
2.34.1


