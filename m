Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.555.1623867604530734416
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jun 2021 11:20:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tanous-net.20150623.gappssmtp.com header.s=20150623 header.b=H328XOXi;
 spf=none, err=permanent DNS error (domain: tanous.net, ip: 209.85.216.53, mailfrom: ed@tanous.net)
Received: by mail-pj1-f53.google.com with SMTP id m13-20020a17090b068db02901656cc93a75so4499467pjz.3
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jun 2021 11:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tanous-net.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zzEBHzpWejk6u4xC5Rqv0uOXRpYaxS9Q5KdsTQT3Bcw=;
        b=H328XOXi8c9gzf0HWBEVV28jz6l+TxVcXak0rZtJf97B8rX0nfG/nyv++Why4SyWDM
         RWWWat5hwALKvq8j9R1m1Ji1SI5QqqliqhPxlmXL+nSbsIGG461RjOMabgV/3sIF0MVo
         oXxlSCbDQQLdUGansBeUc5aYcs3VcHjwCG1IxZArnQpigAWIZExFC37resURtxJmIRGl
         Mzv1Vb9MRoJ7aZX5eBskyAl0MQpSbgcveChaxGqQnxAXwssUNZN665KHB4sJaYP4/4T5
         gQSiJZjtEiGjeVfyCbn2Bud8Lre3igawtFbNuUB8vCj8ms7ZJIsfOUi1tDgjO2cozPhc
         aNMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zzEBHzpWejk6u4xC5Rqv0uOXRpYaxS9Q5KdsTQT3Bcw=;
        b=C9nq8hHfn2ozuMcPXI+gUDlLO+h4bHLnVDE3noKwWfpFF6etN/XE5NkZTZB0tWF3Un
         wL4kSFTrF44GLpeNJSNzdHuUjYRRxnwXzwXRiuEczwAGLuWXho4OpVdezhbwBuUlEUiT
         UGK7ZlAXcBMSf2XLMG9eTBNP5XLKaNtnNaptWb7AlMkVE5l8GdIj29cHnD71eEhqjOYS
         JsviDuITMV8S4O0EeNfNYhUenG0ggKiBiGBdYHHrezZdZzCWJWfiE0gonYXNhXlp2WZt
         0scgVLlD3YIWXutZNB/0Gmxys60rGxeS0Yjuy6O+HjA0VCXOuc0hx1pigJqqxi5LwAya
         YxEA==
X-Gm-Message-State: AOAM532pBS0aF2iRnRQmWm+J3uzJTI5si8gxJpJmsqSCP0TOKzP+pt7R
	vOnJqeGwjbr2wSc/7cE33Jz1QFZMSRw3kw==
X-Google-Smtp-Source: ABdhPJzrmF497CwZb0Esm43HXa2SGMKmfB97MAPA4bacReAqoiWs8cJFOA8Yy7gPprlMxZ98RL7ADA==
X-Received: by 2002:a17:90a:ab96:: with SMTP id n22mr1139101pjq.92.1623867603587;
        Wed, 16 Jun 2021 11:20:03 -0700 (PDT)
Return-Path: <ed@tanous.net>
Received: from edtanous.svl.corp.google.com ([2620:15c:2c5:13:c466:fa8e:b409:4c3f])
        by smtp.gmail.com with ESMTPSA id i74sm3058731pgc.85.2021.06.16.11.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 11:20:03 -0700 (PDT)
From: ed@tanous.net
To: openembedded-core@lists.openembedded.org
Cc: Ed Tanous <ed@tanous.net>
Subject: [PATCH] Use the built-in options for removing pack tools
Date: Wed, 16 Jun 2021 11:19:56 -0700
Message-Id: <20210616181956.2849161-1-ed@tanous.net>
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ed Tanous <ed@tanous.net>

For distros that want to use the ENABLE_LIB_ONLY option, the rm call
will fail, because ENABLE_HPACK_TOOLS (set implicitly as part of
ENABLE_LIB_ONLY) removes those two binaries from the build, so they then
can't be removed again.  This commit sets ENABLE_HPACK_TOOLS=OFF, which not
only allows for the option to be overridden in other meta layers, also
allows a simplified use of ENABLE_LIB_ONLY in meta layers that don't
want to ship the binaries.

Signed-off-by: Ed Tanous <ed@tanous.net>
---
 meta-networking/recipes-support/nghttp2/nghttp2_1.43.0.bb | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta-networking/recipes-support/nghttp2/nghttp2_1.43.0.bb b/meta-networking/recipes-support/nghttp2/nghttp2_1.43.0.bb
index 959cccf35..08b855262 100644
--- a/meta-networking/recipes-support/nghttp2/nghttp2_1.43.0.bb
+++ b/meta-networking/recipes-support/nghttp2/nghttp2_1.43.0.bb
@@ -18,11 +18,7 @@ PACKAGECONFIG[manpages] = ""
 
 # examples are never installed, and don't need to be built in the
 # first place
-EXTRA_OECMAKE = "-DENABLE_EXAMPLES=OFF -DENABLE_APP=ON"
-
-do_install_append() {
-	rm ${D}${bindir}/deflatehd ${D}${bindir}/inflatehd
-}
+EXTRA_OECMAKE = "-DENABLE_EXAMPLES=OFF -DENABLE_APP=ON -DENABLE_HPACK_TOOLS=OFF"
 
 PACKAGES =+ "lib${PN} ${PN}-client ${PN}-proxy ${PN}-server"
 
-- 
2.32.0.272.g935e593368-goog

