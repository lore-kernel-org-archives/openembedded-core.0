Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8922B6C46D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Dec 2018 06:43:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wBC6h3ZX027014
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 22:43:13 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Tue, 11 Dec 2018 22:42:53 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Dec 2018 14:59:59 +0800
Message-ID: <3623f754f6cd91a1721933eed0c5a50ffbdfe14b.1544597612.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1544597612.git.liezhi.yang@windriver.com>
References: <cover.1544597612.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/6] base.bbclass: Add comments for gcc links to ccache
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
X-List-Received-Date: Wed, 12 Dec 2018 06:43:22 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/base.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index e715ffa..e6af673 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -122,6 +122,10 @@ def setup_hosttools_dir(dest, toolsvar, d, fatal=True):
         desttool = os.path.join(dest, tool)
         if not os.path.exists(desttool):
             srctool = bb.utils.which(path, tool, executable=True)
+            # gcc/g++ may link to ccache on some hosts, e.g.,
+            # /usr/local/bin/ccache/gcc -> /usr/bin/ccache, then which(gcc)
+            # would return /usr/local/bin/ccache/gcc, but what we need is
+            # /usr/bin/gcc, this code can check and fix that.
             if "ccache" in srctool:
                 srctool = bb.utils.which(path, tool, executable=True, direction=1)
             if srctool:
-- 
2.7.4


