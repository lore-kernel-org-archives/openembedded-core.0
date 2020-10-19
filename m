Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.7114.1603080240719644503
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Oct 2020 21:04:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=QmI5+kI2;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id EA82B20B4907; Sun, 18 Oct 2020 21:03:59 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com EA82B20B4907
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1603080239;
	bh=WZ5ZEFVbvbOEg49UjRFz2c7yBUhY+pwuxTZ4Exm2lNo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=QmI5+kI2qYiMw64z4QpNAEgKhW+qIU/5hqxnVGD7ZH3W5SHY07E67Jb1XPcT+5+id
	 pjqrJ6LllGG2ukrGLfvf3J0Wi+mtGvVTaY6KA7dzsADwT7JgVPOILDudYpnOEDX9u2
	 ZWSd7il5q66F59PjkK2IeMbeEfK3lXPVxtAe1aaM=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 1/2] classes/buildhistory: record SRC_URI
Date: Sun, 18 Oct 2020 21:03:56 -0700
Message-Id: <e83e7133cc7affdc013455744f1bc31d83503757.1603080016.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1603080016.git.paul.eggleton@linux.microsoft.com>
References: <cover.1603080016.git.paul.eggleton@linux.microsoft.com>

From: Paul Eggleton <paul.eggleton@microsoft.com>

It can be useful to record SRC_URI into buildhistory for the purposes of
tracking exactly which sources got built (we already have SRCREV) as
well as getting an indication when changes to the SRC_URI relate to
changes in the output.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 meta/classes/buildhistory.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 0f26c3c..7d5e3eb 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -116,6 +116,7 @@ python buildhistory_emit_pkghistory() {
             self.srcrev = ""
             self.layer = ""
             self.config = ""
+            self.src_uri = ""
 
 
     class PackageInfo:
@@ -258,6 +259,7 @@ python buildhistory_emit_pkghistory() {
     rcpinfo.packages = packages
     rcpinfo.layer = layer
     rcpinfo.config = sortlist(oe.utils.squashspaces(d.getVar('PACKAGECONFIG') or ""))
+    rcpinfo.src_uri = oe.utils.squashspaces(d.getVar('SRC_URI') or "")
     write_recipehistory(rcpinfo, d)
 
     bb.build.exec_func("read_subpackage_metadata", d)
@@ -368,6 +370,7 @@ def write_recipehistory(rcpinfo, d):
         f.write(u"PACKAGES = %s\n" %  rcpinfo.packages)
         f.write(u"LAYER = %s\n" %  rcpinfo.layer)
         f.write(u"CONFIG = %s\n" %  rcpinfo.config)
+        f.write(u"SRC_URI = %s\n" %  rcpinfo.src_uri)
 
     write_latest_srcrev(d, pkghistdir)
 
-- 
1.8.3.1

