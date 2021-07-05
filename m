Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web12.549.1625524603954722687
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jul 2021 15:36:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ak1mALr0;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.173, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f173.google.com with SMTP id 10so7597446oiq.9
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Jul 2021 15:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=dYPGYKOfNsH/o8dWeIdFfN05D7cybfT8231P0txU6hA=;
        b=ak1mALr0otCATefvzyy/eQ2Jkg3uEuE3z8gp9+wlD50rG8rwDBrAOnUmJ7SyQPW5KI
         6zAg2sQnp/IqESPZKjDQWj3VhzQjN2/b4SsFNW3gWNIkFo4prbiK3lvpKETt+fERTOXS
         thEaLWsuM2GRZz1IGqu3BEULY4jllYqMQMxaH6vTI9GP8cI3NkHsj4p+Pz8AhE/ymO+1
         uNG2d+8h06v0pzl4Gc7lkp05zuF2PvzUtzgx6tbf+azJfpAjlA5L/xqWeiHjxnbNq6Zc
         WmlSBAMfxkRhwkECeAiXUK+W6nPP/F8Pj4QZr3U7ylebX3drrVnbpB8Q9L06pG5eyZW+
         XpiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dYPGYKOfNsH/o8dWeIdFfN05D7cybfT8231P0txU6hA=;
        b=dKubipO8tuDwmxTsf7mKF0JUYdHyiSrcjI+wtQkUEbDip0uGbosXvIt3cZ9GFQ5qKW
         3IO3EMxw73AW9IU7d5KAOjLG8Hu8RwNvI/ZBkBU/G4C/NBxbJK8eMDxDhPAMNZo40MoK
         jJgXWxj/WF6iREAoHC8WLQRs8KgSkRljRdjDG0pvAsh8/ex3nVx3B+kiWBtl2y8vZzvk
         yRM0Be+jKi1OE8qwT7SJNzm8g2cjCBDR/1Hk/lDQDi0bs0robY+PHD2Psk+wtzPoxxE5
         HtkG3fSkXzjA9WF6aMb8m8zcv5MtgCT5dHr5iBu+WYtGJxp1pXs2EFI16uLFxPeGg67k
         M0Sg==
X-Gm-Message-State: AOAM532AbdX2xbyflp+Kb4aAoIpEzExKxXsOT6zUy8VaZHFLkyefs7gJ
	DW7s53kGUWIN5Ge9wpjQZ71IlYbNE6fJjSii
X-Google-Smtp-Source: ABdhPJxSjRVQ1l6pDACKmUEevPXZ9mfmCSYwWk/3FDCxM8CqOVL4qQzoszKwrKAGl/wVYt6W8m+00g==
X-Received: by 2002:aca:dac5:: with SMTP id r188mr1084952oig.100.1625524602814;
        Mon, 05 Jul 2021 15:36:42 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id i16sm2870178otp.7.2021.07.05.15.36.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jul 2021 15:36:42 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/19] package_pkgdata: Avoid task hash mismatches for generic task changes
Date: Mon,  5 Jul 2021 12:34:51 -1000
Message-Id: <9c31c1eb4bd91294ea994c7961f28939a629c65b.1625511812.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1625511812.git.steve@sakoman.com>
References: <cover.1625511812.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Add SSTATETASKS to package_prepare_pkgdata[vardepsexclude] since otherwise
the task hashes vary depending upon which packaging backends are enabled
and likely other changes which add/remove unrelated sstate tasks.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4011d31d4372639fd72ee0eefae210bf59c90d13)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/package_pkgdata.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/package_pkgdata.bbclass b/meta/classes/package_pkgdata.bbclass
index 18b7ed62e0..a1ea8fc041 100644
--- a/meta/classes/package_pkgdata.bbclass
+++ b/meta/classes/package_pkgdata.bbclass
@@ -162,6 +162,6 @@ python package_prepare_pkgdata() {
 
 }
 package_prepare_pkgdata[cleandirs] = "${WORKDIR_PKGDATA}"
-package_prepare_pkgdata[vardepsexclude] += "MACHINE_ARCH PACKAGE_EXTRA_ARCHS SDK_ARCH BUILD_ARCH SDK_OS BB_TASKDEPDATA"
+package_prepare_pkgdata[vardepsexclude] += "MACHINE_ARCH PACKAGE_EXTRA_ARCHS SDK_ARCH BUILD_ARCH SDK_OS BB_TASKDEPDATA SSTATETASKS"
 
 
-- 
2.25.1

