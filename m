Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SuNxF-0008En-1w for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 15:18:13 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6QD6gS2021443
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 14:06:42 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21246-02 for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 14:06:37 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6QD6VWi021436
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 14:06:32 +0100
Message-ID: <1343307992.29991.28.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 26 Jul 2012 14:06:32 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] base.bbclass: Set the NATIVELSBSTRING variable to represent the distro we're running on
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
X-List-Received-Date: Thu, 26 Jul 2012 13:18:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This can then be used by the sstate code to mark native and cross packages
as being specific to a given distro.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 5fdb96c..59768d0 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -10,7 +10,7 @@ inherit utility-tasks
 inherit metadata_scm
 inherit logging
 
-OE_IMPORTS += "os sys time oe.path oe.utils oe.data oe.packagegroup oe.sstatesig"
+OE_IMPORTS += "os sys time oe.path oe.utils oe.data oe.packagegroup oe.sstatesig oe.lsb"
 OE_IMPORTS[type] = "list"
 
 def oe_import(d):
@@ -31,6 +31,8 @@ def oe_import(d):
         imported = __import__(toimport)
         inject(toimport.split(".", 1)[0], imported)
 
+    d.setVar("NATIVELSBSTRING", oe.lsb.distro_identifier())
+
 python oe_import_eh () {
     if isinstance(e, bb.event.ConfigParsed):
         oe_import(e.data)




