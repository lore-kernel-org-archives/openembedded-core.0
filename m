Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 95D4277AB3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 May 2017 11:49:58 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 May 2017 04:49:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,287,1491289200"; d="scan'208";a="1164500776"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga002.fm.intel.com with ESMTP; 04 May 2017 04:49:58 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 May 2017 14:49:57 +0300
Message-Id: <20170504114958.9763-1-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.12.0
Subject: [PATCH 1/2] oe-build-perf-report: accept parenthesis in tag names
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
X-List-Received-Date: Thu, 04 May 2017 11:49:59 -0000

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/oe-build-perf-report | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/oe-build-perf-report b/scripts/oe-build-perf-report
index ced5ff2e12..876e3b1a76 100755
--- a/scripts/oe-build-perf-report
+++ b/scripts/oe-build-perf-report
@@ -62,11 +62,13 @@ def get_test_runs(repo, tag_name, **kwargs):
     log.debug("Found %d tags matching pattern '%s'", len(tags), tag_pattern)
 
     # Parse undefined fields from tag names
-    str_fields = dict([(f, r'(?P<{}>[\w\-.]+)'.format(f)) for f in field_names])
+    str_fields = dict([(f, r'(?P<{}>[\w\-.()]+)'.format(f)) for f in field_names])
     str_fields['commit'] = '(?P<commit>[0-9a-f]{7,40})'
     str_fields['commit_number'] = '(?P<commit_number>[0-9]{1,7})'
     str_fields['tag_number'] = '(?P<tag_number>[0-9]{1,5})'
-    str_fields.update(kwargs)
+    # escape parenthesis in fields in order to not messa up the regexp
+    fixed_fields = dict([(k, v.replace('(', r'\(').replace(')', r'\)')) for k, v in kwargs.items()])
+    str_fields.update(fixed_fields)
     tag_re = re.compile(tag_name.format(**str_fields))
 
     # Parse fields from tags
-- 
2.12.0


