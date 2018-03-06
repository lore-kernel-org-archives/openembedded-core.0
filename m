Return-Path: <kamensky@cisco.com>
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
	by mail.openembedded.org (Postfix) with ESMTP id 8810378A0B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Mar 2018 17:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=6795; q=dns/txt; s=iport;
	t=1520358651; x=1521568251;
	h=from:to:cc:subject:date:message-id;
	bh=w09SsCdQE0OX7XO3CF5dcty/30gxkqFwdEmHk9pwdcg=;
	b=HXbO8Ylj/aRHmy8N+qyH5TBbFc+O6DDKpsoQnEg5bOBzAA+rt/Lt+9ki
	5sA6h1yWg9gnSKJwDOgf7yVJljmZVfqRr+DG6UZs5uozXaqytJl3BzjUY
	y7HUM8Fgwk5lmtJa9v1K2pcfReXkmiuNKU1u3Vh/kVdZjHUm460DL8OhE U=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0BJAgBY1J5a/5xdJa1dGQEBAQEBAQEBA?=
	=?us-ascii?q?QEBAQcBAQEBAYNQZnAom3GDGJZJCiWFC4MFITgUAQIBAQEBAQECayeGGAuGbBC?=
	=?us-ascii?q?rL4Ryg3SCJoUxgi6GNINkAgGHXQSIPIU/AXWLdgmFcWOKKwKCM4xDiX2HLAIRG?=
	=?us-ascii?q?QGBLjUhgVJNIxU6gkMJgigcFoIGHzeMJQEBAQ?=
X-IronPort-AV: E=Sophos;i="5.47,432,1515456000"; d="scan'208";a="362500292"
Received: from rcdn-core-5.cisco.com ([173.37.93.156])
	by rcdn-iport-7.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Mar 2018 17:50:50 +0000
Received: from kamensky-w541.cisco.com ([10.24.22.184]) (authenticated bits=0)
	by rcdn-core-5.cisco.com (8.14.5/8.14.5) with ESMTP id w26HofYl007528
	(version=TLSv1/SSLv3 cipher=AES128-SHA256 bits=128 verify=NO);
	Tue, 6 Mar 2018 17:50:49 GMT
From: Victor Kamensky <kamensky@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Mar 2018 09:50:36 -0800
Message-Id: <1520358641-7062-1-git-send-email-kamensky@cisco.com>
X-Mailer: git-send-email 2.7.4
X-Authenticated-User: kamensky@cisco.com
Cc: Alexander Kanavin <alexander.kanavin@intel.com>
Subject: [RFC PATCH 0/5] systemtap adding sysroot, cross compiling of user land related scripts
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
X-List-Received-Date: Tue, 06 Mar 2018 17:50:49 -0000

Hi Guys,

I am a fan of SystemTap and big fan of OE. Systemtap and OE use case I have
on my mind is the following:

1) small embedded target image built, because of resource constraint such
target could not run full blown systemtap on, it would not have resources
to have debug symbols, toolchain, kernel sources, etc installed on target,
memory size available to to SystemTap script build, etc

2) on host target image is build with debug symbols available somewhere
on the host

3) systemtap operates in cross compilation mode, builds targetscript.ko module,
which could be copied to target device

4) on target tiny systemtap runtime, like staprun, stapio, utilities are
present and they are used to activate systemtap targetscript.ko and observe
SystemTap in action.

In fact OE already has scripts/crosstap script that provides similar to above
experience. But the scripts one can have with crosstap can deal only with
kernel code. If one would like to write SystemTap script that involves
user land process probes crosstap script will not work.

In part the problem was that in SystemTap itself --sysroot options was
effectively broken or never worked. So it was not possible to build user-land
related script in cross compiled mode. I worked on SystemTap fixing --sysroot 
option support and I posted these fixes on systemtap mailing list [1].

Now with --sysroot option support fixed in SystemTap it comes to the
question how it could be integrated into OE related engineers work flow. And
here I need team's feedback. These patch series implements proposal for such
improved SystemTap OE integration, but some parts can cause controversy.

Here is patches overview, with indication of my concerns and ask for
feedback:

  Revert "systemtap: Cross compilation fix"

      Remove previous OE specific patch. It superseded by --sysroot support
      patch series


  systemtap: support --sysroot option in variety of situations in cross
    build

      effectively [1] integrated with OE, these patches will be discussed
      with SystemTap guys directly.


  image: add IMAGE_GEN_COMBINED_DEBUGFS build option

      this one may cause some controversy. For SystemTap to build user-land
      related script, it needs target sysroot tree overlayed with debug
      symbols. OE already has IMAGE_GEN_DEBUGFS option implemented but
      it produces split target and debug symbols tarballs that have to be
      recombined. I claim step of recombination is a drug on developer
      work flow. IMAGE_GEN_COMBINED_DEBUGFS is similar to IMAGE_GEN_DEBUGFS,
      but resulting rootfs-dbg would contain both target and symbols, so
      it could be used right away. Also I feel that implementation of
      IMAGE_GEN_COMBINED_DEBUGFS option might not be very elegant, especially
      with prelink related issue that changes target binaries


  systemtap: introduce utils variant of systemtap package build

      systemtap-utils recipe is special systemtap build that would compile
      only utilities and have minimal dependencies possible. I considered to
      split out those utilities on packaging step of systemtap but with
      dependencies description, it got very messy, so I decided to go
      with separate conflicting with systemtap recipe


  crosstap2: wrapper to build systemtap script on host against given
    target

      Wrapper script similar to crosstap that take SystemTap script and
      image name, retrieve rest of required information from bitbake -e
      command and construct stap invocation with all proper arguments
      passed needed for cross compilation. Script is implemented in python
      it has more advanced logic then existing crosstap tool. But one may
      ask why I did not improved existing crosstap script - I felt that
      new requirements is too much to be implemented in shell script and
      in backward compatible mode without breaking historic interface to
      crosstap.


If someone interested in full patch series my OE tree with these fixes
is here [2]. It was tested on variety of qemu related machines. Steps that
shows how whole work flow OE and SystemTap works are here [3]. Examples of
crosstap2 invocations are here [4].

[1] https://sourceware.org/ml/systemtap/2018-q1/msg00069.html

[2] https://github.com/victorkamensky/openembedded-core

[3] https://github.com/victorkamensky/systemtap-oe-sysroot-manifest

[4] https://github.com/victorkamensky/systemtap-oe-sysroot-manifest/blob/master/EXAMPLES

Victor Kamensky (5):
  Revert "systemtap: Cross compilation fix"
  systemtap: support --sysroot option in variety of situations in cross
    build
  image: add IMAGE_GEN_COMBINED_DEBUGFS build option
  systemtap: introduce utils variant of systemtap package build
  crosstap2: wrapper to build systemtap script on host against given
    target

 meta/classes/image-prelink.bbclass                 |  13 +
 meta/classes/image.bbclass                         |  11 +-
 meta/lib/oe/rootfs.py                              |  59 +--
 .../systemtap/systemtap-utils_git.bb               |  31 ++
 ...-short-release-r-option-handling-in-case-.patch |  61 +++
 ...-short-release-r-option-handling-in-case-.patch |  68 ++++
 ...uginfo-lookup-with-sysroot-case-do-not-re.patch |  97 +++++
 ...ay-adding-sysroot-path-to-module-name-in-.patch | 124 ++++++
 ...dle-symbolic-links-with-absolute-name-rel.patch | 159 ++++++++
 ...p_umodule_relocate-needs-receive-target-f.patch |  58 +++
 .../systemtap/systemtap/system_map_location.patch  |  23 --
 meta/recipes-kernel/systemtap/systemtap_git.inc    |   7 +-
 scripts/crosstap2                                  | 422 +++++++++++++++++++++
 13 files changed, 1081 insertions(+), 52 deletions(-)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap-utils_git.bb
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-sysroot-fix-short-release-r-option-handling-in-case-.patch
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0002-sysroot-fix-short-release-r-option-handling-in-case-.patch
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0003-sysroot-debuginfo-lookup-with-sysroot-case-do-not-re.patch
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0004-sysroot-delay-adding-sysroot-path-to-module-name-in-.patch
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0005-sysroot-handle-symbolic-links-with-absolute-name-rel.patch
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0006-sysroot-_stp_umodule_relocate-needs-receive-target-f.patch
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/system_map_location.patch
 create mode 100755 scripts/crosstap2

-- 
2.7.4


