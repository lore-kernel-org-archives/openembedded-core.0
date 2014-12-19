Return-Path: <rich.tollerton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 8F7E172AD5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 20:46:30 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	sBJKkVPQ019024 for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 14:46:31 -0600
Received: from weregild.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014121914463138-273024 ;
	Fri, 19 Dec 2014 14:46:31 -0600 
From: Richard Tollerton <rich.tollerton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Dec 2014 14:46:22 -0600
Message-Id: <1419021985-10526-1-git-send-email-rich.tollerton@ni.com>
X-Mailer: git-send-email 2.2.1
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 12/19/2014 02:46:31 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 12/19/2014 02:46:31 PM,
	Serialize complete at 12/19/2014 02:46:31 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.13.68, 1.0.33,
	0.0.0000
	definitions=2014-12-19_05:2014-12-19, 2014-12-19,
	1970-01-01 signatures=0
Subject: [PATCH v2 0/3] xorg-font: stop trying to use build machine's encoding maps
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

(This is just a rebase; no changes vs v1.)

Several xorg-font builds were added to meta-oe recently. These builds tend to
fail on several Linux distros because they referenced encoding maps (e.g.
map-ISO8859-1) at native paths outside the sysroot, which don't exist; the build
expects /usr/share/fonts/X11/util/map-ISO8859-1 to exist, but the distro
actually installed it at /usr/share/fonts/util/map-ISO8859-1. Of course, the
correct behavior is for the build to reference the appropriate path under the
appropriate sysroot.

There are two different root causes. The first and by far the most important
cause is that we're explicitly blacklisting ${datadir}/fonts from staging, so it
was never possible for these maps to be sourced from sysroots in the first
place. This seems like a silly thing to do, and I could not find any
justification for it in the commit history, so I propose getting rid of it.

Once that was out of the way, I cleaned up some existing chicanery involving
where to look for the maps. In particular, presently font-util is hardcoding the
path to point at the native sysroot, for *all* architectures. Again, this seems
silly, I can't find any justification for it, and it breaks builds; I propose
getting rid of it.

These changes will require the font recipes in meta-oe need to be updated to
explicitly depend on font-util in addition to font-util-native; I'll post those
patches separately. (Yes, these font builds are arch-specific right now; making
them allarch is something I'm also working on.)

Richard Tollerton (3):
  staging.bbclass: Install ${datadir}/fonts/ into sysroots
  font-util: remove MAPFILES_PATH override
  xorg-font-common: fix sysroot injection for encoding maps

 meta/classes/staging.bbclass                         | 2 +-
 meta/recipes-graphics/xorg-font/font-util_1.3.0.bb   | 4 ----
 meta/recipes-graphics/xorg-font/xorg-font-common.inc | 8 +-------
 3 files changed, 2 insertions(+), 12 deletions(-)

-- 
2.2.1


