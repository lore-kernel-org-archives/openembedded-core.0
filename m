Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 570A9CF9C7D
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 06:49:54 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.9329.1727246991442500213
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 23:49:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SRb739Xq;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727246992; x=1758782992;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=uLbuBc/3xZ9loIXzqe3OyHxKmbCAA53YwP6C9XoLQ3Q=;
  b=SRb739XqcqPFec/Tdb8c2nWI32nBEx5YtRqWk2XE0E0QA4V45RrIKPQH
   qfVkt2fFGN/MwBLlFPfsCPqgEJXuZxCk4W9Gn+UNVqTI3P7jUpwxXhRlL
   d6VFEPJZjwng1txyjzOQj1e0vkmLinUkNdEDy72wJ6VAWBHUZWbNReSd+
   ItJWyyR6rL/l//IRxAMlEYWdMs66cWQFr023wK4/eX3GY9cRpUhYSwA3P
   uhhlnzToc8dkgyqlQl3LBYa9j3qw/KznZsEeJ1gd0dwvFsbY4jJmr0ozm
   /k3cdnYT39kcAf54KzLCIkWGHkMe35vuwwSj4GtePc+2lpNitjW3Ps596
   A==;
X-CSE-ConnectionGUID: agR1FwTeSkaqELQD/JBMcA==
X-CSE-MsgGUID: hK/9aOLCRDC3gF9nTitO+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="173949724"
X-IronPort-AV: E=Sophos;i="6.10,256,1719846000"; 
   d="scan'208";a="173949724"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 15:49:49 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id B6D8FD8017
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:46 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3495BD900B
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:35 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id A590520086326
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:34 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 55F121A01E9;
	Wed, 25 Sep 2024 14:49:34 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 08/47] gobject-introspection: upgrade 1.80.1 -> 1.82.0
Date: Wed, 25 Sep 2024 14:48:41 +0800
Message-Id: <1727246960-20665-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
References: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28686.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28686.005
X-TMASE-Result: 10--5.483300-10.000000
X-TMASE-MatchedRID: 19A9OAtP7iyjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqz+Aw16GgqpO5Zh
	jmb07zEXuzW0mXOtDblZLssvIGkU4+x6sVFArPFq7pujb8urdzb8SjXSxldPU6BV7EBTCWxBCxm
	2yCUzRNekCsug9Bu7CGtF9sTtzaRRplK4ct3ck8heR7q0tTqVwgeDbc64+XV0EY9kYRK4JXTVNH
	oA03J/CMV48f5CEASiFyqgQHGhZlXgS1I0HMWkYDllFsU0CXSPWq/snXbxpCCU8ftiyKjZrdMjj
	wb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNuce7gFxhKa3zndiJkHFMhPt9kl8N0IhcHYwd
	SmesTACqJw61GpPIsoAy6p60ZV62fJ5/bZ6npdg7AFczfjr/7N3kRzCM5H2X9FX+05si8gM28tn
	YUmkFqh3QQZPtmkHE7yuVDlMiJWQ=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 06:49:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204928

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Require GLib 2.82.0
* Add rpath when building the type dumper on macOS
* Fix regression in the installation of GIRepository-2.0.typelib
* Add strict mode warning for enumeration members starting with a number
* Set deprecation message for signals and properties
* Fix HTML definition lists in the documentation generator
* Catch up with Python-Markdown 3.4 extension API changes
* Propagate scanner errors
* Do not break when parsing ARM SVE types in system headers
* Pair pointer GTypes with their opaque structure
* Fix property accessor pairing
* Handle pid_t, etc. as their own top-level types
* Add warning for closure annotation
* Warn on invalid callback annotations
* Make sure to set a GError with an invalid introspect-dump string
* Move gobject-introspection tests to a submodule
* Remove dependency on distutils.msvccompiler
* Be more thorough about applying -Wl,--no-as-needed option
* Documentation and build fixes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-introspection_1.80.1.bb => gobject-introspection_1.82.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gobject-introspection/{gobject-introspection_1.80.1.bb => gobject-introspection_1.82.0.bb} (99%)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb
similarity index 99%
rename from meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb
rename to meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb
index e161f3ca2d..15032520bb 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c434e8128a68bedd59b80b2ac1eb1c4a \
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}", 2)}/${BPN}-${PV}.tar.xz \
            "
 
-SRC_URI[sha256sum] = "a1df7c424e15bda1ab639c00e9051b9adf5cea1a9e512f8a603b53cd199bc6d8"
+SRC_URI[sha256sum] = "0f5a4c1908424bf26bc41e9361168c363685080fbdb87a196c891c8401ca2f09"
 
 SRC_URI:append:class-native = " file://0001-Relocate-the-repository-directory-for-native-builds.patch"
 
-- 
2.34.1


