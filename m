Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SJiiM-0001KN-1S for openembedded-core@lists.openembedded.org;
	Mon, 16 Apr 2012 11:59:18 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3G9npoG030531
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 10:49:51 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28589-10 for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 10:49:47 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3G9nhqp030525
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 10:49:44 +0100
Message-ID: <1334569785.16992.69.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Apr 2012 10:49:45 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] sgml-common: Fix re-execution of the compile task
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
X-List-Received-Date: Mon, 16 Apr 2012 09:59:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The sed command run during do_compile isn't idempotent. This change fixes it
so that it is and the compile task can be re-executed.

[YOCTO #2194]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/sgml-common/sgml-common_0.6.3.bb b/meta/recipes-devtools/sgml-common/sgml-common_0.6.3.bb
index 63e0acd..27b1a48 100644
--- a/meta/recipes-devtools/sgml-common/sgml-common_0.6.3.bb
+++ b/meta/recipes-devtools/sgml-common/sgml-common_0.6.3.bb
@@ -26,7 +26,7 @@ inherit autotools
 
 do_compile_append() {
 	# install-catalog script contains hardcoded references to /etc/sgml
-	sed -i -e "s|/etc/sgml|${sysconfdir}/sgml|g" bin/install-catalog
+	sed -i -e 's|\([ "]\+\)/etc/sgml|\1${sysconfdir}/sgml|g' bin/install-catalog
 }
 
 FILES_sgml-common_append = " ${datadir}/sgml"




