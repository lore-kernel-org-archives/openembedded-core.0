Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web08.2471.1630353964849925239
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Aug 2021 13:06:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LrYDnD7q;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: andrey.z@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id q3so23357900edt.5
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Aug 2021 13:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=mglFhVfwlW+MyoWhL3jSmJqHnP3SK3TT1xrOw+Tp/F8=;
        b=LrYDnD7q7l30oG9OWDb3CWzsS6ERljrtdrGLAGURHEQah/6pxvRUMl4CtSbqQKP530
         EKIR+LCnXFsr0BgTgx11snB08Ki7+i2LZgzBtgIXUBAIInNyg2gV9suJqtq84CMv37xg
         PE2enQ2Ar+3vypdAbP+U2oMQSrkbUcdcYEH/hrN5ge0l7kGDErkKDqYLsU45wd41fkKd
         6BLw8xp/aX9rEYdOFy2h7vcpTdxI4WK+81S8QQtnn/u/85/pBhNrISfPc3EVDs2D8JWE
         j1V2TyjxN0AeMTou3DIyJwDaBRuNHRib41vflFVDU/JVAyWxmduEDAJRotIOwFrj63qf
         aJXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=mglFhVfwlW+MyoWhL3jSmJqHnP3SK3TT1xrOw+Tp/F8=;
        b=MQFfeMQPpD6ZqukH8v3/kFcnxAYcJKid6162Wo73h89gxXfZdSI+WEOj1mYio/mQUh
         cEG/csCx0l1unT+sB+NxY/+JsT0uvUd86qPU2jIT6q34bgtv6gOt/neZ4d9tCK/mxKBy
         upqHDZ7fAEwNNuzEmgyK4VBai7chLXFCftAS/lSM9WQOfm09xt6NeSl1hWpSILMA7Ky6
         o88y9sIFUZX+9uP0ppUKdrf11zRO94rGkB/jeVaei/gozk+s8z4k97bU4zDMcPixXZk+
         k0rgRvqAN/G2TI8XcvgbEG9aXcOc9VGMokSqtelBVCN8hReVvzyPm+E3j7xITqJ/V41A
         ILYQ==
X-Gm-Message-State: AOAM5333t2ZBj+uUXt9+gyF3dEeQiR2/iPD7aovluUp5mtbF8/C4tjAc
	QYtTNyCpn6EfUuHSL8pnoODemUc1gwQcaqac
X-Google-Smtp-Source: ABdhPJzpatXHl0+YegfhFemV7f4zBqfzLKHAHwozXP2DgtRXVNdJ9xf2P8paQX+WOiVZVhIiCo7M1w==
X-Received: by 2002:aa7:d99a:: with SMTP id u26mr21687146eds.297.1630353962954;
        Mon, 30 Aug 2021 13:06:02 -0700 (PDT)
Return-Path: <andrey.z@gmail.com>
Received: from aherlnxbspsrv01.lgs-net.com ([193.8.40.126])
        by smtp.gmail.com with ESMTPSA id d22sm7274227ejj.47.2021.08.30.13.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 13:06:02 -0700 (PDT)
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Andrey Zhizhikin <andrey.z@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [OE-core][PATCH] perl: add integer module required for kernel >= 5.14
Date: Mon, 30 Aug 2021 20:05:40 +0000
Message-Id: <20210830200540.9888-1-andrey.z@gmail.com>
X-Mailer: git-send-email 2.17.1

Kernel commit 12dd461ebd19 ("crypto: arm64 - generate *.S by Perl at
build time instead of shipping them") uses perl to generate assembler
files for crypto functionality, which relies on the integer.pm module to
be provided.

Add this module to FILES and export it for build system.

Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/perl/perl_5.34.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/perl/perl_5.34.0.bb b/meta/recipes-devtools/perl/perl_5.34.0.bb
index ab19a8d0be0..7a07b3f4911 100644
--- a/meta/recipes-devtools/perl/perl_5.34.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.34.0.bb
@@ -248,6 +248,7 @@ FILES:${PN} = "${bindir}/perl ${bindir}/perl.real ${bindir}/perl${PV} ${libdir}/
                ${libdir}/perl5/${PV}/strict.pm \
                ${libdir}/perl5/${PV}/warnings.pm \
                ${libdir}/perl5/${PV}/warnings \
+               ${libdir}/perl5/${PV}/integer.pm \
                ${libdir}/perl5/${PV}/vars.pm \
                ${libdir}/perl5/site_perl \
                ${libdir}/perl5/${PV}/ExtUtils/MANIFEST.SKIP \
-- 
2.17.1

