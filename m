Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id C51887F510
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2019 11:19:01 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id w12so7394422wro.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2019 04:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TXjzib+eJRWdf8XHFBkKbnjfYTGIUFi6Lckh9Wr/SC0=;
	b=TDfqmA5RFiJRKOTrEze3FA3uxkyYglpsV9QKa8s/kcX0tm9CisOZqkjnYDpa1w2O7D
	lMr/NIEbrMWV82nE16vjn2Kq0XVlvlEGm9GtJ+cp5Thc1iAw2OuQbKwfxqaP4/uamxlL
	Rx3Lb3hhk28poPHd9I+LySf4309yRuS4wJ/+/6DP9eFMWkgGfFjHHq0ejfdHiwtYa4EP
	4hIZKBZQQ3WEBcJj0egVFXBPO87MMrQpNC/twmVYNJlUoEnwADaUN/rQxqT8BtsdLxuP
	f26X1ssEycC0+WNo5pBJDcT97LtF9zuIzzqw770TO8qyybrCm87j726mMyf1+1AOu/Y8
	R8nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TXjzib+eJRWdf8XHFBkKbnjfYTGIUFi6Lckh9Wr/SC0=;
	b=osF5alEShHFgerh+cTY0PEasai/dUAL54grsXajdWcclmjxl0Qkvqrbf8EZs6Nibrb
	z9YkmbpRFPc/T/pVgNwkE2zMhOlVmxF+MMwn5U0OHst5i6XSC1GDYNyDb7pD0P0C/3gM
	DAackdjSUpV9aAfXhmUhUtp0GnOeC9hwAJ6rS49wG0lnPVj37zK1B2+QwW7p+YbNsOXi
	/eiPsDFAqrdWRte385Ijw4O+VVN9cYOto01TfHcQWuC3yTmp3xgii9d01N3Jt8GBbkft
	WN7N8m3ZtmZsDgjxqmdb7E1Sw623HiAAIVRplRNeo9Pjb/oFe+d1e+LGZaZ2Jc0REvki
	0qMg==
X-Gm-Message-State: APjAAAXtNDZdlGlXesh9RTDZSOx+AdSqjVgZ7a2rWvG8DSK0fwGm94RA
	C9Ymh2SM3b9yuJ/MpUxKVEjZ5I+6f7Q=
X-Google-Smtp-Source: APXvYqw26yyx95ceX0YMOwhhBFyyhHOpotdLFUhw5ikdRff+p/99bBXJKeRDR47+HuPIat/uNTbC5g==
X-Received: by 2002:a5d:4287:: with SMTP id k7mr7724947wrq.283.1570706342303; 
	Thu, 10 Oct 2019 04:19:02 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	l13sm5831372wmj.25.2019.10.10.04.19.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 10 Oct 2019 04:19:01 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Oct 2019 13:18:48 +0200
Message-Id: <20191010111848.3825-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191010111848.3825-1-alex.kanavin@gmail.com>
References: <20191010111848.3825-1-alex.kanavin@gmail.com>
Subject: [PATCH 10/10] license_image.bbclass: check and reject packages which have incompatible licenses
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
X-List-Received-Date: Thu, 10 Oct 2019 11:19:02 -0000

The use case is setting INCOMPATIBLE_LICENSE per image,
rather than as an awkward, and too strict global setting.

This for example would allow building development images with gplv3 tools,
but production images without them, and checking that nothing gpl3-licensed
gets into the latter.

Examples are provided via the selftest: four scenarios are tested:

- bash is added to the image, with a default gpl3 license; this is rejected
- bash is added to the image, with a "gpl3 & other" license; this is also rejected
- bash is added to the image, with a "gpl3 | other" license; this is accepted, but
only 'other' is added to the license manifest (this was already handled correctly
previously).
- bash is added to the image with a default gpl3 license, and is additionally
whitelisted for that image; this is accepted.

Eventually, this would allow deprecating the meta-gplv2 layer, while still
enforcing the no-gpl3 rule where possible and needed.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/classes/license_image.bbclass            | 10 +++++-
 .../oeqa/selftest/cases/incompatible_lic.py   | 34 +++++++++++++++++++
 2 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/meta/classes/license_image.bbclass b/meta/classes/license_image.bbclass
index 3f102d0fbc3..b5399b6d960 100644
--- a/meta/classes/license_image.bbclass
+++ b/meta/classes/license_image.bbclass
@@ -43,10 +43,16 @@ def write_license_files(d, license_manifest, pkg_dic, rootfs=True):
     bad_licenses = [canonical_license(d, l) for l in bad_licenses]
     bad_licenses = expand_wildcard_licenses(d, bad_licenses)
 
+    whitelist = []
+    for lic in bad_licenses:
+        whitelist.extend((d.getVar("WHITELIST_" + lic) or "").split())
+
     with open(license_manifest, "w") as license_file:
         for pkg in sorted(pkg_dic):
-            if bad_licenses:
+            if bad_licenses and pkg not in whitelist:
                 try:
+                    if incompatible_pkg_license(d, bad_licenses, pkg_dic[pkg]["LICENSE"]):
+                        bb.fatal("Package %s has an incompatible license %s and cannot be installed into the image." %(pkg, pkg_dic[pkg]["LICENSE"]))
                     (pkg_dic[pkg]["LICENSE"], pkg_dic[pkg]["LICENSES"]) = \
                         oe.license.manifest_licenses(pkg_dic[pkg]["LICENSE"],
                         bad_licenses, canonical_license, d)
@@ -56,6 +62,8 @@ def write_license_files(d, license_manifest, pkg_dic, rootfs=True):
                 pkg_dic[pkg]["LICENSES"] = re.sub(r'[|&()*]', ' ', pkg_dic[pkg]["LICENSE"])
                 pkg_dic[pkg]["LICENSES"] = re.sub(r'  *', ' ', pkg_dic[pkg]["LICENSES"])
                 pkg_dic[pkg]["LICENSES"] = pkg_dic[pkg]["LICENSES"].split()
+                if pkg in whitelist:
+                    bb.warn("Including %s with an incompatible license %s into the image, because it has been whitelisted." %(pkg, pkg_dic[pkg]["LICENSE"]))
 
             if not "IMAGE_MANIFEST" in pkg_dic[pkg]:
                 # Rootfs manifest
diff --git a/meta/lib/oeqa/selftest/cases/incompatible_lic.py b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
index 8fb93af8a89..424a9e69c3e 100644
--- a/meta/lib/oeqa/selftest/cases/incompatible_lic.py
+++ b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
@@ -39,3 +39,37 @@ class IncompatibleLicenseTests(OESelftestTestCase):
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
+    def test_bash_whitelist(self):
+        self.write_config(self.default_config() + '\nWHITELIST_GPL-3.0_pn-core-image-minimal = "bash"')
+
+        bitbake('core-image-minimal')
+
-- 
2.17.1


