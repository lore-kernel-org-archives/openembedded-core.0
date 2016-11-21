Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1F4206071F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2016 15:07:19 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 21 Nov 2016 07:07:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,675,1473145200"; d="scan'208";a="789098706"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Nov 2016 07:07:12 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Nov 2016 17:07:09 +0200
Message-Id: <1479740831-661-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH 0/2] Stop using update-alternatives to manage syslog init script
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
X-List-Received-Date: Mon, 21 Nov 2016 15:07:20 -0000

Managing (SysV) init scripts with update-alternatives seems to be a bad idea.
Package scriptlets (i.e. preinst/postinst/prerm/postrm) in oe-core are
constructed from multiple fragments originating from separate bbclasses. Thus,
the exact final scriptlet(s) depend on the inheritance order of the classes and
is thus delicate by design. Especially in the case of init scripts we always
seem to break some use cases, whatever inheritance order we use. E.g.
update-rc.d fails because init script (link) is not yet present or daemon
start/stop fails because init script (link) is not yet/anymore present. Also,
for reference, no other packages than the syslog packages seem to use
update-alternatives for managing init scripts.

This patchset fixes the problem by removing the update-alternatives mechanism
from syslog packages and making them conflict with each other so that they
cannot be installed on the system at the same time.

[YOCTO #10433]

The following changes since commit a675b2c89e477af088faee9b3be96eae19a85f0b:

  sanity.bbclass: fix logging of an error (2016-11-15 15:18:50 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib marquiz/fixes-10433
  http://git.openembedded.org/openembedded-core-contrib/log/?h=marquiz/fixes-10433


Markus Lehtonen (2):
  busybox: don't manage sysv init script with update-alternatives
  sysklogd: don't use update-alternatives

 meta/conf/distro/include/default-providers.inc |  1 +
 meta/recipes-core/busybox/busybox.inc          | 26 +++++++-------------------
 meta/recipes-extended/sysklogd/sysklogd.inc    | 15 +++------------
 3 files changed, 11 insertions(+), 31 deletions(-)

-- 
2.6.6


