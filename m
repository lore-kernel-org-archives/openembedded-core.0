Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8A36778413
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Aug 2017 13:02:30 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7ED2TgL006792
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 14 Aug 2017 14:02:30 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1dhF0n-0001lr-NR; Mon, 14 Aug 2017 14:02:29 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Aug 2017 14:02:28 +0100
Message-Id: <1502715748-6769-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Mon, 14 Aug 2017 14:02:30 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH] python3-native: Avoid use of getentropy
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
X-List-Received-Date: Mon, 14 Aug 2017 13:02:32 -0000

getentropy() is only available in glibc 2.25+ and uninative may relocate binaries
onto systems that don't have this function. For now, force the code to the older
codepath until we can come up with a better solution for this kind of issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/python/python3-native_3.5.3.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-native_3.5.3.bb b/meta/recipes-devtools/python/python3-native_3.5.3.bb
index 3467d29..66371aa 100644
--- a/meta/recipes-devtools/python/python3-native_3.5.3.bb
+++ b/meta/recipes-devtools/python/python3-native_3.5.3.bb
@@ -44,7 +44,8 @@ inherit native
 
 require python-native-${PYTHON_MAJMIN}-manifest.inc
 
-EXTRA_OECONF_append = " --bindir=${bindir}/${PN} --without-ensurepip"
+# uninative may be used on pre glibc 2.25 systems which don't have getentropy
+EXTRA_OECONF_append = " --bindir=${bindir}/${PN} --without-ensurepip ac_cv_func_getentropy=no"
 
 EXTRA_OEMAKE = '\
   LIBC="" \
-- 
2.7.4


