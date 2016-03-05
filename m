Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 60458731BA
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Mar 2016 09:42:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u259g4Bs004231 for <openembedded-core@lists.openembedded.org>;
	Sat, 5 Mar 2016 09:42:04 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id FSusYh2FcAna
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Mar 2016 09:42:04 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u259fwFa004225
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 5 Mar 2016 09:41:59 GMT
Message-ID: <1457170918.2804.74.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 05 Mar 2016 09:41:58 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] uninative: Use CXX11 ABI for interoperation between gcc4 and gcc5
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
X-List-Received-Date: Sat, 05 Mar 2016 09:42:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We may see binaries built with gcc5 run or linked into gcc4 environment
so use the older libstdc++ standard for now until we don't support gcc4
on the host system. https://wiki.debian.org/GCC5 has more details about this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
index 6abcbed..260a926 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -7,6 +7,12 @@ UNINATIVE_TARBALL ?= "${BUILD_ARCH}-nativesdk-libc.tar.bz2"
 #UNINATIVE_CHECKSUM[x86_64] = "dead"
 UNINATIVE_DLDIR ?= "${DL_DIR}"
 
+# https://wiki.debian.org/GCC5
+# We may see binaries built with gcc5 run or linked into gcc4 environment
+# so use the older libstdc++ standard for now until we don't support gcc4
+# on the host system.
+BUILD_CXXFLAGS_append = " -D_GLIBCXX_USE_CXX11_ABI=0"
+
 addhandler uninative_event_fetchloader
 uninative_event_fetchloader[eventmask] = "bb.event.BuildStarted"
 



