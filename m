Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 87386606A8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Mar 2016 21:13:53 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id ir4so58717376igb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Mar 2016 13:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UecEeGogJx0XTLEsxd/c6XiDuBNHBL+1wqDvPzSJZSU=;
	b=fXk63kXZfYKbC2ylGjDZWy0t8dPv0e0lV7GIUwpK5ut0RLmEFkwIaNDeAci0B8/37V
	+xVeJQ24nzCDpII1NSYxYNSMIF+ftYgkttvF/BysE57EmSFCvLmfRv5cGs6hZqTkyk5A
	95fHBq6FvNT+8KEP10P3YJloq2KMKVO14GB6UxwzXhPYV8aCd1i2igCBsG5WpwHX96Sx
	6hdTZnMzspF8yyv/EHCLdCrXftYJFkiPSmCCqUcTp/2Y8dCPMFaVGWMUTK9sReGfTyyO
	lKBxYkzHYteA7VYJn+gTDb8iXEU1T1aaBuMbyefhksdCOFw63tmUoqBoHulWRkpmy06j
	Lsug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=UecEeGogJx0XTLEsxd/c6XiDuBNHBL+1wqDvPzSJZSU=;
	b=DM5AX2x8O5t8wpeVrBn7nosSIFHpy43NwybTgK1tqLMi4qAU4DbTuLUoUGxIxSrgRb
	XeUyH+Fslzn0SZ8jDeMGu6D2Xwihb3EoVxSv+VrPUoKEml/bavd1Q7X7f2DZGPtqd8/W
	aT853AF/kbJZctCwbfUka+qx9BhCTrUPn0u+ys9WqO5NDYvZrCQ8ts46gUS/sMirwGsr
	o1HUegg8wBLFGmwh6TdfM+XY8tYI+8Dr5wkF6Wl7iOTGiqDCz1Sw7jCahpqLhv0f9EjX
	W9eLhvQu9UWuA+jkuYcMGYe1aNOA8IvAAKAbRHYPUKzxtPs78sIP3+1dxF9N3XN9mgR+
	KG9A==
X-Gm-Message-State: AD7BkJK2GHPuSAVnxshi4z1Wxp0tQF92OOOVg/k17YpSYhpsu6BCa3fV9hCStB1qjCBvXzl+
X-Received: by 10.50.129.8 with SMTP id ns8mr14660731igb.95.1457385234484;
	Mon, 07 Mar 2016 13:13:54 -0800 (PST)
Received: from pohly-desktop.fritz.box (p57A56D71.dip0.t-ipconnect.de.
	[87.165.109.113])
	by smtp.gmail.com with ESMTPSA id y8sm29568igl.9.2016.03.07.13.13.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 07 Mar 2016 13:13:53 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Mar 2016 22:13:48 +0100
Message-Id: <1457385228-5049-1-git-send-email-patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1bf0ef92a07ad075ae59bb83d7cf353a2a8f05e2.1457361747.git.patrick.ohly@intel.com>
References: <1bf0ef92a07ad075ae59bb83d7cf353a2a8f05e2.1457361747.git.patrick.ohly@intel.com>
Subject: [PATCH] image.bbclass: fix incomplete .rootfs customization
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
X-List-Received-Date: Mon, 07 Mar 2016 21:13:56 -0000

The patch for making the .rootfs configurable was incomplete: in the
python create_symlinks() method the new variable must be expanded
explicitly.

Not doing so broke the symlink creation and that led to hard build
failures in image types depending on the boot-directdisk.bbclass (like
qcow2) because the build_boot_dd() method relied on the symlink.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 081a0b3..8b6c30b 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -474,7 +474,7 @@ python create_symlinks() {
     manifest_name = d.getVar('IMAGE_MANIFEST', True)
     taskname = d.getVar("BB_CURRENTTASK", True)
     subimages = (d.getVarFlag("do_" + taskname, 'subimages', False) or "").split()
-    imgsuffix = d.getVarFlag("do_" + taskname, 'imgsuffix', True) or "${IMAGE_NAME_SUFFIX}."
+    imgsuffix = d.getVarFlag("do_" + taskname, 'imgsuffix', True) or d.expand("${IMAGE_NAME_SUFFIX}.")
     os.chdir(deploy_dir)
 
     if not link_name:
-- 
2.1.4


