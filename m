Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C280C433F5
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 02:58:18 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web10.6480.1652237869110482622
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 19:58:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=UnbK0s0U;
 spf=pass (domain: intel.com, ip: 134.134.136.20,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652237888; x=1683773888;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=8WBGJFLJSUFTAGqnTUj+UmXKATN6liXz7lAsRfKFAQ0=;
  b=UnbK0s0UvsQ1akum/036ZjYMUi4l1SC9CvIU2J58hkJHUQ+LQCduQvt+
   s2urU4rvZysL6rr+wNtvG2ckjBEP6eqDsy/ISO0VAQOaTL7xZ4vpyHy60
   j2LSzapYX5utgQn+5pAD4XaL2W2u8dI+XBZZetYYypy9+vPuPpE6W3Bjl
   LjONI0sKlP6Uj5nQXhNScU65oKbtlIxyxXO0+YpFsrHGJiCZi3SW2ot49
   JYpCSog5N6PRlkLw8S2n9E1tLCKHNVtP/mzk6OfwBO2QUCv63MSle4fVm
   /e9rnMxJD9QSDfHD0Ui9PBRhG9tLg95MgUh6ZyPqEnwUJGkT9D8NKloh4
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="257106085"
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600";
   d="scan'208";a="257106085"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 19:58:08 -0700
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600";
   d="scan'208";a="602754893"
Received: from ukandhax-mobl3.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.214.163.3])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 19:58:07 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 17/17] perf: sort-pmuevents: allow for additional
 type qualifiers and storage class
Date: Wed, 11 May 2022 10:57:32 +0800
Message-Id: 
 <e0d5d93a18d1682f3393fc10133f08009f008601.1652231471.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.1652231471.git.anuj.mittal@intel.com>
References: <cover.1652231471.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 May 2022 02:58:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165485

From: Max Krummenacher <max.oss.09@gmail.com>

With kernel 5.16 some structs in pmu-events do get a const qualifier, some
a static const storage class and qualifier.

The current sort-pmuevents cannot cope with that and drops all struct
arrays with such additional elements. This then leads to compiler errors.

Allow '^struct', '^const struct', '^static struct', '^static const struct'.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
(cherry picked from commit 8406e83ade1c34d8a7d8063f2e7445aafa471721)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../perf/perf/sort-pmuevents.py               | 30 ++++++++++---------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf/sort-pmuevents.py b/meta/recipes-kernel/perf/perf/sort-pmuevents.py
index 4f841eb822..09ba3328a7 100755
--- a/meta/recipes-kernel/perf/perf/sort-pmuevents.py
+++ b/meta/recipes-kernel/perf/perf/sort-pmuevents.py
@@ -33,10 +33,10 @@ if os.path.exists(outfile):
 with open(infile, 'r') as file:
     data = file.read()
 
-preamble_regex = re.compile( '^(.*?)^struct', re.MULTILINE | re.DOTALL )
+preamble_regex = re.compile( '^(.*?)^(struct|const struct|static struct|static const struct)', re.MULTILINE | re.DOTALL )
 
 preamble = re.search( preamble_regex, data )
-struct_block_regex = re.compile( '^struct.*?(\w+) (.*?)\[\] = {(.*?)^};', re.MULTILINE | re.DOTALL )
+struct_block_regex = re.compile( '^(struct|const struct|static struct|static const struct).*?(\w+) (.*?)\[\] = {(.*?)^};', re.MULTILINE | re.DOTALL )
 field_regex =  re.compile( '{.*?},', re.MULTILINE | re.DOTALL )
 cpuid_regex = re.compile( '\.cpuid = (.*?),', re.MULTILINE | re.DOTALL )
 name_regex = re.compile( '\.name = (.*?),', re.MULTILINE | re.DOTALL )
@@ -45,24 +45,25 @@ name_regex = re.compile( '\.name = (.*?),', re.MULTILINE | re.DOTALL )
 # types and then their fields.
 entry_dict = {}
 for struct in re.findall( struct_block_regex, data ):
-    # print( "struct: %s %s" % (struct[0],struct[1]) )
-    entry_dict[struct[1]] = {}
-    entry_dict[struct[1]]['type'] = struct[0]
-    entry_dict[struct[1]]['fields'] = {}
-    for entry in re.findall( field_regex, struct[2] ):
+    # print( "struct: %s %s %s" % (struct[0],struct[1],struct[2]) )
+    entry_dict[struct[2]] = {}
+    entry_dict[struct[2]]['type_prefix'] = struct[0]
+    entry_dict[struct[2]]['type'] = struct[1]
+    entry_dict[struct[2]]['fields'] = {}
+    for entry in re.findall( field_regex, struct[3] ):
         #print( "    entry: %s" % entry )
         cpuid = re.search( cpuid_regex, entry )
         if cpuid:
             #print( "    cpuid found: %s" % cpuid.group(1) )
-            entry_dict[struct[1]]['fields'][cpuid.group(1)] = entry
-            
+            entry_dict[struct[2]]['fields'][cpuid.group(1)] = entry
+
         name = re.search( name_regex, entry )
         if name:
             #print( "    name found: %s" % name.group(1) )
-            entry_dict[struct[1]]['fields'][name.group(1)] = entry
-        
-        if not entry_dict[struct[1]]['fields']:
-            entry_dict[struct[1]]['fields']['0'] = entry
+            entry_dict[struct[2]]['fields'][name.group(1)] = entry
+
+        if not entry_dict[struct[2]]['fields']:
+            entry_dict[struct[2]]['fields']['0'] = entry
 
 # created ordered dictionaries from the captured values. These are ordered by
 # a sorted() iteration of the keys. We don't care about the order we read
@@ -74,6 +75,7 @@ for struct in re.findall( struct_block_regex, data ):
 entry_dict_sorted = OrderedDict()
 for i in sorted(entry_dict.keys()):
     entry_dict_sorted[i] = {}
+    entry_dict_sorted[i]['type_prefix'] = entry_dict[i]['type_prefix']
     entry_dict_sorted[i]['type'] = entry_dict[i]['type']
     entry_dict_sorted[i]['fields'] = {}
     for f in sorted(entry_dict[i]['fields'].keys()):
@@ -85,7 +87,7 @@ outf = open( outfile, 'w' )
 print( preamble.group(1) )
 outf.write( preamble.group(1) )
 for d in entry_dict_sorted:
-    outf.write( "struct %s %s[] = {\n" % (entry_dict_sorted[d]['type'],d) )
+    outf.write( "%s %s %s[] = {\n" % (entry_dict_sorted[d]['type_prefix'], entry_dict_sorted[d]['type'],d) )
     for f in entry_dict_sorted[d]['fields']:
         outf.write( entry_dict_sorted[d]['fields'][f] + '\n' )
 
-- 
2.35.3


