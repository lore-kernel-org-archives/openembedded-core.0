Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A8DAE6FD16
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Oct 2014 11:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s93BNqfr002555 for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Oct 2014 12:23:52 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id HZPdutGbPyoX
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Oct 2014 12:23:52 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s93BNlHb002540
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Oct 2014 12:23:49 +0100
Message-ID: <1412335461.17658.88.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 03 Oct 2014 12:24:21 +0100
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Subject: [PATCH] adt-installer: Fix to work with meta-environment changes
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
X-List-Received-Date: Fri, 03 Oct 2014 11:24:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

There is a proper sysroot specified in the meta-environment script now,
which isn't a bad thing. We adjust the sed expression to cope with this.

That means the SDK installations in non-default paths start to work again.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
index 00db301..2a8a30c 100755
--- a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
+++ b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
@@ -167,7 +167,7 @@ for target_type in $YOCTOADT_TARGETS; do
   [ -e "$env_script_original" ] && env_script=$env_script_original
   [ -e "$env_script_relocated" ] && env_script=$env_script_relocated
 
-  $SUDO sed -i -e "s%##SDKTARGETSYSROOT##%$target_sysroot%g" $env_script
+  $SUDO sed -i -e "s%SDKTARGETSYSROOT=.*%SDKTARGETSYSROOT=$target_sysroot%g" $env_script
 done
 
 if [ "$YOCTOADT_QEMU" == "Y" ] || [ "$YOCTOADT_QEMU" == "y" ]; then



