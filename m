Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 627236FD9D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 May 2014 12:31:35 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s4UCVVHK006531 for <openembedded-core@lists.openembedded.org>;
	Fri, 30 May 2014 13:31:31 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id zPeuypb9okHo
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 May 2014 13:31:31 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s4UCVTVn006528
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 May 2014 13:31:30 +0100
Message-ID: <1401453081.31309.26.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 30 May 2014 13:31:21 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] multilib: Set PN correctly on cross-canadian extension cases
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
X-List-Received-Date: Fri, 30 May 2014 12:31:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

When we extended cross-canadian recipes with multilib, we were seeing failures
since PN was unchanged.

"""
ERROR: Multiple versions of gcc-cross-canadian-i586 are due to be built
(/media/build1/poky/meta/recipes-devtools/gcc/gcc-cross-canadian_4.9.bb
virtual:multilib:lib32:/media/build1/poky/meta/recipes-devtools/gcc/gcc-cross-canadian_4.9.bb).
Only one version of a given PN should be built in any given build.
You likely need to set PREFERRED_VERSION_gcc-cross-canadian-i586 to
select the correct version or don't depend on multiple versions.
"""

This change avoids that error.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 9a1cb1d..abefc79 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -26,6 +26,7 @@ python multilib_virtclass_handler () {
     if bb.data.inherits_class('cross-canadian', e.data):
         e.data.setVar("MLPREFIX", variant + "-")
         override = ":virtclass-multilib-" + variant
+        e.data.setVar("PN", variant + "-" + e.data.getVar("PN", False))
         e.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + override)
         bb.data.update_data(e.data)
         return



