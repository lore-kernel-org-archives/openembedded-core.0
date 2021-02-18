Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.32.1613667413274908940
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Feb 2021 08:56:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KzBJFajg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id u14so3756696wri.3
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Feb 2021 08:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vqfdACcJryFf7rsMYMGIwCgBgb/l0a1B1RuXx2+I4M8=;
        b=KzBJFajggJ7JiZE2YJp2rvEhztSxnUk23ucNy/yWBYloyxRqO7F/G+NyLzsD+eYij7
         N6aJ3eIX13YjezUFt90ryCCPFJmyVfXHmL7tYfVvLhf4Ndo7N2aFxcKcN6DfChVtSZyw
         o2sLeES8OPS3XHqGEKmoKhRsYk4h7LYvPvyoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vqfdACcJryFf7rsMYMGIwCgBgb/l0a1B1RuXx2+I4M8=;
        b=aC1yZW5hqqvG++KqT5iz6NTDttn1gQdeonFy9sZ0wnDrnot4n+az5+nCm0EELRbApq
         ws1NtPwqZlBqepkBAGWp77gP90/tnZNEDoWvePrzr4wfWWBqObplI0EA4wE+3GBKi7Sh
         gAIcFkWe2gy3e+5Fp4qsXcNXNOTKjb0J5TZ3YFpQbqsHY1T25aZDEnXCjoSNSbencrav
         C2USgJegur00MTTtAYpjDVTAe8Fvbyp4FV5OOh5kF94J5I2MtYIJLRA58m6TlTTWENmo
         y+0Pl7OlE4Ctl6L/ZmnZnqbqK3wyW/L08MnnvoYU4jFg98dcr/kOVNpgcfi7jw6xlQ7T
         sZsg==
X-Gm-Message-State: AOAM533I0yLcd2nJVISLJKa7jHTb1+mLsel8DaljQ6fst6jo3b0zc/Ax
	2dxUmFD342iW/yibjhhPo0y/adjbzs4deg==
X-Google-Smtp-Source: ABdhPJz625ld6xro4UR/D9cTnirP663avroAOvU+XTqXo8qOfq+O8E/aO7QrA+ACTdk2OL7DmBfDlw==
X-Received: by 2002:adf:9dcc:: with SMTP id q12mr5071176wre.213.1613667411740;
        Thu, 18 Feb 2021 08:56:51 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:7504:d16b:192:2652])
        by smtp.gmail.com with ESMTPSA id b13sm9290328wrs.35.2021.02.18.08.56.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Feb 2021 08:56:51 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/11] xorg-minimal-fonts: Really fix determinism
Date: Thu, 18 Feb 2021 16:56:44 +0000
Message-Id: <20210218165646.2109894-9-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210218165646.2109894-1-richard.purdie@linuxfoundation.org>
References: <20210218165646.2109894-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

My previous fix wasn't correct as the file timestamps do vary by git checkout
or modification time and aren't correct here. Instead use a specific
date/time for the files to be deterministic.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb b/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
index e1e470bf344..bf8385fe6da 100644
--- a/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
+++ b/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
@@ -10,8 +10,12 @@ LIC_FILES_CHKSUM = "file://../misc/fonts.dir;md5=82a143d94d6a974aafe97132d2d519a
 
 SRC_URI = "file://misc"
 
+SOURCE_DATE_EPOCH = "1613559011"
+
 PE = "1"
-PR = "r2"
+PR = "r3"
+HASHEQUIV_HASH_VERSION .= ".1"
+
 
 inherit allarch features_check
 
@@ -26,7 +30,9 @@ RDEPENDS_${PN} += "font-alias"
 
 do_install() {
 	install -d ${D}/${datadir}/fonts/X11/misc
-	install -m 0644 -p ${S}/* ${D}/${datadir}/fonts/X11/misc/
+	install -m 0644 ${S}/* ${D}/${datadir}/fonts/X11/misc/
+	# Pick a date/time as otherwise it would be the git checkout/modify time
+	touch -d @1613559011 ${D}/${datadir}/fonts/X11/misc/*
 	install -d ${D}/${libdir}/X11
 	ln -sf ${datadir}/fonts/X11/ ${D}/${libdir}/X11/fonts -s
 }
-- 
2.27.0

