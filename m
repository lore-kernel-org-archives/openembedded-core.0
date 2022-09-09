Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9767AECAAD3
	for <webhook@archiver.kernel.org>; Fri,  9 Sep 2022 22:04:46 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by mx.groups.io with SMTP id smtpd.web10.1912.1662761081099628219
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Sep 2022 15:04:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm3
 header.b=WdtKvr4A;
 spf=pass (domain: gherzan.com, ip: 66.111.4.28, mailfrom: andrei@gherzan.com)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 0F3AE5C0111;
	Fri,  9 Sep 2022 18:04:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Fri, 09 Sep 2022 18:04:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm3; t=1662761080; x=1662847480; bh=uFnFnkNBLPrINKIPQ/Tolb3Lj
	WFHL7SiDXlhN1wEYM8=; b=WdtKvr4AVqku+0Wls7qAWo9lcsAGXE932FVsHmS+X
	Y6x+W1hogJV0GyS8wYfGB6F62RfetYtyF+hKB+uWnYLNDgzvhQhIhDUds3SsUgvg
	HRDFP9xBTyuq9pC0GkzFK5J27Cc9W9+SwFofLMKJ66UnDNBglOPrHHiosUXbEcbT
	bmEN7DuU+tchBm4qDKe/WDb5dKiczC68OqK6fu/xAkrBk/lJV7cgzf23bO62GFcD
	6+l14qgF9ohyYZCvLGNr6v0hd95WQbhXKQFwmdAk7W3SoEQsouzJ9WFQBPA8UKIE
	iw9XSCK7zvsp9WKBzcGVsFJSRv5UwLbPAJEpKAnUAeyUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1662761080; x=1662847480; bh=uFnFnkNBLPrINKIPQ/Tolb3LjWFHL7SiDXl
	hN1wEYM8=; b=ZLXfSA+Chn1PS5sH1j2hX1nETJtytqooPKUxxAk6uav6SXTmgL+
	CYbZPn8py+6SdpJBb7aLRx9KDjXRDplbZ/tx6VnqKByETTJetJdanpea67bsfDvE
	usQY2hnA7J+0D3ctifLalumTdczOW/wOFgJxE5nf27irXbKA387m9vz4GxRIuJzV
	adVyRGQRQpSbKFnOSMVIIMdDLo84XuQ9lGY4yjcsC3x/6bzgwRZnVqK1o3MmS0kt
	IM02TF4sLdxtP0Ph0sn4O7smAzymzmFe/uQVafiSHebjcSSp9seBhfcaf3/O06x1
	aHKNBzYvudW55yYOXjVxHsLYNw09B8Ohs6Q==
X-ME-Sender: <xms:d7gbY_V5TcliYYuB25deXbPWZH3hED35tBgpIGI1rZ2fDiCsomu6kw>
    <xme:d7gbY3knYX0wvZkqWd0OCHqRw-kKbpEdG1GO7or2AGicmuoXvoFx5i_q9K2P-5T_O
    c05VrUiwoGMt1mK1Ac>
X-ME-Received: 
 <xmr:d7gbY7bcwPRo-2u7Jeu2fpfKhg_jA7YUy699d8XrXCH_WcWCmxdzmKlhVv9wwAHYlfsqbOCmaYwnNv7yFQ271ZnpBlBlfMZ8_7HNtktWJAxtl29CeZE2smcl>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrfedtiedgtdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihesghhh
    vghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepieejlefhveevleffveegfeetle
    ejtedvgeejtddthefhhfdtiefhveegffeggeeknecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomheprghnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:d7gbY6XpFA2jg3F4Odm9OIlySUHwNocssWamVDvqq4aphVvRw7tyfA>
    <xmx:d7gbY5l9MRK9q2wBATmbpOxvmfFJsozBJMW3Vr-2TkJ4JAkLmRVkRg>
    <xmx:d7gbY3eM3C3W-OPk1nsvAC8Io0jhMeQ0uhHIr_APHhbJfyIV7GDc2A>
    <xmx:eLgbY5uk_wetX54JpGTIqH3vZOP28or8v9svZR7eDXmU6OaeW_BSMQ>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Sep 2022 18:04:39 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: openembedded-core@lists.openembedded.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [PATCH 1/4] depmodwrapper-cross: Take into consideration kernel
 package name
Date: Sat, 10 Sep 2022 00:04:22 +0200
Message-Id: <20220909220425.2737985-1-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Sep 2022 22:04:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170505

From: Andrei Gherzan <andrei.gherzan@huawei.com>

depmodwrapper assumes that the kernel package name is "kernel". Since
this is configurable via KERNEL_PACKAGE_NAME variable, the wrapper can
easily look in the wrong place. This change adds an optional positional
argument that can be used to provide the kernel package name - when not
provided, it defaults to "kernel" (current behaviour).

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 .../kmod/depmodwrapper-cross_1.0.bb              | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
index 303026ad78..6c0739d64f 100644
--- a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
+++ b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
@@ -21,13 +21,17 @@ do_install() {
 #!/bin/sh
 # Expected to be called as: depmodwrapper -a KERNEL_VERSION
 if [ "\$1" != "-a" -o "\$2" != "-b" ]; then
-    echo "Usage: depmodwrapper -a -b rootfs KERNEL_VERSION" >&2
+    echo "Usage: depmodwrapper -a -b rootfs KERNEL_VERSION [KERNEL_PACKAGE_NAME]" >&2
     exit 1
 fi
 
+kernelpkgname="kernel"
+# If no KERNEL_PACKAGE_NAME, assume "kernel".
+[ -z "\$5" ] || kernelpkgname="\$5"
+
 kernelabi=""
-if [ -r "${PKGDATA_DIR}/kernel-depmod/kernel-abiversion" ]; then
-    kernelabi=\$(cat "${PKGDATA_DIR}/kernel-depmod/kernel-abiversion")
+if [ -r "${PKGDATA_DIR}/\${kernelpkgname}-depmod/\${kernelpkgname}-abiversion" ]; then
+    kernelabi=\$(cat "${PKGDATA_DIR}/\${kernelpkgname}-depmod/\${kernelpkgname}-abiversion")
 fi
 
 if [ ! -e "\$3${nonarch_base_libdir}/depmod.d/exclude.conf" ]; then
@@ -35,11 +39,11 @@ if [ ! -e "\$3${nonarch_base_libdir}/depmod.d/exclude.conf" ]; then
     echo "exclude .debug" > "\$3${nonarch_base_libdir}/depmod.d/exclude.conf"
 fi
 
-if [ ! -r ${PKGDATA_DIR}/kernel-depmod/System.map-\$4 ] || [ "\$kernelabi" != "\$4" ]; then
-    echo "Unable to read: ${PKGDATA_DIR}/kernel-depmod/System.map-\$4" >&2
+if [ ! -r ${PKGDATA_DIR}/\${kernelpkgname}-depmod/System.map-\$4 ] || [ "\$kernelabi" != "\$4" ]; then
+    echo "Unable to read: ${PKGDATA_DIR}/\${kernelpkgname}-depmod/System.map-\$4" >&2
     exec env depmod -C "\$3${nonarch_base_libdir}/depmod.d" "\$1" "\$2" "\$3" "\$4"
 else
-    exec env depmod -C "\$3${nonarch_base_libdir}/depmod.d" "\$1" "\$2" "\$3" -F "${PKGDATA_DIR}/kernel-depmod/System.map-\$4" "\$4"
+    exec env depmod -C "\$3${nonarch_base_libdir}/depmod.d" "\$1" "\$2" "\$3" -F "${PKGDATA_DIR}/\${kernelpkgname}-depmod/System.map-\$4" "\$4"
 fi
 EOF
 	chmod +x ${D}${bindir_crossscripts}/depmodwrapper
-- 
2.25.1


