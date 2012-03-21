Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SAJAl-0000Az-MO for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 11:53:43 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2LAio1C000593
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 10:44:50 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32590-04 for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 10:44:46 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2LAifDD000587
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 10:44:42 GMT
Message-ID: <1332326683.9740.136.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Mar 2012 10:44:43 +0000
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] bitbake.conf/sstate.bbclass: Change PATH when installing sstate files to avoid issues
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
X-List-Received-Date: Wed, 21 Mar 2012 10:53:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This resolves issues related to pigz-native when installing from sstate that people 
have been seeing. It also gives us a way to solve issues like the gzip-native race 
during sstate package creation covered in Yocto #1774.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 0d16d11..1570654 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -153,6 +153,12 @@ def sstate_installpkg(ss, d):
         bb.mkdirhier(dir)
         oe.path.remove(dir)
 
+    # We're adding binaries into the sysroots, we don't want to execute them
+    # whilst they're half installed or being installed so we need to
+    # remove the sysroots from PATH
+    savedpath = d.getVar("PATH")
+    d.setVar("PATH", "${ORIGPATH}")
+
     sstateinst = d.expand("${WORKDIR}/sstate-install-%s/" % ss['name'])
     sstatepkg = d.getVar('SSTATE_PKG', True) + '_' + ss['name'] + ".tgz"
 
@@ -190,6 +196,8 @@ def sstate_installpkg(ss, d):
         # conflict with another writer
         os.remove(fixmefn)
 
+    d.setVar("PATH", savedpath)
+
     for state in ss['dirs']:
         prepdir(state[1])
         os.rename(sstateinst + state[0], state[1])
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index d4357d1..145a9a2 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -401,6 +401,7 @@ EXTRA_IMAGEDEPENDS = ""
 # Toolchain info.
 ##################################################################
 
+ORIGPATH := "${PATH}"
 PATH_prepend = "${STAGING_BINDIR_TOOLCHAIN}:${STAGING_BINDIR_CROSS}:${STAGING_DIR_NATIVE}${sbindir_native}:${STAGING_BINDIR_NATIVE}:${STAGING_DIR_NATIVE}${base_sbindir_native}:${STAGING_DIR_NATIVE}/${base_bindir_native}:"
 export PATH
 




