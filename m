Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SAuq0-0005QN-Jp
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 04:06:48 +0100
Received: by ghbz2 with SMTP id z2so2449176ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 19:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=eQUk1XMW7oaDWdGXlp6NrQ51YpU83bIBJ4cC8VjWvOs=;
	b=sfJNFBRZC/kCclaGsPy37L4E7ZZFqEROofllw3PZ8Row5TDZ+yuDipkVZP9YwTYdb5
	ejUffJFPUAnuuN6ipO2XmddxpiMOhhTo4qa7S96z7/OUPEEvHu29FLsj57EnFjNPgvoj
	Vsu/KHSnsedY//YWeje/4Th1fxilBmtHxuUNURn1LovRsNRBBfmMGZm4JFY/kH3OdtVQ
	QkJSYUlw05e5A87TU2snDyelA3ucxCYNmk1QWoEbNr1ROVFAVB7UGXNeRrQTmG4tlvNn
	6esFowjrQjNAbyWzNm8Y2XK+PHcfR0rb6EN23Y8r+hDDGXBq9sbdKXcWp8y4zYqOcGeV
	aGMQ==
Received: by 10.68.223.42 with SMTP id qr10mr25115093pbc.127.1332471472369;
	Thu, 22 Mar 2012 19:57:52 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id l8sm4831403pbd.62.2012.03.22.19.57.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Mar 2012 19:57:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Mar 2012 19:56:58 -0700
Message-Id: <1332471418-31459-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1332471418-31459-1-git-send-email-raj.khem@gmail.com>
References: <1332471418-31459-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 2/2] pixman: disable iwmmxt
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
X-List-Received-Date: Fri, 23 Mar 2012 03:06:48 -0000

Pixman build system is borked and always wants iwmmxt intrinsics
it errors like below

| ../pixman/.libs/libpixman-1.so: error: undefined reference to
'__builtin_arm_wand'
| ../pixman/.libs/libpixman-1.so: error: undefined reference to
'__builtin_arm_wsrlhi'
| ../pixman/.libs/libpixman-1.so: error: undefined reference to
'__builtin_arm_walign'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/xorg-lib/pixman_0.25.2.bb |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.25.2.bb b/meta/recipes-graphics/xorg-lib/pixman_0.25.2.bb
index 4cff6f9..bf239d9 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.25.2.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.25.2.bb
@@ -14,9 +14,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=14096c769ae0cbb5fcb94ec468be11b3 \
                    "
 DEPENDS += "zlib libpng"
 
+PR = "r1"
+
 PE = "1"
 
-EXTRA_OECONF="--disable-gtk"
+IWMMXT = "--disable-arm-iwmmxt"
+
+EXTRA_OECONF="--disable-gtk ${IWMMXT}"
 
 SRC_URI[md5sum] = "8d5722f6f61db50034303947a40f5e7b"
 SRC_URI[sha256sum] = "06d83ce5a5f2f8ab3761e88a2de1576b6596bb436190166a242b9d75a68bc1d8"
-- 
1.7.5.4



