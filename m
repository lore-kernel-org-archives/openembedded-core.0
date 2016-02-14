Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6A352602D9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Feb 2016 14:28:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1EESodX021083 for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Feb 2016 14:28:51 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id RClZyxK9eD13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Feb 2016 14:28:50 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1EESmPU021079
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Feb 2016 14:28:49 GMT
Message-ID: <1455460128.16142.400.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 14 Feb 2016 14:28:48 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] conf/distro/include: Add no-static-libs.inc
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
X-List-Received-Date: Sun, 14 Feb 2016 14:28:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Static libraries are old technology. We've left them around since in
previous tests, they only added around 5% to the overall build time.

With new and interesting uses of OE, they're becoming more problematic.
For example, sstate becomes much larger with static libs enabled which
increases the size of eSDK and increases the time taken for sstate
operations. Since the static libs contain all the debugging symbols,
they're also pretty huge.

This patch adds a common include file which allows the user or distro
to disable the static libraries in the majority of cases.

There are some libs where we do need the static lib, a good example
being pseudo-native which uses sqlite3-native static libs. These are
left enabled by the include file, as are recipes where --disable-static
doesn't work, or isn't supported. This list can likely be reduced over
time as individual corner cases are addressed.

Maintaining this list in a common location is more desireable than
everyone doing it themselves. Poky will switch to using this, OE-Core
will need to discuss that as its default.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/conf/distro/include/no-static-libs.inc b/meta/conf/distro/include/no-static-libs.inc
new file mode 100644
index 0000000..b085601
--- /dev/null
+++ b/meta/conf/distro/include/no-static-libs.inc
@@ -0,0 +1,19 @@
+DISABLE_STATIC = " --disable-static"
+DISABLE_STATIC_pn-qemu = ""
+DISABLE_STATIC_pn-qemu-native = ""
+DISABLE_STATIC_pn-qemu-nativesdk = ""
+DISABLE_STATIC_pn-pciutils = ""
+DISABLE_STATIC_pn-libcap = ""
+DISABLE_STATIC_pn-libpcap = ""
+# needed by gdb
+DISABLE_STATIC_pn-readline = ""
+# needed by pseudo
+DISABLE_STATIC_pn-sqlite3 = ""
+DISABLE_STATIC_pn-sqlite3-native = ""
+#EXTRA_OECONF += "${DISABLE_STATIC}"
+DISABLE_STATIC_pn-sgml-common-native = ""
+DISABLE_STATIC_pn-openjade-native = ""
+DISABLE_STATIC_pn-openssl = ""
+DISABLE_STATIC_pn-openssl-native = ""
+DISABLE_STATIC_pn-nativesdk-openssl = ""
+EXTRA_OECONF_append = "${DISABLE_STATIC}"



