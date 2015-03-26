Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 365DE6013D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Mar 2015 14:18:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2QEIgpC018927 for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Mar 2015 14:18:42 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 0pXCICHXDyYQ
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Mar 2015 14:18:42 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2QEIUeU018909
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Mar 2015 14:18:41 GMT
Message-ID: <1427379510.14020.93.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 26 Mar 2015 14:18:30 +0000
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] autotools: Avoid find race for S = "${WORKDIR}"
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
X-List-Received-Date: Thu, 26 Mar 2015 14:18:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

For recipes with PACKAGES_remove = "${PN}", the find which removes .la files
can race against deletion of other directories in WORKDIR e.g.:

find: '/home/autobuilder/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/build/tmp/work/qemux86_64-poky-linux/init-ifupdown/1.0-r7/sstate-build-populate_lic': No such file or directory
| WARNING: /home/autobuilder/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/build/tmp/work/qemux86_64-poky-linux/init-ifupdown/1.0-r7/temp/run.do_configure.6558:1 exit 1 from
|   find /home/autobuilder/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/build/tmp/work/qemux86_64-poky-linux/init-ifupdown/1.0-r7 -name \*.la -delete

The simplest fix is to add the find option which ignores these kind of races.

[YOCTO #7522]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index f44b9eb..19c1091 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -88,7 +88,7 @@ oe_runconf () {
 		${CACHED_CONFIGUREVARS} $cfgscript ${CONFIGUREOPTS} ${EXTRA_OECONF} "$@"
 		if [ "$?" != "0" ]; then
 			echo "Configure failed. The contents of all config.log files follows to aid debugging"
-			find ${S} -name config.log -print -exec cat {} \;
+			find ${S} -ignore_readdir_race -name config.log -print -exec cat {} \;
 			bbfatal "oe_runconf failed"
 		fi
 		set -e



