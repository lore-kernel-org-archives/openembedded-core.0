Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39C43D1F9C5
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 11:31:25 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41208.1764847878952440086
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Dec 2025 03:31:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=28qwQtBm;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4779a4fc95aso13984655e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 03:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1764847877; x=1765452677; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Af1cUIN4Iq8jV9kc0nUpUxBmQmMHW8x9o/SffsUS1Ms=;
        b=28qwQtBmg5dCxrAv0V6U1BsuGIAYVe3cr6XnnAq4I1SzJJpArlakbOM6pYFY8qiPvZ
         ikoezLCfVzlFc1IACGlLIdXLk3uBVFs4rKk0T/f1B+aCPGOIyx5bIVz6B2reTStTOMUp
         +LAmE/HT66wVTdU+XEx8xRjy9osDTxVLEKFEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764847877; x=1765452677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Af1cUIN4Iq8jV9kc0nUpUxBmQmMHW8x9o/SffsUS1Ms=;
        b=eVD//uZYW+2uF0cygnxIXF0aitOJfEYwNOI4LJ2xh2r3HbAJU2oA6U9lWuwi96LwP1
         RQ7PPn9Gkm27ZKYAIj3VkrwI8T+OAGb/HsuDb7o+tQckj5GhZNIRlXMumajF9s13UkUs
         ejQCIvOOrJ1LtBp6ZFchg+K7cCFLtAmr/fo62HOHvSVlwwDczszqc4mCapkdouLCyRHI
         JmMkSB0sfyYf+UfzNrlBP1YUXuUPo3J4PCJg0b2ypdp84QIV8+1MkQvLwSHwJcP2tztS
         Oh1LWkQibEETYSQGW2qEc4ZLFESrndTDPQNMwNh0HPpIKjR3KUZJJWbM15FivKmrYh1B
         Erng==
X-Gm-Message-State: AOJu0YxpFyW3X0GYBfJ47HcIUPolSp1dXOC1xcGmsIxVlsgBvgSc43XR
	wI+nHZwwOIe7HtbOZSF1Eh8J3Oa4T7MCWZ2qJuPBt708Qvgt+eb3oQbiUH8pagRks0KwKpZOD2i
	60WzF
X-Gm-Gg: ASbGncsZPj2/Ce27XjBpZre54le3mYP8lxh4hv/mdaN+VjbvOxXWZxqyFJeBdvwG+W/
	iW3x61UXbP7INhKN8QLwlt1taTYgRox5up/P9WhdqGsnxAkj4t49pFDmjioJqy2ZmbTSfwABJHQ
	MubI9yYyok5VpfuN1xYxsZZM2Lpr+E7JdQEEEJTB8qW083lcipbCtGwkcazQUpbS0zGDCLY1Z8f
	XF7Sw/jamsjCykyhCcxaL3NpwQz+ll2arz0FgmwZ5VD3vv1rv6eiqM3O+xKqNOx7GaCBSRfoOz4
	GKapd9im3a0MQxQJvY0sfAPPTeRGoNm0sGY4zhECCv1avJARvTW2AYp2H/RWLEtdhfsfTqwBh7E
	ojqPg7GYLF86qI9ST7VAiN1BfpLwBpS1nY3C/WX4juktTJldAYGrEok6AhT1UKzGNU3jvral4/a
	VKntZHiEsKPSHiOBtD2qidpldFhPVuYBi5LQ6y9gMNDlWd20GuXmIpaCvQ511PJX6teZ7puB3m9
	URlhIQo/MMPDgk=
X-Google-Smtp-Source: AGHT+IEJsxBMynhxD6vFn844nbE3vrcD7dPM8jCGo29zdsGDve0LotDO8NVdfT6GUKVAyDTfl9sfRQ==
X-Received: by 2002:a05:600c:4691:b0:46f:a2ba:581f with SMTP id 5b1f17b1804b1-4792eb4cfcfmr32048645e9.16.1764847876818;
        Thu, 04 Dec 2025 03:31:16 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479308cd87csm29385885e9.0.2025.12.04.03.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 03:31:16 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [RFC PATCH v2 1/5] kernel.bbclass: Copy include/config/auto.conf in STAGING_KERNEL_BUILDDIR
Date: Thu,  4 Dec 2025 12:30:54 +0100
Message-ID: <20251204113058.948115-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251204113058.948115-1-yoann.congal@smile.fr>
References: <20251204113058.948115-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 11:31:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227282

From: Yoann Congal <yoann.congal@smile.fr>

Linux commit aaed5c7739be ("kbuild: slim down package for building
external modules")[0] states that include/config/auto.conf is also a
file needed for out-of-tree build.

This avoids this error when building an out-of-tree Rust kernel module:
| make -C .../tmp/work-shared/qemux86-64/kernel-source M=$PWD
| make[1]: Entering directory '.../tmp/work-shared/qemux86-64/kernel-source'
| make[2]: Entering directory '.../tmp/work/qemux86_64-poky-linux/rust-out-of-tree-module/git/sources/rust-out-of-tree-module-git'
| .../tmp/work-shared/qemux86-64/kernel-source/Makefile:779: .../tmp/work-shared/qemux86-64/kernel-build-artifacts/include/config/auto.conf: No such file or directory

[0]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=aaed5c7739be81ebdd6008aedc8befd98c88e67a

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-recipe/kernel.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 003a155e794..32d8fc78686 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -570,6 +570,7 @@ do_shared_workdir () {
 	cp .config $kerneldir/
 	mkdir -p $kerneldir/include/config
 	cp include/config/kernel.release $kerneldir/include/config/kernel.release
+	cp include/config/auto.conf      $kerneldir/include/config/auto.conf
 	if [ -e certs/signing_key.x509 ]; then
 		# The signing_key.* files are stored in the certs/ dir in
 		# newer Linux kernels

