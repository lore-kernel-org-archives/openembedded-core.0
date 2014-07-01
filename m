Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id AC433609AC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Jul 2014 15:57:02 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id x12so9952588wgg.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Jul 2014 08:57:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=MWlUnK0sji59F/9y/u+jlzHRE7xszc90FQEe47MWSEk=;
	b=dqOR0cKpYOo9hmdEwM7oH0sklVIyU2Kj7ue4NSM/hsFO98eyAyrxMuyKZAwPpRVdqD
	mcpaIu2yFw+o4iwS7/z/zkAGkKzN0DcYOv3Yk7Pz3d35ElrMHGMDI99dxs6zIWuP8J4R
	HPXpzhsOXjlGYxXB9LKkcVfpQQIbYLaLH68PejOHrlAo7FVuPfK2Gq0163WSp3/ZAPsj
	7tFjENKLVqz7sK5byRYzR/Zp/Erl8THyAneRYJPJrwFKN2Vzli8jk+I6+JH/lHCuamD4
	nBiLLkerMDLgan8GYOeyzF+bUtNyH7n1iRBQrwKIYvA1EYKiVYrysMdbBIxCubjyBqB5
	+aHw==
X-Gm-Message-State: ALoCoQlBWh/aq4yAJMFTu2uw4HB3hIRVuBvhDtTieQNb/K40pj++v9GZ7vmX1r2FPUjZ2qQ8Ey41
X-Received: by 10.180.89.193 with SMTP id bq1mr36979903wib.81.1404230221077;
	Tue, 01 Jul 2014 08:57:01 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	kr6sm48963669wjb.16.2014.07.01.08.56.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Jul 2014 08:57:00 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Jul 2014 16:56:53 +0100
Message-Id: <1404230213-3569-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] package.bbclass: add a stub implementation of package_name_hook
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
X-List-Received-Date: Tue, 01 Jul 2014 15:57:09 -0000

do_package() calls package_name_hook so that e.g. debian-style renaming through
debian.bbclass can happen.  If there is no class providing a package_name_hook
then this causes "WARNING: Function package_name_hook doesn't exist" every time
do_package() is executed.

Silence this warning by providing an empty package_name_hook in package.bbclass.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/package.bbclass |   12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index ea75918..40b5069 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1119,6 +1119,18 @@ python package_fixsymlinks () {
         d.setVar('RDEPENDS_' + pkg, bb.utils.join_deps(rdepends, commasep=False))
 }
 
+
+python package_package_name_hook() {
+    """
+    A package_name_hook function can be used to rewrite the package names by
+    changing PKG.  For an example, see debian.bbclass.
+    """
+    pass
+}
+
+EXPORT_FUNCTIONS package_name_hook
+
+
 PKGDESTWORK = "${WORKDIR}/pkgdata"
 
 python emit_pkgdata() {
-- 
1.7.10.4


