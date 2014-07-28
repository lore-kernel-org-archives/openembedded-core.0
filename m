Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CDCED70872
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 16:55:11 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6SGtB4g000877; Mon, 28 Jul 2014 17:55:12 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id TUwUdBzpIbcv; Mon, 28 Jul 2014 17:55:11 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6SGt6S1000608
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 28 Jul 2014 17:55:08 +0100
Message-ID: <1406566505.13346.24.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 28 Jul 2014 17:55:05 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] populate_sdk_base: Fix grep command usage on old hosts
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
X-List-Received-Date: Mon, 28 Jul 2014 16:55:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

"man grep" on centos:

       -R, -r, --recursive
              Read all files under each directory, recursively; this is equivalent to the -d recurse option.

"man grep" on a more recent ubuntu system:

       -r, --recursive
              Read all files under each directory, recursively, following symbolic links only if they are on the command line.  This
              is equivalent to the -d recurse option.

So we have an issue when the SDK installer (even with
buildtools-tarball) is used on old hosts since it may try and
dereference paths which it should not. This is caused by differences in
the behaviour of grep -r on older systems. 

The fix is to wrap this in find so that only real files are found (as
elsewhere in the script.

[YOCTO #6577]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 893afbb..06112dc 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -285,7 +285,7 @@ done
 
 # find out all perl scripts in $native_sysroot and modify them replacing the
 # host perl with SDK perl.
-for perl_script in $($SUDO_EXEC grep "^#!.*perl" -rl $native_sysroot); do
+for perl_script in $($SUDO_EXEC find $native_sysroot -type f -exec grep "^#!.*perl" -l '{}' \;); do
 	$SUDO_EXEC sed -i -e "s:^#! */usr/bin/perl.*:#! /usr/bin/env perl:g" -e \
 		"s: /usr/bin/perl: /usr/bin/env perl:g" $perl_script
 done



