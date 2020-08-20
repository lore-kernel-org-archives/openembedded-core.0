Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web11.105578.1597906655114562381
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2020 23:57:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hZ3X+d9p;
 spf=pass (domain: gmail.com, ip: 209.85.216.65, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f65.google.com with SMTP id nv17so560276pjb.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2020 23:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ss5+qGVuJu7BL08PHPRKgh7kAqEnYnbuyJjDGf7ZUTI=;
        b=hZ3X+d9po9Wg/vyVbzaMAqECmOUtcRNpgXpB6YSFdk4vlEDYk/5GvfkH3rGbsV7K7h
         UKL+FK3ZKA9lbBaSlFJ179Ec6jllYaScc+po6oOPFpCSvILTGNYpdfQOBPI7guRY8ah4
         8xiVu955NSh9k2VRFXpBZWvv2TIeFMQHboB5aZqb8dm8PLkDIlQG9/3V1Gptjkvhn+uW
         /TsH56YYIzjMDoTo1QWVEAJAzkBjq6H5evGZyMnD3FYW3rUF+BA/Vq5/hhY9hTzODjco
         Ps6WNbuGZQmjt+2CW+Pd3VANMV0WA9XtVF2dBVJqFBauQYSYPueEPAG18A0y3YHCMP1q
         uGxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ss5+qGVuJu7BL08PHPRKgh7kAqEnYnbuyJjDGf7ZUTI=;
        b=qBuYchD20zjeQnC821kjXyGykCcCwQqpEXttjY7HqxFIP/NX7oJ/1GetmQFS0nj4yf
         c0yJ7koV1hxLnCY0RigqPlXDoffL+U4dCnGYM3DWRiLID3V98KxKVljycygvMXzpobQ+
         96H/uZyZuAeQGwOhQRqnorGKAPwy5So1lTy4S+qouxkApigXr5rhrH05O1dS+vRqQB6R
         uJIzoph7BWKNVw90WFHH4njKYaC/0NXIX79jwkDvxuDkfy7bjLk36chsW6JpabzwULCN
         7lpFViAsQwalRXAu0oxQqPqY0vTRRswRwX90E7WzIotK/J9WXLWGhprp3GHkYHIez63i
         20JQ==
X-Gm-Message-State: AOAM530fFc0XCljYvQVXH6Xm7wbvGn7DDziTAAcXaW4n5gbRnLgjZF7N
	1ttV+rxaFdZO67+NpCw1/BT2bnF7Qklvbg==
X-Google-Smtp-Source: ABdhPJxRBBboUwemFiyuS/g0R7Lv6vHFflFejOXEREIHBkF+pGVIvwOO7B77HoRgR1uA92kdA2BT5A==
X-Received: by 2002:a17:90a:154e:: with SMTP id y14mr1442064pja.178.1597906654395;
        Wed, 19 Aug 2020 23:57:34 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::37ae])
        by smtp.gmail.com with ESMTPSA id 77sm1534936pfx.85.2020.08.19.23.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2020 23:57:33 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 4/4] gcc-cross-canadian: Stop chown'ing D to root
Date: Wed, 19 Aug 2020 23:57:27 -0700
Message-Id: <20200820065727.2589128-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200820065727.2589128-1-raj.khem@gmail.com>
References: <20200820065727.2589128-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We run under pseudo and this should no longer be needed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index e23b21b68f..a58e7ad576 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -136,8 +136,6 @@ do_install () {
 	cp ${S}/libquadmath/quadmath.h ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/
 	cp ${S}/libquadmath/quadmath_weak.h ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/
 
-	chown -R root:root ${D}
-	
 	cross_canadian_bindirlinks
 
 	for i in linux ${CANADIANEXTRAOS}
-- 
2.28.0

