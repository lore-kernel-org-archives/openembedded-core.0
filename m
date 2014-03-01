Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id EEBCC6BC8B
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Mar 2014 15:22:18 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s21FMDVU032076 for <openembedded-core@lists.openembedded.org>;
	Sat, 1 Mar 2014 15:22:14 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 4uTONXyxKuQB
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Mar 2014 15:22:13 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s21FM8QX032071
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 1 Mar 2014 15:22:10 GMT
Message-ID: <1393687321.20876.6.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 01 Mar 2014 15:22:01 +0000
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] oeqa/runtime/dmesg: Ignore DMA timeout errors
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
X-List-Received-Date: Sat, 01 Mar 2014 15:22:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We see these from qemu images on servers under load. They're not interesting
and clutter the build output so lets ignore them.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/lib/oeqa/runtime/dmesg.py b/meta/lib/oeqa/runtime/dmesg.py
index a53d1f0..64247ea 100644
--- a/meta/lib/oeqa/runtime/dmesg.py
+++ b/meta/lib/oeqa/runtime/dmesg.py
@@ -7,5 +7,5 @@ class DmesgTest(oeRuntimeTest):
 
     @skipUnlessPassed('test_ssh')
     def test_dmesg(self):
-        (status, output) = self.target.run('dmesg | grep -v mmci-pl18x | grep -v "error changing net interface name" | grep -i error')
+        (status, output) = self.target.run('dmesg | grep -v mmci-pl18x | grep -v "error changing net interface name" | grep -iv "dma timeout" | grep -i error')
         self.assertEqual(status, 1, msg = "Error messages in dmesg log: %s" % output)



