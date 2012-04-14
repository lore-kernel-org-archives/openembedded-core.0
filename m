Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SJ6xy-0007Of-7U for openembedded-core@lists.openembedded.org;
	Sat, 14 Apr 2012 19:40:54 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3EHVXZt014978
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Apr 2012 18:31:33 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13264-10 for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Apr 2012 18:31:28 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3EHVNZa014972
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Apr 2012 18:31:24 +0100
Message-ID: <1334424684.8545.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 14 Apr 2012 18:31:24 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: update-alternatives: Fix for compatibility with multilib recipes
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
X-List-Received-Date: Sat, 14 Apr 2012 17:40:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The PN == BPN test was designed to exclude native/nativesdk but also unfortunately
excludes multilib unintentionally. This change fixes this and allows multilib images
with alternatives to funciton correctly.

[YOCTO #2214]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
index ae58344..7b0518d 100644
--- a/meta/classes/update-alternatives.bbclass
+++ b/meta/classes/update-alternatives.bbclass
@@ -69,15 +69,16 @@ done
 }
 
 update_alternatives_batch_doinstall() {
-if [ "${PN}" = "${BPN}" ] ; then
 	for link in ${ALTERNATIVE_LINKS}
 	do
 		mv ${D}${link} ${D}${link}.${PN}
 	done
-fi
 }
 
 def update_alternatives_after_parse(d):
+    if bb.data.inherits_class('native', d) or bb.data.inherits_class('nativesdk', d):
+        return
+
     if d.getVar('ALTERNATIVE_LINKS') != None:
         doinstall = d.getVar('do_install', 0)
         doinstall += d.getVar('update_alternatives_batch_doinstall', 0)




