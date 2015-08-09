Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 90FC776779
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Aug 2015 07:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t79748uJ010497 for <openembedded-core@lists.openembedded.org>;
	Sun, 9 Aug 2015 08:04:08 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id JvFIIA_JWP-E
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Aug 2015 08:04:08 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7973nFj010490
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 9 Aug 2015 08:04:03 +0100
Message-ID: <1439103829.30467.93.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 09 Aug 2015 00:03:49 -0700
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] runqemu: Add error handling for unexpected tap devices
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
X-List-Received-Date: Sun, 09 Aug 2015 07:04:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

In theory the code reduces the tap device number to an integer. This
patch adds error checking to ensure that does happen and that the script
exits if something unexpected happens.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index 03b40d8..0ace485 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -253,6 +253,14 @@ else
 
 
         n0=$(echo $TAP | sed 's/tap//')
+
+        case $n0 in
+            ''|*[!0-9]*)
+                echo "Error Couldn't turn $TAP into an interface number?"
+                exit 1
+                ;;
+        esac
+
         n1=$(($n0 * 2 + 1))
         n2=$(($n1 + 1))
 



