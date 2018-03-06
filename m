Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5DC8D78A9E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Mar 2018 18:11:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w26IBI59012024
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 6 Mar 2018 10:11:18 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 6 Mar 2018 10:10:45 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 6 Mar 2018 13:11:08 -0500
Message-ID: <cover.1520359364.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/9] kernel-yocto: consolidated pull request
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
X-List-Received-Date: Tue, 06 Mar 2018 18:11:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi all,

This is the latest consolidated kernel pull request. It contains -stable updates,
the kernel-devsrc re-work, and a libc-headers version bump.

The -stable updates are routine, and are required to pick up the latest CVE and
bug fixes from korg.

The kernel-devsrc re-structure has already gone through two revisions, and this
v3 of that patch addresses mips + powerpc + ARM issues that were found during
the on target kernel module compilation testing.

There's one minor fix for kernel class handling of crtsaveres.o, and that same fix
was required for kernel-devsrc.

And finally, there is also have a libc-headers version bump to deal with a
regression introduced in the 4.15 kernel uapi headers. This was picked up due
to the breakage of several packages, and has since been nominated for -stable
inclusion. Patching libc-headers is a last resort, so instead I've tracked the
-stable version to pick up the change. All the details are in the patches
commit log:

--->--->--->--->--->--->--->
   Subject: [PATCH 2/9] linux-libc-headers: update to 4.15.7

   While we don't normally follow all the -stable updates for libc-headers, there
   was one userspace header that was broken in the 4.15 cycle, and it has now
   been fixed in -stable.

   The offending header breaks the build for several packages, so we update to
   pick up this change:

      Author: Hauke Mehrtens <hauke@hauke-m.de>
      Date:   Mon Feb 12 23:59:51 2018 +0100

          uapi/if_ether.h: move __UAPI_DEF_ETHHDR libc define

          commit da360299b6734135a5f66d7db458dcc7801c826a upstream.

          This fixes a compile problem of some user space applications by not
          including linux/libc-compat.h in uapi/if_ether.h.

          linux/libc-compat.h checks which "features" the header files, included
          from the libc, provide to make the Linux kernel uapi header files only
             provide no conflicting structures and enums. If a user application mixes
          kernel headers and libc headers it could happen that linux/libc-compat.h
          gets included too early where not all other libc headers are included
          yet. Then the linux/libc-compat.h would not prevent all the
          redefinitions and we run into compile problems.
          This patch removes the include of linux/libc-compat.h from
          uapi/if_ether.h to fix the recently introduced case, but not all as this
          is more or less impossible.

          It is no problem to do the check directly in the if_ether.h file and not
          in libc-compat.h as this does not need any fancy glibc header detection
          as glibc never provided struct ethhdr and should define
          __UAPI_DEF_ETHHDR by them self when they will provide this.

          The following test program did not compile correctly any more:

          #include <linux/if_ether.h>
          #include <netinet/in.h>
          #include <linux/in.h>

          int main(void)
          {
              return 0;
          }

          Fixes: 6926e041a892 ("uapi/if_ether.h: prevent redefinition of struct ethhdr")
          Reported-by: Guillaume Nault <g.nault@alphalink.fr>
          Cc: <stable@vger.kernel.org> # 4.15
          Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
          Signed-off-by: David S. Miller <davem@davemloft.net>
          Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

   We also add a new muslc patch to adjust the ethhdr change in the uapi. As is
   suggested in the kernel commit, we can protect musl directly in if_ether itself.

   Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
--->--->--->--->--->--->--->

Cheers,

Bruce

The following changes since commit e5f258cecef6c51a4d7ebeedbaa29d2126e566e3:

  util-linux: add taskset to alternatives list (2018-03-06 06:43:11 -0800)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (9):
  kernel-devsrc: restructure for out of tree (and on target) module
    builds
  linux-libc-headers: update to 4.15.7
  linux-yocto/4.15: update to v4.15.7
  linux-yocto/4.14: update to v4.14.24
  linux-yocto/4.12: fix aufs compile warning
  linux-yocto/4.12: memleak and build warning fixes
  linux-yocto: aufs and systemtap
  linux-yocto/4.12: warning: drm/i915/cfl: Coffee Lake works on Kaby
    Lake PCH
  kernel: make copying of crtsavres.o conditional

 meta/classes/kernel.bbclass                        |   6 +-
 ...move-muslc-ethhdr-protection-to-uapi-file.patch |  30 ++++
 ...eaders_4.15.bb => linux-libc-headers_4.15.7.bb} |   6 +-
 meta/recipes-kernel/linux/kernel-devsrc.bb         | 192 ++++++++++++++++-----
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   |   4 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb   |   6 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb   |   6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb |   4 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb |   6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb |   6 +-
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      |  18 +-
 meta/recipes-kernel/linux/linux-yocto_4.14.bb      |  20 +--
 meta/recipes-kernel/linux/linux-yocto_4.15.bb      |  20 +--
 13 files changed, 235 insertions(+), 89 deletions(-)
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-if_ether-move-muslc-ethhdr-protection-to-uapi-file.patch
 rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_4.15.bb => linux-libc-headers_4.15.7.bb} (62%)

-- 
2.5.0


