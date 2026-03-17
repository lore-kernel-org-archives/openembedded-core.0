Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FB4EFB5E98
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 00:03:45 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.65243.1773705816778848436
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 17:03:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Yb0DkYhj;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: michalwsieron@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b97a9f4b4dcso245815866b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 17:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773705815; x=1774310615; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I7uk2iFidE9qoIbV8LH3NVLwJFN6tYOTX8P+Xua2W+Q=;
        b=Yb0DkYhjn1HUe+JfS35jx7LaPsJwpUbrF98fSwTDIKuOWMIzmqdEiqm5zBvCLHQtfK
         aMsqbmpJI3BK4XwrAoXlKQWrYcmjkKW6z+FML1tQhm6cZ5aMYanojLK13Jl1Up8WUyzu
         AkQuMMfuswCjIKuxdfsj5nQ75NhIiRedkMS4/QHtF6thFAtJMFpdaSec8sjiXG7HLFn5
         HvHEaIt88L1JvUTrIxVHw61ORQZU1JLbyIRzaIexKsDDE0VRx7QultHGljnjm7gZa5q8
         5FjceFeFEAxKpWDnfTpTGiSo+qesbIJi/zy299z41YaV9+OmZmw+Itvb2Mwjwl2dsbjV
         ZpPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773705815; x=1774310615;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I7uk2iFidE9qoIbV8LH3NVLwJFN6tYOTX8P+Xua2W+Q=;
        b=XZPnE1ksXKR+cvjlBt8PcPf2b53FgGGObVnVDFeM79iqdxUMPFmwzC0T3TIbuJRUDK
         1swicJV/9lyMbUijPFe/4IAfHQpmNBLnhpmpn8hvqQ045ZAbpV7WgO5GboSI/aPpUY8p
         bwWXRy1AUS7r4nkL2zD/v8W01XvzOJJqPyOHBPEC0OqVn1y6MSSEn/Ex2ccAylLGzUSy
         vyouL28Lg/mNQnOzbTPQWkNrrvB/xrCIWY1InPuT0F3CPnwuHzWaFhrqFdiZPcw8d1kP
         BeK77yEeWy3KXN7X2uKC5MDNOtpl9eIMiacvy/+YrlGY+IQNJobaJ3xBJin0KrD2Xm1k
         nmnA==
X-Gm-Message-State: AOJu0YweI5jWbeqZrNuAVD3E2pEUJFcgxVvWx4SJyHZLT8ogAviQrQgd
	Zaep+Bs7hubRvPn7re41Ld+kiG60Ui0ylIlfYbsZHS8wq4yRhn9qeJyT
X-Gm-Gg: ATEYQzxQKIMSVwEUhZ9hYq6EyXQ2//HE/WmRrwdvzk/k51nNgl9znB+JnpibhXNX89b
	7SJaCjg6HCUweJzEtcsNiOHwpzv9LxsV73pej13kx9rnxBhStN6UZNOpjpBE/6DbMwuY9DXRxaj
	NevT8h85Q/xiN8aOsRTbXNdEzPelVJ2ZRycX3KB5GTr0jvRFR6psr/qfDRxMuXAR/aEiXXig7jZ
	PMt6vOJrhoPUA/juIt1QCkeAZ5945Z2sEb1l66zdWP/58xuDOg0vWNtcFG9Pvh6UHO/uKUEPo7p
	6uKoDp0zB99PA1evYZroeEQOryq4z4e4YbCRXu/ooWuicxT7nZonZVUu9JpeVBTdSdgGZHDhQWg
	9a9BXJeRQ9DnRNWgrVN2p3zKpWE4L3y10d++Ok5H/cs4QBbck/HWsuz4avvZPU3QyqaxMliKCKR
	pJTqLohiXIb7eYGaT7Q9NVcBIbTzFSced+08lIIYOGC7kVBh90fSfHhd1451RBC0BuXw==
X-Received: by 2002:a17:907:720f:b0:b97:8dbe:1ee6 with SMTP id a640c23a62f3a-b978dbe1f14mr647128266b.43.1773705814842;
        Mon, 16 Mar 2026 17:03:34 -0700 (PDT)
Received: from [127.0.1.1] (93-159-20-97.cgnat.inetia.pl. [93.159.20.97])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cf49fa6sm654584766b.58.2026.03.16.17.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 17:03:34 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
Date: Tue, 17 Mar 2026 01:03:05 +0100
Subject: [PATCH v2 01/12] libffi: Fix invalid conditional append
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-fix-invalid-appends-v2-1-5c65ae5787d9@gmail.com>
References: <20260317-fix-invalid-appends-v2-0-5c65ae5787d9@gmail.com>
In-Reply-To: <20260317-fix-invalid-appends-v2-0-5c65ae5787d9@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Michal Sieron <michalwsieron@gmail.com>
X-Mailer: b4 0.14.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 00:03:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233274

`EXTRA_OECONF:class-native +=` was actually overriding previously set
`EXTRA_OECONF`.

Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
---
 meta/recipes-support/libffi/libffi_3.5.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libffi/libffi_3.5.2.bb b/meta/recipes-support/libffi/libffi_3.5.2.bb
index f648a33a46..2b2a368151 100644
--- a/meta/recipes-support/libffi/libffi_3.5.2.bb
+++ b/meta/recipes-support/libffi/libffi_3.5.2.bb
@@ -16,7 +16,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BPN}-${PV}.tar.gz \
 SRC_URI[sha256sum] = "f3a3082a23b37c293a4fcd1053147b371f2ff91fa7ea1b2a52e335676bac82dc"
 
 EXTRA_OECONF += "--disable-builddir --disable-exec-static-tramp"
-EXTRA_OECONF:class-native += "--with-gcc-arch=generic"
+EXTRA_OECONF:append:class-native = " --with-gcc-arch=generic"
 EXTRA_OEMAKE:class-target = "LIBTOOLFLAGS='--tag=CC'"
 
 inherit autotools texinfo multilib_header github-releases

-- 
2.53.0


