Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RbgSO-0002U2-8J
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Dec 2011 23:40:48 +0100
Received: by mail-iy0-f175.google.com with SMTP id h37so1565894iak.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2011 14:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=2iiEl0AOLFC93NRu31vMoVzg4NLjjPUKw9nz/t73BFg=;
	b=I3BVrrd1auM2hduExUuaZiPm7dl3mleE2WWRikGN7ZQ9fxcnf2KnhwO9IfjQtn+tUN
	qahprkCG9Sdc2HatlaginvCv3i7GxlKdyEvFPfRC32OSyoV+mkyIXzCjdsEGYu0wzpaa
	NHFKtY2uv+3Rqmq4HdvW/VguG7t+s8P2MokLo=
Received: by 10.50.160.134 with SMTP id xk6mr10991468igb.59.1324074830769;
	Fri, 16 Dec 2011 14:33:50 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id e2sm37152455ibe.0.2011.12.16.14.33.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Dec 2011 14:33:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Dec 2011 14:33:35 -0800
Message-Id: <afc34eae803b41745a8731bd29c93bb4558ba87d.1324074518.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1324074518.git.raj.khem@gmail.com>
References: <cover.1324074518.git.raj.khem@gmail.com>
Subject: [PATCH 1/4] eglibc-testing: Clean the test before running them
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
X-List-Received-Date: Fri, 16 Dec 2011 22:40:48 -0000

We make sure that we use final cross gcc to run the tests
since they require proper functioning libstdc++ and libssp
which are not staged in tcbootstrap sysroot

We cleanup the tests before we run them so they all
get run in case any of them were built and/or run during compilation

Make the script executable

Add more documentation to diagnose setup problems

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/eglibc/eglibc-testing.inc |   36 ++++++++++++++++++++++++++-
 1 files changed, 35 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc-testing.inc b/meta/recipes-core/eglibc/eglibc-testing.inc
index fb632ba..2cd7c6a 100644
--- a/meta/recipes-core/eglibc/eglibc-testing.inc
+++ b/meta/recipes-core/eglibc/eglibc-testing.inc
@@ -32,16 +32,50 @@ do_compile_append () {
 	sed -i -e "/^STAGING/d" ${B}/${HOST_PREFIX}testeglibc
 	sed -i -e "/^LD_LIBRARY_PATH/d" ${B}/${HOST_PREFIX}testeglibc
 	sed -i -e "/^PSEUDO/d" ${B}/${HOST_PREFIX}testeglibc
+
+	# point to real sysroot not the toolchain bootstrap sysroot
+	sed -i -e "s/\-tcbootstrap//g" ${B}/${HOST_PREFIX}testeglibc
+
+	# use the final cross-gcc to test since some tests need libstdc++
+	sed -i -e "s/^PATH=.*\.gcc-cross-intermediate\:/PATH=/g" ${B}/${HOST_PREFIX}testeglibc
+
 	# append execution part script
 cat >> ${B}/${HOST_PREFIX}testeglibc << STOP
 target="\$1"
 if [ "x\$target" = "x" ]
 then
-	echo "Please specify the target machine and remote user in for of user@target"
+	echo "Please specify the target machine and remote user in form of user@target"
 	exit 1;
 fi
+ssh \$target ls \$PWD\ >& /dev/null
+if [ "x\$?" != "x0" ]
+then
+	echo "Failed connecting to \$target it could be because of:"
+	echo "1. You dont have passwordless ssh setup to access \$target"
+	echo "2. NFS share on \$target is not mounted or if mounted then not matching the build tree layout."
+	echo "   The tree should be accessible at same location on build host and target"
+	echo "   You can add nfs-server to IMAGE_FEATURES to get the nfs client on target"
+	echo "3. nfs server on build host is not running."
+	echo "   Please make sure that you have 'no_root_squash' added in /etc/exports if you want"
+	echo "   to test as root user on target (usually its recommended to create a non"
+	echo "   root user."
+	echo "   As a sanity check make sure that target can read/write to the eglibc build tree"
+	echo "   Please refer to ${S}/EGLIBC.cross-testing for further instructions on setup"
+	exit 1
+fi
+	echo "# we test using cross compiler from real sysroot therefore override the" > ${B}/configparms
+	echo "# definitions that come from ${B}/config.make" >> ${B}/configparms
+
+	echo "CC = ${CC}" >> ${B}/configparms
+	echo "CXX = ${CXX}" >> ${B}/configparms
+	sed -i -e "s/\-tcbootstrap//g" ${B}/configparms
+
 wrapper="${S}/scripts/cross-test-ssh.sh \$target"
 localedef="${STAGING_BINDIR_NATIVE}/cross-localedef --little-endian --uint32-align=4"
+make tests-clean
 make cross-localedef="\$localedef" cross-test-wrapper="\$wrapper" -k check
+rm -rf ${B}/configparms
 STOP
+
+	chmod +x ${B}/${HOST_PREFIX}testeglibc
 }
-- 
1.7.5.4



