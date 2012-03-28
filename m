Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SCr5E-0004XY-Bv for openembedded-core@lists.openembedded.org;
	Wed, 28 Mar 2012 13:30:32 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2SBLUMZ019093
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2012 12:21:30 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15632-10 for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2012 12:21:26 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2SBLLwp019086
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2012 12:21:21 +0100
Message-ID: <1332933682.28414.198.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Mar 2012 12:21:22 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] tiff: Make builds deterministic
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
X-List-Received-Date: Wed, 28 Mar 2012 11:30:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

libtiff now depends on lzma which can be obtained from xz and doesn't use lzo.
Previously, libtiff would detect and use lzma if it was present leading to
a number of race conditions including failures in things linking to libtiff
such as ghostscript since lzma could be removed while being rebuild leading
to failures in linking.

This patch corrects the dependency.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.1.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.1.bb
index 6fb4163..54c4cbc 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.1.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.1.bb
@@ -2,8 +2,8 @@ DESCRIPTION = "This software provides support for the Tag Image File Format (TIF
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=34da3db46fab7501992f9615d7e158cf"
 HOMEPAGE = "http://www.remotesensing.org/libtiff/"
-DEPENDS = "zlib jpeg lzo"
-PR = "r0"
+DEPENDS = "zlib jpeg xz"
+PR = "r1"
 
 SRC_URI = "ftp://ftp.remotesensing.org/pub/libtiff/tiff-${PV}.tar.gz \
            file://libtool2.patch"




