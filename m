Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC107C3DA64
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 01:10:41 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.46588.1722215424359450708
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jul 2024 18:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PaZV3C57;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722215431; x=1753751431;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=m6U8/yadFCEBAQQ0ucAq1fsY6mvueFfrD/JWviOlg6k=;
  b=PaZV3C572rykBNGFJMgnAq7+uSxidm8kT3CwIRf++gkw6vscSLZUl1DT
   onm1+TmRhYOKGHSNXvemsZvEhErOIzHiZeNRL7rgINZ3c85FIA5T82Dkv
   hvAS0Q5PmkywLcHFzI2Wn+q+GUG5+mAakuwxhyJNfIiwItVS1/PpFMaxZ
   npSlwgHqNS/tFRiYmbX5mSU8kmP0e3TzI34G3MBR+qs+9w4HgCSNpyYMS
   xotTwIziQq8Gt5AyanWANskQ7SKyAbiehc0Jc3xNKfSVqDNdEYq4ZrjN0
   qAJvft8g6iMgcJPHZUMHUxiKPUGEGvOvtrJJXKUnluhQS0F5rX7MLKd9D
   w==;
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="147911732"
X-IronPort-AV: E=Sophos;i="6.09,245,1716217200"; 
   d="scan'208";a="147911732"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 10:10:30 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3BBB7E8D2B
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:28 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 76E99D5B5A
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:22 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id E320F20071A2C
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:21 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 987401A0002;
	Mon, 29 Jul 2024 09:10:21 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 09/33] libsolv: upgrade 0.7.29 -> 0.7.30
Date: Mon, 29 Jul 2024 09:09:44 +0800
Message-Id: <1722215408-27541-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
References: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28560.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28560.004
X-TMASE-Result: 10--0.736100-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrMVx/3ZYby78L62xXB+Btq/9h
	ZeynbNVA1jypNY0wtaZKtne3LfonHaM5eWmXzaW39k0tWBWiOf9UENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmiCGqH67UhpHsdZEkR8Y/meZHUt5D5Wmcl1bSmSk9HUNric9
	PyNm/U0eLzNWBegCW24nmFeyfGnuMLbigRnpKlKZx+7GyJjhAUzZohu16ADO4XTkzYE0xf9rU4u
	eb7WXDnB6jxHspe69+h8nU4Ys09MpOuvNIlGViCOrDKF9IgtjyZIDtZAWQBCqPD1k12V4Y57H2f
	VekOqwmYL1KImKhq1ZuOe7yPCBvAf2OJxbAVgHQ+kK598Yf3Mg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 01:10:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202595

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* removed dependency on external find program in the repo2solv
  tool
* bindings: fix return value of repodata.add_solv()
* new SOLVER_FLAG_FOCUS_NEW flag

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsolv/{libsolv_0.7.29.bb => libsolv_0.7.30.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libsolv/{libsolv_0.7.29.bb => libsolv_0.7.30.bb} (95%)

diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.29.bb b/meta/recipes-extended/libsolv/libsolv_0.7.30.bb
similarity index 95%
rename from meta/recipes-extended/libsolv/libsolv_0.7.29.bb
rename to meta/recipes-extended/libsolv/libsolv_0.7.30.bb
index ff0bd2d174..20d1baaaaf 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.29.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.30.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https \
            file://0001-utils-Conside-musl-when-wrapping-qsort_r.patch \
 "
 
-SRCREV = "9c2b1a84b5a7ce0dc6e74226bdeb9527d6706791"
+SRCREV = "27aa6a72c7db73d78aa711ae412231768e77c9e0"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-- 
2.34.1


