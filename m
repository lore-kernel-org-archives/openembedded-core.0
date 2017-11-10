Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5C2F278639
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 13:22:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vAADMmf6001309
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 05:22:48 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Fri, 10 Nov 2017 05:22:47 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Nov 2017 14:27:04 +0800
Message-ID: <ea602cb46325350d97d0f19e827c40467193f01a.1510275834.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1510275834.git.liezhi.yang@windriver.com>
References: <cover.1510275834.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 04/23] oe/copy_buildsystem.py: make sure layer exists
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
X-List-Received-Date: Fri, 10 Nov 2017 13:22:47 -0000
Content-Type: text/plain

It had a problem when nested layer before, e.g.:
layer_a/layer_b/

And when layer_b is handled before layer_a, then layer_a dir existed, so
it would be treated as already handled, which was wrong, check
conf/layer.conf can fix the problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oe/copy_buildsystem.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/copy_buildsystem.py b/meta/lib/oe/copy_buildsystem.py
index ac2fae1..4b94806 100644
--- a/meta/lib/oe/copy_buildsystem.py
+++ b/meta/lib/oe/copy_buildsystem.py
@@ -95,7 +95,7 @@ class BuildSystem(object):
                     destname = os.path.join(layerdestpath, f_basename)
                     _smart_copy(f, destname)
             else:
-                if os.path.exists(layerdestpath):
+                if os.path.exists(os.path.join(layerdestpath, 'conf/layer.conf')):
                     bb.note("Skipping layer %s, already handled" % layer)
                 else:
                     _smart_copy(layer, layerdestpath)
-- 
2.7.4


