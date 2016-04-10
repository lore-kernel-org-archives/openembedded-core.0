Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DF83677187
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Apr 2016 14:14:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u3AEEwgw015503
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Apr 2016 07:14:58 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 10 Apr 2016 07:14:57 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 10 Apr 2016 07:14:56 -0700
Message-ID: <86645b1cea4e8cd70156e0fd5f4fb2480933b81d.1460297667.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1460297667.git.liezhi.yang@windriver.com>
References: <cover.1460297667.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] base.bbclass: fix COMPATIBLE_MACHINE
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
X-List-Received-Date: Sun, 10 Apr 2016 14:14:58 -0000
Content-Type: text/plain

It mismatched such as qemux86 and qemux86-64 which was incorrect, for
example:
COMPATIBLE_MACHINE = "(qemux86)"
But it treated MACHINE = "qemux86-64" as matched. The similar to others.

This patch fixes the problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index f9697a9..f376478 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -469,7 +469,7 @@ python () {
         import re
         compat_machines = (d.getVar('MACHINEOVERRIDES', True) or "").split(":")
         for m in compat_machines:
-            if re.match(need_machine, m):
+            if re.match('^' + need_machine + '$', m):
                 break
         else:
             raise bb.parse.SkipPackage("incompatible with machine %s (not in COMPATIBLE_MACHINE)" % d.getVar('MACHINE', True))
-- 
2.8.0


