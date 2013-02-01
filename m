Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1U1HRl-0004le-36
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 15:18:32 +0100
Received: from yow-bashfiel-d3.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r11E2fTQ000226;
	Fri, 1 Feb 2013 06:02:43 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Fri,  1 Feb 2013 09:02:36 -0500
Message-Id: <9f78073ee8df4b9e5e843e03ef6fbc549b7ba63d.1359726620.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1359726620.git.bruce.ashfield@windriver.com>
References: <cover.1359726620.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1359726620.git.bruce.ashfield@windriver.com>
References: <cover.1359726620.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] kernel-yocto: fix .scc and .cfg matching
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Feb 2013 14:18:55 -0000

SRC_URIs that contained git repositories or other constructs that resulted
in an extension of "." or a substring of "scc" or "cfg" were matching the
tests for patches and configs. This was due to a python tuple being used
instead of an array. Switching to an array makes the match exact and the
behaviour we want.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index b336e43..962b493 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -20,7 +20,7 @@ def find_sccs(d):
     sources_list=[]
     for s in sources:
         base, ext = os.path.splitext(os.path.basename(s))
-        if ext and ext in ('.scc' '.cfg'):
+        if ext and ext in [".scc", ".cfg"]:
             sources_list.append(s)
         elif base and base in 'defconfig':
             sources_list.append(s)
-- 
1.7.10.4



