Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B5B0C60169
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jun 2014 15:21:35 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s5UFLUEo028614 for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jun 2014 16:21:30 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id axbe0xBeS59F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jun 2014 16:21:30 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s5UFLNAA028609
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jun 2014 16:21:25 +0100
Message-ID: <1404141677.6362.14.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 30 Jun 2014 16:21:17 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] adt_installer: Fix sed file not found error
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Jun 2014 15:21:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We need to look for the installed file within the sysroot we just installed
so add in the missing prefix. This avoids errors like:

Installing cross canadian packages for qemux86 ...
sed: no input files

[YOCTO #6443]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
index 432ba41..8d2ff57 100755
--- a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
+++ b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
@@ -157,7 +157,7 @@ for target_type in $YOCTOADT_TARGETS; do
 
   # get the environment setup script paths: original (the one before relocation)
   # and relocated
-  env_script_original=`$OPKG_CMD -f $OPKG_CONFIG_FILE -o $NATIVE_INSTALL_DIR files meta-environment-$machine|\
+  env_script_original=$NATIVE_INSTALL_DIR`$OPKG_CMD -f $OPKG_CONFIG_FILE -o $NATIVE_INSTALL_DIR files meta-environment-$machine|\
 							grep environment-setup`
   env_script_relocated=$INSTALL_FOLDER/${env_script_original##*/}
 



