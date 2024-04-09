Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 255D6CD129D
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 07:10:47 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.130851.1712646644598713517
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Apr 2024 00:10:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZY3Bq2lm;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1712646644; x=1744182644;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=sqgxsA3ykvjeUiCdEsrnExyqnhE2a6qWIGTNEw3VrOU=;
  b=ZY3Bq2lmmSjhyeJqI3aEBL8o5QyOj4qAIW5QI0GBwjapxqF4p02ynzFz
   717+Pb4qK8RRAs+hpcoIwEDCkmO331KLBSAKaAP1zacgxFe9xo6qnyhpt
   T8f8c3uIDqzWOMDt9gcqIhzJLj8+HQAmEyc/pq7El6NA3+lhoNqYwUe3w
   k1GDwa/tR6tcqpGlvDNLjeb6SFnLs6utPUO3Fl19/G//c1cKExo67HVa8
   RO5xKgdORDGNK6/TOA76xfPBFn1FLdquCE12lOKutMCdnX3X7UcgveciH
   sFwYL3CpBQPjcdwPxFsFPF6jNIW59/4zRBRolDV8KDJEpItVgf10750s3
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="154905329"
X-IronPort-AV: E=Sophos;i="6.07,188,1708354800"; 
   d="scan'208";a="154905329"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 16:10:42 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id DFC65D480A
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:39 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1C296D946B
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:39 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9A4951EA82C
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:38 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4A2FB1A0002;
	Tue,  9 Apr 2024 15:10:38 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 11/33] libdnf: upgrade 0.73.0 -> 0.73.1
Date: Tue,  9 Apr 2024 15:09:58 +0800
Message-Id: <1712646620-16608-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
References: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28306.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28306.005
X-TMASE-Result: 10-0.956800-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrYdBG+bhhiNQR34ro7k23nQY4
	PG+7MbFlB4nXQQumWv1U4ZaPWnopPu1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQFH0
	IKehhaoag04SoOGBo926J2k+mxn+fYwDOL7t3RyHdCok3ibXlQX0tCKdnhB58I/9UW5M5dRM+8F
	JNGdxYq46HM5rqDwqtH8i8yZyPgH0mw4rdAXJqnk2spPw7G/7fy1b2qO+Ye4XRA+AvBrM9zMMf0
	JtXsV3zzqUEgt2aKvCBTMxZuQqpIscAXMAJhoEBHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 07:10:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198030

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
-Fix https://issues.redhat.com/browse/RHEL-27657
-subject-py: Fix memory leak

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libdnf/{libdnf_0.73.0.bb => libdnf_0.73.1.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/libdnf/{libdnf_0.73.0.bb => libdnf_0.73.1.bb} (97%)

diff --git a/meta/recipes-devtools/libdnf/libdnf_0.73.0.bb b/meta/recipes-devtools/libdnf/libdnf_0.73.1.bb
similarity index 97%
rename from meta/recipes-devtools/libdnf/libdnf_0.73.0.bb
rename to meta/recipes-devtools/libdnf/libdnf_0.73.1.bb
index dc2ddf9492..3ab840b1b0 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.73.0.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.73.1.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master;p
            file://armarch.patch \
            "
 
-SRCREV = "1f30b3479528e8b62754f9047195c8e5a31f07ed"
+SRCREV = "0120e70747dcf05e716792e2e846c62eccd44319"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(?!4\.90)\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


