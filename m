Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BB26CD129A
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 07:10:57 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.130855.1712646647511672546
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Apr 2024 00:10:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jzk/Fh5F;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1712646648; x=1744182648;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ELn1rTsPRtYo/P2Esbu8zrkdngGOy+ta7lVp0h0OWvQ=;
  b=jzk/Fh5F9N4l7KLrXj6EXZrbFSH1OhdtzMQ4YnHhRXab9qQRXemB6PBD
   4sf745ivhji/BrrBRXtT3fWO/Lvq684xXTSVhKMuRhDAda0jgcntKHxoA
   dNZn5+5dUZMYZZrtYyidb7mMvWKlItka/uNjrorC3DD6C6ool98G2eSh6
   00pHUt9RCl2kS0KQm2SF+aPvX811nv3vwHsCCxPfsADrYTIHLzv5K3AmO
   P8nHeTm2CIkk8+oh1rB/q2I/8YYZylmO5m901x3VqxWd7teFHSMY5Xm76
   9TUi+5Ec7SfjGaJXQhE9oCIvdu4/I3izekMdxxM0Sp34BAAYW5VQOfa19
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="154475934"
X-IronPort-AV: E=Sophos;i="6.07,188,1708354800"; 
   d="scan'208";a="154475934"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 16:10:45 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 821C3D4806
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:40 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id A606DD949D
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:39 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3E42420097BD1
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:39 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E19FF1A0002;
	Tue,  9 Apr 2024 15:10:38 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 12/33] libical: upgrade 3.0.17 -> 3.0.18
Date: Tue,  9 Apr 2024 15:09:59 +0800
Message-Id: <1712646620-16608-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
References: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28306.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28306.006
X-TMASE-Result: 10-2.051700-10.000000
X-TMASE-MatchedRID: +qH7TW9/Rkejz0nOeth/yRIRh9wkXSlFcDzcoONn/M4kt9BigJAcVqbT
	tWBOJJdwSShUmbS7fjmvJYCsbEmye5PhC4EdGR/2031Nfxfj2zNJziJDtUPgzZTx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q2dVNZaI2n6/+9Bi8r8zoNMYA3qL69rXq7QK1
	xScp/0+Bab+AC2MJ3sfOhfoy0690RZEKRCEb/Arzo39wOA02LhyI92bpoCbiithMFibFDjzJSDl
	QPoCUXSsX24ahsS5PuAMuqetGVetnyef22ep6XYxlblqLlYqXL/gTJQA62RG4iThvkZ/4hcGdoZ
	vTQCAoaSmYVlXMXk0ZBvCGewE3qzQlRa/tWH8qtm6++jVDubpkrNrCbzrpp7teMUXAAqtB/+v9v
	52ZIoWjoAf389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 07:10:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198034

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
 LICENSE.LGPL21.txt - remove the KDAB claim for copyright

Changelog:
===========
-Requires CMake v3.5.0 or higher
-Escape ^ (U+005E) character in parameter values according to RFC 6868
-New CMake option LIBICAL_BUILD_EXAMPLES to disable building the examples
-Should be able to use the project as a submodule
-Built-in timezones updated to tzdata2024a

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libical/{libical_3.0.17.bb => libical_3.0.18.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libical/{libical_3.0.17.bb => libical_3.0.18.bb} (93%)

diff --git a/meta/recipes-support/libical/libical_3.0.17.bb b/meta/recipes-support/libical/libical_3.0.18.bb
similarity index 93%
rename from meta/recipes-support/libical/libical_3.0.17.bb
rename to meta/recipes-support/libical/libical_3.0.18.bb
index b91912b048..040d23b69d 100644
--- a/meta/recipes-support/libical/libical_3.0.17.bb
+++ b/meta/recipes-support/libical/libical_3.0.18.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/libical/libical"
 BUGTRACKER = "https://github.com/libical/libical/issues"
 LICENSE = "LGPL-2.1-only | MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1910a2a76ddf6a9ba369182494170d87 \
-                    file://LICENSE.LGPL21.txt;md5=933adb561f159e7c3da079536f0ed871 \
+                    file://LICENSE.LGPL21.txt;md5=8f690bb538f4b301d931374a6eb864d0 \
                     file://LICENSE.MPL2.txt;md5=f75d2927d3c1ed2414ef72048f5ad640 \
                     "
 SECTION = "libs"
@@ -15,7 +15,7 @@ SECTION = "libs"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
            file://0001-cmake-Do-not-export-CC-into-gir-compiler.patch \
           "
-SRC_URI[sha256sum] = "bcda9a6db6870240328752854d1ea475af9bbc6356e6771018200e475e5f781b"
+SRC_URI[sha256sum] = "72b7dc1a5937533aee5a2baefc990983b66b141dd80d43b51f80aced4aae219c"
 
 inherit cmake pkgconfig gobject-introspection vala github-releases
 
-- 
2.34.1


