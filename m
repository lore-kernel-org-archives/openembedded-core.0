Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C920CC6FA99
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 01:40:46 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.12551.1678239646201227520
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Mar 2023 17:40:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=d1VLjC1p;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678239644; i=@fujitsu.com;
	bh=cRarFgNMZcPDsK6EYRvz+PPOyooKBOuG7Y/Etx1w0Ic=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=d1VLjC1pYY15SbQZ3yjCZX8EHUdIiBUI9g+N7viWmCJUG0/51JarjLiySrnXvpX5p
	 L9mBSK0hcAfGv4ZZDS7gH255qY5GBJBVXIPztOQZ8upeHAoF+P7sd6xn+CPy4Oa50m
	 adAcZpZJXtgKoxNp1ShBO3BKzympKa2FElq2bOG/2SQh85V+lXFpOz/OhqEMbi3+PD
	 E3ifv2kCW4c2/45fwi6rQzPWPGYxuicyWT+FeejnN90wtayUPfq1xRDk2z4YDZwafG
	 FJKfhDg3b8bTy7zKhUf6vZPQDZvf5a/qjNXr79HMQSmnqWlQrfcR6ivwH4srl3KtPj
	 sk7OfR5Nl80aw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8ORqDv7OXu
  KweEXZhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bdWW8ZC1bzVDR0nGdtYPzM1cXIxSEk8JhR
  4uH85exdjJxAznUmiavdpRCJPYwSy469YAZJsAlISdy4/5+ti5GDQ0RAT+LqP1GQMLOAisSL3
  z1gvcICwRKn7qxhBbFZgOK3zx9iAbF5BZwkzny/xghiSwgoSEx5+B5sJKeAs8TcvcfZIPY6Sb
  zrnQBVLyhxcuYTFoj5EhIHX0CcICGgKDH7cjMLhF0p0frhF5StJnH13CbmCYyCs5C0z0LSvoC
  RaRWjaXFqUVlqka6RXlJRZnpGSW5iZo5eYpVuol5qqW55anEJUCaxvFgvtbhYr7gyNzknRS8v
  tWQTIzBwU4pV+3cwru39q3eIUZKDSUmUd98R9hQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKErw+D
  4FygkWp6akVaZk5wCiCSUtw8CiJ8G4GaeUtLkjMLc5Mh0idYlSUEufd/BQoIQCSyCjNg2uDRe
  4lRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8CveBpvBk5pXATX8FtJgJaPGF/Swgi0sSEVJ
  SDUy5Vnr5V9enmVxQkj+7O7BG3qRfeevHpfn6sVKp7r3dBaWsbCyb/Pv+JajWdF/au3Qt8/tm
  g5PVWVfZwq9P4mGN19QWrY2ZcWiNo+X87n3x5eZ6mQpv33z0XBMgJ7n/4q+/t7/OfvJ22/Qno
  osvMslp6ez6o2rFF/ps/XG30z83rLx4UsPe8qzGrI3Xt5nFLV3SzhgTeT5sbYhF2r0Xdq98rZ
  ru7e98OUWLU8LhpnRiRsxTLWu7lXV+08Wrb7Suk676nLYvoepWl705X5izyPG125aLFVawKrC
  yTebOrPq1cu8lTuGr4pYHkuY/vpu9c/ssb13HSbu+8Gzfdfjl3cezWzc7bHj4Qu20sdJa/UVK
  LMUZiYZazEXFiQCkYL4aVwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-565.messagelabs.com!1678239643!47092!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27880 invoked from network); 8 Mar 2023 01:40:43 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-17.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Mar 2023 01:40:43 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 96A4A100182
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Mar 2023 01:40:43 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 8A16D100043
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Mar 2023 01:40:43 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 8 Mar 2023 01:40:41 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH V4 3/5] vala: Fix install conflict when enable  multilib.
Date: Wed, 8 Mar 2023 09:40:17 +0800
Message-ID: <1678239619-21210-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678239619-21210-1-git-send-email-wangmy@fujitsu.com>
References: <1678239619-21210-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 01:40:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178149

From: Wang Mingyu <wangmy@fujitsu.com>

Error: Transaction test error:
   file /usr/bin/vala-gen-introspect-0.56 conflicts between attempted installs of lib32-vala-0.56.3-r0.armv7ahf_neon and vala-0.56.3-r0.aarch64
   file /usr/bin/vapigen-wrapper conflicts between attempted installs
   of lib32-vala-0.56.3-r0.armv7ahf_neon and vala-0.56.3-r0.aarch64

The differences of vala-gen-introspect-0.56 are as follows:
@@ -2,7 +2,7 @@

 prefix=/usr
 exec_prefix=/usr
-libdir=/usr/lib64
+libdir=/usr/lib
 pkglibdir=${libdir}/vala-0.56

 if [ $# -ne 2 ]

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/vala/vala.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/vala/vala.inc b/meta/recipes-devtools/vala/vala.inc
index d3daee37dc..162e99bb03 100644
--- a/meta/recipes-devtools/vala/vala.inc
+++ b/meta/recipes-devtools/vala/vala.inc
@@ -50,6 +50,9 @@ do_install:append:class-target() {
 # vapi files.
 SYSROOT_DIRS += "${bindir_crossscripts}"
 
+inherit multilib_script
+MULTILIB_SCRIPTS = "${PN}:${bindir}/vala-gen-introspect-0.56"
+
 SYSROOT_PREPROCESS_FUNCS:append:class-target = " vapigen_sysroot_preprocess"
 vapigen_sysroot_preprocess() {
         # Tweak the vapigen name in the vapigen pkgconfig file, so that it picks
@@ -64,5 +67,5 @@ SSTATE_SCAN_FILES += "vapigen-wrapper"
 PACKAGE_PREPROCESS_FUNCS += "vala_package_preprocess"
 
 vala_package_preprocess () {
-	sed -i -e 's:${RECIPE_SYSROOT}::g;' ${PKGD}${bindir_crossscripts}/vapigen-wrapper
+	rm -rf ${PKGD}${bindir_crossscripts}
 }
-- 
2.34.1


