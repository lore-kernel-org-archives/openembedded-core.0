Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
	[209.85.210.169])
	by mail.openembedded.org (Postfix) with ESMTP id F33446C3B1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2019 05:59:39 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id s18so3782632pfm.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Dec 2019 21:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:content-transfer-encoding
	:mime-version; bh=1rJUGvdZR3pEQRtwmG9KHD6Al+atKTCwUfUM2bwj2MI=;
	b=LVqZ5KHu8Q7K7gqZXp+Eg1jjryruFVYHxTyG84B0RwhthX2xRG6d0aOtse8uXiZTlS
	eszHNCUTBKUrDLfHulBMFXd73rC90bP72s5u49+iOd5eh2R8NDfYgcLm8SRKruaKFwQB
	tjF3eU20V3N/l7vpIlwTGY75OC777UvP87uUK7otNWDNhyYkGHbsTndB79XDZ5cYl6X0
	NnonlbGY6m4g55L0UnVLJdNZhwpiOcGavfIT3+2ou/aCoCjo9Jj3tvuUoCUWf+6TxFrm
	fDVBYLLzadRT1rAtr/YydrFYN28U6HQoZXrYpOjxr5HZ06JKTk5HqK/rdFWbJVo2fn7b
	ieNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=1rJUGvdZR3pEQRtwmG9KHD6Al+atKTCwUfUM2bwj2MI=;
	b=PVHihLSzsoxPgQk/Q4MP6tRVetIfdzHBajB1YV4KusFOMWRlnJp4zyoPvB7guETkMs
	D8fMbs/D/vZRAI7+HKBZoJoJBgg/zQrtDxwqb6U4kPYPmahpxw9GG1z7CQykqWy9N/wX
	V/WSFs4LLM76r3T4fdxOOJO2NpkRfMSQXfsdhTlS1A6GQkO/xU3OeDFoWMT0qJUuXF2M
	t9zVyRUmE4nQF9SHH3G9mVTjfg0EhtgZ5U3U+gL/nNkwls6xtEhOAwVHp0u9XHYOHkQP
	eMViE7/vsB+MKxxHA3jAVJ/OG8qUnfrM2KGywz/oXsPw6ls58JQLiupk2/536OxMY0LZ
	6Hyw==
X-Gm-Message-State: APjAAAUNJ7Yi6Y4LIkvTkgo19bD1BP6L1qAAurKaxYeAmxX8nh/ZMMXd
	YvCOZFK6e8S7mpx2pLlR3i5Bgg==
X-Google-Smtp-Source: APXvYqyEszeravIrPiRE8qJGkai1uSiReNg0lEDzAFmPd29NToNmk/S5F5hVaNi0RSUtgEJr9fGvQA==
X-Received: by 2002:a63:1c5c:: with SMTP id c28mr29551718pgm.241.1575266380757;
	Sun, 01 Dec 2019 21:59:40 -0800 (PST)
Received: from [127.0.1.1] ([101.184.60.82])
	by smtp.gmail.com with UTF8SMTPSA id
	e188sm8141474pfe.113.2019.12.01.21.59.36
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 01 Dec 2019 21:59:39 -0800 (PST)
Date: Mon, 02 Dec 2019 05:59:23 +0000
Message-Id: <20191202055923.662058-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH] glibc-testing.inc: Remove testglibc script generation
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
X-List-Received-Date: Mon, 02 Dec 2019 05:59:41 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Remove the generation of the testglibc script which could be used to run
the glibc test suite with a remote target. The same functionality can
now be achieved with the 'do_check' task of glibc-testsuite or with
oe-selftest (for automation of execution against qemu-user/qemu-system
targets).

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-core/glibc/glibc-testing.inc | 95 -------------------------------
 meta/recipes-core/glibc/glibc.inc         |  1 -
 2 files changed, 96 deletions(-)
 delete mode 100644 meta/recipes-core/glibc/glibc-testing.inc

diff --git a/meta/recipes-core/glibc/glibc-testing.inc b/meta/recipes-core/glibc/glibc-testing.inc
deleted file mode 100644
index 0a42ae7f7c..0000000000
--- a/meta/recipes-core/glibc/glibc-testing.inc
+++ /dev/null
@@ -1,95 +0,0 @@
-do_compile_append () {
-	# now generate script to drive testing
-	echo "#!/usr/bin/env sh" >${B}/${HOST_PREFIX}testglibc
-	set >> ${B}/${HOST_PREFIX}testglibc
-	# prune out the unneeded vars
-	sed -i -e "/^BASH/d" ${B}/${HOST_PREFIX}testglibc
-	sed -i -e "/^USER/d" ${B}/${HOST_PREFIX}testglibc
-	sed -i -e "/^OPT/d" ${B}/${HOST_PREFIX}testglibc
-	sed -i -e "/^DIRSTACK/d" ${B}/${HOST_PREFIX}testglibc
-	sed -i -e "/^EUID/d" ${B}/${HOST_PREFIX}testglibc
-	sed -i -e "/^FUNCNAME/d" ${B}/${HOST_PREFIX}testglibc
-	sed -i -e "/^GROUPS/d" ${B}/${HOST_PREFIX}testglibc
-	sed -i -e "/^HOST/d" ${B}/${HOST_PREFIX}testglibc
-	sed -i -e "/^HOME/d" ${B}/${HOST_PREFIX}testglibc
-	sed -i -e "/^IFS/d" ${B}/${HOST_PREFIX}testglibc
-	sed -i -e "/^LC_ALL/d" ${B}/${HOST_PREFIX}testglibc
-	sed -i -e "/^LOGNAME/d" ${B}/${HOST_PREFIX}testglibc
-	sed -i -e "/^MACHTYPE/d" ${B}/${HOST_PREFIX}testglibc
-	sed -i -e "/^OSTYPE/d" ${B}/${HOST_PREFIX}testglibc
-	sed -i -e "/^PIPE/d" ${B}/${HOST_PREFIX}testglibc
-	sed -i -e "/^SHELL/d" ${B}/${HOST_PREFIX}testglibc
-	sed -i -e "/^'/d" ${B}/${HOST_PREFIX}testglibc
-	sed -i -e "/^UID/d" ${B}/${HOST_PREFIX}testglibc
-	sed -i -e "/^TERM/d" ${B}/${HOST_PREFIX}testglibc
-	sed -i -e "/^PKG_/d" ${B}/${HOST_PREFIX}testglibc
-	sed -i -e "/^POSIXLY_/d" ${B}/${HOST_PREFIX}testglibc
-	sed -i -e "/^PPID/d" ${B}/${HOST_PREFIX}testglibc
-	sed -i -e "/^PS4/d" ${B}/${HOST_PREFIX}testglibc
-	sed -i -e "/^Q/d" ${B}/${HOST_PREFIX}testglibc
-	sed -i -e "/^SHLVL/d" ${B}/${HOST_PREFIX}testglibc
-	sed -i -e "/^STAGING/d" ${B}/${HOST_PREFIX}testglibc
-	sed -i -e "/^LD_LIBRARY_PATH/d" ${B}/${HOST_PREFIX}testglibc
-	sed -i -e "/^PSEUDO/d" ${B}/${HOST_PREFIX}testglibc
-
-	# point to real sysroot not the toolchain bootstrap sysroot
-	sed -i -e "s/\-tcbootstrap//g" ${B}/${HOST_PREFIX}testglibc
-
-	# use the final cross-gcc to test since some tests need libstdc++
-	sed -i -e "s/^PATH=.*\.gcc-cross-initial\:/PATH=/g" ${B}/${HOST_PREFIX}testglibc
-
-	# append execution part script
-cat >> ${B}/${HOST_PREFIX}testglibc << STOP
-target="\$1"
-if [ "x\$target" = "x" ]
-then
-	echo "Please specify the target machine and remote user in form of user@target"
-	exit 1;
-fi
-ssh \$target ls \$PWD\  2>&1 > /dev/null
-if [ "x\$?" != "x0" ]
-then
-	echo "Failed connecting to \$target it could be because of:"
-	echo "1. You dont have passwordless ssh setup to access \$target"
-	echo "2. NFS share on \$target is not mounted or if mounted then not matching the build tree layout."
-	echo "   The tree should be accessible at same location on build host and target"
-	echo "   You can add nfs-client to IMAGE_FEATURES to get the nfs client on target"
-	echo "3. nfs server on build host is not running."
-	echo "   Please make sure that you have 'no_root_squash' added in /etc/exports if you want"
-	echo "   to test as root user on target (usually its recommended to create a non"
-	echo "   root user."
-	echo "   As a sanity check make sure that target can read/write to the glibc build tree"
-	echo "   Please refer to ${S}/EGLIBC.cross-testing for further instructions on setup"
-	exit 1
-fi
-	echo "# we test using cross compiler from real sysroot therefore override the" > ${B}/configparms
-	echo "# definitions that come from ${B}/config.make" >> ${B}/configparms
-	fgrep tcbootstrap ${B}/config.make > ${B}/configparms
-	sed -i -e "s/\-tcbootstrap//g" ${B}/configparms
-
-# g++ uses flag -nostdinc, so the locations of system include headers must be explicitly specified
-# If the locations are not already specified in config.make, then we provide the following locations:
-#    <sysroot>/usr/include/c++/<g++ version>
-#    <sysroot>/usr/include/c++/<g++ version>/<machine>
-
-cxxincludes=\`cat ${B}/config.make | gawk '\$1 == "c++-sysincludes"' | gawk -F"=" '{print \$2}' | sed "s/[ \t]\?//g"\`
-
-if [ -z "\$cxxincludes" ]; then
-  sysroot=\`cat ${B}/configparms | sed -n "/CXX/p" | sed -e "s/^.*--sysroot=//"\`
-  cxx=\`cat ${B}/configparms | gawk '\$1 ~ /^CXX/' | gawk -F"=" '{print \$2}' | gawk '{print \$1}'\`
-  cxxmachine=\`\$cxx -dumpmachine\`
-  cxxversion=\`\$cxx -dumpversion\`
-  # pass the new value of c++-sysincludes via configparms
-  echo "# c++-sysincludes added:" >> ${B}/configparms
-  echo "c++-sysincludes = -isystem \$sysroot/usr/include/c++/\$cxxversion -isystem \$sysroot/usr/include/c++/\$cxxversion/\$cxxmachine" >> ${B}/configparms
-fi
-
-wrapper="${S}/scripts/cross-test-ssh.sh \$target"
-localedef="${STAGING_BINDIR_NATIVE}/cross-localedef --little-endian --uint32-align=4"
-make tests-clean
-make cross-localedef="\$localedef" cross-test-wrapper="\$wrapper" -k check
-rm -rf ${B}/configparms
-STOP
-
-	chmod +x ${B}/${HOST_PREFIX}testglibc
-}
diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index ea9a04ac73..58d2ba7bc4 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -1,6 +1,5 @@
 require glibc-common.inc
 require glibc-ld.inc
-require glibc-testing.inc
 
 DEPENDS = "virtual/${TARGET_PREFIX}gcc libgcc-initial linux-libc-headers"
 
---
2.24.0

