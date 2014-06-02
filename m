Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3C5BA60167
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jun 2014 20:08:50 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s52K8jUq021680 for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Jun 2014 21:08:45 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id GyadSmceGunu
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jun 2014 21:08:45 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s52K8gaG021665
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Jun 2014 21:08:44 +0100
Message-ID: <1401739714.12440.16.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 02 Jun 2014 21:08:34 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] sanity.bbclass: Add libsdl-native check
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
X-List-Received-Date: Mon, 02 Jun 2014 20:08:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If libsdl-native is in ASSUME_PROVIDED, check for it in the sanity tests.
This warns the user if they've said its being provided but it isn't and
prevents silent build issues.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 989bdcd..4b42b17 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -550,6 +550,10 @@ def check_sanity_version_change(status, d):
         if not check_app_exists("qemu-arm", d):
             status.addresult("qemu-native was in ASSUME_PROVIDED but the QEMU binaries (qemu-arm) can't be found in PATH")
 
+    if "libsdl-native" in assume_provided:
+        if not check_app_exists("sdl-config", d):
+            status.addresult("libsdl-native is set to be ASSUME_PROVIDED but sdl-config can't be found in PATH. Please either install it, or configure qemu not to require sdl.")
+
     (result, message) = check_gcc_march(d)
     if result and message:
         status.addresult("Your gcc version is older than 4.5, please add the following param to local.conf\n \



