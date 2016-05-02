Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 87F9B731CD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 May 2016 13:27:32 +0000 (UTC)
Received: by mail-ig0-f182.google.com with SMTP id s8so73458830ign.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 May 2016 06:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=IioVusYCCMQ8HjLhP8VwZnVkd573GzkYTY+v05tUNxs=;
	b=pzXWDafb5soQFePDbqVGFYGr8d4RNZIUE7cIrVAX/D+M9POGbLvjAzQqPyy8otccj3
	JSpoQqZ/tDnssBUgI/9XVWB+zfuNPNYppCwBKUeUX2snqKLhDFdzB9aNvUJPUrbQN+KE
	5/Zsf/ug4h4UlKExElPs0WarrGB5bFhcqueTxZQ8Xq6EQ2/FNsNDW1dfOXF8LS/IJrF0
	XUsiE92WLBbV7Uz3gjI6NW0XmOw8LC+Ui4RlyPp/mUTDXTTwDwgzBDHcH92nrFGDwQPF
	dgKetJez2i61xNtxDfmnQ208TRCk4uG0rSryxDbdLNsc5K/jIadzkBWfTVHYusW76phO
	GkLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=IioVusYCCMQ8HjLhP8VwZnVkd573GzkYTY+v05tUNxs=;
	b=cK0gqaTPRe+g71Hew4quf2Kyc98jdIpeMxjBuBZ5FN84Klq2JE8EZdGZiF7X1AS7GO
	Sw8WYxbpJ086arI6rVvAEQZa+y9PQm3rUEzF7MdD1fgPXc5viF1m2q/x//JZ97EunU0I
	PQ0Bh8lwiLldIe7nDXEu7X5BSCQwrS8Qk+ygcXfnpN9kvovMvwM9oFVM1ViohHRaEXQJ
	tRDJcNJjOSLfobSB5GX5w/mShF9XG/ECr4GUQv6XW/0RORwKBVjt30CTXIN/JnnYPa6H
	EUchquJSvqETji1Ya6urUGScyr40Szr+HcHjYA9+0TnSjqQDnWxI9ANxpzYsko22wipy
	Zlpw==
X-Gm-Message-State: AOPr4FUJU1hISrOnjAf6XBIgUcZC4RpQ2XajKAB4Nu+GMhVzGEJIDZIRiTcVrMskGDhaGdMY
X-Received: by 10.50.155.6 with SMTP id vs6mr19911355igb.79.1462195652733;
	Mon, 02 May 2016 06:27:32 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8DB4C.dip0.t-ipconnect.de.
	[93.232.219.76]) by smtp.gmail.com with ESMTPSA id
	69sm18286189ioo.20.2016.05.02.06.27.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 02 May 2016 06:27:31 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 May 2016 15:27:26 +0200
Message-Id: <baeb6e18d0a535ad2ac62fe4ea12515a78fce88a.1462195334.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1462195334.git.patrick.ohly@intel.com>
References: <cover.1462195334.git.patrick.ohly@intel.com>
Subject: [PATCH 1/3] combo-layer: dummy "update with history"
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
X-List-Received-Date: Mon, 02 May 2016 13:27:34 -0000

When setting "history = True" in combo-layer.conf consistently for the
components involved in an update or using "update" together with the
"--history" command line flag, a new mode for updating will be used
that does not rely on exporting/importing patches.

A config setting is used because it should be used consistently by
everyone using the same config, without having to remember to use an
additional command line parameter.

There are no real global settings, so the setting is checked
separately for each component although the setting has to be set
consistently. This restriction could be removed later.

In practice, putting "history" into the "[DEFAULT]" section is the
easiest approach for configuring it.

The actual code changes split up action_update and the
combo-layer.conf handling in preparation for this new mode, without
implementing the mode itself.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/combo-layer | 82 ++++++++++++++++++++++++++++++++++++++---------------
 1 file changed, 59 insertions(+), 23 deletions(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index 9127041..41d69f8 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -73,7 +73,7 @@ class Configuration(object):
                 else:
                     # Apply special type transformations for some properties.
                     # Type matches the RawConfigParser.get*() methods.
-                    types = {'signoff': 'boolean', 'update': 'boolean'}
+                    types = {'signoff': 'boolean', 'update': 'boolean', 'history': 'boolean'}
                     if name in types:
                         value = getattr(parser, 'get' + types[name])(section, name)
                     self.repos[repo][name] = value
@@ -610,8 +610,12 @@ def action_pull(conf, args):
 def action_update(conf, args):
     """
         update the component repos
-        generate the patch list
-        apply the generated patches
+        either:
+           generate the patch list
+           apply the generated patches
+        or:
+           re-creates the entire component history and merges them
+           into the current branch with a merge commit
     """
     components = [arg.split(':')[0] for arg in args[1:]]
     revisions = {}
@@ -624,10 +628,23 @@ def action_update(conf, args):
     # make sure combo repo is clean
     check_repo_clean(os.getcwd())
 
-    import uuid
-    patch_dir = "patch-%s" % uuid.uuid4()
-    if not os.path.exists(patch_dir):
-        os.mkdir(patch_dir)
+    # Check whether we keep the component histories. Must be
+    # set either via --history command line parameter or consistently
+    # in combo-layer.conf. Mixing modes is (currently, and probably
+    # permanently because it would be complicated) not supported.
+    if conf.history:
+        history = True
+    else:
+        history = None
+        for name in repos:
+            repo = conf.repos[name]
+            repo_history = repo.get('history', True)
+            logger.error('%s: %s' % (name, repo_history))
+            if history is None:
+                history = repo_history
+            elif history != repo_history:
+                logger.error("'history' property is set inconsistently")
+                sys.exit(1)
 
     # Step 1: update the component repos
     if conf.nopull:
@@ -635,6 +652,18 @@ def action_update(conf, args):
     else:
         action_pull(conf, ['arg0'] + components)
 
+    if history:
+        logger.error("update with history not implemented yet")
+        sys.exit(1)
+    else:
+        update_with_patches(conf, components, revisions, repos)
+
+def update_with_patches(conf, components, revisions, repos):
+    import uuid
+    patch_dir = "patch-%s" % uuid.uuid4()
+    if not os.path.exists(patch_dir):
+        os.mkdir(patch_dir)
+
     for name in repos:
         revision = revisions.get(name, None)
         repo = conf.repos[name]
@@ -711,6 +740,21 @@ def action_update(conf, args):
     runcmd("rm -rf %s" % patch_dir)
 
     # Step 7: commit the updated config file if it's being tracked
+    commit_conf_file(conf, components)
+
+def conf_commit_msg(conf, components):
+    # create the "components" string
+    component_str = "all components"
+    if len(components) > 0:
+        # otherwise tell which components were actually changed
+        component_str = ", ".join(components)
+
+    # expand the template with known values
+    template = Template(conf.commit_msg_template)
+    msg = template.substitute(components = component_str)
+    return msg
+
+def commit_conf_file(conf, components, commit=True):
     relpath = os.path.relpath(conf.conffile)
     try:
         output = runcmd("git status --porcelain %s" % relpath, printerr=False)
@@ -718,23 +762,15 @@ def action_update(conf, args):
         # Outside the repository
         output = None
     if output:
-        logger.info("Committing updated configuration file")
         if output.lstrip().startswith("M"):
-
-            # create the "components" string
-            component_str = "all components"
-            if len(components) > 0:
-                # otherwise tell which components were actually changed
-                component_str = ", ".join(components)
-
-            # expand the template with known values
-            template = Template(conf.commit_msg_template)
-            raw_msg = template.substitute(components = component_str)
-
-            # sanitize the string before using it in command line
-            msg = raw_msg.replace('"', '\\"')
-
-            runcmd('git commit -m "%s" %s' % (msg, relpath))
+            logger.info("Committing updated configuration file")
+            if commit:
+                msg = conf_commit_msg(conf, components)
+                runcmd('git commit -m'.split() + [msg, relpath])
+            else:
+                runcmd('git add %s' % relpath)
+            return True
+    return False
 
 def apply_patchlist(conf, repos):
     """
-- 
2.1.4


