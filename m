Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5B33173175
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Mar 2016 08:57:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2C8vAPH006150 for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Mar 2016 08:57:10 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Wq5BUbTbOXtu
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Mar 2016 08:57:10 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2C8v7F9006147
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Mar 2016 08:57:08 GMT
Message-ID: <1457773027.2804.269.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 12 Mar 2016 08:57:07 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] uninative: Add a fix for icu-native to use the correct ABI
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
X-List-Received-Date: Sat, 12 Mar 2016 08:57:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If no -std= option is passed to icu's configure, it defaults to CXX11.
This isn't what we want for uninative, so pass an explicit option
which selects an older ABI on newer versions of g++.

This avoids the __cxa_bad_array_new_length@CXXABI_1.3.8 symbol
being used.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
index 810e105..d3208e7 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -13,6 +13,11 @@ UNINATIVE_DLDIR ?= "${DL_DIR}/uninative/"
 # on the host system.
 BUILD_CXXFLAGS_append = " -D_GLIBCXX_USE_CXX11_ABI=0"
 
+#
+# icu configure defaults to CXX11 if no -std= option is passed in CXXFLAGS
+# therefore pass one
+BUILD_CXXFLAGS_append_pn-icu-native = " -std=c++98"
+
 addhandler uninative_event_fetchloader
 uninative_event_fetchloader[eventmask] = "bb.event.BuildStarted"
 



