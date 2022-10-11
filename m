Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A124C433FE
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 08:59:29 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.5011.1665478755899453262
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 01:59:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=wjOXwIAr;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1665478754; i=@fujitsu.com;
	bh=OEoUOTQQbHddgLZZ2B97oXhPZJl04RK7oqe305Tu2qA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=wjOXwIArm6OxeDrOiL78OGisEz7NY3EldEEm+M/nobbVL/vDFTe2omd1oTz/eKK4/
	 w1US49hgm4iCJvB6II3E4NowunJ6t3yfJOEyK5S2T9Sm6siKS2HioD6UMi3hb51LPf
	 CUqiufZz7kzcMxVpFYOnDNw6rxuHP3/ba/9XOuIdwguKAR74HdzG7H0CeZqK9QGRvo
	 3+l3uiNNwYvnTUsUC4SJrqTI2LAGoBdTV4Mf3YDqHAu+yvZ3bHU40IFWzqYeur5c5F
	 JrUM/lyJAGy32udlu+I1OS7IsoJKCM+vVRxv584zYXqcW9DYm1L2HGhFY616xOb6F8
	 AAFT3SA0QAcbA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRWlGSWpSXmKPExsViZ8ORqJto4Jp
  ssO+OhsWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmvGqaStbwS/uiqdX7jA2MG7i6mLk4hASeMwo
  8WL2YiYI5xqTRGtvIzOEswcoM3kpUIaTg01ATWL6rRusXYwcHCICehJX/4mChJkFVCRe/O5hB
  7GFBWwlzt2ewQhiswioSnzZdASslVfASWLxy9NgtoSAgsSUh++ZQWxOAWeJ3rnvwGwhoJr2Gb
  /ZIOoFJU7OfMICMV9C4uCLF8wQvYoSsy83s0DYFRKzZrVBzVSTuHpuE/MERsFZSNpnIWlfwMi
  0itEmqSgzPaMkNzEzR9fQwEDX0NBU19JM19DYSC+xSjdRL7VUNy+/qCRD11AvsbxYL7W4WK+4
  Mjc5J0UvL7VkEyMwkFOKE1p2MN7e90vvEKMkB5OSKG+XumuyEF9SfkplRmJxRnxRaU5q8SFGG
  Q4OJQneybpAOcGi1PTUirTMHGBUwaQlOHiURHiXqgCleYsLEnOLM9MhUqcYdTlmfm07wCzEkp
  eflyolzpusD1QkAFKUUZoHNwIW4ZcYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfOeA5nCk5l
  XArfpFdARTEBHnLzqBHJESSJCSqqBaXGvyATLBNbyRU8uROWvivcw2Wc14fkpAT3fSU1aS3h7
  938y1kzIXfM1hb0/KJTh60Zht/c/GML+v9EonKJyKjlad9qd/Gnnm6f93vcnIOqEk/XPEsYzD
  FUu7acXaxqbrZIyn7iu5vdNma4j0T9feTZF/di24Mhypf51xfLdx5OTFiS+KJ7lM/9y3P4n3X
  bnj3LOkC7U48gsl7Are65wOcqPJ+dP47F9Wm3bLRfdVju8ZP1fTpN7Do8la24uYgy3ffvx0qa
  lPcf+7W5rSmZkLv3UPZfn2Y+HMsYC/Dt1nmhnZhnqZk0os/Z6YBnEEHJ3t8ftuB/HLWRPfxQ+
  /0f407nnG/7lv3San21mterdXiWW4oxEQy3mouJEAOcRTWJrAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-728.messagelabs.com!1665478753!106313!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2759 invoked from network); 11 Oct 2022 08:59:13 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-10.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 11 Oct 2022 08:59:13 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 1B11F10018D
	for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 09:59:13 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 0E7CF100043
	for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 09:59:13 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 11 Oct 2022 09:59:11 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] lighttpd: upgrade 1.4.66 -> 1.4.67
Date: Tue, 11 Oct 2022 16:58:49 +0800
Message-ID: <1665478730-16815-2-git-send-email-wangmy@fujitsu.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/171618

Changelog:
=============
  * Update comment about TCP_INFO on OpenBSD
  * [mod_ajp13] fix crash with bad response headers (fixes #3170)
  * [core] handle RDHUP when collecting chunked body
  * [core] tweak streaming request body to backends
  * [core] handle ENOSPC with pwritev() (#3171)
  * [core] manually calculate off_t max (fixes #3171)
  * [autoconf] force large file support (#3171)
  * [multiple] quiet coverity warnings using casts
  * [meson] add license keyword to project declaration

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../lighttpd/{lighttpd_1.4.66.bb => lighttpd_1.4.67.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.66.bb => lighttpd_1.4.67.bb} (97%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.66.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.67.bb
similarity index 97%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.66.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.67.bb
index 801162867c..838881f238 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.66.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.67.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
            file://lighttpd \
            "
 
-SRC_URI[sha256sum] = "47ac6e60271aa0196e65472d02d019556dc7c6d09df3b65df2c1ab6866348e3b"
+SRC_URI[sha256sum] = "7e04d767f51a8d824b32e2483ef2950982920d427d1272ef4667f49d6f89f358"
 
 DEPENDS = "virtual/crypt"
 
-- 
2.25.1


