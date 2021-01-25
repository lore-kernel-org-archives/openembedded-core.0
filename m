Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.332.1611586305805440797
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 06:51:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=dIh9bliZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id n10so9024094pgl.10
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 06:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=o5qXktwHUDMIpkJtEIEve8h6xBtrvxk1cxrNs5eDe5E=;
        b=dIh9bliZcBAgiyWukdHodfrmyCSs2Q3EZ7/+sSEppmENsqZxMQUTRBg8dh5zpx8XUT
         1LNJPi0xlF4PBYvO8/BBAHUXMcj7L8Xf/dL8z/fWnc9QSks7w8gLcYEBt8auA+o/6gec
         1khNjyhxzQfXS8g63DFtaOlr5wOFbHThcg7qdELfy7p5MevyyW8sBrYgFQq2wEBgRzdV
         81eYI4BR/hCNiRyqkaHPLInsaC5MCw5UTnv0a4UbI03d9pusF2KUsB/2AOhcoJ+fLhI6
         5+sB8zlN5GfMl0RPKs2BksmttTPiFGe1NWiK8EqxRmCNZedmbv72/cQoHykxyhSzfjkc
         QUng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o5qXktwHUDMIpkJtEIEve8h6xBtrvxk1cxrNs5eDe5E=;
        b=kJQlJ4ssW53GJedeLt0YGeHmOA0VXLAZ6c3Gk3BH6fH8sYscUSsIHSsRPlCb7bveik
         G2PHmCKf2RGaXguR0yYrVz7eV459tJN9kEBUuEHO/SHWmE8lSCjztrHUulsBaNPsaXTO
         7KDzGQfcO/nq4TS3z+NLnJsWTwEtldHZSfSsodztTiZ5Yf0qrSjQI+m92DkI8gTk9yzL
         +mLVXffnEi5XiqhzXgaWcIQQgG/Nkk7kGTqUcL4uDMDZ7h7PBsnDdl746fjjorTb1JmF
         1JsixPJuzauJJJ6FvxW/dw1Itds46mPbfrHKdWQLAI/l1YiwrlFI2WtJJazUrUF5uPl/
         JbTg==
X-Gm-Message-State: AOAM533ZsQx2jGZXMHXAg4rkhnO2dpdgpOT59HZ+WXgrbHl5ANo2gt3D
	R2PSRyceqaLBkz85MmkhMo1pOEJyGBazuWUmOSQ=
X-Google-Smtp-Source: ABdhPJyak3zxwCvqDtmbjsHo3SbFOQRyyGpDeIxEXS/JbWcuneK2sdyerRxyv34fsiTmShmOtcwEwA==
X-Received: by 2002:a62:c312:0:b029:1a9:19c7:a8e with SMTP id v18-20020a62c3120000b02901a919c70a8emr907315pfg.74.1611586304897;
        Mon, 25 Jan 2021 06:51:44 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id x8sm17574354pfn.27.2021.01.25.06.51.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 06:51:44 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/47] pseudo: fix renaming to self
Date: Mon, 25 Jan 2021 04:50:36 -1000
Message-Id: <158e8078b8c50fa6f6f82bd51d0a3567ab807103.1611585425.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611585425.git.steve@sakoman.com>
References: <cover.1611585425.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Joe Slater <joe.slater@windriver.com>

Pseudo tests for an item being renamed to itself only after
information about it has been deleted.  Move the test to before
we change the database.

Note that pseudo does not support renameat2(), but neither does
glibc.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6b3d109f42385ad1cf1f297a6c06ea7eb6509f26)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 9a22304bba..3b623d8bd7 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -6,7 +6,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://fallback-group \
            "
 
-SRCREV = "8efb082863ff0ceec7b7e46f9a44750e12f48039"
+SRCREV = "d6b1b13c268d7246f0288d32d6b5eccc658cff4e"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.25.1

