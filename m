Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 23D807702B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 05:28:52 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tAH5SqR8006082
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 21:28:53 -0800
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 16 Nov 2015 21:28:52 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 17 Nov 2015 00:28:48 -0500
Message-ID: <177488b398bc642997dd2c356bafe83cdde8fb5b.1447737927.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1447737927.git.wenzong.fan@windriver.com>
References: <cover.1447737927.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2 v2] qemu: fix CVE-2015-6855
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
X-List-Received-Date: Tue, 17 Nov 2015 05:28:53 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

hw/ide/core.c in QEMU does not properly restrict the commands accepted
by an ATAPI device, which allows guest users to cause a denial of
service or possibly have unspecified other impact via certain IDE
commands, as demonstrated by a WIN_READ_NATIVE_MAX command to an empty
drive, which triggers a divide-by-zero error and instance crash.

Backport upstream commit:
http://git.qemu.org/?p=qemu.git;a=commit;h=d9033e1d3aa666c5071580617a57bd853c5d794a

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../qemu/qemu/qemu-CVE-2015-6855.patch             | 151 +++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.4.0.1.bb         |   1 +
 2 files changed, 152 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/qemu-CVE-2015-6855.patch

diff --git a/meta/recipes-devtools/qemu/qemu/qemu-CVE-2015-6855.patch b/meta/recipes-devtools/qemu/qemu/qemu-CVE-2015-6855.patch
new file mode 100644
index 0000000..f7f6452
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/qemu-CVE-2015-6855.patch
@@ -0,0 +1,151 @@
+From d9033e1d3aa666c5071580617a57bd853c5d794a Mon Sep 17 00:00:00 2001
+From: John Snow <jsnow@redhat.com>
+Date: Thu, 17 Sep 2015 14:17:05 -0400
+Subject: [PATCH] ide: fix ATAPI command permissions
+
+We're a little too lenient with what we'll let an ATAPI drive handle.
+Clamp down on the IDE command execution table to remove CD_OK permissions
+from commands that are not and have never been ATAPI commands.
+
+For ATAPI command validity, please see:
+- ATA4 Section 6.5 ("PACKET Command feature set")
+- ATA8/ACS Section 4.3 ("The PACKET feature set")
+- ACS3 Section 4.3 ("The PACKET feature set")
+
+ACS3 has a historical command validity table in Table B.4
+("Historical Command Assignments") that can be referenced to find when
+a command was introduced, deprecated, obsoleted, etc.
+
+The only reference for ATAPI command validity is by checking that
+version's PACKET feature set section.
+
+ATAPI was introduced by T13 into ATA4, all commands retired prior to ATA4
+therefore are assumed to have never been ATAPI commands.
+
+Mandatory commands, as listed in ATA8-ACS3, are:
+
+- DEVICE RESET
+- EXECUTE DEVICE DIAGNOSTIC
+- IDENTIFY DEVICE
+- IDENTIFY PACKET DEVICE
+- NOP
+- PACKET
+- READ SECTOR(S)
+- SET FEATURES
+
+Optional commands as listed in ATA8-ACS3, are:
+
+- FLUSH CACHE
+- READ LOG DMA EXT
+- READ LOG EXT
+- WRITE LOG DMA EXT
+- WRITE LOG EXT
+
+All other commands are illegal to send to an ATAPI device and should
+be rejected by the device.
+
+CD_OK removal justifications:
+
+0x06 WIN_DSM              Defined in ACS2. Not valid for ATAPI.
+0x21 WIN_READ_ONCE        Retired in ATA5. Not ATAPI in ATA4.
+0x94 WIN_STANDBYNOW2      Retired in ATA4. Did not coexist with ATAPI.
+0x95 WIN_IDLEIMMEDIATE2   Retired in ATA4. Did not coexist with ATAPI.
+0x96 WIN_STANDBY2         Retired in ATA4. Did not coexist with ATAPI.
+0x97 WIN_SETIDLE2         Retired in ATA4. Did not coexist with ATAPI.
+0x98 WIN_CHECKPOWERMODE2  Retired in ATA4. Did not coexist with ATAPI.
+0x99 WIN_SLEEPNOW2        Retired in ATA4. Did not coexist with ATAPI.
+0xE0 WIN_STANDBYNOW1      Not part of ATAPI in ATA4, ACS or ACS3.
+0xE1 WIN_IDLEIMMDIATE     Not part of ATAPI in ATA4, ACS or ACS3.
+0xE2 WIN_STANDBY          Not part of ATAPI in ATA4, ACS or ACS3.
+0xE3 WIN_SETIDLE1         Not part of ATAPI in ATA4, ACS or ACS3.
+0xE4 WIN_CHECKPOWERMODE1  Not part of ATAPI in ATA4, ACS or ACS3.
+0xE5 WIN_SLEEPNOW1        Not part of ATAPI in ATA4, ACS or ACS3.
+0xF8 WIN_READ_NATIVE_MAX  Obsoleted in ACS3. Not ATAPI in ATA4 or ACS.
+
+This patch fixes a divide by zero fault that can be caused by sending
+the WIN_READ_NATIVE_MAX command to an ATAPI drive, which causes it to
+attempt to use zeroed CHS values to perform sector arithmetic.
+
+Reported-by: Qinghao Tang <luodalongde@gmail.com>
+Signed-off-by: John Snow <jsnow@redhat.com>
+Reviewed-by: Markus Armbruster <armbru@redhat.com>
+Message-id: 1441816082-21031-1-git-send-email-jsnow@redhat.com
+CC: qemu-stable@nongnu.org
+
+Upstream-Status: Backport
+
+Backport upstream commit:
+http://git.qemu.org/?p=qemu.git;a=commit;h=d9033e1d3aa666c5071580617a57bd853c5d794a
+
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+---
+ hw/ide/core.c | 30 +++++++++++++++---------------
+ 1 file changed, 15 insertions(+), 15 deletions(-)
+
+diff --git a/hw/ide/core.c b/hw/ide/core.c
+index 8ba04df..1cc6945 100644
+--- a/hw/ide/core.c
++++ b/hw/ide/core.c
+@@ -1746,11 +1746,11 @@ static const struct {
+ } ide_cmd_table[0x100] = {
+     /* NOP not implemented, mandatory for CD */
+     [CFA_REQ_EXT_ERROR_CODE]      = { cmd_cfa_req_ext_error_code, CFA_OK },
+-    [WIN_DSM]                     = { cmd_data_set_management, ALL_OK },
++    [WIN_DSM]                     = { cmd_data_set_management, HD_CFA_OK },
+     [WIN_DEVICE_RESET]            = { cmd_device_reset, CD_OK },
+     [WIN_RECAL]                   = { cmd_nop, HD_CFA_OK | SET_DSC},
+     [WIN_READ]                    = { cmd_read_pio, ALL_OK },
+-    [WIN_READ_ONCE]               = { cmd_read_pio, ALL_OK },
++    [WIN_READ_ONCE]               = { cmd_read_pio, HD_CFA_OK },
+     [WIN_READ_EXT]                = { cmd_read_pio, HD_CFA_OK },
+     [WIN_READDMA_EXT]             = { cmd_read_dma, HD_CFA_OK },
+     [WIN_READ_NATIVE_MAX_EXT]     = { cmd_read_native_max, HD_CFA_OK | SET_DSC },
+@@ -1769,12 +1769,12 @@ static const struct {
+     [CFA_TRANSLATE_SECTOR]        = { cmd_cfa_translate_sector, CFA_OK },
+     [WIN_DIAGNOSE]                = { cmd_exec_dev_diagnostic, ALL_OK },
+     [WIN_SPECIFY]                 = { cmd_nop, HD_CFA_OK | SET_DSC },
+-    [WIN_STANDBYNOW2]             = { cmd_nop, ALL_OK },
+-    [WIN_IDLEIMMEDIATE2]          = { cmd_nop, ALL_OK },
+-    [WIN_STANDBY2]                = { cmd_nop, ALL_OK },
+-    [WIN_SETIDLE2]                = { cmd_nop, ALL_OK },
+-    [WIN_CHECKPOWERMODE2]         = { cmd_check_power_mode, ALL_OK | SET_DSC },
+-    [WIN_SLEEPNOW2]               = { cmd_nop, ALL_OK },
++    [WIN_STANDBYNOW2]             = { cmd_nop, HD_CFA_OK },
++    [WIN_IDLEIMMEDIATE2]          = { cmd_nop, HD_CFA_OK },
++    [WIN_STANDBY2]                = { cmd_nop, HD_CFA_OK },
++    [WIN_SETIDLE2]                = { cmd_nop, HD_CFA_OK },
++    [WIN_CHECKPOWERMODE2]         = { cmd_check_power_mode, HD_CFA_OK | SET_DSC },
++    [WIN_SLEEPNOW2]               = { cmd_nop, HD_CFA_OK },
+     [WIN_PACKETCMD]               = { cmd_packet, CD_OK },
+     [WIN_PIDENTIFY]               = { cmd_identify_packet, CD_OK },
+     [WIN_SMART]                   = { cmd_smart, HD_CFA_OK | SET_DSC },
+@@ -1788,19 +1788,19 @@ static const struct {
+     [WIN_WRITEDMA]                = { cmd_write_dma, HD_CFA_OK },
+     [WIN_WRITEDMA_ONCE]           = { cmd_write_dma, HD_CFA_OK },
+     [CFA_WRITE_MULTI_WO_ERASE]    = { cmd_write_multiple, CFA_OK },
+-    [WIN_STANDBYNOW1]             = { cmd_nop, ALL_OK },
+-    [WIN_IDLEIMMEDIATE]           = { cmd_nop, ALL_OK },
+-    [WIN_STANDBY]                 = { cmd_nop, ALL_OK },
+-    [WIN_SETIDLE1]                = { cmd_nop, ALL_OK },
+-    [WIN_CHECKPOWERMODE1]         = { cmd_check_power_mode, ALL_OK | SET_DSC },
+-    [WIN_SLEEPNOW1]               = { cmd_nop, ALL_OK },
++    [WIN_STANDBYNOW1]             = { cmd_nop, HD_CFA_OK },
++    [WIN_IDLEIMMEDIATE]           = { cmd_nop, HD_CFA_OK },
++    [WIN_STANDBY]                 = { cmd_nop, HD_CFA_OK },
++    [WIN_SETIDLE1]                = { cmd_nop, HD_CFA_OK },
++    [WIN_CHECKPOWERMODE1]         = { cmd_check_power_mode, HD_CFA_OK | SET_DSC },
++    [WIN_SLEEPNOW1]               = { cmd_nop, HD_CFA_OK },
+     [WIN_FLUSH_CACHE]             = { cmd_flush_cache, ALL_OK },
+     [WIN_FLUSH_CACHE_EXT]         = { cmd_flush_cache, HD_CFA_OK },
+     [WIN_IDENTIFY]                = { cmd_identify, ALL_OK },
+     [WIN_SETFEATURES]             = { cmd_set_features, ALL_OK | SET_DSC },
+     [IBM_SENSE_CONDITION]         = { cmd_ibm_sense_condition, CFA_OK | SET_DSC },
+     [CFA_WEAR_LEVEL]              = { cmd_cfa_erase_sectors, HD_CFA_OK | SET_DSC },
+-    [WIN_READ_NATIVE_MAX]         = { cmd_read_native_max, ALL_OK | SET_DSC },
++    [WIN_READ_NATIVE_MAX]         = { cmd_read_native_max, HD_CFA_OK | SET_DSC },
+ };
+ 
+ static bool ide_cmd_permitted(IDEState *s, uint32_t cmd)
+-- 
+2.3.5
+
diff --git a/meta/recipes-devtools/qemu/qemu_2.4.0.1.bb b/meta/recipes-devtools/qemu/qemu_2.4.0.1.bb
index 23e565d..d30645b 100644
--- a/meta/recipes-devtools/qemu/qemu_2.4.0.1.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.4.0.1.bb
@@ -10,6 +10,7 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://smc91c111_fix2.patch \
             file://smc91c111_fix3.patch \
             file://no-valgrind.patch \
+            file://qemu-CVE-2015-6855.patch \
            "
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
 SRC_URI[md5sum] = "c99445164e77184a9ba2e7dbf7ed5c29"
-- 
1.9.1


