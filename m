Return-Path: <george.l.musat@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7358460112
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 11:40:49 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 20 Nov 2015 03:40:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,322,1444719600"; d="scan'208";a="855716015"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 20 Nov 2015 03:40:52 -0800
Received: from localhost.localdomain (unknown [10.237.112.174])
	by linux.intel.com (Postfix) with ESMTP id 08A146A4005;
	Fri, 20 Nov 2015 03:39:43 -0800 (PST)
From: Lucian Musat <george.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Nov 2015 13:42:02 +0200
Message-Id: <1448019722-24279-1-git-send-email-george.l.musat@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oeqa/runtime: Added wifi tests.
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
X-List-Received-Date: Fri, 20 Nov 2015 11:40:51 -0000

A few wifi tests ported from IOT. They use expect scripts
to connect and an external config file for the SSIDs and
passwords.

Signed-off-by: Lucian Musat <george.l.musat@intel.com>
---
 meta/lib/oeqa/runtime/files/config.ini             |  10 ++
 meta/lib/oeqa/runtime/files/wifi_connect.exp       |  47 +++++
 .../lib/oeqa/runtime/files/wifi_hidden_connect.exp |  47 +++++
 meta/lib/oeqa/runtime/wifi.py                      | 195 +++++++++++++++++++++
 meta/lib/oeqa/utils/helper.py                      |  62 +++++++
 5 files changed, 361 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/files/config.ini
 create mode 100755 meta/lib/oeqa/runtime/files/wifi_connect.exp
 create mode 100755 meta/lib/oeqa/runtime/files/wifi_hidden_connect.exp
 create mode 100644 meta/lib/oeqa/runtime/wifi.py
 create mode 100644 meta/lib/oeqa/utils/helper.py

diff --git a/meta/lib/oeqa/runtime/files/config.ini b/meta/lib/oeqa/runtime/files/config.ini
new file mode 100644
index 0000000..eaa169a
--- /dev/null
+++ b/meta/lib/oeqa/runtime/files/config.ini
@@ -0,0 +1,10 @@
+[Connect]
+ssid_80211g=
+ssid_80211n=
+ssid_80211b=
+passwd_80211b=
+passwd_80211g=
+passwd_80211n=
+ssid_broadcast=
+passwd_broadcast=
+
diff --git a/meta/lib/oeqa/runtime/files/wifi_connect.exp b/meta/lib/oeqa/runtime/files/wifi_connect.exp
new file mode 100755
index 0000000..c0a0775
--- /dev/null
+++ b/meta/lib/oeqa/runtime/files/wifi_connect.exp
@@ -0,0 +1,47 @@
+#!/usr/bin/expect
+set timeout 100
+set login 0
+set ip       [lindex $argv 0]
+set cmd      [lindex $argv 1]
+set service  [lindex $argv 2]
+set password [lindex $argv 3]
+
+spawn ssh root@$ip -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o LogLevel=ERROR "$cmd"
+ expect {
+ "Agent registered"
+   {
+    send "config $service --remove\n";
+    sleep 2; send "connect $service\n"; exp_continue
+   }
+ "Operation timeout"
+   {
+    sleep 1; send "connect $service\n"; exp_continue
+   }
+ "Operation aborted"
+   {
+    sleep 1; send "connect $service\n"; exp_continue
+   }
+ "Input/output error"
+   {
+    sleep 1; send "connect $service\n"; exp_continue
+   }
+ "Retry (yes/no)?"
+   {
+    sleep 1; send "yes\n"; exp_continue
+   }
+ "Passphrase?"
+   {
+    sleep 1; send "$password\n"; exp_continue
+   }
+ "Connected wifi*"
+   {
+    send "exit\n"; exit 2
+   }
+ "connmanctl*"
+   {
+    if {$login==0} {set login 1;send "agent on\n"; exp_continue} else {exp_continue}
+   }
+ eof
+   {}
+ }
+
diff --git a/meta/lib/oeqa/runtime/files/wifi_hidden_connect.exp b/meta/lib/oeqa/runtime/files/wifi_hidden_connect.exp
new file mode 100755
index 0000000..0e0f45f
--- /dev/null
+++ b/meta/lib/oeqa/runtime/files/wifi_hidden_connect.exp
@@ -0,0 +1,47 @@
+#!/usr/bin/expect
+set timeout 100
+set login 0
+set ip       [lindex $argv 0]
+set cmd      [lindex $argv 1]
+set service  [lindex $argv 2]
+set ssid     [lindex $argv 3]
+set password [lindex $argv 4]
+
+spawn ssh root@$ip -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o LogLevel=ERROR "$cmd"
+ expect {
+ "Agent registered"
+   {
+    sleep 1; send "connect $service\n"; exp_continue
+   }
+ "Operation timeout"
+   {
+    sleep 1; send "connect $service\n"; exp_continue
+   }
+ "Input/output error"
+   {
+    sleep 1; send "connect $service\n"; exp_continue
+   }
+ "Hidden SSID name?"
+   {
+    sleep 1; send "$ssid\n"; exp_continue
+   }
+ "Retry (yes/no)?"
+   {
+    sleep 1; send "yes\n"; exp_continue
+   }
+ "Passphrase?"
+   {
+    sleep 1; send "$password\n"; exp_continue
+   }
+ "Connected wifi*"
+   {
+    send "exit\n"; exit 2
+   }
+ "connmanctl*"
+   {
+    if {$login==0} {set login 1;send "agent on\n"; exp_continue} else {exp_continue}
+   }
+ eof
+   {}
+ }
+
diff --git a/meta/lib/oeqa/runtime/wifi.py b/meta/lib/oeqa/runtime/wifi.py
new file mode 100644
index 0000000..c63a711
--- /dev/null
+++ b/meta/lib/oeqa/runtime/wifi.py
@@ -0,0 +1,195 @@
+import time
+import os
+import string
+import ConfigParser
+import unittest
+from oeqa.oetest import oeRuntimeTest
+from oeqa.utils.helper import shell_cmd_timeout
+from oeqa.utils.helper import get_files_dir
+from oeqa.utils.decorators import skipUnlessPassed
+
+def setUpModule():
+    if not oeRuntimeTest.hasPackage("connman"):
+        skipModule("Image does not have connection manager")
+
+ssid_config = ConfigParser.ConfigParser()
+config_path = os.path.join(os.path.dirname(__file__), "files/config.ini")
+ssid_config.readfp(open(config_path))
+
+class CommWiFiConect(oeRuntimeTest):
+
+    @classmethod
+    def setUpClass(self):
+        (status, output) = oeRuntimeTest.tc.target.run('connmanctl enable wifi')
+        if ("error" in output.lower()):
+            raise unittest.SkipTest("Failed to enable wifi: %s " % output)
+        oeRuntimeTest.tc.target.run('connmanctl disable wifi')
+
+    hidden_service = ""
+    def setUp(self):
+        # un-block software rfkill lock
+        self.target.run('rfkill unblock all')
+        # Enable WiFi
+        (status, output) = self.target.run('connmanctl enable wifi')
+        self.assertEqual(status, 0, msg="Error messages: %s" % output)
+        time.sleep(20)
+        # Scan nearby to get service of none-encryption broadcasting ssid
+        hidden_str = "hidden_managed_psk"
+        # will do scan retry 3 times if needed
+        retry = 0
+        while (retry < 4):
+            (status, output) = self.target.run('connmanctl scan wifi')
+            self.assertEqual(status, 0, msg="Error messages: %s" % output)
+            (status, services) = self.target.run("connmanctl services | grep %s" % hidden_str)
+            retry = retry + 1
+            if (status == 0):
+                break
+        self.assertEqual(status, 0, msg="Not found hidden AP service")
+        self.hidden_service = services.strip()
+
+    def tearDown(self):
+        ''' disable wifi after testing '''
+        self.target.run('connmanctl disable wifi')
+
+    def check_wifi_ip(self):
+        time.sleep(3)
+        # Check ip address by ifconfig command
+        wifi_interface = "nothing"
+        (status, wifi_interface) = self.target.run("ifconfig | grep '^wlp\|^wlan' | awk '{print $1}'")
+        (status, output) = self.target.run("ifconfig %s | grep 'inet addr:'" % wifi_interface)
+        self.assertEqual(status, 0, msg="Error messages: %s" % output)
+
+    def test_check_wifi_capable(self):
+        (status, output) = self.target.run('cp /proc/config.gz .; gunzip config.gz; cat config | grep CONFIG_IWLWIFI=')
+        self.assertEqual(status, 0, msg="Wifi not enabled in this kernel. Error messages: %s" % output)
+        (status, output) = self.target.run('connmanctl enable wifi')
+        self.assertEqual(status, 0, msg="Error messages: %s" % output)
+        (status, output) = self.target.run('ifconfig | grep wlan')
+        self.assertEqual(status, 0, msg="No wlan interface found! Error messages: %s" % output)
+        (status, output) = self.target.run('connmanctl disable wifi')
+
+    @skipUnlessPassed('test_check_wifi_capable')
+    def test_wifi_connect_80211b(self):
+        '''connmanctl to connect 802.11b wifi AP'''
+        target_ip = self.target.ip
+        ssid = ssid_config.get("Connect","ssid_80211b")
+        pwd = ssid_config.get("Connect","passwd_80211b")
+
+        # Do connection
+        exp = os.path.join(os.path.dirname(__file__), "files/wifi_hidden_connect.exp")
+        cmd = "expect %s %s %s %s %s %s" % (exp, target_ip, "connmanctl", self.hidden_service, ssid, pwd)
+        status, output = shell_cmd_timeout(cmd, timeout=60)
+        self.assertEqual(status, 2, msg="Error messages: %s" % output)
+        self.check_wifi_ip()
+
+    @skipUnlessPassed('test_check_wifi_capable')
+    def test_wifi_connect_80211g(self):
+        '''connmanctl to connect 802.11g wifi AP'''
+        target_ip = self.target.ip
+        ssid = ssid_config.get("Connect","ssid_80211g")
+        pwd = ssid_config.get("Connect","passwd_80211g")
+
+        # Do connection
+        exp = os.path.join(os.path.dirname(__file__), "files/wifi_hidden_connect.exp")
+        cmd = "expect %s %s %s %s %s %s" % (exp, target_ip, "connmanctl", self.hidden_service, ssid, pwd)
+        status, output = shell_cmd_timeout(cmd, timeout=60)
+        self.assertEqual(status, 2, msg="Error messages: %s" % output)
+        self.check_wifi_ip()
+
+    @skipUnlessPassed('test_check_wifi_capable')
+    def test_wifi_connect_80211n(self):
+        '''connmanctl to connect 802.11n wifi AP'''
+        target_ip = self.target.ip
+        ssid = ssid_config.get("Connect","ssid_80211n")
+        pwd = ssid_config.get("Connect","passwd_80211n")
+
+        # Do connection
+        exp = os.path.join(os.path.dirname(__file__), "files/wifi_hidden_connect.exp")
+        cmd = "expect %s %s %s %s %s %s" % (exp, target_ip, "connmanctl", self.hidden_service, ssid, pwd)
+        status, output = shell_cmd_timeout(cmd, timeout=60)
+        self.assertEqual(status, 2, msg="Error messages: %s" % output)
+        self.check_wifi_ip()
+
+    @skipUnlessPassed('test_check_wifi_capable')
+    def test_wifi_connect_wpapsk(self):
+        '''connmanctl to connect WPA-PSK wifi AP (set by ssid_80211b AP)'''
+        target_ip = self.target.ip
+        ssid = ssid_config.get("Connect","ssid_80211b")
+        pwd = ssid_config.get("Connect","passwd_80211b")
+
+        # Do connection
+        exp = os.path.join(os.path.dirname(__file__), "files/wifi_hidden_connect.exp")
+        cmd = "expect %s %s %s %s %s %s" % (exp, target_ip, "connmanctl", self.hidden_service, ssid, pwd)
+        status, output = shell_cmd_timeout(cmd, timeout=60)
+        self.assertEqual(status, 2, msg="Error messages: %s" % output)
+        self.check_wifi_ip()
+
+    @skipUnlessPassed('test_check_wifi_capable')
+    def test_wifi_connect_wpa2psk(self):
+        '''connmanctl to connect WPA2-PSK wifi AP (set by ssid_80211g AP)'''
+        target_ip = self.target.ip
+        ssid = ssid_config.get("Connect","ssid_80211g")
+        pwd = ssid_config.get("Connect","passwd_80211g")
+
+        # Do connection
+        exp = os.path.join(os.path.dirname(__file__), "files/wifi_hidden_connect.exp")
+        cmd = "expect %s %s %s %s %s %s" % (exp, target_ip, "connmanctl", self.hidden_service, ssid, pwd)
+        status, output = shell_cmd_timeout(cmd, timeout=60)
+        self.assertEqual(status, 2, msg="Error messages: %s" % output)
+        self.check_wifi_ip()
+
+    @skipUnlessPassed('test_check_wifi_capable')
+    def test_wifi_connect_wpa2psk_broadcast(self):
+        '''connmanctl to connect WPA2-PSK wifi AP (not hidden)'''
+        target_ip = self.target.ip
+        ssid = ssid_config.get("Connect","ssid_broadcast")
+        pwd = ssid_config.get("Connect","passwd_broadcast")
+
+        # For broadcast AP, get its service firstly.
+        retry = 0
+        while (retry < 4):
+            (status, output) = self.target.run('connmanctl scan wifi')
+            self.assertEqual(status, 0, msg="Error messages: %s" % output)
+            (status, output) = self.target.run("connmanctl services | grep %s" % ssid)
+            retry = retry + 1
+            if (status == 0):
+                break
+        self.assertEqual(status, 0, msg="Not found AP service")
+        service = output.split(" ")[-1]
+
+        # Do connection
+        exp = os.path.join(os.path.dirname(__file__), "files/wifi_connect.exp")
+        cmd = "expect %s %s %s %s %s" % (exp, target_ip, "connmanctl", service, pwd)
+        status, output = shell_cmd_timeout(cmd, timeout=200)
+        self.assertEqual(status, 2, msg="Error messages: %s" % output)
+        self.check_wifi_ip()
+
+    @skipUnlessPassed('test_check_wifi_capable')
+    def test_wifi_connect_internet(self):
+        '''connmanctl to connect to internet, by broadcast wifi AP'''
+        target_ip = self.target.ip
+        ssid = ssid_config.get("Connect","ssid_broadcast")
+        pwd = ssid_config.get("Connect","passwd_broadcast")
+
+        # For broadcast AP, get its service firstly.
+        retry = 0
+        while (retry < 4):
+            (status, output) = self.target.run('connmanctl scan wifi')
+            self.assertEqual(status, 0, msg="Error messages: %s" % output)
+            (status, output) = self.target.run("connmanctl services | grep %s" % ssid)
+            retry = retry + 1
+            if (status == 0):
+                break
+        self.assertEqual(status, 0, msg="Not found AP service")
+        service = output.split(" ")[-1]
+
+        # Do connection
+        exp = os.path.join(os.path.dirname(__file__), "files/wifi_connect.exp")
+        cmd = "expect %s %s %s %s %s" % (exp, target_ip, "connmanctl", service, pwd)
+        status, output = shell_cmd_timeout(cmd, timeout=200)
+        self.assertEqual(status, 2, msg="Error messages: %s" % output)
+        self.check_wifi_ip()
+
+        # Ping internet web links
+        (status, output) = self.target.run("ping www.google.com -c 4")
+        self.assertEqual(status, 0, msg="Error messages: %s" % output)
diff --git a/meta/lib/oeqa/utils/helper.py b/meta/lib/oeqa/utils/helper.py
new file mode 100644
index 0000000..1b4eeb5
--- /dev/null
+++ b/meta/lib/oeqa/utils/helper.py
@@ -0,0 +1,62 @@
+#[PROTEXCAT]
+#\License: ALL RIGHTS RESERVED
+#\Author: Wang, Jing <jing.j.wang@intel.com>
+
+import time
+import subprocess
+import os
+from oeqa.oetest import oeRuntimeTest
+import unittest
+
+def shell_cmd(cmd):
+    """Execute shell command till it return"""
+    cmd_proc = subprocess.Popen(cmd, shell=True)
+    return cmd_proc.wait() if cmd_proc else -1
+
+def shell_cmd_timeout(cmd, timeout=0):
+    """Execute shell command till timeout"""
+    cmd_proc = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE)
+    if not cmd_proc:
+        return -1, ''
+    t_timeout, tick = timeout, 2
+    ret, output = None, ''
+    while True:
+        time.sleep(tick)
+        output = cmd_proc.communicate()[0]
+        ret = cmd_proc.poll()
+        if ret is not None:
+            break
+
+        if t_timeout > 0:
+            t_timeout -= tick
+
+        if t_timeout <= 0:
+            # timeout, kill command
+            cmd_proc.kill()
+            ret = -99999
+            break
+    return ret, output
+
+def collect_pnp_log(casename, logname, log):
+    """collect the result log for pnp part"""
+    curpath = os.getcwd()
+    if not os.path.exists(casename):
+        os.makedirs(casename)
+
+    logpath = os.path.join(curpath, casename, logname)
+    logtime = time.strftime("%Y-%m-%d %H:%M:%S")
+    with open(logpath, "a") as text_file:
+        text_file.write("%s %s:%s\n" %(logtime, casename, log))
+
+def get_files_dir():
+    """Get directory of supporting files"""
+    pkgarch = oeRuntimeTest.tc.d.getVar('MACHINE', True)
+    deploydir = oeRuntimeTest.tc.d.getVar('DEPLOY_DIR', True)
+    return os.path.join(deploydir, "files", "target", pkgarch)
+
+def get_native_dir():
+    """Get directory of native files"""
+    arch = oeRuntimeTest.tc.d.getVar('BUILD_ARCH', True)
+    deploydir = oeRuntimeTest.tc.d.getVar('DEPLOY_DIR', True)
+    return os.path.join(deploydir, "files", "native", arch)
+
-- 
2.1.4


