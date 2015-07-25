Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0C9C47618A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Jul 2015 22:05:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6PM5bpe024992 for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Jul 2015 23:05:37 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id tzhwCfEdskNF
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Jul 2015 23:05:36 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6PM5MnZ024989
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Jul 2015 23:05:34 +0100
Message-ID: <1437861922.821.172.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 25 Jul 2015 23:05:22 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] update-rc.d: Include updated-rc.d in DEPENDS
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
X-List-Received-Date: Sat, 25 Jul 2015 22:05:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If you build a user of updated-rc.d like udev, as things stand currently
nothing pulls in updated-rc.d but there is a dependency added on the
package at do_package time. This can lead to errors during rootfs
construction either with licensing. The fact its a RRECOMMEND means
the image are not deterministic.

A particularly good test case for reproducing this is:

MACHINE=A bitbake core-image-minimal
MACHINE=B bitbake core-image-minimal-initramfs

and since the second machine can find the package but not the license
manifest, a failure will result.

Extending the DEPENDS is the easy way to fix the issues.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index 5d67a48..7bdc0e2 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -1,6 +1,6 @@
 UPDATERCPN ?= "${PN}"
 
-DEPENDS_append = " update-rc.d-native"
+DEPENDS_append = " update-rc.d-native update-rc.d"
 VIRTUAL-RUNTIME_initscripts ?= "initscripts"
 DEPENDS_append_class-target = " ${VIRTUAL-RUNTIME_initscripts}"
 UPDATERCD = "update-rc.d"



