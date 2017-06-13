Return-Path: <amarnath.valluri@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A468E78265
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 06:56:08 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jun 2017 23:56:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,337,1493708400"; d="scan'208";a="980108454"
Received: from avallurigigabyte.fi.intel.com ([10.237.72.170])
	by orsmga003.jf.intel.com with ESMTP; 12 Jun 2017 23:56:07 -0700
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Jun 2017 09:52:32 +0300
Message-Id: <1497336760-36835-1-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v3 0/8] Fix for #7040 - Support for /usr merge
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
X-List-Received-Date: Tue, 13 Jun 2017 06:56:08 -0000

This set of patches implements the long-standing feature - merging of /bin,
/sbin, /libs to their /usr counterparts.

It introduces a 'usrmerge' DISTRO_FEATURE, when it's enabled:
    - other than native all base paths(base_{bin,sbin,lib}dir) points to
      ${exec_prefix}/{bin,sbin,lib}
    - base-files package adds the needed root links(/bin, /sbin, /lib{32,64})
      points to /usr counterparts
    - As most of shell scripts refer "#!/bin/{sh,bash}" inside script, so makes
      sure that get added to RPROVIDES_ list by those packages to satisfy the
      build dependencies.

The assumption is that no recipe uses hard coded paths in recipes where
pre-defined bitbake configuration variables are available. I have fixed quite
many recipes that i found which violates this assumption. A sanity check is
added for reporting these broken recipies.

I have tested this change on core-minimal, sato, windriver cube-desktop and
intel-iot-refkit image builds.  And i would prefer to run autobuilder tests
prior to merging.

Changes in v2:
    - Moved root links creation out from 'base-files' to pre-rootfs.
    - Fixes to lsb, lttng-modules recipes., that are failed in autobuilder
      tests.
    - Added insane check to usrmerge feature.
    - Fixed typos in commit messages.

Changes in v3:
    - Rebased against master and dropped patches those got already merged.
    - As per review comments added new configuration variable ${root_prefix}
      that will be altered based on 'usrmerge' distro feature.
    - Made use of ${root_prefix} in place of ${base_preix} both in systemd
      recipe and cross.bbclass
    - Dropped patch that is touching nativesdk configuration.


Amarnath Valluri (8):
  bitbake.conf: support for merged usr with DISTRO_FEATURE usrmerge
  cross.bbclass: merged /usr support
  systemd: chagnes to support merged /usr
  bash: changes to support merged /usr
  busybox: changes to support merged /usr
  sed: changes to support merged /usr
  image: create symlinks needed for merged /usr
  insane.bbclass: Add package QA check for merged /usr.

 meta/classes/cross.bbclass               |  4 ++--
 meta/classes/image.bbclass               | 23 +++++++++++++++++++++++
 meta/classes/insane.bbclass              | 16 ++++++++++++++++
 meta/conf/bitbake.conf                   | 10 ++++++----
 meta/recipes-core/busybox/busybox.inc    |  2 ++
 meta/recipes-core/systemd/systemd_232.bb |  6 +++---
 meta/recipes-extended/bash/bash.inc      |  2 ++
 meta/recipes-extended/sed/sed_4.2.2.bb   |  1 +
 8 files changed, 55 insertions(+), 9 deletions(-)

-- 
2.7.4


