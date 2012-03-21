Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SAMgb-0000nU-SX for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 15:38:50 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2LETvC8002607
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 14:29:57 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02161-08 for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 14:29:53 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2LETlmG002601
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 14:29:48 GMT
Message-ID: <1332340189.9740.161.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 21 Mar 2012 14:29:49 +0000
In-Reply-To: <1FB40B91-CFCB-4E72-9159-00BD674EE3A9@dominion.thruhere.net>
References: <22576197.WV0krj9sgO@helios>
	<1331799945-14172-1-git-send-email-bjst@enea.com>
	<20671C9C-1AC1-482A-9B4A-C40EE9087BD7@dominion.thruhere.net>
	<20120319155803.GF9911@giant>
	<99D97950-0951-4127-BA84-D6D6A3C8D596@dominion.thruhere.net>
	<20120320141200.GA13944@giant>
	<1FB40B91-CFCB-4E72-9159-00BD674EE3A9@dominion.thruhere.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] pigz: Add update-altneratives support since this otherwise conflicts with busybox/gzip
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
X-List-Received-Date: Wed, 21 Mar 2012 14:38:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-extended/pigz/pigz.inc b/meta/recipes-extended/pigz/pigz.inc
index 5fda8ca..e1cbc8b 100644
--- a/meta/recipes-extended/pigz/pigz.inc
+++ b/meta/recipes-extended/pigz/pigz.inc
@@ -15,7 +15,18 @@ PROVIDES_virtclass-native += "gzip-native"
 DEPENDS = "zlib"
 
 do_install () {
-        install -d ${D}${bindir}
-        install ${B}/pigz ${D}${bindir}/gzip
-        install ${B}/unpigz ${D}${bindir}/gunzip
+	if [ "${PN}" = "${BPN}" ] ; then
+		# Install files into /bin (FHS), which is typical place for gzip
+	        install -d ${D}${base_bindir}	        
+		install ${B}/pigz ${D}${base_bindir}/gzip
+	        install ${B}/unpigz ${D}${base_bindir}/gunzip
+	else
+	        install -d ${D}${bindir}
+	        install ${B}/pigz ${D}${bindir}/gzip
+	        install ${B}/unpigz ${D}${bindir}/gunzip
+	fi
 }
+
+ALTERNATIVE_LINKS = "${base_bindir}/gzip ${base_bindir}/gunzip"
+ALTERNATIVE_PRIORITY = "80"
+
diff --git a/meta/recipes-extended/pigz/pigz_2.2.4.bb b/meta/recipes-extended/pigz/pigz_2.2.4.bb
index eaf00c6..e76c49c 100644
--- a/meta/recipes-extended/pigz/pigz_2.2.4.bb
+++ b/meta/recipes-extended/pigz/pigz_2.2.4.bb
@@ -1,6 +1,6 @@
 require pigz.inc
 
-PR = "r1"
+PR = "r2"
 
 NATIVE_PACKAGE_PATH_SUFFIX = "/${PN}"
 




