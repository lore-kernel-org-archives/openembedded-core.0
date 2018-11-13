Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id A619D6BEF4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2018 13:57:34 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id b13so13389449wrx.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2018 05:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=Y+80WBOosLXww8W2062Q5Ybba9LM/7WegZME5iABNdM=;
	b=Spd7gIRf/4uVxx8eYacZdOfCV6+LFniyURI4GsTfzlH9Twijcnvklb1Nm5wBDASebq
	XpnUvf38n4Mgnyz8rEzSd7hWiT58SHt88TuxKV0KxJNzxdK4xs9NF6jLcyxcfUR+OGli
	442kHgdhdarUD6AdAXzNVprmU7rBbp2+CksLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Y+80WBOosLXww8W2062Q5Ybba9LM/7WegZME5iABNdM=;
	b=jTpeRViqO+92ULXuFjgypjltTbjLObKF6rPWWym+uphJcHnd4vsrhGk7F2U0RAP5RZ
	nmoScTWusBWcRGKdNH7vmHpWOZBPAB2ckrxOpKPi6j6+kidO0gtBLy6+V5p6u8yMQfiB
	C8a2HUow3s8JV6bjAw7/+AzRk3JCSvdvUS3YcttWGl5tFConSFOAvCnBvKR8Vr1DZSSE
	LgNje/qgD+Ju40tbfqf0BBKSJmw8TjaMhybRF+5+HaRXnyAZcv8nSU96Cp1sB2jafeRu
	fTcbHHxuVeR0RqA1mrUlYLh+TBHI4LXAmPFmEgKKqIUEVbC1K2BVej3ABXkhy9kN/VlG
	DUuQ==
X-Gm-Message-State: AGRZ1gI4s0QdKcceKgaYVUulwp8bBt4X1JZuNK0NAFlWyrlHJZLQeo0e
	QQaGJYhVkoGfpH5ZZXLOppvGq1ZZccA=
X-Google-Smtp-Source: AJdET5c1IiF2RdQy/3Sv5Oyp4kh/HPuqfOsZNIhtfcBSHC4H6LI/RD2ydkrbfj2KdhV8YIR5RvcTUQ==
X-Received: by 2002:adf:8264:: with SMTP id 91mr3925764wrb.312.1542117454364; 
	Tue, 13 Nov 2018 05:57:34 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h15-v6sm20895232wru.2.2018.11.13.05.57.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Nov 2018 05:57:33 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Nov 2018 13:57:30 +0000
Message-Id: <20181113135730.32136-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] license_image: Fix rootfs file ownership issues with COPY_LIC_DIRS
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
X-List-Received-Date: Tue, 13 Nov 2018 13:57:34 -0000

We need to set ownership of the license files after copying into the rootfs.
We also need to ensure we don't overwrite the rootfs files outside rootfs
generation, hence only write there when the new rootfs function parameter
is True.

[YOCTO #12961]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/license_image.bbclass | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/meta/classes/license_image.bbclass b/meta/classes/license_image.bbclass
index f0fbb763f1d..6515ee82783 100644
--- a/meta/classes/license_image.bbclass
+++ b/meta/classes/license_image.bbclass
@@ -32,10 +32,10 @@ python license_create_manifest() {
 
     rootfs_license_manifest = os.path.join(d.getVar('LICENSE_DIRECTORY'),
                         d.getVar('IMAGE_NAME'), 'license.manifest')
-    write_license_files(d, rootfs_license_manifest, pkg_dic)
+    write_license_files(d, rootfs_license_manifest, pkg_dic, rootfs=True)
 }
 
-def write_license_files(d, license_manifest, pkg_dic):
+def write_license_files(d, license_manifest, pkg_dic, rootfs=True):
     import re
 
     bad_licenses = (d.getVar("INCOMPATIBLE_LICENSE") or "").split()
@@ -94,7 +94,7 @@ def write_license_files(d, license_manifest, pkg_dic):
     # With both options set we see a .5 M increase in core-image-minimal
     copy_lic_manifest = d.getVar('COPY_LIC_MANIFEST')
     copy_lic_dirs = d.getVar('COPY_LIC_DIRS')
-    if copy_lic_manifest == "1":
+    if rootfs and copy_lic_manifest == "1":
         rootfs_license_dir = os.path.join(d.getVar('IMAGE_ROOTFS'), 
                                 'usr', 'share', 'common-licenses')
         bb.utils.mkdirhier(rootfs_license_dir)
@@ -146,6 +146,13 @@ def write_license_files(d, license_manifest, pkg_dic):
                             continue
 
                         os.link(pkg_license, pkg_rootfs_license)
+            # Fixup file ownership
+            for walkroot, dirs, files in os.walk(rootfs_license_dir):
+                for f in files:
+                    os.lchown(os.path.join(walkroot, f), 0, 0)
+                for dir in dirs:
+                    os.lchown(os.path.join(walkroot, dir), 0, 0)
+
 
 
 def license_deployed_manifest(d):
@@ -176,7 +183,7 @@ def license_deployed_manifest(d):
                                     d.getVar('IMAGE_NAME'))
     bb.utils.mkdirhier(lic_manifest_dir)
     image_license_manifest = os.path.join(lic_manifest_dir, 'image_license.manifest')
-    write_license_files(d, image_license_manifest, man_dic)
+    write_license_files(d, image_license_manifest, man_dic, rootfs=False)
 
 def get_deployed_dependencies(d):
     """
-- 
2.17.1


