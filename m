Return-Path: <Kexin.Hao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DD31D7D691
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2019 07:24:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x567NQqS026659
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Jun 2019 00:24:02 -0700
Received: from pek-lpggp6.wrs.com (128.224.153.40) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 6 Jun 2019 00:23:56 -0700
From: Kevin Hao <kexin.hao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 6 Jun 2019 15:11:47 +0800
Message-ID: <20190606071147.32050-2-kexin.hao@windriver.com>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20190606071147.32050-1-kexin.hao@windriver.com>
References: <20190606071147.32050-1-kexin.hao@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] oeqa/utils/qemurunner: Set both the threadport&serverport with tcpserial parameter
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
X-List-Received-Date: Thu, 06 Jun 2019 07:24:12 -0000
Content-Type: text/plain

After the commit ad522ea6a64e ("runqemu: Let qemuparams override default
settings"), the order of the two "-serial" parameters when running the
qemu have been switched. The effect of this is that the logging thread
will use ttyS1 (of course can't capture the kernel boot message anymore),
and the test command will run on the ttyS0. So the output of the test
command may be mangled by the kernel message (such as call trace), and
let the test command produce a fake timeout error message. We can't fix
it by just adjusting the order of the threadport and serverport, since
it will break some machines such as qemuarm64 which use the virtio
serial. So using the tcpserial to setup both the threadport and
serverport.

[YOCTO Bug 13309]

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index fd386ef5a20a..6d2860c1061a 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -155,11 +155,11 @@ class QemuRunner:
         # and analyze descendents in order to determine it.
         if os.path.exists(self.qemu_pidfile):
             os.remove(self.qemu_pidfile)
-        self.qemuparams = 'bootparams="{0}" qemuparams="-serial tcp:127.0.0.1:{1} -pidfile {2}"'.format(bootparams, threadport, self.qemu_pidfile)
+        self.qemuparams = 'bootparams="{0}" qemuparams="-pidfile {1}"'.format(bootparams, self.qemu_pidfile)
         if qemuparams:
             self.qemuparams = self.qemuparams[:-1] + " " + qemuparams + " " + '\"'
 
-        launch_cmd += ' tcpserial=%s %s' % (self.serverport, self.qemuparams)
+        launch_cmd += ' tcpserial=%s:%s %s' % (threadport, self.serverport, self.qemuparams)
 
         self.origchldhandler = signal.getsignal(signal.SIGCHLD)
         signal.signal(signal.SIGCHLD, self.handleSIGCHLD)
-- 
2.14.4


