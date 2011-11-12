Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RP9BH-00019N-F8 for openembedded-core@lists.openembedded.org;
	Sat, 12 Nov 2011 09:43:19 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAC8b2ke025749;
	Sat, 12 Nov 2011 08:37:02 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22862-09; Sat, 12 Nov 2011 08:36:55 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAC8arRM025743
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sat, 12 Nov 2011 08:36:54 GMT
Message-ID: <1321087015.26881.15.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 12 Nov 2011 08:36:55 +0000
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] rootfs_ipk.bbclass: Ensure bad recommendations persist in the status file
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 12 Nov 2011 08:43:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently bad recommendations are added to the status file with status
"ok". After a single opkg command, whilst it will ignore the recommendation,
the status changes to "installed" even if the recommended package was not
installed. Whilst this is likely a glitch in opkg's logic, the correct
way to persist the information in the status file is to set the status
to "hold" as deinstall packages with that status remain. With this change
the bad recommendations persist accross multiple opkg runs and the system
behaves as expected.

[YOCTO #1758]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index 3b4c392..4a5a2dd 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -44,7 +44,7 @@ fakeroot rootfs_ipk_do_rootfs () {
 		pkginfo="`opkg-cl ${IPKG_ARGS} info $i`"
 		if [ ! -z "$pkginfo" ]; then
 			echo "$pkginfo" | grep -e '^Package:' -e '^Architecture:' -e '^Version:' >> $STATUS
-			echo "Status: deinstall ok not-installed" >> $STATUS
+			echo "Status: deinstall hold not-installed" >> $STATUS
 			echo >> $STATUS
 		else
 			echo "Requested ignored recommendation $i is not a package"




