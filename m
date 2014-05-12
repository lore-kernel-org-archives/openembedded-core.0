Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (unknown [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 15586601A0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 10:04:42 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s4CA4bXP013034 for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 11:04:37 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id iNEA1HNYLY2I
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 11:04:37 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s4CA4Wmh013020
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 11:04:34 +0100
Message-ID: <1399889066.31891.126.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 12 May 2014 11:04:26 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] git: Fix various makefile flags
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
X-List-Received-Date: Mon, 12 May 2014 10:04:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We need to pass CFLAGS and LDFLAGS to the makefile correctly so we
need to list them as part of EXTRA_OEMAKE.

We also have a problem where git hardlinks binaries in bindir with
those in its libexecdir. If we change the RPATH in one of them, it
breaks the other. We therefore set the no cross dir hardlinking flag
git already has for this kind of issue. This ensures the RPATHS for
the git-core binaries works correctly. Its pure luck this has
sometimes worked so far.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index f5013f1..ad0ad1b 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -15,7 +15,8 @@ EXTRA_OECONF = "--with-perl=${STAGING_BINDIR_NATIVE}/perl-native/perl \
 
 inherit autotools-brokensep perlnative
 
-EXTRA_OEMAKE = "NO_PYTHON=1 RUNTIME_PREFIX=1"
+EXTRA_OEMAKE = "NO_PYTHON=1 RUNTIME_PREFIX=1 CFLAGS='${CFLAGS}' LDFLAGS='${LDFLAGS}'"
+EXTRA_OEMAKE_append_class-native = " NO_CROSS_DIRECTORY_HARDLINKS=1"
 
 do_compile_prepend () {
 	# Remove perl/perl.mak to fix the out-of-date perl.mak error



