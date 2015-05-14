Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id DD41C6AD0D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 14:20:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4EEKgwN004051 for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 15:20:42 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id F5I_1cT_Nc7b
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 15:20:42 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4EEKUW1004019
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 15:20:41 +0100
Message-ID: <1431613230.18723.0.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 14 May 2015 15:20:30 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: base: Avoid find race
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
X-List-Received-Date: Thu, 14 May 2015 14:20:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

In a similar way to http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=aa1438b56f30515f9c31b306decef7f562dda81f
and http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=527b28c10955daf0387597020d69593ce24bcaa4
there is a find race in base.bbclass.

For recipes with PACKAGES_remove = "${PN}", the find which removes
.la files can race against deletion of other directories in WORKDIR
e.g.:

find: '/home/autobuilder/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/build/tmp/work/qemux86_64-poky-linux/init-ifupdown/1.0-r7/sstate-build-populate_lic': No such file or directory
| WARNING: /home/autobuilder/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/build/tmp/work/qemux86_64-poky-linux/init-ifupdown/1.0-r7/temp/run.do_configure.6558:1 exit 1 from
| find /home/autobuilder/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/build/tmp/work/qemux86_64-poky-linux/init-ifupdown/1.0-r7 -name \*.la -delete

Fix the race in the same way.

[YOCTO #7522]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 0e4b068..99b512b 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -269,7 +269,7 @@ base_do_configure() {
 			if [ "${CLEANBROKEN}" != "1" -a \( -e Makefile -o -e makefile -o -e GNUmakefile \) ]; then
 				oe_runmake clean
 			fi
-			find ${B} -name \*.la -delete
+			find ${B} -ignore_readdir_race -name \*.la -delete
 		fi
 	fi
 	if [ -n "${CONFIGURESTAMPFILE}" ]; then



