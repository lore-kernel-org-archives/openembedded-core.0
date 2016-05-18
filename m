Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id DB94073166
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 22:15:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4IMF23E006844; Wed, 18 May 2016 23:15:02 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id G2ZENRaWs9K1; Wed, 18 May 2016 23:15:02 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4IMF0Kx006841
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 18 May 2016 23:15:01 +0100
Message-ID: <1463609700.4578.88.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 18 May 2016 23:15:00 +0100
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] glibc: Add missing patch hunk back
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
X-List-Received-Date: Wed, 18 May 2016 22:15:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This hunk of patch went missing during the glibc upgrade to 2.24
and without it, uninative-tarball doesn't work properly. This adds
it back so we can spin a new version of uninative.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch b/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
index 23b9fcb..2e7971c 100644
--- a/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
+++ b/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
@@ -121,6 +121,18 @@ index eb2f900..505804e 100644
  #ifndef add_system_dir
  # define add_system_dir(dir) add_dir (dir)
  #endif
+diff --git a/iconv/gconv_conf.c b/iconv/gconv_conf.c
+--- a/iconv/gconv_conf.c
++++ b/iconv/gconv_conf.c
+@@ -36,7 +36,7 @@
+ 
+ 
+ /* This is the default path where we look for module lists.  */
+-static const char default_gconv_path[] = GCONV_PATH;
++static char default_gconv_path[4096] __attribute__ ((section (".gccrelocprefix"))) = GCONV_PATH;
+ 
+ /* The path elements, as determined by the __gconv_get_path function.
+    All path elements end in a slash.  */
 -- 
 2.8.2
 



