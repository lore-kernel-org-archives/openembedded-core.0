Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9DC766AC56
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 May 2015 09:04:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4294pPN005627 for <openembedded-core@lists.openembedded.org>;
	Sat, 2 May 2015 10:04:51 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 6HNGMnv7g8jG
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 May 2015 10:04:51 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4294bYL005617
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 2 May 2015 10:04:48 +0100
Message-ID: <1430557477.18360.39.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 02 May 2015 10:04:37 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] multilib: Tweak value of PN used for OVERRIDES
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
X-List-Received-Date: Sat, 02 May 2015 09:04:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently, PN is used in overrides which is expanded to have a MLPREFIX. This
means and pn- overrides without the prefix would be ignored which is not what
is usually expected.

We noticed huge problems using poky-lsb with multilib since the per recipe
overrides were not applied. This adds in handling for PN with and without
the prefix. This should unbreak world-lsb builds on the autobuilder.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index eea2fd5..2b5d356 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -18,6 +18,11 @@ python multilib_virtclass_handler () {
         if val:
             e.data.setVar(name + "_MULTILIB_ORIGINAL", val)
 
+    overrides = e.data.getVar("OVERRIDES", False)
+    pn = e.data.getVar("PN", False)
+    overrides = overrides.replace("pn-${PN}", "pn-${PN}:pn-" + pn)
+    e.data.setVar("OVERRIDES", overrides)
+
     if bb.data.inherits_class('image', e.data):
         e.data.setVar("MLPREFIX", variant + "-")
         e.data.setVar("PN", variant + "-" + e.data.getVar("PN", False))



