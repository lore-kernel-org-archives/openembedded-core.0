Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9185C54E41
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 07:41:52 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.8536.1709106109493733231
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 23:41:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Ltf9F+fT;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709106109; x=1740642109;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YHqw8EP4c1ZLZmyuJne1TkT67ugrZ8xjfOTagQaMe4U=;
  b=Ltf9F+fTvTlC6PWFCoTeWZz19e716Hwkp29q5S2pTSs4KjUonlVxC2Sy
   7F3Yu5JhuI7nGy+BmYEgwUmH8SdaOeuKVpVGuYiv/Tqt/gvHr88+hpHs/
   cGhnwdcXI6+DhIb7wGQdRhbKBKGtSwEwQP2pNGvBRuySMAMy1JF1Akplo
   hy+an+AVcTfDiNk3f3TwsJKc7pmtuay+N6fb/7howcdHo8Mi5vHV+N1v9
   rRszjIp5cnhaBuFMbnzknSCS+WivT/ordnw5dpYNBqffq/FrY9JRB1BUy
   mCXqOD1HiWJ3l7BSjTGuNODaA5uZWq/Hq1tgG0lt971rB/mfCAU5lGdU6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="129960292"
X-IronPort-AV: E=Sophos;i="6.06,190,1705330800"; 
   d="scan'208";a="129960292"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 16:41:47 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 24FBEF0FF1
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:41:45 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4D4DCD561F
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:41:44 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id E16222008FF8A
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:41:43 +0900 (JST)
Received: from ubuntu20.04 (unknown [10.193.130.22])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6C3391A006A;
	Wed, 28 Feb 2024 15:41:43 +0800 (CST)
From: leimaohui@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [PATCH] rpm: Fix the following error when run nativesdk-rpm in nativesdk environment.
Date: Wed, 28 Feb 2024 15:41:41 +0800
Message-Id: <20240228074141.1618722-1-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28218.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28218.005
X-TMASE-Result: 10--2.275700-10.000000
X-TMASE-MatchedRID: OPOr7Hp7We+4T7uLRdUewXnLJGGZe5swN5dqZcIK7Vgg9R3V8qg5xL8F
	Hrw7frluRK4fQsyK1ppSlC60HsID+PG1EcJ9UEx5lOneJcroAxQQOcMSo0926v4DDXoaCqk70Xt
	CztYVPqWC7PwCCLVSIoAy6p60ZV62fJ5/bZ6npdjiRhduhvElsvJT+hf62k2Yo9wYRlAg0MmkBZ
	SQ2V+8TVzRtSrfaIQZsKzaS7d/L4bRCqHQI6mJiJo9AQ8aAO44kBADaXFpYMjr34v4jqq1GWGdf
	s4EQDv4GurXI9mjEM0hyadlGFXHKsTgfCdKUS4cicSkmYsAV+kLUU1zqiphVX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 07:41:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196375

From: Lei Maohui <leimaohui@fujitsu.com>

  package busybox-inittab-1.36.1-r0.ubinux_x86_64 is intended for a different architecture
  package busybox-udhcpc-1.36.1-r0.core2_64 is intended for a different architecture
  package ldconfig-2.39+git0+312e159626-r0.core2_64 is intended for a different architecture
  ......

CMAKE_INSTALL_SYSCONFDIR is necessary. If not set
CMAKE_INSTALL_SYSCONFDIR, nativesdk-rpm will use the default setting:
/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-ubinuxsdk-linux/etc to find rpmrc file.

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 meta/recipes-devtools/rpm/rpm_4.19.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rpm/rpm_4.19.1.bb b/meta/recipes-devtools/rpm/rpm_4.19.1.bb
index 1f8611a29c..a495f7ced2 100644
--- a/meta/recipes-devtools/rpm/rpm_4.19.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.19.1.bb
@@ -57,7 +57,7 @@ EXTRA_OECMAKE:append:libc-musl = " -DENABLE_NLS=OFF -DENABLE_OPENMP=OFF"
 # --sysconfdir prevents rpm from attempting to access machine-specific configuration in sysroot/etc; we need to have it in rootfs
 # --localstatedir prevents rpm from writing its database to native sysroot when building images
 EXTRA_OECMAKE:append:class-native = " -DCMAKE_INSTALL_SYSCONFDIR:PATH=/etc -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=/var"
-EXTRA_OECMAKE:append:class-nativesdk = " -DCMAKE_INSTALL_FULL_SYSCONFDIR=/etc"
+EXTRA_OECMAKE:append:class-nativesdk = " -DCMAKE_INSTALL_SYSCONFDIR:PATH=/etc -DCMAKE_INSTALL_FULL_SYSCONFDIR=/etc"
 
 inherit cmake gettext pkgconfig python3targetconfig
 OECMAKE_GENERATOR = "Unix Makefiles"
-- 
2.34.1


