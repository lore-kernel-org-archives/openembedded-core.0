Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web09.6551.1613475558487922022
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 03:39:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EFeVCSPP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id n8so12470845wrm.10
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 03:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r2ptBuAJea2QZUUh7V6umI30hpmlGBqpcEl+dZaK5tU=;
        b=EFeVCSPPEb/OnhncOJYVxLKQeFYaLBs71Hwk6UZNSbRGWQFyz2+A9XoDXD6EzVBySi
         u5Sf+ZVEswCjQjqeZXLYtQxSwKOtZhJ+4z5JBZgo0U3uUmxQko8twTXlB4fNGztOeJpb
         UNypRK1C5DuU2mOMEGUHVtvlnRXQdt3aYdGpw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r2ptBuAJea2QZUUh7V6umI30hpmlGBqpcEl+dZaK5tU=;
        b=n/l8QSHfnohdWTrD0Iu3ISaqWYY8sUYQGgFpd6ore/S0HrSHNHnO2ZhiajcluBvclr
         zYPoKo8rYbhmyu6PbVAoKglB+3JFyTtrfXDC1do4L2M+lQwe4Zl1h4V3TfnSin68bKXZ
         I7U6ccDTXk2wSSqlG3zXLTP2Cvu52b7r6UV5E/H1QusslPL7HyMiA03aEAlHzjMTqESA
         sdGtyqDdNcZeFTGr78039I846hCRLL2Ydt5RJx1Acl3/MiMXwGtBbwZr15HE4VKG8RKt
         fBVRQxzHejKKOutbFdK28X2nDb4IF/1nQE7dhZl90D6f2ZTqQajv3pVJUdzfYD2oL0Db
         W4PA==
X-Gm-Message-State: AOAM532lc9TOkV/CApRVY2+F5BvMZeoAcfYDBgKX7ijNVaamt5gLXxcF
	cuIafo0LgfxhVjjiJWZhroZKaz/s+dPtDw==
X-Google-Smtp-Source: ABdhPJwflKmC0m6cG/irk9orOsYIRQCkYXYXMBrZUYzsnJ0BZfuvZ7UBGUNlyVx6d7zYqD00A6LeEw==
X-Received: by 2002:a05:6000:1208:: with SMTP id e8mr24043748wrx.131.1613475556969;
        Tue, 16 Feb 2021 03:39:16 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:3cdf:51ac:3008:b3cc])
        by smtp.gmail.com with ESMTPSA id a9sm24673716wrn.60.2021.02.16.03.39.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Feb 2021 03:39:16 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] distutils3-base: Fix after native packaging changes
Date: Tue, 16 Feb 2021 11:39:16 +0000
Message-Id: <20210216113916.2021941-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that native recipes have PACKAGES, this DEPENDS construct doesn't
work. It applies to target and nativesdk recipes so adjust accordingly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/distutils3-base.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/distutils3-base.bbclass b/meta/classes/distutils3-base.bbclass
index a277d1c7bc6..302ee8c82c0 100644
--- a/meta/classes/distutils3-base.bbclass
+++ b/meta/classes/distutils3-base.bbclass
@@ -1,4 +1,5 @@
-DEPENDS  += "${@["${PYTHON_PN}-native ${PYTHON_PN}", ""][(d.getVar('PACKAGES') == '')]}"
+DEPENDS_append_class-target = " ${PYTHON_PN}-native ${PYTHON_PN}"
+DEPENDS_append_class-nativesdk = " ${PYTHON_PN}-native ${PYTHON_PN}"
 RDEPENDS_${PN} += "${@['', '${PYTHON_PN}-core']['${CLASSOVERRIDE}' == 'class-target']}"
 
 inherit distutils-common-base python3native python3targetconfig
-- 
2.27.0

