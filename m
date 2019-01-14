Return-Path: <andre.draszik@gmail.com>
Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com
	[209.85.219.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6516E6C12D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 10:31:45 +0000 (UTC)
Received: by mail-yb1-f193.google.com with SMTP id i6so4803588ybo.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 02:31:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=XQ9hODQRWsElqnEMiRZHdXxuToHCeFwum5HHSkTKdcs=;
	b=Ndu25mSKng8xGqHHbMkg3T5blgHMkmhNvXnhB61uCXtsgQwR/EnyGNkbgji0/ZDZ7P
	+7+neSmAPXmBK2vJSWQo5F9vrejVrdTGmvRY42s46QIBii/sSTI0FTOTaIDbs0WNA2A+
	2dY+ED3Wzvc8D3/1sC6b5DPMsKau9wkDnC1UlFW5+NAV1BwPwpESPt9faI6YiBv80VOF
	LGAR/myLVbSMg6F0ab1mWcQPRsQZnPxdj1v7lgzormRrekzbj3jYV7nQ9IFdqq96vV0/
	kNSEUbZwKIgqiT0SO5Q+0LjozcBQsR5Gvv386hGHf/7FggAcGfAyRxbzpt5iE6mjhLle
	dp5w==
X-Gm-Message-State: AJcUukeRy0zyTaevwqSdIdanCn0oTDfZeV2A5pHloq1Nq1qBKZJmhS1J
	kQe0bOBlaiB0FMpmgN/W+QcxnrGA
X-Google-Smtp-Source: ALg8bN4+yZ1zoPWhAxjagSIUFL8dRGhXNEZp44oYVyNA6D4Ovk5bCVLvqbBdz+WkwzuAAyvHJJknqA==
X-Received: by 2002:a25:61c1:: with SMTP id
	v184mr23591163ybb.471.1547461905919; 
	Mon, 14 Jan 2019 02:31:45 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id e3sm9661ywe.63.2019.01.14.02.31.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jan 2019 02:31:45 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Jan 2019 10:31:43 +0000
Message-Id: <20190114103143.19356-1-git@andred.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] classes/buildhistory: display modified git branches
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
X-List-Received-Date: Mon, 14 Jan 2019 10:31:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

When collecting the git revision of repositories, also take
note of whether or not that repository has uncommited
changes.

This makes it a bit clearer what went on when looking at
diffs.

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta/classes/buildhistory.bbclass | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 33eb1b00f6..796f68cf8f 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -672,12 +672,29 @@ def buildhistory_get_build_id(d):
     statusheader = d.getVar('BUILDCFG_HEADER')
     return('\n%s\n%s\n' % (statusheader, '\n'.join(statuslines)))
 
+def buildhistory_get_modified(path):
+    # copied from get_layer_git_status() in image-buildinfo.bbclass
+    import subprocess
+    try:
+        subprocess.check_output("""cd %s; export PSEUDO_UNLOAD=1; set -e;
+                                git diff --quiet --no-ext-diff
+                                git diff --quiet --no-ext-diff --cached""" % path,
+                                shell=True,
+                                stderr=subprocess.STDOUT)
+        return ""
+    except subprocess.CalledProcessError as ex:
+        # Silently treat errors as "modified", without checking for the
+        # (expected) return code 1 in a modified git repo. For example, we get
+        # output and a 129 return code when a layer isn't a git repo at all.
+        return " -- modified"
+
 def buildhistory_get_metadata_revs(d):
     # We want an easily machine-readable format here, so get_layers_branch_rev isn't quite what we want
     layers = (d.getVar("BBLAYERS") or "").split()
-    medadata_revs = ["%-17s = %s:%s" % (os.path.basename(i), \
+    medadata_revs = ["%-17s = %s:%s%s" % (os.path.basename(i), \
         base_get_metadata_git_branch(i, None).strip(), \
-        base_get_metadata_git_revision(i, None)) \
+        base_get_metadata_git_revision(i, None), \
+        buildhistory_get_modified(i)) \
             for i in layers]
     return '\n'.join(medadata_revs)
 
-- 
2.20.1


