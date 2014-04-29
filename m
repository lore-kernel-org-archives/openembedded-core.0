Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id 9272C609B1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Apr 2014 18:23:27 +0000 (UTC)
Received: by mail-la0-f48.google.com with SMTP id gf5so446987lab.35
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Apr 2014 11:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=QoUAjISKDUIiLXAq42TC2sb+v4EjCpUWeHkAxWCSyIo=;
	b=spOrqUJGrYYxb23xBkd3Y7CSGMSIEWzdTCZUxhWH1bEmEByblq7zUhrJPVkbJ4xxDp
	FxTshY5/XZpVHl39j/z8sp1vq62+0teLGHUvyp+4TEz3sIZEFyVzfGX9d+Jmx8Cr+n1P
	8BDffCKu4UzhEEl4nnyPTiM8vGj8w+G4WV9fhPNmi+5hnXb5q1/TC8Zw6Oq/fyVbUY7C
	RKYP6TacKA02t9BNNQqxRawKdiMVlF8KJW2yPqhvUcuRd/HAKQDuFoaYdMg3Pdb7h0TR
	4a7nln5O1kkTlIkSdkNaKW/amqBfHX28bQAaiIPV/VhdL2mclIL764eBq11rvGHR4Yh3
	6oTg==
X-Received: by 10.112.150.233 with SMTP id ul9mr499220lbb.2.1398795807075;
	Tue, 29 Apr 2014 11:23:27 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	a7sm23430355lbc.9.2014.04.29.11.23.24 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Apr 2014 11:23:25 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Apr 2014 20:23:32 +0200
Message-Id: <1398795812-19400-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] feature-arm-thumb.inc: set ARMPKGSFX_THUMB only when thumb is in TUNE_FEATURES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Apr 2014 18:23:32 -0000

* there is issue for TUNE_PKGARCH missing in PACKAGE_ARCHS for machines
  without thumb enabled, it was reported by Jacob Kroon on IRC

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/arm/feature-arm-thumb.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc b/meta/conf/machine/include/arm/feature-arm-thumb.inc
index 8a38665..670e68e 100644
--- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
+++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
@@ -28,7 +28,7 @@ python () {
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', ' -m${ARM_M_OPT}', '', d)}"
 OVERRIDES .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', ':thumb', '', d)}"
 
-ARMPKGSFX_THUMB .= "${ARM_THUMB_SUFFIX}"
+ARMPKGSFX_THUMB .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', '${ARM_THUMB_SUFFIX}', '', d)}"
 
 # Whether to compile with code to allow interworking between the two
 # instruction sets. This allows thumb code to be executed on a primarily
-- 
1.9.1


