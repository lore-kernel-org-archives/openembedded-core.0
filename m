Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B174970785
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 21:09:52 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6OL9mDN025371 for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 22:09:48 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id OSUkQ8Eyj9NT
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 22:09:48 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6OL9hDn025367
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 22:09:45 +0100
Message-ID: <1406236178.27697.17.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Jul 2014 22:09:38 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] cross-canadian: Copy target_ definitions from cross.bbclass
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
X-List-Received-Date: Thu, 24 Jul 2014 21:09:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

A while back we fixed the cross definitions to work better in multilib
configurations, apply the same fixes to cross-candian.bbclass

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/cross-canadian.bbclass
b/meta/classes/cross-canadian.bbclass
index e536118..6da43fe 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -84,11 +84,12 @@ EXTRANATIVEPATH += "chrpath-native"
 # Path mangling needed by the cross packaging
 # Note that we use := here to ensure that libdir and includedir are
 # target paths.
-target_libdir := "${libdir}"
-target_includedir := "${includedir}"
-target_base_libdir := "${base_libdir}"
+target_base_prefix := "${base_prefix}"
 target_prefix := "${prefix}"
 target_exec_prefix := "${exec_prefix}"
+target_base_libdir = "${target_base_prefix}/${baselib}"
+target_libdir = "${target_exec_prefix}/${baselib}"
+target_includedir := "${includedir}"
 
 # Change to place files in SDKPATH
 base_prefix = "${SDKPATHNATIVE}"



