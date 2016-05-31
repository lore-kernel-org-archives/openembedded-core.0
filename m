Return-Path: <ian.ray@ge.com>
X-Greylist: delayed 3107 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 31 May 2016 06:13:03 UTC
Received: from mx0b-00176a03.pphosted.com (mx0b-00176a03.pphosted.com
	[67.231.157.48])
	by mail.openembedded.org (Postfix) with ESMTP id AA2C776809
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2016 06:13:03 +0000 (UTC)
Received: from pps.filterd (m0048300.ppops.net [127.0.0.1])
	by m0048300.ppops.net-00176a03. (8.16.0.11/8.16.0.11) with SMTP id
	u4V5ImAZ048340 for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2016 01:21:14 -0400
Date: Tue, 31 May 2016 08:21:09 +0300
From: Ian Ray <ian.ray@ge.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20160531052108.GA88947@builder0.em.health.ge.com>
References: <cover.1452235739.git.ian.ray@ge.com>
	<31c742546bd534942c5d445256e0af1aaa64b668.1452235739.git.ian.ray@ge.com>
MIME-Version: 1.0
In-Reply-To: <31c742546bd534942c5d445256e0af1aaa64b668.1452235739.git.ian.ray@ge.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-05-31_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	suspectscore=1
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
	definitions=main-1605310061
Subject: Re: [PATCH v2 1/1] linux-firmware: remove hard-coded paths
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
X-List-Received-Date: Tue, 31 May 2016 06:13:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 08, 2016 at 09:28:51AM +0200, Ian Ray wrote:
> The recipe uses hard-coded paths (specifically /lib) in do_install
> and in FILES, however on a merged /usr system this directory might
> not exist.  Prefer nonarch_base_libdir.

There were no comments on this?

There was quite a lot of discussion in the v1 patch thread, but
this patch was revised based on Phil's comments[*] and as such
it seems like a good first step.

[*] http://lists.openembedded.org/pipermail/openembedded-core/2016-January/114861.html

Thanks,
Ian

> Signed-off-by: Ian Ray <ian.ray@ge.com>
> ---
>  .../linux-firmware/linux-firmware_git.bb           | 134 ++++++++++-----------
>  1 file changed, 67 insertions(+), 67 deletions(-)
> 
> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> index 0878ab1..a61d894 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> @@ -141,24 +141,24 @@ do_compile() {
>  }
>  
>  do_install() {
> -	install -d  ${D}/lib/firmware/
> -	cp -r * ${D}/lib/firmware/
> +	install -d  ${D}${nonarch_base_libdir}/firmware/
> +	cp -r * ${D}${nonarch_base_libdir}/firmware/
>  
>  	# Avoid Makefile to be deployed
> -	rm ${D}/lib/firmware/Makefile
> +	rm ${D}${nonarch_base_libdir}/firmware/Makefile
>  
>  	# Remove unbuild firmware which needs cmake and bash
> -	rm ${D}/lib/firmware/carl9170fw -rf
> +	rm ${D}${nonarch_base_libdir}/firmware/carl9170fw -rf
>  
>  	# Remove pointless bash script
> -	rm ${D}/lib/firmware/configure
> +	rm ${D}${nonarch_base_libdir}/firmware/configure
>  
>  	# Libertas sd8686
> -	ln -sf libertas/sd8686_v9.bin ${D}/lib/firmware/sd8686.bin
> -	ln -sf libertas/sd8686_v9_helper.bin ${D}/lib/firmware/sd8686_helper.bin
> +	ln -sf libertas/sd8686_v9.bin ${D}${nonarch_base_libdir}/firmware/sd8686.bin
> +	ln -sf libertas/sd8686_v9_helper.bin ${D}${nonarch_base_libdir}/firmware/sd8686_helper.bin
>  
>  	# fixup wl12xx location, after 2.6.37 the kernel searches a different location for it
> -	( cd ${D}/lib/firmware ; ln -sf ti-connectivity/* . )
> +	( cd ${D}${nonarch_base_libdir}/firmware ; ln -sf ti-connectivity/* . )
>  }
>  
>  
> @@ -188,21 +188,21 @@ LICENSE_${PN}-ar3k = "Firmware-atheros_firmware"
>  LICENSE_${PN}-ath6k = "Firmware-atheros_firmware"
>  LICENSE_${PN}-ath9k = "Firmware-atheros_firmware"
>  
> -FILES_${PN}-atheros-license = "/lib/firmware/LICENCE.atheros_firmware"
> +FILES_${PN}-atheros-license = "${nonarch_base_libdir}/firmware/LICENCE.atheros_firmware"
>  FILES_${PN}-ar9170 = " \
> -  /lib/firmware/ar9170*.fw \
> +  ${nonarch_base_libdir}/firmware/ar9170*.fw \
>  "
>  FILES_${PN}-ar3k = " \
> -  /lib/firmware/ar3k \
> +  ${nonarch_base_libdir}/firmware/ar3k \
>  "
>  FILES_${PN}-ath6k = " \
> -  /lib/firmware/ath6k \
> +  ${nonarch_base_libdir}/firmware/ath6k \
>  "
>  FILES_${PN}-ath9k = " \
> -  /lib/firmware/ar9271.fw \
> -  /lib/firmware/ar7010*.fw \
> -  /lib/firmware/htc_9271.fw \
> -  /lib/firmware/htc_7010.fw \
> +  ${nonarch_base_libdir}/firmware/ar9271.fw \
> +  ${nonarch_base_libdir}/firmware/ar7010*.fw \
> +  ${nonarch_base_libdir}/firmware/htc_9271.fw \
> +  ${nonarch_base_libdir}/firmware/htc_7010.fw \
>  "
>  
>  RDEPENDS_${PN}-ar9170 += "${PN}-atheros-license"
> @@ -213,9 +213,9 @@ RDEPENDS_${PN}-ath9k += "${PN}-atheros-license"
>  # For ralink
>  LICENSE_${PN}-ralink = "Firmware-ralink-firmware"
>  
> -FILES_${PN}-ralink-license = "/lib/firmware/LICENCE.ralink-firmware.txt"
> +FILES_${PN}-ralink-license = "${nonarch_base_libdir}/firmware/LICENCE.ralink-firmware.txt"
>  FILES_${PN}-ralink = " \
> -  /lib/firmware/rt*.bin \
> +  ${nonarch_base_libdir}/firmware/rt*.bin \
>  "
>  
>  RDEPENDS_${PN}-ralink += "${PN}-ralink-license"
> @@ -223,9 +223,9 @@ RDEPENDS_${PN}-ralink += "${PN}-ralink-license"
>  # For radeon
>  LICENSE_${PN}-radeon = "Firmware-radeon"
>  
> -FILES_${PN}-radeon-license = "/lib/firmware/LICENSE.radeon"
> +FILES_${PN}-radeon-license = "${nonarch_base_libdir}/firmware/LICENSE.radeon"
>  FILES_${PN}-radeon = " \
> -  /lib/firmware/radeon \
> +  ${nonarch_base_libdir}/firmware/radeon \
>  "
>  
>  RDEPENDS_${PN}-radeon += "${PN}-radeon-license"
> @@ -235,16 +235,16 @@ LICENSE_${PN}-sd8686 = "Firmware-Marvell"
>  LICENSE_${PN}-sd8787 = "Firmware-Marvell"
>  LICENSE_${PN}-sd8797 = "Firmware-Marvell"
>  
> -FILES_${PN}-marvell-license = "/lib/firmware/LICENCE.Marvell"
> +FILES_${PN}-marvell-license = "${nonarch_base_libdir}/firmware/LICENCE.Marvell"
>  FILES_${PN}-sd8686 = " \
> -  /lib/firmware/libertas/sd8686_v9* \
> -  /lib/firmware/sd8686* \
> +  ${nonarch_base_libdir}/firmware/libertas/sd8686_v9* \
> +  ${nonarch_base_libdir}/firmware/sd8686* \
>  "
>  FILES_${PN}-sd8787 = " \
> -  /lib/firmware/mrvl/sd8787_uapsta.bin \
> +  ${nonarch_base_libdir}/firmware/mrvl/sd8787_uapsta.bin \
>  "
>  FILES_${PN}-sd8797 = " \
> -  /lib/firmware/mrvl/sd8797_uapsta.bin \
> +  ${nonarch_base_libdir}/firmware/mrvl/sd8797_uapsta.bin \
>  "
>  
>  RDEPENDS_${PN}-sd8686 += "${PN}-marvell-license"
> @@ -257,16 +257,16 @@ LICENSE_${PN}-rtl8192ce = "Firmware-rtlwifi_firmware"
>  LICENSE_${PN}-rtl8192su = "Firmware-rtlwifi_firmware"
>  
>  FILES_${PN}-rtl-license = " \
> -  /lib/firmware/LICENCE.rtlwifi_firmware.txt \
> +  ${nonarch_base_libdir}/firmware/LICENCE.rtlwifi_firmware.txt \
>  "
>  FILES_${PN}-rtl8192cu = " \
> -  /lib/firmware/rtlwifi/rtl8192cufw*.bin \
> +  ${nonarch_base_libdir}/firmware/rtlwifi/rtl8192cufw*.bin \
>  "
>  FILES_${PN}-rtl8192ce = " \
> -  /lib/firmware/rtlwifi/rtl8192cfw*.bin \
> +  ${nonarch_base_libdir}/firmware/rtlwifi/rtl8192cfw*.bin \
>  "
>  FILES_${PN}-rtl8192su = " \
> -  /lib/firmware/rtlwifi/rtl8712u.bin \
> +  ${nonarch_base_libdir}/firmware/rtlwifi/rtl8712u.bin \
>  "
>  
>  RDEPENDS_${PN}-rtl8192ce += "${PN}-rtl-license"
> @@ -277,16 +277,16 @@ RDEPENDS_${PN}-rtl8192su = "${PN}-rtl-license"
>  LICENSE_${PN}-wl12xx = "Firmware-ti-connectivity"
>  LICENSE_${PN}-wl18xx = "Firmware-ti-connectivity"
>  
> -FILES_${PN}-ti-connectivity-license = "/lib/firmware/LICENCE.ti-connectivity"
> +FILES_${PN}-ti-connectivity-license = "${nonarch_base_libdir}/firmware/LICENCE.ti-connectivity"
>  FILES_${PN}-wl12xx = " \
> -  /lib/firmware/wl12* \
> -  /lib/firmware/TI* \
> -  /lib/firmware/ti-connectivity \
> +  ${nonarch_base_libdir}/firmware/wl12* \
> +  ${nonarch_base_libdir}/firmware/TI* \
> +  ${nonarch_base_libdir}/firmware/ti-connectivity \
>  "
>  FILES_${PN}-wl18xx = " \
> -  /lib/firmware/wl18* \
> -  /lib/firmware/TI* \
> -  /lib/firmware/ti-connectivity \
> +  ${nonarch_base_libdir}/firmware/wl18* \
> +  ${nonarch_base_libdir}/firmware/TI* \
> +  ${nonarch_base_libdir}/firmware/ti-connectivity \
>  "
>  
>  RDEPENDS_${PN}-wl12xx = "${PN}-ti-connectivity-license"
> @@ -295,9 +295,9 @@ RDEPENDS_${PN}-wl18xx = "${PN}-ti-connectivity-license"
>  # For vt6656
>  LICENSE_${PN}-vt6656 = "Firmware-via_vt6656"
>  
> -FILES_${PN}-vt6656-license = "/lib/firmware/LICENCE.via_vt6656"
> +FILES_${PN}-vt6656-license = "${nonarch_base_libdir}/firmware/LICENCE.via_vt6656"
>  FILES_${PN}-vt6656 = " \
> -  /lib/firmware/vntwusb.fw \
> +  ${nonarch_base_libdir}/firmware/vntwusb.fw \
>  "
>  
>  RDEPENDS_${PN}-vt6656 = "${PN}-vt6656-license"
> @@ -314,31 +314,31 @@ LICENSE_${PN}-bcm4334 = "Firmware-broadcom_bcm43xx"
>  LICENSE_${PN}-bcm4354 = "Firmware-broadcom_bcm43xx"
>  
>  FILES_${PN}-broadcom-license = " \
> -  /lib/firmware/LICENCE.broadcom_bcm43xx \
> +  ${nonarch_base_libdir}/firmware/LICENCE.broadcom_bcm43xx \
>  "
>  FILES_${PN}-bcm4329 = " \
> -  /lib/firmware/brcm/brcmfmac4329-sdio.bin \
> +  ${nonarch_base_libdir}/firmware/brcm/brcmfmac4329-sdio.bin \
>  "
>  FILES_${PN}-bcm4330 = " \
> -  /lib/firmware/brcm/brcmfmac4330-sdio.bin \
> +  ${nonarch_base_libdir}/firmware/brcm/brcmfmac4330-sdio.bin \
>  "
>  FILES_${PN}-bcm4334 = " \
> -  /lib/firmware/brcm/brcmfmac4334-sdio.bin \
> +  ${nonarch_base_libdir}/firmware/brcm/brcmfmac4334-sdio.bin \
>  "
>  FILES_${PN}-bcm4354 = " \
> -  /lib/firmware/brcm/brcmfmac4354-sdio.bin \
> +  ${nonarch_base_libdir}/firmware/brcm/brcmfmac4354-sdio.bin \
>  "
>  
> -ALTERNATIVE_LINK_NAME[brcmfmac-sdio.bin] = "/lib/firmware/brcm/brcmfmac-sdio.bin"
> +ALTERNATIVE_LINK_NAME[brcmfmac-sdio.bin] = "${nonarch_base_libdir}/firmware/brcm/brcmfmac-sdio.bin"
>  
>  ALTERNATIVE_linux-firmware-bcm4334 = "brcmfmac-sdio.bin"
> -ALTERNATIVE_TARGET_linux-firmware-bcm4334[brcmfmac-sdio.bin] = "/lib/firmware/brcm/brcmfmac4334-sdio.bin"
> +ALTERNATIVE_TARGET_linux-firmware-bcm4334[brcmfmac-sdio.bin] = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4334-sdio.bin"
>  ALTERNATIVE_linux_firmware-bcm4354 = "brcmfmac-sdio.bin"
> -ALTERNATIVE_TARGET_linux-firmware-bcm4354[brcmfmac-sdio.bin] = "/lib/firmware/brcm/brcmfmac4354-sdio.bin"
> +ALTERNATIVE_TARGET_linux-firmware-bcm4354[brcmfmac-sdio.bin] = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4354-sdio.bin"
>  ALTERNATIVE_linux-firmware-bcm4329 = "brcmfmac-sdio.bin"
> -ALTERNATIVE_TARGET_linux-firmware-bcm4329[brcmfmac-sdio.bin] = "/lib/firmware/brcm/brcmfmac4329-sdio.bin"
> +ALTERNATIVE_TARGET_linux-firmware-bcm4329[brcmfmac-sdio.bin] = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4329-sdio.bin"
>  ALTERNATIVE_linux-firmware-bcm4330 = "brcmfmac-sdio.bin"
> -ALTERNATIVE_TARGET_linux-firmware-bcm4330[brcmfmac-sdio.bin] = "/lib/firmware/brcm/brcmfmac4330-sdio.bin"
> +ALTERNATIVE_TARGET_linux-firmware-bcm4330[brcmfmac-sdio.bin] = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4330-sdio.bin"
>  
>  RDEPENDS_${PN}-bcm4329 += "${PN}-broadcom-license"
>  RDEPENDS_${PN}-bcm4330 += "${PN}-broadcom-license"
> @@ -363,23 +363,23 @@ LICENSE_${PN}-iwlwifi-7260-9    = "Firmware-iwlwifi_firmware"
>  LICENSE_${PN}-iwlwifi-7265-8    = "Firmware-iwlwifi_firmware"
>  LICENSE_${PN}-iwlwifi-7265-9    = "Firmware-iwlwifi_firmware"
>  
> -FILES_${PN}-iwlwifi-license = "/lib/firmware/LICENCE.iwlwifi_firmware"
> -FILES_${PN}-iwlwifi-135-6 = "/lib/firmware/iwlwifi-135-6.ucode"
> -FILES_${PN}-iwlwifi-3160-7 = "/lib/firmware/iwlwifi-3160-7.ucode"
> -FILES_${PN}-iwlwifi-3160-8 = "/lib/firmware/iwlwifi-3160-8.ucode"
> -FILES_${PN}-iwlwifi-3160-9 = "/lib/firmware/iwlwifi-3160-9.ucode"
> -FILES_${PN}-iwlwifi-6000-4 = "/lib/firmware/iwlwifi-6000-4.ucode"
> -FILES_${PN}-iwlwifi-6000g2a-5 = "/lib/firmware/iwlwifi-6000g2a-5.ucode"
> -FILES_${PN}-iwlwifi-6000g2a-6 = "/lib/firmware/iwlwifi-6000g2a-6.ucode"
> -FILES_${PN}-iwlwifi-6000g2b-5 = "/lib/firmware/iwlwifi-6000g2b-5.ucode"
> -FILES_${PN}-iwlwifi-6000g2b-6 = "/lib/firmware/iwlwifi-6000g2b-6.ucode"
> -FILES_${PN}-iwlwifi-6050-4 = "/lib/firmware/iwlwifi-6050-4.ucode"
> -FILES_${PN}-iwlwifi-6050-5 = "/lib/firmware/iwlwifi-6050-5.ucode"
> -FILES_${PN}-iwlwifi-7260-7 = "/lib/firmware/iwlwifi-7260-7.ucode"
> -FILES_${PN}-iwlwifi-7260-8 = "/lib/firmware/iwlwifi-7260-8.ucode"
> -FILES_${PN}-iwlwifi-7260-9 = "/lib/firmware/iwlwifi-7260-9.ucode"
> -FILES_${PN}-iwlwifi-7265-8 = "/lib/firmware/iwlwifi-7265-8.ucode"
> -FILES_${PN}-iwlwifi-7265-9 = "/lib/firmware/iwlwifi-7265-9.ucode"
> +FILES_${PN}-iwlwifi-license = "${nonarch_base_libdir}/firmware/LICENCE.iwlwifi_firmware"
> +FILES_${PN}-iwlwifi-135-6 = "${nonarch_base_libdir}/firmware/iwlwifi-135-6.ucode"
> +FILES_${PN}-iwlwifi-3160-7 = "${nonarch_base_libdir}/firmware/iwlwifi-3160-7.ucode"
> +FILES_${PN}-iwlwifi-3160-8 = "${nonarch_base_libdir}/firmware/iwlwifi-3160-8.ucode"
> +FILES_${PN}-iwlwifi-3160-9 = "${nonarch_base_libdir}/firmware/iwlwifi-3160-9.ucode"
> +FILES_${PN}-iwlwifi-6000-4 = "${nonarch_base_libdir}/firmware/iwlwifi-6000-4.ucode"
> +FILES_${PN}-iwlwifi-6000g2a-5 = "${nonarch_base_libdir}/firmware/iwlwifi-6000g2a-5.ucode"
> +FILES_${PN}-iwlwifi-6000g2a-6 = "${nonarch_base_libdir}/firmware/iwlwifi-6000g2a-6.ucode"
> +FILES_${PN}-iwlwifi-6000g2b-5 = "${nonarch_base_libdir}/firmware/iwlwifi-6000g2b-5.ucode"
> +FILES_${PN}-iwlwifi-6000g2b-6 = "${nonarch_base_libdir}/firmware/iwlwifi-6000g2b-6.ucode"
> +FILES_${PN}-iwlwifi-6050-4 = "${nonarch_base_libdir}/firmware/iwlwifi-6050-4.ucode"
> +FILES_${PN}-iwlwifi-6050-5 = "${nonarch_base_libdir}/firmware/iwlwifi-6050-5.ucode"
> +FILES_${PN}-iwlwifi-7260-7 = "${nonarch_base_libdir}/firmware/iwlwifi-7260-7.ucode"
> +FILES_${PN}-iwlwifi-7260-8 = "${nonarch_base_libdir}/firmware/iwlwifi-7260-8.ucode"
> +FILES_${PN}-iwlwifi-7260-9 = "${nonarch_base_libdir}/firmware/iwlwifi-7260-9.ucode"
> +FILES_${PN}-iwlwifi-7265-8 = "${nonarch_base_libdir}/firmware/iwlwifi-7265-8.ucode"
> +FILES_${PN}-iwlwifi-7265-9 = "${nonarch_base_libdir}/firmware/iwlwifi-7265-9.ucode"
>  
>  RDEPENDS_${PN}-iwlwifi-135-6     = "${PN}-iwlwifi-license"
>  RDEPENDS_${PN}-iwlwifi-3160-7    = "${PN}-iwlwifi-license"
> @@ -429,8 +429,8 @@ LICENSE_${PN} = "\
>      & Firmware-xc5000 \
>      & Firmware-xc5000c \
>  "
> -FILES_${PN}-license += "/lib/firmware/LICEN*"
> -FILES_${PN} += "/lib/firmware/*"
> +FILES_${PN}-license += "${nonarch_base_libdir}/firmware/LICEN*"
> +FILES_${PN} += "${nonarch_base_libdir}/firmware/*"
>  RDEPENDS_${PN} += "${PN}-license"
>  
>  # Make linux-firmware depend on all of the split-out packages.
> -- 
> 2.4.5
> 

