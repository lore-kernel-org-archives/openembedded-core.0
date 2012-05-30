Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SZlXp-0003Ur-QG for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 18:14:45 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4UG4RPK023199
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 17:04:27 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21779-06 for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 17:04:22 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4UG4Kla023193
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 17:04:21 +0100
Message-ID: <1338393861.20169.149.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 30 May 2012 17:04:21 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] layer.conf/bitbake.conf: Tweak PATH
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
X-List-Received-Date: Wed, 30 May 2012 16:14:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We want the help2man script in scripts/ to be found in preference to any from
the host system and from the native sysroot. It turns out to be tricky to
get the order right from layer.conf so we move the addition of the scripts
directory to bitbake.conf.

Without this, "bitbake libtasn1 -c cleansstate; bitbake help2man-native; bitbake libtasn1"
will fail due to finding the host system help2man before ours.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 48287a7..70a49c6 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -402,7 +402,7 @@ EXTRA_IMAGEDEPENDS = ""
 # Toolchain info.
 ##################################################################
 
-PATH_prepend = "${STAGING_BINDIR_TOOLCHAIN}:${STAGING_BINDIR_CROSS}:${STAGING_DIR_NATIVE}${sbindir_native}:${STAGING_BINDIR_NATIVE}:${STAGING_DIR_NATIVE}${base_sbindir_native}:${STAGING_DIR_NATIVE}/${base_bindir_native}:"
+PATH_prepend = "${COREBASE}/scripts:${STAGING_BINDIR_TOOLCHAIN}:${STAGING_BINDIR_CROSS}:${STAGING_DIR_NATIVE}${sbindir_native}:${STAGING_BINDIR_NATIVE}:${STAGING_DIR_NATIVE}${base_sbindir_native}:${STAGING_DIR_NATIVE}/${base_bindir_native}:"
 export PATH
 
 ##################################################################
diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 76ae58c..43e4295 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -11,11 +11,7 @@ BBFILE_PRIORITY_normal = "5"
 # Set a variable to get to the top of the metadata location
 COREBASE := '${@os.path.normpath("${LAYERDIR}/../")}'
 
-# Add scripts to PATH
-PATH := "${PATH}:${COREBASE}/scripts"
-
 # Set path to qemu image tests included in this layer
-
 QEMUIMAGETESTS := "${COREBASE}/scripts/qemuimage-tests"
 
 SIGGEN_EXCLUDERECIPES_ABISAFE += " \




