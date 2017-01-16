Return-Path: <freesilicon@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id BC5AC60291
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 14:31:29 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id r144so31227940wme.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 06:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=9dwNPghob4Ssu6rwSsKvxOHds7v3i8MAjdV9k+QcL7s=;
	b=hE+c+yv4pyctaRSXw6ziRVzUGhrEOsSbFHfDosJtmchLbgsPeVIAMFEThH3eQEy4eZ
	Fl0FaeBPgkAf7nYo4mmOJEkDGIflSI8J38ol7lZDWvt8hKxlRDe9QNDcjdWvrQLUcG79
	da9m3WdECk6IsFCx4gKk9jEUNs56n4zo5EsP0RVk5JVgTZZZo8NYfW20TBqzXcOUVm9G
	+34W9p9aQP2qRJDSZFDo0NBzfwASBuqMME92vk8bpV1gLjG685EHsFhZZYGlLIt2nqH4
	tLSTzPBRIyCCfXaxnTiOOyLrzoulcpraTHhTgTPFQ8dN3stFvfzQlxTjbPz7HDZvuwaS
	EKgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9dwNPghob4Ssu6rwSsKvxOHds7v3i8MAjdV9k+QcL7s=;
	b=lWqBasu4/ypwrInnpCj2FxteSR8AiZbJppcUWsZmMcZxvIRoCDHZpYrzeFoTHCZxXm
	3xDk9GWT4nqeP/cBAy3uJKL7WiMWr5Pg/DJatcH/AXgk31EwYIt/yT96Q6wj6OHHs3et
	DW5x9V0oGeh91gA9EpbrgyLVdvq2oTnMchSWuzVK8+4UFd4Z44EjrwCCLxxQaYEgNqFy
	AVDvqb7J9VejIlPNa3IU0f9meA8A2yRUCSI79Aq+MkwXO4aicwn3Yo9kIGPZIl5sXeIB
	CORdF0ZviDOyB/Z/QwUXEgoOhQBWhVB916WIhknI22BgitVQ3csiK9BQ3HRsMjOsiOFF
	iwvw==
X-Gm-Message-State: AIkVDXIRckHPSpb7bLZ0DJ4GmF6Nq882dF6Uf6mYNM3/HdhDtE0jJnxvDyJs8X/i9pZSAQ==
X-Received: by 10.28.220.135 with SMTP id t129mr13456597wmg.97.1484577089330; 
	Mon, 16 Jan 2017 06:31:29 -0800 (PST)
Received: from localhost.localdomain ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id
	y65sm25934089wmb.5.2017.01.16.06.31.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 Jan 2017 06:31:28 -0800 (PST)
From: David Vincent <freesilicon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jan 2017 15:30:16 +0100
Message-Id: <20170116143016.20152-1-freesilicon@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] extrausers: Use static ids when available
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
X-List-Received-Date: Mon, 16 Jan 2017 14:31:30 -0000

When creating users at the image level using extrausers class, the
current behavior is to ignore the status of USERADDEXTENSION. This could
lead to undefined behavior when static ids are expected but the system
falls back to dynamic ones.

Signed-off-by: David Vincent <freesilicon@gmail.com>
---
 meta/classes/extrausers.bbclass        |  4 ++++
 meta/classes/useradd-staticids.bbclass | 37 ++++++++++++++++++++++++++++------
 2 files changed, 35 insertions(+), 6 deletions(-)

diff --git a/meta/classes/extrausers.bbclass b/meta/classes/extrausers.bbclass
index 402fc7d808..7709407b69 100644
--- a/meta/classes/extrausers.bbclass
+++ b/meta/classes/extrausers.bbclass
@@ -63,3 +63,7 @@ set_user_group () {
 		remaining=`echo $remaining | cut -d ';' -f2-`
 	done
 }
+
+USERADDEXTENSION ?= ""
+
+inherit ${USERADDEXTENSION}
diff --git a/meta/classes/useradd-staticids.bbclass b/meta/classes/useradd-staticids.bbclass
index 94bcbaa3d7..f7f6057ac3 100644
--- a/meta/classes/useradd-staticids.bbclass
+++ b/meta/classes/useradd-staticids.bbclass
@@ -58,7 +58,7 @@ def update_useradd_static_config(d):
             bb.warn("%s - %s: %sname %s does not have a static ID defined." % (d.getVar('PN'), pkg, type, id))
 
     # We parse and rewrite the useradd components
-    def rewrite_useradd(params):
+    def rewrite_useradd(params, is_pkg):
         # The following comes from --help on useradd from shadow
         parser = myArgumentParser(prog='useradd')
         parser.add_argument("-b", "--base-dir", metavar="BASE_DIR", help="base directory for the home directory of the new account")
@@ -162,7 +162,7 @@ def update_useradd_static_config(d):
 
                 uaargs.gid = uaargs.groupid
                 uaargs.user_group = None
-                if newgroup:
+                if newgroup and is_pkg:
                     groupadd = d.getVar("GROUPADD_PARAM_%s" % pkg)
                     if groupadd:
                         d.setVar("GROUPADD_PARAM_%s" % pkg, "%s; %s" % (groupadd, newgroup))
@@ -206,7 +206,7 @@ def update_useradd_static_config(d):
         return ";".join(newparams).strip()
 
     # We parse and rewrite the groupadd components
-    def rewrite_groupadd(params):
+    def rewrite_groupadd(params, is_pkg):
         # The following comes from --help on groupadd from shadow
         parser = myArgumentParser(prog='groupadd')
         parser.add_argument("-f", "--force", help="exit successfully if the group already exists, and cancel -g if the GID is already used", action="store_true")
@@ -298,7 +298,7 @@ def update_useradd_static_config(d):
             bb.parse.mark_dependency(d, bb.utils.which(bbpath, conf_file))
 
     # Load and process the users and groups, rewriting the adduser/addgroup params
-    useradd_packages = d.getVar('USERADD_PACKAGES')
+    useradd_packages = d.getVar('USERADD_PACKAGES') or ""
 
     for pkg in useradd_packages.split():
         # Groupmems doesn't have anything we might want to change, so simply validating
@@ -306,15 +306,40 @@ def update_useradd_static_config(d):
         useradd_param = d.getVar('USERADD_PARAM_%s' % pkg)
         if useradd_param:
             #bb.warn("Before: 'USERADD_PARAM_%s' - '%s'" % (pkg, useradd_param))
-            d.setVar('USERADD_PARAM_%s' % pkg, rewrite_useradd(useradd_param))
+            d.setVar('USERADD_PARAM_%s' % pkg, rewrite_useradd(useradd_param, True))
             #bb.warn("After:  'USERADD_PARAM_%s' - '%s'" % (pkg, d.getVar('USERADD_PARAM_%s' % pkg)))
 
         groupadd_param = d.getVar('GROUPADD_PARAM_%s' % pkg)
         if groupadd_param:
             #bb.warn("Before: 'GROUPADD_PARAM_%s' - '%s'" % (pkg, groupadd_param))
-            d.setVar('GROUPADD_PARAM_%s' % pkg, rewrite_groupadd(groupadd_param))
+            d.setVar('GROUPADD_PARAM_%s' % pkg, rewrite_groupadd(groupadd_param, True))
             #bb.warn("After:  'GROUPADD_PARAM_%s' - '%s'" % (pkg, d.getVar('GROUPADD_PARAM_%s' % pkg)))
 
+    # Load and process extra users and groups, rewriting only adduser/addgroup params
+    pkg = d.getVar('PN')
+    extrausers = d.getVar('EXTRA_USERS_PARAMS') or ""
+
+    #bb.warn("Before:  'EXTRA_USERS_PARAMS' - '%s'" % (d.getVar('EXTRA_USERS_PARAMS')))
+    new_extrausers = []
+    for cmd in re.split('''[ \t]*;[ \t]*(?=(?:[^'"]|'[^']*'|"[^"]*")*$)''', extrausers):
+        cmd = cmd.strip()
+        if not cmd:
+            continue
+
+        if re.match('''useradd (.*)''', cmd):
+            useradd_param = re.match('''useradd (.*)''', cmd).group(1)
+            useradd_param = rewrite_useradd(useradd_param, False)
+            cmd = 'useradd %s' % useradd_param
+        elif re.match('''groupadd (.*)''', cmd):
+            groupadd_param = re.match('''groupadd (.*)''', cmd).group(1)
+            groupadd_param = rewrite_groupadd(groupadd_param, False)
+            cmd = 'groupadd %s' % groupadd_param
+
+        new_extrausers.append(cmd)
+
+    new_extrausers.append('')
+    d.setVar('EXTRA_USERS_PARAMS', ';'.join(new_extrausers))
+    #bb.warn("After:  'EXTRA_USERS_PARAMS' - '%s'" % (d.getVar('EXTRA_USERS_PARAMS')))
 
 
 python __anonymous() {
-- 
2.11.0


