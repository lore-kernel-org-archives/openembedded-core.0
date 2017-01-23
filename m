Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4BB7F71B31
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 12:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0NCQ0hV013114; Mon, 23 Jan 2017 12:26:12 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id LVrMgKK2U9Pf; Mon, 23 Jan 2017 12:26:12 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0NCQAxu013227
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 23 Jan 2017 12:26:11 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cVdhK-0008Sz-ML; Mon, 23 Jan 2017 12:26:10 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2017 12:26:03 +0000
Message-Id: <1485174363-32506-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] busybox: Guard against interrupted compiles
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
X-List-Received-Date: Mon, 23 Jan 2017 12:26:15 -0000

If busybox is interrupted during do_compile, it can corrupt .config with
the suid version, or worse. Typically this leads to files disappearing,
particularly /etc/init.d/* which leads to an empty busybox-hwclock.
That then results in errors at do_rootfs time due to the missing package.

The fix is to use any 'orig' present to restore stat at the start of
compile.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/busybox/busybox.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 1f4a48c..f247e8d 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -141,6 +141,10 @@ do_compile() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
 	if [ "${BUSYBOX_SPLIT_SUID}" = "1" -a x`grep "CONFIG_FEATURE_INDIVIDUAL=y" .config` = x ]; then
 	# split the .config into two parts, and make two busybox binaries
+		if [ -e .config.org ]; then
+			# Need to guard again an interrupted do_compile - restore any backup
+			cp .config.orig .config
+		fi
 		cp .config .config.orig
 		oe_runmake busybox.cfg.suid
 		oe_runmake busybox.cfg.nosuid
-- 
2.7.4


