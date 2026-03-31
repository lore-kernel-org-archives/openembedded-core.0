Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C7DD1061B26
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 09:57:30 +0000 (UTC)
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16610.1774951040639067664
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2026 02:57:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=pcJxUXcP;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.208.67, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ed1-f67.google.com with SMTP id 4fb4d7f45d1cf-66b0c0c0dabso727265a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 02:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1774951039; x=1775555839; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YaXfxBv0dQkcVaLWDeSdvLhqlzY9UCiQE7Dgds6AjJo=;
        b=pcJxUXcP6BUqx0+bJyNhl6QWkGkZ7VbuRpzCfdRB3vlCEFarbU9YnN1bfqeIuy/ymk
         vQ2qwUuIMDk8kdkjxmXzIdts4taE/lqrWlzbPcwA/e9CSk8KMCXoxwnkNvBvp7YUVgaD
         gAm+s45C2cafdUj+ra8HJIE8XSY9B7LV6/rzI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774951039; x=1775555839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YaXfxBv0dQkcVaLWDeSdvLhqlzY9UCiQE7Dgds6AjJo=;
        b=AKmDoy/dGxgcIjwCJai5KTFrugPdyDUYmJN1SvGJvny46OQBDrxxacfKzwhyV2ZK2M
         U2sR7i6b0nwud+vlAv0Q17rBsZbKkkyfhvJbxORRBey6LbeeC8zwbBLyIOEHhl9EFtAa
         VMUgezTLfu1u+TyEGNDc0BD2Ec78lYFgvFzzpmBtNUYfe4XjjuiNqZQyLy98sdtPRAZV
         o6VUtql9pUHgccmpGjsgAVH5Tzcr6ikA0fIm+c47KlqHIpzhLqLjxa2PM/+VWkpLC9W3
         AG6+6nDCx2CbgpbJyZK9qmn8u/IhGnT3W/ovXjSzJr8RltdMzVlsHNnobtxoF4YpX7oS
         M/FA==
X-Gm-Message-State: AOJu0YzNKoRAD9SLjXPxhtpuOaNqDMxKX/e+x0voQaz5IoCs2U31ozwH
	2Zi8Yh0edpuSiXFG7sLYs3dJwUGtMrjVSPRpdk2TlBauVhUQnv5OprHXvo4DI9qQBX+X57mzlN9
	WD2iLa8/3GQ==
X-Gm-Gg: ATEYQzzvHjJu2LD8PyzDnn1LQLm6GxAv2DCsdlshpn+ck3Ij+72hKv+wQ5UsDimBxOZ
	lh4OZ5/9AEH4w74ls2NTwm/TzwreKserwYFAdXS8jmRAEpl3+OzMl0Zrz/aTMEmwynr9sDb4jWK
	XejPoNkhsd+GiN9cajjgU6EqSdE1jR6xXv4Oa1SHze8oBvxW26aGrEUTxwO3FI0/6Yv2vZL8WS0
	SbgAWR4nZXI7AnB36xXAsTaLtavoNm34kPJub+RelSgemU7c2qycWMbJTwhJ4NN/0pbjXIXDVwH
	jfeMCLSvm9LLN4tMXKiFfuUP/UMETljqRKyAoWScd+VMmHgRgOkroPhVAw1yivqXzsVIOZ5ITAd
	CW85IQqoY9ztqyW56TQRTryNwzUiqkMQnlMhobRiSCG5MA8EXEOmp8IXS57ZQcd2sMDsbfuhG3h
	Ba/a2xMOd/xKQmVj10ChZaw0oxg7R+Sf6fgTX6NY2Q3Wb0F/vmwgW5/sw3EeLjAM1kHn9bvLtpc
	+Dxf/HOXvE=
X-Received: by 2002:a05:6402:524a:b0:66a:ad93:5b6e with SMTP id 4fb4d7f45d1cf-66b28e6edbdmr4133801a12.8.1774951038950;
        Tue, 31 Mar 2026 02:57:18 -0700 (PDT)
Received: from adam.ipgroup.local (212-57-59-66.xdsl.deanconnect.nl. [212.57.59.66])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66b7607a653sm3413599a12.24.2026.03.31.02.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 02:57:18 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v8 4/7] librepo: add PACKAGECONFIG[sequoia]
Date: Tue, 31 Mar 2026 11:57:10 +0200
Message-ID: <20260331095714.1285106-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331095714.1285106-1-adam.duskett@amarulasolutions.com>
References: <20260331095714.1285106-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 09:57:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234276

Currently, librepo compiled with -DUSE_GPGME=ON (the default setting)
causes dnf5 to fail importing repository keys. A very long writeup
of the issue is linked below. [1]

Add a new PACKAGECONFIG[sequoia] option which sets -DUSE_GPGME=OFF
and adds rpm and rpm-sequoia to the dependency list which ensures
dnf5 works with repository signing.

1: https://github.com/rpm-software-management/dnf5/issues/2539

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 meta/recipes-devtools/librepo/librepo_1.20.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/librepo/librepo_1.20.0.bb b/meta/recipes-devtools/librepo/librepo_1.20.0.bb
index 6557dda43a..7a2e9e6b9b 100644
--- a/meta/recipes-devtools/librepo/librepo_1.20.0.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.20.0.bb
@@ -15,6 +15,8 @@ DEPENDS = "curl glib-2.0 openssl attr gpgme libxml2"
 
 inherit cmake setuptools3-base pkgconfig
 
+PACKAGECONFIG[sequoia] = "-DUSE_GPGME=OFF,-DUSE_GPGME=ON,rpm rpm-sequoia"
+
 EXTRA_OECMAKE = " \
     -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} \
     -DPYTHON_DESIRED=3 \
-- 
2.53.0


