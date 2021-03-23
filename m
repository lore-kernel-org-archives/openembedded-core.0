Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.255.1616517456646195602
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Mar 2021 09:37:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 40F4E106F
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Mar 2021 09:37:26 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DFDE43F718
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Mar 2021 09:37:25 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] classes/image: use oe.utils.directory_size() instead of du
Date: Tue, 23 Mar 2021 16:37:22 +0000
Message-Id: <20210323163722.2603178-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210323163722.2603178-1-ross.burton@arm.com>
References: <20210323163722.2603178-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Ross Burton <ross.burton@intel.com>

Instead of using du (which has issues as disussed in the previous commit)=
, use
the new oe.utils.directory_size() function.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/image.bbclass | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index b558653635..87a58dfae7 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -507,7 +507,7 @@ python () {
 # Compute the rootfs size
 #
 def get_rootfs_size(d):
-    import subprocess
+    import subprocess, oe.utils
=20
     rootfs_alignment =3D int(d.getVar('IMAGE_ROOTFS_ALIGNMENT'))
     overhead_factor =3D float(d.getVar('IMAGE_OVERHEAD_FACTOR'))
@@ -518,9 +518,7 @@ def get_rootfs_size(d):
     initramfs_fstypes =3D d.getVar('INITRAMFS_FSTYPES') or ''
     initramfs_maxsize =3D d.getVar('INITRAMFS_MAXSIZE')
=20
-    output =3D subprocess.check_output(['du', '-ks',
-                                      d.getVar('IMAGE_ROOTFS')])
-    size_kb =3D int(output.split()[0])
+    size_kb =3D oe.utils.directory_size(d.getVar("IMAGE_ROOTFS")) / 1024
=20
     base_size =3D size_kb * overhead_factor
     bb.debug(1, '%f =3D %d * %f' % (base_size, size_kb, overhead_factor)=
)
--=20
2.25.1

