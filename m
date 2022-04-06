Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15FC6C4708D
	for <webhook@archiver.kernel.org>; Wed,  6 Apr 2022 16:33:20 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web08.7884.1649247565018662142
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Apr 2022 05:19:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=LJVMokTc;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649247563; i=@fujitsu.com;
	bh=WjmG96UM0NURdBk5botwJB76lVjbyANRu5dPgF+KhG0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=LJVMokTcyf/REhrajRCaiw8vvo4FQBUKGAnDccSqcQ3fuEf0PnDoR+ynQ9V1p1i74
	 jICt89Pfh3pUXoF2qEE49aQseEZNIZoJgKV7nY7Z87TwH+ZwQKTMW93oLg3KjijssL
	 sLvyszQw6l8tx2S5e7dttFPmBVG9JiQl8nFNZ9JnIosp+ECA/OR6gdCDkXeXXv4h/O
	 DZ9XWJldyBllQioVEftljifhF4inl5IWv5c0S8ZGXM/XxaWjSk0eN0I4k053nMWrAc
	 nl2LKiUKzJ0ZFk4tHpCLgrbukVexe45JX2K2PprmwKWBw5/qMS7azVAxc/sLnL163G
	 kubXAOT+ISzGA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+GYouvV6pt
  ksPmBocWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmvF35g32ggM8Fb3dS9kbGM9wdTFycQgJzGSS
  ODd5MwuEs59R4vDGnaxdjJwcbAL6EhvXfWLqYuTgEBHQk7j6TxQkLCxgIfHhYw8LiM0ioCJxe
  Ok/dhCbV8BdonvKeiYQW0JAQWLKw/fMEHFBiZMzn4DVMwtISBx88YIZZKSEgKLE7OnyEOUVEq
  8PX2KewMgzC0nHLCQdCxiZVjFaJRVlpmeU5CZm5ugaGhjoGhqa6hroGhma6iVW6SbqpZbqlqc
  Wl+ga6iWWF+ulFhfrFVfmJuek6OWllmxiBAZSSjHD9R2ME/t+6h1ilORgUhLl3V/umyTEl5Sf
  UpmRWJwRX1Sak1p8iFGGg0NJgle+CSgnWJSanlqRlpkDDGqYtAQHj5IIr1YNUJq3uCAxtzgzH
  SJ1ilFRSpw3oxkoIQCSyCjNg2uDRdIlRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8k0Cm8G
  TmlcBNfwW0mAlo8bszniCLSxIRUlINTExfrmSku5z1C+gJtLy16tuDrSwu9y5qpijcs9zh3dQ
  qK7BC9kGkT+Xs+h/PdpYpHJm0s7vC7cwze84CFflfR/5Vyle4XNmcdDBwkl7rrzi1TsU5Eose
  rLZOk5naUt7U8fHdqiN+7+o496wQ1j+t5qb9YKOObqv5cbmPh8vdv9ps3DJrU66V9cnKqls8P
  pIHHTak2mzeO4NlhXblfX1vn5ozayU2CQt18Tum3MlXOc95ZIUKU14bh4ZXgtX7+V8251oYBT
  +O3/aTKXR5E7vZ8+KY55ce+i2NEzzXOONz5j3hb11lvR7HnEoWpYp3NX3Y2OZyISJBwv7Ti6A
  gu5Lnefmxdux/vc7EPNwaf3aVEktxRqKhFnNRcSIAuLcBpR8DAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-15.tower-585.messagelabs.com!1649247562!114817!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28411 invoked from network); 6 Apr 2022 12:19:22 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-15.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 6 Apr 2022 12:19:22 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 236CJH6A005459
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 6 Apr 2022 13:19:22 +0100
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 6 Apr 2022 13:19:16 +0100
From: "zhengrq.fnst" <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] expat: upgrade 2.4.7 -> 2.4.8
Date: Wed, 6 Apr 2022 20:19:07 +0800
Message-ID: <1649247547-1242-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Apr 2022 16:33:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164078

Changelog:
=========
 Other changes:
     #587  pkg-config: Move "-lm" to section "Libs.private"
     #587  CMake|MSVC: Fix pkg-config section "Libs"
 #55 #582  CMake|macOS: Start using linker arguments
             "-compatibility_version <version>" and
             "-current_version <version>" in a way compatible with
             GNU Libtool
#590 #591  Version info bumped from 9:7:8 to 9:8:8;
             see https://verbump.de/ for what these numbers do

 Infrastructure:
     #589  CI: Upgrade Clang from 13 to 14

 Special thanks to:
     evpobr
     Kai Pastor
     Sam James


Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 meta/recipes-core/expat/{expat_2.4.7.bb => expat_2.4.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/expat/{expat_2.4.7.bb => expat_2.4.8.bb} (91%)

diff --git a/meta/recipes-core/expat/expat_2.4.7.bb b/meta/recipes-core/expat/expat_2.4.8.bb
similarity index 91%
rename from meta/recipes-core/expat/expat_2.4.7.bb
rename to meta/recipes-core/expat/expat_2.4.8.bb
index bf1ca8d56e..980c488640 100644
--- a/meta/recipes-core/expat/expat_2.4.7.bb
+++ b/meta/recipes-core/expat/expat_2.4.8.bb
@@ -14,7 +14,7 @@ SRC_URI = "https://github.com/libexpat/libexpat/releases/download/R_${VERSION_TA
 
 UPSTREAM_CHECK_URI = "https://github.com/libexpat/libexpat/releases/"
 
-SRC_URI[sha256sum] = "e149bdd8b90254c62b3d195da53a09bd531a4d63a963b0d8a5268d48dd2f6a65"
+SRC_URI[sha256sum] = "a247a7f6bbb21cf2ca81ea4cbb916bfb9717ca523631675f99b3d4a5678dcd16"
 
 EXTRA_OECMAKE:class-native += "-DEXPAT_BUILD_DOCS=OFF"
 
-- 
2.25.1


