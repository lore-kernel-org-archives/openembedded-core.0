Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SZhdI-0003a3-9j for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 14:04:09 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4UBroX6021670;
	Wed, 30 May 2012 12:53:50 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18246-07; Wed, 30 May 2012 12:53:46 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4UBremt021664
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 30 May 2012 12:53:41 +0100
Message-ID: <1338378819.20169.125.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@windriver.com>, openembedded-core
	<openembedded-core@lists.openembedded.org>
Date: Wed, 30 May 2012 12:53:39 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] update-alternatives: Fix absolute symlink handling
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
X-List-Received-Date: Wed, 30 May 2012 12:04:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

After the class changes, absolute symlinks are not being handled correctly
by the class file. This adds handling for absolute symlinks to account for the
pkgdest directory, removing dangling symlink messages from recipes like bzip2.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
index fce1e84..9f2e59f 100644
--- a/meta/classes/update-alternatives.bbclass
+++ b/meta/classes/update-alternatives.bbclass
@@ -247,7 +247,11 @@ python perform_packagecopy_append () {
 		for alt_target in link_rename:
 			src = '%s/%s' % (pkgdest, alt_target)
 			dest = '%s/%s' % (pkgdest, link_rename[alt_target])
-			link_target = os.path.join(os.path.dirname(src), os.readlink(src))
+			link = os.readlink(src)
+			if os.path.isabs(link):
+				link_target = pkgdest + os.readlink(src)
+			else:
+				link_target = os.path.join(os.path.dirname(src), link)
 
 			if os.path.lexists(link_target):
 				# Ok, the link_target exists, we can rename




