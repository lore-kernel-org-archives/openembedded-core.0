Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id BDFE27E736
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 08:16:01 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id m3so15868599wrv.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 01:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=hZSOVqPJHJlKl1Ee7Yr++gl6Xv+/vESj1AqA8Tc4Vcs=;
	b=gebCuKtsCB1e4X7nPukFosJ7KVtXqiy4W/Nv+XRuu5llnNBjjJrCjnqjAaEurQVnah
	kCYKrSXtBIAB3QssJcZC2fZ9WlRRuVFD6Q1bW2jrpyIEirolng9OGGT17ffxe9TUrTgv
	EpKbbfq4d0Kj5c29vsJAKasvlXWHKnuW6zP7a+zr2EWJpnt7F9Di8xDTG/6qswdnIDwH
	RgQyP0dpiyofvRNfJH6i0sjcxpqWnUKqDJr5WJUwY/dcwIT9MVNWIPnWyy1SlfCiRp6a
	0LjKKF/i+dawLONyRMIoc3FHPiW0Kgfhr8yDhjFsHXJz2qO8CpB1z4TseueDKCXmYmes
	HLnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hZSOVqPJHJlKl1Ee7Yr++gl6Xv+/vESj1AqA8Tc4Vcs=;
	b=I+TaK/uAXCloNTyRK3BSnNgTqiVtFCR+O6NVjPRnsXlKzHa94nPUAz6yezAQSeKMJr
	vk2IocFaWrAYW2wGbbfKkABWLg1rg5WfHQnO8bfyDxiVU2MRzXlS7ia9PjHSdlZviVC6
	Ku9IJSEyZTGUyJCaGdLNaHDox/z/l4vFtbvKmDdq2JcPLqX7XPI8Bh2VwJ7WQ0sk0lYZ
	dPgD20qpx2cFxZlkhr3DBPrvTmI5sgqm0g53prjbiO1OIk6ojTvRzOOVPCm135ibJtUa
	NC8IiN9fXZZMi4+6ZBeqer+KX6wqfz+6LtGdt4cD8ArpsAgglXdWRLGajYEeMspqnJzl
	i9mg==
X-Gm-Message-State: APjAAAXa/nkE5k3qJbfRok528wvawYM9SJSQgd2iYkbve0/vDU5VwNpB
	Ixy4VsOhVXeQmor91sHqgwSbhUCY
X-Google-Smtp-Source: APXvYqyLhUhBz+Tmq/EgKGtxocjC59yg/Is90bZ+P5wver2iTlPmULhl7bn76aQOTHDV91r6L89vog==
X-Received: by 2002:adf:eb45:: with SMTP id u5mr36203062wrn.38.1560327362147; 
	Wed, 12 Jun 2019 01:16:02 -0700 (PDT)
Received: from localhost.localdomain (193.164.125.18.ip.redstone-isp.net.
	[193.164.125.18]) by smtp.gmail.com with ESMTPSA id
	y38sm27099496wrd.41.2019.06.12.01.16.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Jun 2019 01:16:01 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Jun 2019 09:15:59 +0100
Message-Id: <20190612081559.5102-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] kernel-fitimage: uboot-sign: Check UBOOT_DTB_BINARY before adding deps
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
X-List-Received-Date: Wed, 12 Jun 2019 08:16:02 -0000

Since UBOOT_DTB_BINARY empty means we don't need to inject signatures
into the U-Boot DTB, we can remove the dependencies between consumers of
these two classes and resolve a circular dependency between u-boot and
kernel.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/classes/kernel-fitimage.bbclass | 2 +-
 meta/classes/uboot-sign.bbclass      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 2820ff968940..9e224daf057e 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -42,7 +42,7 @@ python __anonymous () {
         # Verified boot will sign the fitImage and append the public key to
         # U-Boot dtb. We ensure the U-Boot dtb is deployed before assembling
         # the fitImage:
-        if d.getVar('UBOOT_SIGN_ENABLE') == "1":
+        if d.getVar('UBOOT_SIGN_ENABLE') == "1" and d.getVar('UBOOT_DTB_BINARY'):
             uboot_pn = d.getVar('PREFERRED_PROVIDER_u-boot') or 'u-boot'
             d.appendVarFlag('do_assemble_fitimage', 'depends', ' %s:do_populate_sysroot' % uboot_pn)
 }
diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
index 8beafff7c03e..de81ad1b389c 100644
--- a/meta/classes/uboot-sign.bbclass
+++ b/meta/classes/uboot-sign.bbclass
@@ -116,7 +116,7 @@ do_install_append() {
 }
 
 python () {
-    if d.getVar('UBOOT_SIGN_ENABLE') == '1' and d.getVar('PN') == d.getVar('UBOOT_PN'):
+    if d.getVar('UBOOT_SIGN_ENABLE') == '1' and d.getVar('PN') == d.getVar('UBOOT_PN') and d.getVar('UBOOT_DTB_BINARY'):
         kernel_pn = d.getVar('PREFERRED_PROVIDER_virtual/kernel')
 
         # Make "bitbake u-boot -cdeploy" deploys the signed u-boot.dtb
-- 
2.17.1


