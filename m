Return-Path: <jiaqing.zhao@linux.intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A70CEC4332F
	for <webhook@archiver.kernel.org>; Sat, 30 Apr 2022 02:48:44 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web08.18515.1651286914150547358
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 19:48:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=X1FAsK3G;
 spf=none, err=permanent DNS error (domain: linux.intel.com,
 ip: 192.55.52.151, mailfrom: jiaqing.zhao@linux.intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651286916; x=1682822916;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Gs8REtoRvws3aFf9l+CJyXEepBMJGoBuItzLLV85QNA=;
  b=X1FAsK3GnnJwapP8PyXEBDXRrcux6sKi3c6whQVMd1kRDfLlhpBxLaVF
   THXhq3LT3MpkOM7AGsiLCfFB1h/chvdLwQYn7vR9TjWufyB4ZL3axQoBy
   1rnHOAeoSEcX07B/FH5n6sqOFzFtmIZJLfgRJw0pwhwP/EI370XInwRS1
   vzOHy0eyGkElXm5HFapXxU5DgQ6Je//2uqSAQ3BfhrRwAO2x23YlVfpL0
   DwHQzRSd4EVloCSfi9CDfly90BFYU83m63fMA5mpadw2eI5c62fryeJSW
   htps2n+Ms/THKjwODnWOv6Ij6jMps2zlpnMjf4+gxEPP8Dae2ZB2u9Ynr
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10332"; a="247377506"
X-IronPort-AV: E=Sophos;i="5.91,187,1647327600";
   d="scan'208";a="247377506"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 19:48:36 -0700
X-IronPort-AV: E=Sophos;i="5.91,187,1647327600";
   d="scan'208";a="560687080"
Received: from unknown (HELO jiaqingz-bmcdev-container.sh.intel.com)
 ([10.239.138.232])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 19:48:35 -0700
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Subject: [PATCH v3 3/3] strace: Don't run ptest as "nobody"
Date: Sat, 30 Apr 2022 10:48:12 +0800
Message-Id: <20220430024812.745583-4-jiaqing.zhao@linux.intel.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/165065

strace ptests can run successfully with root user, there is no need to
run as "nobody". The ptest results are the same.

Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
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


