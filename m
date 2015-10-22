Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 9D36E77155
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 15:22:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 52266609016
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Oct 2015 16:21:31 +0100
Message-Id: <ead4a552464309e6ef3381590994b6cea225ca20.1445527096.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1445527096.git.joshua.lock@collabora.co.uk>
References: <cover.1445527096.git.joshua.lock@collabora.co.uk>
In-Reply-To: <cover.1445527096.git.joshua.lock@collabora.co.uk>
References: <cover.1445527096.git.joshua.lock@collabora.co.uk>
Subject: [PATCH v3 10/52] classes/base: provide hints on PACKAGECONFIG error
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
X-List-Received-Date: Thu, 22 Oct 2015 15:22:21 -0000

From: Joe MacDonald <joe_macdonald@mentor.com>

Commit 771f89498c introduces an error message that is very rarely hit and
when it is, it is usually easy to trace the root cause very quickly.  The
information provided in the error message isn't enough to lead you back to
the actual failure, however, so expand upon it a bit, pinpointing the
specific package and flag that fails.

Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/base.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index f078001..d711ae4 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -391,7 +391,8 @@ python () {
             items = flagval.split(",")
             num = len(items)
             if num > 4:
-                bb.error("Only enable,disable,depend,rdepend can be specified!")
+                bb.error("%s: PACKAGECONFIG[%s] Only enable,disable,depend,rdepend can be specified!"
+                    % (d.getVar('PN', True), flag))
 
             if flag in pkgconfig:
                 if num >= 3 and items[2]:
-- 
2.1.4


