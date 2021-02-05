Received: from jax4mhob02.registeredsite.com (jax4mhob02.registeredsite.com [64.69.218.82])
 by mx.groups.io with SMTP id smtpd.web12.8632.1612535073709565316
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Feb 2021 06:24:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: topic.nl, ip: 64.69.218.82, mailfrom: mike.looijmans@topic.nl)
Received: from mailpod.hostingplatform.com ([10.30.71.205])
	by jax4mhob02.registeredsite.com (8.14.4/8.14.4) with ESMTP id 115EOVr0013034
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 5 Feb 2021 09:24:31 -0500
Received: (qmail 5001 invoked by uid 0); 5 Feb 2021 14:24:31 -0000
X-TCPREMOTEIP: 83.128.90.119
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO phenom.domain?not?set.invalid) (mike@milosoftware.com@83.128.90.119)
  by 0 with ESMTPA; 5 Feb 2021 14:24:31 -0000
From: "Mike Looijmans" <mike.looijmans@topic.nl>
To: openembedded-core@lists.openembedded.org
Cc: Mike Looijmans <mike.looijmans@topic.nl>
Subject: [gatesgarth][PATCH] license_image.bbclass: Don't attempt to symlink to the same file
Date: Fri,  5 Feb 2021 15:24:27 +0100
Message-Id: <20210205142427.18942-1-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.17.1

Sometimes (that is, in all my builds) the lic_manifest_dir and
lic_manifest_symlink_dir end up pointing to the same file, resulting
in an error like this:
  Exception: FileExistsError: [Errno 17] File exists: '/.../tmp-glibc/deploy/licenses/my-image-tdkz15' -> '/.../tmp-glibc/deploy/licenses/my-image-tdkz15'

First check to see if this is the case before attempting to create
the link.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 meta/classes/license_image.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/license_image.bbclass b/meta/classes/license_image.bbclass
index 119c8dfc86..6f478ce22c 100644
--- a/meta/classes/license_image.bbclass
+++ b/meta/classes/license_image.bbclass
@@ -210,7 +210,8 @@ def license_deployed_manifest(d):
             os.unlink(lic_manifest_symlink_dir)
 
         # create the image dir symlink
-        os.symlink(lic_manifest_dir, lic_manifest_symlink_dir)
+        if lic_manifest_dir != lic_manifest_symlink_dir:
+            os.symlink(lic_manifest_dir, lic_manifest_symlink_dir)
 
 def get_deployed_dependencies(d):
     """
-- 
2.17.1

