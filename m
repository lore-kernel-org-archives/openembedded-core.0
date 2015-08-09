Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D70EA767F1
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Aug 2015 07:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t79748uK010497 for <openembedded-core@lists.openembedded.org>;
	Sun, 9 Aug 2015 08:05:26 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id jEz3Cbvcu0QA
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Aug 2015 08:05:26 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7975ALE010520
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 9 Aug 2015 08:05:24 +0100
Message-ID: <1439103910.30467.95.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 09 Aug 2015 00:05:10 -0700
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] runqemu: Handle device names like tapX@NONE
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
X-List-Received-Date: Sun, 09 Aug 2015 07:05:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

ip list can return devices in the form tapX@NONE. If it does so,
ensure we handle that case correctly. Newer distros appear to do
this in some cases.

[YOCTO #8129]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index 0ace485..d743322 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -179,7 +179,7 @@ else
                exit 1
         fi
 
-        POSSIBLE=`$IFCONFIG link | grep 'tap' | awk '{print $2}' | sed s/://`
+        POSSIBLE=`$IFCONFIG link | grep 'tap' | awk '{print $2}' | sed -e 's/://' -e 's/@.*//'`
         TAP=""
         LOCKFILE=""
         USE_PRECONF_TAP="no"



