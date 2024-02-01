Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F291C48292
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 04:25:49 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.8471.1706761541583342744
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jan 2024 20:25:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WbsSfUFl;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1706761542; x=1738297542;
  h=from:to:cc:subject:date:message-id;
  bh=SOI58MPMOZVgFV70y7NfIgckLeYChVW/6Nv5Cr+tUOw=;
  b=WbsSfUFlKeAYg0DWUGXWLRB/amkuhF511pOyBenxBvkUneJ5+12NjtYl
   bM7fkPEeIYlIFo2t5wj4ONfPCiatab6vh1v2BWLE0yuXF1T1g6Ok+s1ZJ
   Lmp2qve9Ts5x3IKHPy8I7mdX96D0AFgeVXuB44bLXffgaGLyRuffthhOe
   1LQ05LHOcU6JcEIYbF+N2QMRMoqrr+ejJ8bQD+Hdd345iZgn6QpLbK6Ad
   HkJanuJlxqJKhjck0zAo4g5DFXSh24ttIEFBD+CHUeiM510c+kY6prkZz
   EO+mxmXpNu58wOLYHWAmtVPefhzYmlmclBhezzo5ipD4Cz9egbzqGJuSY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="147471679"
X-IronPort-AV: E=Sophos;i="6.05,234,1701097200"; 
   d="scan'208";a="147471679"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 13:25:39 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 10494174768
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 13:25:37 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 559ECD5628
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 13:25:36 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id DA7A920079DEC
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 13:25:35 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 564511A006A;
	Thu,  1 Feb 2024 12:25:35 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] lzip: upgrade 1.23 -> 1.24
Date: Thu,  1 Feb 2024 12:21:55 +0800
Message-Id: <1706761315-11997-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28156.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28156.000
X-TMASE-Result: 10--3.319700-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mrKQNhMboqZlqxinR47PuWw4hP
	UalxxqyH5F5HDiyPX4D08edkgvdYLFaBvJpACoM8zYK5U+QI3O6lL7hugWmfM1GJGXffuLdvuJE
	UmdYPGSUppiuzBwGFPsYoh/qEF/tVoYY7KoErjW8ReM8i8p3vgFQQ0EgzIoPRKXqmmYTGpxiUg5
	UD6AlF0rF9uGobEuT7gDLqnrRlXrbIDt27MLDp0t0H8LFZNFG76sBnwpOylLPCTvRnlrYUykZZF
	mbcbhXiwSfpnHHuq51bl3ysPFYTG/OhKnx8+i9rz8n3EM8kSfbCZCQe0dDDz1QsOyiTUdiNShip
	aNm3xuCIHqaUMp7VXtL/LK0d4I30Ze/gJB41STsbqpM7Cr+fvX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 04:25:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194559

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* New options '--empty-error' and '--marking-error'.
* main.cc: Reformat file diagnostics as 'PROGRAM: FILE: MESSAGE'.
  (show_option_error): New function showing argument and option name.
  (main): Make -o preserve date/mode/owner if 1 input file.
  (open_outstream): Create missing intermediate directories.
* lzip.h: Rename verify_* to check_*.
* configure, Makefile.in: New variable 'MAKEINFO'.
* testsuite: New test files fox6.lz, fox6_mark.lz.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-extended/lzip/{lzip_1.23.bb => lzip_1.24.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/lzip/{lzip_1.23.bb => lzip_1.24.bb} (93%)

diff --git a/meta/recipes-extended/lzip/lzip_1.23.bb b/meta/recipes-extended/lzip/lzip_1.24.bb
similarity index 93%
rename from meta/recipes-extended/lzip/lzip_1.23.bb
rename to meta/recipes-extended/lzip/lzip_1.24.bb
index 12e8fa6c58..73040a6f00 100644
--- a/meta/recipes-extended/lzip/lzip_1.23.bb
+++ b/meta/recipes-extended/lzip/lzip_1.24.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=76d6e300ffd8fb9d18bd9b136a9bba13 \
                     "
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/lzip/lzip-${PV}.tar.gz"
-SRC_URI[sha256sum] = "4792c047ddf15ef29d55ba8e68a1a21e0cb7692d87ecdf7204419864582f280d"
+SRC_URI[sha256sum] = "d42659229b10e066eeb6e81eb673cdd893b672e512d26719c2d95975556ca56c"
 
 B = "${WORKDIR}/build"
 do_configure[cleandirs] = "${B}"
-- 
2.34.1


