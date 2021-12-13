Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F8C5C433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 04:17:49 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web12.7345.1639369051545710943
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Dec 2021 20:17:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=intel header.b=G1+fnxdP;
 spf=pass (domain: intel.com, ip: 134.134.136.65,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639369068; x=1670905068;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=L4uub0YwvfNmw/IK8HERzoIMf0ciKEyAsguOactAb/8=;
  b=G1+fnxdPJvBljJYDW3i/qAIpRTslluJPQ+Qwmcrol+bV6giOV2VLc0Di
   /Y9SQgQ+Wv2ErAgmZxqwfqhZS8cJj/h/FE8AM+zQ9Ye3NSxH1km4u7Dbz
   1Zx4uVTqJRKgw4qBXWcrAPUJ9dtRY1SMj1A5Wko+Nkb+uCfve6MRRyt7S
   B/yucjRq/QAqnsl4ELxhXQ7dtsmi+kxNSIlytx+S3lJDsvqfUFYmOVuY9
   auI955GMfCGF3Qv9fnPBo3FTEp8GVd6sqcnouuhW9vt9ngBb22FLc7mir
   mmL/oNdA3pUgWlXL9dDRawmpMs6E91KZYVuB0TGEXjZnAWBbK71kZlRRp
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10196"; a="238602249"
X-IronPort-AV: E=Sophos;i="5.88,201,1635231600";
   d="scan'208";a="238602249"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2021 20:17:48 -0800
X-IronPort-AV: E=Sophos;i="5.88,201,1635231600";
   d="scan'208";a="517589313"
Received: from echan1-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.132.97])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2021 20:17:46 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 13/20] recipetool: Set master branch only as
 fallback
Date: Mon, 13 Dec 2021 12:17:12 +0800
Message-Id: 
 <15919898fa8dc40f4fe9c668d56e1d2afd52c894.1639365111.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1639365111.git.anuj.mittal@intel.com>
References: <cover.1639365111.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 04:17:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159603

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

The commit 'meta/scripts: Manual git url branch additions (dc53fe75cc)'
sets the branch= parameter too early to master and thereby breaks the
-B/--srcbranch option.

ERROR: branch= parameter and -B/--srcbranch option cannot both be specified - use one or the other

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 34ece8030e7a6a100b5e3e7b94e6c786c0e199a6)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/lib/recipetool/create.py | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 5752db5c2e..e8e71fabfd 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -389,9 +389,6 @@ def reformat_git_uri(uri):
                 parms.update({('protocol', 'ssh')})
         elif (scheme == "http" or scheme == 'https' or scheme == 'ssh') and not ('protocol' in parms):
             parms.update({('protocol', scheme)})
-        # We assume 'master' branch if not set
-        if not 'branch' in parms:
-            parms.update({('branch', 'master')})
         # Always append 'git://'
         fUrl = bb.fetch2.encodeurl(('git', host, path, user, pswd, parms))
         return fUrl
@@ -481,6 +478,9 @@ def create_recipe(args):
             storeTagName = params['tag']
             params['nobranch'] = '1'
             del params['tag']
+        # Assume 'master' branch if not set
+        if scheme in ['git', 'gitsm'] and 'branch' not in params and 'nobranch' not in params:
+            params['branch'] = 'master'
         fetchuri = bb.fetch2.encodeurl((scheme, network, path, user, passwd, params))
 
         tmpparent = tinfoil.config_data.getVar('BASE_WORKDIR')
@@ -530,10 +530,9 @@ def create_recipe(args):
             # Remove HEAD reference point and drop remote prefix
             get_branch = [x.split('/', 1)[1] for x in get_branch if not x.startswith('origin/HEAD')]
             if 'master' in get_branch:
-                # If it is master, we do not need to append 'branch=master' as this is default.
                 # Even with the case where get_branch has multiple objects, if 'master' is one
                 # of them, we should default take from 'master'
-                srcbranch = ''
+                srcbranch = 'master'
             elif len(get_branch) == 1:
                 # If 'master' isn't in get_branch and get_branch contains only ONE object, then store result into 'srcbranch'
                 srcbranch = get_branch[0]
@@ -546,8 +545,8 @@ def create_recipe(args):
         # Since we might have a value in srcbranch, we need to
         # recontruct the srcuri to include 'branch' in params.
         scheme, network, path, user, passwd, params = bb.fetch2.decodeurl(srcuri)
-        if srcbranch:
-            params['branch'] = srcbranch
+        if scheme in ['git', 'gitsm']:
+            params['branch'] = srcbranch or 'master'
 
         if storeTagName and scheme in ['git', 'gitsm']:
             # Check srcrev using tag and check validity of the tag
@@ -606,7 +605,7 @@ def create_recipe(args):
                     splitline = line.split()
                     if len(splitline) > 1:
                         if splitline[0] == 'origin' and scriptutils.is_src_url(splitline[1]):
-                            srcuri = reformat_git_uri(splitline[1])
+                            srcuri = reformat_git_uri(splitline[1]) + ';branch=master'
                             srcsubdir = 'git'
                             break
 
-- 
2.33.1


