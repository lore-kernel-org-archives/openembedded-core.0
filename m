Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1708E6FA94
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 18:41:40 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.14.5/8.14.5) with ESMTP id
	s74Iff9A016927 for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Aug 2014 13:41:41 -0500
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014080413414171-622924 ;
	Mon, 4 Aug 2014 13:41:41 -0500 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 4 Aug 2014 13:41:04 -0500
Message-Id: <17dc769adb9aef8b1cdb1f298874d482f0337ad3.1407177403.git.ben.shelton@ni.com>
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
Subject: [PATCH 12/20] udev-cache: fix timestamp errors on systems lacking an RTC
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

If the system lacks an RTC, the time will typically start from the
epoch, and may get set to the "correct" time later (if at all).
In this circumstance, the timestamps in the cache tarball will always be
in the future. gnutar complains bitterly about this.

To work around this, use `tar -m` to strip mtimes during extract.

Natinst-Rally-ID: TA44427
Acked-by: Gratian Crisan <gratian.crisan@ni.com>
Natinst-ReviewBoard-ID: 58620
Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
---
 meta/recipes-core/udev/udev/udev-cache.default | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/udev/udev/udev-cache.default b/meta/recipes-core/udev/udev/udev-cache.default
index 30d7faa..554142a 100644
--- a/meta/recipes-core/udev/udev/udev-cache.default
+++ b/meta/recipes-core/udev/udev/udev-cache.default
@@ -7,7 +7,8 @@ DEVCACHE_SYSCONF="/etc/udev/cache.data"
 DEVCACHE_CURRENT_SYSCONF="/dev/shm/udev.cache"
 
 # - Avoid /dev/log because it's a pipe.
-DEVCACHE_EXTRACT_OPTS="--exclude=log"
+# - Don't restore mtimes. Avoids errors on systems lacking an RTC.
+DEVCACHE_EXTRACT_OPTS="--exclude=log -m"
 DEVCACHE_CREATE_OPTS="--exclude=log"
 
 PROBE_PLATFORM_BUS="yes"
-- 
2.0.4


