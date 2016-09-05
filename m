Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id A5B2B7723D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Sep 2016 08:33:55 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id a6so854981wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Sep 2016 01:33:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Oftq1ssI9kF7aD4Td+OFHaqyezvV5LrIj+yxhhXwzSM=;
	b=GFkxTHiV27aqwalfeSqUWHQl3cXeunYk6aCY6j7iL2s1Hmevc9O7dCrSIUxdoj8I3I
	XC63S7L3xqpcCpLJNQ2f9G/o000Yi02Z65TZeoBPw9FJVCCf6sk8fJHB1/kq9Yao+c4R
	k8HrwCodS2YssUGGL+o99tkcfLZn41bU0Q5Cbq4fjj4rWvztv96jWnYYiiGw4sdDePPx
	uXuCO5ojtkQn9cS6b1f9k8tvLuR0UR7wO7YIygd5nCl2L9ASGGqFsxyyDicGlj8CZoys
	DytaV0gxSzzjopW7GrG14tKaYqJpsdPPleabFsUaFTNKHbNRRZsHMg6HoxkXcg/B4GzU
	J3+w==
X-Gm-Message-State: AE9vXwNIrgScD9AnkYq/bzxyEjv/KVgDZUG/ukJKkQ/nCsFkAVhbetyHds8NLRaegZGK9A==
X-Received: by 10.28.152.149 with SMTP id a143mr5284400wme.76.1473064435898;
	Mon, 05 Sep 2016 01:33:55 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	s6sm26311442wjm.25.2016.09.05.01.33.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Sep 2016 01:33:54 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Sep 2016 09:33:54 +0100
Message-Id: <20160905083354.27655-1-git@andred.net>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [PATCH] image.bbclass: also mask debugfs versions of masked images
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
X-List-Received-Date: Mon, 05 Sep 2016 08:33:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When IMAGE_GEN_DEBUGFS is enabled, and IMAGE_FSTYPES_DEBUGFS is left
at its default (as suggested by local.conf.sample.extended),
recipe parsing fails:

  bitbake kern-tools-native # or anything else for that matter
  ERROR: <poky.git>/meta/recipes-core/images/build-appliance-image_15.0.0.bb: No IMAGE_CMD defined for IMAGE_FSTYPES entry 'debugfs_vmdk' - possibly invalid type name or missing support class
  ERROR: Failed to parse recipe: <poky.git>/meta/recipes-core/images/build-appliance-image_15.0.0.bb

  Summary: There was 1 WARNING message shown.
  Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

i.e. bitbake doesn't even finish parsing...

Since IMAGE_FSTYPES_DEBUGFS is based on IMAGE_FSTYPES, and
since the build-appliance-image is setting IMAGE_FSTYPES
to vmdk, image.bbclass/image_types.bbclass will be trying
to build a debugfs_vmdk, causing the error, as this is not
implemented.

One solution to solving this problem could be as simple as
adding a line
  IMAGE_FSTYPES_DEBUGFS_remove = "vmdk"
to the build-appliance-image recipe, but that is very
specific to the error encountered and carries the risk of
the error being reintroduced in another recipe.

Another solution could be to add 'debugfs_vmdk' to
IMAGE_TYPES_MASKED in image-vm.bbclass, but again, this
approach doesn't seem generic enough.

None of the live and vm type images have an implementation
for building a debugfs version, it doesn't seem to make
sense to build debugfs versions of any of them anyway, and
given IMAGE_TYPES_MASKED appears to be intended for those
image types exclusively, it seems the right approach is to
unconditionally also mask all debugfs_ flavours from
IMAGE_TYPES_MASKED to achieve a generic solution.

Do that so.

Signed-off-by: André Draszik <git@andred.net>
---
 meta/classes/image.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 8c8b8a2..07bd2d6 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -415,6 +415,7 @@ python () {
     d.appendVarFlag('do_image', 'vardeps', ' '.join(vardeps))
 
     maskedtypes = (d.getVar('IMAGE_TYPES_MASKED', True) or "").split()
+    maskedtypes = [dbg + t for t in maskedtypes for dbg in ("", "debugfs_")]
 
     for t in basetypes:
         vardeps = set()
-- 
2.9.3


