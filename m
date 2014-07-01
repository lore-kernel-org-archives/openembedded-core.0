Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 70D666AC67
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Jul 2014 17:01:24 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s61H1KU8015835 for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Jul 2014 18:01:20 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Cv6jhCeyIT0h
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Jul 2014 18:01:20 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s61H1EmZ015822
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Jul 2014 18:01:15 +0100
Message-ID: <1404234067.6362.69.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 01 Jul 2014 18:01:07 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] adt_installer: Fix real envrionment script issues
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
X-List-Received-Date: Tue, 01 Jul 2014 17:01:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The previous change to adt_installer was incorrect, this reverts it and
fixes the real issue. The real issue is that if a previous installation was
present, it may have been moved and therefore the paths returned by opkg
could be a little odd.

To address this, when we move files to a different location, ensure we
update the *.list files with the revised paths. This means later installs
over the top return consistent values from opkg and the script works
as intended.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
index 8d2ff57..f9c6d18 100755
--- a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
+++ b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
@@ -157,7 +157,7 @@ for target_type in $YOCTOADT_TARGETS; do
 
   # get the environment setup script paths: original (the one before relocation)
   # and relocated
-  env_script_original=$NATIVE_INSTALL_DIR`$OPKG_CMD -f $OPKG_CONFIG_FILE -o $NATIVE_INSTALL_DIR files meta-environment-$machine|\
+  env_script_original=`$OPKG_CMD -f $OPKG_CONFIG_FILE -o $NATIVE_INSTALL_DIR files meta-environment-$machine|\
 							grep environment-setup`
   env_script_relocated=$INSTALL_FOLDER/${env_script_original##*/}
 
@@ -213,6 +213,8 @@ if [ -d $NATIVE_INSTALL_DIR/$DEFAULT_INSTALL_FOLDER ]; then
         # go to the next directory
         dir=$(dirname $dir)
     done
+    # Step 3: Rewrite the *.list files to contain the correct paths
+    $SUDO find $NATIVE_INSTALL_DIR/var/lib/opkg -type f -exec sed -i -e '#^$DEFAULT_INSTALL_FOLDER#$NATIVE_INSTALL_DIR#' {} \;
 fi
 
 # Link the ld.so.cache file into the hosts filesystem



