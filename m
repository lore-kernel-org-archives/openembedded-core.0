Return-Path: <patrick.ohly@intel.com>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id A3290738A5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 13:30:11 +0000 (UTC)
Received: by iecsl2 with SMTP id sl2so104878132iec.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 06:30:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=AssGsFmnAiiVHyca5imZuzB1v/K65axXKG6jM/d2uJ0=;
	b=hsUvIsoPEbWAbIdFqXEwbayyDH5EsrZ8JjP2h4NT6kgZZIlJbjDefwgKVcFrVeW7en
	O18WjHC+N/8jk7vFN417IzubbPFs4YRVyyGsKnZTSTb4GOJbRMu3YO70WKcDmiprWr2C
	l9npfunQl9HBqq7ssMMoMMqTzNmRqJpv2qf/0AOmdiU5i/grE4CzyLOhJwXOgqP3VKsd
	IIAz+y/YSwmjUJFxIe/rNpkp8k3vMaet1lbknIQT4eHZD79gWB6HAi/YFw7AnyJZhXP0
	rgd7WSeLqQ0zdfWqG6qv+1tIc/aBG3py3eaJp2wJ0q9YSCEeP5d7+zzyYEwtmpu1q76U
	/xrw==
X-Gm-Message-State: ALoCoQkmkzqRljYX8P/TdiyjZR3YQLccjaI9jmzcN959rX/yipfwK6bTfxjUji8vG7HhzT9p/CWt
X-Received: by 10.50.36.104 with SMTP id p8mr84221364igj.16.1426253412130;
	Fri, 13 Mar 2015 06:30:12 -0700 (PDT)
Received: from pohly-mobl1.ger.corp.intel.com (p5DE8C8C2.dip0.t-ipconnect.de.
	[93.232.200.194])
	by mx.google.com with ESMTPSA id h15sm1257487ioh.27.2015.03.13.06.30.10
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 Mar 2015 06:30:11 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org,
	Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Fri, 13 Mar 2015 14:29:33 +0100
Message-Id: <80d2c8219a615e948fcf3022254f99f2beb09546.1426252888.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <a9fe203d338f966d5afe631bd7956ee8232a6bf4.1426252888.git.patrick.ohly@intel.com>
References: <a9fe203d338f966d5afe631bd7956ee8232a6bf4.1426252888.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1426252888.git.patrick.ohly@intel.com>
References: <cover.1426252888.git.patrick.ohly@intel.com>
Subject: [PATCH 04/11] combo-layer: exclude files
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
X-List-Received-Date: Fri, 13 Mar 2015 13:30:12 -0000

Some combined repos intentionally do not include certain files.
For example, Poky does not include bitbake's setup files and
OE-core's sample files under meta/conf.

When these files get modified in the upstream repository, applying the
patches fails and requires manual intervention. That is merely a
nuisance for someone familiar with the problem, but a real show
stopper when having the import run automatically or by someone less
experienced.

Therefore this change introduces "file_exclude", a new per-repo list
of file patterns which removes all matching files when initializing or
updating a combined repository. Because fnmatch is used under the hood
to match full path strings, removing entire directories must be done
with a pattern ending in a '/*' (in contrast to file_filter).

For Poky, the additional configuration looks like this:

[bitbake]
...
file_exclude = classes/base.bbclass
	conf/bitbake.conf
	.gitignore
	MANIFEST.in
	setup.py
	TODO

[openembedded-core]
...
file_exclude = meta/conf/bblayers.conf.sample
	meta/conf/local.conf.sample
	meta/conf/local.conf.sample.extended
	meta/conf/site.conf.sample

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/combo-layer              | 42 +++++++++++++++++++++++++++++++++++++++-
 scripts/combo-layer.conf.example | 14 ++++++++++++++
 2 files changed, 55 insertions(+), 1 deletion(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index 3ee9eb2..8db5d7e 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -20,6 +20,7 @@
 # with this program; if not, write to the Free Software Foundation, Inc.,
 # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
+import fnmatch
 import os, sys
 import optparse
 import logging
@@ -211,7 +212,18 @@ def action_init(conf, args):
             else:
                 extract_dir = os.getcwd()
             file_filter = repo.get('file_filter', "")
-            runcmd("git archive %s | tar -x -C %s %s" % (initialrev, extract_dir, file_filter), ldir)
+            files = runcmd("git archive %s | tar -x -v -C %s %s" % (initialrev, extract_dir, file_filter), ldir)
+            exclude_patterns = repo.get('file_exclude', '').split()
+            if exclude_patterns:
+                # Implement file removal by letting tar create the
+                # file and then deleting it in the file system
+                # again. Uses the list of files created by tar (easier
+                # than walking the tree).
+                for file in files.split('\n'):
+                    for pattern in exclude_patterns:
+                        if fnmatch.fnmatch(file, pattern):
+                            os.unlink(os.path.join(extract_dir, file))
+                            break
             if not lastrev:
                 lastrev = runcmd("git rev-parse %s" % initialrev, ldir).strip()
                 conf.update(name, "last_revision", lastrev, initmode=True)
@@ -426,6 +438,34 @@ def action_update(conf, args):
                 runcmd("%s %s %s %s" % (repo['hook'], patch, revlist[count], name))
                 count=count-1
 
+        # Step 3a: Filter out unwanted files and patches.
+        exclude = repo.get('file_exclude', '')
+        if exclude:
+            filter = ['filterdiff', '-p1']
+            for path in exclude.split():
+                filter.append('-x')
+                filter.append('%s/%s' % (dest_dir, path) if dest_dir else path)
+            for patch in patchlist[:]:
+                filtered = patch + '.tmp'
+                with open(filtered, 'w') as f:
+                    runcmd(filter + [patch], out=f)
+                # Now check for empty patches.
+                if runcmd(['filterdiff', '--list', filtered]):
+                    # Possibly modified.
+                    os.unlink(patch)
+                    os.rename(filtered, patch)
+                else:
+                    # Empty, ignore it. Must also remove from revlist.
+                    with open(patch, 'r') as f:
+                        fromline = f.readline()
+                    m = re.match(r'''^From ([0-9a-fA-F]+) .*\n''', fromline)
+                    rev = m.group(1)
+                    logger.debug('skipping empty patch %s = %s' % (patch, rev))
+                    os.unlink(patch)
+                    os.unlink(filtered)
+                    patchlist.remove(patch)
+                    revlist.remove(rev)
+
         # Step 4: write patch list and revision list to file, for user to edit later
         patchlist_file = os.path.join(os.getcwd(), patch_dir, "patchlist-%s" % name)
         repo['patchlist'] = patchlist_file
diff --git a/scripts/combo-layer.conf.example b/scripts/combo-layer.conf.example
index 427c1b3..38bc53c 100644
--- a/scripts/combo-layer.conf.example
+++ b/scripts/combo-layer.conf.example
@@ -42,6 +42,20 @@ last_revision =
 #   file_filter = src/*.c : only include the src *.c file
 #   file_filter = src/main.c src/Makefile.am : only include these two files
 
+# file_exclude: filter out these file(s)
+# file_exclude = [path] [path] ...
+#
+# Each entry must match a file name. In contrast do file_filter, matching
+# a directory has no effect. To achieve that, use append a * wildcard
+# at the end.
+#
+# Wildcards are applied to the complete path and also match slashes.
+#
+# example:
+#   file_exclude = src/foobar/*  : exclude everything under src/foobar
+#   file_exclude = src/main.c : filter out main.c after including it with file_filter = src/*.c
+#   file_exclude = *~ : exclude backup files
+
 # hook: if provided, the tool will call the hook to process the generated
 #     patch from upstream, and then apply the modified patch to the combo
 #     repo.
-- 
2.1.4


