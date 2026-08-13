Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B27CFC5DF69
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 15:22:44 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21792.1786634555235031411
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 08:22:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=xLghuj2W;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49553515a8bso777955e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 08:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1786634553; x=1787239353; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=c6I3XGRRg3Pxs3kmwq4xt/9CTLVJ5n5a77Y+poY60J0=;
        b=xLghuj2W03t64S3+R/oUgwzEDWJPIDSGcU2SSgRyodyf4y8nTFYirzFEK2tcp4KqcX
         2YgB5PzhYhBXL8EUJi6R3F6NAsqlIG/9iO2VvxTjesEXt96xuj2BZ7SuXgl4+EHGc1Un
         M/el9MB03O6eZZeuDe5k++Tu3z2RZztChF7Ww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786634553; x=1787239353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=c6I3XGRRg3Pxs3kmwq4xt/9CTLVJ5n5a77Y+poY60J0=;
        b=p2XUENWTszhP9Xae8hxeE8QTZzlK3RFvHFFzGAlYg/oeHV9Xk4hc1ag+8XKyd/X+xZ
         kO5lWTyeaGGWFEhbzbGztlytX8Vm3kMsEM9ixjnU9im0+wa577luNcDeFAaKhOBsNVM3
         UwJfk4JF3K0NHQJ4wei9k+o0P/P+W8oBO9ef9hhOZjEFEh6cJZd9SWF2rxhFsTlSRD4m
         bJ9+O3G9pUKY7rw1teaHYi6TUyLYjc7ImQNALIqVLbuYTaXloDO++YLZFr2sIqDpR48V
         LOcype9U+cyXkpt7eb2o/xfA9eEGhnvDwAldKKP2y6b/QT0z7fSsXAeAIhZGulXk1snK
         Suow==
X-Gm-Message-State: AOJu0YwIMSRlFVv5zp9Rb1/Q5CDcBwHATLz8ftyyQ2sn8A74/nuuYinq
	k6NiZP6QBVqrZwGvyEa5Otd/N+UF/ZXieNHnHd92J5zKESqfpa3354HKDilsHff59km+5B/pUhy
	25DFdC6Ksbw==
X-Gm-Gg: AR+sD13HgOPrxoRnaJwST52wlEUQH1qhF+HklSBO2xyggX8GyvceCz/OZWnwJU7kf2m
	hauFAsk11dJvwjJe/jeOsVK3CIgawwu9ifxd1A0Z78tKlM/q9dMKZMbD27tx1DxG63YwJmPkkNE
	/ItTeQwef2O+LL5Xf1rJv4xzDIvBlcMyj6RJPwGG9t29VnZ3S+x+cW/f0Nf/XZWWDt9dQlqh/6z
	aa9Zioe9yBN1aIvCMBJlxpGtUDurZGwNfSsrgzonBXYBqbHbRvBBBUmnFu5F/s6qW1weLVQ64kJ
	cobSoiW57iFzsUpRdUNvDduD0jwxQHceG7xVtKBmOzkmXj9yfeaL63BFaodF7HuixNBmQzy3pHY
	qKGTT9gLeHzWhMW2+08oKLrrSz/PItsCPaLY0xqocux5cQX+oBYHMF2/bJFgSWSX2hbKQRrnJeM
	NIuWEM3Uu7TMKHtd3KvYr0GbBxkLNJQ/hCRU+IB7Gy/YCGgMpCBTFTzZQY/91dWyo6U4QSpzASp
	moiQwHWSPPrlw/XOYWDAon1d9U0k7skhS8zseZo0tQsIOA8yM2sEwVEQd7zIyG+bTsdX8wg2etz
	Zfdx4S6LWPeIusSPusD5y+j9ivy2c7zRDtDKM2hu
X-Received: by 2002:a05:600c:310e:b0:499:51f0:a9b2 with SMTP id 5b1f17b1804b1-499821881d3mr73461195e9.1.1786634553363;
        Thu, 13 Aug 2026 08:22:33 -0700 (PDT)
Received: from FRSMI25-GIGUE (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f21a068sm110450f8f.12.2026.08.13.08.22.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 08:22:32 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 13/17] oe-selftest: fitimage: Do not expect kernel property in DTBO config subnodes
Date: Thu, 13 Aug 2026 17:22:03 +0200
Message-ID: <065350703218edb0c8f511db92c9fbc0c5cc9369.1786633048.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1786633048.git.fabien.thomas@smile.fr>
References: <cover.1786633048.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 15:22:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243370

From: Adrian Freihofer <adrian.freihofer@siemens.com>

A DTBO overlay together with only a kernel cannot form a bootable result,
so DTBO configuration subnodes should not include the kernel property.
Update _get_req_its_fields() accordingly: skip appending
'kernel = "kernel-1"' for .dtbo files, aligning it with
_get_req_sections() which already handles this correctly.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 85e0408a81bdca0411a8625061e5e343c05f92d9)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 3541c07520..e8435fb43c 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -659,7 +659,9 @@ class KernelFitImageBase(FitImageTestCase):
         dtb_files, dtb_symlinks = FitImageTestCase._get_dtb_files(bb_vars)
         if dtb_files:
             for dtb in dtb_files:
-                its_field_check.append('kernel = "kernel-1";')
+                # DTBO overlay configs do not include a kernel property
+                if not dtb.endswith('.dtbo'):
+                    its_field_check.append('kernel = "kernel-1";')
                 its_field_check.append('fdt = "fdt-%s";' % dtb)
             for dtb in dtb_symlinks:
                 its_field_check.append('kernel = "kernel-1";')

