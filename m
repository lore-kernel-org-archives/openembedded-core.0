Return-Path: <jiaqing.zhao@linux.intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAC81C433FE
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 09:40:49 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web08.6288.1652434846878843779
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 May 2022 02:40:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=WLWKbNNB;
 spf=none, err=permanent DNS error (domain: linux.intel.com,
 ip: 192.55.52.115, mailfrom: jiaqing.zhao@linux.intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652434846; x=1683970846;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bhsO+lCuLQ/dPyFEga4BoB9exhO40HuzCU1Ida2bhIU=;
  b=WLWKbNNBZs0PKgSoT9/cnlgbird7eQfWEiGghqv++7iRmGQSDOAVs2Fz
   YmwQTcQ4jwxGYujnk0vKkcEzBM+0p2Icyvcfo0wR/T3HNVa+QH32xE0HE
   1PyAsGu+AtCLQ3ZeuGDUYzCYzA0f7tzr4DKtwAdyo5S/zSlyzYgMhq+cS
   ICA/7Nn0bk1iI5PXoxWTATOn9/opXrGy/bDL4FLlLw4L1bkL+QCn+G8mF
   1asvefArwa4tOCM74FUYXQmM9xipumCSTKtYxlN083VDJE9Bcv1e7S9XH
   jmGRrZPnmgujC5frlI7auxtUkwyV3HqloXM4sCQX/rQ5/8fB/V4hLJBCm
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="270399121"
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600";
   d="scan'208";a="270399121"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2022 02:40:45 -0700
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600";
   d="scan'208";a="595144113"
Received: from unknown (HELO jiaqingz-bmcdev-container.sh.intel.com)
 ([10.239.138.232])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2022 02:40:44 -0700
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Cc: davide.gardenal@huawei.com,
	Jiaqing Zhao <jiaqing.zhao@linux.intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone] [PATCH v3 2/3] strace: Don't run ptest as "nobody"
Date: Fri, 13 May 2022 17:40:15 +0800
Message-Id: <20220513094016.3345337-3-jiaqing.zhao@linux.intel.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/165550

strace ptests can run successfully with root user, there is no need to
run as "nobody". The ptest results are the same.

Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5ab213178c011152e29dfb0a80251c5e5ab79900)
---
 meta/recipes-devtools/strace/strace/run-ptest | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/strace/strace/run-ptest b/meta/recipes-devtools/strace/strace/run-ptest
index 02bb91e07f..86daed9220 100755
--- a/meta/recipes-devtools/strace/strace/run-ptest
+++ b/meta/recipes-devtools/strace/strace/run-ptest
@@ -3,11 +3,7 @@
 set -u
 
 export TIMEOUT_DURATION=240
-chown nobody tests
-chown nobody tests/*
-chown nobody ../ptest
-
-su nobody -c "make -B -C tests -k test-suite.log"
+make -B -C tests -k test-suite.log
 res=$?
 if [ $res -ne 0 ]; then
     cat tests/test-suite.log
-- 
2.34.1


