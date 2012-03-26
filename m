Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SC9An-0002wy-1l
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 14:37:21 +0200
Received: by wera1 with SMTP id a1so4127450wer.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2012 05:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=B7n7KTZx75H+HL/wKVlEs7Q40GCKmTaClLzQe2b2K1g=;
	b=I23GYhhp+Lq/dSiSKIQ8te2XT1cnFodo2EZKMW9AA+VydF7n3e7QnHJlziyGbUXA+o
	FJ9RZ7ilEfYxenKwg46qVUCK2u23O4tv14JHb626A5I2mID6XZcvQDAKGaytTPf0s093
	9jYge828YCtaVnPR0cXegx7xh2Q0y22ZtfXnj8gSqOk85jWaJnC+HiS1aNkANTsvzNgJ
	U9qVuggmAkt5KaQB6nGi46iJ5mCeOkmA3TQ7pmTrJCkT3Xj40VO/glsaXzvunq4a+zcB
	GEojqrTRxXrgQ24tsi/2cfIwmxbinkKryLEX9cem/hsefVvbQhRQEbqnmZhUstRXgCGb
	2FSA==
Received: by 10.180.88.67 with SMTP id be3mr17996024wib.20.1332764901577;
	Mon, 26 Mar 2012 05:28:21 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fn2sm66635879wib.0.2012.03.26.05.28.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 26 Mar 2012 05:28:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Mar 2012 14:27:54 +0200
Message-Id: <1332764874-19163-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <1332762240.28414.115.camel@ted>
References: <1332762240.28414.115.camel@ted>
Subject: [PATCHv2 08/10] libusb*: import native support from meta-oe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Mar 2012 12:37:21 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-support/libusb/libusb-compat_0.1.3.bb |    7 ++++---
 meta/recipes-support/libusb/libusb1_1.0.8.bb       |    2 ++
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/libusb/libusb-compat_0.1.3.bb b/meta/recipes-support/libusb/libusb-compat_0.1.3.bb
index 43da5af..893bd68 100644
--- a/meta/recipes-support/libusb/libusb-compat_0.1.3.bb
+++ b/meta/recipes-support/libusb/libusb-compat_0.1.3.bb
@@ -12,10 +12,11 @@ DEPENDS = "libusb1"
 # so here libusb-0.1 is removed completely instead of adding virtual/libusb0.
 # Besides, libusb-0.1 uses a per 1ms polling that hurts a lot to power
 # consumption.
-PROVIDES = "libusb"
+PROVIDES = "libusb virtual/libusb0"
+BBCLASSEXTEND = "native nativesdk"
 
 PE = "1"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-compat-${PV}.tar.bz2 \
            file://0.1.0-beta1-gcc3.4-fix.patch"
@@ -23,7 +24,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-compat-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "570ac2ea085b80d1f74ddc7c6a93c0eb"
 SRC_URI[sha256sum] = "a590a03b6188030ee1ca1a0af55685fcde005ca807b963970f839be776031d94"
 
-inherit autotools pkgconfig binconfig
+inherit autotools pkgconfig binconfig lib_package
 
 EXTRA_OECONF = "--libdir=${base_libdir}"
 
diff --git a/meta/recipes-support/libusb/libusb1_1.0.8.bb b/meta/recipes-support/libusb/libusb1_1.0.8.bb
index b8fa790..5a664ca 100644
--- a/meta/recipes-support/libusb/libusb1_1.0.8.bb
+++ b/meta/recipes-support/libusb/libusb1_1.0.8.bb
@@ -6,6 +6,8 @@ SECTION = "libs"
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
+BBCLASSEXTEND = "native nativesdk"
+
 PR = "r4"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-${PV}.tar.bz2"
-- 
1.7.8.5



