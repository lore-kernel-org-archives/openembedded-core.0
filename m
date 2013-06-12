Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id 798C56AAA4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 16:53:13 +0000 (UTC)
Received: by mail-we0-f174.google.com with SMTP id q58so6984282wes.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 09:53:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=xEHCy8Aq7DT/bsuuTdXcWmh/zeTGYk3ATB8zr1YJfRE=;
	b=BI/6U8/QMqby2ed0/r78NMbDRGQ135MC4HgPpjsreuvgtwjBp7VCPU1ZxCbfAiA30h
	07PvmB2dzsm+DzG9lIQ1KdQK5MEzrx1MkS+btSYBtoTKO8a9skQ8iuqnrIt20lvz+jhu
	p+JYynJqIAMsqPQFWOEue34n57O+UkVBxNuq1oPcV/cd5RbsiLIcXGviBG2ZgPDXqsQQ
	mjb4/dmPSrwQFGQdlCHoGeNWQTGeF9CdVUEP2xV2ntkN9oQdcJdfsWyMxKNYdK1CH8Fk
	bLFYD3z00WuFPewM+62vFMWlPreSmzLN3phaVo5ZYpXYxZnT5iHMiObPHvHYDR+hwRbP
	nW2w==
X-Received: by 10.181.11.194 with SMTP id ek2mr5015680wid.27.1371055994266;
	Wed, 12 Jun 2013 09:53:14 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id m3sm4624419wij.5.2013.06.12.09.53.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Jun 2013 09:53:13 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Jun 2013 17:49:42 +0100
Message-Id: <8237763ebcc3cfe4388690056a7c0fed8d65a6c2.1371055550.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1371055550.git.ross.burton@intel.com>
References: <cover.1371055550.git.ross.burton@intel.com>
In-Reply-To: <cover.1371055550.git.ross.burton@intel.com>
References: <cover.1371055550.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlrZs/jPyquMSXEngQcsisQbZD5lmTLskbvyoJEIZA4L1AK+I3n7nv6o/yZESq3pIM1rbjK
Subject: [PATCH 4/4] gnome-doc-utils: drop the usage of create_wrapper
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
X-List-Received-Date: Wed, 12 Jun 2013 16:53:13 -0000

create_wrapper was previously abused to invoke the Python interpretter directly
instead of relying on #! parsing, which is read into a 128 byte buffer so breaks
with deep build directories.

However now that we already install a "nativepython" binary into the native
sysroot, use sed to change the #! line to /usr/bin/env nativepython.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gnome/gnome-doc-utils.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gnome/gnome-doc-utils.inc b/meta/recipes-gnome/gnome/gnome-doc-utils.inc
index 9d243a1..b0433ad 100644
--- a/meta/recipes-gnome/gnome/gnome-doc-utils.inc
+++ b/meta/recipes-gnome/gnome/gnome-doc-utils.inc
@@ -20,7 +20,7 @@ do_install_append() {
 }
 
 do_install_append_class-native () {
-	create_wrapper ${D}${bindir}/xml2po ${STAGING_BINDIR_NATIVE}/python-native/python
+	sed -i -e 's|^#!.*/usr/bin/env python|#! /usr/bin/env nativepython|' ${D}${bindir}/xml2po
 }
 
 FILES_${PN} += "${datadir}/xml* ${PYTHON_SITEPACKAGES_DIR}/*"
-- 
1.7.10.4


