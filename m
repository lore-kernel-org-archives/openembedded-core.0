Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BE2C971951
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Feb 2018 03:22:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w123MsWF006552
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Feb 2018 19:22:54 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Thu, 1 Feb 2018 19:22:53 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Feb 2018 11:23:26 +0800
Message-ID: <3e5edeaacf65212a1fce974e5eef6c4ac2e088e1.1517541572.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1517541572.git.liezhi.yang@windriver.com>
References: <cover.1517541572.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] runqemu: check for qemuboot.conf and raise error
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
X-List-Received-Date: Fri, 02 Feb 2018 03:22:52 -0000
Content-Type: text/plain

[YOCTO #12503]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/runqemu | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index 0ca62f4..d50c6d1 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -417,6 +417,9 @@ class BaseConfig(object):
 
         unknown_arg = ""
         for arg in sys.argv[1:]:
+            if arg.endswith('.qemuboot.conf'):
+                raise RunQemuError("qemuboot.conf is not supported any more, use qemuboot.json to instead of it")
+
             if arg in self.fstypes + self.vmtypes:
                 self.check_arg_fstype(arg)
             elif arg == 'nographic':
-- 
2.7.4


