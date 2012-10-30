Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1TT8Lj-0002qC-Fa
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Oct 2012 10:43:07 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q9U9TVG0028855
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2012 02:29:31 -0700 (PDT)
Received: from localhost.localdomain (128.224.163.124) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Tue, 30 Oct 2012 02:29:31 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 30 Oct 2012 17:33:43 +0800
Message-ID: <8757dbc0cba44d712d24bea43a3ed78c37b0f991.1351496696.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
In-Reply-To: <cover.1351496696.git.liezhi.yang@windriver.com>
References: <cover.1351496696.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 02/11] multilib.bbclass: add class-multilib to override
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
X-List-Received-Date: Tue, 30 Oct 2012 09:43:08 -0000
Content-Type: text/plain

Add the new override way CLASSOVERRIDE = "class-multilib" to
multilib.bbclass, and add the check code to sanity.bbclass, we keep both
the old and new way, which means, both of the following are supported:

virtclass-multilib
class-multilib

[YOCTO #3297]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/multilib.bbclass | 2 ++
 meta/classes/sanity.bbclass   | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 77ccce4..2dd2f85 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -1,3 +1,5 @@
+CLASSOVERRIDE = "class-multilib"
+
 python multilib_virtclass_handler () {
     if not isinstance(e, bb.event.RecipePreFinalise):
         return
diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 3806bc5..ba1cd6d 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -122,7 +122,8 @@ def check_toolchain(data):
                 tune_error_set.append("The multilib '%s' appears more than once." % lib)
             else:
                 seen_libs.append(lib)
-            tune = data.getVar("DEFAULTTUNE_virtclass-multilib-%s" % lib, True)
+            tune = data.getVar("DEFAULTTUNE_virtclass-multilib-%s" % lib, True) or \
+                   data.getVar("DEFAULTTUNE_class-multilib-%s" % lib, True)
             if tune in seen_tunes:
                 tune_error_set.append("The tuning '%s' appears in more than one multilib." % tune)
             else:
-- 
1.7.11.2



