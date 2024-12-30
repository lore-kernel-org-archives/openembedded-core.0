Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7EDEE77194
	for <webhook@archiver.kernel.org>; Mon, 30 Dec 2024 07:29:39 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.58970.1735543769111371244
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Dec 2024 23:29:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XpIB7Jgq;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735543775; x=1767079775;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=c25h2C1BykSesEIvxfkD2XnU7O4GndVJ6Jty/dKYZUY=;
  b=XpIB7JgqRYbhIkwlas9rITluoHSCkVWnL82z6KuTqP0w+apfFzUNZK6x
   QDkoyQXHJ8SUvntlEop2PKLHxrw8dSHN72mjEfalkQauRgQht3xU6pKoG
   30jsUOJr6A6TiWAIkIMNYh2xncjwKq8Jt/ha9/kYtXO5ujQKskisPwprL
   cFZPwk/OEMrG682vXSU3WqmK8HOFqDHrhU9l3P9fjhs6Xfiw6R1t0Ro45
   qWDM8adml5ZyjL9FidXUa2bYdRvSGW9hpRGb0vl2/uQrJSAITclDyEnom
   VeYZgHBfMPltut9ey5P7SiRH6D1cu2V8FeH7eOC8/0En3lLPyKOAhzvtn
   A==;
X-CSE-ConnectionGUID: dGZHBGSEQsaUS4W1mYDUxw==
X-CSE-MsgGUID: kYbHfzUpQnGbPG6gVR6xbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="173278727"
X-IronPort-AV: E=Sophos;i="6.12,275,1728918000"; 
   d="scan'208";a="173278727"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 16:29:33 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 91041D4C2B
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 16:29:31 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 57F4CD748C
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 16:29:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id E8C2470BE2
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 16:29:30 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 951091A0003;
	Mon, 30 Dec 2024 15:29:30 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 6/6] systemd: upgrade 257 -> 257.1
Date: Mon, 30 Dec 2024 15:29:20 +0800
Message-Id: <1735543760-2456-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735543760-2456-1-git-send-email-wangmy@fujitsu.com>
References: <1735543760-2456-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28890.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28890.005
X-TMASE-Result: 10--0.963600-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4Bqqq9awALpxCysPB8dBBorQec
	3JTmkn8uJMPD8FR5f58boCivyaDEErVQ6XPWwtdyEXjPIvKd74CYkAyCbA7KVws5GlXF672zo8W
	MkQWv6iUoTQl7wNH8PuTCMddcL/gjxlblqLlYqXK95DTwWQIYylJJe8adVjbMOhBWzHgCtbxeKX
	Yed+LZj17r+AWNVyOooQUqMoma7EhvvKO56qWHVo05Jhy3KagAvk0LgK9GfB/+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 07:29:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209145

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{systemd-boot-native_257.bb => systemd-boot-native_257.1.bb} | 0
 .../systemd/{systemd-boot_257.bb => systemd-boot_257.1.bb}      | 0
 meta/recipes-core/systemd/systemd.inc                           | 2 +-
 meta/recipes-core/systemd/{systemd_257.bb => systemd_257.1.bb}  | 0
 4 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/systemd/{systemd-boot-native_257.bb => systemd-boot-native_257.1.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-boot_257.bb => systemd-boot_257.1.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_257.bb => systemd_257.1.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot-native_257.bb b/meta/recipes-core/systemd/systemd-boot-native_257.1.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot-native_257.bb
rename to meta/recipes-core/systemd/systemd-boot-native_257.1.bb
diff --git a/meta/recipes-core/systemd/systemd-boot_257.bb b/meta/recipes-core/systemd/systemd-boot_257.1.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_257.bb
rename to meta/recipes-core/systemd/systemd-boot_257.1.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 67b9e28ce1..65785ac098 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -15,7 +15,7 @@ LICENSE:libsystemd = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "70bae7648f2c18010187c9cf20093155eaa26029"
+SRCREV = "47eea9ee9f46537bc18d6a64fa21fd9c50538e13"
 SRCBRANCH = "v257-stable"
 SRC_URI = "git://github.com/systemd/systemd.git;protocol=https;branch=${SRCBRANCH}"
 
diff --git a/meta/recipes-core/systemd/systemd_257.bb b/meta/recipes-core/systemd/systemd_257.1.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd_257.bb
rename to meta/recipes-core/systemd/systemd_257.1.bb
-- 
2.43.0


