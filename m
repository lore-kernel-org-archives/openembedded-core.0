Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.openembedded.org (Postfix) with ESMTP id B2EAB7F959
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 22:08:49 +0000 (UTC)
IronPort-SDR: AVizYWC6DzEKNQZ/+XJ7pPSgHM+MmGy8QXzryCWI9bC+81zl6EkzHRHgh5UZCH3HoyqhWVPyMU
	DqEp8FRPeGUqwOwR3UoSJJivemJNhRrVrqyIuSJ2TKh0eWSixclIxY9y+j/na90ogRD7LXmOnJ
	fal0gmsJ0uG+a8KWtcm5EQafMgcVAm0YfMXQgojC0B693XH6Q8ox/gjO5d16bZPX8vf5qGoTX7
	LI66B43MYKIShqGXlq5j+SPczWw0dKCsPiVPCxF/nOUMd1of+oD3fGIpB53BkAMbUhpFj+lFNq
	Lss=
X-IronPort-AV: E=Sophos;i="5.68,271,1569276000"; 
   d="scan'208";a="2200441"
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Nov 2019 23:08:37 +0100
Message-Id: <c450f02d3f5510153da80161056ccc7b4d97e1aa.1572991610.git.pkj@axis.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1572991610.git.pkj@axis.com>
References: <cover.1572991610.git.pkj@axis.com>
MIME-Version: 1.0
Subject: [warrior][PATCHv2 7/9] devtool: finish: Keep patches ordered when updating bbappend
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
X-List-Received-Date: Tue, 05 Nov 2019 22:08:50 -0000
Content-Transfer-Encoding: 8bit

From: Niclas Svensson <niclass@axis.com>

The _get_patchset_revs() function returns the patches in an
OrderedDict to keep them ordered. However, this information was lost
when the patches were added to the bbappend file.

Signed-off-by: Niclas Svensson <niclas.svensson@axis.com>
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/devtool/standard.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index dcb6bf9540..b944ec3966 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1520,17 +1520,17 @@ def _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wil
                                           patches_dir, changed_revs)
         logger.debug('Pre-filtering: update: %s, new: %s' % (dict(upd_p), dict(new_p)))
         if filter_patches:
-            new_p = {}
-            upd_p = {k:v for k,v in upd_p.items() if k in filter_patches}
+            new_p = OrderedDict()
+            upd_p = OrderedDict((k,v) for k,v in upd_p.items() if k in filter_patches)
             remove_files = [f for f in remove_files if f in filter_patches]
         updatefiles = False
         updaterecipe = False
         destpath = None
         srcuri = (rd.getVar('SRC_URI', False) or '').split()
         if appendlayerdir:
-            files = dict((os.path.join(local_files_dir, key), val) for
+            files = OrderedDict((os.path.join(local_files_dir, key), val) for
                          key, val in list(upd_f.items()) + list(new_f.items()))
-            files.update(dict((os.path.join(patches_dir, key), val) for
+            files.update(OrderedDict((os.path.join(patches_dir, key), val) for
                               key, val in list(upd_p.items()) + list(new_p.items())))
             if files or remove_files:
                 removevalues = None
-- 
2.21.0


