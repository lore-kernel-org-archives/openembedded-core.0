Return-Path: <jiaqing.zhao@linux.intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC5E6C433EF
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 09:40:49 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web10.6252.1652434844592587848
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 May 2022 02:40:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=joiVOCmG;
 spf=none, err=permanent DNS error (domain: linux.intel.com,
 ip: 192.55.52.115, mailfrom: jiaqing.zhao@linux.intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652434844; x=1683970844;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IhZfbsTkcfFZTBqI1ZWlf9/pDHM+12tyNJP0folu3BE=;
  b=joiVOCmGwjPeKeHZ9NDM2D95ZLlakmwgiIOuy2jfNVt9119FeaXHQWXv
   Euhds//jEsIAbkg6NbNDBimYLGz6l+GeJVIIHNogKWZM5s23hjXVVL0l8
   74H3za73DKER+sf0kZtYPk0O/lyWKZdA938D1bi1gPKHmL2iDW50uY8J5
   oxL/UOtnVOL8iovn9lwQUKNUhbvjd9WKwce3xj1lAC2YmS7vyE8kOnWKt
   gGznaUBdG9Z9o5wD+woyUV6MgD65jnxIOlr+tnO0zteMuMQH9j/eGY2KS
   DrVJ2hqJXY8eL7kz0+H5/KcS7dftVa7CQC4JNYSeqfeQfjggwDeF9H+Uj
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="270399117"
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600";
   d="scan'208";a="270399117"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2022 02:40:44 -0700
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600";
   d="scan'208";a="595144089"
Received: from unknown (HELO jiaqingz-bmcdev-container.sh.intel.com)
 ([10.239.138.232])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2022 02:40:42 -0700
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Cc: davide.gardenal@huawei.com,
	Jiaqing Zhao <jiaqing.zhao@linux.intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone] [PATCH v3 1/3] sed: Specify shell for "nobody" user in
 run-ptest
Date: Fri, 13 May 2022 17:40:14 +0800
Message-Id: <20220513094016.3345337-2-jiaqing.zhao@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220513094016.3345337-1-jiaqing.zhao@linux.intel.com>
References: <20220513094016.3345337-1-jiaqing.zhao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 May 2022 09:40:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165549

ptest testsuite/panic-tests.sh of sed need to be run as a non-root user
so that the expected "sed: couldn't open temporary file <filename>:
Permission denied" error can be generated. After disabling default
shell for "nobody", a shell needs to be specified for running ptest.

Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c6d7216772f76af4429fdaaca518858cf014293f)
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


