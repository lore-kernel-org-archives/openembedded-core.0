Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web10.3561.1627521696193216040
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jul 2021 18:21:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: jay.shen.teoh@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10059"; a="273859519"
X-IronPort-AV: E=Sophos;i="5.84,276,1620716400"; 
   d="scan'208";a="273859519"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2021 18:21:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,276,1620716400"; 
   d="scan'208";a="517870683"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga002.fm.intel.com with ESMTP; 28 Jul 2021 18:21:27 -0700
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [dunfell][Patch 1/7] oeqa/ethernet_ip_connman : add test for network connections
Date: Thu, 29 Jul 2021 09:21:17 +0800
Message-Id: <20210729012123.27489-1-jay.shen.teoh@intel.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Teoh Jay Shen <jay.shen.teoh@intel.com>

This test mimic the ethernet_static_ip_set_in_connman and ethernet_get_IP_in_connman_via_DHCP test case from oeqa/manual/bsp-hw.json.
The ethernet_static_ip_set_in_connman and ethernet_get_IP_in_connman_via_DHCP manual test case should be remove from oeqa/manual/bsp-hw.json if this patch get merged.

(From OE-Core rev: aaabc94dbe353b12297ba4a237f6817b2c6d4a31)

Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../oeqa/runtime/cases/ethernet_ip_connman.py | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/cases/ethernet_ip_connman.py

diff --git a/meta/lib/oeqa/runtime/cases/ethernet_ip_connman.py b/meta/lib/oeqa/runtime/cases/ethernet_ip_connman.py
new file mode 100644
index 0000000000..e010612838
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
2.32.0

