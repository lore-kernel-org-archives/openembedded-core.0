Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0761060745
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 13:21:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0VDJBs3015684; Sun, 31 Jan 2016 13:21:09 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 4UNCLK7KpE1z; Sun, 31 Jan 2016 13:21:09 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0VDL6Aa015725
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 31 Jan 2016 13:21:07 GMT
Message-ID: <1454246466.27087.12.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 31 Jan 2016 13:21:06 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] binutils: Use target provided zlib
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
X-List-Received-Date: Sun, 31 Jan 2016 13:21:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

When using -fpic (security related cflags), qemux6-64 builds would
fail due to linker symbol errors. This was due to the internal zlib
that binutils was using.

Add the switch to tell it to use the target system zlib which is
already in DEPENDS. That zlib is already compiled with the correct
flags.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/binutils/binutils_2.26.bb b/meta/recipes-devtools/binutils/binutils_2.26.bb
index 6f42671..b70ffbf 100644
--- a/meta/recipes-devtools/binutils/binutils_2.26.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.26.bb
@@ -7,6 +7,7 @@ EXTRA_OECONF += "--with-sysroot=/ \
                 --enable-install-libbfd \
                 --enable-install-libiberty \
                 --enable-shared \
+                --with-system-zlib \
                 "
 
 EXTRA_OECONF_class-native = "--enable-targets=all \



