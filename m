Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SZgmQ-0000LO-NT for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 13:09:30 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4UAxCwD021335
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 11:59:12 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17694-10 for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 11:59:08 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4UAx2W3021329
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 11:59:03 +0100
Message-ID: <1338375541.20169.119.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 30 May 2012 11:59:01 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: package.bbclass: Add warning about FILES containing '//'
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
X-List-Received-Date: Wed, 30 May 2012 11:09:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

'//' in a FILES variable causes hard to track down issues with
packaging. This adds a warning and attempts to auto-correct the issue to
try and make the problem more user friendly.

[YOCTO #2448]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index bc83bfb..6bce742 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -917,6 +917,9 @@ python populate_packages () {
 		files = filesvar.split()
 		file_links = {}
 		for file in files:
+			if file.find("//") != -1:
+				bb.warn("FILES variable for package %s contains '//' which is invalid. Attempting to fix this but you should correct the metadata.\n" % pkg)
+				file.replace("//", "/")
 			if os.path.isabs(file):
 				file = '.' + file
 			if not os.path.islink(file):




