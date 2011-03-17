Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q0IL3-0003dp-HH
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Mar 2011 19:54:28 +0100
Received: by iyb26 with SMTP id 26so3199684iyb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2011 11:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=8uBMNSZu+evLtmx9sGgQaExwOy0pHBd1bOJ2sRmfRUk=;
	b=NJmFhSDdv+7DYOeVcVYaNW4hbXE11b6d9LEmwA3aRDbQ14BqoH14qCnPESYHlL9Y8c
	vkZz+3/Y4AvlyWf9LX5u51QAwefV9rxTR6795/vfMozfMNoJibe326o7uWRZjSGyLM3K
	Z814mcbgylZQ7Ab/c04Z4zoX/Ws+Q4BIXZSbM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=BNAVCFIbDeW5FjUwEPSnR56TCbn+3Yh7U5aQWiLGZwzzu7aCrZ9T1fwpU1rLdJFrNp
	+DF2Pqz9TY6FHcBDrswlz+pDZpzGvWZ1HdOh4svCqpucjFhPJeUXMqtlPO7GRqXUPE/+
	6/ulgkiz1eAjfsGFA71Qt1mXPjJfx79li8s8U=
Received: by 10.43.63.10 with SMTP id xc10mr128465icb.303.1300387960288;
	Thu, 17 Mar 2011 11:52:40 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id e7sm587162ibb.6.2011.03.17.11.52.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 Mar 2011 11:52:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Mar 2011 11:52:33 -0700
Message-Id: <cover.1300387701.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/5] Upgrade qemu to 0.14.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Mar 2011 18:54:28 -0000

Hi

This patchset upgrades qemu in oe-core to 0.14.0
The script fixes are done to cope for a bug in 0.14.0
as well as to get past a console spawning problem for non-nfs image
boots


Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: kraj/qemu-update
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/qemu-update

Thanks,
    Khem Raj <raj.khem@gmail.com>
---


Khem Raj (5):
  qemu: Upgrade 0.13.0 -> 0.14.0
  qemu.inc: Add sh4,sh4eb,mips64,mips64el targets
  lib/oe/patch.py: Cosmetic change to avoid bitbake warning
  scripts/poky-qemu-internal: Pass -m <mem_size> always on commandline
  scripts/poky-qemu-internal: Add rw to KERNCMDLINE for non nfs boots
    as well

 meta/lib/oe/patch.py                               |    2 +-
 .../qemu/qemu-0.13.0/fix-dirent.patch              |   12 -
 .../qemu/qemu-0.13.0/glflags.patch                 |   13 -
 .../qemu/qemu-0.13.0/no-strip.patch                |   26 --
 .../qemu/qemu-0.13.0/parallel_make.patch           |   34 --
 .../qemu/qemu-0.13.0/port92_fix.patch              |  196 -----------
 .../qemu/qemu-0.13.0/qemu-ppc-hack.patch           |  108 ------
 .../qemu/qemu-0.13.0/vmware-vga-fifo-rewind.patch  |  198 -----------
 .../qemu/qemu-0.13.0/wacom-tablet-fix.patch        |   65 ----
 .../qemu-0.13.0/workaround_bad_futex_headers.patch |   24 --
 ...t-and-use-GCC-atomic-builtins-for-locking.patch |   84 +++++
 .../enable-i386-linux-user.patch                   |   14 +-
 .../fallback-to-safe-mmap_min_addr.patch           |    8 +-
 .../fix-configure-checks.patch                     |   12 +-
 .../{qemu-0.13.0 => qemu-0.14.0}/fix-nogl.patch    |   55 +++-
 .../{qemu-0.13.0 => qemu-0.14.0}/init-info.patch   |    8 +-
 .../qemu/qemu-0.14.0/larger_default_ram_size.patch |   13 +
 .../linker-flags.patch                             |    8 +-
 .../qemu/qemu-0.14.0/no-strip.patch                |   13 +
 .../{qemu-0.13.0 => qemu-0.14.0}/powerpc_rom.bin   |  Bin 4096 -> 4096 bytes
 .../qemu-git-qemugl-host.patch                     |  346 ++++++++++----------
 .../qemu-vmware-vga-depth.patch                    |   52 ++--
 .../qemugl-allow-glxcontext-release.patch          |    6 +-
 .../spice-qxl-locking-fix-for-qemu-kvm.patch       |  150 +++++++++
 meta/recipes-devtools/qemu/qemu.inc                |    5 +-
 .../qemu/{qemu_0.13.0.bb => qemu_0.14.0.bb}        |   19 +-
 scripts/poky-qemu-internal                         |   42 ++--
 27 files changed, 563 insertions(+), 950 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/qemu-0.13.0/fix-dirent.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu-0.13.0/glflags.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu-0.13.0/no-strip.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu-0.13.0/parallel_make.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu-0.13.0/port92_fix.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu-0.13.0/qemu-ppc-hack.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu-0.13.0/vmware-vga-fifo-rewind.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu-0.13.0/wacom-tablet-fix.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu-0.13.0/workaround_bad_futex_headers.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.14.0/Detect-and-use-GCC-atomic-builtins-for-locking.patch
 rename meta/recipes-devtools/qemu/{qemu-0.13.0 => qemu-0.14.0}/enable-i386-linux-user.patch (73%)
 rename meta/recipes-devtools/qemu/{qemu-0.13.0 => qemu-0.14.0}/fallback-to-safe-mmap_min_addr.patch (87%)
 rename meta/recipes-devtools/qemu/{qemu-0.13.0 => qemu-0.14.0}/fix-configure-checks.patch (65%)
 rename meta/recipes-devtools/qemu/{qemu-0.13.0 => qemu-0.14.0}/fix-nogl.patch (61%)
 rename meta/recipes-devtools/qemu/{qemu-0.13.0 => qemu-0.14.0}/init-info.patch (74%)
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.14.0/larger_default_ram_size.patch
 rename meta/recipes-devtools/qemu/{qemu-0.13.0 => qemu-0.14.0}/linker-flags.patch (77%)
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.14.0/no-strip.patch
 rename meta/recipes-devtools/qemu/{qemu-0.13.0 => qemu-0.14.0}/powerpc_rom.bin (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.13.0 => qemu-0.14.0}/qemu-git-qemugl-host.patch (99%)
 rename meta/recipes-devtools/qemu/{qemu-0.13.0 => qemu-0.14.0}/qemu-vmware-vga-depth.patch (72%)
 rename meta/recipes-devtools/qemu/{qemu-0.13.0 => qemu-0.14.0}/qemugl-allow-glxcontext-release.patch (93%)
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.14.0/spice-qxl-locking-fix-for-qemu-kvm.patch
 rename meta/recipes-devtools/qemu/{qemu_0.13.0.bb => qemu_0.14.0.bb} (69%)

-- 
1.7.4.1



