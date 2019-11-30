Return-Path: <nathan@nathanrossi.com>
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
	[209.85.216.41])
	by mail.openembedded.org (Postfix) with ESMTP id 2DB6E7F2BC
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Nov 2019 10:48:28 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id s35so1180643pjb.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Nov 2019 02:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:content-transfer-encoding
	:mime-version; bh=5uoaORPo9l+MW5TZYtfhx/Zt+L6LUDzmV+R+ekYKY1A=;
	b=fWMUytj1lPXYj+jKJodLAjUn52IrWrVxC7KbUZMx7nDjy7mC64lODq5nFINqEWQIlI
	c05FoE5htL49dxTLVXpXSrY0gSotiLj4lV3n7O1Y0J2LcOglhHLzkSxkrCALws+6o4Rv
	73bI0FDjr9qw+E2I9yZNJ4vmCHWYD7jQrOFbZKn0apiM8wIecmEjT6GsNRFfVWPNjMRP
	CPK0Eo50/hAT9m0Oku8bLUHvIOovPtJhTK12yhENMxgqqmii07mxZBwKTr9pE4uiy5DQ
	a/gr2t3mnW4l3rOqEbXzsh48BVwREcGXmXbvWFh+kHqjNUE3uws5vHO2g28XlZJvfpry
	OLFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=5uoaORPo9l+MW5TZYtfhx/Zt+L6LUDzmV+R+ekYKY1A=;
	b=JV968VKeU5D/BupT2LAdfxTraZNvPLW8pEgBY3Yccfirm5ytlLtagAi3bddUgNwu/R
	u9rbNP5NSbtOlXw3yCjml6vCD09V4xNwHO4AZVv31vRUfxcveieDMl45FE/p9SAwz6Jn
	cN6xUHN/TYHQU/kUmlyGBu2U77J4ra+XgEXSE5MIt3BK0yUARZ1/GMfa05PLaLpVtcVy
	IR87XF5M20RG6h6n0+hHrDdbBfWvgZfhQI9IiMgIl4xTjYJZMNBW8S/M+m4ZdkFIWgyI
	NGLQtZRtVuDcQFrBFFbb07G+8T8eJohC3xLpGDIIWnx80m1wSe62OZ0XQQgddLakIZ87
	V0Gg==
X-Gm-Message-State: APjAAAXGiJe2/e0d9De44R3S7CNbwKaHExYVowb/Z0ualKL03sFjTXuV
	ML4DD1k4Q7qYABRA3d5INYP+hXoj+5w=
X-Google-Smtp-Source: APXvYqx6GexqxthnTifK6480XmxDK0hObdHUgv1mfWLIMz03bvoAPYhX1iFO9yDFIOWbxAAx++bj2g==
X-Received: by 2002:a17:90a:a410:: with SMTP id
	y16mr2840144pjp.119.1575110909355; 
	Sat, 30 Nov 2019 02:48:29 -0800 (PST)
Received: from [127.0.1.1] ([101.184.60.82])
	by smtp.gmail.com with UTF8SMTPSA id
	u3sm26726825pgp.51.2019.11.30.02.48.27
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 30 Nov 2019 02:48:28 -0800 (PST)
Date: Sat, 30 Nov 2019 10:48:23 +0000
Message-Id: <20191130104823.584542-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH] gcc-cross.inc: Remove test runner script generation
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
X-List-Received-Date: Sat, 30 Nov 2019 10:48:29 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Remove the generation of the testgcc script which could be used to run
the gcc test suite against a cross compiler with a remote execution
target. The same functionality can now be achieved with the 'do_check'
task of gcc-runtime or with oe-selftest (for automation of execution
against qemu-user/qemu-system targets).

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-devtools/gcc/gcc-cross.inc | 90 ---------------------------------
 1 file changed, 90 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index 6784d9673f..c68cdd5dc4 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -77,96 +77,6 @@ do_compile () {
 
 	oe_runmake all-host configure-target-libgcc
 	(cd ${B}/${TARGET_SYS}/libgcc; oe_runmake enable-execute-stack.c unwind.h md-unwind-support.h sfp-machine.h gthr-default.h)
-	# now generate script to drive testing
-	echo "#!/usr/bin/env sh" >${B}/${TARGET_PREFIX}testgcc
-	set >> ${B}/${TARGET_PREFIX}testgcc
-	# prune out the unneeded vars
-	sed -i -e "/^BASH/d" ${B}/${TARGET_PREFIX}testgcc
-	sed -i -e "/^USER/d" ${B}/${TARGET_PREFIX}testgcc
-	sed -i -e "/^OPT/d" ${B}/${TARGET_PREFIX}testgcc
-	sed -i -e "/^DIRSTACK/d" ${B}/${TARGET_PREFIX}testgcc
-	sed -i -e "/^EUID/d" ${B}/${TARGET_PREFIX}testgcc
-	sed -i -e "/^FUNCNAME/d" ${B}/${TARGET_PREFIX}testgcc
-	sed -i -e "/^GROUPS/d" ${B}/${TARGET_PREFIX}testgcc
-	sed -i -e "/^HOST/d" ${B}/${TARGET_PREFIX}testgcc
-	sed -i -e "/^HOME/d" ${B}/${TARGET_PREFIX}testgcc
-	sed -i -e "/^IFS/d" ${B}/${TARGET_PREFIX}testgcc
-	sed -i -e "/^LC_ALL/d" ${B}/${TARGET_PREFIX}testgcc
-	sed -i -e "/^LOGNAME/d" ${B}/${TARGET_PREFIX}testgcc
-	sed -i -e "/^MACHTYPE/d" ${B}/${TARGET_PREFIX}testgcc
-	sed -i -e "/^OSTYPE/d" ${B}/${TARGET_PREFIX}testgcc
-	sed -i -e "/^PIPE/d" ${B}/${TARGET_PREFIX}testgcc
-	sed -i -e "/^SHELL/d" ${B}/${TARGET_PREFIX}testgcc
-	sed -i -e "/^'/d" ${B}/${TARGET_PREFIX}testgcc
-	sed -i -e "/^UID/d" ${B}/${TARGET_PREFIX}testgcc
-	sed -i -e "/^TERM/d" ${B}/${TARGET_PREFIX}testgcc
-	sed -i -e "/^PKG_/d" ${B}/${TARGET_PREFIX}testgcc
-	sed -i -e "/^POSIXLY_/d" ${B}/${TARGET_PREFIX}testgcc
-	sed -i -e "/^PPID/d" ${B}/${TARGET_PREFIX}testgcc
-	sed -i -e "/^PS4/d" ${B}/${TARGET_PREFIX}testgcc
-	sed -i -e "/^Q/d" ${B}/${TARGET_PREFIX}testgcc
-	sed -i -e "/^SHLVL/d" ${B}/${TARGET_PREFIX}testgcc
-	sed -i -e "/^STAGING/d" ${B}/${TARGET_PREFIX}testgcc
-	sed -i -e "/^LD_LIBRARY_PATH/d" ${B}/${TARGET_PREFIX}testgcc
-	sed -i -e "/^PSEUDO/d" ${B}/${TARGET_PREFIX}testgcc
-
-	# append execution part of the script
-cat >> ${B}/${TARGET_PREFIX}testgcc << STOP
-target="\$1"
-usage () {
-	echo "Usage:"
-	echo "\$0 user@target 'extra options to dejagnu'"
-	echo "\$0 target 'extra options to dejagnu'"
-	echo "\$0 target"
-	echo "e.g. \$0 192.168.7.2 ' dg.exp=visibility-d.c'"
-	echo "will only run visibility-d.c test case"
-	echo "e.g. \$0 192.168.7.2 '/-mthumb dg.exp=visibility-d.c'"
-	echo "will only run visibility-d.c test case in thumb mode"
-	echo "You need to have dejagnu autogen expect installed"
-	echo "on the build host"
-    }
-if [ "x\$target" = "x" ]
-then
-	echo "Please specify the target machine and remote user in form of user@target\n"
-	usage
-	exit 1;
-fi
-
-shift
-
-echo "\$target" | grep "@" 2>&1 > /dev/null
-if [ "x\$?" = "x0" ]
-then
-   user=\$(echo \$target | cut -d '@' -f 1)
-   target=\$(echo \$target | cut -d '@' -f 2)
-else
-   user=\$USER
-fi
-ssh \$user@\$target date 2>&1 > /dev/null
-if [ "x\$?" != "x0" ]
-then
-	echo "Failed connecting to \$user@\$target it could be because"
-	echo "you don't have passwordless ssh setup to access \$target"
-	echo "or sometimes host key has been changed"
-	echo "in such case do something like below on build host"
-	echo "ssh-keygen -f "~/.ssh/known_hosts" -R \$target"
-	echo "and then try ssh \$user@\$target"
-
-	usage
-	exit 1
-fi
-	echo "lappend boards_dir [pwd]/../../.." > ${B}/site.exp
-	echo "load_generic_config \"unix\"" > ${B}/${PACKAGE_ARCH}.exp
-	echo "set_board_info username \$user" >> ${B}/${PACKAGE_ARCH}.exp
-	echo "set_board_info rsh_prog ssh" >> ${B}/${PACKAGE_ARCH}.exp
-	echo "set_board_info rcp_prog scp" >> ${B}/${PACKAGE_ARCH}.exp
-	echo "set_board_info hostname \$target" >> ${B}/${PACKAGE_ARCH}.exp
-	DEJAGNU=${B}/site.exp make -k check RUNTESTFLAGS="--target_board=${PACKAGE_ARCH}\$@"
-
-STOP
-
-	chmod +x ${B}/${TARGET_PREFIX}testgcc
-
 }
 
 INHIBIT_PACKAGE_STRIP = "1"
---
2.24.0

