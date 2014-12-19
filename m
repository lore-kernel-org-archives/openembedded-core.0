Return-Path: <rich.tollerton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 8E5F872AA9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 20:46:30 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	sBJKkVPR019024 for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 14:46:31 -0600
Received: from weregild.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014121914463139-273025 ;
	Fri, 19 Dec 2014 14:46:31 -0600 
From: Richard Tollerton <rich.tollerton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Dec 2014 14:46:23 -0600
Message-Id: <1419021985-10526-2-git-send-email-rich.tollerton@ni.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <1419021985-10526-1-git-send-email-rich.tollerton@ni.com>
References: <1419021985-10526-1-git-send-email-rich.tollerton@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 12/19/2014 02:46:31 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 12/19/2014 02:46:31 PM,
	Serialize complete at 12/19/2014 02:46:31 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.13.68, 1.0.33,
	0.0.0000
	definitions=2014-12-19_05:2014-12-19, 2014-12-19,
	1970-01-01 signatures=0
Subject: [PATCH v2 1/3] staging.bbclass: Install ${datadir}/fonts/ into sysroots
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
X-List-Received-Date: Fri, 19 Dec 2014 20:46:34 -0000

font-util installs encoding maps into /usr/share/fonts/X11. This path
may not exist on the host (many distros install these into
/usr/share/fonts/util) so they must exist in the sysroot in order for
e.g. `pkg-config --variable=mapdir fontutil` to work correctly. However,
currently /usr/share/fonts is explicitly not installed into sysroots, so
the encoding maps were not getting found.

Fix this by no longer deleting ${datadir}/fonts/ from sysroots.

Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
---
 meta/classes/staging.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 57b2743..c4a2cb1 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -50,7 +50,7 @@ sysroot_stage_dirs() {
 	sysroot_stage_dir $from${datadir} $to${datadir}
 	# We don't care about docs/info/manpages/locales
 	rm -rf $to${mandir}/ $to${docdir}/ $to${infodir}/ ${to}${datadir}/locale/
-	rm -rf $to${datadir}/applications/ $to${datadir}/fonts/ $to${datadir}/pixmaps/
+	rm -rf $to${datadir}/applications/ $to${datadir}/pixmaps/
 }
 
 sysroot_stage_all() {
-- 
2.2.1


