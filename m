Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TMFnN-000306-Rs for openembedded-core@lists.openembedded.org;
	Thu, 11 Oct 2012 12:15:14 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9BA23Zi005334
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2012 11:02:03 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04829-03 for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2012 11:01:59 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9BA1saR005328
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2012 11:01:55 +0100
Message-ID: <1349949720.14368.9.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Oct 2012 11:02:00 +0100
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] libtool: Ensure the paths to sed are not hardcoded
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
X-List-Received-Date: Thu, 11 Oct 2012 10:15:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If you:

bitbake sed-native
bitbake libtool-cross

then libtool-cross has SED="/path/to/sysroot/sed" which is incorrect. If that
is reused from sstate or sed-native is cleaned, the build will fail.

This patch simply sets sed to be "sed" since we're not on systems where
the sed from PATH is broken.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/libtool/libtool-2.4.2.inc b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
index 95e12a2..12a783a 100644
--- a/meta/recipes-devtools/libtool/libtool-2.4.2.inc
+++ b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
@@ -25,6 +25,9 @@ SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
 SRC_URI[md5sum] = "d2f3b7d4627e69e13514a40e72a24d50"
 SRC_URI[sha256sum] = "b38de44862a987293cd3d8dfae1c409d514b6c4e794ebc93648febf9afc38918"
 
+# Don't want paths to sed-native (or anything else) encoded
+CACHED_CONFIGUREVARS += "ac_cv_path_SED=sed"
+
 do_compile_prepend () {
 	# Sometimes this file doesn't get rebuilt, force the issue
 	rm -f ${S}/libltdl/config/ltmain.sh




