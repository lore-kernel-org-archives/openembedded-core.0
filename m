Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04B94FF6E66
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 20:29:25 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.86039.1773779359317883229
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Mar 2026 13:29:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l66CuBSw;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: michalwsieron@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-664f8bef4e7so4239944a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 13:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773779358; x=1774384158; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zFFUWIFcgurMy5oIKWV5WcCw2zJrNUNGnIsKjRKe9Oo=;
        b=l66CuBSw6VWcpKVNp53i8tFtIRI3QEv6uAXiYUR5j0KBn5h1ET8pGAD3YOVODn++AA
         ZMOokjd8Qx0zpwv69xD3CNT44JIkN02iEMyLNM6aRFkth8LUkcP7dpQ3919bA/iYEeQ9
         PxWojhGwwX4rynfItZMswtE26Epg2cOaUdEIKYp/4Yn5yJX8av3GJ1tzGfUzFtLfHeEL
         5spPqqLsXfwJIgSOxTSUF4sOAl+s6KaV6kf3eumMPmkhaNgiapbtMVnRRBDTyBcpRkKY
         GBlQY/e+aGDo790qqAVzIdku0zRDfXuT2CI/5fVVAzlNFiJayXUBC7nS97U6zyt9Lx/s
         4vLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773779358; x=1774384158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zFFUWIFcgurMy5oIKWV5WcCw2zJrNUNGnIsKjRKe9Oo=;
        b=kemqKU7ahICGdCLKyOPoUVrpHVK821x3PdPPRB5z+OuDI6aw4vhfZw9NmqkTTnp1wW
         VvW+hlcG8SzzrQlxD5bCoxNPOuSdHHdBeh6xe/tPEAgMitYFmJRayDaho5sTNQM0SMuy
         a/W7FnqwiRGGhUXmOH/c1ExP7Gd7ACes32xaZZTen/H5VRjt3ODMXtoquutAJz9uJSWD
         pOgjfp5bVEsLrbpwWFoLVnwf9zH8OVCEeAGNVQoPCcYJ+H36eRos3Zw7qZ6Rcvq9pNF3
         Ue0TfiKKHfQ22aHVCTV8F0GPjrui8BHraQ6xbZTP568LvZ964BfNWo3fRNlL5FAEgPnr
         mgIQ==
X-Gm-Message-State: AOJu0YzJd28egmz+J9P1Rto3J8SErBeF+KiG6oDl+8aTGbuiveNg3gAP
	GK+t3pZna+UW4lMWXKuiRNp/ZzGNmSeQ51S+ycf2Enyy2tUW94fSyERv6RoS2Q==
X-Gm-Gg: ATEYQzyeE4RBVuXwddkcFjZRGlsxs1gpWAwBk2DSTuybGVrwRMjq9fOToKc0rMAQQUx
	TrQggWUmKuXwL1EmWYzVnywtoZJx4JYokdYntkFIXtU7BwZAshwbtXRgt8SwO4n3QqGRG13hOVj
	EKBB33KsojBotfADgVD9/jGhNEdG4JEHWkxaLDtyKJkYngUuCU2fj0PPdqtViXO5evkokzlQkIH
	zr2MZIPOXd5h3uEW2PeYfKZgvUvJSpFVRLxkleYG94nS/R+6LRqTn/HfgK2BwjMl+n3pXhq6/tl
	WGPxhbHvb1Yj5soPQnclgtmCBQZsCFfOw5zxNbFlAw/Ud23+AUNlsyLmRgIKgBbI5J0F7fTmFeQ
	jW7Bdp58K1zeQ8NkgUMi9SAnmpC6cIk9CPefxhbG/Y9DR8UusH+LmcdxNWtJJjAf7zSg7RPd0Rw
	gvKFYg29Tyc5L0vAh5ZdqCdznFw+eDy8tr794Y8GABuROTeVepgal9Xdpu4uE2Jd0=
X-Received: by 2002:a05:6402:4408:b0:665:33ec:fc58 with SMTP id 4fb4d7f45d1cf-667b1e654e1mr706394a12.2.1773779357603;
        Tue, 17 Mar 2026 13:29:17 -0700 (PDT)
Received: from [127.0.1.1] (185-164-141-154.cgnat.inetia.pl. [185.164.141.154])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-667b0eb9c02sm451909a12.19.2026.03.17.13.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 13:29:16 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
Date: Tue, 17 Mar 2026 21:29:00 +0100
Subject: [PATCH v3 01/13] libffi: Convert confusing append to assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-fix-invalid-appends-v3-1-59452f073f31@gmail.com>
References: <20260317-fix-invalid-appends-v3-0-59452f073f31@gmail.com>
In-Reply-To: <20260317-fix-invalid-appends-v3-0-59452f073f31@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Michal Sieron <michalwsieron@gmail.com>
X-Mailer: b4 0.14.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 20:29:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233336

While in this case override caused by `EXTRA_OECONF:class-native +=` is
desirable, the `+=` can be confusing. Let's avoid that and use explicit
assignment.

Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
---
 meta/recipes-support/libffi/libffi_3.5.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libffi/libffi_3.5.2.bb b/meta/recipes-support/libffi/libffi_3.5.2.bb
index f648a33a46..97c8996a38 100644
--- a/meta/recipes-support/libffi/libffi_3.5.2.bb
+++ b/meta/recipes-support/libffi/libffi_3.5.2.bb
@@ -16,7 +16,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BPN}-${PV}.tar.gz \
 SRC_URI[sha256sum] = "f3a3082a23b37c293a4fcd1053147b371f2ff91fa7ea1b2a52e335676bac82dc"
 
 EXTRA_OECONF += "--disable-builddir --disable-exec-static-tramp"
-EXTRA_OECONF:class-native += "--with-gcc-arch=generic"
+EXTRA_OECONF:class-native = "--with-gcc-arch=generic"
 EXTRA_OEMAKE:class-target = "LIBTOOLFLAGS='--tag=CC'"
 
 inherit autotools texinfo multilib_header github-releases

-- 
2.53.0


