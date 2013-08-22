Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 3F8506AF56
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 11:30:20 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7MBg9xs001260; Thu, 22 Aug 2013 12:42:10 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id hwycZtjkDLev; Thu, 22 Aug 2013 12:42:10 +0100 (BST)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7MBg6gJ001215
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 22 Aug 2013 12:42:08 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1VCT5a-0001hi-97; Thu, 22 Aug 2013 12:30:06 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Aug 2013 12:29:37 +0100
Message-Id: <1377171000-6469-5-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1377171000-6469-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1377171000-6469-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 05/28] libiconv: Extend to nativesdk and support non-linux targets
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
X-List-Received-Date: Thu, 22 Aug 2013 11:30:21 -0000

This library is currently only available when targeting non-libc. This patch
also makes it available when targetting non-linux since it is likely of use
then.

It also adds a BBCLASSEXTEND for nativesdk since again, it can be useful
in that context.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/libiconv/libiconv_1.14.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-support/libiconv/libiconv_1.14.bb b/meta/recipes-support/libiconv/libiconv_1.14.bb
index b1d2612..470900b 100644
--- a/meta/recipes-support/libiconv/libiconv_1.14.bb
+++ b/meta/recipes-support/libiconv/libiconv_1.14.bb
@@ -22,6 +22,8 @@ S = "${WORKDIR}/libiconv-${PV}"
 inherit autotools pkgconfig gettext
 
 python __anonymous() {
+    if d.getVar("TARGET_OS", True) != "linux":
+        return
     if d.getVar("TCLIBC", True) == "eglibc":
         raise bb.parse.SkipPackage("libiconv is provided for use with uClibc only - eglibc already provides iconv")
 }
@@ -44,3 +46,5 @@ do_install_append () {
 	rm -rf ${D}${libdir}/preloadable_libiconv.so
 	rm -rf ${D}${libdir}/charset.alias
 }
+
+BBCLASSEXTEND = "nativesdk"
-- 
1.8.1.2


