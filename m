Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 925DE75A38
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Oct 2015 13:17:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t98DH0MX016090
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Oct 2015 06:17:00 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 8 Oct 2015 06:17:00 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 8 Oct 2015 06:16:54 -0700
Message-ID: <18a2e42949e3b3f6d18f1a72f2f870115731046e.1444310101.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1444310101.git.liezhi.yang@windriver.com>
References: <cover.1444310101.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/8] insane.bbclass: buildpaths: ignore .pyc files
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
X-List-Received-Date: Thu, 08 Oct 2015 13:17:00 -0000
Content-Type: text/plain

The .pyc files usually contain build path like:

i586-poky-linux-gcc  -m32 -march=i586 --sysroot=/buildarea/lyang1/test_p/tmp/sysroots/qemux86
And:
_PYTHON_PROJECT_BASE=/buildarea/lyang1/test_p/tmp/work/i586-poky-linux/python/2.7.9-r1/build

They are safe, so ignore them.

This can reduce 1065 QA issues for buildpaths in a world build.

[YOCTO #8446]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/insane.bbclass |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index e3a8cd7..664dfec 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -576,6 +576,10 @@ def package_qa_check_buildpaths(path, name, d, elf, messages):
     if path.find(".debug") != -1:
         return
 
+    # Ignore .pyc files, not interesting
+    if path.endswith(".pyc"):
+        return
+
     # Ignore symlinks
     if os.path.islink(path):
         return
-- 
1.7.9.5


