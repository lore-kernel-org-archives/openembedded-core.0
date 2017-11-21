Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 243656078E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 13:10:50 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	vALDAofk017582
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 21 Nov 2017 13:10:51 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1eH8K9-0004Tl-WF; Tue, 21 Nov 2017 13:10:49 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Nov 2017 13:10:45 +0000
Message-Id: <1511269847-17161-4-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1511269847-17161-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1511269847-17161-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 4/6] runqemu: Improve relative path handling in qemuconf files
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
X-List-Received-Date: Tue, 21 Nov 2017 13:10:52 -0000

If a variable starts with "../", its likely its a path and we want to
set it to an absolute path relative to the qemuconf file.

This means we don't have to use bitbake as often to figure out variables.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/runqemu | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index ad88da3..b09cf1c 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -726,6 +726,8 @@ class BaseConfig(object):
         cf.read(self.qemuboot)
         for k, v in cf.items('config_bsp'):
             k_upper = k.upper()
+            if v.startswith("../"):
+                v = os.path.abspath(os.path.dirname(self.qemuboot) + "/" + v)
             self.set(k_upper, v)
 
     def validate_paths(self):
-- 
2.7.4


