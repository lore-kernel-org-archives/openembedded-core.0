Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TeDWE-0006N9-SP
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 00:27:46 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so8324614eei.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2012 15:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding;
	bh=aOuYtA4tsBtZhXzHJa5xz+qwbu4Jop9wp6ceMhS3aaM=;
	b=RwnttrypE1yIG5Uho8lIPX0425sZqiXe7gxm0x1dkRp5bmLUvY4HD9+kBmsQgOIt7c
	G0ch2TkkP5OrGMyuIHth6Y6x7loDLAQ1k58/18B/fO/l3gisfCOCGQRSUfxwv+8FAWG/
	Dfu3wMrOO/DJjrHjMDoCZklDtwLL7E5tUe+a6GVwaRkYr8dRkKWehKnKGu2JEeFIcHQk
	28eoZV96cV0hg8mU7QLHB2sK6MRv7VXRkfnL58jgpDjuHGBMTTlq8poyS4soZF4UeDIo
	NrAK8OYrox/8ixZEKsc/FQD1R5P4NbMVxHLSDm+ZEF6jS9tl32mTqStgxAb6mNYgg+sI
	1hiQ==
Received: by 10.14.223.200 with SMTP id v48mr87487873eep.24.1354230812863;
	Thu, 29 Nov 2012 15:13:32 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e2sm6713433eeo.8.2012.11.29.15.13.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 29 Nov 2012 15:13:32 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Nov 2012 00:12:38 +0100
Message-Id: <e7326c22cb5e6facb8f788178ac7775b396dc2f9.1354230112.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354230112.git.Martin.Jansa@gmail.com>
References: <cover.1354230112.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354230112.git.Martin.Jansa@gmail.com>
References: <cover.1354230112.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 7/8] arch-armv6: add tunes without vfp enabled
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Nov 2012 23:27:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Víctor Enríquez <victor.quicksilver@gmail.com>

This work was made by Victor Enriquez and then modified by Denis Carikli
who was helped by Mark Hatle comments. And in the end modified by Martin
Jansa to support different ARMPKGARCH and removed explicit -novfp suffix.

The changes are for adding support to armv6-novfp, for building binaries
for armv6 machines without vfp, for example the htc dream.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
Signed-off-by: Víctor Enríquez <victor.quicksilver@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/arm/arch-armv6.inc | 29 +++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/meta/conf/machine/include/arm/arch-armv6.inc b/meta/conf/machine/include/arm/arch-armv6.inc
index 4c6548c..ea6d73d 100644
--- a/meta/conf/machine/include/arm/arch-armv6.inc
+++ b/meta/conf/machine/include/arm/arch-armv6.inc
@@ -8,32 +8,43 @@ MACHINEOVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "armv6", ":armv6", ""
 require conf/machine/include/arm/arch-armv5-dsp.inc
 
 # Little Endian
-AVAILTUNES += "armv6 armv6t armv6hf armv6thf"
+AVAILTUNES += "armv6-novfp armv6t-novfp armv6 armv6t armv6hf armv6thf"
+ARMPKGARCH_tune-armv6-novfp ?= "armv6"
+ARMPKGARCH_tune-armv6t-novfp ?= "armv6"
 ARMPKGARCH_tune-armv6 ?= "armv6"
 ARMPKGARCH_tune-armv6t ?= "armv6"
 ARMPKGARCH_tune-armv6hf ?= "armv6"
 ARMPKGARCH_tune-armv6thf ?= "armv6"
-TUNE_FEATURES_tune-armv6 ?= "armv6 vfp"
-TUNE_FEATURES_tune-armv6t ?= "${TUNE_FEATURES_tune-armv6} thumb"
+TUNE_FEATURES_tune-armv6-novfp ?= "armv6"
+TUNE_FEATURES_tune-armv6t-novfp ?= "${TUNE_FEATURES_tune-armv6-novfp} thumb"
+TUNE_FEATURES_tune-armv6 ?= "${TUNE_FEATURES_tune-armv6-novfp} vfp"
+TUNE_FEATURES_tune-armv6t ?= "${TUNE_FEATURES_tune-armv6t-novfp} vfp"
 TUNE_FEATURES_tune-armv6hf ?= "${TUNE_FEATURES_tune-armv6} callconvention-hard"
 TUNE_FEATURES_tune-armv6thf ?= "${TUNE_FEATURES_tune-armv6t} callconvention-hard"
-PACKAGE_EXTRA_ARCHS_tune-armv6 = "${PACKAGE_EXTRA_ARCHS_tune-armv5e-vfp} armv6-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv6t = "${PACKAGE_EXTRA_ARCHS_tune-armv5te-vfp} armv6-vfp armv6t-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv6-novfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5e} armv6"
+PACKAGE_EXTRA_ARCHS_tune-armv6t-novfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5te} armv6 armv6t"
+PACKAGE_EXTRA_ARCHS_tune-armv6 = "${PACKAGE_EXTRA_ARCHS_tune-armv5e-vfp} armv6 armv6-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv6t = "${PACKAGE_EXTRA_ARCHS_tune-armv5te-vfp} armv6 armv6t armv6-vfp armv6t-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv6hf = "${PACKAGE_EXTRA_ARCHS_tune-armv5ehf-vfp} armv6hf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv6thf = "${PACKAGE_EXTRA_ARCHS_tune-armv5tehf-vfp} armv6hf-vfp armv6thf-vfp"
 
 # Big Endian
-AVAILTUNES += "armv6b armv6tb armv6hfb armv6thfb"
+AVAILTUNES += "armv6b-novfp armv6tb-novfp armv6b armv6tb armv6hfb armv6thfb"
+ARMPKGARCH_tune-armv6b-novfp ?= "armv6"
+ARMPKGARCH_tune-armv6tb-novfp ?= "armv6"
 ARMPKGARCH_tune-armv6b ?= "armv6"
 ARMPKGARCH_tune-armv6tb ?= "armv6"
 ARMPKGARCH_tune-armv6hfb ?= "armv6"
 ARMPKGARCH_tune-armv6thfb ?= "armv6"
+TUNE_FEATURES_tune-armv6b-novfp ?= "${TUNE_FEATURES_tune-armv6-novfp} bigendian"
+TUNE_FEATURES_tune-armv6tb-novfp ?= "${TUNE_FEATURES_tune-armv6t-novfp} bigendian"
 TUNE_FEATURES_tune-armv6b ?= "${TUNE_FEATURES_tune-armv6} bigendian"
 TUNE_FEATURES_tune-armv6tb ?= "${TUNE_FEATURES_tune-armv6t} bigendian"
 TUNE_FEATURES_tune-armv6hfb ?= "${TUNE_FEATURES_tune-armv6hf} bigendian"
 TUNE_FEATURES_tune-armv6thfb ?= "${TUNE_FEATURES_tune-armv6thf} bigendian"
-PACKAGE_EXTRA_ARCHS_tune-armv6b = "${PACKAGE_EXTRA_ARCHS_tune-armv5eb-vfp} armv6b-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv6tb = "${PACKAGE_EXTRA_ARCHS_tune-armv5teb-vfp} armv6b-vfp armv6tb-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv6b-novfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5eb} armv6b"
+PACKAGE_EXTRA_ARCHS_tune-armv6tb-novfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5teb} armv6b armv6tb"
+PACKAGE_EXTRA_ARCHS_tune-armv6b = "${PACKAGE_EXTRA_ARCHS_tune-armv5eb-vfp} armv6b armv6b-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv6tb = "${PACKAGE_EXTRA_ARCHS_tune-armv5teb-vfp} armv6b armv6tb armv6b-vfp armv6tb-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv6hfb = "${PACKAGE_EXTRA_ARCHS_tune-armv5ehfb-vfp} armv6hfb-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv6thfb = "${PACKAGE_EXTRA_ARCHS_tune-armv5tehfb-vfp} armv6hfb-vfp armv6thfb-vfp"
-
-- 
1.8.0



