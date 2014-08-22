Return-Path: <rich.tollerton@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id F118870F48
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Aug 2014 21:31:19 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.14.5/8.14.5) with ESMTP id
	s7MLVKbL009129; Fri, 22 Aug 2014 16:31:20 -0500
Received: from weregild.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014082216312021-290489 ;
	Fri, 22 Aug 2014 16:31:20 -0500 
From: Richard Tollerton <rich.tollerton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Aug 2014 16:30:46 -0500
Message-Id: <cover.1408742574.git.rich.tollerton@ni.com>
X-Mailer: git-send-email 2.0.4
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 08/22/2014 04:31:20 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 08/22/2014 04:31:20 PM,
	Serialize complete at 08/22/2014 04:31:20 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.27,
	0.0.0000
	definitions=2014-08-22_06:2014-08-22, 2014-08-22,
	1970-01-01 signatures=0
Cc: otavio@ossystems.com.br
Subject: [PATCH v2 00/12] udev-cache related changes
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
X-List-Received-Date: Fri, 22 Aug 2014 21:31:23 -0000

This is v2 of the changes submitted by Ben Shelton on August 4. I've reworked the
patches quite a bit, larger changes include:

- All non-udev-cache-related patches have been omitted. I'll submit those
  separately.
- Use `find` to build `tar` filelist. This eliminates the need for GNU- and
  busybox-specific tar options.
- No new settings have been added to udev-cache.default in order to preserve
  compatibility with older overrides of udev-cache.default. Note, this means a
  lot of new settings are duplicated between initscripts.
- System config is now generated immediately before the tarball is generated,
  and is manipulated at the file level instead of the shell variable level.
- Internal/corporate commit message fields stripped.
- Spurious whitespace changes should all be fixed.

There is one requested fix I'm pushing back on: Copying both $CMP_FILE_LIST and
/dev to tmpfs in a single operation to minimize race conditions. For a variety
of reasons, I abandoned trying to make this work in a single command. Instead
it's done in two: grabbing the system configuration (i.e reading /proc files and
udev rules) is done first, then /dev is archived as an uncompressed tarball.
Notably, using tar instead of cp means that I can use `find -xdev` and `find
-type` to eliminate a lot of other complexity. I think this approach will wind
up being faster than the straight-up copy approach, although I have not made any
attempt to confirm that.

The following changes since commit 47d1fc9f5c38f3d092937c47bd4c2f45adaa7fe6:

  qemu: fix Darwin cross-compilation (2014-08-18 20:43:24 +0100)

are available in the git repository at:

  git://github.com/rtollert/openembedded-core dev/rtollert/udev-cache-7
  https://github.com/rtollert/openembedded-core/tree/dev/rtollert/udev-cache-7

Richard Tollerton (12):
  udev-cache: Update cache tarball atomically
  udev-cache: Compress the cache
  udev-cache: choose a more descriptive cache filename
  busybox: enable `tar -m`
  udev-cache: strip timestamps on extract
  udev-cache: omit sockets and filesystems mounted under /dev
  udev-cache: Don't ignore error messages from cache extract
  udev-cache: parametrize sysconf file paths
  udev-cache: get system config immediately before cache
  udev-cache: invalidate on rules.d changes
  udev-cache: Update cache asynchronously
  udev-cache: refactor; improve verbosity and error handling

 meta/recipes-core/busybox/busybox/defconfig    |  2 +-
 meta/recipes-core/udev/udev/init               | 53 ++++++++++++--------------
 meta/recipes-core/udev/udev/udev-cache         | 42 ++++++++++++++++++--
 meta/recipes-core/udev/udev/udev-cache.default |  2 +-
 4 files changed, 64 insertions(+), 35 deletions(-)

-- 
2.0.4


