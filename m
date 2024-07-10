Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFF22C3DA59
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 09:44:29 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.10236.1720604661462978068
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jul 2024 02:44:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=j1b9CCTk;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1720604662; x=1752140662;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Tp9iIEEFwZPsCTgmbm4dUPlfvlVb0wXHUQz3/VZIb7E=;
  b=j1b9CCTkzqC1KplvWr+BNJsuYtF/QcSxizQtAw9fwGJb/iQJk66dyxUf
   jHg6fnos6O0xbQL8vzkJcgVfjYNfZiM/LttpjMyHQzM+gGM5SiGLk6zXq
   6m4ebbJkMLS8ShP6MsAnB3D+M+jssauk9PthVQDaWwLOcK4GD881n07TW
   ZP/ClSGqFDCaX4pr0anAU2YO+zqAUNEpDzMH43KUIxEULWSqmQEyidwA5
   1QmW2SGafNEy2z3celKQ1y+Qn7lMvhmoDjmXwVxhyPss6xNpiX3ssBLqo
   OFRPjnqAKof55upJ9BgGX4/FTLcouGk18ixO9CGkMiFs18MgVVshRFGI7
   w==;
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="166642929"
X-IronPort-AV: E=Sophos;i="6.09,197,1716217200"; 
   d="scan'208";a="166642929"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 18:44:19 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id DEF10D648E
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:16 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 29D6FD8B6A
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:16 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id BAE092005018E
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:15 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6C6811A0002;
	Wed, 10 Jul 2024 17:44:15 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 18/30] lua: upgrade 5.4.6 -> 5.4.7
Date: Wed, 10 Jul 2024 17:43:42 +0800
Message-Id: <1720604634-23406-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1720604634-23406-1-git-send-email-wangmy@fujitsu.com>
References: <1720604634-23406-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28520.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28520.006
X-TMASE-Result: 10--9.624300-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yXg2y0j5vXZGK2GKtdiFmTmysPB8dBBorZw5
	8HnbQZjrrbtetXWq4qABXdtZPWfJ2i/7QU2czuUNA9lly13c/gEIJ2rqTcuYdrghdDfPx2dqdTe
	gpK7QnXFvQZuQp/ypDLhX/lUQGcew54o2Y013b1eqh5pv1eDPzxzSjqs2IoGKmyiLZetSf8lBgw
	5G4NYCZAC+EIPmu5dBIAcCikR3vq9w3oa5fjHMOmwfQJx4dG1mYRgnWOYtRe8xo5w1Iv/dlFfnn
	SBSCr7F
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 09:44:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201716

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2024.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/lua/{lua_5.4.6.bb => lua_5.4.7.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/lua/{lua_5.4.6.bb => lua_5.4.7.bb} (94%)

diff --git a/meta/recipes-devtools/lua/lua_5.4.6.bb b/meta/recipes-devtools/lua/lua_5.4.7.bb
similarity index 94%
rename from meta/recipes-devtools/lua/lua_5.4.6.bb
rename to meta/recipes-devtools/lua/lua_5.4.7.bb
index 17dc8fb17d..c72434d220 100644
--- a/meta/recipes-devtools/lua/lua_5.4.6.bb
+++ b/meta/recipes-devtools/lua/lua_5.4.7.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Lua is a powerful light-weight programming language designed \
 for extending applications."
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://doc/readme.html;beginline=303;endline=324;md5=e05449eb28c092473f854670c6e8375a"
+LIC_FILES_CHKSUM = "file://doc/readme.html;beginline=303;endline=324;md5=41f9e2b41229cf6e69aac18c0eb5bfa7"
 HOMEPAGE = "http://www.lua.org/"
 
 SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=tarballsrc \
@@ -12,7 +12,7 @@ SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=tarballsrc \
 # if no test suite matches PV release of Lua exactly, download the suite for the closest Lua release.
 PV_testsuites = "5.4.4"
 
-SRC_URI[tarballsrc.sha256sum] = "7d5ea1b9cb6aa0b59ca3dde1c6adcb57ef83a1ba8e5432c0ecd06bf439b3ad88"
+SRC_URI[tarballsrc.sha256sum] = "9fbf5e28ef86c69858f6d3d34eccc32e911c1a28b4120ff3e84aaa70cfbf1e30"
 SRC_URI[tarballtest.sha256sum] = "04d28355cd67a2299dfe5708b55a0ff221ccb1a3907a3113cc103ccc05ac6aad"
 
 inherit pkgconfig binconfig ptest
-- 
2.34.1


