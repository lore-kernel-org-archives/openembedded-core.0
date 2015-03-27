Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 128957391D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Mar 2015 13:53:31 +0000 (UTC)
Received: by igcxg11 with SMTP id xg11so20404084igc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Mar 2015 06:53:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=TdxtusFQ5k3NcuUVKaUfn+8+CvwzQXFheeSp4mo62RM=;
	b=GjbizuN/eTblGhrXST3gM5ER9d36cpwUaNkpV/oLu0yQa2T+5CoIMpnu6vvSBBdytP
	ktXxXLQFTbZdTcDs2ImBxc0rM/ypiXpkIsDPnqGcg1pg4vPp7ByZNKi4S8nKIer1bO4W
	HW/UuKA4JSvI3fjmN9Lt3TMs8ADh2oeoyzRKTSgovNRqvKALypxx9Y4xPhu9pbXNy65p
	Ywltc9/Qe9H60gXqlpsTAjyxvKsIxizBLg5uBo7SA7Ot693WRsKVfIwf/AyOVufTgIav
	J15Wd49REbFzeK2xqHYKAwkRTv8SJbZF9GIw/cMxnj0vcRfWnG8+75Pw9sCTT7nvpQqi
	39Ew==
X-Gm-Message-State: ALoCoQmW9ljVg0ASfPvEzBXpIS/EIBIefQGkNH1oC1pp4zTusIKH8cbJgMJObpmL0cH4uHEkulEI
X-Received: by 10.50.66.243 with SMTP id i19mr45153580igt.7.1427464412875;
	Fri, 27 Mar 2015 06:53:32 -0700 (PDT)
Received: from pohly-mobl1.ger.corp.intel.com (p57A56214.dip0.t-ipconnect.de.
	[87.165.98.20])
	by mx.google.com with ESMTPSA id k82sm1366606ioi.5.2015.03.27.06.53.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Mar 2015 06:53:31 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Mar 2015 14:53:10 +0100
Message-Id: <64f6915ec34b32acd2e279743ed2d6af5b312c28.1427463906.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1427463906.git.patrick.ohly@intel.com>
References: <cover.1427463906.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1427463906.git.patrick.ohly@intel.com>
References: <cover.1427463906.git.patrick.ohly@intel.com>
Subject: [PATCH 1/3] combo-layer: clean up dest_dir checking
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
X-List-Received-Date: Fri, 27 Mar 2015 13:53:32 -0000

Empty dest_dir is basically undocumented behavior. The sample conf
only mentions using just a dot for the current directory. In practice,
the empty string does not work because of code like this:

def action_splitpatch(conf, args):
    ...
        if dest_dir != ".":
            filerange_root = '%s -x "%s/*"' % (filerange_root, dest_dir)

However, the empty string was not explicitly checked for, leading to
strange errors when trying to apply patches:

[12:50:23] Applying: foobar: xyz
fatal: unable to stat newly created file '/foobar': No such file or directory

This patch turns the empty string into an alias for the dot. This seems
more user-friendly than throwing an error. This alias is intentionally
not document in the sample conf, because the dot is clearer and works also
with older copies of combo-layer.

Instead of checking for both all the time and normalizing the path when
needed (as done in some places), rewrite the value in sanity_check()
and then only check for '.'.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/combo-layer | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index 83cfc8e..4aed072 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -144,6 +144,10 @@ class Configuration(object):
                 if option not in self.repos[name]:
                     msg = "%s\nOption %s is not defined for component %s" %(msg, option, name)
                     missing_options.append(option)
+            # Sanitize dest_dir so that we do not have to deal with edge cases
+            # (empty string, double slashes) in the rest of the code.
+            dest_dir = os.path.normpath(self.repos[name]["dest_dir"])
+            self.repos[name]["dest_dir"] = "." if not dest_dir else dest_dir
         if msg != "":
             logger.error("configuration file %s has the following error: %s" % (self.conffile,msg))
             if self.localconffile and 'last_revision' in missing_options:
@@ -231,7 +235,7 @@ def action_init(conf, args):
                     pass
                 initialrev = rev
             dest_dir = repo['dest_dir']
-            if dest_dir and dest_dir != ".":
+            if dest_dir != ".":
                 extract_dir = os.path.join(os.getcwd(), dest_dir)
                 if not os.path.exists(extract_dir):
                     os.makedirs(extract_dir)
@@ -325,7 +329,7 @@ EOF
                             runcmd('git replace --edit %s' % rev)
 
                 # Optional: rewrite history to change commit messages or to move files.
-                if 'hook' in repo or dest_dir and dest_dir != ".":
+                if 'hook' in repo or dest_dir != ".":
                     filter_branch = ['git', 'filter-branch', '--force']
                     with tempfile.NamedTemporaryFile() as hookwrapper:
                         if 'hook' in repo:
@@ -353,7 +357,7 @@ tail -c +18 $tmpname | head -c -4
 ''' % (hook, name))
                             hookwrapper.flush()
                             filter_branch.extend(['--msg-filter', 'bash %s' % hookwrapper.name])
-                        if dest_dir and dest_dir != ".":
+                        if dest_dir != ".":
                             parent = os.path.dirname(dest_dir)
                             if not parent:
                                 parent = '.'
@@ -371,7 +375,7 @@ tail -c +18 $tmpname | head -c -4
                     if not os.path.exists(extract_dir):
                         os.makedirs(extract_dir)
                     copy_selected_files('HEAD', extract_dir, file_filter, exclude_patterns, '.',
-                                        subdir=dest_dir if dest_dir and dest_dir != '.' else '')
+                                        subdir=dest_dir if dest_dir != '.' else '')
                     runcmd('git add --all --force .')
                     if runcmd('git status --porcelain'):
                         # Something to commit.
-- 
2.1.4


