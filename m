Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RbgSQ-0002U2-Bl
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Dec 2011 23:40:51 +0100
Received: by mail-iy0-f175.google.com with SMTP id h37so1565894iak.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2011 14:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding;
	bh=1IWt/oiqL84Plze+WmrRjeSsDnxT03YBwxe181JkVqE=;
	b=wt0gjKKaWaEUKDGnd/NqYK3hMqlHIWd8QRoOwb78CKeZIayb3gITJgd0A73dHngXwu
	mSc7STEfHp0h0v9d1Kj8x702y2wyogYzP/M9Pt/qCRKJ6PmhbCDY86ni0GvSvs6l/hz2
	ixultunKwEzD5W/jx/pI/7coMEzdktmVAHtEI=
Received: by 10.50.153.133 with SMTP id vg5mr11467344igb.80.1324074832851;
	Fri, 16 Dec 2011 14:33:52 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id e2sm37152455ibe.0.2011.12.16.14.33.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Dec 2011 14:33:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Dec 2011 14:33:36 -0800
Message-Id: <bb128743c5e45050900739e39f65ae6d50fd919d.1324074518.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <afc34eae803b41745a8731bd29c93bb4558ba87d.1324074518.git.raj.khem@gmail.com>
References: <afc34eae803b41745a8731bd29c93bb4558ba87d.1324074518.git.raj.khem@gmail.com>
In-Reply-To: <cover.1324074518.git.raj.khem@gmail.com>
References: <cover.1324074518.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] gcc-cross: Add cross testing driver for running regression testsuites
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
X-List-Received-Date: Fri, 16 Dec 2011 22:40:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This script will be generated into the build directory of gcc-cross
It should be testing gcc and g++. libstdc++ tests are not run since
we build them as part of gcc-runtime but we can test them here by
building them with 'make all' and then running the tests

The script expects passwordless ssh access to target and is used
in form

./arm-oe-linux-gnueabi-testgcc kraj@192.168.7.2

inside the builddir of gcc-cross

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-cross.inc |   91 ++++++++++++++++++++++++++++++-
 1 files changed, 90 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index 5a796bc..0b31a8c 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -8,5 +8,94 @@ require gcc-package-cross.inc
 
 do_compile () {
 	oe_runmake all-host all-target-libgcc
-}
+	# now generate script to drive testing
+	echo "#!/usr/bin/env sh" >${B}/${TARGET_PREFIX}testgcc
+	set >> ${B}/${TARGET_PREFIX}testgcc
+	# prune out the unneeded vars
+	sed -i -e "/^BASH/d" ${B}/${TARGET_PREFIX}testgcc
+	sed -i -e "/^USER/d" ${B}/${TARGET_PREFIX}testgcc
+	sed -i -e "/^OPT/d" ${B}/${TARGET_PREFIX}testgcc
+	sed -i -e "/^DIRSTACK/d" ${B}/${TARGET_PREFIX}testgcc
+	sed -i -e "/^EUID/d" ${B}/${TARGET_PREFIX}testgcc
+	sed -i -e "/^FUNCNAME/d" ${B}/${TARGET_PREFIX}testgcc
+	sed -i -e "/^GROUPS/d" ${B}/${TARGET_PREFIX}testgcc
+	sed -i -e "/^HOST/d" ${B}/${TARGET_PREFIX}testgcc
+	sed -i -e "/^HOME/d" ${B}/${TARGET_PREFIX}testgcc
+	sed -i -e "/^IFS/d" ${B}/${TARGET_PREFIX}testgcc
+	sed -i -e "/^LC_ALL/d" ${B}/${TARGET_PREFIX}testgcc
+	sed -i -e "/^LOGNAME/d" ${B}/${TARGET_PREFIX}testgcc
+	sed -i -e "/^MACHTYPE/d" ${B}/${TARGET_PREFIX}testgcc
+	sed -i -e "/^OSTYPE/d" ${B}/${TARGET_PREFIX}testgcc
+	sed -i -e "/^PIPE/d" ${B}/${TARGET_PREFIX}testgcc
+	sed -i -e "/^SHELL/d" ${B}/${TARGET_PREFIX}testgcc
+	sed -i -e "/^'/d" ${B}/${TARGET_PREFIX}testgcc
+	sed -i -e "/^UID/d" ${B}/${TARGET_PREFIX}testgcc
+	sed -i -e "/^TERM/d" ${B}/${TARGET_PREFIX}testgcc
+	sed -i -e "/^PATCH_GET/d" ${B}/${TARGET_PREFIX}testgcc
+	sed -i -e "/^PKG_/d" ${B}/${TARGET_PREFIX}testgcc
+	sed -i -e "/^POSIXLY_/d" ${B}/${TARGET_PREFIX}testgcc
+	sed -i -e "/^PPID/d" ${B}/${TARGET_PREFIX}testgcc
+	sed -i -e "/^PS4/d" ${B}/${TARGET_PREFIX}testgcc
+	sed -i -e "/^Q/d" ${B}/${TARGET_PREFIX}testgcc
+	sed -i -e "/^SHLVL/d" ${B}/${TARGET_PREFIX}testgcc
+	sed -i -e "/^STAGING/d" ${B}/${TARGET_PREFIX}testgcc
+	sed -i -e "/^LD_LIBRARY_PATH/d" ${B}/${TARGET_PREFIX}testgcc
+	sed -i -e "/^PSEUDO/d" ${B}/${TARGET_PREFIX}testgcc
+
+	# append execution part of the script
+cat >> ${B}/${TARGET_PREFIX}testgcc << STOP
+target="\$1"
+shift
+usage () {
+	echo "Usage:"
+	echo "\$0 user@target 'extra options to dejagnu'"
+	echo "\$0 target 'extra options to dejagnu'"
+	echo "\$0 target"
+	echo "e.g. \$0 192.168.7.2 ' dg.exp=visibility-d.c'"
+	echo "will only run visibility-d.c test case"
+	echo "e.g. \$0 192.168.7.2 '/-mthumb dg.exp=visibility-d.c'"
+	echo "will only run visibility-d.c test case in thumb mode"
+	echo "You need to have dejagnu autogen expect installed"
+	echo "on the build host"
+    }
+if [ "x\$target" = "x" ]
+then
+	echo "Please specify the target machine and remote user in form of user@target"
+	usage
+	exit 1;
+fi
+
+echo "\$target" | grep −q "@" >& /dev/null
+if [ "x\$?" = "x0" ]
+then
+   user=echo \$target | cut -d '@' -f 1
+   target=echo \$target | cut -d '@' -f 2
+else
+   user=\$USER
+fi
+ssh \$user@\$target date >& /dev/null
+if [ "x\$?" != "x0" ]
+then
+	echo "Failed connecting to \$user@\$target it could be because"
+	echo "you don't have passwordless ssh setup to access \$target"
+	echo "or sometimes host key has been changed"
+	echo "in such case do something like below on build host"
+	echo "ssh-keygen -f "~/.ssh/known_hosts" -R \$target"
+	echo "and then try ssh \$user@\$target"
+
+	usage
+	exit 1
+fi
+	echo "lappend boards_dir [pwd]/../../.." > ${B}/site.exp
+	echo "load_generic_config \"unix\"" > ${B}/${MACHINE_ARCH}.exp
+	echo "set_board_info username \$user" >> ${B}/${MACHINE_ARCH}.exp
+	echo "set_board_info rsh_prog ssh" >> ${B}/${MACHINE_ARCH}.exp
+	echo "set_board_info rcp_prog scp" >> ${B}/${MACHINE_ARCH}.exp
+	echo "set_board_info hostname \$target" >> ${B}/${MACHINE_ARCH}.exp
+	DEJAGNU=${B}/site.exp make -k check RUNTESTFLAGS="--target_board=${MACHINE_ARCH}\$@"
 
+STOP
+
+	chmod +x ${B}/${TARGET_PREFIX}testgcc
+
+}
-- 
1.7.5.4



