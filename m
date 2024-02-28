Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF4CAC54E55
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 07:33:20 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.8410.1709105596690159480
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 23:33:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GZX3p1fh;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709105597; x=1740641597;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=5lgfOEFlWQuYoCaRgZdrTFORAab6RKy5ruTIPNVar4c=;
  b=GZX3p1fhUPAw82NL7Rg4CHlONuJ3w46YOm9lnBiYzJbZGzfwsC6W+wPV
   PX/u3kk3RUtH+CDsdHDrxxFP2yi2HfdbcZO1+JaWEbKBlKizgr7u2OGPP
   MroJn/P3LvajdkZRbc+rvVcZZAwdE56m0fTzMWSqky0YJeqMTlnjbj8J2
   8BFlA8PuaFHtHcUxoNFCkC2pyX0ZFKDP2K2bbjpL+4bsrHHX+0H3cE7/a
   oyDbq2kxGPUakiDTE9MVfLSUTBEAMyhXQ0iuRl40sfnx0nRKoew0h/B2H
   LM0V+KquHq1HapJyvwAQhUtnnEih4fLKw+Sb9G6rDGQdpNXKi0RvUUQkN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="130045102"
X-IronPort-AV: E=Sophos;i="6.06,190,1705330800"; 
   d="scan'208";a="130045102"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 16:33:14 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 496E3A02AD
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:12 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 77B3B3A072
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:11 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0990741180
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:11 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AF5691A006A;
	Wed, 28 Feb 2024 15:33:10 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 07/48] gcr: upgrade 4.1.0 -> 4.2.0
Date: Wed, 28 Feb 2024 15:32:14 +0800
Message-Id: <1709105575-24259-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
References: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28218.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28218.005
X-TMASE-Result: 10-2.082700-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mr9luJE23VaKjozDhGeQC9EgZN
	LEcrBa0wXa45Y5Hu1ssRPm3RLrGvj6T4BhrRHlF4IBYc5Hfv4BPXQAEGh6pSu7Kw8Hx0EGitgg8
	W5tsFXIChOywUZIftbeaffHI8kAmiHY/bzRmIaZG6kMgL3jbYOgRryDXHx6oXF0dfZ5kV9l8p0R
	URDvVjQbF9uGobEuT7gDLqnrRlXrbIDt27MLDp0t0H8LFZNFG76sBnwpOylLPChBFkrg38a8VwD
	+ncXKvKr9kE78bkjy/jbIkCx6gCbjVTVi6hf3NYm67N8SXHWGKrEZ89zE5ppwV/P9tGW1qZB3Vl
	znG12MiIHqaUMp7VXtL/LK0d4I30Ze/gJB41STsbqpM7Cr+fvX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 07:33:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196332

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- gcr-ssh-agent: add command line options to gcr-ssh-agent [GNOME/gcr!129]
- gcr-ssh-agent: Fix memory leak spotted by ASan [GNOME/gcr!133]
- gcr-ssh-agent: Port memory safety fixes from gnome-keyring ssh-agent [GNOME/gcr!128]
- Updated translations

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-gnome/gcr/{gcr_4.1.0.bb => gcr_4.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gcr/{gcr_4.1.0.bb => gcr_4.2.0.bb} (95%)

diff --git a/meta/recipes-gnome/gcr/gcr_4.1.0.bb b/meta/recipes-gnome/gcr/gcr_4.2.0.bb
similarity index 95%
rename from meta/recipes-gnome/gcr/gcr_4.1.0.bb
rename to meta/recipes-gnome/gcr/gcr_4.2.0.bb
index 399f327e04..c534e22f0a 100644
--- a/meta/recipes-gnome/gcr/gcr_4.1.0.bb
+++ b/meta/recipes-gnome/gcr/gcr_4.2.0.bb
@@ -20,7 +20,7 @@ inherit gnomebase gtk-icon-cache gi-docgen features_check vala gobject-introspec
 
 REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'opengl', '', d)}"
 
-SRC_URI[archive.sha256sum] = "9ceaad29284ba919b9216e2888c18ec67240c2c93b3a4856bc5488bbc1f3a383"
+SRC_URI[archive.sha256sum] = "e15e31329e0171229d552d25563f176c5b6179795bf91fae2b141f69a9b7c480"
 
 PACKAGECONFIG ??= " \
 	${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
-- 
2.34.1


