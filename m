Return-Path: <jason.wessel@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 12FCC6B1E8
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 17:20:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8CHK2rn005424
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 12 Sep 2013 10:20:02 -0700 (PDT)
Received: from splat.wrs.com (128.224.60.28) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 12 Sep 2013 10:20:02 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Thu, 12 Sep 2013 12:19:42 -0500
Message-ID: <1379006387-20186-1-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: dvhart@linux.intel.com
Subject: [PATCH 0/5] Improved EFI boot support
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
X-List-Received-Date: Thu, 12 Sep 2013 17:20:02 -0000
Content-Type: text/plain

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
Jason Wessel (5):
      bootimage.bbclass: Move fat image creation into a function
      cdrtools-native: Update from 3.00 to 3.01a17
      grub-efi-native: Add support for EFI ISO images
      bootimage.bbclass: Improve EFI & PCBIOS+EFI ISO support
      grub-efi.bbclass: Add serial and graphics menu options

 meta/classes/bootimg.bbclass                       |  147 ++++++++++++--------
 meta/classes/grub-efi.bbclass                      |   41 ++++--
 meta/conf/machine/qemux86-64.conf                  |    2 +-
 meta/conf/machine/qemux86.conf                     |    2 +
 meta/recipes-bsp/grub/grub-efi-native_2.00.bb      |    8 +-
 ...s-native_3.00.bb => cdrtools-native_3.01a17.bb} |   13 +-
 6 files changed, 135 insertions(+), 78 deletions(-)
 rename meta/recipes-devtools/cdrtools/{cdrtools-native_3.00.bb => cdrtools-native_3.01a17.bb} (64%)

