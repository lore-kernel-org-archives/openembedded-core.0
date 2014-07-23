Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 8301C6FE76
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 22:29:43 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	s6NMTikV013949 for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 17:29:44 -0500
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014072317294476-159140 ;
	Wed, 23 Jul 2014 17:29:44 -0500 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Jul 2014 17:29:28 -0500
Message-Id: <1406154568-29973-1-git-send-email-ben.shelton@ni.com>
X-Mailer: git-send-email 2.0.2
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/23/2014 05:29:44 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/23/2014 05:29:44 PM,
	Serialize complete at 07/23/2014 05:29:44 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.14,
	0.0.0000
	definitions=2014-07-23_07:2014-07-23, 2014-07-23,
	1970-01-01 signatures=0
Subject: [PATCH] base-files: Don't export TZ if /etc/TZ exists
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
X-List-Received-Date: Wed, 23 Jul 2014 22:29:44 -0000

From: Richard Tollerton <rich.tollerton@ni.com>

While glibc/eglibc looks for the time zone in /etc/localtime, other libc
alternatives (e.g. uclibc) may look for it in /etc/TZ.  If /etc/TZ
exists, don't fall back to setting TZ to "UTC" in /etc/profile.

Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
Signed-off-by: Ben Shelton <ben.shelton@ni.com>
---
 meta/recipes-core/base-files/base-files/profile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/base-files/base-files/profile b/meta/recipes-core/base-files/base-files/profile
index 8eeaac3..0b2d9d7 100644
--- a/meta/recipes-core/base-files/base-files/profile
+++ b/meta/recipes-core/base-files/base-files/profile
@@ -5,7 +5,7 @@ PATH="/usr/local/bin:/usr/bin:/bin"
 EDITOR="/bin/vi"			# needed for packages like cron
 test -z "$TERM" && TERM="vt100"	# Basic terminal capab. For screen etc.
 
-if [ ! -e /etc/localtime ]; then
+if [ ! -e /etc/localtime -a ! -e /etc/TZ ]; then
 	TZ="UTC"		# Time Zone. Look at http://theory.uwinnipeg.ca/gnu/glibc/libc_303.html 
 				# for an explanation of how to set this to your local timezone.
 	export TZ
-- 
2.0.2


