Return-Path: <roxana.ciobanu@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 43C7770F41
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Aug 2014 08:49:43 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 22 Aug 2014 01:49:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,378,1406617200"; d="scan'208";a="580310917"
Received: from roxana-optiplex-9010.rb.intel.com ([10.237.105.58])
	by fmsmga001.fm.intel.com with ESMTP; 22 Aug 2014 01:49:35 -0700
From: Roxana Ciobanu <roxana.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Aug 2014 11:49:43 +0300
Message-Id: <3ea7d5fa0c6574a5397ebbe29ebf41e723ebc345.1408696291.git.roxana.ciobanu@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1408696291.git.roxana.ciobanu@intel.com>
References: <cover.1408696291.git.roxana.ciobanu@intel.com>
In-Reply-To: <cover.1408696291.git.roxana.ciobanu@intel.com>
References: <cover.1408696291.git.roxana.ciobanu@intel.com>
Subject: [PATCH 7/9] error-report: sort table by 'Submitted on' column
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
X-List-Received-Date: Fri, 22 Aug 2014 08:49:46 -0000

The information in the table needs to be sorted by
"Submitted on", in inverse chronological order (the most
recent error on top).

[YOCTO #6538]

Signer-off-by: Roxana Ciobanu <roxana.ciobanu@intel.com>
---
 Post/views.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Post/views.py b/Post/views.py
index f9c6655..1844c87 100644
--- a/Post/views.py
+++ b/Post/views.py
@@ -61,6 +61,7 @@ def search(request, template_name, items = None, page = None, query = None):
     if query == "" or query.isspace():
         query = "all"
     elems = Info().getSearchResult(query.strip())
+    elems.sort(key=lambda r : r.BUILD.DATE, reverse=True)
     no = len(elems)
     if no == 0:
         return render_to_response("error-page.html", {"query" : query}, RequestContext(request))
-- 
1.9.1


