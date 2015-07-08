Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A7C796E5F6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jul 2015 11:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t68BuMsh001186 for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Jul 2015 12:56:56 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id C3axH_DCBekP
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jul 2015 12:56:56 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t68Buise001237
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Jul 2015 12:56:55 +0100
Message-ID: <1436356604.27597.210.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 08 Jul 2015 12:56:44 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] pseudo: Exclude SITEINFO_BITS from checksums
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
X-List-Received-Date: Wed, 08 Jul 2015 11:56:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We really want the same sstate checksums for pseudo-native on 32 and 64 bit platforms
but the use of SITEINFO_BITS prevents this. Since other things would change if
the bit size changes, we can safely exclude this variable and rely on others
(e.g. BUILD_ARCH included in WORKDIR) to handle this.

[YOCTO #5970]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
index 11a8514..fe12258 100644
--- a/meta/recipes-devtools/pseudo/pseudo.inc
+++ b/meta/recipes-devtools/pseudo/pseudo.inc
@@ -36,6 +36,7 @@ do_compile () {
 	fi
 	oe_runmake ${MAKEOPTS}
 }
+do_compile[vardepsexclude] = "SITEINFO_BITS"
 
 maybe_make32() {
 	# We probably don't need to build 32-bit binaries.
@@ -64,6 +65,7 @@ maybe_make32() {
 		bbnote "If you need to run 32-bit executables, ensure that NO32LIBS is set to 0."
 	fi
 }
+maybe_make32[vardepsexclude] = "SITEINFO_BITS"
 
 warn_32bit_missing() {
 	bbwarn "Can't find stubs-32.h, but usually need it to build 32-bit libpseudo."



