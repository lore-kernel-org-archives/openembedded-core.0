Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0ACE17F4D9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Oct 2019 14:44:58 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id 3so2925016wmi.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Oct 2019 07:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=PE6TUuCkBQ/l6RRwZbGWbW5xJypTaifmIkL4VK2Auf8=;
	b=SXQjl+ETRGVhl97hyMHTsdFwjUwwIlHCe7j1JDoFAMZPF9R3UZG3ZZHzxdS1QqYGBp
	iyBzc4fTaZxxFA1O6od88yY1yvKRhihvs3/HBmtJyIfaSlZNRlS14R85sGLx+zub/P+H
	j8DXtb5cYsjMmrefxdHWW1dmxkLBW4O2JPJeztfHXjbT0C8TdipNURQbo2F44j0JU9+r
	UKmqp9KroD8qW8h3E399reqQNxflNdmJIFyO6hv9x3N5UkobLwn7ZYzYEfxaLruvttKg
	Fvh0v3AO6U+3BvBBRR+bXtTkMnoGflLLCPNTfZ2Dgj/xCbF5qw7oMAJvS1qIzPPhY93B
	KYUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=PE6TUuCkBQ/l6RRwZbGWbW5xJypTaifmIkL4VK2Auf8=;
	b=RWn+VpjsDipL8vZq6Hq7p6pzAe+R8b4NbxHDeNMg/1HdFMsAjXDsrlJVgQPTjN+DSa
	PHzU52Ju4pJZRgyBTZpkcAHP1XVGAqINxAV4uOdhHa7FDukwrb8PCsL3vhL66PKNbMvM
	irMfBO1CG0ERlY7hjODV0loACGwVkXpc7RzH/gvGjYSDSqOllOEe3qIyG6peO2g3sxR5
	OTrSCmS+R+Q88ahdAmrcvSWQpk9dv//VbI1S2Fg1NMZZDmzRo56LbnbeHheDx0ADmJMW
	IGDqahODr0Z59HRw7ocZXF9QTIjNvrasU343sHXQoCsHaAM5gNdecSaRWfmTLvM4OLQn
	N8wA==
X-Gm-Message-State: APjAAAVxltTrAA1VUIelvU2KStq+lm/a4hgerpnii0jD2L+6hkPMQI7o
	P/FXbnrNXN1qaLj05ZGaHYyb7fnj
X-Google-Smtp-Source: APXvYqxVUTfCvi/hXId8n9OEbZSUvykP1tJ97UCBBU1j6C6En0tpXntRJ59KdwHEzV5FlJ2r0ASL/Q==
X-Received: by 2002:a1c:4386:: with SMTP id q128mr3122520wma.39.1570632299302; 
	Wed, 09 Oct 2019 07:44:59 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	n22sm1789883wmk.19.2019.10.09.07.44.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 09 Oct 2019 07:44:58 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Oct 2019 16:44:47 +0200
Message-Id: <20191009144447.86018-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191009144447.86018-1-alex.kanavin@gmail.com>
References: <20191009144447.86018-1-alex.kanavin@gmail.com>
Subject: [RFC PATCH 2/2] license_image.bbclass: check and reject packages which have incompatible licenses
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
X-List-Received-Date: Wed, 09 Oct 2019 14:44:59 -0000

The use case is setting INCOMPATIBLE_LICENSE per image,
rather than as an awkward, and too strict global setting.

This for example would allow building development images with gplv3 tools,
but production images without them, and checking that nothing gpl3-licensed
gets into the latter.

Examples are provided via the selftest: three scenarios are tested:

- bash is added to the image, with a default gpl3 license; this is rejected
- bash is added to the image, with a "gpl3 & other" license; this is also rejected
- bash is added to the image, with a "gpl3 | other" license; this is accepted, but
only 'other' is added to the license manifest (this was already handled correctly
previously).

Eventually, this would allow deprecating the meta-gplv2 layer, while still
enforcing the no-gpl3 rule where possible and needed.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/classes/license_image.bbclass            |  2 ++
 .../oeqa/selftest/cases/incompatible_lic.py   | 29 +++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/meta/classes/license_image.bbclass b/meta/classes/license_image.bbclass
index 3f102d0fbc3..e5cb1b8c77d 100644
--- a/meta/classes/license_image.bbclass
+++ b/meta/classes/license_image.bbclass
@@ -47,6 +47,8 @@ def write_license_files(d, license_manifest, pkg_dic, rootfs=True):
         for pkg in sorted(pkg_dic):
             if bad_licenses:
                 try:
+                    if incompatible_pkg_license(d, bad_licenses, pkg_dic[pkg]["LICENSE"]):
+                        bb.fatal("Package %s has an incompatible license %s and cannot be installed into the image." %(pkg, pkg_dic[pkg]["LICENSE"]))
                     (pkg_dic[pkg]["LICENSE"], pkg_dic[pkg]["LICENSES"]) = \
                         oe.license.manifest_licenses(pkg_dic[pkg]["LICENSE"],
                         bad_licenses, canonical_license, d)
diff --git a/meta/lib/oeqa/selftest/cases/incompatible_lic.py b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
index 8fb93af8a89..e80c9783122 100644
--- a/meta/lib/oeqa/selftest/cases/incompatible_lic.py
+++ b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
@@ -39,3 +39,32 @@ class IncompatibleLicenseTests(OESelftestTestCase):
     # INCOMPATIBLE_LICENSE contains this license
     def test_incompatible_nonspdx_license(self):
         self.lic_test('incompatible-nonspdx-license', 'FooLicense', 'FooLicense')
+
+class IncompatibleLicensePerImageTests(OESelftestTestCase):
+    def default_config(self):
+        return """
+IMAGE_INSTALL_append = "bash"
+INCOMPATIBLE_LICENSE_pn-core-image-minimal = "GPL-3.0 LGPL-3.0"
+"""
+
+    def test_bash_default(self):
+        self.write_config(self.default_config())
+        error_msg = "ERROR: core-image-minimal-1.0-r0 do_rootfs: Package bash has an incompatible license GPLv3+ and cannot be installed into the image."
+
+        result = bitbake('core-image-minimal', ignore_status=True)
+        if error_msg not in result.output:
+            raise AssertionError(result.output)
+
+    def test_bash_and_license(self):
+        self.write_config(self.default_config() + '\nLICENSE_append_pn-bash = " & SomeLicense"')
+        error_msg = "ERROR: core-image-minimal-1.0-r0 do_rootfs: Package bash has an incompatible license GPLv3+ & SomeLicense and cannot be installed into the image."
+
+        result = bitbake('core-image-minimal', ignore_status=True)
+        if error_msg not in result.output:
+            raise AssertionError(result.output)
+
+    def test_bash_or_license(self):
+        self.write_config(self.default_config() + '\nLICENSE_append_pn-bash = " | SomeLicense"')
+
+        bitbake('core-image-minimal')
+
-- 
2.17.1


