Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 363D965C8A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 10:58:18 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 08 Sep 2015 03:58:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,489,1437462000"; d="scan'208";a="764592808"
Received: from unknown (HELO marquiz.fi.intel.com) ([10.237.72.155])
	by orsmga001.jf.intel.com with ESMTP; 08 Sep 2015 03:58:17 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Sep 2015 13:58:12 +0300
Message-Id: <1441709895-1304-2-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1441709895-1304-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1441709895-1304-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 1/4] extrernalsrc.bbclass: treat kernel meta like local source
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
X-List-Received-Date: Tue, 08 Sep 2015 10:58:20 -0000

Kernel metadata repository needs to be fetched/unpacked into the work
directory in order to build the kernel. Sources pointing to a remote
location are skipped by externalsrc by default which caused kernel build
to fail (because of remote kernel-meta was not made availeble). This
patch will make kernel-meta always available.

[YOCTO #6658]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/classes/externalsrc.bbclass | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 8f7f479..37c6320 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -36,11 +36,15 @@ python () {
         else:
             d.setVar('B', '${WORKDIR}/${BPN}-${PV}/')
 
-        srcuri = (d.getVar('SRC_URI', True) or '').split()
         local_srcuri = []
-        for uri in srcuri:
-            if uri.startswith('file://'):
-                local_srcuri.append(uri)
+        fetch = bb.fetch2.Fetch((d.getVar('SRC_URI', True) or '').split(), d)
+        for url in fetch.urls:
+            url_data = fetch.ud[url]
+            parm = url_data.parm
+            if (url_data.type == 'file' or
+                    'type' in parm and parm['type'] == 'kmeta'):
+                local_srcuri.append(url)
+
         d.setVar('SRC_URI', ' '.join(local_srcuri))
 
         if '{SRCPV}' in d.getVar('PV', False):
-- 
2.1.4


