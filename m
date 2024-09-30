Return-Path: <shin.matsunaga@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F30D4CF6497
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 09:23:39 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.50560.1727688209891677062
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Sep 2024 02:23:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jtkWFYet;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: shin.matsunaga@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727688211; x=1759224211;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9c3ev8gYS7QRslnkWPsWX5apFNTqi++HlKOrt2UIU04=;
  b=jtkWFYetuplY8EpEkqt/4Y9jzLGzS5RPBN6bt/xlg/AfGn5KBFrbtv6A
   GrJZcBE3328SXXFVixlvIikZKDxwJfcPiV9u0ASDBfBzI3vfpDsfWPZj1
   ZSWPmW/74ZvzecTy1eCfY04cuxvruNPlgEWCf+aI6J8ow9xryL2KEfjCt
   6oPbuNvttavhrIbTHgHtfnhFpxYj9U5HJ2ZAnSwrWubEHD3SpbvT8sCw2
   NM+e8BcNMYdxzRZWKwkR23ix9iYErGukJNrnKeNTIZ6d7XZDAIzbrA6fD
   uCfKWOibsP0LFhJHLf8TNrtrPmuRM284l7w4PYUvuAz1xvKvRhcATyYZA
   Q==;
X-CSE-ConnectionGUID: wi/CHNmHRuWvGNowBGL4Cw==
X-CSE-MsgGUID: VJmCjbG1RQOZejBvFsV29Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="175242821"
X-IronPort-AV: E=Sophos;i="6.11,165,1725289200"; 
   d="scan'208";a="175242821"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 18:23:28 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 97868D2AA6
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 18:23:25 +0900 (JST)
Received: from storage.utsfd.cs.fujitsu.co.jp (storage.utsfd.cs.fujitsu.co.jp [10.118.252.123])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id BDBFAD8ADA
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 18:23:24 +0900 (JST)
Received: by storage.utsfd.cs.fujitsu.co.jp (Postfix, from userid 1068)
	id 9001C12796; Mon, 30 Sep 2024 18:23:24 +0900 (JST)
From: Shinji Matsunaga <shin.matsunaga@fujitsu.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	shin.matsunaga@fujitsu.com
Subject: [PATCH] shadow: Fix CVE_PRODUCT
Date: Mon, 30 Sep 2024 18:23:22 +0900
Message-Id: <20240930092322.24777-1-shin.matsunaga@fujitsu.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 09:23:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205104

Fix "shadow" set in CVE_PRODUCT to "shadow_project:shadow" to detect only vulnerabilities where the vendor is "shadow_project".

Currently, CVE_PRODUCT also detects vulnerabilities where the vendor is "debian" or "suse" or "blade-group",
which are unrelated to the "shadow" in this recipe.
https://app.opencve.io/cve/?vendor=debian&product=shadow
https://app.opencve.io/cve/?vendor=suse&product=shadow
https://app.opencve.io/cve/?vendor=blade-group&product=shadow

In addition, all the vulnerabilities currently detected in "shadow" have the vendor of "debian" or "suse" or "blade-group" or "shadow_project".
Therefore, fix "shadow" set in CVE_PRODUCT to "shadow_project:shadow".

Signed-off-by: Shinji Matsunaga <shin.matsunaga@fujitsu.com>
---
 meta/recipes-extended/shadow/shadow_4.16.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/shadow/shadow_4.16.0.bb b/meta/recipes-extended/shadow/shadow_4.16.0.bb
index e57676c1da..30198fc9b3 100644
--- a/meta/recipes-extended/shadow/shadow_4.16.0.bb
+++ b/meta/recipes-extended/shadow/shadow_4.16.0.bb
@@ -8,3 +8,5 @@ BBCLASSEXTEND = "native nativesdk"
 
 # https://bugzilla.redhat.com/show_bug.cgi?id=884658
 CVE_STATUS[CVE-2013-4235] = "upstream-wontfix: Severity is low and marked as closed and won't fix."
+
+CVE_PRODUCT = "shadow_project:shadow"
-- 
2.25.1


