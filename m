Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E3E70766EB
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Sep 2015 16:45:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8QGjEYE030849 for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Sep 2015 17:45:14 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id F6m6aDsQPlaZ
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Sep 2015 17:45:14 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8QGixCH030846
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Sep 2015 17:45:11 +0100
Message-ID: <1443285899.19044.215.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 26 Sep 2015 17:44:59 +0100
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] mulitlib: Ensure SDKTARGETSYSROOT is set correctly
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
X-List-Received-Date: Sat, 26 Sep 2015 16:45:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

When building something like lib32-core-image-minimal -c populate_sdk, we
expect one sysroot with both multilibs installed. We therefore
need a single SDKTARGETSYSROOT value which doesn't change when multilibs
are enabled.

This makes the image generation code match what the meta-environment
files set the SDK up to use.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 8f61d8d..cbf1fb8 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -26,6 +26,7 @@ python multilib_virtclass_handler () {
     if bb.data.inherits_class('image', e.data):
         e.data.setVar("MLPREFIX", variant + "-")
         e.data.setVar("PN", variant + "-" + e.data.getVar("PN", False))
+        e.data.setVar('SDKTARGETSYSROOT', e.data.getVar('SDKTARGETSYSROOT', True))
         target_vendor = e.data.getVar("TARGET_VENDOR_" + "virtclass-multilib-" + variant, False)
         if target_vendor:
             e.data.setVar("TARGET_VENDOR", target_vendor)



