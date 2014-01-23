Return-Path: <jason.wessel@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6BF416B05F
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 14:35:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s0NEZsoQ027199
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 06:35:55 -0800 (PST)
Received: from splat.wrs.com (128.224.60.28) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Thu, 23 Jan 2014 06:35:54 -0800
From: Jason Wessel <jason.wessel@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Thu, 23 Jan 2014 08:32:40 -0600
Message-ID: <1390487566-13569-1-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v2 0/6] Replace unfs-server with unfs3
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
X-List-Received-Date: Thu, 23 Jan 2014 14:35:55 -0000
Content-Type: text/plain

There was a bit of a lag after Saul's review comments because in order
to upstream any of the patches everything had to be rebased to the
upstream version of unfs3.  This also required code changes and
re-testing.

Changes in v2

* Use recipe upstream SVN
  - Dropped prior configure hacks because autoconf bugs were
    fixed in the upstream version of unfs3
* Reworked all patches against upstream SVN
  - Dropped 64 bit patch because the upstream version
    superseded it
* Contributed all patches to the upstream maintainer of unfs3
  - All unfs3 patches marked as upstream pending
* This series was rebased to master latest of oe-core

Cheers,
Jason

---- Original mail ----

[YOCTO #5639]

The goal of this patchset it to upgrade the user mode NFS server from
NFSv2 to NFSv3.  To do so requires the use of a new server.  The key
reason this update needs to occurs is that the old server uses the
inode from the file system for the NFS hash value.  The former is now
64 bits on modern kernels while the later is only 32 bits due to the
protocol and implementation with in the the unfs-server.  This causes
all sorts of problem with directory loops and duplicate file system
references that had been reported in the bugzilla.

That should also make it possible to extract a rootfs and run it as a
non-root user.

Example:

runqemu-extract-sdk tmp-eglibc/deploy/images/qemux86-64/core-image-minimal-qemux86-64.tar.bz2 rootfs

runqemu qemux86-64 `pwd`/rootfs nographic slirp


Cheers,
Jason.

The following changes since commit 24d5b449e5f4d91119f0d8e13c457618811aadfc:

  libtool-cross/native: Force usage of bash due to sstate inconsistencies (2014-01-23 12:14:34 +0000)

are available in the git repository at:

  . 

for you to fetch changes up to efcf5c967f6f8de16d73267943b3746caa431972:

  runqemu,runqemu-internal: Allow slirp for NFS and KVM use (2014-01-23 07:41:47 -0600)

----------------------------------------------------------------
Jason Wessel (5):
      unfs3: Add a NFSv3 user mode server for use with runqemu
      unfs3,unfs-server: Replace all instances of unfs-server with unfs3
      unfs-server: Remove unfs-server recipe and patches
      runqemu-export-rootfs: update for unfs3
      runqemu,runqemu-internal: Allow slirp for NFS and KVM use

Saul Wold (1):
      runqemu: Use the newer unfs3 for serving user space nfs

 meta/conf/distro/include/seperatebuilddir.inc      |    4 +-
 meta/files/common-licenses/unfs3                   |   24 +
 meta/recipes-core/meta/meta-ide-support.bb         |    2 +-
 .../nativesdk-packagegroup-sdk-host.bb             |    2 +-
 .../adt-installer/scripts/adt_installer_internal   |    2 +-
 .../001-2.2b47-2.2b51.patch                        | 2349 --------------------
 .../unfs-server-2.1+2.2beta47/002-destdir.patch    |   73 -
 .../unfs-server-2.1+2.2beta47/003-manpages.patch   |   33 -
 .../unfs-server-2.1+2.2beta47/004-strsignal.patch  |   53 -
 .../unfs-server-2.1+2.2beta47/005-sys-time.patch   |   34 -
 .../unfs-server-2.1+2.2beta47/006-reiserfs.patch   | 1277 -----------
 .../unfs-server-2.1+2.2beta47/007-map.patch        |   83 -
 .../unfs-server-2.1+2.2beta47/008-configure.patch  |   18 -
 .../unfs-server-2.1+2.2beta47/009-multirw.patch    |   20 -
 .../unfs-server-2.1+2.2beta47/010-realpath.patch   |   35 -
 .../011-fno-strict-aliasing.patch                  |   18 -
 .../unfs-server-2.1+2.2beta47/012-nostrip.patch    |   18 -
 .../unfs-server-2.1+2.2beta47/013-mntpathlen.patch |   37 -
 .../014-uninitialized.patch                        |   17 -
 .../unfs-server-2.1+2.2beta47/015-setattr.patch    |   31 -
 .../016-makefile.in.patch                          |   19 -
 .../017-wrs-dynamic-rpc.patch                      |  263 ---
 .../018-remove-tcp-wrappers.patch                  |   25 -
 .../019-pid-before-fork.patch                      |  130 --
 .../020-undefined-chmod-fix.patch                  |   23 -
 .../unfs-server-2.1+2.2beta47/021-nolibwrap.patch  |   25 -
 .../022-add-close-on-exec-descriptors.patch        |   66 -
 .../023-no-rpc-register.patch                      |   34 -
 .../unfs-server/unfs-server_2.1+2.2beta47.bb       |   78 -
 .../unfs3/unfs3/alternate_rpc_ports.patch          |  158 ++
 .../unfs3/unfs3/fix_compile_warning.patch          |   25 +
 .../fix_pid_race_parent_writes_child_pid.patch     |   61 +
 .../unfs3/unfs3/fix_warnings.patch                 |   53 +
 .../unfs3/unfs3/relative_max_socket_path_len.patch |   74 +
 .../unfs3/unfs3/rename_fh_cache.patch              |   64 +
 .../unfs3/unfs3/tcp_no_delay.patch                 |   56 +
 .../unfs3/unfs3/unfs3_parallel_build.patch         |   36 +
 meta/recipes-devtools/unfs3/unfs3_0.9.22.r490.bb   |   44 +
 .../packagegroups/packagegroup-toolset-native.bb   |    2 +-
 meta/site/ix86-common                              |    2 +-
 meta/site/x86_64-linux                             |    2 +-
 scripts/runqemu                                    |   10 +-
 scripts/runqemu-export-rootfs                      |   57 +-
 scripts/runqemu-internal                           |   21 +-
 44 files changed, 628 insertions(+), 4830 deletions(-)
 create mode 100644 meta/files/common-licenses/unfs3
 delete mode 100644 meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/001-2.2b47-2.2b51.patch
 delete mode 100644 meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/002-destdir.patch
 delete mode 100644 meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/003-manpages.patch
 delete mode 100644 meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/004-strsignal.patch
 delete mode 100644 meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/005-sys-time.patch
 delete mode 100644 meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/006-reiserfs.patch
 delete mode 100644 meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/007-map.patch
 delete mode 100644 meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/008-configure.patch
 delete mode 100644 meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/009-multirw.patch
 delete mode 100644 meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/010-realpath.patch
 delete mode 100644 meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/011-fno-strict-aliasing.patch
 delete mode 100644 meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/012-nostrip.patch
 delete mode 100644 meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/013-mntpathlen.patch
 delete mode 100644 meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/014-uninitialized.patch
 delete mode 100644 meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/015-setattr.patch
 delete mode 100644 meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/016-makefile.in.patch
 delete mode 100644 meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/017-wrs-dynamic-rpc.patch
 delete mode 100644 meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/018-remove-tcp-wrappers.patch
 delete mode 100644 meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/019-pid-before-fork.patch
 delete mode 100644 meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/020-undefined-chmod-fix.patch
 delete mode 100644 meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/021-nolibwrap.patch
 delete mode 100644 meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/022-add-close-on-exec-descriptors.patch
 delete mode 100644 meta/recipes-devtools/unfs-server/unfs-server-2.1+2.2beta47/023-no-rpc-register.patch
 delete mode 100644 meta/recipes-devtools/unfs-server/unfs-server_2.1+2.2beta47.bb
 create mode 100644 meta/recipes-devtools/unfs3/unfs3/alternate_rpc_ports.patch
 create mode 100644 meta/recipes-devtools/unfs3/unfs3/fix_compile_warning.patch
 create mode 100644 meta/recipes-devtools/unfs3/unfs3/fix_pid_race_parent_writes_child_pid.patch
 create mode 100644 meta/recipes-devtools/unfs3/unfs3/fix_warnings.patch
 create mode 100644 meta/recipes-devtools/unfs3/unfs3/relative_max_socket_path_len.patch
 create mode 100644 meta/recipes-devtools/unfs3/unfs3/rename_fh_cache.patch
 create mode 100644 meta/recipes-devtools/unfs3/unfs3/tcp_no_delay.patch
 create mode 100644 meta/recipes-devtools/unfs3/unfs3/unfs3_parallel_build.patch
 create mode 100644 meta/recipes-devtools/unfs3/unfs3_0.9.22.r490.bb

