Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 96E1D79AFE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2018 09:54:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Oct 2018 02:54:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,368,1534834800"; d="scan'208";a="264781691"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga005.jf.intel.com with ESMTP; 11 Oct 2018 02:54:14 -0700
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Oct 2018 17:39:01 +0800
Message-Id: <1539250741-84490-1-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] oeqa/manual: transfer manual test cases from testopia to oeqa
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
X-List-Received-Date: Thu, 11 Oct 2018 09:54:16 -0000

As part of the solution to replace Testopia, manual test cases
need to be migrated to OEQA. These manual test case json files
will serve two use cases.

Use case#1: as input to the future commandline-based manual test
runner script, where this script will display actions and expected
result information in user friendly text, then it will capture
user input for test result and log, finally it will write test
result and log into existing standardize test result json format
from OEQA framework for automated tests.

Use case#2: QA will open and read these json file manually for
planning manual test execution. Any reader interested in
understanding manual test cases will open and read these files.

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 meta/lib/oeqa/manual/abat.patch           |   64 ++
 meta/lib/oeqa/manual/bsp-hw.json          | 1200 +++++++++++++++++++++++++++++
 meta/lib/oeqa/manual/bsp-qemu.json        |  222 ++++++
 meta/lib/oeqa/manual/build-appliance.json |  122 +++
 meta/lib/oeqa/manual/crops.json           |  294 +++++++
 meta/lib/oeqa/manual/eclipse-plugin.json  |  322 ++++++++
 meta/lib/oeqa/manual/kernel-dev.json      |  200 +++++
 meta/lib/oeqa/manual/oe-core.json         |  294 +++++++
 meta/lib/oeqa/manual/sdk.json             |   32 +
 9 files changed, 2750 insertions(+)
 create mode 100644 meta/lib/oeqa/manual/abat.patch
 create mode 100644 meta/lib/oeqa/manual/bsp-hw.json
 create mode 100644 meta/lib/oeqa/manual/bsp-qemu.json
 create mode 100644 meta/lib/oeqa/manual/build-appliance.json
 create mode 100644 meta/lib/oeqa/manual/crops.json
 create mode 100644 meta/lib/oeqa/manual/eclipse-plugin.json
 create mode 100644 meta/lib/oeqa/manual/kernel-dev.json
 create mode 100644 meta/lib/oeqa/manual/oe-core.json
 create mode 100644 meta/lib/oeqa/manual/sdk.json

diff --git a/meta/lib/oeqa/manual/abat.patch b/meta/lib/oeqa/manual/abat.patch
new file mode 100644
index 0000000..1541ac8
--- /dev/null
+++ b/meta/lib/oeqa/manual/abat.patch
@@ -0,0 +1,64 @@
+########
+diff --git a/glxgears_check.sh b/glxgears_check.sh
+index 17622b8..c4d3b97 100755
+--- a/glxgears_check.sh
++++ b/glxgears_check.sh
+@@ -31,7 +31,7 @@ else
+ 
+     sleep 6
+ 
+-    XPID=$( ps ax | awk '{print $1, $5}' | grep glxgears | awk '{print $1}')
++    XPID=$( ps | awk '{print $1, $5}' | grep glxgears | awk '{print $1}')
+     if [ ! -z "$XPID" ]; then
+         kill -9 $XPID >/dev/null 2>&1
+         echo "glxgears can run, PASS!"
+diff --git a/x_close.sh b/x_close.sh
+index e287be1..3429f1a 100755
+--- a/x_close.sh
++++ b/x_close.sh
+@@ -22,7 +22,7 @@
+ #
+ function close_proc(){
+ echo "kill process Xorg"
+-XPID=$(  ps ax | awk '{print $1, $5}' | egrep "X$|Xorg$" | awk '{print $1}')
++XPID=$(  ps | awk '{print $1, $6}' | egrep "X$|Xorg$" | awk '{print $1}')
+ if [ ! -z "$XPID" ]; then
+     kill $XPID
+     sleep 4
+diff --git a/x_start.sh b/x_start.sh
+index 9cf6eab..2305796 100755
+--- a/x_start.sh
++++ b/x_start.sh
+@@ -24,7 +24,7 @@
+ X_ERROR=0
+ 
+ #test whether X has started
+-PXID=$(ps ax |awk '{print $1,$5}' |egrep "Xorg$|X$" |grep -v grep | awk '{print $1}')
++PXID=$(ps |awk '{print $1,$6}' |egrep "Xorg$|X$" |grep -v grep | awk '{print $1}')
+ if [ ! -z "$PXID" ]; then
+     echo "[WARNING] Xorg has started!"
+     XORG_STATUS="started"
+@@ -35,9 +35,11 @@ else
+     #start up the x server
+     echo "Start up the X server for test in display $DISPLAY................"
+ 
+-    $XORG_DIR/bin/X >/dev/null 2>&1 &
++    #$XORG_DIR/bin/X >/dev/null 2>&1 &
++    #sleep 8
++    #xterm &
++    /etc/init.d/xserver-nodm start &
+     sleep 8
+-    xterm &
+ fi
+     XLOG_FILE=/var/log/Xorg.0.log
+     [ -f $XORG_DIR/var/log/Xorg.0.log ] && XLOG_FILE=$XORG_DIR/var/log/Xorg.0.log
+@@ -54,7 +56,7 @@ fi
+         X_ERROR=1
+     fi
+ 
+-    XPID=$( ps ax | awk '{print $1, $5}' | egrep "X$|Xorg$" |grep -v grep| awk '{print $1}')
++    XPID=$( ps | awk '{print $1, $6}' | egrep "X$|Xorg$" |grep -v grep| awk '{print $1}')
+     if [ -z "$XPID" ]; then
+         echo "Start up X server FAIL!"
+  echo
+########
\ No newline at end of file
diff --git a/meta/lib/oeqa/manual/bsp-hw.json b/meta/lib/oeqa/manual/bsp-hw.json
new file mode 100644
index 0000000..a2b1d3e
--- /dev/null
+++ b/meta/lib/oeqa/manual/bsp-hw.json
@@ -0,0 +1,1200 @@
+[
+    {
+        "test": {
+            "@alias": "bsps-hw.bsps-tools.rpm_-__install_dependency_package",
+            "author": [
+                {
+                    "email": "alexandru.c.georgescu@intel.com",
+                    "name": "alexandru.c.georgescu@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "Get a not previously installed RPM package or build one on local machine, which should have run-time dependency.For example, \"mc\" (Midnight Commander, which is a visual file manager) should depend on \"ncurses-terminfo\".   \n\n$ bitbake mc  \n\n\n",
+                    "expected_results": ""
+                },
+                "2": {
+                    "action": "Copy the package into a system folder (for example /home/root/rpm_packages).  \n\n\n",
+                    "expected_results": ""
+                },
+                "3": {
+                    "action": "Run \"rpm -ivh package_name\" and check the output, for example \"rpm -ivh mc.rpm*\" should report the dependency on \"ncurses-terminfo\".\n\n\n\n",
+                    "expected_results": "3 . rpm command should report message when some RPM installation depends on other packages."
+                }
+            },
+            "summary": "rpm_-__install_dependency_package"
+        }
+    },
+    {
+        "test": {
+            "@alias": "bsps-hw.bsps-runtime.boot_and_install_from_USB",
+            "author": [
+                {
+                    "email": "alexandru.c.georgescu@intel.com",
+                    "name": "alexandru.c.georgescu@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "plugin usb which contains live image burned",
+                    "expected_results": "User can choose install system from usb stick onto harddisk from boot menu or command line option \n"
+                },
+                "2": {
+                    "action": "configure device BIOS to firstly boot from USB if necessary",
+                    "expected_results": "Installed system can boot up"
+                },
+                "3": {
+                    "action": "boot the device and select option \"Install\" from boot menu",
+                    "expected_results": ""
+                },
+                "4": {
+                    "action": "proceed through default install process",
+                    "expected_results": ""
+                },
+                "5": {
+                    "action": "Remove USB, and reboot into new installed system. \nNote:   If installation was successfully completed and received this message \"\"(sdx): Volume was not properly unmounted...Please run fsck.\"\" ignore it because this was whitelisted according to bug 9652.",
+                    "expected_results": ""
+                }
+            },
+            "summary": "boot_and_install_from_USB"
+        }
+    },
+    {
+        "test": {
+            "@alias": "bsps-hw.bsps-runtime.live_boot_from_USB",
+            "author": [
+                {
+                    "email": "juan.fernandox.ramos.frayle@intel.com",
+                    "name": "juan.fernandox.ramos.frayle@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "Plugin usb which contains live image burned.",
+                    "expected_results": "User can choose boot from live image on usb stick from boot menu or command line option"
+                },
+                "2": {
+                    "action": "Configure device BIOS to firstly boot from USB if necessary.",
+                    "expected_results": ""
+                },
+                "3": {
+                    "action": "Reboot the device and boot from USB stick.",
+                    "expected_results": "Live image can boot up with usb stick"
+                }				
+            },
+            "summary": "live_boot_from_USB"
+        }
+    },
+    {
+        "test": {
+            "@alias": "bsps-hw.bsps-runtime.boot_from_runlevel_3",
+            "author": [
+                {
+                    "email": "alexandru.c.georgescu@intel.com",
+                    "name": "alexandru.c.georgescu@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "Boot into system and edit /etc/inittab to make sure that system enter at the run level 3 by default, this is done by changing the line   \n\n\nid:5:initdefault  \n\nto  \n\nid:3:initdefault  \n\n",
+                    "expected_results": ""
+                },
+                "2": {
+                    "action": "Reboot system, and press \"Tab\" to enter \"grub\"",
+                    "expected_results": ""
+                },
+                "3": {
+                    "action": "Get into the \"kernel\" line with the edit option  \"e\" and add \"psplash=false text\" at the end line.",
+                    "expected_results": ""
+                },
+                "4": {
+                    "action": "Press \"F10\" or \"ctrl+x\" to boot system",
+                    "expected_results": ""
+                },
+                "5": {
+                    "action": "If system ask you for a login type \"root\"",
+                    "expected_results": "System should boot to run level 3, showing the command prompt."
+                }
+            },
+            "summary": "boot_from_runlevel_3"
+        }
+    },
+    {
+        "test": {
+            "@alias": "bsps-hw.bsps-runtime.boot_from_runlevel_5",
+            "author": [
+                {
+                    "email": "alexandru.c.georgescu@intel.com",
+                    "name": "alexandru.c.georgescu@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "Boot into system and edit /etc/inittab to make sure that system enter at the run level 5 by default, this is done by changing the line   \n\nid:3:initdefault  \n\nto  \n\nid:5:initdefault  \n\n",
+                    "expected_results": ""
+                },
+                "2": {
+                    "action": "Reboot system, and press \"Tab\" to enter \"grub\"",
+                    "expected_results": ""
+                },
+                "3": {
+                    "action": "Get into the \"kernel\" line with the edit option  \"e\" and add \"psplash=false text\" at the end line.",
+                    "expected_results": ""
+                },
+                "4": {
+                    "action": "Press \"F10\" or \"ctrl+x\" to boot system \nNote: The test is only for sato image.",
+                    "expected_results": "System should boot to runlevel 5 ."
+                }
+            },
+            "summary": "boot_from_runlevel_5"
+        }
+    },
+    {
+        "test": {
+            "@alias": "bsps-hw.bsps-runtime.shutdown_system",
+            "author": [
+                {
+                    "email": "alexandru.c.georgescu@intel.com",
+                    "name": "alexandru.c.georgescu@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "boot system",
+                    "expected_results": ""
+                },
+                "2": {
+                    "action": "launch terminal and run \"shutdown -h now\" or \"poweroff\"",
+                    "expected_results": "System can be shutdown successfully . "
+                }
+            },
+            "summary": "shutdown_system"
+        }
+    },
+    {
+        "test": {
+            "@alias": "bsps-hw.bsps-runtime.reboot_system",
+            "author": [
+                {
+                    "email": "alexandru.c.georgescu@intel.com",
+                    "name": "alexandru.c.georgescu@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "boot system",
+                    "expected_results": ""
+                },
+                "2": {
+                    "action": "launch terminal and run \"reboot\"",
+                    "expected_results": "System can reboot successfully . "
+                }
+            },
+            "summary": "reboot_system"
+        }
+    },
+    {
+        "test": {
+            "@alias": "bsps-hw.bsps-runtime.switch_among_multi_applications_and_desktop",
+            "author": [
+                {
+                    "email": "alexandru.c.georgescu@intel.com",
+                    "name": "alexandru.c.georgescu@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "launch several applications(like contacts, file manager, notes, etc)",
+                    "expected_results": "user could switch among multi applications and desktop"
+                },
+                "2": {
+                    "action": "launch terminal",
+                    "expected_results": ""
+                },
+                "3": {
+                    "action": "switch among multi applications and desktop",
+                    "expected_results": ""
+                },
+                "4": {
+                    "action": "close applications \nNote: The case is for sato image only. ",
+                    "expected_results": ""
+                }
+            },
+            "summary": "switch_among_multi_applications_and_desktop"
+        }
+    },
+    {
+        "test": {
+            "@alias": "bsps-hw.bsps-runtime.USB_-_mount",
+            "author": [
+                {
+                    "email": "alexandru.c.georgescu@intel.com",
+                    "name": "alexandru.c.georgescu@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "Boot system \n\n",
+                    "expected_results": ""
+                },
+                "2": {
+                    "action": "Plug USB stick, it should be mount in  /run/media/sd(x) If X-window system does not start and show USB device, then use the terminal to mount it, following the next steps: \na. Locate the usb stick (usually it is on /dev/sdb) \nb. Create a directory with \"mkdir stick\"  (so you will have such a path as: /home/root/stick). \nc. Run the command  \"mount  /dev/sdb  /home/root/stick\" to mount  USB device on it. \n\n",
+                    "expected_results": "USB device should be mounted in  /run/media/sd(x)  \nor in  /home/root/stick  \n\n"
+                },
+                "3": {
+                    "action": "Then you can access USB stick (/home/root/stick) via Terminal or GUI  and try various commands and actions like \"cp\", \"mv\", \"touch\" and \"rm\".  Type \"dmesg\" command and check for recent mounted devices.",
+                    "expected_results": "Basic commands work properly. The system sends a notification in \"dmesg\" command, showing that the USB stick is accessible and the device is mounted ."
+                }
+            },
+            "summary": "USB_-_mount"
+        }
+    },
+    {
+        "test": {
+            "@alias": "bsps-hw.bsps-runtime.USB_-_read_files",
+            "author": [
+                {
+                    "email": "alexandru.c.georgescu@intel.com",
+                    "name": "alexandru.c.georgescu@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "boot system",
+                    "expected_results": "view/copy successfully"
+                },
+                "2": {
+                    "action": "plug usb stick",
+                    "expected_results": ""
+                },
+                "3": {
+                    "action": "view files in usb by file browser",
+                    "expected_results": ""
+                },
+                "4": {
+                    "action": "copy some files from usb to local hardware",
+                    "expected_results": ""
+                }
+            },
+            "summary": "USB_-_read_files"
+        }
+    },
+    {
+        "test": {
+            "@alias": "bsps-hw.bsps-runtime.USB_-_umount",
+            "author": [
+                {
+                    "email": "alexandru.c.georgescu@intel.com",
+                    "name": "alexandru.c.georgescu@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "boot system",
+                    "expected_results": "usb directory in file browser automatically missed"
+                },
+                "2": {
+                    "action": "plug usb stick",
+                    "expected_results": ""
+                },
+                "3": {
+                    "action": "view files in usb by file browser \n4.unplug usb",
+                    "expected_results": ""
+                }
+            },
+            "summary": "USB_-_umount"
+        }
+    },
+    {
+        "test": {
+            "@alias": "bsps-hw.bsps-runtime.USB_-_write_files",
+            "author": [
+                {
+                    "email": "alexandru.c.georgescu@intel.com",
+                    "name": "alexandru.c.georgescu@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "boot system",
+                    "expected_results": "create/copy successfully"
+                },
+                "2": {
+                    "action": "plug usb stick",
+                    "expected_results": ""
+                },
+                "3": {
+                    "action": "create files in usb \n4.copy some files from local hardware to usb",
+                    "expected_results": ""
+                }
+            },
+            "summary": "USB_-_write_files"
+        }
+    },
+    {
+        "test": {
+            "@alias": "bsps-hw.bsps-runtime.ethernet_static_ip_set_in_connman",
+            "author": [
+                {
+                    "email": "alexandru.c.georgescu@intel.com",
+                    "name": "alexandru.c.georgescu@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "Boot the system and check internet connection is on . ",
+                    "expected_results": ""
+                },
+                "2": {
+                    "action": "Launch connmand-properties (up-right corner on desktop)",
+                    "expected_results": ""
+                },
+                "3": {
+                    "action": "Choose  Ethernet device and set a valid static ip address for it. \nFor example, in our internal network, we can set as following: \nip address: 10.239.48.xxx \nMask: 255.255.255.0 \nGateway (Broadcast): 10.239.48.255",
+                    "expected_results": ""
+                },
+                "4": {
+                    "action": "Check the Network configuration with \"ifconfig\"",
+                    "expected_results": "Static IP was set successfully  \n"
+                },
+                "5": {
+                    "action": "ping to another IP adress",
+                    "expected_results": "Ping works correclty\n"
+                }
+            },
+            "summary": "ethernet_static_ip_set_in_connman"
+        }
+    },
+    {
+        "test": {
+            "@alias": "bsps-hw.bsps-runtime.ethernet_get_IP_in_connman_via_DHCP",
+            "author": [
+                {
+                    "email": "alexandru.c.georgescu@intel.com",
+                    "name": "alexandru.c.georgescu@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "Launch connmand-properties (up-right corner on your desktop). ",
+                    "expected_results": ""
+                },
+                "2": {
+                    "action": "Check if Ethernet device can work properly with static IP, doing \"ping XXX.XXX.XXX.XXX\", once this is set.",
+                    "expected_results": "Ping executed successfully .  \n\n"
+                },
+                "3": {
+                    "action": "Then choose DHCP method for Ethernet device in connmand-properties.",
+                    "expected_results": ""
+                },
+                "4": {
+                    "action": "Check with 'ifconfig\" and \"ping\" if Ethernet device get IP address via DHCP.",
+                    "expected_results": "Ethernet device can get dynamic IP address via DHCP in connmand ."
+                }
+            },
+            "summary": "ethernet_get_IP_in_connman_via_DHCP"
+        }
+    },
+    {
+        "test": {
+            "@alias": "bsps-hw.bsps-tools.connman_offline_mode_in_connman-gnome",
+            "author": [
+                {
+                    "email": "alexandru.c.georgescu@intel.com",
+                    "name": "alexandru.c.georgescu@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "Launch connman-properties after system booting \n\n",
+                    "expected_results": ""
+                },
+                "2": {
+                    "action": "choose \"offline mode\" and check the connection of all network interfaces ",
+                    "expected_results": "All connection should be off after clicking \"offline mode\" . "
+                }
+            },
+            "summary": "connman_offline_mode_in_connman-gnome"
+        }
+    },
+    {
+        "test": {
+            "@alias": "bsps-hw.bsps-runtime.X_server_can_start_up_with_runlevel_5_boot",
+            "author": [
+                {
+                    "email": "alexandru.c.georgescu@intel.com",
+                    "name": "alexandru.c.georgescu@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "boot up system with default runlevel  \n\n",
+                    "expected_results": "X server can start up well and desktop display has no problem .  \n\n"
+                },
+                "2": {
+                    "action": "type runlevel at command prompt",
+                    "expected_results": "Output:N 5"
+                }
+            },
+            "summary": "X_server_can_start_up_with_runlevel_5_boot"
+        }
+    },
+    {
+        "test": {
+            "@alias": "bsps-hw.bsps-runtime.standby",
+            "author": [
+                {
+                    "email": "alexandru.c.georgescu@intel.com",
+                    "name": "alexandru.c.georgescu@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "boot system and launch terminal; check output of \"date\" and launch script \"continue.sh\"",
+                    "expected_results": ""
+                },
+                "2": {
+                    "action": "echo \"mem\" > /sys/power/state",
+                    "expected_results": ""
+                },
+                "3": {
+                    "action": "After system go into S3 mode, move mouse or press any key to make it resume (on NUC press power button)",
+                    "expected_results": ""
+                },
+                "4": {
+                    "action": "Check \"date\" and script \"continue.sh\"",
+                    "expected_results": ""
+                },
+                "5": {
+                    "action": "Check if application can work as normal \ncontinue.sh as below: \n \n#!/bin/sh \n \ni=1 \nwhile [ 0 ] \ndo \n echo $i \n sleep 1 \n i=$((i+1)) \ndone ",
+                    "expected_results": "Screen should resume back and script can run continuously incrementing the i's value from where it was before going to standby state. Date should be the same with the corresponding time increment."
+                }
+            },
+            "summary": "standby"
+        }
+    },
+    {
+        "test": {
+            "@alias": "bsps-hw.bsps-runtime.check_CPU_utilization_after_standby",
+            "author": [
+                {
+                    "email": "alexandru.c.georgescu@intel.com",
+                    "name": "alexandru.c.georgescu@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "Start up system",
+                    "expected_results": ""
+                },
+                "2": {
+                    "action": "run \"top\" command and check if there is any process eating CPU time",
+                    "expected_results": ""
+                },
+                "3": {
+                    "action": "make system into standby and resume it",
+                    "expected_results": ""
+                },
+                "4": {
+                    "action": "run \"top\" command and check if there is any difference with the data before standby",
+                    "expected_results": "There should be no big difference before/after standby with \"top\" . "
+                }
+            },
+            "summary": "check_CPU_utilization_after_standby"
+        }
+    },
+    {
+        "test": {
+            "@alias": "bsps-hw.bsps-runtime.Test_if_LAN_device_works_well_after_resume_from_suspend_state",
+            "author": [
+                {
+                    "email": "alexandru.c.georgescu@intel.com",
+                    "name": "alexandru.c.georgescu@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "boot system and launch terminal",
+                    "expected_results": ""
+                },
+                "2": {
+                    "action": "echo \"mem\" > /sys/power/state",
+                    "expected_results": ""
+                },
+                "3": {
+                    "action": "After system go into S3 mode, move mouse or press any key to make it resume",
+                    "expected_results": ""
+                },
+                "4": {
+                    "action": "check ping status  \n\nNote: This TC apply only for core-image-full-cmd and core-image-lsb .",
+                    "expected_results": "ping should always work before/after standby"
+                }
+            },
+            "summary": "Test_if_LAN_device_works_well_after_resume_from_suspend_state"
+        }
+    },
+    {
+        "test": {
+            "@alias": "bsps-hw.bsps-runtime.Test_if_usb_hid_device_works_well_after_resume_from_suspend_state",
+            "author": [
+                {
+                    "email": "alexandru.c.georgescu@intel.com",
+                    "name": "alexandru.c.georgescu@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "boot system and launch terminal",
+                    "expected_results": ""
+                },
+                "2": {
+                    "action": "echo \"mem\" > /sys/power/state",
+                    "expected_results": ""
+                },
+                "3": {
+                    "action": "After system go into S3 mode, resume the device by pressing the power button or using HID devices",
+                    "expected_results": "Devices resumes "
+                },
+                "4": {
+                    "action": "check usb mouse and keyboard",
+                    "expected_results": "Usb mouse and keyboard should work"
+                }
+            },
+            "summary": "Test_if_usb_hid_device_works_well_after_resume_from_suspend_state"
+        }
+    },
+    {
+        "test": {
+            "@alias": "bsps-hw.bsps-tools.click_terminal_icon_on_X_desktop",
+            "author": [
+                {
+                    "email": "alexandru.c.georgescu@intel.com",
+                    "name": "alexandru.c.georgescu@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "After system launch and X start up, click terminal icon on desktop",
+                    "expected_results": ""
+                },
+                "2": {
+                    "action": "Check if only one terminal window launched and no other problem met",
+                    "expected_results": "There should be no problem after launching terminal . "
+                }
+            },
+            "summary": "click_terminal_icon_on_X_desktop"
+        }
+    },
+    {
+        "test": {
+            "@alias": "bsps-hw.bsps-tools.Add_multiple_files_in_media_player",
+            "author": [
+                {
+                    "email": "alexandru.c.georgescu@intel.com",
+                    "name": "alexandru.c.georgescu@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "Launch media player",
+                    "expected_results": ""
+                },
+                "2": {
+                    "action": "Add multiple files(5 files) in media player at same time (ogg or wav)",
+                    "expected_results": ""
+                },
+                "3": {
+                    "action": "Verify the sound.",
+                    "expected_results": "Media player should be OK with this action, it reproduce files correctly."
+                }
+            },
+            "summary": "Add_multiple_files_in_media_player"
+        }
+    },
+    {
+        "test": {
+            "@alias": "bsps-hw.bsps-runtime.check_bash_in_image",
+            "author": [
+                {
+                    "email": "alexandru.c.georgescu@intel.com",
+                    "name": "alexandru.c.georgescu@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "After system is up, check if bash command exists with command \"which bash\"",
+                    "expected_results": "bash command should exist in image giving something as below  \"/bin/bash\""
+                }
+            },
+            "summary": "check_bash_in_image"
+        }
+    },
+    {
+        "test": {
+            "@alias": "bsps-hw.bsps-runtime.MicroSD_-__mount",
+            "author": [
+                {
+                    "email": "alexandru.c.georgescu@intel.com",
+                    "name": "alexandru.c.georgescu@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "boot system",
+                    "expected_results": "system notify that MicroSDis accessible"
+                },
+                "2": {
+                    "action": "plug MicroSD card",
+                    "expected_results": ""
+                }
+            },
+            "summary": "MicroSD_-__mount"
+        }
+    },
+    {
+        "test": {
+            "@alias": "bsps-hw.bsps-runtime.MicroSD_-__read_files",
+            "author": [
+                {
+                    "email": "alexandru.c.georgescu@intel.com",
+                    "name": "alexandru.c.georgescu@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "boot system",
+                    "expected_results": "view/copy successfully"
+                },
+                "2": {
+                    "action": "plug MicroSD card",
+                    "expected_results": ""
+                },
+                "3": {
+                    "action": "view files inMicroSD by file browser",
+                    "expected_results": ""
+                },
+                "4": {
+                    "action": "copy some files fromMicroSD to local hardware",
+                    "expected_results": ""
+                }
+            },
+            "summary": "MicroSD_-__read_files"
+        }
+    },
+    {
+        "test": {
+            "@alias": "bsps-hw.bsps-runtime.MicroSD_-__umount",
+            "author": [
+                {
+                    "email": "alexandru.c.georgescu@intel.com",
+                    "name": "alexandru.c.georgescu@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "boot system",
+                    "expected_results": "MicroSD in file browser automatically missed . "
+                },
+                "2": {
+                    "action": "plug MicroSD card",
+                    "expected_results": ""
+                },
+                "3": {
+                    "action": "view files in MicroSDby file browser",
+                    "expected_results": ""
+                },
+                "4": {
+                    "action": "unplug MicroSD",
+                    "expected_results": ""
+                }				
+            },
+            "summary": "MicroSD_-__umount"
+        }
+    },
+    {
+        "test": {
+            "@alias": "bsps-hw.bsps-runtime.MicroSD_-__write_files",
+            "author": [
+                {
+                    "email": "alexandru.c.georgescu@intel.com",
+                    "name": "alexandru.c.georgescu@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "boot system",
+                    "expected_results": "create/copy successfully"
+                },
+                "2": {
+                    "action": "plug MicroSD card",
+                    "expected_results": ""
+                },
+                "3": {
+                    "action": "create files in MicroSD",
+                    "expected_results": ""
+                },
+                "4": {
+                    "action": "copy some files from local hardware to MicroSD",
+                    "expected_results": ""
+                }
+            },
+            "summary": "MicroSD_-__write_files"
+        }
+    },
+    {
+        "test": {
+            "@alias": "bsps-hw.bsps-tools.video_-_libva_check_(ogg_video_play)",
+            "author": [
+                {
+                    "email": "alexandru.c.georgescu@intel.com",
+                    "name": "alexandru.c.georgescu@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "check if libva is installed on system (or libogg)",
+                    "expected_results": ""
+                },
+                "2": {
+                    "action": "copy sample ogg file to system",
+                    "expected_results": ""
+                },
+                "3": {
+                    "action": "launch media player can play the ogg file",
+                    "expected_results": "ogg file can be played without problem when libva is used (or libogg) "
+                }
+            },
+            "summary": "video_-_libva_check_(ogg_video_play)"
+        }
+    },
+    {
+        "test": {
+            "@alias": "bsps-hw.bsps-tools.media_player_-_unable_to_play_MPEG-1_without_\"commercial\"_flag",
+            "author": [
+                {
+                    "email": "alexandru.c.georgescu@intel.com",
+                    "name": "alexandru.c.georgescu@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "Copy sample MPEG-1 file to a system without the \"commercial\" flag.",
+                    "expected_results": ""
+                },
+                "2": {
+                    "action": "Launch media player and make sure it cannot play the MPEG-1 file.",
+                    "expected_results": "MPEG-1 file can not be played on images without the \"commercial\" flag. "
+                }
+            },
+            "summary": "media_player_-_unable_to_play_MPEG-1_without_\"commercial\"_flag"
+        }
+    },
+    {
+        "test": {
+            "@alias": "bsps-hw.bsps-tools.media_player_-_play_video_(ogv)",
+            "author": [
+                {
+                    "email": "alexandru.c.georgescu@intel.com",
+                    "name": "alexandru.c.georgescu@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "copy sample ogv file to system",
+                    "expected_results": ""
+                },
+                "2": {
+                    "action": "launch media player and make sure it can play the ogv file",
+                    "expected_results": "ogv file can be played without problem"
+                }
+            },
+            "summary": "media_player_-_play_video_(ogv)"
+        }
+    },
+    {
+        "test": {
+            "@alias": "bsps-hw.bsps-tools.media_player_-_stop/play_button_(ogv)",
+            "author": [
+                {
+                    "email": "alexandru.c.georgescu@intel.com",
+                    "name": "alexandru.c.georgescu@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "copy sample ogv file to system",
+                    "expected_results": ""
+                },
+                "2": {
+                    "action": "launch media player can play the ogv file",
+                    "expected_results": ""
+                },
+                "3": {
+                    "action": "click \"stop\" button to stop playing",
+                    "expected_results": ""
+                },
+                "4": {
+                    "action": "click \"start\" button to resume playing",
+                    "expected_results": "ogv file can be start/stop without problem"
+                }
+            },
+            "summary": "media_player_-_stop/play_button_(ogv)"
+        }
+    },
+    {
+        "test": {
+            "@alias": "bsps-hw.bsps-tools.audio_-_play_(ogg)_with_HDMI",
+            "author": [
+                {
+                    "email": "alexandru.c.georgescu@intel.com",
+                    "name": "alexandru.c.georgescu@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "copy sample ogg file to system",
+                    "expected_results": ""
+                },
+                "2": {
+                    "action": "connect system with a monitor with HDMI",
+                    "expected_results": ""
+                },
+                "3": {
+                    "action": "launch media player and play the ogg file",
+                    "expected_results": "ogg file can be played without problem with HDMI"
+                }
+            },
+            "summary": "audio_-_play_(ogg)_with_HDMI"
+        }
+    },
+    {
+        "test": {
+            "@alias": "bsps-hw.bsps-tools.audio_-_play_(wav)_with_HDMI",
+            "author": [
+                {
+                    "email": "alexandru.c.georgescu@intel.com",
+                    "name": "alexandru.c.georgescu@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "copy sample wav file to system",
+                    "expected_results": ""
+                },
+                "2": {
+                    "action": "connect system with a monitor with HDMI",
+                    "expected_results": ""
+                },
+                "3": {
+                    "action": "launch media player and play the wav file",
+                    "expected_results": "wav file can be played without problem, with HDMI"
+                }
+            },
+            "summary": "audio_-_play_(wav)_with_HDMI"
+        }
+    },
+    {
+        "test": {
+            "@alias": "bsps-hw.bsps-tools.Graphics_-_ABAT",
+            "author": [
+                {
+                    "email": "alexandru.c.georgescu@intel.com",
+                    "name": "alexandru.c.georgescu@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "Download ABAT test suite from internal git repository, git clone git://tinderbox.sh.intel.com/git/abat",
+                    "expected_results": ""
+                },
+                "2": {
+                    "action": "Apply following patch to make it work on yocto environment",
+                    "expected_results": ""
+                },
+                "3": {
+                    "action": "Run \"./abat.sh\" to run ABAT test refer to abat.patch",
+                    "expected_results": "All ABAT test should pass. \nNote : If below 3 fails appears ignore them. \n- start up X server fail.. due is already up \n- module [intel_agp] \n- module [i915]"
+                }
+            },
+            "summary": "Graphics_-_ABAT"
+        }
+    },
+    {
+        "test": {
+            "@alias": "bsps-hw.bsps-tools.Graphics_-_x11perf_-_2D",
+            "author": [
+                {
+                    "email": "alexandru.c.georgescu@intel.com",
+                    "name": "alexandru.c.georgescu@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "Run \"x11perf -aa10text\" and \"x11perf -rgb10text\"",
+                    "expected_results": ""
+                },
+                "2": {
+                    "action": "Get the FPS result and compare it with upstream graphics data on Sandybridge",
+                    "expected_results": "There should not be big regression between Yocto and upstream linux . "
+                }
+            },
+            "summary": "Graphics_-_x11perf_-_2D"
+        }
+    },
+    {
+        "test": {
+            "@alias": "bsps-hw.bsps-oe-core.Test_Run_Integrity_-_Check_that_image_is_buildable",
+            "author": [
+                {
+                    "email": "corneliux.stoicescu@intel.com",
+                    "name": "corneliux.stoicescu@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "Check that image can be built using either of the following methods:  \n\n",
+                    "expected_results": ""
+                },
+                "2": {
+                    "action": "Check that image is built by autobuilder \nPlease check at: https://autobuilder.yocto.io/pub/releases/ \nChoose the target release that you are validating.  \n\n",
+                    "expected_results": ""
+                },
+                "3": {
+                    "action": "Build image yourself \nPreferred to build an core-image-sato-dev to ease the process of the dependent test cases in this run. \nNote: Please set MACHINE in conf/local.conf ",
+                    "expected_results": "If either method fails, this test case will be failed and dependent test cases will be blocked. "
+                }
+            },
+            "summary": "Test_Run_Integrity_-_Check_that_image_is_buildable"
+        }
+    },
+    {
+        "test": {
+            "@alias": "bsps-hw.bsps-runtime.Check_if_SATA_disk_can_work_correctly",
+            "author": [
+                {
+                    "email": "yi.zhao@windriver.com",
+                    "name": "yi.zhao@windriver.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "Run fdisk command to create partition on SATA disk. ",
+                    "expected_results": "The SATA device can mount, umount, read and write. "
+                },
+                "2": {
+                    "action": "Mount/Umount \n  mke2fs /dev/sda1 \n  mount -t ext2 /dev/sda1 /mnt/disk  \n  umount /mnt/disk",
+                    "expected_results": ""
+                },
+                "3": {
+                    "action": "Read/Write (filesystem) \n  touch /mnt/disk/test.txt \n  echo abcd > /mnt/disk/test.txt \n  cat /mnt/disk/test.txt",
+                    "expected_results": ""
+                },
+                "4": {
+                    "action": "Read/Write (raw) \n  dd if=/dev/sda1 of=/tmp/test bs=1k count=1k  \n  This command will read 1MB from /dev/sda1 to /tmp/test",
+                    "expected_results": ""
+                }
+            },
+            "summary": "Check_if_SATA_disk_can_work_correctly"
+        }
+    },
+    {
+        "test": {
+            "@alias": "bsps-hw.bsps-runtime.Install_and_boot_from_USB-drive_to_HDD-drive",
+            "author": [
+                {
+                    "email": "david.israelx.rodriguez.castellanos@intel.com",
+                    "name": "david.israelx.rodriguez.castellanos@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "Get a HDD drive.",
+                    "expected_results": "User can choose install system from USB stick on HDD drive from boot menu or command line option \n"
+                },
+                "2": {
+                    "action": "Plugin USB which contains live image burned (USB1).",
+                    "expected_results": "Installed system can boot up."
+                },
+                "3": {
+                    "action": "Configure device BIOS to firstly boot from USB if necessary",
+                    "expected_results": ""
+                },
+                "4": {
+                    "action": "Boot the device and select option \"Install\"  from boot menu.",
+                    "expected_results": ""
+                },
+                "5": {
+                    "action": "Make sure that the divice in which image is going to be installed is the HDD drive.",
+                    "expected_results": ""
+                },
+                "6": {
+                    "action": "Proceed through default install process.",
+                    "expected_results": ""
+                },
+                "7": {
+                    "action": "Remove USB1, and reboot into new installed system.",
+                    "expected_results": ""
+                }
+            },
+            "summary": "Install_and_boot_from_USB-drive_to_HDD-drive"
+        }
+    },
+    {
+        "test": {
+            "@alias": "bsps-hw.bsps-runtime.Install_and_boot_from_USB-drive_to_SD-drive",
+            "author": [
+                {
+                    "email": "david.israelx.rodriguez.castellanos@intel.com",
+                    "name": "david.israelx.rodriguez.castellanos@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "Get a SD-drive with enough free space to install an image.",
+                    "expected_results": "User can choose install system from USB stick on SD-drive from boot menu or command line option. \n"
+                },
+                "2": {
+                    "action": "Plugin USB which contains live image burned (USB1).",
+                    "expected_results": "Installed system can boot up."
+                },
+                "3": {
+                    "action": "Configure device BIOS to firstly boot from USB if necessary",
+                    "expected_results": ""
+                },
+                "4": {
+                    "action": "Boot the device and select option \"Install\"  from boot menu.",
+                    "expected_results": ""
+                },
+                "5": {
+                    "action": "Make sure that the device in which image is going to be installed is the SD-drive.",
+                    "expected_results": ""
+                },
+                "6": {
+                    "action": "Proceed through default install process.",
+                    "expected_results": ""
+                },
+                "7": {
+                    "action": "Remove USB1, and reboot into new installed system.",
+                    "expected_results": ""
+                }
+            },
+            "summary": "Install_and_boot_from_USB-drive_to_SD-drive"
+        }
+    },
+    {
+        "test": {
+            "@alias": "bsps-hw.bsps-runtime.Test_boot_on_serial_communication_SD",
+            "author": [
+                {
+                    "email": "juan.fernandox.ramos.frayle@intel.com",
+                    "name": "juan.fernandox.ramos.frayle@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "1.- Create a yocto project image in a SD card \nexample \n2 - Configure a connection like shown in the link avobe: \nhttps://wiki.yoctoproject.org/wiki/MinnowMax_board_Serial_video_connection_guide \n3 - Verify the Minow Max board is connected to the host \n4 - Boot the system to desktop \n5 - Open a Terminal and check the IP  \nIn Terminal type $ifconfig\"",
+                    "expected_results": "Verify you can create a live image  \n"
+                }
+            },
+            "summary": "Test_boot_on_serial_communication_SD"
+        }
+    },
+    {
+        "test": {
+            "@alias": "bsps-hw.bsps-runtime.Test_boot_on_serial_communication_HDD",
+            "author": [
+                {
+                    "email": "juan.fernandox.ramos.frayle@intel.com",
+                    "name": "juan.fernandox.ramos.frayle@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "1 - Create a yocto project image in a HDD \nexample \n2 - Configure a connection like shown in the link avobe: \nhttps://wiki.yoctoproject.org/wiki/MinnowMax_board_Serial_video_connection_guide \n3 - Verify the Minow Max board is connected to the host \n4 - Boot the system to desktop \n5 - Open a Terminal and check the IP  \nIn Terminal type $ifconfig\"> ",
+                    "expected_results": "Verify you can create a live image  \n"
+                }
+            },
+            "summary": "Test_boot_on_serial_communication_HDD"
+        }
+    },
+    {
+        "test": {
+            "@alias": "bsps-hw.bsps-runtime.Test_boot_on_serial_communication_USB",
+            "author": [
+                {
+                    "email": "juan.fernandox.ramos.frayle@intel.com",
+                    "name": "juan.fernandox.ramos.frayle@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "1.- Create a yocto project image in a USB \nexample <dd if= core-image-sato-sdk.hddimg of =/dev/sdb>",
+                    "expected_results": "Verify you can create a live image  \n"
+                },
+                "2": {
+                    "action": "Configure a connection like shown in the link avobe: \nhttps://wiki.yoctoproject.org/wiki/MinnowMax_board_Serial_video_connection_guide\n\n",
+                    "expected_results": "Video signal is present and not delayed \n"
+                },
+                "3": {
+                    "action": " Verify the Minow Max board is connected to the host",
+                    "expected_results": "Verify the system boot ok and no errors are present \n"
+                },
+                "4": {
+                    "action": " Boot the system to desktop",
+                    "expected_results": " Check that a valid IP is retrieved"
+                },
+                "5": {
+                    "action": " Open a Terminal and check the IP  \nIn Terminal type $ifconfig\" ",
+                    "expected_results": ""
+                }
+            },
+            "summary": "Test_boot_on_serial_communication_USB"
+        }
+    },
+    {
+        "test": {
+            "@alias": "bsps-hw.bsps-runtime.Test_Seek_bar_and_volume_control",
+            "author": [
+                {
+                    "email": "juan.fernandox.ramos.frayle@intel.com",
+                    "name": "juan.fernandox.ramos.frayle@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "Run media player and load a media file ",
+                    "expected_results": "Media player correctly open audio/video file \n"
+                },
+                "2": {
+                    "action": "Verify that seek and volume control are present ",
+                    "expected_results": "Seek bar and volume control are present \n"
+                },
+                "3": {
+                    "action": "Verify that selecting the speaker icon opens the volume control",
+                    "expected_results": "Volume control bar must appear \n"
+                },
+                "4": {
+                    "action": "Verify you can increase and decrease volume level with the volume control",
+                    "expected_results": "Volume level must be increased and decreased \n"
+                },
+                "5": {
+                    "action": "Observe that slider on the seek bar moves along with the video/audio play",
+                    "expected_results": "Video/audio file can be played and slider moves along with the video/audio play \n"
+                },
+                "6": {
+                    "action": "Verify you can navigate the video with the slider back and forward",
+                    "expected_results": "The slider can move back and forward in the seek bar \n"
+                },
+                "7": {
+                    "action": "Verify that seek and volume control are functional in full screen mode",
+                    "expected_results": "Press the full screen mode icon, seek bar and volume control must work fine \n"
+                },
+                "8": {
+                    "action": "Verify that pressing << or >> while playing a file makes the slide goes slow/backwards or faster",
+                    "expected_results": "Verify << and >> works correctly"
+                }
+            },
+            "summary": "Test_Seek_bar_and_volume_control"
+        }
+    }
+]
\ No newline at end of file
diff --git a/meta/lib/oeqa/manual/bsp-qemu.json b/meta/lib/oeqa/manual/bsp-qemu.json
new file mode 100644
index 0000000..cfb39e3
--- /dev/null
+++ b/meta/lib/oeqa/manual/bsp-qemu.json
@@ -0,0 +1,222 @@
+[
+  {
+    "test": {
+      "@alias": "bsps-qemu.bsps-tools.qemu_can_be_started_with_KVM_enabled",
+      "author": [
+        {
+          "email": "alexandru.c.georgescu@intel.com",
+          "name": "alexandru.c.georgescu@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Build a kernel with KVM enabled  \n\nIn Local.conf add  \n\nQEMU_USE_KVM = \"${@ 'intel-corei7-64 intel-core2-32 qemux86 qemux86-64' if os.access('/dev/kvm', os.R_OK|os.W_OK) else '' }\"  \n\n ",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "Start qemu with option \"kvm\" with runqemu \n    a. If you start qemu with kvm failed, maybe it is because host not install kvm and vhost_net module. Follow below link to install them. \n    b. vhost_test refer:  https://wiki.yoctoproject.org/wiki/Running_an_x86_Yocto_Linux_image_under_QEMU_KVM \n    c. kvm refer: https://wiki.yoctoproject.org/wiki/How_to_enable_KVM_for_Poky_qemu",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "Check if qemu starts up and if kvm_intel module is used",
+          "expected_results": ""
+        },
+        "4": {
+          "action": "If kvm_intel module is not used when starting qemu, it will show 0 in \"Used by\" column when you run \"lsmod | grep kvm_intel\" ",
+          "expected_results": "KVM enabled with qemu \nExecute \"lsmod | grep kvm_intel\" from your host twice, before and after you \nstart the qemu with kvm option. Before start, the number should be 0, \nafter start, the number should bigger than 0."
+        }
+      },
+      "summary": "qemu_can_be_started_with_KVM_enabled"
+    }
+  },
+  {
+    "test": {
+      "@alias": "bsps-qemu.bsps-tools.Post-installation_logging",
+      "author": [
+        {
+          "email": "yi.zhao@windriver.com",
+          "name": "yi.zhao@windriver.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Download the poky source and set environment \n",
+          "expected_results": "The /var/log/postinstall.log should exist in the first boot. The content of this log is like below:  \n\nRunning postinst /etc/rpm-postinsts/man... \nList directory to check the output log \nbin \nboot \ndev \netc \nhome \nlib \nlost+found \nmedia \nmnt \nproc \nrun \nsbin \nsys \ntmp \nusr \nvar \nList nonexist directory to check the stderr redirection log \nls: /nonexist: No such file or directory "
+        },
+        "2": {
+          "action": "Add the following lines to a .bb file. For expample, meta/recipes-connectivity/openssh/openssh_6.2p2.bb:   \n\npkg_postinst_ontarget_${PN} () {  \n       #!/bin/sh -e  \n       if [ x\"$D\" = \"x\" ]; then  \n       echo \"List directory to check the output log\"  \n       ls /  \n       echo \"List nonexist directory to check the stderr redirection log\"  \n       ls /nonexist  \n       else  \n       exit 1  \n       fi  \n}  \n\nMake sure the feature \"debug-tweaks\" is added in conf/local.conf \n",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "Add ssh-server-openssh to EXTRA_IMAGE_FEATURES in local.conf \n",
+          "expected_results": ""
+        },
+        "4": {
+          "action": "Build core-image-minimal \n",
+          "expected_results": ""
+        },
+        "5": {
+          "action": "Boot up the image and check the /var/log/postinstall.log  ",
+          "expected_results": ""
+        }
+      },
+      "summary": "Post-installation_logging"
+    }
+  },
+  {
+    "test": {
+      "@alias": "bsps-qemu.bsps-tools.Add_user_with_cleartext_type_password_during_filesystem_construction",
+      "author": [
+        {
+          "email": "ke.zou@windriver.com",
+          "name": "ke.zou@windriver.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Download the poky source and set the environment  \n\n",
+          "expected_results": "No error during image building procedure. \n"
+        },
+        "2": {
+          "action": "Add the following lines in conf/local.conf  \n\nINHERIT += \"extrausers\"  \n\nEXTRA_USERS_PARAMS = \"\\ \nuseradd -s /bin/sh -P 'tester3' tester3;\\ \n\"  \n\nThe above settings do the following things: \na. Add a user tester3 with cleartext password 'tester3' ",
+          "expected_results": "Image can boot up \n"
+        },
+        "3": {
+          "action": "Build the image\n ",
+          "expected_results": "Login with user name \"tester3\" and password \"tester3\" "
+        }
+      },
+      "summary": "Add_user_with_cleartext_type_password_during_filesystem_construction"
+    }
+  },
+  {
+    "test": {
+      "@alias": "bsps-qemu.bsps-tools.rpm_-__install_dependency_package",
+      "author": [
+        {
+          "email": "alexandru.c.georgescu@intel.com",
+          "name": "alexandru.c.georgescu@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Get a not previously installed RPM package or build one on local machine, which should have run-time dependency.For example, \"mc\" (Midnight Commander, which is a visual file manager) should depend on \"ncurses-terminfo\".   \n\n$ bitbake mc  \n\n\n",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "Copy the package into a system folder (for example /home/root/rpm_packages).  \n\n\n",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "Run \"rpm -ivh package_name\" and check the output, for example \"rpm -ivh mc.rpm*\" should report the dependency on \"ncurses-terminfo\".\n\n\n\n",
+          "expected_results": "3 . rpm command should report message when some RPM installation depends on other packages."
+        }
+      },
+      "summary": "rpm_-__install_dependency_package"
+    }
+  },
+  {
+    "test": {
+      "@alias": "bsps-qemu.bsps-tools.Check_rpm_install/removal_log_file_size(auto)",
+      "author": [
+        {
+          "email": "alexandru.c.georgescu@intel.com",
+          "name": "alexandru.c.georgescu@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Get some rpm or other kind of installation packages.  \n\n",
+          "expected_results": "Steps 1- 4 (more than 2.3) \nEach file will occupy around 10MB, and there should be some method to keep rpm log in a small size. (the size of the db of RPMs must not be taking so much space)  \nStep 5 (less than or equal to 2.3)\nThe size on /var/lib/rpm/ must keep around 30MB"
+        },
+        "2": {
+          "action": "After system is up, check the size of log file named as \"log.xxxxxx\" on  /var/lib/rpm/log  \n\n",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "After several install/removal of packages, with either of the install/removal commands   (rpm/smart/zypper/dnf install/removal), check again the size of log file.  \n\n",
+          "expected_results": ""
+        },
+        "4": {
+          "action": "For packages installation, there will be some database files under /var/lib/rpm/, named as \"__db.xxx\" and there will be some log files   \nunder /var/lib/rpm/log, named as \"\"log.xxxxxx\"\".   \n\nNote: You will only see the log.xxxx on /var/lib/rpm/log mentioned above if the poky version is minor than 2.3.For poky 2.3 or major versions this has been modified and the package RPM4 does not show the logs.xxxx. if major, follow the next step.  \n\n",
+          "expected_results": ""
+        },
+        "5": {
+          "action": "Repeat steps (1 and 3)  and check the size of /var/lib/rpm/  \n\nMore info: https://bugzilla.yoctoproject.org/show_bug.cgi?id=9259",
+          "expected_results": ""
+        }
+      },
+      "summary": "Check_rpm_install/removal_log_file_size"
+    }
+  },
+  {
+    "test": {
+      "@alias": "bsps-qemu.bsps-runtime.only_one_connmand_in_background(auto)",
+      "author": [
+        {
+          "email": "alexandru.c.georgescu@intel.com",
+          "name": "alexandru.c.georgescu@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Boot system",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "Run \"ps aux |grep connmand\" or \"ps -ef | grep connmand\" or \"ps | grep connmand\"",
+          "expected_results": "Connmand (connection manager, used to manage internet connections)  should be shown as an active process \n\n"
+        },
+        "3": {
+          "action": "Run command \"connmand\" to try to launch to a second connmand process",
+          "expected_results": ""
+        },
+        "4": {
+          "action": "Check, with \"ps\" connmand  if a second connmand can be generated ",
+          "expected_results": "There should be only one connmand process instance in background ."
+        }
+      },
+      "summary": "only_one_connmand_in_background"
+    }
+  },
+  {
+    "test": {
+      "@alias": "bsps-qemu.bsps-runtime.X_server_can_start_up_with_runlevel_5_boot",
+      "author": [
+        {
+          "email": "alexandru.c.georgescu@intel.com",
+          "name": "alexandru.c.georgescu@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "boot up system with default runlevel  \n\n",
+          "expected_results": "X server can start up well and desktop display has no problem .  \n\n"
+        },
+        "2": {
+          "action": "type runlevel at command prompt",
+          "expected_results": "Output:N 5"
+        }
+      },
+      "summary": "X_server_can_start_up_with_runlevel_5_boot"
+    }
+  },
+  {
+    "test": {
+      "@alias": "bsps-qemu.bsps-runtime.check_bash_in_image",
+      "author": [
+        {
+          "email": "alexandru.c.georgescu@intel.com",
+          "name": "alexandru.c.georgescu@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "After system is up, check if bash command exists with command \"which bash\"",
+          "expected_results": "bash command should exist in image giving something as below  \"/bin/bash\""
+        }
+      },
+      "summary": "check_bash_in_image"
+    }
+  }
+]
\ No newline at end of file
diff --git a/meta/lib/oeqa/manual/build-appliance.json b/meta/lib/oeqa/manual/build-appliance.json
new file mode 100644
index 0000000..b8f8927
--- /dev/null
+++ b/meta/lib/oeqa/manual/build-appliance.json
@@ -0,0 +1,122 @@
+[
+    {
+        "test": {
+            "@alias": "build-appliance.build-appliance.Bitbake_build-appliance-image",
+            "author": [
+                {
+                    "email": "alexandru.c.georgescu@intel.com",
+                    "name": "alexandru.c.georgescu@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "Get poky source code and prepare the build environment",
+                    "expected_results": "bitbake build-appliance-image is successful  "
+                },
+                "2": {
+                    "action": "Set MACHINE to qemux86 and add the following line to conf/local.conf :  SRCREV_pn-build-appliance-image = \"${AUTOREV}\"",
+                    "expected_results": ""
+                },
+                "3": {
+                    "action": "Run \"bitbake build-appliance-image\" \n \n",
+                    "expected_results": ""
+                }
+            },
+            "summary": "Bitbake_build-appliance-image"
+        }
+    },
+    {
+        "test": {
+            "@alias": "build-appliance.build-appliance.Build_core-image-minimal_with_build-appliance-image",
+            "author": [
+                {
+                    "email": "corneliux.stoicescu@intel.com",
+                    "name": "corneliux.stoicescu@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "Build with AUTOREV or download from Autobuilder an image for Yocto Build Appliance.  ",
+                    "expected_results": ""
+                },
+                "2": {
+                    "action": "Boot the image under VMWare Player.  ",
+                    "expected_results": ""
+                },
+                "3": {
+                    "action": "Build qemux86 core-image-minimal using bitbake command line in the build-appliance-image  ",
+                    "expected_results": ""
+                },
+                "4": {
+                    "action": "Launch the image just built using runqemu.  ",
+                    "expected_results": "core-image-minimal should build and boot. "
+                }
+            },
+            "summary": "Build_core-image-minimal_with_build-appliance-image"
+        }
+    },
+    {
+        "test": {
+            "@alias": "build-appliance.build-appliance.Build_a_image_without_error_(added_recipe)",
+            "author": [
+                {
+                    "email": "sstncr@gmail.com",
+                    "name": "sstncr@gmail.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "Launch Build Appliance",
+                    "expected_results": "User could build a image without error and the added package is in the image"
+                },
+                "2": {
+                    "action": "Set \"Machine\" in conf/local.conf, for example, qemuarm",
+                    "expected_results": ""
+                },
+                "3": {
+                    "action": "Install a new package to the image, for example, acpid. Set the following line in conf/local.conf: IMAGE_INSTALL_append = \" acpid\"",
+                    "expected_results": ""
+                },
+                "4": {
+                    "action": "Build a image using bitbake command line, for example, bitbake core-image-minimal",
+                    "expected_results": ""
+                },
+                "5": {
+                    "action": "After build finished, launch the image and check if the added package built into image",
+                    "expected_results": ""
+                }
+            },
+            "summary": "Build_a_image_without_error_(added_recipe)."
+        }
+    },
+    {
+        "test": {
+            "@alias": "build-appliance.build-appliance.Create_core-image-sato-sdk_using_build_appliance",
+            "author": [
+                {
+                    "email": "ee.peng.yeoh@intel.com",
+                    "name": "ee.peng.yeoh@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "Build with AUTOREV or download from Autobuilder an image for Yocto Build Appliance.  ",
+                    "expected_results": ""
+                },
+                "2": {
+                    "action": "Boot the image under VMWare Player.  ",
+                    "expected_results": ""
+                },
+                "3": {
+                    "action": "Build qemux86 core-image-sato-sdk using bitbake command line in the build-appliance-image  ",
+                    "expected_results": ""
+                },
+                "4": {
+                    "action": "Launch the image just built using runqemu. ",
+                    "expected_results": ""
+                }
+            },
+            "summary": "Create_core-image-sato-sdk_using_build_appliance"
+        }
+    }
+]
\ No newline at end of file
diff --git a/meta/lib/oeqa/manual/crops.json b/meta/lib/oeqa/manual/crops.json
new file mode 100644
index 0000000..1cf3c8f
--- /dev/null
+++ b/meta/lib/oeqa/manual/crops.json
@@ -0,0 +1,294 @@
+[
+    {
+        "test": {
+            "@alias": "crops-default.crops-default.sdkext_eSDK_devtool_build_make",
+            "author": [
+                {
+                    "email": "francisco.j.pedraza.gonzalez@intel.com",
+                    "name": "francisco.j.pedraza.gonzalez@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "IMPORTANT NOTE: The firsts 5 steps refer to configuration of the environment to run the rest of the steps. These only apply for CROPS-eSDK.    \n\n\n\n",
+                    "expected_results": ""
+                },
+                "2": {
+                    "action": " Initiate your Crops-esdk environment as it says in wiki https://github.com/crops/docker-win-mac-docs/wiki   \n\n",
+                    "expected_results": ""
+                },
+                "3": {
+                    "action": "Create the following tree of files  <crops-esdk-workdir-workspace>/sdkext/files/myapp <crops-esdk-workdir-workspace>/sdkext/files/myapp_cmake   \n\n\n",
+                    "expected_results": ""
+                },
+                "4": {
+                    "action": " Create the following files withing the myapp directory  myapp.c and the Makefile. Write the following inside of each file: \n---------------------------------------- \nMakefile should contain  \n\nall: myapp  \n\nmyapp: myapp.o \n\t$(CC) $(LDFLAGS) $< -o $@  \n\nmyapp.o: myapp.c  \n\t$(CC) $(CFLAGS) -c $< -o $@ \n\nclean: \n\trm -rf myapp.o myapp  \n\n-----------------------------  \nmyapp.c  shold contain  \n\n\n#include <stdio.h>    \n\nint \nmain(int argc, char *argv[]) \n{ \n\tprintf(\"Hello world\\n\"); \n \n\treturn 0; \n} \n------------------------------------  \n\n",
+                    "expected_results": "be sure that the indentations on the makefile are tabs not spaces.  \n\n"
+                },
+                "5": {
+                    "action": " Create the following files within the myapp_cmake directory CMakeLists.txt and myapp.c. Write the following inside each file:  \n\n------------------------------------ \nCMakeLists.txt should contain:  \n\ncmake_minimum_required (VERSION 2.6) \nproject (myapp) \n# The version number. \nset (myapp_VERSION_MAJOR 1) \nset (myapp_VERSION_MINOR 0)  \n\n# add the executable \nadd_executable (myapp myapp.c)  \n\ninstall(TARGETS myapp \nRUNTIME DESTINATION bin)  \n\n------------------------------------------ \nmyapp.c should contain:  \n\n#include <stdio.h>     \n\nint  \nmain(int argc, char *argv[])  \n{ \n\tprintf(\"Hello world\\n\");  \n\n\treturn 0; \n} \n-------------------------------------------------  \n\n",
+                    "expected_results": "Be sure that the indentations on CMakeLists.txt is tabs not spaces."
+                },
+                "6": {
+                    "action": " source environment-setup-i586-poky-linux  \n\n",
+                    "expected_results": "This should output a message that says SDK environment now set up; additionally you may now run devtool to perform development tasks etc etc ...   \n\n"
+                },
+                "7": {
+                    "action": " run command which devtool  \n\n",
+                    "expected_results": "this should output the directory of the devtool script and it should be within the sdk workdir you are working in.  \n\n  "
+                },
+                "8": {
+                    "action": "devtool add myapp <directory>(this is myapp dir)    \n\n\n",
+                    "expected_results": "The directory you should input is the myapp directory. This should automatically create the recipe myapp.bb under <crops-esdk-workdir-workspace>/recipes/myapp/myapp.bb"
+                },
+                "9": {
+                    "action": " devtool build myapp  \n\n",
+                    "expected_results": "This should compile an image"
+                },
+                "10": {
+                    "action": " devtool reset myapp  ",
+                    "expected_results": "This cleans sysroot of the myapp recipe, but it leaves the source tree intact. meaning it does not erase."
+                }
+            },
+            "summary": "sdkext_eSDK_devtool_build_make"
+        }
+    },
+    {
+        "test": {
+            "@alias": "crops-default.crops-default.sdkext_devtool_build_esdk_package",
+            "author": [
+                {
+                    "email": "francisco.j.pedraza.gonzalez@intel.com",
+                    "name": "francisco.j.pedraza.gonzalez@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "IMPORTANT NOTE: The firsts 5 steps refer to configuration of the environment to run the rest of the steps. These only apply for CROPS-eSDK.    \n\n\n\n",
+                    "expected_results": ""
+                },
+                "2": {
+                    "action": " Initiate your Crops-esdk environment as it says in wiki https://github.com/crops/docker-win-mac-docs/wiki   \n\n",
+                    "expected_results": ""
+                },
+                "3": {
+                    "action": " Create the following tree of files    <crops-esdk-workdir-workspace>/sdkext/files/myapp/ \n <crops-esdk-workdir-workspace>/sdkext/files/myapp_cmake  \n\n",
+                    "expected_results": ""
+                },
+                "4": {
+                    "action": " Create the following files withing the myapp directory  myapp.c and the Makefile. Write the following inside of each file: \n---------------------------------------- \nMakefile should contain  \n\nall: myapp  \n\nmyapp: myapp.o \n\t$(CC) $(LDFLAGS) $< -o $@ \n\nmyapp.o: myapp.c  \n\t$(CC) $(CFLAGS) -c $< -o $@ \n\nclean: \n\trm -rf myapp.o myapp  \n\n-----------------------------  \nmyapp.c  shold contain  \n\n#include <stdio.h>   \n\nint \nmain(int argc, char *argv[]) \n{ \n\tprintf(\"Hello world\\n\"); \n \n\treturn 0; \n} \n------------------------------------  \n\n",
+                    "expected_results": "be sure that the indentations on the makefile are tabs not spaces.  \n\n"
+                },
+                "5": {
+                    "action": " Create the following files within the myapp_cmake directory CMakeLists.txt and myapp.c. Write the following inside each file:  \n\n------------------------------------ \nCMakeLists.txt should contain:  \n\ncmake_minimum_required (VERSION 2.6) \nproject (myapp) \n# The version number. \nset (myapp_VERSION_MAJOR 1) \nset (myapp_VERSION_MINOR 0)  \n\n# add the executable \nadd_executable (myapp myapp.c)  \n\ninstall(TARGETS myapp \nRUNTIME DESTINATION bin)  \n\n------------------------------------------ \nmyapp.c should contain:  \n\n#include<stdio.h>     \n\nint  \nmain(int argc, char *argv[])  \n{ \n\tprintf(\"Hello world\\n\");  \n\n\treturn 0; \n} \n-------------------------------------------------  \n\n",
+                    "expected_results": "Be sure that the indentations on CMakeLists.txt is tabs not spaces.  \n\n"
+                },
+                "6": {
+                    "action": " source environment-setup-i586-poky-linux  \n\n",
+                    "expected_results": "This should output a message that says SDK environment now set up; additionally you may now run devtool to perform development tasks etc etc ...  \n\n"
+                },
+                "7": {
+                    "action": " run command which devtool  \n\n",
+                    "expected_results": " this should output the directory of the devtool script and it should be within the sdk workdir you are working in.  \n\n"
+                },
+                "8": {
+                    "action": " devtool add myapp <directory>  (this is myapp dir)  \n\n",
+                    "expected_results": " The directory you should input is the myapp directory. This should automatically create the recipe myapp.bb under <crops-esdk-workdir-workspace>/recipes/myapp/myapp.bb  \n\n"
+                },
+                "9": {
+                    "action": " devtool package myapp  \n\n",
+                    "expected_results": " you should expect a package creation of myapp and it should be under the  /tmp/deploy/  \n\n"
+                },
+                "10": {
+                    "action": " devtool reset myapp  ",
+                    "expected_results": "This cleans sysroot of the myapp recipe, but it leaves the source tree intact. meaning it does not erase.\n</package_format>"
+                }
+            },
+            "summary": "sdkext_devtool_build_esdk_package"
+        }
+    },
+    {
+        "test": {
+            "@alias": "crops-default.crops-default.sdkext_devtool_build_cmake",
+            "author": [
+                {
+                    "email": "francisco.j.pedraza.gonzalez@intel.com",
+                    "name": "francisco.j.pedraza.gonzalez@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "IMPORTANT NOTE: The firsts 5 steps refer to configuration of the environment to run the rest of the steps. These only apply for CROPS-eSDK.    \n\n\n\n",
+                    "expected_results": ""
+                },
+                "2": {
+                    "action": " Initiate your Crops-esdk environment as it says in wiki https://github.com/crops/docker-win-mac-docs/wiki   \n\n",
+                    "expected_results": ""
+                },
+                "3": {
+                    "action": " Create the following tree of files    <crops-esdk-workdir-workspace>/sdkext/files/myapp \n <crops-esdk-workdir-workspace>/sdkext/files/myapp_cmake  \n\n",
+                    "expected_results": ""
+                },
+                "4": {
+                    "action": " Create the following files withing the myapp directory  myapp.c and the Makefile. Write the following inside of each file: \n---------------------------------------- \nMakefile should contain  \n\nall: myapp  \n\nmyapp: myapp.o \n\t$(CC) $(LDFLAGS) $< -o $@ \n\nmyapp.o: myapp.c  \n\t$(CC) $(CFLAGS) -c $< -o $@ \n\nclean: \n\trm -rf myapp.o myapp  \n\n-----------------------------  \nmyapp.c  shold contain  \n\n#include <stdio.h>   \n\nint \nmain(int argc, char *argv[]) \n{ \n\tprintf(\"Hello world\\n\"); \n \n\treturn 0; \n} \n------------------------------------  \n\n",
+                    "expected_results": "be sure that the indentations on the makefile are tabs not spaces.   \n\n"
+                },
+                "5": {
+                    "action": " Create the following files within the myapp_cmake directory CMakeLists.txt and myapp.c. Write the following inside each file:  \n\n------------------------------------ \nCMakeLists.txt should contain:  \n\ncmake_minimum_required (VERSION 2.6) \nproject (myapp) \n# The version number. \nset (myapp_VERSION_MAJOR 1) \nset (myapp_VERSION_MINOR 0)  \n\n# add the executable \nadd_executable (myapp myapp.c)  \n\ninstall(TARGETS myapp \nRUNTIME DESTINATION bin)  \n\n------------------------------------------ \nmyapp.c should contain:  \n\n#include    \n\nint  \nmain(int argc, char *argv[])  \n{ \n\tprintf(\"Hello world\\n\");  \n\n\treturn 0; \n} \n-------------------------------------------------  \n\n",
+                    "expected_results": "Be sure that the indentations on CMakeLists.txt is tabs not spaces.  \n\n"
+                },
+                "6": {
+                    "action": " source environment-setup-i586-poky-linux  \n\n",
+                    "expected_results": "This should output a message that says SDK environment now set up; additionally you may now run devtool to perform development tasks etc etc ...  \n\n"
+                },
+                "7": {
+                    "action": " run command which devtool  \n\n",
+                    "expected_results": "this should output the directory of the devtool script and it should be within the sdk workdir you are working in.  \n\n"
+                },
+                "8": {
+                    "action": " devtool add myapp <directory>   (this is myapp_cmake dir)  \n\n",
+                    "expected_results": "The directory you should input is the myapp_cmake directory. This should automatically create the recipe myapp.bb under <crops-esdk-workdir-workspace>/recipes/myapp/myapp.bb  \n\n"
+                },
+                "9": {
+                    "action": " devtool build myapp  \n\n",
+                    "expected_results": "This should compile an image  \n\n"
+                },
+                "10": {
+                    "action": " devtool reset myapp  ",
+                    "expected_results": "This cleans sysroot of the myapp recipe, but it leaves the source tree intact. meaning it does not erase.  "
+                }
+            },
+            "summary": "sdkext_devtool_build_cmake"
+        }
+    },
+    {
+        "test": {
+            "@alias": "crops-default.crops-default.sdkext_extend_autotools_recipe_creation",
+            "author": [
+                {
+                    "email": "francisco.j.pedraza.gonzalez@intel.com",
+                    "name": "francisco.j.pedraza.gonzalez@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "IMPORTANT NOTE: The firsts 2 steps refer to configuration of the environment to run the rest of the steps. These only apply for CROPS-eSDK.    \n\n\n\n",
+                    "expected_results": ""
+                },
+                "2": {
+                    "action": "Initiate your Crops-esdk environment as it says in wiki https://github.com/crops/docker-win-mac-docs/wiki   \n\n",
+                    "expected_results": ""
+                },
+                "3": {
+                    "action": " source environment-setup-i586-poky-linux  \n\n",
+                    "expected_results": " This should output a message that says SDK environment now set up; additionally you may now run devtool to perform development tasks etc etc ...   \n\n"
+                },
+                "4": {
+                    "action": "run command which devtool  \n\n",
+                    "expected_results": "this should output the directory of the devtool script and it should be within the sdk workdir you are working in.   \n\n"
+                },
+                "5": {
+                    "action": "devtool sdk-install -s libxml2  \n\n",
+                    "expected_results": "this should install libxml2   \n\n"
+                },
+                "6": {
+                    "action": "devtool add librdfa  https://github.com/rdfa/librdfa  \n\n",
+                    "expected_results": "This should automatically create the recipe librdfa.bb under /recipes/librdfa/librdfa.bb   \n\n"
+                },
+                "7": {
+                    "action": "devtool build librdfa  \n\n",
+                    "expected_results": "This should compile   \n\n"
+                },
+                "8": {
+                    "action": "devtool reset librdfa  ",
+                    "expected_results": "This cleans sysroot of the librdfa recipe, but it leaves the source tree intact. meaning it does not erase."
+                }
+            },
+            "summary": "sdkext_extend_autotools_recipe_creation"
+        }
+    },
+    {
+        "test": {
+            "@alias": "crops-default.crops-default.sdkext_devtool_kernelmodule",
+            "author": [
+                {
+                    "email": "francisco.j.pedraza.gonzalez@intel.com",
+                    "name": "francisco.j.pedraza.gonzalez@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "IMPORTANT NOTE: The firsts 2 steps refer to configuration of the environment to run the rest of the steps. These only apply for CROPS-eSDK.    \n\n\n",
+                    "expected_results": ""
+                },
+                "2": {
+                    "action": " Initiate your Crops-esdk environment as it says in wiki https://github.com/crops/docker-win-mac-docs/wiki   \n\n",
+                    "expected_results": ""
+                },
+                "3": {
+                    "action": "source environment-setup-i586-poky-linux   \n\n",
+                    "expected_results": "This should output a message that says SDK environment now set up; additionally you may now run devtool to perform development tasks etc etc ...   \n \n"
+                },
+                "4": {
+                    "action": "run command which devtool  \n\n",
+                    "expected_results": "this should output the directory of the devtool script and it should be within the sdk workdir you are working in.   \n\n"
+                },
+                "5": {
+                    "action": "devtool add v4l2loopback-driver  https://github.com/umlaeute/v4l2loopback.git   \n\n",
+                    "expected_results": "This should automatically create the recipe v4l2loopback-driver.bb under <crops-esdk-workdir-workspace>/recipes/v4l2loopback-driver/v4l2loopback-driver.bb "
+                },
+                "6": {
+                    "action": "devtool build v4l2loopback-driver   \n\n",
+                    "expected_results": "This should compile an image   \n\n"
+                },
+                "7": {
+                    "action": "devtool reset v4l2loopback-driver   ",
+                    "expected_results": "This cleans sysroot of the v4l2loopback-driver recipe, but it leaves the source tree intact. meaning it does not erase."
+                }
+            },
+            "summary": "sdkext_devtool_kernelmodule"
+        }
+    },
+    {
+        "test": {
+            "@alias": "crops-default.crops-default.sdkext_recipes_for_nodejs",
+            "author": [
+                {
+                    "email": "francisco.j.pedraza.gonzalez@intel.com",
+                    "name": "francisco.j.pedraza.gonzalez@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "IMPORTANT NOTE: The firsts 2 steps refer to configuration of the environment to run the rest of the steps. These only apply for CROPS-eSDK.    \n\n\nlets say variable npm = npm://registry.npmjs.org;name=winston;version=2.2.0   \n\n",
+                    "expected_results": ""
+                },
+                "2": {
+                    "action": "Initiate your Crops-esdk environment as it says in wiki https://github.com/crops/docker-win-mac-docs/wiki   \n\n",
+                    "expected_results": ""
+                },
+                "3": {
+                    "action": "source environment-setup-i586-poky-linux   \n\n",
+                    "expected_results": "This should output a message that says SDK environment now set up; additionally you may now run devtool to perform development tasks etc etc ...   \n\n"
+                },
+                "4": {
+                    "action": "run command which devtool   \n\n",
+                    "expected_results": "this should output the directory of the devtool script and it should be within the sdk workdir you are working in.  \n\n"
+                },
+                "5": {
+                    "action": " 4a) git clone git://git.openembedded.org/meta-openembedded in  layers/build  directory   \n \n4b) Add meta-openembedded/meta-oe in bblayer.conf as mentioned below: ${SDKBASEMETAPATH}/layers/build/meta-openembedded/meta-oe \\   \n\n4c) devtool add \"npm://registry.npmjs.org;name=npm;version=2.2.0\"   \n\n",
+                    "expected_results": " This should automatically create the recipe npm.bb under /recipes/npm/npm.bb  \n\n"
+                },
+                "6": {
+                    "action": "devtool build npm   \n\n",
+                    "expected_results": "This should compile an image  \n\n"
+                },
+                "7": {
+                    "action": " devtool reset npm",
+                    "expected_results": "This cleans sysroot of the npm recipe, but it leaves the source tree intact. meaning it does not erase."
+                }
+            },
+            "summary": "sdkext_recipes_for_nodejs"
+        }
+    }
+]
\ No newline at end of file
diff --git a/meta/lib/oeqa/manual/eclipse-plugin.json b/meta/lib/oeqa/manual/eclipse-plugin.json
new file mode 100644
index 0000000..9869150
--- /dev/null
+++ b/meta/lib/oeqa/manual/eclipse-plugin.json
@@ -0,0 +1,322 @@
+[
+    {
+        "test": {
+            "@alias": "eclipse-plugin.eclipse-plugin.support_SSH_connection_to_Target",
+            "author": [
+                {
+                    "email": "ee.peng.yeoh@intel.com",
+                    "name": "ee.peng.yeoh@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "In Eclipse, swich to Remote System Explorer to create a connention baseed on SSH, input the remote target IP address as the Host name, make sure disable the proxy in Window->Preferences->General->Network Connection, set Direct as Active Provider field.  ",
+                    "expected_results": "the connection based on SSH could be set up."
+                },
+                "2": {
+                    "action": "Configure connection from Eclipse: Run->Run Configurations->C/C++ Remote Application\\ ->New Connection->General->SSH Only  ",
+                    "expected_results": ""
+                },
+                "3": {
+                    "action": "Then right click to connect, input the user ID and password.  ",
+                    "expected_results": ""
+                },
+                "4": {
+                    "action": "expand the connection, it will show the Sftp Files etc.   \nNOTE. Might need to change dropbear to openssh and add the packagegroup-core-eclipse-debug recipe",
+                    "expected_results": ""
+                }
+            },
+            "summary": "support_SSH_connection_to_Target"
+        }
+    },
+    {
+        "test": {
+            "@alias": "eclipse-plugin.eclipse-plugin.Launch_QEMU_from_Eclipse",
+            "author": [
+                {
+                    "email": "ee.peng.yeoh@intel.com",
+                    "name": "ee.peng.yeoh@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "Set the Yocto ADT's toolchain root location, sysroot location and kernel, in the menu Window -> Preferences -> Yocto ADT.   \n \n",
+                    "expected_results": ""
+                },
+                "2": {
+                    "action": "wget  autobuilder.yoctoproject.org/pub/releases//machines/qemu/qemux86/qemu (ex:core-image-sato-sdk-qemux86-date-rootfs-tar-bz2) \nsource /opt/poky/version/environment-setup-i585-poky-linux  \n\nExtract qemu with runqemu-extract-sdk /home/user/file(ex.core-image-sato-sdk-qemux86.bz2) \n/home/user/qemux86-sato-sdk  \n\n",
+                    "expected_results": " Qemu can be lauched normally."
+                },
+                "3": {
+                    "action": "(a)Point to the Toolchain:  \n \nIf you are using a stand-alone pre-built toolchain, you should be pointing to the /opt/poky/{test-version} directory as Toolchain Root Location. This is the default location for toolchains installed by the ADT Installer or by hand. If ADT is installed in other location, use that location as Toolchain location.\nIf you are using a system-derived toolchain, the path you provide for the Toolchain Root Location field is the Yocto Project's build directory.  \n \n           E.g:/home/user/yocto/poky/build \n",
+                    "expected_results": ""
+                },
+                "4": {
+                    "action": "(b)Specify the Sysroot Location: \nSysroot Location is the location where the root filesystem for the target hardware is created on the development system by the ADT Installer (SYSROOT in step 2 of the case ADT installer Installation).  \n   \n         Local :     e.g: /home/user/qemux86-sato-sdk \nUsing ADT : e.g :/home/user/test-yocto/qemux86  \n\n",
+                    "expected_results": ""
+                },
+                "5": {
+                    "action": "(c)Select the Target Architecture:  \n \nThe target architecture is the type of hardware you are going to use or emulate. Use the pull-down Target Architecture menu to make your selection.  \n \n\n",
+                    "expected_results": ""
+                },
+                "6": {
+                    "action": "(d) QEMU: \nSelect this option if you will be using the QEMU emulator. Specify the Kernel matching the QEMU architecture you are using. \n      wget  autobuilder.yoctoproject.org/pub/releases//machines/qemu/qemux86/bzImage-qemux86.bin \n      e.g: /home/$USER/yocto/adt-installer/download_image/bzImage-qemux86.bin  \n\n",
+                    "expected_results": ""
+                },	
+                "7": {
+                    "action": "(e) select OK to save the settings.  \n\n\n1: In the Eclipse toolbar, expose the Run -> External Tools menu. Your image should appear as a selectable menu item.  \n2: Select your image in the navigation pane to launch the emulator in a new window. \n3: If needed, enter your host root password in the shell window at the prompt. This sets up a Tap 0 connection needed for running in user-space NFS mode. \n",
+                    "expected_results": ""
+                }				
+            },
+            "summary": "Launch_QEMU_from_Eclipse"
+        }
+    },
+    {
+        "test": {
+            "@alias": "eclipse-plugin.eclipse-plugin.Relocatable_SDK_-_C_-_Build_Hello_World_ANSI_C_Autotools_Project",
+            "author": [
+                {
+                    "email": "ee.peng.yeoh@intel.com",
+                    "name": "ee.peng.yeoh@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "Launch a QEMU of target enviroment.(Reference to case \"ADT - Launch qemu by eclipse\") ",
+                    "expected_results": ""
+                },
+                "2": {
+                    "action": "Select File -> New -> Project.",
+                    "expected_results": ""
+                },
+                "3": {
+                    "action": "Double click C/C++.",
+                    "expected_results": ""
+                },
+                "4": {
+                    "action": "Click C or C++ Project to create the project.",
+                    "expected_results": ""
+                },
+                "5": {
+                    "action": "Expand Yocto ADT Project.",
+                    "expected_results": ""
+                },
+                "6": {
+                    "action": "Select Hello World ANSI C Autotools Project.",
+                    "expected_results": ""
+                },
+                "7": {
+                    "action": "Put a name in the Project name. Do not use hyphens as part of the name. \n \n",
+                    "expected_results": ""
+                },
+                "8": {
+                    "action": "Click Next.",
+                    "expected_results": ""
+                },
+                "9": {
+                    "action": "Add information in the Author and Copyright notice fields. \n1",
+                    "expected_results": ""
+                },
+                "10": {
+                    "action": "Click Finish. \n1",
+                    "expected_results": ""
+                },
+                "11": {
+                    "action": "If the \"open perspective\" prompt appears, click \"Yes\" so that you open the C/C++ perspective. \n1",
+                    "expected_results": ""
+                },
+                "12": {
+                    "action": "In the Project Explorer window, right click the project -> Reconfigure project. \n1",
+                    "expected_results": ""
+                },
+                "13": {
+                    "action": "In the Project Explorer window, right click the project -> Build project. \n1",
+                    "expected_results": "Under the Project files, a new folder appears called Binaries. This indicates that the compilation have been successful and the project binary have been created. \n"
+                },
+                "14": {
+                    "action": "Right click it again and Run as -> Run Configurations.  \n\t\t\tUnder Run Configurations expand \"C/C++ Remote Application\". A configuration for the current project should appear. Clicking it will display the configuration settings. \n\t\t\tin \"C/C++ Application\" field input Remote Absolute File path for C/C++ Application. e.g.: /home/root/myapplication \n\t\t\tIn \"Connection\" drop-down list make sure a TCF connection is set up for your target. If not, create a new one by clicking the New button. \n1",
+                    "expected_results": "step 14 to step 16 -> Build succeed and the console outputs Hello world, you can also check the output on target."
+                },
+                "15": {
+                    "action": "After all settings are done, select the Run button on the bottom right corner \n\n1",
+                    "expected_results": ""
+                },
+                "16": {
+                    "action": "Repeat the steps 14-15, but instead of using Run Configurations use Debug Configurations: \nRight click it again and Debug as -> Debug Configurations \nUnder Debug Configurations expand \"C/C++ Remote Application\". A configuration for the current project should appear. Clicking it will display the configuration settings. \nin \"C/C++ Application\" field input Remote Absolute File path for C/C++ Application.\ne.g.: /home/root/myapplication \nIn \"Connection\" drop-down list make sure a TCF connection is set up for your target. If not, create a new one by clicking the New button \n1",
+                    "expected_results": ""
+                },
+                "17": {
+                    "action": "After all settings are done, select the Debug button on the bottom right corner",
+                    "expected_results": ""
+                }
+            },
+            "summary": "Relocatable_SDK_-_C_-_Build_Hello_World_ANSI_C_Autotools_Project"
+        }
+    },
+    {
+        "test": {
+            "@alias": "eclipse-plugin.eclipse-plugin.Relocatable_SDK_-_C++_-_Build_Hello_World_C++_Autotools_project",
+            "author": [
+                {
+                    "email": "ee.peng.yeoh@intel.com",
+                    "name": "ee.peng.yeoh@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "Launch a QEMU of target enviroment.(Reference to case \"ADT - Launch qemu by eclipse\") ",
+                    "expected_results": ""
+                },
+                "2": {
+                    "action": "Select File -> New -> Project. ",
+                    "expected_results": ""
+                },
+                "3": {
+                    "action": "Double click C/C++. ",
+                    "expected_results": ""
+                },
+                "4": {
+                    "action": "Click C or C++ Project to create the project. ",
+                    "expected_results": ""
+                },
+                "5": {
+                    "action": "Expand Yocto ADT Project. ",
+                    "expected_results": ""
+                },
+                "6": {
+                    "action": "Select Hello World ANSI C++ Autotools Project. ",
+                    "expected_results": ""
+                },
+                "7": {
+                    "action": "Put a name in the Project name. Do not use hyphens as part of the name.  \n \n",
+                    "expected_results": ""
+                },
+                "8": {
+                    "action": "Click Next.",
+                    "expected_results": ""
+                },
+                "9": {
+                    "action": "Add information in the Author and Copyright notice fields.",
+                    "expected_results": ""
+                },
+                "10": {
+                    "action": "Click Finish. \n1",
+                    "expected_results": ""
+                },
+                "11": {
+                    "action": "If the \"open perspective\" prompt appears, click \"Yes\" so that you open the C/C++ perspective. \n1",
+                    "expected_results": ""
+                },
+                "12": {
+                    "action": "In the Project Explorer window, right click the project -> Reconfigure project. \n1",
+                    "expected_results": ""
+                },
+                "13": {
+                    "action": "In the Project Explorer window, right click the project -> Build project. \n\n1",
+                    "expected_results": "under the Project files, a new folder appears called Binaries. This indicates that the compilation have been successful and the project binary have been created.  \n"
+                },
+                "14": {
+                    "action": "Right click it again and Run as -> Run Configurations. \n\t\t\tUnder Run Configurations expand \"C/C++ Remote Application\". A configuration for the current project should appear. Clicking it will display the configuration settings. \n\t\t\tin \"C/C++ Application\" field input Remote Absolute File path for C/C++ Application. e.g.: /home/root/myapplication \n\t\t\tIn \"Connection\" drop-down list make sure a TCF connection is set up for your target. If not, create a new one by clicking the New button. \n1",
+                    "expected_results": "step 14 to step 16 -> Build succeed and the console outputs Hello world, you can also check the output on target."
+                },
+                "15": {
+                    "action": "After all settings are done, select the Run button on the bottom right corner \n\n1",
+                    "expected_results": ""
+                },
+                "16": {
+                    "action": "Repeat the steps 14-15, but instead of using Run Configurations use Debug Configurations: \n\t\tRight click it again and Debug as -> Debug Configurations \n\t\tUnder Debug Configurations expand \"C/C++ Remote Application\". A configuration for the current project should appear. Clicking it will display the configuration settings. \n\t\tin \"C/C++ Application\" field input Remote Absolute File path for C/C++ Application. \n\t\te.g.: /home/root/myapplication \n\t\tIn \"Connection\" drop-down list make sure a TCF connection is set up for your target. If not, create a new one by clicking the New button \n1",
+                    "expected_results": ""
+                },
+                "17": {
+                    "action": "After all settings are done, select the Debug button on the bottom right corner",
+                    "expected_results": ""
+                }
+            },
+            "summary": "Relocatable_SDK_-_C++_-_Build_Hello_World_C++_Autotools_project"
+        }
+    },
+    {
+        "test": {
+            "@alias": "eclipse-plugin.eclipse-plugin.Build_Eclipse_Plugin_from_source",
+            "author": [
+                {
+                    "email": "laurentiu.serban@intel.com",
+                    "name": "laurentiu.serban@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "Clone eclipse-poky source.   \n    \n    - git clone git://git.yoctoproject.org/eclipse-poky  \n\n",
+                    "expected_results": "Eclipse plugin is successfully installed  \n\nDocumentation is there. For example if you have release yocto-2.0.1 you will found on   http://autobuilder.yoctoproject.org/pub/releases/yocto-2.0.1/eclipse-plugin/mars/  archive with documentation like org.yocto.doc-development-$date.zip  \n  \n"
+                },
+                "2": {
+                    "action": "Checkout correct tag.  \n\n    - git checkout <eclipse-version>/<yocto-version> \n\n",
+                    "expected_results": "After plugin is build you must have  4 archive in foder scripts from eclipse-poky:  \n     - org.yocto.bc - mars-master-$date.zip  \n     - org.yocto.doc - mars-master-$date.zip    --> documentation  \n     - org.yocto.sdk - mars-master-$date.zip       \n     - org.yocto.sdk - mars-master-$date.-archive.zip  --> plugin  "
+                },
+                "3": {
+                    "action": "Move to scripts/ folder.  \n\n",
+                    "expected_results": ""
+                },
+                "4": {
+                    "action": "Run ./setup.sh  \n\n",
+                    "expected_results": ""
+                },
+                "5": {
+                    "action": "When the script finishes, it prompts a command to issue to build the plugin. It should look similar to the following:  \n\n$ ECLIPSE_HOME=/eclipse-poky/scripts/eclipse ./build.sh /&1 | tee -a build.log  \n\nHere, the three arguments to the build script are tag name, branch for documentation and release name.  \n\n",
+                    "expected_results": ""
+                },
+                "6": {
+                    "action": "On an eclipse without the Yocto Plugin, select \"Install New Software\" from Help pull-down menu  \n\n",
+                    "expected_results": ""
+                },
+                "7": {
+                    "action": "Select Add and from the dialog choose Archive...  Look for the *archive.zip file that was built previously with the build.sh script. Click OK.  \n\n",
+                    "expected_results": ""
+                },
+                "8": {
+                    "action": "Select all components and proceed with Installation of plugin. Restarting eclipse might be required.\n",
+                    "expected_results": ""
+                }
+            },
+            "summary": "Build_Eclipse_Plugin_from_source"
+        }
+    },
+    {
+        "test": {
+            "@alias": "eclipse-plugin.eclipse-plugin.Eclipse_Poky_installation_and_setup",
+            "author": [
+                {
+                    "email": "ee.peng.yeoh@intel.com",
+                    "name": "ee.peng.yeoh@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "Install SDK  \n\ta)Download https://autobuilder.yocto.io/pub/releases//toolchain/x86_64/poky-glibc-x86_64-core-\timage-sato-i586-toolchain-.sh  \n\tb)Run the SDK installer and accept the default installation directory ",
+                    "expected_results": ""
+                },
+                "2": {
+                    "action": "Install \"Eclipse IDE for C/C++ Developers\" Oxygen release (4.7.0)  \n\ta) Go to https://www.eclipse.org/downloads/packages/all, click \"Oxygen R\"  \n\tb) Click to download the build for your OS  \n\tc) Click \"Download\" button to download from a mirror  \n\td) Run \"tar xf\" to extract the downloaded archive  ",
+                    "expected_result": ""
+                },
+                "3": {
+                    "action": "Install \"Eclipse IDE for C/C++ Developers\" Oxygen release (4.7.0) (Continue)  \n\te) Run \"eclipse/eclipse\" to start Eclipse  \n\tf) Optional step for host machine within Intel network: In Eclipse workbench window, go to \"Window\" menu -> \"Preferences...\".  \n\tg) In \"Preferences\" dialog, go to \"General\" -> \"Network Connections\", set \"Active Provider\" to \"Manual\". In \"Proxy \tentries\" table, select HTTP and click \"Edit\" and enter host \"proxy-chain.intel.com\" port 911, click OK. Repeat for HTTPS with port 912 \nClick OK to close \"Preferences\" dialog.  \n\th) Go to \"File\" menu -> \"Restart\" to restart Eclipse for proxy settings to take effect. ",
+                    "expected_result": ""
+                },
+                "4": {
+                    "action": "Install Eclipse Poky plugins  \n\ta) Download https://autobuilder.yocto.io/pub/releases/<yocto-version>/eclipse-plugin/<eclipse-version>/org.yocto.sdk-development-<date>-archive.zip   \n\tb) In Eclipse workbench window, go to \"Help\" menu -> \"Install New Software...\"  \n\tc) In \"Install\" dialog, click \"Add...\" button  \n\td) In \"Add Repository\" dialog, enter \"Eclipse Poky\" for (repository) Name, click \"Archive...\"  ",
+                    "expected_results": ""
+                },
+                "5": {
+                    "action": "Install Eclipse Poky plugins (continue)  \n\te) In \"Repository archive\" browse dialog, select the downloaded Eclipse Poky repository archive  \n\tf) Back in \"Add Repository\" dialog, click \"OK\"  \n\tg) Back in \"Install\" dialog, make sure \"Work with:\" is set to \"Eclipse Poky\" repository, tick \"Yocto Project \tDocumentation Plug-in\" and \"Yocto Project SDK Plug-in\", click \"Next >\" and verify plugins/features name/version, \tclick \"Next >\" and accept license agreement, click \"Finish\"  \n\th) If \"Security Warning\" dialog appears, click \"OK\" to install unsigned content.  \n\ti) In \"Software Updates\" dialog, click \"Yes\" to restart Eclipse to complete Eclipse Poky plugins installation. ",
+                    "expected_results": ""
+                },
+                "6": {
+                    "action": "Setup Eclipse Poky to use SDK  \n\ta) In Eclipse workbench window, go to \"Window\" menu -> \"Preferences\".  \n\tb) In \"Preferences\" window, go to \"Yocto Project SDK\", in \"Cross Compiler Options\" frame, select \"Standalone pre-\tbuilt toolchain\".  ",
+                    "expected_results": "Eclipse Poky plugins installed and running successfully, e.g. observe that \"Yocto Project Tools\" menu is available on Eclipse workbench window."
+                }
+            },
+            "summary": "Eclipse_Poky_installation_and_setup"
+        }
+    }
+]
\ No newline at end of file
diff --git a/meta/lib/oeqa/manual/kernel-dev.json b/meta/lib/oeqa/manual/kernel-dev.json
new file mode 100644
index 0000000..c93b4dd
--- /dev/null
+++ b/meta/lib/oeqa/manual/kernel-dev.json
@@ -0,0 +1,200 @@
+[
+    {
+        "test": {
+            "@alias": "kernel-configuration.kernel-configuration.TCTEMP_2.3_MANUAL_Kernel_dev_defconfig",
+            "author": [
+                {
+                    "email": "ee.peng.yeoh@intel.com",
+                    "name": "ee.peng.yeoh@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "Follow the Set Up procedure to complete the common and specific prerequisites for this test case. https://wiki.yoctoproject.org/wiki/Kernel_Development_Test_Cases#Setup https://wiki.yoctoproject.org/wiki/Kernel_Development_Test_Cases#Prerequisites_7  ",
+                    "expected_results": ""
+                },
+                "2": {
+                    "action": "Execute the test case steps asdocumented on the \"Kernel Development Test Cases\" wiki. https://wiki.yoctoproject.org/wiki/Kernel_Development_Test_Cases#Steps_7",
+                    "expected_results": "Review expected results on thethe \"Kernel Development Test Cases\"wiki. https://wiki.yoctoproject.org/wiki/Kernel_Development_Test_Cases#Expected_Results_7"
+                }
+            },
+            "summary": "TCTEMP_2.3_MANUAL_Kernel_dev_defconfig"
+        }
+    },
+    {
+        "test": {
+            "@alias": "kernel-configuration.kernel-configuration.TCTEMP_2.3_MANUAL_Kernel_dev_defconfig+fragments",
+            "author": [
+                {
+                    "email": "ee.peng.yeoh@intel.com",
+                    "name": "ee.peng.yeoh@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "Follow the Set Up procedure to complete the common and specific prerequisites for this test case. https://wiki.yoctoproject.org/wiki/Kernel_Development_Test_Cases#Setup https://wiki.yoctoproject.org/wiki/Kernel_Development_Test_Cases#Prerequisites_8  ",
+                    "expected_results": ""
+                },
+                "2": {
+                    "action": "Execute the test case steps asdocumented on the \"Kernel Development Test Cases\" wiki. https://wiki.yoctoproject.org/wiki/Kernel_Development_Test_Cases#Steps_8",
+                    "expected_results": "Review expected results on thethe \"Kernel Development Test Cases\"wiki. https://wiki.yoctoproject.org/wiki/Kernel_Development_Test_Cases#Expected_Results_8"
+                }
+            },
+            "summary": "TCTEMP_2.3_MANUAL_Kernel_dev_defconfig+fragments"
+        }
+    },
+    {
+        "test": {
+            "@alias": "kernel-configuration.kernel-configuration.TCTEMP_2.3_MANUAL_Kernel_dev_Applying_patches",
+            "author": [
+                {
+                    "email": "ee.peng.yeoh@intel.com",
+                    "name": "ee.peng.yeoh@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "Follow the Set Up procedure to complete the common and specific prerequisites for this test case. https://wiki.yoctoproject.org/wiki/Kernel_Development_Test_Cases#Setup https://wiki.yoctoproject.org/wiki/Kernel_Development_Test_Cases#Prerequisites  ",
+                    "expected_results": ""
+                },
+                "2": {
+                    "action": "Execute the test case steps asdocumented on the \"Kernel Development Test Cases\" wiki. https://wiki.yoctoproject.org/wiki/Kernel_Development_Test_Cases#Steps",
+                    "expected_results": "Review expected results on thethe \"Kernel Development Test Cases\"wiki. https://wiki.yoctoproject.org/wiki/Kernel_Development_Test_Cases#Expected_Results"
+                }
+            },
+            "summary": "TCTEMP_2.3_MANUAL_Kernel_dev_Applying_patches"
+        }
+    },
+    {
+        "test": {
+            "@alias": "kernel-configuration.kernel-configuration.TCTEMP_2.3_MANUAL_Kernel_dev_linux-yocto-local-source",
+            "author": [
+                {
+                    "email": "ee.peng.yeoh@intel.com",
+                    "name": "ee.peng.yeoh@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "Follow the Set Up procedure to complete the common and specific prerequisites for this test case. https://wiki.yoctoproject.org/wiki/Kernel_Development_Test_Cases#Setup https://wiki.yoctoproject.org/wiki/Kernel_Development_Test_Cases#Prerequisites_2  ",
+                    "expected_results": ""
+                },
+                "2": {
+                    "action": "Execute the test case steps asdocumented on the \"Kernel Development Test Cases\" wiki. https://wiki.yoctoproject.org/wiki/Kernel_Development_Test_Cases#Steps_2",
+                    "expected_results": "Review expected results on thethe \"Kernel Development Test Cases\"wiki. https://wiki.yoctoproject.org/wiki/Kernel_Development_Test_Cases#Expected_Results_2"
+                }
+            },
+            "summary": "TCTEMP_2.3_MANUAL_Kernel_dev_linux-yocto-local-source"
+        }
+    },
+    {
+        "test": {
+            "@alias": "kernel-configuration.kernel-configuration.TCTEMP_2.3_MANUAL_Kernel_dev_linux-yocto-custom-local-source",
+            "author": [
+                {
+                    "email": "ee.peng.yeoh@intel.com",
+                    "name": "ee.peng.yeoh@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "Follow the Set Up procedure to complete the common and specific prerequisites for this test case. https://wiki.yoctoproject.org/wiki/Kernel_Development_Test_Cases#Setup https://wiki.yoctoproject.org/wiki/Kernel_Development_Test_Cases#Prerequisites_3  ",
+                    "expected_results": ""
+                },
+                "2": {
+                    "action": "Execute the test case steps asdocumented on the \"Kernel Development Test Cases\" wiki. https://wiki.yoctoproject.org/wiki/Kernel_Development_Test_Cases#Steps_3",
+                    "expected_results": "Review expected results on thethe \"Kernel Development Test Cases\"wiki. https://wiki.yoctoproject.org/wiki/Kernel_Development_Test_Cases#Expected_Results_3"
+                }
+            },
+            "summary": "TCTEMP_2.3_MANUAL_Kernel_dev_linux-yocto-custom-local-source"
+        }
+    },
+    {
+        "test": {
+            "@alias": "kernel-configuration.kernel-configuration.TCTEMP_2.3_MANUAL_Kernel_dev_recipe-space_meta",
+            "author": [
+                {
+                    "email": "ee.peng.yeoh@intel.com",
+                    "name": "ee.peng.yeoh@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "Follow the Set Up procedure to complete the common and specific prerequisites for this test case. https://wiki.yoctoproject.org/wiki/Kernel_Development_Test_Cases#Setup https://wiki.yoctoproject.org/wiki/Kernel_Development_Test_Cases#Prerequisites_5  ",
+                    "expected_results": ""
+                },
+                "2": {
+                    "action": "Execute the test case steps asdocumented on the \"Kernel Development Test Cases\" wiki. https://wiki.yoctoproject.org/wiki/Kernel_Development_Test_Cases#Steps_5",
+                    "expected_results": "Review expected results on thethe \"Kernel Development Test Cases\"wiki. https://wiki.yoctoproject.org/wiki/Kernel_Development_Test_Cases#Expected_Results_5"
+                }
+            },
+            "summary": "TCTEMP_2.3_MANUAL_Kernel_dev_recipe-space_meta"
+        }
+    },
+    {
+        "test": {
+            "@alias": "kernel-configuration.kernel-configuration.TCTEMP_2.3_MANUAL_Kernel_dev_External_source",
+            "author": [
+                {
+                    "email": "ee.peng.yeoh@intel.com",
+                    "name": "ee.peng.yeoh@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "Follow the Set Up procedure to complete the common and specific prerequisites for this test case. https://wiki.yoctoproject.org/wiki/Kernel_Development_Test_Cases#Setup https://wiki.yoctoproject.org/wiki/Kernel_Development_Test_Cases#Prerequisites_6  ",
+                    "expected_results": ""
+                },
+                "2": {
+                    "action": "Execute the test case steps asdocumented on the \"Kernel Development Test Cases\" wiki. https://wiki.yoctoproject.org/wiki/Kernel_Development_Test_Cases#Steps_6",
+                    "expected_results": "Review expected results on thethe \"Kernel Development Test Cases\"wiki. https://wiki.yoctoproject.org/wiki/Kernel_Development_Test_Cases#Expected_Results_6"
+                }
+            },
+            "summary": "TCTEMP_2.3_MANUAL_Kernel_dev_External_source"
+        }
+    },
+    {
+        "test": {
+            "@alias": "kernel-configuration.kernel-configuration.TCTEMP_2.3_MANUAL_Kernel_dev_building_external_modules(hello-mod)",
+            "author": [
+                {
+                    "email": "ee.peng.yeoh@intel.com",
+                    "name": "ee.peng.yeoh@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "Follow the Set Up procedure to complete the common and specific prerequisites for this test case. https://wiki.yoctoproject.org/wiki/Kernel_Development_Test_Cases#Setup https://wiki.yoctoproject.org/wiki/Kernel_Development_Test_Cases#Prerequisites_10  ",
+                    "expected_results": ""
+                },
+                "2": {
+                    "action": "Execute the test case steps asdocumented on the \"Kernel Development Test Cases\" wiki. https://wiki.yoctoproject.org/wiki/Kernel_Development_Test_Cases#Setup_10",
+                    "expected_results": "Review expected results on thethe \"Kernel Development Test Cases\"wiki. https://wiki.yoctoproject.org/wiki/Kernel_Development_Test_Cases#Expected_Results_10"
+                }
+            },
+            "summary": "TCTEMP_2.3_MANUAL_Kernel_dev_building_external_modules(hello-mod)"
+        }
+    },
+    {
+        "test": {
+            "@alias": "kernel-configuration.kernel-configuration.TCTEMP_2.3_MANUAL_Kernel_dev_local_parallel_meta",
+            "author": [
+                {
+                    "email": "ee.peng.yeoh@intel.com",
+                    "name": "ee.peng.yeoh@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "Follow the Set Up procedure to complete the common and specific prerequisites for this test case. https://wiki.yoctoproject.org/wiki/Kernel_Development_Test_Cases#Setup https://wikioproject.org/wiki/Kernel_Development_Test_Cases#Prerequisites_4  ",
+                    "expected_results": ""
+                },
+                "2": {
+                    "action": "Execute the test case steps asdocumented on the \"Kernel Development Test Cases\" wiki. https://wiki.yoctoproject.org/wiki/Kernel_Development_Test_Cases#Steps_4",
+                    "expected_results": "Review expected results on thethe \"Kernel Development Test Cases\"wiki. https://wiki.yoctoproject.org/wiki/Kernel_Development_Test_Cases#Expected_Results_4"
+                }
+            },
+            "summary": "TCTEMP_2.3_MANUAL_Kernel_dev_local_parallel_meta"
+        }
+    }
+]
\ No newline at end of file
diff --git a/meta/lib/oeqa/manual/oe-core.json b/meta/lib/oeqa/manual/oe-core.json
new file mode 100644
index 0000000..55be9ad
--- /dev/null
+++ b/meta/lib/oeqa/manual/oe-core.json
@@ -0,0 +1,294 @@
+[
+  {
+    "test": {
+      "@alias": "oe-core.scripts.Use_scripts/pybootchartgui/pybootchartgui.py_to_generate_build_profiles",
+      "author": [
+        {
+          "email": "alexandru.c.georgescu@intel.com",
+          "name": "alexandru.c.georgescu@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Run a build for a recipe (e.g. core-image-minimal)",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "Run the profiling script, ../scripts/pybootchartgui/pybootchartgui.py  tmp/buildstats/    \n\n",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "Verify the results ",
+          "expected_results": "The scripts generates svg files with the profiling results . "
+        }
+      },
+      "summary": "Use_scripts/pybootchartgui/pybootchartgui.py_to_generate_build_profiles"
+    }
+  },
+  {
+    "test": {
+      "@alias": "oe-core.scripts.Crosstap_script_check",
+      "author": [
+        {
+          "email": "alexandru.c.georgescu@intel.com",
+          "name": "alexandru.c.georgescu@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Create the trace_open.stp script as follows in the host machine:  \n\n\nprobe syscall.open     \n\n{  \n\n\n        printf (\"%s(%d) open (%s)\\n\", execname(), pid(), argstr)  \n\n}  \n\n\n\nif the above failed, then create the below instead.  \n\nprobe syscall.open \n{ \n  printf (\"%s(%d) open\\n\", execname(), pid()) \n\n}  \n \n",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "Add 'tools-profile' and 'ssh-server-openssh' to EXTRA_IMAGE_FEATURES in local.conf \n\n\n",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "Build a core-image-minimal image, build systemtap-native. Start the image under qemu. \n\n",
+          "expected_results": ""
+        },
+        "4": {
+          "action": "Make sure that the ssh service is started on the Qemu machine. \n\n",
+          "expected_results": ""
+        },
+        "5": {
+          "action": "From the host machine poky build_dir, run \"crosstap root@192.168.7.2 trace_open.stp\".",
+          "expected_results": ""
+        },
+        "6": {
+          "action": "In QEMU, try to open some applications, such as open a terminal, input some command,  \n\n",
+          "expected_results": ""
+        },
+        "7": {
+          "action": "Check the host machine, \"crosstap\" has related output. \n\n\n\nNOTE:  Do not build the kernel from shared state(sstate-cache) for this to work.",
+          "expected_results": "The script should successfully connect to the qemu machine and there \nshould be presented a list of services(pid, process name) which run on \nthe qemu machine. "
+        }
+      },
+      "summary": "Crosstap_script_check"
+    }
+  },
+  {
+    "test": {
+      "@alias": "oe-core.scripts.List_all_the_PACKAGECONFIG's_flags",
+      "author": [
+        {
+          "email": "yi.zhao@windriver.com",
+          "name": "yi.zhao@windriver.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": " Download the poky source and setup the environment. ",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "Run \"../scripts/contrib/list-packageconfig-flags.py\" ",
+          "expected_results": "In step 2, will list available pkgs which have PACKAGECONFIG flags:  \nPACKAGE NAME (or RECIPE NAME)           PACKAGECONFIG FLAGS  \n==============================================================  \nalsa-tools-1.0.26.1                                         defaultval gtk+  \navahi-ui-0.6.31                                                defaultval python  \nbluez4-4.101                                                alsa defaultval pie  \n"
+        },
+        "3": {
+          "action": "Run \"../scripts/contrib/list-packageconfig-flags.py -f\" ",
+          "expected_results": "In step 3, will list available PACKAGECONFIG flags and all affected pkgs  \nPACKAGECONFIG FLAG       PACKAGE NAMES (or RECIPE NAMES)  \n====================================  \n3g                             connman-1.16  \n        \navahi                        cups-1.6.3  pulseaudio-4.0  \nbeecrypt                   rpm-5.4.9  rpm-native-5.4.9  \n"
+        },
+        "4": {
+          "action": "Run \"../scripts/contrib/list-packageconfig-flags.py -a\" ",
+          "expected_results": "In step 4, will list all pkgs and PACKAGECONFIG information:  \n==================================================  \ngtk+-2.24.18  \n/home/jiahongxu/yocto/poky/meta/recipes-gnome/gtk+/gtk+_2.24.18.bb  \nPACKAGECONFIG x11  \nPACKAGECONFIG[x11] --with-x=yes --with-gdktarget=x11,--with-x=no,${X11DEPENDS}  \nxf86-video-intel-2.21.9  \n/home/jiahongxu/yocto/poky/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.9.bb  \nPACKAGECONFIG None  \nPACKAGECONFIG[xvmc] --enable-xvmc,--disable-xvmc,libxvmc  \nPACKAGECONFIG[sna] --enable-sna,--disable-sna  \n"
+        },
+        "5": {
+          "action": "Run \"../scripts/contrib/list-packageconfig-flags.py -p\"   ",
+          "expected_results": "In step 5, will list pkgs with preferred version:  \nPACKAGE NAME (or RECIPE NAME)              PACKAGECONFIG FLAGS  \n===================================================  \nalsa-tools-1.0.26.1                                           defaultval gtk+  \navahi-ui-0.6.31                                                   defaultval python  \nbluez4-4.101                                                       alsa defaultval pie  \nbluez5-5.7                                                            alsa defaultval obex-profiles  \n\n\n\n "
+        }
+      },
+      "summary": "List_all_the_PACKAGECONFIG's_flags"
+    }
+  },
+  {
+    "test": {
+      "@alias": "oe-core.bitbake.Test_bitbake_menuconfig",
+      "author": [
+        {
+          "email": "jose.perez.carranza@intel.com",
+          "name": "jose.perez.carranza@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "clone poky  \n \n",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "cd poky   \n\n",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "source oe-init-build-env && cd build    \n\n",
+          "expected_results": ""
+        },
+        "4": {
+          "action": "set below in local.conf   \n\n  \tMACHINE = \"qemux86\"  \n\n",
+          "expected_results": ""
+        },
+        "5": {
+          "action": "bitbake linux-yocto -c kernel_configme -f   \n\n",
+          "expected_results": ""
+        },
+        "6": {
+          "action": "bitbake linux-yocto -c menuconfig   \n\n",
+          "expected_results": ""
+        },
+        "7": {
+          "action": "Once menuconfig launches, use the interface to navigate through the selections and \n   enable option \"64-bit kernel\"  \n\n",
+          "expected_results": ""
+        },
+        "8": {
+          "action": "Save changes and set name of the file as \"test.config\"  ",
+          "expected_results": "Open file:  \n \npoky/build//tmp/work/qemux86-poky-linux/linux-yocto/4.X.X+*/linux-qemux86-standard-build/test.config   \n  \n \n\nand verify that changes are present in the file as follows:   \n \nCONFIG_64BIT=y  \n \nCONFIG_X86_64=y"
+        }
+      },
+      "summary": "Test_bitbake_menuconfig"
+    }
+  },
+  {
+    "test": {
+      "@alias": "oe-core.bitbake.test_bitbake_devshell",
+      "author": [
+        {
+          "email": "jose.perez.carranza@intel.com",
+          "name": "jose.perez.carranza@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "clone poky ",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "cd poky  ",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "source oe-init-build-env && cd build ",
+          "expected_results": ""
+        },
+        "4": {
+          "action": "bitbake matchbox-desktop ",
+          "expected_results": "Package was build correctly "
+        },
+        "5": {
+          "action": "bitbake matchbox-desktop -c devshell ",
+          "expected_results": "A terminal with a shell prompt within the OpenEmbedded build environment is opened "
+        },
+        "6": {
+          "action": "Verify that \"matchbox-desktop\" binary file is not created under\"src\" directory ",
+          "expected_results": ""
+        },
+        "7": {
+          "action": "Run command:./configure && make ",
+          "expected_results": "Verify that \"matchbox-desktop\" binary file was created successfully under \"src/\" directory "
+        },
+        "8": {
+          "action": "Exit fromthe devshell terminal,exit ",
+          "expected_results": "Terminal back to the build directory"
+        }
+      },
+      "summary": "test_bitbake_devshell"
+    }
+  },
+  {
+    "test": {
+      "@alias": "oe-core.bitbake.test_dependency_explorer_is_launched",
+      "author": [
+        {
+          "email": "jose.perez.carranza@intel.com",
+          "name": "jose.perez.carranza@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "clone poky ",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "cd poky ",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "source oe-init-build-env ",
+          "expected_results": ""
+        },
+        "4": {
+          "action": "bitbake core-image-full-cmdline   \n",
+          "expected_results": "Image should be successfully built   \n"
+        },
+        "5": {
+          "action": "bitbake -u taskexp -g core-image-full-cmdline    \n\nNOTE: To execute the last command of this test, it's necessary that the machine is executing an X11 server, or if that's not the case (for example, if running the test on a headless server), it is required to enable ssh X11 forwarding on both, the server and the client, and have the X11 server running on the client.    \n\nThe instructions to enable X11 forwarding vary between distributions. But for example, these are the steps to enable it between a server running openSUSE Leap 42.1 and a client with Fedora 24:  \nA. On the server, make sure /home//.ssh/config contains the line:  \n     ForwardX11 yes  \nB. On the server, make sure xauth is installed by running:  \n      which xauth  \nC. On the client, connect to the server, enabling X11 forwarding, for example by using:  \n      ssh -X user@server    \nNOTE 2: depexp was renamed to taskexp on 2.3 M4",
+          "expected_results": "Verify that a \"dependency explorer\" is opened and file \n   dependencies are listed  "
+        }
+      },
+      "summary": "test_dependency_explorer_is_launched"
+    }
+  },
+  {
+    "test": {
+      "@alias": "oe-core.bitbake.test_bitbake_sane_error_for_invalid_layer",
+      "author": [
+        {
+          "email": "jose.perez.carranza@intel.com",
+          "name": "jose.perez.carranza@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "clone poky  \n",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "cd poky  \n \n",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "source oe-init-build-env && cd build  \n \n",
+          "expected_results": ""
+        },
+        "4": {
+          "action": "Add a invalid layer to conf/bblayers.conf  \"<poky dir>/my-invalid-layer\" \n\t\n",
+          "expected_results": ""
+        },
+        "5": {
+          "action": "bitbake core-image-minimal",
+          "expected_results": "Below error should be displayed:\n\"ERROR: Layer directory  does not exist! Please check BBLAYERS in <poky dir>/<build dir>/conf/bblayers.conf\""
+        }
+      },
+      "summary": "test_bitbake_sane_error_for_invalid_layer"
+    }
+  },
+  {
+    "test": {
+      "@alias": "oe-core.bitbake.Test_bitbake-selftest",
+      "author": [
+        {
+          "email": "jair.de.jesus.gonzalez.plascencia@intel.com",
+          "name": "jair.de.jesus.gonzalez.plascencia@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "clone poky ",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "cd poky ",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "source oe-init-build-env ",
+          "expected_results": ""
+        },
+        "4": {
+          "action": "bitbake-selftest -v\n",
+          "expected_results": "All test cases are executed and no errors are reported.\n"
+        }
+      },
+      "summary": "Test_bitbake-selftest"
+    }
+  }
+]
\ No newline at end of file
diff --git a/meta/lib/oeqa/manual/sdk.json b/meta/lib/oeqa/manual/sdk.json
new file mode 100644
index 0000000..6475586
--- /dev/null
+++ b/meta/lib/oeqa/manual/sdk.json
@@ -0,0 +1,32 @@
+[
+    {
+        "test": {
+            "@alias": "sdk.sdk_runqemu.test_sdk_toolchain_can_run_multiple_QEMU_machines_under_UNFS",
+            "author": [
+                {
+                    "email": "ee.peng.yeoh@intel.com",
+                    "name": "ee.peng.yeoh@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "Prepare kernel, rootfs tar.bz2 image, and qemu configuration  \n    \ta. Download kernel, rootfs tar.bz2 image and qemu configuration from public autobuilder webpage  \n    \tb. Goto https://autobuilder.yocto.io/pub/releases/<target_release>/machines/qemu/qemux86/ \n    \tc. Download  \n    \t  \ti. rootfs tar.bz2: core-image-sato-sdk-qemux86.tar.bz2 \n      \t\tii. kernel: bzImage-qemux86.bin \n      \t\tiii. qemu configuration: core-image-sato-sdk-qemux86.qemuboot.conf ",
+                    "expected_results": ""
+                },
+                "2": {
+                    "action": "Download & install sdk toolchain from public autobuilder \n    \ta. Goto https://autobuilder.yocto.io/pub/releases/<target_release>/toolchain/x86_64/ \n    \tb. Download poky-glibc-x86_64-core-image-sato-sdk-<type-arch>-toolchain-<release-version>.sh \n    \tc. Run command: poky-glibc-x86_64-core-image-sato-sdk-<type-arch>-toolchain-<release-version>.sh",
+                    "expected_results": ""
+                },
+                "3": {
+                    "action": "Extract rootfs twice into two images \n    \ta. Run 2 commands below:  \n                  runqemu-extract-sdk core-image-sato-sdk-qemux86.tar.bz2 qemux86_rootfs_image1  \n                  runqemu-extract-sdk core-image-sato-sdk-qemux86.tar.bz2 qemux86_rootfs_image2",
+                    "expected_results": ""
+                },
+                "4": {
+                    "action": " From the 2 terminals, start qemu to boot up both two images \n    \ta. Run 2 commands below:  \n                  runqemu core-image-sato-sdk-qemux86.qemuboot.conf qemux86_rootfs_image1  \n                  runqemu core-image-sato-sdk-qemux86.qemuboot.conf qemux86_rootfs_image2 ",
+                    "expected_results": "Expect both qemu to boot up successfully."
+                }
+            },
+            "summary": "test_sdk_toolchain_can_run_multiple_QEMU_machines_under_UNFS"
+        }
+    }
+]
\ No newline at end of file
-- 
2.7.4


