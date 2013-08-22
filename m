Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 4C35260896
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 11:30:53 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7MBg9fX001261; Thu, 22 Aug 2013 12:42:11 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id aCgUh6jGrqdP; Thu, 22 Aug 2013 12:42:11 +0100 (BST)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7MBg6s3001217
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 22 Aug 2013 12:42:08 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1VCT5a-0001hs-FY; Thu, 22 Aug 2013 12:30:06 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Aug 2013 12:29:39 +0100
Message-Id: <1377171000-6469-7-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1377171000-6469-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1377171000-6469-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 07/28] gcc-package-sdk.inc: Use relative symlinks in libexec dir
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
X-List-Received-Date: Thu, 22 Aug 2013 11:30:54 -0000

We already use relative links for other gcc libexec links, this changes the sdk
do_install to match elsewhere and use relative symlinks too. This makes things
slightly easier in the SDK installation process and standardises.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-package-sdk.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-package-sdk.inc b/meta/recipes-devtools/gcc/gcc-package-sdk.inc
index bb6dfde..b546d5c 100644
--- a/meta/recipes-devtools/gcc/gcc-package-sdk.inc
+++ b/meta/recipes-devtools/gcc/gcc-package-sdk.inc
@@ -28,6 +28,9 @@ FILES_${PN}-doc = "\
     ${gcclibdir}/${TARGET_SYS}/${BINV}/include/README \
     "
 
+# Compute how to get from libexecdir to bindir in python (easier than shell)
+BINRELPATH = "${@oe.path.relative(d.expand("${libexecdir}/gcc/${TARGET_SYS}/${BINV}"), d.expand("${bindir}"))}"
+
 do_install () {
 	oe_runmake 'DESTDIR=${D}' install-host
 
@@ -64,7 +67,7 @@ do_install () {
 			continue
 		fi
 
-		ln -sf ${bindir}/${TARGET_PREFIX}$t $dest$t
+		ln -sf ${BINRELPATH}/${TARGET_PREFIX}$t $dest$t
 	done
 
 	chown -R root:root ${D}
-- 
1.8.1.2


