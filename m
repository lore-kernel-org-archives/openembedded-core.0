Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SsN5V-0004gQ-JD
	for openembedded-core@lists.openembedded.org;
	Sat, 21 Jul 2012 01:58:25 +0200
Received: by mail-ob0-f175.google.com with SMTP id va7so5510458obc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 16:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=FSJZRf6u40G8nnaBf8N5aj9zOFA7r/+IRE9HX5TIgyE=;
	b=g/lpGTaZz2+CbCg2UIh2R+vhP3qs/L7BPfdy7a1bo30xGdB7z4/N7nbj7Op1CulCoG
	055u18FLfDIKwsJwS2JMboWmXwDnIv6n9O0uUWNoZJcTbNx9Z1c4I/TIqxKucnenorNV
	uYFzXOtKqpdWTiiTsEP7DqUCg2ZxBVojADnnBKBv2uQWmsu3bewaxECepF3+pYB15J0z
	dIdpD+NGwCV7sDwIQuMJWZDEoC/oa442PByfrQ8bZJfGfJG+BYz3GOqklITY6QMPd6BJ
	Fxr479plvkPAxsu+FqYmB7+mQJx4jCKARBxP+h8n0nrbtUDPmxaKx8vYC2YYkpHLPCaV
	3i6w==
Received: by 10.182.160.10 with SMTP id xg10mr9309410obb.76.1342828023873;
	Fri, 20 Jul 2012 16:47:03 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id i5sm3448352oei.4.2012.07.20.16.47.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 Jul 2012 16:47:03 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jul 2012 16:46:41 -0700
Message-Id: <7fceb93ca1b5b53effc47efe423e798498fae904.1342827927.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1342827927.git.chris_larson@mentor.com>
References: <cover.1342827927.git.chris_larson@mentor.com>
In-Reply-To: <cover.1342827927.git.chris_larson@mentor.com>
References: <cover.1342827927.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 3/3] libpcap: fix pcap-config to not return -Wl, -rpath
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Jul 2012 23:58:25 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-connectivity/libpcap/libpcap.inc |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/libpcap/libpcap.inc b/meta/recipes-connectivity/libpcap/libpcap.inc
index 427078f..7d4e841 100644
--- a/meta/recipes-connectivity/libpcap/libpcap.inc
+++ b/meta/recipes-connectivity/libpcap/libpcap.inc
@@ -13,7 +13,7 @@ DEPENDS = "flex-native bison-native"
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluetooth', '', d)}"
 PACKAGECONFIG[bluetooth] = "--enable-bluetooth,--disable-bluetooth,bluez4"
 
-INC_PR = "r1"
+INC_PR = "r2"
 
 SRC_URI = "http://www.tcpdump.org/release/libpcap-${PV}.tar.gz"
 
@@ -29,4 +29,5 @@ do_configure_prepend () {
     if [ ! -e acinclude.m4 ]; then
         cat aclocal.m4 > acinclude.m4
     fi
+    sed -i -e's,^V_RPATH_OPT=.*$,V_RPATH_OPT=,' ${S}/pcap-config.in
 }
-- 
1.7.9.5



