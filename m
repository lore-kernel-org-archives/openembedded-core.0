Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1C72C6FE7E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 18:41:40 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.14.5/8.14.5) with ESMTP id
	s74Iff9D016927 for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Aug 2014 13:41:42 -0500
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014080413414182-622931 ;
	Mon, 4 Aug 2014 13:41:41 -0500 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 4 Aug 2014 13:41:11 -0500
Message-Id: <b56115f746af1b91da18dc418f8f647345f942fe.1407177403.git.ben.shelton@ni.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <cover.1407177403.git.ben.shelton@ni.com>
References: <cover.1407177403.git.ben.shelton@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 08/04/2014 01:41:41 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 08/04/2014 01:41:42 PM,
	Serialize complete at 08/04/2014 01:41:42 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.27,
	0.0.0000
	definitions=2014-08-04_03:2014-08-04, 2014-08-04,
	1970-01-01 signatures=0
Subject: [PATCH 19/20] udev: Disable keymap support on machines lacking keyboard support
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
X-List-Received-Date: Mon, 04 Aug 2014 18:41:41 -0000

From: Richard Tollerton <rich.tollerton@ni.com>

/lib/udev/keymaps/ is 244k. On headless machines, this is wasted space.

Natinst-Rally-ID: TA44427
Acked-by: Gratian Crisan <gratian.crisan@ni.com>
Natinst-ReviewBoard-ID: 58621
Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
---
 meta/recipes-core/udev/udev.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
index 8394064..2d2150c 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -51,6 +51,7 @@ EXTRA_OECONF = "--disable-introspection \
                 --with-rootlibdir=${base_libdir} \
                 --with-rootprefix= \
                 --without-systemdsystemunitdir \
+                ${@base_contains('MACHINE_FEATURES', 'keyboard', '', '--disable-keymap', d)} \
                "
 
 PACKAGES =+ "udev-cache"
-- 
2.0.4


