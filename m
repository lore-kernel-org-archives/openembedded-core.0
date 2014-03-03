Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 880C26F57C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Mar 2014 20:23:38 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id x12so1346093wgg.18
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Mar 2014 12:23:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=8KS9BQ6GFy8W8Qeg9ot25GeIruh9m181Lkmy2kvknQ8=;
	b=RDFYYoaJJdQOEZ5O+gsvJhot8cbl0uHi2tu0DoJgAWd45IFcCtnR4aWqsanulkRfFH
	P56LG6s3McmeiWoyFI4LGpU0i5ywjlGK27xYW2g2hSChDirQoPkUODfA9SJRVTfzkFlV
	+rUIC4wE2qGJxwJmxeSZZR8GxrMqieG4Ed7uUaipRVEAZUR1nW9bxRy64YJdc3KvrlTw
	cuZEzl1cih7OMez9AqC/uLOCUYruLQPJ8wcr/a9qN/AM9ZSPf9EzT0wkrmxijdzbNYTS
	v0d8qBH1Q+jfmhFO2AJBhAKkWjCTfRUKfl7oiOfS9ijX4pTzAUIeQLXSbm4XWs245Op8
	pifA==
X-Gm-Message-State: ALoCoQkXTXUzK1wDmYQ+9kql8Kyiwmb7w7G1p0Jq6GOH4B8HOlKZgPM+LqL6uSPL65m4dRde8bU9
X-Received: by 10.194.240.7 with SMTP id vw7mr9413830wjc.75.1393878219103;
	Mon, 03 Mar 2014 12:23:39 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id de3sm40523147wjb.8.2014.03.03.12.23.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Mar 2014 12:23:38 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Mar 2014 20:23:33 +0000
Message-Id: <1393878215-27447-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/3] insane: check packages for absolute symlinks to the tmpdir
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
X-List-Received-Date: Mon, 03 Mar 2014 20:23:43 -0000

Add a sanity test that checks for symlinks in packages that point into the
TMPDIR on the host.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/insane.bbclass |   13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index cf00e12..11c1feb 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -574,6 +574,19 @@ def package_qa_check_infodir(path, name, d, elf, messages):
     if infodir in path:
         messages.append("The /usr/share/info/dir file is not meant to be shipped in a particular package.")
 
+QAPATHTEST[symlink-to-sysroot] = "package_qa_check_symlink_to_sysroot"
+def package_qa_check_symlink_to_sysroot(path, name, d, elf, messages):
+    """
+    Check that the package doesn't contain any absolute symlinks to the sysroot.
+    """
+    if os.path.islink(path):
+        target = os.readlink(path)
+        if os.path.isabs(target):
+            tmpdir = d.getVar('TMPDIR', True)
+            if target.startswith(tmpdir):
+                trimmed = path.replace(os.path.join (d.getVar("PKGDEST", True), name), "")
+                messages.append("Symlink %s in %s points to TMPDIR" % (trimmed, name))
+
 def package_qa_check_license(workdir, d):
     """
     Check for changes in the license files 
-- 
1.7.10.4


