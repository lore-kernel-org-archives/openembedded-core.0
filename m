Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QodE9-0008By-Aj for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 17:19:21 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p73FExQD026195
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Aug 2011 16:14:59 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25157-08 for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Aug 2011 16:14:55 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p73FErqn026189
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Aug 2011 16:14:54 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 03 Aug 2011 16:14:36 +0100
Message-ID: <1312384476.2344.679.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] autotools.bbclass: Fix m4 file race
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
X-List-Received-Date: Wed, 03 Aug 2011 15:19:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If something removes .m4 files from the aclocal directory whilst aclocal is
running it gets upset. To avoid this we need to take a copy of the aclocal
directory and build against this instead.

[YOCTO #861]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index e5c13ae..8f65b70 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -111,8 +111,13 @@ autotools_do_configure() {
 			if [ -d ${STAGING_DATADIR_NATIVE}/aclocal-$AUTOV ]; then
 				acpaths="$acpaths -I${STAGING_DATADIR_NATIVE}/aclocal-$AUTOV"
 			fi
+			# The aclocal directory could get modified by other processes 
+			# uninstalling data from the sysroot. See Yocto #861 for details.
+			# We avoid this by taking a copy here and then files cannot disappear.
 			if [ -d ${STAGING_DATADIR}/aclocal ]; then
-				acpaths="$acpaths -I ${STAGING_DATADIR}/aclocal"
+				mkdir -p ${B}/aclocal-copy/
+				cp ${STAGING_DATADIR}/aclocal/* ${B}/aclocal-copy/
+				acpaths="$acpaths -I ${B}/aclocal-copy/"
 			fi
 			# autoreconf is too shy to overwrite aclocal.m4 if it doesn't look
 			# like it was auto-generated.  Work around this by blowing it away




