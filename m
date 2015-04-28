Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8B5DA72491
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 06:27:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3S6Rx9s025656
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 23:27:59 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Mon, 27 Apr 2015 23:27:58 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Apr 2015 14:27:55 +0800
Message-ID: <cover.1430201974.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v2 0/3] license.bbclass/linux-firmware: add an approach for non-generic license
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
X-List-Received-Date: Tue, 28 Apr 2015 06:28:00 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

v2 comments:
- Rename NO_GENERIC_LIC to NO_GENERIC_LICENSE.
- Detect and warn when the user is attempting to use this mechanism for a common license.

--
The following changes since commit 87de892d682d15ba2cbbee6bfd63a4644e0f517a:

  ptest: add recommends to ptest-runner (2015-04-27 15:34:59 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib jhuang0/y_firmware_license_150428_0
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/y_firmware_license_150428_0

Jackie Huang (3):
  license.bbclass: allow copying license not in common licenses
  Revert "common-licenses: Add common license files for linux-firmware"
  linux-firmware: add NO_GENERIC_LICENSE for all licenses

 meta/classes/license.bbclass                       |  17 +-
 meta/files/common-licenses/Firmware-Abilis         |  22 -
 meta/files/common-licenses/Firmware-Marvell        |  18 -
 meta/files/common-licenses/Firmware-OLPC           |  33 --
 meta/files/common-licenses/Firmware-agere          |  77 ----
 meta/files/common-licenses/Firmware-amd-ucode      |  64 ---
 .../common-licenses/Firmware-atheros_firmware      |  38 --
 .../common-licenses/Firmware-broadcom_bcm43xx      |  65 ---
 meta/files/common-licenses/Firmware-ca0132         |  47 ---
 .../common-licenses/Firmware-chelsio_firmware      |  27 --
 meta/files/common-licenses/Firmware-cw1200         |  35 --
 meta/files/common-licenses/Firmware-dib0700        |  22 -
 meta/files/common-licenses/Firmware-ene_firmware   |  14 -
 meta/files/common-licenses/Firmware-fw_sst_0f28    |  40 --
 meta/files/common-licenses/Firmware-go7007         | 457 ---------------------
 meta/files/common-licenses/Firmware-i2400m         |  43 --
 meta/files/common-licenses/Firmware-ibt_firmware   |  39 --
 meta/files/common-licenses/Firmware-it913x         |  17 -
 .../common-licenses/Firmware-iwlwifi_firmware      |  39 --
 meta/files/common-licenses/Firmware-mwl8335        |  52 ---
 .../common-licenses/Firmware-myri10ge_firmware     |  28 --
 meta/files/common-licenses/Firmware-phanfw         |  32 --
 .../common-licenses/Firmware-qat_dh895xcc_firmware |  39 --
 meta/files/common-licenses/Firmware-qla2xxx        |  31 --
 meta/files/common-licenses/Firmware-r8a779x_usb3   |  26 --
 meta/files/common-licenses/Firmware-radeon         |  51 ---
 .../files/common-licenses/Firmware-ralink-firmware |  39 --
 .../Firmware-ralink_a_mediatek_company_firmware    |  39 --
 .../common-licenses/Firmware-rtlwifi_firmware      |  39 --
 .../common-licenses/Firmware-tda7706-firmware      |  48 ---
 .../files/common-licenses/Firmware-ti-connectivity |  46 ---
 .../common-licenses/Firmware-ueagle-atm4-firmware  |  39 --
 meta/files/common-licenses/Firmware-via_vt6656     |  25 --
 meta/files/common-licenses/Firmware-wl1251         |  59 ---
 meta/files/common-licenses/Firmware-xc4000         |  23 --
 meta/files/common-licenses/Firmware-xc5000         |  23 --
 meta/files/common-licenses/Firmware-xc5000c        |  23 --
 .../linux-firmware/linux-firmware_git.bb           |  39 ++
 38 files changed, 55 insertions(+), 1760 deletions(-)
 delete mode 100644 meta/files/common-licenses/Firmware-Abilis
 delete mode 100644 meta/files/common-licenses/Firmware-Marvell
 delete mode 100644 meta/files/common-licenses/Firmware-OLPC
 delete mode 100644 meta/files/common-licenses/Firmware-agere
 delete mode 100644 meta/files/common-licenses/Firmware-amd-ucode
 delete mode 100644 meta/files/common-licenses/Firmware-atheros_firmware
 delete mode 100644 meta/files/common-licenses/Firmware-broadcom_bcm43xx
 delete mode 100644 meta/files/common-licenses/Firmware-ca0132
 delete mode 100644 meta/files/common-licenses/Firmware-chelsio_firmware
 delete mode 100644 meta/files/common-licenses/Firmware-cw1200
 delete mode 100644 meta/files/common-licenses/Firmware-dib0700
 delete mode 100644 meta/files/common-licenses/Firmware-ene_firmware
 delete mode 100644 meta/files/common-licenses/Firmware-fw_sst_0f28
 delete mode 100644 meta/files/common-licenses/Firmware-go7007
 delete mode 100644 meta/files/common-licenses/Firmware-i2400m
 delete mode 100644 meta/files/common-licenses/Firmware-ibt_firmware
 delete mode 100644 meta/files/common-licenses/Firmware-it913x
 delete mode 100644 meta/files/common-licenses/Firmware-iwlwifi_firmware
 delete mode 100644 meta/files/common-licenses/Firmware-mwl8335
 delete mode 100644 meta/files/common-licenses/Firmware-myri10ge_firmware
 delete mode 100644 meta/files/common-licenses/Firmware-phanfw
 delete mode 100644 meta/files/common-licenses/Firmware-qat_dh895xcc_firmware
 delete mode 100644 meta/files/common-licenses/Firmware-qla2xxx
 delete mode 100644 meta/files/common-licenses/Firmware-r8a779x_usb3
 delete mode 100644 meta/files/common-licenses/Firmware-radeon
 delete mode 100644 meta/files/common-licenses/Firmware-ralink-firmware
 delete mode 100644 meta/files/common-licenses/Firmware-ralink_a_mediatek_company_firmware
 delete mode 100644 meta/files/common-licenses/Firmware-rtlwifi_firmware
 delete mode 100644 meta/files/common-licenses/Firmware-tda7706-firmware
 delete mode 100644 meta/files/common-licenses/Firmware-ti-connectivity
 delete mode 100644 meta/files/common-licenses/Firmware-ueagle-atm4-firmware
 delete mode 100644 meta/files/common-licenses/Firmware-via_vt6656
 delete mode 100644 meta/files/common-licenses/Firmware-wl1251
 delete mode 100644 meta/files/common-licenses/Firmware-xc4000
 delete mode 100644 meta/files/common-licenses/Firmware-xc5000
 delete mode 100644 meta/files/common-licenses/Firmware-xc5000c

-- 
1.9.1


