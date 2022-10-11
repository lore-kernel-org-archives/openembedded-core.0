Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AF40C4332F
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 08:59:29 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.5011.1665478755899453262
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 01:59:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=oHyHg2rk;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1665478758; i=@fujitsu.com;
	bh=eyDEW5WHDKJNXMB4Jq4C4oyQbuPei+R4nxlRRnr2VfM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=oHyHg2rkOp7XW/TNKCOkl87haEg4ydKtJHsJdsLZMKcp1CvVPR4/IrWixiDA6wzVW
	 XJE3IfL8VulhZ4hVqYVpZ9vdfzaLhBSs1wRwm14NDNW7UU2JWnZSLjsj6HT6jMKbRH
	 zvsHd/LgXxF+C8XuNxXkywbFAyNMG0UU3kSIk2VtHs1AvamvdZ0IR+QBYlLCaV5WCF
	 vI/39R/aL6k4jBo+730HBq0NTkQ91SEn2fkLshA8PI/W77bSWpTbt/YVqd53j7dtQF
	 +ZO1zkmkvmNUjWXkQfdsKI+oFn9gtN3GB2m05QzXpBZe9joRnYjIiW1RpoqHB3r3uV
	 TbDTVmRSuc9pA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8OxWTfNwDX
  Z4GSHgMWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmnFlWwdLwVOuiq4Fz5gaGI9wdjFycQgJ3GeU
  aD+6ihXCucwkcbjrDJDDCeTsYZR4/ysZxGYTUJOYfusGUJyDQ0RAT+LqP1GQMLOAisSL3z3sI
  LawgJ3Embb3YDaLgKpE54O3TCA2r4CTxIYfmxlBbAkBBYkpD98zg9icAs4SvXPfMUOscpJon/
  GbDaJeUOLkzCcsEPMlJA6+eMEM0asoMftyMwuEXSExa1YbE4StJnH13CbmCYyCs5C0z0LSvoC
  RaRWjTVJRZnpGSW5iZo6uoYGBrqGhqa6lma6hpbFeYpVuol5qqW5eflFJhq6hXmJ5sV5qcbFe
  cWVuck6KXl5qySZGYBinFCcc3MG4Yt8vvUOMkhxMSqK8XequyUJ8SfkplRmJxRnxRaU5qcWHG
  GU4OJQkeCfrAuUEi1LTUyvSMnOAMQWTluDgURLhXaoClOYtLkjMLc5Mh0idYlSUEudN1gdKCI
  AkMkrz4NpgcXyJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjDvOZApPJl5JXDTXwEtZgJafPK
  qE8jikkSElFQDUw5P9oa72rbGn9ReX173ZEL8xV1zd00S2NNeeUGnLP7lzX25D7/UWmY2SPf+
  tl0om7SuacfzRMOQyoN7752YIjapx2ZN7bzK0xp+e2v5DZZ+cGnY/N7VzvW0RKfNsVlxdRJyF
  wqfXTH5OnGaSWhIy77fy74Y7dKJ4zA6+//dM7tgrTmGV/vver3+bxX07/qic2bLPa4tVHLeeu
  Z9JuPlJZ96j65seMrUp2Rxt8uOIT/75qYJnGprl51Re3DmyRHzZyyfM3/rbpBbtnI5673ffzc
  e8314gjP9uVVmepyPgXffGsGc+e897gsphS3b95lFMsjvbJyp6kT9H5ctn6dKMdlP+TA7/SQL
  6+b6wGMnn8QrsRRnJBpqMRcVJwIATwEtm14DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-732.messagelabs.com!1665478757!64891!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10007 invoked from network); 11 Oct 2022 08:59:18 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-20.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 11 Oct 2022 08:59:18 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id AB84573
	for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 09:59:17 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 9ECD9142
	for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 09:59:17 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 11 Oct 2022 09:59:16 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] lttng-ust: upgrade 2.13.4 -> 2.13.5
Date: Tue, 11 Oct 2022 16:58:50 +0800
Message-ID: <1665478730-16815-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1665478730-16815-1-git-send-email-wangmy@fujitsu.com>
References: <1665478730-16815-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Oct 2022 08:59:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171619

Changelog:
==========
* Fix: bytecode validator: reject specialized load field/context ref instructions
* Fix: bytecode validator: reject specialized load instructions
* Fix: event notification capture: validate buffer length
* Fix: event notification capture error handling
* Fix: lttng-ust-comm: wait on wrong child process
* fix: 'make dist' without javah

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../lttng/{lttng-ust_2.13.4.bb => lttng-ust_2.13.5.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{lttng-ust_2.13.4.bb => lttng-ust_2.13.5.bb} (95%)

diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.13.4.bb b/meta/recipes-kernel/lttng/lttng-ust_2.13.5.bb
similarity index 95%
rename from meta/recipes-kernel/lttng/lttng-ust_2.13.4.bb
rename to meta/recipes-kernel/lttng/lttng-ust_2.13.5.bb
index 56200ac3e1..916408bff0 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.13.4.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.13.5.bb
@@ -34,7 +34,7 @@ SRC_URI = "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz2 \
            file://0001-Makefile.am-update-rpath-link.patch \
            "
 
-SRC_URI[sha256sum] = "698f82ec5dc56e981c0bb08c46ebabaf31c60e877c2e365b9fd6d3a9fff8b398"
+SRC_URI[sha256sum] = "f1d7bb4984a3dc5dacd3b7bcb4c10c04b041b0eecd7cba1fef3d8f86aff02bd6"
 
 CVE_PRODUCT = "ust"
 
-- 
2.25.1


