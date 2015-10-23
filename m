Return-Path: <Bruce.Ashfield@windriver.com>
X-Greylist: delayed 3667 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 23 Oct 2015 21:19:44 UTC
Received: from mail5.wrs.com (unknown [64.129.254.146])
	by mail.openembedded.org (Postfix) with ESMTP id 964D375E80
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Oct 2015 21:19:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id t9NKIdFM008857
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 23 Oct 2015 13:18:39 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Fri, 23 Oct 2015 13:18:39 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 23 Oct 2015 16:18:32 -0400
Message-ID: <5ca9afcb13639cc38ed268cae4a82709c148759c.1445631234.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1445631234.git.bruce.ashfield@windriver.com>
References: <cover.1445631234.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6] linux-yocto: skip kernel meta data branches when finding machine branch
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
X-List-Received-Date: Fri, 23 Oct 2015 21:19:46 -0000
Content-Type: text/plain

Before the fetcher validated the specified SRCREV was reachable on a
specified branch, linux-yocto style kernel's were comparing the value
of KBRANCH and branch on the SRC_URI and then allowing a SRC_URI
specified branch to override KBRANCH.

With the introduction of kernel meta data on the SRC_URI, this routine
is incorrectly picking up a kernel-cache repository and then attempting
to apply that branch information to the kernel repository.

The rationalization of the branch specification is largely no longer
required, and will may be removed in the future. But for now, to keep
changes minimal, we can simply not return branch information that comes
from kernel meta data by checking the 'type' parameter and skipping
if it is of type 'kmeta'.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 325f94c73560..00d9667fe0a6 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -52,7 +52,9 @@ def get_machine_branch(d, default):
         parm = urldata.parm
         if "branch" in parm:
             branches = urldata.parm.get("branch").split(',')
-            return branches[0]
+            btype = urldata.parm.get("type")
+            if btype != "kmeta":
+                return branches[0]
 	    
     return default
 
-- 
2.1.0


