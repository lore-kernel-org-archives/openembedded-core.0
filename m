Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UHMgz-0000MI-E8 for openembedded-core@lists.openembedded.org;
	Mon, 18 Mar 2013 00:08:42 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2HN0stR015230 for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Mar 2013 23:00:55 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 2OtyErGB2cGF
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Mar 2013 23:00:54 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2HN0mee015226
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Mar 2013 23:00:51 GMT
Message-ID: <1363560698.4315.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 17 Mar 2013 22:51:38 +0000
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Subject: keymaps: Fix kernel version issue
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 17 Mar 2013 23:08:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The conditional code here was to switch between 2.4 and 2.6
kernels. Since we no longer support 2.4, we can hardcode
2.6 which ensures the correct keymap will be found.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-bsp/keymaps/files/keymap.sh b/meta/recipes-bsp/keymaps/files/keymap.sh
index 6ebc634..0e5eabc 100755
--- a/meta/recipes-bsp/keymaps/files/keymap.sh
+++ b/meta/recipes-bsp/keymaps/files/keymap.sh
@@ -2,14 +2,13 @@
 #
 # load keymap, if existing
 
-KERNEL_MAJMIN=`uname -r | cut -d '.' -f 1,2`
-if [ -e /etc/keymap-$KERNEL_MAJMIN.map ]; then
-	loadkeys /etc/keymap-$KERNEL_MAJMIN.map
+if [ -e /etc/keymap-2.6.map ]; then
+	loadkeys /etc/keymap-2.6.map
 fi
 
-if ( ls "/etc" | grep -q "keymap-extension-${KERNEL_MAJMIN}" )
+if ( ls "/etc" | grep -q "keymap-extension-2.6" )
 then
-	for extension in `ls -1 /etc/keymap-extension-$KERNEL_MAJMIN*` 
+	for extension in `ls -1 /etc/keymap-extension-2.6*` 
 	do	
 		loadkeys "$extension"
 	done




