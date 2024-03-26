Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7950ECD11BF
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 00:35:43 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.7828.1711413336225409378
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Mar 2024 17:35:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=exfSDhKz;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711413337; x=1742949337;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=N8HcJ9+JK32mcqqstJn+TiptEL+BHqPqC5U4UAFa+Ds=;
  b=exfSDhKz6dfapLBhkJAFksiHnL9jg879rznBdQQ0hR9jRW5Cc2Y++CtL
   g4hVap73ywueTkxCI/WpHqe/xJQ8ch9YOwBjCP7FIH7QNU2mTdiORS55z
   ynkK9SiCzo34FYZe6X3nJ2dHZiSIngVc8VqgrwO1MDWzsQcWwxyWKuv+/
   NP5qtDJfEG07zSfAsyVL0bXQ9fr3bjTvNDNabnWQupkxmQwuMUDmsPU4/
   J6bhtSFiEeWpYXwVWVsNEtSEr6RQD0KoN0Y3WzBPYLo74v0AKgCd/wcxl
   4rbM725rT58WTfI6jk34u8WhmQJl/2NDxJcf7sDbyWZIyudDyk6JrM+Xi
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="153313599"
X-IronPort-AV: E=Sophos;i="6.07,154,1708354800"; 
   d="scan'208";a="153313599"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:35:34 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id DBF5F10A328
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:35:31 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1F7AFD7B66
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:35:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9521720097BFD
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:35:30 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3EFF01A006A;
	Tue, 26 Mar 2024 08:35:30 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-Core] [PATCH 10/34] libbsd: upgrade 0.12.1 -> 0.12.2
Date: Tue, 26 Mar 2024 08:34:28 +0800
Message-Id: <1711413292-3025-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
References: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28274.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28274.003
X-TMASE-Result: 10--4.481500-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yUIIxwDaU5mra9qiaDSLgo1aqcj3TMo+ZEZt
	te8gdYxNysrQT3Sb4eZmBcBpdjFcQq+CQswOit7P194/5X9VfCwXivwflisSrO5ijmxQIk9iXPM
	kpDnmMoLUxgqbraLAGy7l53YVbYrZHVikQ9YmLLM/QdUh6LEl0DeXamXCCu1YIPUd1fKoOcS/BR
	68O365bqSdDmDK09MpfJL38u1VtO77L2q5dH9XYN0KiTeJteVBfS0Ip2eEHnz3IzXlXlpamPoLR
	4+zsDTt+gmVy5VdZknjfIy+fOaJzVC5+nyknIcC9f0Ct1D05eIa1tScjhc5F5R3sv0w38aWWpE7
	OPFtnSr0FCPmpDYQ+A1bw06LXCRRWH1eYm8Laf3yDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgA
	Q4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 00:35:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197500

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-test: nlist: make resilient against -Wl,--gc-sections
-build: Do not rely on internal autoconf ac_cv_sys_file_offset_bits variable
-build: Use -eq instead of = as test operators for arithmetic tests
-build: Fix typo in ABI selection description
-build: Only install time struct conversion macros where missing
-man: Add links for errc module functions
-man: Do not install timeval(3bsd) nor timespec(3bsd)
-strtonum: Do not abort on EINVAL from strtoi()
-closefrom: Ignore files starting with dot when scanning /proc/self/fd
-build: Match also gnu* for GNU/Hurd on the glibc ABI selection

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libbsd/{libbsd_0.12.1.bb => libbsd_0.12.2.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libbsd/{libbsd_0.12.1.bb => libbsd_0.12.2.bb} (95%)

diff --git a/meta/recipes-support/libbsd/libbsd_0.12.1.bb b/meta/recipes-support/libbsd/libbsd_0.12.2.bb
similarity index 95%
rename from meta/recipes-support/libbsd/libbsd_0.12.1.bb
rename to meta/recipes-support/libbsd/libbsd_0.12.2.bb
index 161dc6df43..7d5e88f293 100644
--- a/meta/recipes-support/libbsd/libbsd_0.12.1.bb
+++ b/meta/recipes-support/libbsd/libbsd_0.12.2.bb
@@ -38,7 +38,7 @@ SECTION = "libs"
 
 SRC_URI = "https://libbsd.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "d7747f8ec1baa6ff5c096a9dd587c061233dec90da0f1aedd66d830f6db6996a"
+SRC_URI[sha256sum] = "b88cc9163d0c652aaf39a99991d974ddba1c3a9711db8f1b5838af2a14731014"
 
 inherit autotools pkgconfig
 
-- 
2.34.1


