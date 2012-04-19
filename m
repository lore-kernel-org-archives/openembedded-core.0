Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SKqSQ-0005p8-Iz for openembedded-core@lists.openembedded.org;
	Thu, 19 Apr 2012 14:27:30 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3JCI15W013701
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Apr 2012 13:18:01 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13350-02 for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Apr 2012 13:17:57 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3JCHr1h013694
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Apr 2012 13:17:55 +0100
Message-ID: <1334837877.13017.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Apr 2012 13:17:57 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] package.bbclass: Ensure kernel modules get stripped
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
X-List-Received-Date: Thu, 19 Apr 2012 12:27:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Kernel modules are not marked as executable but we do expect to strip them.
This patch adds in missing code to ensure we do this. Without this images
are getting sigificantly bloated in size.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index c3f077a..44e551f 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -870,6 +870,14 @@ python split_and_strip_files () {
 				elf_file = int(file_list[file][5:])
 				#bb.note("Strip %s" % file)
 				runstrip(file, elf_file, d)
+
+
+	if (d.getVar('INHIBIT_PACKAGE_STRIP', True) != '1'):	
+		for root, dirs, files in os.walk(dvar):
+			for f in files:
+				if not f.endswith(".ko"):
+					continue
+				runstrip(os.path.join(root, f), None, d)
 	#
 	# End of strip
 	#




