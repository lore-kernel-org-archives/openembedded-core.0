Received: from mxout017.mail.hostpoint.ch (mxout017.mail.hostpoint.ch [217.26.49.177])
 by mx.groups.io with SMTP id smtpd.web12.283.1619470116672321300
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Apr 2021 13:48:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: reto-schneider.ch, ip: 217.26.49.177, mailfrom: code@reto-schneider.ch)
Received: from [10.0.2.45] (helo=asmtp012.mail.hostpoint.ch)
	by mxout017.mail.hostpoint.ch with esmtp (Exim 4.92.3 (FreeBSD))
	(envelope-from <code@reto-schneider.ch>)
	id 1lb89i-00070D-Ez; Mon, 26 Apr 2021 22:48:34 +0200
Received: from [2a02:168:6182:1:6da9:5990:7c25:6a2f] (helo=ryzen2700.home.reto-schneider.ch)
	by asmtp012.mail.hostpoint.ch with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92.3 (FreeBSD))
	(envelope-from <code@reto-schneider.ch>)
	id 1lb89i-000Lhc-Ca; Mon, 26 Apr 2021 22:48:34 +0200
X-Authenticated-Sender-Id: reto-schneider@reto-schneider.ch
From: "Reto Schneider" <code@reto-schneider.ch>
To: openembedded-core@lists.openembedded.org
Cc: Reto Schneider <reto.schneider@husqvarnagroup.com>
Subject: [PATCH 2/2] license_image.bbclass: Fix symlink to generic license files
Date: Mon, 26 Apr 2021 22:48:28 +0200
Message-Id: <20210426204828.12339-2-code@reto-schneider.ch>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210426204828.12339-1-code@reto-schneider.ch>
References: <20210426204828.12339-1-code@reto-schneider.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Reto Schneider <reto.schneider@husqvarnagroup.com>

Link to the canonical filename of a license as only this one exists.

Fixes commit 70fe71dd18ea675f35581db4a61fda137f8bf
[license_image.bbclass: use canonical name for license files].

Signed-off-by: Reto Schneider <reto.schneider@husqvarnagroup.com>
---
 meta/classes/license_image.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/license_image.bbclass b/meta/classes/license_image.bbclass
index b9a0f2359b..73cebb4d55 100644
--- a/meta/classes/license_image.bbclass
+++ b/meta/classes/license_image.bbclass
@@ -144,12 +144,13 @@ def write_license_files(d, license_manifest, pkg_dic, rootfs=True):
                             continue
 
                         # Make sure we use only canonical name for the license file
-                        rootfs_license = os.path.join(rootfs_license_dir, "generic_%s" % generic_lic)
+                        generic_lic_file = "generic_%s" % generic_lic
+                        rootfs_license = os.path.join(rootfs_license_dir, generic_lic_file)
                         if not os.path.exists(rootfs_license):
                             oe.path.copyhardlink(pkg_license, rootfs_license)
 
                         if not os.path.exists(pkg_rootfs_license):
-                            os.symlink(os.path.join('..', lic), pkg_rootfs_license)
+                            os.symlink(os.path.join('..', generic_lic_file), pkg_rootfs_license)
                     else:
                         if (oe.license.license_ok(canonical_license(d,
                                 lic), bad_licenses) == False or
-- 
2.29.2

