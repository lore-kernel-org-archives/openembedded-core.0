Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C8557607A5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 06:24:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u5M6OIUo009597 for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 07:24:18 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id txFPYTFVCBDI
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 07:24:18 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u5M6OGTH009594
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 07:24:18 +0100
Message-ID: <1466576656.3319.184.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Jun 2016 07:24:16 +0100
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] bitbake.conf: Drop BUILDSDK_LDFLAGS rpath, rpath-link
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
X-List-Received-Date: Wed, 22 Jun 2016 06:24:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The SDK used to work differently and didn't include its own libc/loader.
In that case, these options were needed to correctly handle the different
library locations. With the modern relocatable SDK, we don't need these 
options any more as the default paths in the dynamic loader are good enough.
They just given potential for errors so drop them.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 942b8b1..f814d04 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -522,12 +522,7 @@ export BUILD_LDFLAGS = "-L${STAGING_LIBDIR_NATIVE} \
                         -Wl,-rpath,${STAGING_BASE_LIBDIR_NATIVE} \
                         -Wl,-O1"
 
-BUILDSDK_LDFLAGS = "-L${STAGING_LIBDIR} \
-                    -Wl,-rpath-link,${STAGING_LIBDIR} \
-                    -Wl,-rpath,${libdir} -Wl,-O1 \
-                    -L${STAGING_DIR_HOST}${base_libdir} \
-                    -Wl,-rpath-link,${STAGING_DIR_HOST}${base_libdir} \
-                    -Wl,-rpath,${base_libdir} -Wl,-O1"
+BUILDSDK_LDFLAGS = "-Wl,-O1"
 
 LINKER_HASH_STYLE ??= "gnu"
 # mips does not support GNU hash style therefore we override



