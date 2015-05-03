Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3388D73C7D
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 May 2015 10:27:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t43ARcfq019671 for <openembedded-core@lists.openembedded.org>;
	Sun, 3 May 2015 11:27:38 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id J2kjTcon9ujc
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 May 2015 11:27:38 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t43AROYm019648
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 3 May 2015 11:27:36 +0100
Message-ID: <1430648844.18360.91.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 03 May 2015 11:27:24 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] directfb: Improve CFLAGS handling for x86
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
X-List-Received-Date: Sun, 03 May 2015 10:27:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The problem with filter_out is that it expands the variable meaning overrides
to sub components can get lost. This has happening to the security flags
meaning directfb failed in lsb builds.

Use _remove instead of filter_out since it gives much more predictable results.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-graphics/directfb/directfb.inc b/meta/recipes-graphics/directfb/directfb.inc
index 13495b1..e863b12 100644
--- a/meta/recipes-graphics/directfb/directfb.inc
+++ b/meta/recipes-graphics/directfb/directfb.inc
@@ -42,7 +42,7 @@ EXTRA_OECONF = "\
 
 #Once -fno-omit-frame-pointer option of gcc is added into TARGET_CLFAGS as default
 #this will cause directfb build failure on x86 arch, so filter out it.
-TARGET_CFLAGS_x86 := "${@oe_filter_out('-fno-omit-frame-pointer', '${TARGET_CFLAGS}', d)}"
+TARGET_CFLAGS_remove_x86 = "-fno-omit-frame-pointer"
 
 #PACKAGES_DYNAMIC += "^directfb-inputdrivers-.*"
 #



