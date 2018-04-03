Return-Path: <kamensky@cisco.com>
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
	by mail.openembedded.org (Postfix) with ESMTP id 4EE2774897
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Apr 2018 17:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=4784; q=dns/txt; s=iport;
	t=1522776231; x=1523985831;
	h=from:to:cc:subject:date:message-id;
	bh=YFV4CvlJJgkKCk/ZzHGspcG0z0oib3MYpdjlJdw0RJ4=;
	b=hldUq3H5cVngy2Smt7oyiE842GN8W2Dno2p9vck3XOrUeDvGZftewvUJ
	n6CjelZjemPeSrbA0Mle5iuzvG9BRxvr5bcTMhVANvsX/2sLI0IlibaZS
	AZdPOg9kZVOYHdwLhrJi01H2Hg++rT7EQzQ0nrcEdh9Ke84xNGURkwAKz I=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AYAgBQuMNa/4cNJK1dGQEBAQEBAQEBA?=
	=?us-ascii?q?QEBAQcBAQEBAYNCYW8omGODA5RPCxgNhF6ERCE4FAECAQEBAQEBAmsohSUFeIE?=
	=?us-ascii?q?JhVUPr0CIRIIlh2GCE4Ncg0UCAQKHLQKHQoQvAWGKaAiFA0+FA4NaAoFoik2JF?=
	=?us-ascii?q?YZBAhETAYElMyEmgSxNIxVHEIImCYI/jiUfMAGOPAEB?=
X-IronPort-AV: E=Sophos;i="5.48,402,1517875200"; d="scan'208";a="376142708"
Received: from alln-core-2.cisco.com ([173.36.13.135])
	by rcdn-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Apr 2018 17:23:50 +0000
Received: from kamensky-w541.cisco.com ([10.82.174.186]) (authenticated bits=0)
	by alln-core-2.cisco.com (8.14.5/8.14.5) with ESMTP id w33HNck0010603
	(version=TLSv1/SSLv3 cipher=AES128-SHA256 bits=128 verify=NO);
	Tue, 3 Apr 2018 17:23:49 GMT
From: Victor Kamensky <kamensky@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Apr 2018 10:23:32 -0700
Message-Id: <1522776217-23250-1-git-send-email-kamensky@cisco.com>
X-Mailer: git-send-email 2.7.4
X-Authenticated-User: kamensky@cisco.com
Cc: Alexander Kanavin <alexander.kanavin@intel.com>
Subject: [PATCH v2 0/5] systemtap adding sysroot, cross compiling of user land related scripts
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
X-List-Received-Date: Tue, 03 Apr 2018 17:23:50 -0000

Hi,

This is second version of patch series of SystemTap supporting
sysroot and SystemTap script cross compilation, integrated with
OE workflow.

Since first, RFC, version [1] the following changes were done:

   image: add image-combined-dbg helper class

      Needed to create rootfs-dbg that contains both target binaries
      and debug symbols. Instead of IMAGE_GEN_COMBINED_DEBUGFS build
      option as in RFC patches [2], small additional class is
      introduced that allows adding target symbols back into
      rootfs-dbg. The approach was suggested by Khem, as response on
      first RFC patches.

   Revert "systemtap: Cross compilation fix"

      Remove previous OE specific patch. It superseded
      by --sysroot support patch series

   systemtap: support --sysroot option in variety of situations in cross build

      Backport of SystemTap patches required to support --sysroot.
      Since my first post I worked with SystemTap maintainers and
      now all needed fixes for sysroot support got accepted.

   systemtap: create translator packageconfig

      Creates new PACKAGECONFIG, translator, which is on by default,
      but if dropped resulting systemtap package would contain only
      minimal run-time utilities required to activate/run host cross
      compiled SystemTap modules. It is implemented in such way
      instead of separate systemtap-utils recipe based on team's
      feedback.

   crosstap: replace script with new python based implementation

      Full backward compatible replacement of original crosstap
      shell script, written in python with extended functionality
      to support SystemTap scripts for user-land using --sysroot
      option. Compared to RFC version new script invocation wise is
      fully backward compatible with orginal crosstap shell script.

Full setup with patch series and examples that were used for
testing is available at [3].

[1] http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148387.html

[2] http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148392.html

[3] https://github.com/victorkamensky/systemtap-oe-sysroot-manifest

Victor Kamensky (5):
  image: add image-combined-dbg helper class
  Revert "systemtap: Cross compilation fix"
  systemtap: support --sysroot option in variety of situations in cross
    build
  systemtap: create translator packageconfig
  crosstap: replace script with new python based implementation

 meta/classes/image-combined-dbg.bbclass            |   9 +
 meta/classes/image.bbclass                         |   1 +
 ...001-Added-a-couple-of-small-sysroot-fixes.patch |  42 ++
 ...g-sysroot-path-to-module-name-in-case-of-.patch |  61 +++
 ...sure-sysroot-paths-don-t-end-with-a-slash.patch | 128 +++++
 ...root-when-looking-for-the-System.map-file.patch |  29 +
 ...e_relocate-needs-target-file-path-not-hos.patch |  39 ++
 ...ookup-with-sysroot-case-do-not-remove-sys.patch |  42 ++
 ...-short-release-r-option-handling-follow-u.patch |  40 ++
 ...sroot-fix-short-release-r-option-handling.patch |  53 ++
 ...dle-symbolic-links-with-absolute-name-rel.patch | 117 ++++
 .../systemtap/systemtap/system_map_location.patch  |  23 -
 meta/recipes-kernel/systemtap/systemtap_git.bb     |  15 +-
 meta/recipes-kernel/systemtap/systemtap_git.inc    |  10 +-
 scripts/crosstap                                   | 586 ++++++++++++++++-----
 15 files changed, 1031 insertions(+), 164 deletions(-)
 create mode 100644 meta/classes/image-combined-dbg.bbclass
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-Added-a-couple-of-small-sysroot-fixes.patch
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-Delay-adding-sysroot-path-to-module-name-in-case-of-.patch
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-Make-sure-sysroot-paths-don-t-end-with-a-slash.patch
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-Use-sysroot-when-looking-for-the-System.map-file.patch
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-_stp_umodule_relocate-needs-target-file-path-not-hos.patch
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-debuginfo-lookup-with-sysroot-case-do-not-remove-sys.patch
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-sysroot-fix-short-release-r-option-handling-follow-u.patch
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-sysroot-fix-short-release-r-option-handling.patch
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-sysroot-handle-symbolic-links-with-absolute-name-rel.patch
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/system_map_location.patch

-- 
2.7.4


