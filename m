Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B9AB1731A6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 12:37:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tBHCb94S024507; Thu, 17 Dec 2015 12:37:09 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id W2R0E57Js7l2; Thu, 17 Dec 2015 12:37:09 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tBHCb21D024490
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 17 Dec 2015 12:37:09 GMT
Message-ID: <1450355822.13505.197.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Dec 2015 12:37:02 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: "Eggleton, Paul" <paul.eggleton@intel.com>
Subject: [PATCH] combo-layer: Stop using filterdiff
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
X-List-Received-Date: Thu, 17 Dec 2015 12:37:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I ran into an issue where a patch just deleting a single file
within the repository (meta/recipes-devtools/m4/m4/make.patch)
would get skipped by combo-layer.

It turns out this has the patch header (commented to avoid breaking scripts):

: diff --git a/meta/recipes-devtools/m4/m4/make.patch b/meta/recipes-devtools/m4/m4/make.patch
: deleted file mode 100644
: index 79fb415..0000000
: --- a/meta/recipes-devtools/m4/m4/make.patch
: +++ /dev/null
: @@ -1,42 +0,0 @@

and this is classed as > 5 headers in filterdiff. When we piped the path
through filterdiff, the --- line disappears, then the second time we pass
through filterdiff, it shows no lines changed and the patch is assumed
to be empty and skipped.

Changing MAX_HEADERS in filterdiff is one way to fix this, another would
be to grep out "deleted file mode" lines. Instead, we can use new
git syntax to exclude files from the git format-patch instead and avoid
filterdiff entirely.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/scripts/combo-layer b/scripts/combo-layer
index 92c5cbb..f028098 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -662,7 +662,14 @@ def action_update(conf, args):
             patch_cmd_range = "%s..%s" % (repo['last_revision'], top_revision)
             rev_cmd_range = patch_cmd_range
 
-        file_filter = repo.get('file_filter',"")
+        file_filter = repo.get('file_filter',".")
+
+        # Filter out unwanted files
+        exclude = repo.get('file_exclude', '')
+        if exclude:
+            for path in exclude.split():
+                p = "%s/%s" % (dest_dir, path) if dest_dir != '.' else path
+                file_filter += " ':!%s'" % p
 
         patch_cmd = "git format-patch -N %s --output-directory %s %s -- %s" % \
             (prefix,repo_patch_dir, patch_cmd_range, file_filter)
@@ -681,38 +688,6 @@ def action_update(conf, args):
                 runcmd("%s %s %s %s" % (repo['hook'], patch, revlist[count], name))
                 count=count-1
 
-        # Step 3a: Filter out unwanted files and patches.
-        exclude = repo.get('file_exclude', '')
-        if exclude:
-            filter = ['filterdiff', '-p1']
-            for path in exclude.split():
-                filter.append('-x')
-                filter.append('%s/%s' % (dest_dir, path) if dest_dir != '.' else path)
-            for patch in patchlist[:]:
-                filtered = patch + '.tmp'
-                with open(filtered, 'w') as f:
-                    runcmd(filter + [patch], out=f)
-                # Now check for empty patches.
-                if runcmd(['filterdiff', '--list', filtered]):
-                    # Possibly modified.
-                    os.unlink(patch)
-                    os.rename(filtered, patch)
-                else:
-                    # Empty, ignore it. Must also remove from revlist.
-                    with open(patch, 'r') as f:
-                        fromline = f.readline()
-                    if not fromline:
-                        # Patch must have been empty to start with. No need
-                        # to remove it.
-                        continue
-                    m = re.match(r'''^From ([0-9a-fA-F]+) .*\n''', fromline)
-                    rev = m.group(1)
-                    logger.debug('skipping empty patch %s = %s' % (patch, rev))
-                    os.unlink(patch)
-                    os.unlink(filtered)
-                    patchlist.remove(patch)
-                    revlist.remove(rev)
-
         # Step 4: write patch list and revision list to file, for user to edit later
         patchlist_file = os.path.join(os.getcwd(), patch_dir, "patchlist-%s" % name)
         repo['patchlist'] = patchlist_file



