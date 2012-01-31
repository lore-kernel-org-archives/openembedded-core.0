Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Rs3It-00007P-Sa
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jan 2012 03:18:40 +0100
Received: by ghbf19 with SMTP id f19so59534ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2012 18:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=sM9hlzo9084Mo4+5IhW/T57YF6k8fPzPPCcfeVUCWis=;
	b=dkXfmFW/wjqMQjZrjJWIYVKguV+vpYAL8zbCYrAp27JrFZM2s/La+EHisJfK4ginnl
	sAY7ERa9f1h9LlaJgPMOBwFOZQOZ/dOHZN7hPEImQ3a9pg7vdzhIcfap2rAIe94xUBAg
	aNFwoidkmKnhT56P1ONchlIlWOOyPbaT2V4N0=
Received: by 10.236.185.232 with SMTP id u68mr10776676yhm.105.1327975846445;
	Mon, 30 Jan 2012 18:10:46 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id m18sm51408634ann.0.2012.01.30.18.10.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Jan 2012 18:10:45 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jan 2012 02:10:31 +0000
Message-Id: <d2dc84fee222915fee201ac867c00fda16b80284.1327975625.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1327975625.git.otavio@ossystems.com.br>
References: <cover.1327975625.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1327975625.git.otavio@ossystems.com.br>
References: <cover.1327975625.git.otavio@ossystems.com.br>
Subject: [PATCH 2/2] classes/gitpkgv.bbclass: import from Meta-OE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 31 Jan 2012 02:18:40 -0000

It provides a GITPKGV and GITPKGVTAG variables to be used in PKGV, as
described bellow:

 - GITPKGV which is a sortable version with the format NN+GITHASH, to
   be used in PKGV, where

   NN equals the total number of revs up to SRCREV
   GITHASH is SRCREV's (full) hash

 - GITPKGVTAG which is the output of 'git describe' allowing for
   automatic versioning

gitpkgv.bbclass assumes the git repository has been cloned, and
contains SRCREV. So ${GITPKGV} and ${GITPKGVTAG} should never be
used in PV, only in PKGV.  It can handle SRCREV = ${AUTOREV}, as
well as SRCREV = "<some fixed git hash>".

The code has been imported from Meta-OE at revision
a76fff17ea8420686ef81b35f80efac1bef21649.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/gitpkgv.bbclass |   95 ++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 95 insertions(+), 0 deletions(-)
 create mode 100644 meta/classes/gitpkgv.bbclass

diff --git a/meta/classes/gitpkgv.bbclass b/meta/classes/gitpkgv.bbclass
new file mode 100644
index 0000000..238b0d2
--- /dev/null
+++ b/meta/classes/gitpkgv.bbclass
@@ -0,0 +1,95 @@
+# gitpkgv.bbclass provides a GITPKGV and GITPKGVTAG variables to be
+# used in PKGV, as described bellow:
+#
+# - GITPKGV which is a sortable version with the format NN+GITHASH, to
+#   be used in PKGV, where
+#
+#   NN equals the total number of revs up to SRCREV
+#   GITHASH is SRCREV's (full) hash
+#
+# - GITPKGVTAG which is the output of 'git describe' allowing for
+#   automatic versioning
+#
+# gitpkgv.bbclass assumes the git repository has been cloned, and
+# contains SRCREV. So ${GITPKGV} and ${GITPKGVTAG} should never be
+# used in PV, only in PKGV.  It can handle SRCREV = ${AUTOREV}, as
+# well as SRCREV = "<some fixed git hash>".
+#
+# WARNING: if upstream repository is always using consistent and
+# sortable tag name scheme you can get sortable version including tag
+# name with ${GITPKGVTAG}, but be aware that ie tag sequence "v1.0,
+# v1.2, xtest, v2.0" will force you to increment PE to get upgradeable
+# path to v2.0 revisions
+#
+# use example:
+#
+# inherit gitpkgv
+#
+# PV = "1.0+gitr${SRCPV}"      # expands to something like 1.0+gitr3+4c1c21d7dbbf93b0df336994524313dfe0d4963b
+# PKGV = "1.0+gitr${GITPKGV}"  # expands also to something like 1.0+gitr31337+4c1c21d7d
+#
+# or
+#
+# inherit gitpkgv
+#
+# PV = "1.0+gitr${SRCPV}" # expands to something like 1.0+gitr3+4c1c21d7dbbf93b0df336994524313dfe0d4963b
+# PKGV = "${GITPKGVTAG}"  # expands to something like 1.0-31337+g4c1c21d
+#                           if there is tag v1.0 before this revision or
+#                           ver1.0-31337+g4c1c21d if there is tag ver1.0
+
+GITPKGV = "${@get_git_pkgv(d, False)}"
+GITPKGVTAG = "${@get_git_pkgv(d, True)}"
+
+def gitpkgv_drop_tag_prefix(version):
+    import re
+    if re.match("v\d", version):
+        return version[1:]
+    else:
+        return version
+
+def get_git_pkgv(d, use_tags):
+    import os
+    import bb
+
+    src_uri = bb.data.getVar('SRC_URI', d, 1).split()
+    fetcher = bb.fetch2.Fetch(src_uri, d)
+    ud = fetcher.ud
+
+    #
+    # If SRCREV_FORMAT is set respect it for tags
+    #
+    format = bb.data.getVar('SRCREV_FORMAT', d, True)
+    if not format:
+        format = 'default'
+
+    found = False
+    for url in ud.values():
+        if url.type == 'git':
+            for name, rev in url.revisions.items():
+                if not os.path.exists(url.localpath):
+                    return None
+
+                found = True
+
+                cwd = os.getcwd()
+                os.chdir(url.localpath)
+
+                commits = bb.fetch2.runfetchcmd("git rev-list %s -- 2> /dev/null | wc -l" % rev, d, quiet=True).strip()
+
+                if use_tags:
+                    try:
+                        output = bb.fetch2.runfetchcmd("git describe %s 2>/dev/null" % rev, d, quiet=True).strip()
+                        ver = gitpkgv_drop_tag_prefix(output)
+                    except Exception:
+                        ver = "0.0-%s-g%s" % (commits, rev[:7])
+                else:
+                    ver = "%s+%s" % (commits, rev[:7])
+
+                os.chdir(cwd)
+
+                format = format.replace(name, ver)
+
+    if found:
+        return format
+
+    return '0+0'
-- 
1.7.2.5



