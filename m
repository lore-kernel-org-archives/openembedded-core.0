Received: from jax4mhob20.registeredsite.com (jax4mhob20.registeredsite.com [64.69.218.108])
 by mx.groups.io with SMTP id smtpd.web11.9177.1612536820320502014
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Feb 2021 06:53:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: topic.nl, ip: 64.69.218.108, mailfrom: mike.looijmans@topic.nl)
Received: from mailpod.hostingplatform.com ([10.30.71.204])
	by jax4mhob20.registeredsite.com (8.14.4/8.14.4) with ESMTP id 115ErcQn116313
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 5 Feb 2021 09:53:38 -0500
Received: (qmail 9915 invoked by uid 0); 5 Feb 2021 14:53:38 -0000
X-TCPREMOTEIP: 83.128.90.119
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO phenom.domain?not?set.invalid) (mike@milosoftware.com@83.128.90.119)
  by 0 with ESMTPA; 5 Feb 2021 14:53:37 -0000
From: "Mike Looijmans" <mike.looijmans@topic.nl>
To: openembedded-core@lists.openembedded.org
Cc: Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH v2] license_image.bbclass: Don't attempt to symlink to the same file
Date: Fri,  5 Feb 2021 15:53:33 +0100
Message-Id: <20210205145333.19806-1-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.17.1

Sometimes (that is, in all my builds) the lic_manifest_dir and
lic_manifest_symlink_dir end up pointing to the same file, resulting
in an error like this:
  Exception: FileExistsError: [Errno 17] File exists: '/.../tmp-glibc/deploy/licenses/my-image-tdkz15' -> '/.../tmp-glibc/deploy/licenses/my-image-tdkz15'

First check to see if this is the case before attempting to create
the link.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
v2: Resent, applies to master and gatesgarth

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

