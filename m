Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web08.2055.1611711379379759731
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 17:36:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: jay.shen.teoh@intel.com)
IronPort-SDR: +Sq0/Y9Eqir07Q2EaEXYcZuFAJor8SWrAr8bm0daH8/OdCVoY3hXxZiIVgJq7JywPyLyytvo2q
 QQb/qO3tby7g==
X-IronPort-AV: E=McAfee;i="6000,8403,9876"; a="167672941"
X-IronPort-AV: E=Sophos;i="5.79,378,1602572400"; 
   d="scan'208";a="167672941"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2021 17:36:18 -0800
IronPort-SDR: qFIrpxQuNLygDKJJuzdCHjBa4lraat68M23j6nMXq34r5U6ERTZ7gucbraMwE6IPpTsuLyWcG8
 zi0GAe3APsZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,378,1602572400"; 
   d="scan'208";a="429917600"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by orsmga001.jf.intel.com with ESMTP; 26 Jan 2021 17:36:17 -0800
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/ethernet_ip_connman : add test for network connections
Date: Wed, 27 Jan 2021 09:36:13 +0800
Message-Id: <1611711373-34882-1-git-send-email-jay.shen.teoh@intel.com>
X-Mailer: git-send-email 2.7.4

From: Teoh Jay Shen <jay.shen.teoh@intel.com>

This test mimic the ethernet_static_ip_set_in_connman and ethernet_get_IP_in_connman_via_DHCP test case from oeqa/manual/bsp-hw.json.
The ethernet_static_ip_set_in_connman and ethernet_get_IP_in_connman_via_DHCP manual test case should be remove from oeqa/manual/bsp-hw.json if this patch get merged.

Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
---
 meta/lib/oeqa/runtime/cases/ethernet_ip_connman.py | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/cases/ethernet_ip_connman.py

diff --git a/meta/lib/oeqa/runtime/cases/ethernet_ip_connman.py b/meta/lib/oeqa/runtime/cases/ethernet_ip_connman.py
new file mode 100644
index 0000000..e010612
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/ethernet_ip_connman.py
@@ -0,0 +1,36 @@
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.core.decorator.data import skipIfQemu
+
+class Ethernet_Test(OERuntimeTestCase):
+
+    def set_ip(self, x): 
+        x = x.split(".")
+        sample_host_address = '150'        
+        x[3] = sample_host_address
+        x = '.'.join(x)
+        return x
+    
+    @skipIfQemu('qemuall', 'Test only runs on real hardware')    
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_set_virtual_ip(self):
+        (status, output) = self.target.run("ifconfig eth0 | grep 'inet ' | awk '{print $2}'")
+        self.assertEqual(status, 0, msg='Failed to get ip address. Make sure you have an ethernet connection on your device, output: %s' % output)
+        original_ip = output 
+        virtual_ip = self.set_ip(original_ip)
+        
+        (status, output) = self.target.run("ifconfig eth0:1 %s netmask 255.255.255.0 && sleep 2 && ping -c 5 %s && ifconfig eth0:1 down" % (virtual_ip,virtual_ip))
+        self.assertEqual(status, 0, msg='Failed to create virtual ip address, output: %s' % output)
+        
+    @OETestDepends(['ethernet_ip_connman.Ethernet_Test.test_set_virtual_ip'])  
+    def test_get_ip_from_dhcp(self): 
+        (status, output) = self.target.run("connmanctl services | grep -E '*AO Wired|*AR Wired' | awk '{print $3}'")
+        self.assertEqual(status, 0, msg='No wired interfaces are detected, output: %s' % output)
+        wired_interfaces = output
+        
+        (status, output) = self.target.run("ip route | grep default | awk '{print $3}'")
+        self.assertEqual(status, 0, msg='Failed to retrieve the default gateway, output: %s' % output)
+        default_gateway = output
+
+        (status, output) = self.target.run("connmanctl config %s --ipv4 dhcp && sleep 2 && ping -c 5 %s" % (wired_interfaces,default_gateway))
+        self.assertEqual(status, 0, msg='Failed to get dynamic IP address via DHCP in connmand, output: %s' % output)
\ No newline at end of file
-- 
2.7.4

