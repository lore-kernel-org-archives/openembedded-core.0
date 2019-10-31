Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 297027F9B9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 16:22:04 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id o28so6910588wro.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 09:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Fx7w+JLngzezr3lUzSINSxZHgwnWFW9YO0z6hmV4f8M=;
	b=swIiSSc59ZsQ3A3w/yOrzwOZMAJlDOCcehkh/MXbqfG6CfXtmB6T+BI5r1hjTHLvEl
	7lnyIbbhcjKtgRwd6ju/COABaCF7y3Td2PCeVutsSVJBYwN2YF5n7gYqpP1rxuWA1FcL
	P5616EZ0UhEw4sZs6PCazjozq+dqZqXCCrRs6S1Yiy8EkHvqj+PA4N0GbpBtmTBq3tad
	wRkd3QJcuo7SnAPkgMasNLmDOnmargCHdcGzS0wMAdrzW2vP42VyBe1lcleh3oUm3ikX
	XXz6YVcpfDLxsEAeUk4yvHLUP0VhjcvmQmkovvSrsN/pWaTHKTxE67n5f6o+Vqb9nN6R
	3xcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Fx7w+JLngzezr3lUzSINSxZHgwnWFW9YO0z6hmV4f8M=;
	b=ep99ejCcymCtNL+8beDBvpmk2bdVO1hrJE25385OfaL8d6jjNpt6B43lOVIr+elFCw
	jf7lYEGwOi33MewPYAMmbz//WU9HKqZhWuiwPbfBM0AoBOOY3yx1QY6RQzCfRWNKMJnk
	enq+EtMztRRXFrloYIg92HLnY7oo/hOWxhc6/dqYErlGdB2+R+iyjOoDqYAjOgFhnDr9
	ttOD7gBCIi/pR87fBaXwssAqHsznMiCxCCPy7J5D++VkYzNOUyy7DEZg9/KXM8yktu+e
	tGRTo1wXxEZ4MqLVmqN7IqI7f4O19hRSLgsAVrGRMXarAyWE/ge3gGAVDvtqhUgOOXum
	gpgQ==
X-Gm-Message-State: APjAAAVkmDmLn5op2DhHYGTHotBkuyr2sH0sKeCTnguK4p4X9J3JsCml
	gyUOQ0tkE4FADusGDHaNXaWPAdD0tpo=
X-Google-Smtp-Source: APXvYqy+qQhGiYM3mEoWb81ynn7qVBP5UL5q7S0RabrY23Gs4BKKCkPgVR0ULeEDa2c5pmuvmhRzmA==
X-Received: by 2002:a5d:6203:: with SMTP id y3mr6544375wru.142.1572538925316; 
	Thu, 31 Oct 2019 09:22:05 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id a8sm3077903wme.11.2019.10.31.09.22.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 31 Oct 2019 09:22:03 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Oct 2019 16:22:00 +0000
Message-Id: <20191031162200.2443-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] recipeutils-test: use a small dependency in the dummy recipe
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
X-List-Received-Date: Thu, 31 Oct 2019 16:22:05 -0000
Content-Transfer-Encoding: 8bit

recipeutils-test has virtual/libx11 as a DEPENDS, but this will cause errors if
the recipe is built in an environment without x11 in DISTRO_FEATURES.

This dependency isn't actually used for anything so we could remove it, but to
save updating the test cases too just swap virtual/libx11 for zlib.

[ YOCTO #13611 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb b/meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb
index 7c20d9a683e..0cd0494da8f 100644
--- a/meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb
+++ b/meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb
@@ -4,7 +4,7 @@ require recipeutils-test.inc
 
 LICENSE = "Proprietary"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/somefile;md5=d41d8cd98f00b204e9800998ecf8427e"
-DEPENDS += "virtual/libx11"
+DEPENDS += "zlib"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.20.1


