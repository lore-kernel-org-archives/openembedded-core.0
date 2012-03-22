Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SAqxW-00013v-0c for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 23:58:18 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2MMlVqT021163;
	Thu, 22 Mar 2012 22:47:31 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20391-10; Thu, 22 Mar 2012 22:47:27 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2MMlMeL021157
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 22 Mar 2012 22:47:24 GMT
Message-ID: <1332456444.9740.351.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Mar 2012 22:47:24 +0000
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: "Polk, Jeffrey" <jeff.polk@windriver.com>
Subject: [PATCH] sstate.bbclass: Remove possibility of file corruption and make package writing atomic
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
X-List-Received-Date: Thu, 22 Mar 2012 22:58:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

There is currently a race window when creating sstate packages since we don't
atomically write the files to SSTATE_DIR. This change ensures we do so by writing
to a temporary file and then doing an atomic move.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 1570654..20e66e2 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -455,12 +455,14 @@ python sstate_task_postfunc () {
 #
 sstate_create_package () {
 	cd ${SSTATE_BUILDDIR}
+	TFILE=`mktemp ${SSTATE_PKG}.XXXXXXXX`
 	# Need to handle empty directories
 	if [ "$(ls -A)" ]; then
-		tar -czf ${SSTATE_PKG} *
+		tar -czf $TFILE *
 	else
-		tar -cz --file=${SSTATE_PKG} --files-from=/dev/null
+		tar -cz --file=$TFILE --files-from=/dev/null
 	fi
+	mv $TFILE ${SSTATE_PKG}
 
 	cd ${WORKDIR}
 	rm -rf ${SSTATE_BUILDDIR}




