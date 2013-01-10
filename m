Received: from mail-we0-f170.google.com ([74.125.82.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1TtFjO-0000Uk-Qk
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Jan 2013 11:51:35 +0100
Received: by mail-we0-f170.google.com with SMTP id r1so179645wey.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2013 02:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=yvIIX9mO5Y4WtQHf3+bMfYYccRw6NcrVrqI/7MJpac8=;
	b=Z3hBz17Ic6hjbwhTzviHKs2QLMkaTNqEEoXsE+d7YFsylENfzpwRNNFGyBlA84FGZc
	WN8zmxvjpWY+o/4YIKGDwl5XsMG7FJ7EMSW9/G9Xm5GtBflJ5ViPWJDGLRQ8CAJLYCKh
	PGV/D18cs/mOQc1hd6TlZrtYokUxV3rkjvA6G4ZG7uUhR1tT77pWZ+bL1pj96VQ9PeaZ
	eiwxEg6Le28n/4pE2g2KNITE8R+JFY6ihv7QAqhHj+6j29InVgaVEglpx4KJvjhM46YD
	Bf7BB09+B7Tb4vEjfrCXGQ7hwUvUAgZmpQi6SEVyTqcXD6rIhWSUWiU2mzlGYbpRjnSj
	loHA==
X-Received: by 10.180.78.226 with SMTP id e2mr8302276wix.1.1357814177721;
	Thu, 10 Jan 2013 02:36:17 -0800 (PST)
Received: from s-stirtzel-linux.zera.local
	(ip-95-223-251-141.unitymediagroup.de. [95.223.251.141])
	by mx.google.com with ESMTPS id w5sm7748241wif.11.2013.01.10.02.36.16
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 10 Jan 2013 02:36:16 -0800 (PST)
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Jan 2013 11:35:47 +0100
Message-Id: <1357814147-3319-1-git-send-email-s.stirtzel@googlemail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] boost: Use PARALLEL_MAKE for bjam
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
X-List-Received-Date: Thu, 10 Jan 2013 10:51:38 -0000

Like make, bjam accepts the parameter -jX for multithreaded execution
do_install also profits from this setting
Tested with a quad core 64bit intel cpu (with hyperthreading) PARALLEL_MAKE="j16"

$ time bitbake boost

before:
real    14m37.433s
user    7m40.785s
sys     4m30.109s

after:
real    7m11.979s
user    12m10.694s
sys     2m47.078s

Also fixes tab indention

Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
---
 meta/recipes-support/boost/boost.inc |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index 830fcb0..4fe5a35 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -120,10 +120,12 @@ BJAM_TOOLS   = "-sTOOLS=gcc \
 		'--layout=system' \
 		"
 
-BJAM_OPTS    = '${BJAM_TOOLS} \
-                -sBOOST_BUILD_USER_CONFIG=${S}/tools/build/v2/user-config.jam \
+#use PARALLEL_MAKE to speed up the build
+BJAM_OPTS    = '${PARALLEL_MAKE} \
+		${BJAM_TOOLS} \
+		-sBOOST_BUILD_USER_CONFIG=${S}/tools/build/v2/user-config.jam \
 		--builddir=${S}/${TARGET_SYS} \
-                --disable-icu \
+		--disable-icu \
 		${BJAM_EXTRA}'
 
 
-- 
1.7.9.5



