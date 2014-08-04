Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 2634070246
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 18:41:40 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	s74IffIh020194 for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Aug 2014 13:41:41 -0500
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014080413414172-622925 ;
	Mon, 4 Aug 2014 13:41:41 -0500 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 4 Aug 2014 13:41:05 -0500
Message-Id: <3e278d7733edb0f2473ee7a874b0e971080843d8.1407177403.git.ben.shelton@ni.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <cover.1407177403.git.ben.shelton@ni.com>
References: <cover.1407177403.git.ben.shelton@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 08/04/2014 01:41:41 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 08/04/2014 01:41:41 PM,
	Serialize complete at 08/04/2014 01:41:41 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.27,
	0.0.0000
	definitions=2014-08-04_03:2014-08-04, 2014-08-04,
	1970-01-01 signatures=0
Subject: [PATCH 13/20] udev-cache: Avoid caching udev.cache or non-devfs filesystems
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
X-List-Received-Date: Mon, 04 Aug 2014 18:41:42 -0000

From: Richard Tollerton <rich.tollerton@ni.com>

If $DEVCACHE_CURRENT_SYSCONF gets stored in the cache tarball, and
extracted, then udev-cache will needlessly rebuild the cache on every
future boot. The direct fix to this is to explicitly exclude it.

Investigating this also uncovered that we're also archiving everything
under other filesystems, including /dev/cgroup, /dev/shm, etc. This
shouldn't be happening. The fix is to use `tar --one-file-system`, but
this is GNU-specific.

Natinst-Rally-ID: TA44427
Acked-by: Gratian Crisan <gratian.crisan@ni.com>
Natinst-ReviewBoard-ID: 58620
Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
---
 meta/recipes-core/udev/udev/udev-cache.default | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/udev/udev/udev-cache.default b/meta/recipes-core/udev/udev/udev-cache.default
index 554142a..c71826e 100644
--- a/meta/recipes-core/udev/udev/udev-cache.default
+++ b/meta/recipes-core/udev/udev/udev-cache.default
@@ -8,7 +8,8 @@ DEVCACHE_CURRENT_SYSCONF="/dev/shm/udev.cache"
 
 # - Avoid /dev/log because it's a pipe.
 # - Don't restore mtimes. Avoids errors on systems lacking an RTC.
-DEVCACHE_EXTRACT_OPTS="--exclude=log -m"
-DEVCACHE_CREATE_OPTS="--exclude=log"
+# - (gnutar specific) Stay on the same fs.
+DEVCACHE_EXTRACT_OPTS="--exclude=log -m --exclude=udev.cache --one-file-system"
+DEVCACHE_CREATE_OPTS="--exclude=log --exclude=udev.cache --one-file-system"
 
 PROBE_PLATFORM_BUS="yes"
-- 
2.0.4


