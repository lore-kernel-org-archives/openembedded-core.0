Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RR1En-0008HN-0M for openembedded-core@lists.openembedded.org;
	Thu, 17 Nov 2011 13:38:41 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAHCWFt0016387
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2011 12:32:15 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15957-03 for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2011 12:32:10 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAHCW7FS016381
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2011 12:32:08 GMT
Message-ID: <1321533132.26384.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Nov 2011 12:32:12 +0000
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] package.bbclass: Ensure we tell rpmdeps where to find its magic file
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
X-List-Received-Date: Thu, 17 Nov 2011 12:38:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Without this, if rpmddeps came from a sstate package which was relocated
it might not find its magic file and if that happens, requires/provides
in packages could get corrupted. This leads to failures at rootfs time
during builds with messages like:

libdbus-1.so.3 is needed by libdbus-glib-1-2-0.92-r1.armv5te

since the provides would be missing in the dbus package.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index d01275f..6775fda 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1110,7 +1110,7 @@ if [ x"$D" = "x" ]; then
 fi
 }
 
-RPMDEPS = "${STAGING_LIBDIR_NATIVE}/rpm/bin/rpmdeps"
+RPMDEPS = "${STAGING_LIBDIR_NATIVE}/rpm/bin/rpmdeps  --define '_rpmfc_magic_path ${STAGING_DIR_NATIVE}/usr/share/misc/magic.mgc'"
 
 # Collect perfile run-time dependency metadata
 # Output:




