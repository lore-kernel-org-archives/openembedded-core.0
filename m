Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id ECABF72000
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Nov 2014 21:37:55 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	sA5L83MX014301 for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Nov 2014 15:08:03 -0600
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014110515080344-712816 ;
	Wed, 5 Nov 2014 15:08:03 -0600 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 5 Nov 2014 15:06:16 -0600
Message-Id: <1415221576-4852-1-git-send-email-ben.shelton@ni.com>
X-Mailer: git-send-email 2.1.3
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 11/05/2014 03:08:03 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 11/05/2014 03:08:03 PM,
	Serialize complete at 11/05/2014 03:08:03 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.28,
	0.0.0000
	definitions=2014-11-05_08:2014-11-05, 2014-11-05,
	1970-01-01 signatures=0
Subject: [PATCH] populate_sdk_base: improve POSIXLY_CORRECT compat
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
X-List-Received-Date: Wed, 05 Nov 2014 21:38:02 -0000

From: Richard Tollerton <rich.tollerton@ni.com>

The install script is sometimes called under POSIXLY_CORRECT. This
requires two fixes be made:

1. `find -perm /0000` is a gnuism; replace with an equivalent boolean
expression using `-perm -0000`.

2. POSIX grep requires that all options be passed on the command line
before all files; otherwise, the options must be parsed as filenames.

Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
---
 meta/files/toolchain-shar-template.sh | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/files/toolchain-shar-template.sh b/meta/files/toolchain-shar-template.sh
index 02035d4..2578a34 100644
--- a/meta/files/toolchain-shar-template.sh
+++ b/meta/files/toolchain-shar-template.sh
@@ -132,7 +132,8 @@ if [ "$dl_path" = "" ] ; then
 	echo "SDK could not be set up. Relocate script unable to find ld-linux.so. Abort!"
 	exit 1
 fi
-executable_files=$($SUDO_EXEC find $native_sysroot -type f -perm /111 -printf "'%h/%f' ")
+executable_files=$($SUDO_EXEC find $native_sysroot -type f \
+	\( -perm -0100 -o -perm -0010 -o -perm -0001 \) -printf "'%h/%f' ")
 
 tdir=`mktemp -d`
 if [ x$tdir = x ] ; then
@@ -162,7 +163,7 @@ done
 
 # find out all perl scripts in $native_sysroot and modify them replacing the
 # host perl with SDK perl.
-for perl_script in $($SUDO_EXEC find $native_sysroot -type f -exec grep "^#!.*perl" -l '{}' \;); do
+for perl_script in $($SUDO_EXEC find $native_sysroot -type f -exec grep -l "^#!.*perl" '{}' \;); do
 	$SUDO_EXEC sed -i -e "s:^#! */usr/bin/perl.*:#! /usr/bin/env perl:g" -e \
 		"s: /usr/bin/perl: /usr/bin/env perl:g" $perl_script
 done
-- 
2.1.3


