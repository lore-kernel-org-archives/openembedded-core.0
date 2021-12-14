Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15BA7C433F5
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 01:21:18 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web10.20093.1639444861529217620
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 17:21:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=intel header.b=mjpcztbY;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639444876; x=1670980876;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=UJtgSl4kvXnqfcQHdEgiVnoPUcJIHKH6hiJUaiGTZig=;
  b=mjpcztbY8XXp1W1s9wRYG85dLxRuOmL/Jo/nIL/er11mDRX+y4gUq9gD
   +pAuq/IHJx9gnAtMh+6gdse0JPtlLTR9cLlq5nbTmZ83q+hesjb+LuStp
   WUISaLGWUbnpseUJlWksYXongilnpj/73Ic+6EuHmphJXCoMcBfq6RC+O
   9aOnGJEYpfka0KB2x2mlfAU3HtJMsU1tsPrT6QoEWj+uZM5txA+Lgoc49
   DJV4CBe6aBGQ1trgso2Gf7k9DcB0q4LAKx1jhVJ3o/N03X0SXjMIiAG3h
   qYpRbLG5gjq6xni/5Ig6X4PdFJELYJ0lPUdbE3Gv6ejr+4EkVmG+2zj0l
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="238682527"
X-IronPort-AV: E=Sophos;i="5.88,204,1635231600";
   d="scan'208";a="238682527"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 17:21:16 -0800
X-IronPort-AV: E=Sophos;i="5.88,204,1635231600";
   d="scan'208";a="464869212"
Received: from zyteoh-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.239.31])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 17:21:15 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 10/17] recipetool: Set master branch only as
 fallback
Date: Tue, 14 Dec 2021 09:20:45 +0800
Message-Id: 
 <48cbe51ca30d35b1355c8c0247eaa21520ab7f24.1639444641.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1639444641.git.anuj.mittal@intel.com>
References: <cover.1639444641.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Dec 2021 01:21:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159672

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
index dbd118123b..63e7f0658b 100644
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


