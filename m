Return-Path: <Kexin.Hao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 267346C1D5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2019 07:24:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x567NQqQ026659
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Jun 2019 00:23:57 -0700
Received: from pek-lpggp6.wrs.com (128.224.153.40) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 6 Jun 2019 00:23:21 -0700
From: Kevin Hao <kexin.hao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 6 Jun 2019 15:11:46 +0800
Message-ID: <20190606071147.32050-1-kexin.hao@windriver.com>
X-Mailer: git-send-email 2.14.4
MIME-Version: 1.0
Subject: [PATCH 1/2] runqemu: Add the support to pass multi ports to tcpserial parameter
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
X-List-Received-Date: Thu, 06 Jun 2019 07:24:07 -0000
Content-Type: text/plain

In some cases(such as the oeqa's qemurunner), we need to setup multi
serial devices via the '-serial 127.0.0.1:xx" and the order of them
is significant. The mixing use of "tcpserial" and "-serial 127.0.0.1:xx"
cause ambiguous issues and we can't fix it by only adjusting the order
of them. So add the support to pass multi ports to the tcpserial
parameter, this will make sure that the order of setting up the serial
is really what we want.

[YOCTO Bug 13309]

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
---
 scripts/runqemu | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 5752ecda731c..af90c010da28 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -438,7 +438,7 @@ class BaseConfig(object):
             elif arg == 'publicvnc':
                 self.qemu_opt_script += ' -vnc :0'
             elif arg.startswith('tcpserial='):
-                self.tcpserial_portnum = arg[len('tcpserial='):]
+                self.tcpserial_portnum = '%s' % arg[len('tcpserial='):]
             elif arg.startswith('biosdir='):
                 self.custombiosdir = arg[len('biosdir='):]
             elif arg.startswith('biosfilename='):
@@ -682,10 +682,16 @@ class BaseConfig(object):
 
     def check_tcpserial(self):
         if self.tcpserial_portnum:
+            ports = self.tcpserial_portnum.split(':')
+            port = ports[0]
             if self.get('QB_TCPSERIAL_OPT'):
-                self.qemu_opt_script += ' ' + self.get('QB_TCPSERIAL_OPT').replace('@PORT@', self.tcpserial_portnum)
+                self.qemu_opt_script += ' ' + self.get('QB_TCPSERIAL_OPT').replace('@PORT@', port)
             else:
-                self.qemu_opt_script += ' -serial tcp:127.0.0.1:%s' % self.tcpserial_portnum
+                self.qemu_opt_script += ' -serial tcp:127.0.0.1:%s' % port
+
+            if len(ports) > 1:
+                for port in ports[1:]:
+                    self.qemu_opt_script += ' -serial tcp:127.0.0.1:%s' % port
 
     def check_and_set(self):
         """Check configs sanity and set when needed"""
-- 
2.14.4


