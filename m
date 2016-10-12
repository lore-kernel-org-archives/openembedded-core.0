Return-Path: <rich.tollerton@ni.com>
X-Greylist: delayed 1377 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 12 Oct 2016 01:31:18 UTC
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8CE2671994
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 01:31:18 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u9C18Ksh010301; Tue, 11 Oct 2016 20:08:20 -0500
Received: from weregild.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016101120082065-826472 ;
	Tue, 11 Oct 2016 20:08:20 -0500 
From: Richard Tollerton <rich.tollerton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Oct 2016 20:08:15 -0500
Message-Id: <20161012010815.15477-1-rich.tollerton@ni.com>
X-Mailer: git-send-email 2.10.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 10/11/2016 08:08:20 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 10/11/2016 08:08:20 PM,
	Serialize complete at 10/11/2016 08:08:20 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-10-11_10:, , signatures=0
Subject: [PATCH] base-files: fix profile error under < /dev/null
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
X-List-Received-Date: Wed, 12 Oct 2016 01:31:19 -0000

Previous attempts to constrain execution of `resize` to only TTYs did
not properly handle situations when `tty` would return the string "not a
tty". The symptom is "/etc/profile: line 34: test: too many arguments".
Fix this by utilizing the exit code of `tty`. Also use `case` instead of
`cut` to eliminate a subshell.

Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
---
 meta/recipes-core/base-files/base-files/profile | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/base-files/base-files/profile b/meta/recipes-core/base-files/base-files/profile
index 0a05e45..7367fd1 100644
--- a/meta/recipes-core/base-files/base-files/profile
+++ b/meta/recipes-core/base-files/base-files/profile
@@ -22,10 +22,12 @@ if [ -d /etc/profile.d ]; then
   unset i
 fi
 
-if [ -x /usr/bin/resize ];then
+if [ -x /usr/bin/resize ] && termpath="`tty`"; then
   # Make sure we are on a serial console (i.e. the device used starts with /dev/tty),
   # otherwise we confuse e.g. the eclipse launcher which tries do use ssh
-  test "`tty | cut -c1-8`" = "/dev/tty" && resize >/dev/null
+  case "$termpath" in
+  /dev/tty*) resize >/dev/null
+  esac
 fi
 
 export PATH PS1 OPIEDIR QPEDIR QTDIR EDITOR TERM
-- 
2.10.0


