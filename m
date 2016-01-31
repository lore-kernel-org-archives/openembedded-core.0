Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 562046AC3C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 13:32:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0VDWcx3016044 for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 13:32:38 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id AN8l7TtDYE8h
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 13:32:38 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0VDWatN016041
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 13:32:38 GMT
Message-ID: <1454247156.27087.20.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 31 Jan 2016 13:32:36 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] libarchive-native: Disable libxml2 support
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
X-List-Received-Date: Sun, 31 Jan 2016 13:32:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

For libarchive-native, we don't really need libxml2 support. Adding this
means we need libxml2-native which means we need python-native and
makes the dependency chains pretty heavy. The target case is unaffected.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-extended/libarchive/libarchive_3.1.2.bb b/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
index 202507d..89c8faf 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
@@ -7,9 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b4e3ffd607d6686c6cb2f63394370841"
 
 DEPENDS = "e2fsprogs-native"
 
-PACKAGECONFIG ?= "libxml2 zlib bz2"
+PACKAGECONFIG ?= "zlib bz2"
 
 PACKAGECONFIG_append_class-target = "\
+	libxml2 \
 	${@bb.utils.contains('DISTRO_FEATURES', 'acl', 'acl', '', d)} \
 	${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'xattr', '', d)} \
 	${@bb.utils.contains('DISTRO_FEATURES', 'largefile', 'largefile', '', d)} \



