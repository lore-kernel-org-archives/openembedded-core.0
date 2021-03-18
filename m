Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.8221.1616071686396693002
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Mar 2021 05:48:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FyXuVIg+;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: liu.ming50@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id hq27so3730857ejc.9
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Mar 2021 05:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B0lVOZ3EVG0DwV+AldzG9mOX21RTGOLl6yqzo/bklXQ=;
        b=FyXuVIg+WSHiL00hKxQ9Ag3LqTufcOSpCCyFgdYIePIWLuF37sFL31EnfMJzbphdKH
         gKVJZZp9TW12qi0Bjf+ANis0S4J8KaKGiXO/3gWG2LGzBWx+j1n+hEasqQ6+r9UIT1jJ
         kj47ScXLEgjpmBEbQOvOP1JncW+LSgayo2UmbYN6Vkj7lXV1u8WuAy8aAjvsX3nwDQlQ
         VdP5ACyAy+nKda93/CFTme0APy8dpWpZu/r8KmDOQieYKANVDIZwLeZzuPvQMXVwu0ZD
         g6MCsBbrBOG8cC9qkoqTTVfwyUG8Jip/7F1p1Ykb2XzByMOXuECyKNEqQC6SmTFtkU/I
         FsXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B0lVOZ3EVG0DwV+AldzG9mOX21RTGOLl6yqzo/bklXQ=;
        b=TJ2iiOEaxNaLFDgwnDZZR/Mf9h+jPZgtA2exfDaiq4BQr7b790Yo/wd5jI1OU+HqSZ
         OfTzu8ScNM4bOFQ4pCnw+KjwMP80o9ps0bGmbnuBjDZREjzquewVYYDypeJ3qUGM6SLJ
         PkSw3aqmqHbjzqx75vyoi/qam+4LUV9gVKZ4b1E87FNCpBBdARlwAMN7vdixLj4fT8Wp
         a1EAW/JctJEBwDqOVox4m6wMhnxqNeb8MOFI6DVy0YsKrdapIx928UB9sIs/XPxhHHqr
         pxVbyU19ise6Zmo+RHvlkyleY6K+v1PefeNCUs/Ix6Cm4lCX6e29tVHhcnFwjBLXWKJf
         00Ng==
X-Gm-Message-State: AOAM533nkvDZDlKInKQnuHpMlGWC8j2Y6Sh1m11Hfk+G2gjibt+FMApy
	cWWV0vg3ZsafIraaNIkGXLVyLP7MOD7A7g==
X-Google-Smtp-Source: ABdhPJzkbiHEmXgvWNDFynLaZxooKHjebf1knWjA74m4iX+Nezxkde7cdbmR0Nc6O8aj0TMiVo3mVw==
X-Received: by 2002:a17:906:1b54:: with SMTP id p20mr40660211ejg.307.1616071684513;
        Thu, 18 Mar 2021 05:48:04 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from localhost.localdomain ([2a00:801:3fa:27a9:54fc:e6a8:bd95:d165])
        by smtp.gmail.com with ESMTPSA id q16sm2066054edv.61.2021.03.18.05.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Mar 2021 05:48:04 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: max.krummenacher@toradex.com,
	sergio.prado@toradex.com,
	Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH] kernel-fitimage.bbclass: support both KERNEL_DEVICETREE/EXTERNAL_KERNEL_DEVICETREE
Date: Thu, 18 Mar 2021 13:47:58 +0100
Message-Id: <20210318124758.26407-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Liu <liu.ming50@gmail.com>

There are user cases that a developer wants to add both in-tree and
out-of-tree devicetrees to fitimage, and this is quite normal, for
instance, a developer might need the devicetrees from kernel source
meanwhile maintaining his/her own devicetree overlays to be applied
on top of them.

To support that, we now allow KERNEL_DEVICETREE and
EXTERNAL_KERNEL_DEVICETREE to be both set in configuration files, and
the devicetrees in EXTERNAL_KERNEL_DEVICETREE have higher priority to
override the same names in KERNEL_DEVICETREE.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/classes/kernel-fitimage.bbclass | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index f5082c93df..b9d8270027 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -535,13 +535,19 @@ fitimage_assemble() {
 	# Step 2: Prepare a DTB image section
 	#
 
-	if [ -z "${EXTERNAL_KERNEL_DEVICETREE}" ] && [ -n "${KERNEL_DEVICETREE}" ]; then
+	if [ -n "${KERNEL_DEVICETREE}" ]; then
 		dtbcount=1
 		for DTB in ${KERNEL_DEVICETREE}; do
 			if echo ${DTB} | grep -q '/dts/'; then
 				bbwarn "${DTB} contains the full path to the the dts file, but only the dtb name should be used."
 				DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
 			fi
+
+			# Skip ${DTB} if it's also provided in ${EXTERNAL_KERNEL_DEVICETREE}
+			if [ -n "${EXTERNAL_KERNEL_DEVICETREE}" ] && [ -s ${EXTERNAL_KERNEL_DEVICETREE}/${DTB} ]; then
+				continue
+			fi
+
 			DTB_PATH="arch/${ARCH}/boot/dts/${DTB}"
 			if [ ! -e "${DTB_PATH}" ]; then
 				DTB_PATH="arch/${ARCH}/boot/${DTB}"
@@ -769,4 +775,4 @@ python () {
         bb.build.deltask('do_assemble_fitimage', d)
         bb.build.deltask('generate_rsa_keys', d)
         bb.build.addtask('generate_rsa_keys', 'do_assemble_fitimage_initramfs', 'do_bundle_initramfs', d)
-}
\ No newline at end of file
+}
-- 
2.29.0

