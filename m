Return-Path: <rich.tollerton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 1EFE76017E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Dec 2014 05:47:12 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	sBB58jph020295 for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 23:08:45 -0600
Received: from weregild.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014121023084525-1004393 ;
	Wed, 10 Dec 2014 23:08:45 -0600 
From: Richard Tollerton <rich.tollerton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Dec 2014 23:08:01 -0600
Message-Id: <cover.1418274272.git.rich.tollerton@ni.com>
X-Mailer: git-send-email 2.1.3
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 12/10/2014 11:08:45 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 12/10/2014 11:08:45 PM,
	Serialize complete at 12/10/2014 11:08:45 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.13.68, 1.0.33,
	0.0.0000
	definitions=2014-12-10_09:2014-12-10, 2014-12-10,
	1970-01-01 signatures=0
Cc: ken.sharp@ni.com
Subject: [PATCH v3 0/9] udev-cache fixes
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
X-List-Received-Date: Thu, 11 Dec 2014 05:47:12 -0000

This is v3 of the udev-cache changes previously submitted by Ben Shelton and
myself last summer. This is primarily a cleanup of the patches that didn't make
it into dizzy; the only significant behavioral difference is that I'm now making
use of `udevadm control --stop-exec-queue` and `udevadm control
--start-exec-queue` to completely close the race condition between sysconf
generation and udev-cache tarball generation.


The following changes since commit 219e793907406eabf632e784e3a11ab9acb77cfb:

  qemu/libc-package: Fix qemu option handling (2014-12-05 17:59:42 +0000)

are available in the git repository at:

  git://github.com/rtollert/openembedded-core dev/rtollert/udev-cache-9
  https://github.com/rtollert/openembedded-core/tree/dev/rtollert/udev-cache-9

Richard Tollerton (9):
  udev-cache: stop race between sysconf and cache generation
  udev-cache: replace readfiles() with cmp
  udev-cache: don't generate sysconf twice
  udev-cache: refactor sysconf generation
  udev-cache: Clean up message when cache is invalidated
  udev-cache: always warn on console if invalidated
  udev-cache: invalidate on rules.d changes
  udev-cache: Update cache asynchronously
  udev-cache: refactor conditionals and error handling

 meta/recipes-core/udev/udev/init       | 56 ++++++++++++++++++----------------
 meta/recipes-core/udev/udev/udev-cache | 37 ++++++++++++++++++++--
 2 files changed, 63 insertions(+), 30 deletions(-)

-- 
2.1.3


