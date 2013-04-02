Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1UMrKQ-0007n8-GF
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Apr 2013 04:52:06 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r322YuWq012156
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Apr 2013 19:34:56 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.206) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Mon, 1 Apr 2013 19:34:56 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 2 Apr 2013 10:34:52 +0800
Message-ID: <9271759920597688d4ea1219fb1a2aa7470a363e.1364551873.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1364551873.git.hongxu.jia@windriver.com>
References: <cover.1364551873.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	r322YuWq012156
Subject: [PATCH 1/1] meta: update atom-pc-wifi.cfg for audit purposes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Apr 2013 02:52:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

1, When do_kernel_configcheck(such as 3.8.1), it has the following warnin=
g:
log.do_kernel_configcheck:
NOTE: validating kernel config, see log.do_kernel_configcheck for details
DEBUG: [non-hardware (4)]: meta/cfg/standard/atom-pc/specified_non_hdw.cf=
g
   This BSP sets config options that are possibly non-hardware related.

[invalid (1)]: meta/cfg/standard/atom-pc/invalid.cfg
   This BSP sets config options that are not offered anywhere within this=
 kernel

specified_non_hdw.cfg:
CONFIG_CRC_CCITT
CONFIG_STAGING
CONFIG_WEXT_PRIV
CONFIG_WIRELESS_EXT

invalid.cfg:
CONFIG_RT2860

2, CONFIG_RT2860 is invalid, because it is found in Linux kernels:
2.6.29=E2=80=932.6.32, 2.6.33=E2=80=932.6.39, and it is obsolete now. Use
CONFIG_RT2800PCI instead.
drivers/net/wireless/rt2x00/Kconfig:
 56 config RT2800PCI
 ...
 66     ---help---
 67       This adds support for rt27xx/rt28xx/rt30xx wireless chipset fam=
ily.
 68       Supported chips: RT2760, RT2790, RT2860, RT2880, RT2890, RT3052=
,
 69                RT3090, RT3091 & RT3092

3, STAGING is the menuconfig of RT2860, The menuconfig of current
RT2800PCI is RT2X00. Use CONFIG_RT2X00 instead of CONFIG_STAGING.

4, CONFIG_ATH9K_HW and CONFIG_ATH9K_COMMON could be removed,
because ATH9K has selected them.
drivers/net/wireless/ath/ath9k/Kconfig:
 18 config ATH9K
 ...
 21     select ATH9K_HW
 ...
 25     select ATH9K_COMMON

5, CONFIG_CRC_CCITT could be removed, because RT2800PCI has
selected it.
drivers/net/wireless/rt2x00/Kconfig:
 56 config RT2800PCI
 ...
 64         select CRC_CCITT

6, CONFIG_WIRELESS_EXT and CONFIG_WEXT_PRIV do nothing which means
they don't exist in the configure file `.config', remove them.

http://cateee.net/lkddb/web-lkddb/RT2860.html
http://cateee.net/lkddb/web-lkddb/RT2800PCI.html
http://lxr.linux.no/linux/drivers/net/wireless/ath/ath9k/Kconfig
http://lxr.linux.no/linux/drivers/net/wireless/rt2x00/Kconfig

[YOCTO #3490]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 bsp/atom-pc/atom-pc-wifi.cfg |   11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/bsp/atom-pc/atom-pc-wifi.cfg b/bsp/atom-pc/atom-pc-wifi.cfg
index e6cbc95..7226c08 100644
--- a/bsp/atom-pc/atom-pc-wifi.cfg
+++ b/bsp/atom-pc/atom-pc-wifi.cfg
@@ -1,11 +1,4 @@
-CONFIG_WIRELESS_EXT=3Dy
-CONFIG_WEXT_PRIV=3Dy
-
-CONFIG_ATH9K_HW=3Dy
-CONFIG_ATH9K_COMMON=3Dy
 CONFIG_ATH9K=3Dy
=20
-CONFIG_STAGING=3Dy
-CONFIG_RT2860=3Dy
-
-CONFIG_CRC_CCITT=3Dy
+CONFIG_RT2X00=3Dy
+CONFIG_RT2800PCI=3Dy
--=20
1.7.10.4



