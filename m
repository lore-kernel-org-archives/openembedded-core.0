Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 91F8B60745
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Dec 2018 02:24:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wBA2OSlm028185
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 9 Dec 2018 18:24:28 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Sun, 9 Dec 2018 18:24:28 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 9 Dec 2018 18:24:21 -0800
Message-ID: <bb3ede855b1af3d681a1007ccfff34be43cf6c27.1544408339.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1544408339.git.liezhi.yang@windriver.com>
References: <cover.1544408339.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] base.bbclass: Remove invalid ccache related code
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
X-List-Received-Date: Mon, 10 Dec 2018 02:24:27 -0000
Content-Type: text/plain

The code is in setup_hosttools_dir(), it searches ccache in PATH in reverse
order, I can't figure out what it is used for, maybe it is aimed to use host's
ccache rather than recipe-sysroot-native/usr/bin/ccache, but the later one
isn't in original PATH, so remove the code.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/base.bbclass | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index e715ffa..36b9c15 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -122,8 +122,6 @@ def setup_hosttools_dir(dest, toolsvar, d, fatal=True):
         desttool = os.path.join(dest, tool)
         if not os.path.exists(desttool):
             srctool = bb.utils.which(path, tool, executable=True)
-            if "ccache" in srctool:
-                srctool = bb.utils.which(path, tool, executable=True, direction=1)
             if srctool:
                 os.symlink(srctool, desttool)
             else:
-- 
2.10.2


