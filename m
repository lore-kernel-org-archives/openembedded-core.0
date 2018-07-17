Return-Path: <mohamad.noor.alim.hussin@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id BA7F2745C9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 06:55:25 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Jul 2018 23:55:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,364,1526367600"; d="scan'208";a="216611826"
Received: from alim-desktop.png.intel.com ([172.30.199.42])
	by orsmga004.jf.intel.com with ESMTP; 16 Jul 2018 23:55:25 -0700
From: mohamad.noor.alim.hussin@intel.com
To: yocto@yoctoproject.org,
	richard.purdie@linuxfoundation.org
Date: Tue, 17 Jul 2018 14:54:56 +0800
Message-Id: <1531810496-2948-1-git-send-email-mohamad.noor.alim.hussin@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: mohamad.noor.alim.hussin@intel.com,
	openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/runtime/cases/manualbsp: Add BSP testcases
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
X-List-Received-Date: Tue, 17 Jul 2018 06:55:26 -0000

From: Mohamad Noor Alim Hussin <mohamad.noor.alim.hussin@intel.com>

Manualbsp.py contain test cases that was converted from manual testcases
to auto which would run on Yocto reference boards such as Minnowboard,
NUC, edgerouter and beaglebone. The testcase was added to support QA
automation which target devices attached with removable media and would
boot up using LAVA faramework. The testcase ID was taken form existing
manual testcase on Testopia[1].

There are 2 scripts called manualbsp.py and bsphardware that needed
to execute the test cases.

Manualbsp.py contain testcases that need to run on target devices.
There are 2 classes in this patch, BSPRuntimeTest and BSPHardwareTest.
BSPRuntimeTest class used to run test such as check runlevel 3 or 5
at runtime and check bash package.

BSPHardware class would run test on removeable media such as USB stick,
hard disk and MicroSD. The test cases are mount/unmount, read & write
to removable media.

Bsphardware script was written to reduce complexity of code from
Manualbsp.py. It is used for device detection, mount/unmount and
check runlevel on target device under test. This script would copy
to target device as Manualbsp.py depend on it.

Reference:
[1] https://bugzilla.yoctoproject.org/tr_show_run.cgi?run_id=9635.

Signed-off-by: Mohamad Noor Alim Hussin <mohamad.noor.alim.hussin@intel.com>
---
 meta/lib/oeqa/runtime/cases/manualbsp.py | 122 ++++++++++++++++++++++++++++
 meta/lib/oeqa/runtime/files/bsphardware  | 132 +++++++++++++++++++++++++++++++
 2 files changed, 254 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/cases/manualbsp.py
 create mode 100755 meta/lib/oeqa/runtime/files/bsphardware

diff --git a/meta/lib/oeqa/runtime/cases/manualbsp.py b/meta/lib/oeqa/runtime/cases/manualbsp.py
new file mode 100644
index 0000000..22d0d33
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/manualbsp.py
@@ -0,0 +1,122 @@
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.core.decorator.oeid import OETestID
+import subprocess
+import time
+
+class BspRuntimeTest(OERuntimeTestCase):
+
+    @OETestID(240)
+    def test_check_bash(self):
+        status, output = self.target.run('which bash')
+        msg = ('bash shell not working as expected. '
+                'Status and output:%s and %s.' % (status, output))
+        self.assertEqual(status, 0, msg = msg)
+
+    @OETestID(228)
+    def test_runlevel_5(self):
+        status, output = self.target.run('init 5')
+        msg = ('System unable to init 5 '
+                'Status and output:%s and %s.' % (status, output))
+        self.assertEqual(status, 255, msg = msg)
+        time.sleep(2)
+        command = 'bsphardware -r 5'
+        status, output = self.target.run(command)
+        msg = ('System did not start from runlevel 5. '
+                'Status:%s.' % (status))
+        self.assertEqual(status, 0, msg = msg)
+
+    @OETestID(198)
+    def test_runlevel_3(self):
+        status, output = self.target.run('init 3')
+        msg = ('System unable to start with runlevel 3. '
+                'Status and output:%s and %s.' % (status, output))
+        self.assertEqual(status, 255, msg = msg)
+        time.sleep(2)
+        command = 'bsphardware -r 3'
+        status, output = self.target.run(command)
+        msg = ('Unable to change from runlevel 5 to 3. '
+                'Status and output:%s and %s.' % (status, output))
+        self.assertEqual(status, 0, msg = msg)
+
+class BspHardwareTest(OERuntimeTestCase):
+
+    @classmethod
+    def setUpClass(cls):
+        src = os.path.join(cls.tc.runtime_files_dir, 'bsphardware')
+        cls.tc.target.run('mkdir ~/test')
+        cls.tc.target.copyTo(src, '/usr/bin')
+
+    @classmethod
+    def tearDownClass(cls):
+        cls.tc.target.run('rm -rf ~/test')
+
+    @OETestID(216)
+    def test_USB_mount(self):
+        command = 'bsphardware -d sd -sp 1 -m ~/test/stick'
+        status, output = self.target.run(command)
+        msg = ('Unable to mount USB stick. '
+                'Status and output:%s and %s.' % (status, output))
+        self.assertEqual(status, 0, msg = msg)
+
+    @OETestID(217)
+    @OETestDepends(['manualbsp.BspHardwareTest.test_USB_write_file'])
+    def test_USB_read_file(self):
+        command = 'cat ~/test/stick/hello_stick'
+        status, output = self.target.run(command)
+        msg = ('Unable to read file from USB stick. '
+                'Status and output:%s and %s.' % (status, output))
+        self.assertEqual(status, 0, msg = msg)
+
+    @OETestDepends(['manualbsp.BspHardwareTest.test_USB_mount'])
+    @OETestID(219)
+    def test_USB_write_file(self):
+        command = 'touch ~/test/stick/hello_stick'
+        status, output = self.target.run(command)
+        msg = ('Status and  output:%s and %s.' % (status, output))
+        self.assertEqual(status, 0, msg = msg)
+
+    @OETestDepends(['manualbsp.BspHardwareTest.test_USB_mount'])
+    @OETestID(218)
+    def test_USB_unmount(self):
+        command = 'bsphardware -u ~/test/stick'
+        status, output = self.target.run(command)
+        msg = ('Unable to unmount USB stick. ' 
+                'Status and output:%s and %s.' % (status, output))
+        self.assertEqual(status, 0, msg = msg)
+
+    @OETestID(241)
+    def test_MicroSD_mount(self):
+        command = 'bsphardware -d mmc -sp p1 -m ~/test/microsd'
+        status, output = self.target.run(command)
+        msg = ('Unable to mount MicroSD. '
+                'Status and output:%s and %s.' %(status, output))
+        self.assertEqual(status, 0, msg = msg)
+
+    @OETestDepends(['manualbsp.BspHardwareTest.test_MicroSD_write_file'])
+    @OETestID(242)
+    def test_MicroSD_read_file(self):
+        command = 'cat ~/test/microsd/hello_mmc'
+        status, output = self.target.run(command)
+        msg = ('Unable to read MicroSD. '
+                'Status and output:%s and %s.' % (status, output))
+        self.assertEqual(status, 0, msg = msg)
+
+    @OETestDepends(['manualbsp.BspHardwareTest.test_MicroSD_mount'])
+    @OETestID(244)
+    def test_MicroSD_write_file(self):
+        command = 'touch ~/test/microsd/hello_mmc'
+        status, output = self.target.run(command)
+        msg = ('Unable to write to MicroSD. '
+                'Status and output:%s and %s.' % (status, output))
+        self.assertEqual(status, 0, msg = msg)
+
+    @OETestDepends(['manualbsp.BspHardwareTest.test_MicroSD_mount'])
+    @OETestID(243)
+    def test_MicroSD_unmount(self):
+        command = 'bsphardware -u ~/test/microsd'
+        status, output = self.target.run(command)
+        msg = ('Unable to unmount MicroSD. '
+                'Status and output:%s and %s.' % (status, output))
+        self.assertEqual(status, 0, msg = msg)
+
diff --git a/meta/lib/oeqa/runtime/files/bsphardware b/meta/lib/oeqa/runtime/files/bsphardware
new file mode 100755
index 0000000..3973825
--- /dev/null
+++ b/meta/lib/oeqa/runtime/files/bsphardware
@@ -0,0 +1,132 @@
+#!/bin/bash
+
+# Description: This script used for Yocto Project BSP test.
+#              manualbsp.py script is depend on this script
+#              that available in poky/meta/lib/oeqa/runtime/cases/manualbsp.py.
+#              This script is should be located in
+#              poky/meta/lib/oeqa/runtime/cases/
+
+LOG_FILE="/tmp/bsphardware.log"
+
+usage() {
+echo "BSP hardware test is a script used to test hardware"
+echo "such as USB stick, micro SD and SSD hard disk on Yocto Project."$'\n'
+echo "Usage:"
+echo " -d, --device <keyword, e.g. sd/mmc>            Get device's name"
+echo " -sp, --setPartition <partition's number>       Set partition's number "
+echo " -m, --mount <path/to/mount>                    Mount the device to /path/to/mount"
+echo " -u, --umount <path/to/unmount>                 Unmont the mounted device"
+echo " -r, --runlevel <3|5>                           Get runlevel on current system"
+echo " -h, --help                                     Show the usage"$'\n'
+echo "Examples"
+echo " bsphardware -d sda -sp 1 -m ~/data   Mount /dev/sda1 on ~/data"
+}
+
+options() {
+SETPARTITION=""
+DEVICE=""
+while [[ $# -gt 0 ]]; do
+case "$1" in
+    -d|--device)
+        echo "[INFO]: get device's name" 2>&1 | tee -a $LOG_FILE
+        array_devices=()
+        index_device=()
+        array_devices=$(ls /dev/$2*)
+        for i in ${array_devices[@]}
+        do
+            index_device+=($i)
+        done
+        DEVICE="${index_device[0]}"
+        echo "[INFO]: Detected device: $DEVICE"$'\n' 2>&1 | tee -a $LOG_FILE
+        ;;
+    -sp| --setPartition)
+        echo "[INFO]: Set partition: $2" 2>&1 | tee -a $LOG_FILE
+        SETPARTITION=$2
+        ;;
+    -m|mount)
+        if [[ ! -d $2 ]];then
+            mkdir -p $2
+        fi
+        if [[ "$DEVICE" == "" || " $SETPARTITION" == "" ]]; then
+            echo "[ERROR]: Target device and partition not found." 2>&1 | tee -a $LOG_FILE 
+            echo "[INFO]: Use -d <device_keyword> -sp <partition's number> -m <dir>"  2>&1 | tee -a $LOG_FILE
+        else
+            echo "[INFO]: Mounting removable media..." 2>&1 | tee -a $LOG_FILE
+            echo "[DEBUG]: commandline: mount $DEVICE$SETPARTITION $2"$'\n' 2>&1 | tee -a $LOG_FILE > /dev/null
+            mount $DEVICE$SETPARTITION $2
+        fi
+        if [[ $? -eq 0 ]]; then
+            echo "[INFO]: Device $DEVICE$SETPARTITION mount successfully"$'\n' 2>&1 | tee -a $LOG_FILE
+            exit 0
+        else
+            echo "[ERROR]: Unable to mount device $DEVICE$SETPARTITION. Device does not exist"$'\n' 2>&1 | tee -a $LOG_FILE
+            exit 1
+        fi
+        ;;
+    -u|umount)
+        echo "[INFO]: Unmount $2" 2>&1 | tee -a $LOG_FILE
+        if [[ -d $2 ]]; then
+            echo "[DEBUG]: commandline: umount from $2" 2>&1 | tee -a $LOG_FILE > /dev/null
+            umount $2
+        else
+            echo "[Error]: No mount point on $2"$'\n' 2>&1 | tee -a $LOG_FILE
+            exit 1
+        fi
+        if [[ $? -eq 0 ]];then 
+            echo "[INFO]: Device $2 unmount successfully" 2>&1 | tee -a $LOG_FILE
+            echo "[INFO]: Removing mount point on $2" $'\n' 2>&1 | tee -a $LOG_FILE
+            rm -rf $2
+        else
+            echo "[ERROR]: Unable to unmount from $2"$'\n' 2>&1 | tee -a $LOG_FILE
+        fi
+        ;;
+    -r|--runlevel)
+        level=$(runlevel | cut -d " " -f2)
+        echo "[DEBUG]: commandline: runlevel | cut -d ' ' -f2" 2>&1 | tee -a $LOG_FILE > /dev/null
+        if [[ "$2" == "3" || "$2" == "5" ]]; then
+            if [[ "$level" == "3" && "$level" == "$2" ]]; then
+                echo "[DEBUG]: Test runlevel 3"  2>&1 | tee -a $LOG_FILE
+                echo "[INFO]: System start with runlevel: $level"$'\n' 2>&1 | tee -a $LOG_FILE
+                exit 0
+            elif [[ "$level" == "5" && "$level" == "$2" ]]; then
+                echo "[DEBUG]: Test runlevel 5" 2>&1 | tee -a $LOG_FILE > /dev/null
+                echo "[INFO]: System start with runlevel: $level"$'\n' 2>&1 | tee -a $LOG_FILE
+                exit 0
+            else
+                echo "[INFO]: System did not start with runlevel: $2"$'\n' 2>&1 | tee -a $LOG_FILE
+                exit 1
+            fi
+        else
+            echo "[ERROR]: Runlevel other than 3 & 5 are not allowed."$'\n' 2>&1 | tee -a $LOG_FILE
+            exit 1
+        fi
+        ;;
+    -h|--help)
+        usage
+        exit 0
+        ;;
+    *) 
+        echo "[Error]: Arguments $1 is not exists."$'\n' 2>&1 | tee -a $LOG_FILE
+        usage
+        exit 1
+        ;;
+esac
+shift
+shift
+done
+}
+
+main() {
+if [ "$#" == "0" ];then
+    usage
+    exit 1
+esh vs shlse
+    echo "[INFO]: Start-Date: $(date '+%Y-%m-%d %H:%M:%S')" 2>&1 | tee -a $LOG_FILE > /dev/null
+    echo "[DEBUG]: commandline: $0 ${POSITIONAL[*]}" 2>&1 | tee -a $LOG_FILE > /dev/null
+    options "${POSITIONAL[@]}"
+fi
+}
+
+POSITIONAL=()
+POSITIONAL+=("$@")
+main ${POSITIONAL[@]}
-- 
2.7.4


