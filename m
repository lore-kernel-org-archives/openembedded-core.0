Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id EA346717B3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Oct 2014 14:06:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s96E6AFM002189 for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Oct 2014 15:06:10 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id cgs1j2icVr5G
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Oct 2014 15:06:10 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s96E64bq002186
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Oct 2014 15:06:06 +0100
Message-ID: <1412604398.12419.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 06 Oct 2014 15:06:38 +0100
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Subject: [PATCH] gcc-runtime: Add linux-gnuspe symlink to fix c++ headers
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
X-List-Received-Date: Mon, 06 Oct 2014 14:06:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Some architectures can mix different TARGET_OS values, in most cases
we just use one but in the ppc case, can use two different values. In this
case, to use one toolchain with both, we need to ensure the symlinks exist.

This isn't ideal but does fix the ppc toolchains for the release, after
which better ways of handling this can be investiaged. Without this, failures
in the C++ toolchain are seen.

(From OE-Core rev: d73a2c5d3a30a6c72465b39f9a1b5217de99ee01)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 7ce84f1..167869e 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -53,6 +53,9 @@ do_install () {
 	if [ -d ${D}${infodir} ]; then
 		rmdir --ignore-fail-on-non-empty -p ${D}${infodir}
 	fi
+	if [ "${TARGET_OS}" = "linux-gnuspe" ]; then
+		ln -s ${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-linux
+	fi
 	chown -R root:root ${D}
 }
 



