Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RqOul-0004Hv-W1 for openembedded-core@lists.openembedded.org;
	Thu, 26 Jan 2012 13:58:56 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0QCp94X022299
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2012 12:51:09 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21514-07 for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2012 12:51:05 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0QCp3ri022293
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2012 12:51:03 GMT
Message-ID: <1327582264.19643.369.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 26 Jan 2012 12:51:04 +0000
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] useradd.bbclass: Ensure pseudo can load in the pseudo unloaded case
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
X-List-Received-Date: Thu, 26 Jan 2012 12:58:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

In the do_populate_sysroot_setscene case, pseudo has been unloaded and we need
to reload it. This code change ensures all the pseudo options are specified
so pseudo loads correctly.

It also improves some of the comments so all the different contexts are listed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index ef1a9ce..e460f56 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -6,9 +6,13 @@ USERADDDEPENDS = " base-passwd shadow-native shadow-sysroot shadow"
 USERADDDEPENDS_virtclass-native = ""
 USERADDDEPENDS_virtclass-nativesdk = ""
 
-# This preinstall function will be run in two contexts: once for the
-# native sysroot (as invoked by the useradd_sysroot() wrapper), and
-# also as the preinst script in the target package.
+# This preinstall function can be run in four different contexts:
+#
+# a) Before do_install
+# b) At do_populate_sysroot_setscene when installing from sstate packages
+# c) As the preinst script in the target package at do_rootfs time
+# d) As the preinst script in the target package on device as a package upgrade
+#
 useradd_preinst () {
 OPT=""
 SYSROOT=""
@@ -80,8 +84,10 @@ fi
 }
 
 useradd_sysroot () {
-	export PSEUDO="${STAGING_DIR_NATIVE}${bindir}/pseudo"
-	export PSEUDO_LOCALSTATEDIR="${STAGING_DIR_TARGET}${localstatedir}/pseudo"
+	# Pseudo may (do_install) or may not (do_populate_sysroot_setscene) be running 
+	# at this point so we're explicit about the environment so pseudo can load if 
+	# not already present.
+	export PSEUDO="${FAKEROOTENV} PSEUDO_LOCALSTATEDIR=${STAGING_DIR_TARGET}${localstatedir}/pseudo ${STAGING_DIR_NATIVE}${bindir}/pseudo"
 
 	# Explicitly set $D since it isn't set to anything
 	# before do_install




