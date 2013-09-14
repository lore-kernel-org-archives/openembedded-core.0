Return-Path: <jason.wessel@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5A0686C753
	for <Openembedded-core@lists.openembedded.org>;
	Sat, 14 Sep 2013 00:09:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8E0992k023785
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 13 Sep 2013 17:09:10 -0700 (PDT)
Received: from splat.wrs.com (128.224.60.28) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 13 Sep 2013 17:09:09 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Fri, 13 Sep 2013 19:08:56 -0500
Message-ID: <1379117343-29877-1-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: dvhart@linux.intel.com
Subject: [v2 PATCH 0/7] Improved EFI boot support
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
X-List-Received-Date: Sat, 14 Sep 2013 00:09:14 -0000
Content-Type: text/plain

V2
- Added reference to YOCTO #1913 for per Darren
- Remove PR number from cdrtools uprev
- Added Saul's change to cdrtools to get rid of STAGE_TEMP
- made the builtin grub cfg file copied from a SRC_URI
- upreved syslinux to 6.01
- Use the new isohybrid command from syslinux which can now
  generate EFI enabled ISO's which can boot directly when
  dd'ed to a USB or HDD device.
- Dropped any references to efi or pcbios in the qemu* configs
- Added the zisofs patch to the end of the series instead
  of depending on it, in case it is dropped later.
- git -format-patch -M20% is your friend for seeing the
  delta on recipe upgrades :-)

YAY, with the new version of syslinux it is now possible to
build a single live ISO image which can boot in legacy mode
or EFI on optical media or USB devices.

We still have to create 2 ISO's one for 32bit EFI systems and one for
64bit EFI systems but this is also true of all other Linux
distributions today as well.

Jason.

---

The goal of this patch set is to put the EFI ISO boot method on par
with the ISO PCBIOS boot method.  This also allows for the creation of
a single ISO image which can boot in "legacy boot" mode or EFI boot
mode.

In order to make this possible the cdrtools needed an update to the
very latest and this brings in an license change.  Given that change
it was not entirely clear to me if we needed to leave the older
package around.  I opted to remove the older package recipe since
there was no clean way to fail in the case you wanted to build EFI
boot media.

The bbnote that was previously in the bootimg.bbclass about EFI only
media being untested was a bit of an understatement, as the images
would not even build without errors due to the call to isohybrid.  I
removed any such warnings because that path has been fully vetted now.

Cheers,
Jason.


----------------------------------------------------------------

The following changes since commit b26157a8b575aa7b5c96ffe782fc23ec0920311c:

  libnewt-python: Don't write a whiptail package (2013-09-12 08:23:35 +0100)

are available in the git repository at:

  . master

for you to fetch changes up to a0d1b567277fdf370cc121720c0c4f30839da01b:

  bootimage.bbclass, zisofs-tools-native: add ability to compress ISO images (2013-09-13 19:05:37 -0500)

----------------------------------------------------------------
Jason Wessel (7):
      bootimage.bbclass: Move fat image creation into a function
      cdrtools-native: Update from 3.00 to 3.01a17
      grub-efi-native: Add support for EFI ISO images
      syslinux.bbclass,syslinux: Update to syslinux 6.01
      bootimage.bbclass,grub-efi.bbclass: Improve EFI & PCBIOS+EFI ISO support
      grub-efi.bbclass: Add serial and graphics menu options
      bootimage.bbclass, zisofs-tools-native: add ability to compress ISO images

 meta/classes/bootimg.bbclass                       |  165 ++++++++++++--------
 meta/classes/grub-efi.bbclass                      |   49 ++++--
 meta/classes/syslinux.bbclass                      |    1 +
 meta/recipes-bsp/grub/files/cfg                    |    2 +
 meta/recipes-bsp/grub/grub-efi-native_2.00.bb      |    7 +-
 .../cdrtools/cdrtools-native_3.00.bb               |   30 ----
 .../cdrtools/cdrtools-native_3.01a17.bb            |   24 +++
 .../{syslinux_4.07.bb => syslinux_6.01.bb}         |   26 +--
 .../zisofs-tools/zisofs-tools-native_1.0.8.bb      |   19 +++
 9 files changed, 201 insertions(+), 122 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/cfg
 delete mode 100644 meta/recipes-devtools/cdrtools/cdrtools-native_3.00.bb
 create mode 100644 meta/recipes-devtools/cdrtools/cdrtools-native_3.01a17.bb
 rename meta/recipes-devtools/syslinux/{syslinux_4.07.bb => syslinux_6.01.bb} (63%)
 create mode 100644 meta/recipes-devtools/zisofs-tools/zisofs-tools-native_1.0.8.bb

