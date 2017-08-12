Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id EDECA78594
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Aug 2017 00:40:20 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id t138so8065803wmt.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 17:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZM4NFQeqqvo0VE2vqTKg+DGObB6NjUc5JuvUrlyJmMk=;
	b=URaS+fFzr9+W9kd456xsus/o3pqXDjvDJbdWZhqlnR/zpdDH7F3tAQFWgj66gHsdnT
	HBfG7cUl2XkktJNakao7iI/Pk/7pw5stLKWGoN2ngjq36vOyIgbhf0gDFAqOfoSwjQeR
	gUy42eDE6nUdjv8rwRBz+sGF75AsVTfvx3MgPD3RAOucLNVsv/Z3c1z1sUfE/YKL9pdT
	5QYsD2hRWgiU7ugfkosZrEYNUpDLA6o9hUNljRJ+H4plgaiC4ds9s0671ErWRY8S742u
	DTAnPflRcBOJqMv4fiiEj9UmFwwvgxmTJUluorkebxWu153OUj7x4cFIQ2yeHg/Hkqlt
	NuEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ZM4NFQeqqvo0VE2vqTKg+DGObB6NjUc5JuvUrlyJmMk=;
	b=e7iZSrME2P0tJICWQ3hXgt9Gm7tbyPU9BdJJapHqhmD656EvMRJmfIo/WZtXMyBnMf
	lvgF4UR5T35LX9verIXIl5MymdvAjZXtCEzYF7qPUXjvV2e+jPj+oLS+NEpC8rmG4pBx
	BerUSUqtbywMyZ8Pu+lrUdrBXMtB4rVinrG2wclamqbCLyY+yQNHOkduNcYJtnI/iDfY
	xXFv4ISi5jtbfF3herELijK7peckrN3CTj0Eyq1Ev+Vl+Ypa9ede1ZdROTBzJcDnJks+
	sCaHZHlMrZe9Tvryo0Xdj1MDqoixawcrYtF5WYjd5NoPg/Hz7wz+hHyu6X7u8A1GTeDt
	zlRQ==
X-Gm-Message-State: AHYfb5gqjhSe0hYgcqZmaG7eGTo38DuQQzQB6gMKML80ti5/57mfW9tN
	NqC3QJ7Ab7WnRARs
X-Received: by 10.28.18.66 with SMTP id 63mr275544wms.20.1502498421678;
	Fri, 11 Aug 2017 17:40:21 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	d19sm1685016wrb.93.2017.08.11.17.40.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Aug 2017 17:40:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 12 Aug 2017 02:41:45 +0200
Message-Id: <20170812004145.12654-5-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.0
In-Reply-To: <20170812004145.12654-1-Martin.Jansa@gmail.com>
References: <20170812004145.12654-1-Martin.Jansa@gmail.com>
Cc: Gan Yau Wai <yau.wai.gan@intel.com>
Subject: [PATCH][morty 5/5] insane.bbclass: fix override handling in RDEPENDS QA
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
X-List-Received-Date: Sat, 12 Aug 2017 00:40:21 -0000

From: Gan Yau Wai <yau.wai.gan@intel.com>

The package_qa_check_rdepends() in insane.bbclass has
incorrectly replace its localdata OVERRIDES value with
the package name. Fixing it by appending the package name
to the existing OVERRIDES value. This resolves RDEPENDS QA
error when setting PACKAGECONFIG using a pn- override at
local.conf.

Cherry picked from master 60d28dd72daee235150ab6605cbf953f1ea691df
and modified to work with older bitbake where 2nd parameter in
localdata.getVar was mandatory.

[YOCTO #11374]

Signed-off-by: Gan Yau Wai <yau.wai.gan@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/insane.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index e541c72c2d..7bbe8b63a2 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -833,7 +833,7 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, taskdeps, packages, d):
 
     if not "-dbg" in pkg and not "packagegroup-" in pkg and not "-image" in pkg:
         localdata = bb.data.createCopy(d)
-        localdata.setVar('OVERRIDES', pkg)
+        localdata.setVar('OVERRIDES', localdata.getVar('OVERRIDES', True) + ':' + pkg)
         bb.data.update_data(localdata)
 
         # Now check the RDEPENDS
-- 
2.14.0


