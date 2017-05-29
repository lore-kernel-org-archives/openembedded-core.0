Return-Path: <erik.boto@pelagicore.com>
Received: from ORO-EDGE-02.luxoft.com (oro-edge-02.luxoft.com [109.166.244.22])
	by mail.openembedded.org (Postfix) with ESMTP id A7AC477FD1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 06:09:49 +0000 (UTC)
Received: from ORO-HUBT-03.luxoft.com (172.30.115.38) by
	oro-edge-02.luxoft.com (172.30.19.22) with Microsoft SMTP Server (TLS)
	id 14.3.319.2; Mon, 29 May 2017 09:09:49 +0300
Received: from debbie.luxoft.com (172.31.240.101) by ORO-HUBT-03.luxoft.com
	(172.30.115.101) with Microsoft SMTP Server (TLS) id 14.3.319.2;
	Mon, 29 May 2017 09:09:50 +0300
From: =?UTF-8?q?Erik=20Bot=C3=B6?= <erik.boto@pelagicore.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 29 May 2017 08:09:35 +0200
Message-ID: <20170529060935.8093-5-erik.boto@pelagicore.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170529060935.8093-1-erik.boto@pelagicore.com>
References: <20170529060935.8093-1-erik.boto@pelagicore.com>
MIME-Version: 1.0
X-Originating-IP: [172.31.240.101]
Subject: [PATCH v2 4/4] sshcontrol.py: in copy_to() always use scp
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
X-List-Received-Date: Mon, 29 May 2017 06:09:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The current implementation is broken when the localpath is a link.
Then only a symlink would be created on the target, instead of copying
the actual file.

[YOCTO #11524]

Signed-off-by: Erik Botö <erik.boto@pelagicore.com>
---
 meta/lib/oeqa/utils/sshcontrol.py | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/utils/sshcontrol.py b/meta/lib/oeqa/utils/sshcontrol.py
index 05d6502550..d292893c08 100644
--- a/meta/lib/oeqa/utils/sshcontrol.py
+++ b/meta/lib/oeqa/utils/sshcontrol.py
@@ -150,12 +150,9 @@ class SSHControl(object):
 
     def copy_to(self, localpath, remotepath):
         if os.path.islink(localpath):
-            link = os.readlink(localpath)
-            dst_dir, dst_base = os.path.split(remotepath)
-            return self.run("cd %s; ln -s %s %s" % (dst_dir, link, dst_base))
-        else:
-            command = self.scp + [localpath, '%s@%s:%s' % (self.user, self.ip, remotepath)]
-            return self._internal_run(command, ignore_status=False)
+            localpath = os.path.dirname(localpath) + "/" + os.readlink(localpath)
+        command = self.scp + [localpath, '%s@%s:%s' % (self.user, self.ip, remotepath)]
+        return self._internal_run(command, ignore_status=False)
 
     def copy_from(self, remotepath, localpath):
         command = self.scp + ['%s@%s:%s' % (self.user, self.ip, remotepath), localpath]
-- 
2.11.0


