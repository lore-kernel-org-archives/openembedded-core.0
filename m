Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web12.5047.1626770535811350974
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jul 2021 01:42:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fSuef0Rp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id k4so25080461wrc.8
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jul 2021 01:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YQj7LinNz3BG+dG0tK+t0hAjXiyUC+7yZb5wYX5aIuc=;
        b=fSuef0RpecFBTzGRUCPF/NrMBM6ksV7uFfcBtIf4HKEsi83Or08dQA1+l5/cJkjEpP
         zepowfolPZsIppdjU+Ngf2DivnLoVO+IiGMv7sJmgMV/J97zndezJjRBHXH67+k9bR1d
         ZqJ8J9kNRO9yLR4KW+7gzucv0lCTz6EaO3u5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YQj7LinNz3BG+dG0tK+t0hAjXiyUC+7yZb5wYX5aIuc=;
        b=YmP0rIGR20ViUy7zZJWH7Tt4CZfmYIfmDSk7px160HZzYfPb3jg/7ua2pVWuyBQPx/
         E1HZB+fNsLa80PujjNhPz+NAHLQa6nQ73gpGr45d+oe/LOZuYVVpHIkuXZ0otiCJmBd/
         BXv0diswgno8c5SwVz3NPxaJ18Tmy7MOUU8VWgDIOAayaynOA9n7GnDdiEhcb+PJyiYY
         lSGqlGgd1lMrLtfvIDBi3DNxwZMVMHuNpT2dhmmQsoZ/pzrYR2I5okFoqzDZkJTOh5bm
         pBvxlrOM3eu2I6qJ80ZBeqor55N5+1cPDt21kqMR4v8WIGadNvzsvRndQpUjB0DjViHQ
         r6pQ==
X-Gm-Message-State: AOAM531JNa5eXulZXMuUGNwe7Nx2XBsN69EkoZWyoyjy7hoLU83vap+H
	N8pJJD2ljSXoqKS6YinTf2KzWj7c0CO6SQ==
X-Google-Smtp-Source: ABdhPJxaNB07r6FSvJSJ0gpT2mgSUnrHi/ALhaG/pDcVbVoJsvnMkmqP++DLrB7Q3w4kG/XF/S58rQ==
X-Received: by 2002:adf:ed07:: with SMTP id a7mr35765538wro.70.1626770534174;
        Tue, 20 Jul 2021 01:42:14 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:2cd8:e78f:29a5:f753])
        by smtp.gmail.com with ESMTPSA id s4sm21582372wmh.41.2021.07.20.01.42.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jul 2021 01:42:13 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] zstd: Include pzstd in the build
Date: Tue, 20 Jul 2021 09:42:12 +0100
Message-Id: <20210720084213.3032232-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We don't currently build the parallel version of zstd but we should. Add
this to the build. It will then be used in buildtools-tarball.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/zstd/zstd_1.5.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/zstd/zstd_1.5.0.bb b/meta/recipes-extended/zstd/zstd_1.5.0.bb
index 806edb63c39..3786058731d 100644
--- a/meta/recipes-extended/zstd/zstd_1.5.0.bb
+++ b/meta/recipes-extended/zstd/zstd_1.5.0.bb
@@ -29,10 +29,12 @@ ZSTD_LEGACY_SUPPORT ??= "4"
 
 do_compile () {
     oe_runmake ${PACKAGECONFIG_CONFARGS} ZSTD_LEGACY_SUPPORT=${ZSTD_LEGACY_SUPPORT}
+    oe_runmake ${PACKAGECONFIG_CONFARGS} ZSTD_LEGACY_SUPPORT=${ZSTD_LEGACY_SUPPORT} -C contrib/pzstd
 }
 
 do_install () {
     oe_runmake install 'DESTDIR=${D}'
+    oe_runmake install 'DESTDIR=${D}' PREFIX=${prefix} -C contrib/pzstd
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2

