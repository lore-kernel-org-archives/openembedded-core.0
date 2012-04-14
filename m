Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SJAwg-0002oR-FP for openembedded-core@lists.openembedded.org;
	Sat, 14 Apr 2012 23:55:50 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3ELkQte016987
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Apr 2012 22:46:26 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14981-06 for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Apr 2012 22:46:22 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3ELkH8u016979
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Apr 2012 22:46:18 +0100
Message-ID: <1334439977.8545.4.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 14 Apr 2012 22:46:17 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] mulitlib.bbclass: Ensure correct value of ALL_MULTILIB_PACKAGE_ARCHS is preserved
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
X-List-Received-Date: Sat, 14 Apr 2012 21:55:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The value of ALL_MULTILIB_PACKAGE_ARCHS needs to be consistent both
in multilib extended recipes and in normal context. If this isn't the
case it can lead to inconsistent configuration files at a minimum.

This patch ensures the value is preserved during the class extension code
since computing it after that point is hard.

[YOCTO #2290]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 61b7765..c2d2f85 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -20,6 +20,9 @@ python multilib_virtclass_handler () {
         val=e.data.getVar(name, True)
         if val:
             e.data.setVar(name + "_MULTILIB_ORIGINAL", val)
+
+    # Expand this since this won't work correctly once we set a multilib into place
+    e.data.setVar("ALL_MULTILIB_PACKAGE_ARCHS", e.data.getVar("ALL_MULTILIB_PACKAGE_ARCHS", True))
  
     override = ":virtclass-multilib-" + variant
 




