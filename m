Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web12.3305.1628247667221492726
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Aug 2021 04:01:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dW1M7FwU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id c9so10509860wri.8
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Aug 2021 04:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3ovuIfIGCjosd1rYBGl2796XBEHYT090ap2O04whT9M=;
        b=dW1M7FwUrsh3hFdKV9z7j15rg1vaay7gnNN9Mk1NSU6Lw2uAx3ebMX+Nriwh6s3W9E
         mu7a0QeVqySMg1pVi/yFBvpuvoU8QjG4fqKTWc2/wln3rC2Dnh2tWQCFt/kI4ttpKWyO
         KysVXH7KFpxh8OLgfm8qlPz3EUWDwdDMVGHnE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3ovuIfIGCjosd1rYBGl2796XBEHYT090ap2O04whT9M=;
        b=msECNwm66njbl7cP4BMhIRDViUob/6V0nOEXUVSlYoeN1F2jRQRccG9ua45aZi/1IK
         MEYU+JjX34QZ0NsUL/lwyAmlQ6XLK6sg50WR00NWIBP0/n0YtpblrwyH7sjkj2RHHDNG
         8/HVlDmIuuWfvFiY4WEKXgbj4mzm7B//JatOcrM8EeIs9gC/RskJA2BBuM8F4eUqrypP
         RiTqtwPDIEIR4N3+HKgl+wSHMCi6ty1z40QBWZd62sknSSfUKsleVrPkkRSvQ70Y8Et5
         hYGf47bbq22cFP4+9f7R0CyswvppKoYR0LNmn7fzE3dwkyf1nR49KLTIKPI2JXUXukX4
         qcoA==
X-Gm-Message-State: AOAM532VgUpYBZgXPM5fBeuFVw5A9E92Lh6MitHGdQbZewYLcNGbI1bD
	VQPXWu931XnbYl/NkPh8MdunrwhNqRmbiA==
X-Google-Smtp-Source: ABdhPJwvM5Q/msx1Qi8F/b+YucBFhYZG5BkKVGx/7d+gPdwSn4qTlDDUEvZutMSRQIiQSZyH9fG/JQ==
X-Received: by 2002:a5d:58c1:: with SMTP id o1mr10264460wrf.6.1628247665817;
        Fri, 06 Aug 2021 04:01:05 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:9b1a:3a88:2016:c4d0])
        by smtp.gmail.com with ESMTPSA id q9sm11772073wmj.2.2021.08.06.04.01.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Aug 2021 04:01:05 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] gettext: Fix reproducibility issue with LDFLAGS
Date: Fri,  6 Aug 2021 12:01:04 +0100
Message-Id: <20210806110105.3604568-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If we add DEBUG_PREFIX_MAP into LDFLAGS, gettext-ptest is no longer reproducible.
Fix this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/gettext/gettext_0.21.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/gettext/gettext_0.21.bb b/meta/recipes-core/gettext/gettext_0.21.bb
index 4247b487ab2..5ada7099375 100644
--- a/meta/recipes-core/gettext/gettext_0.21.bb
+++ b/meta/recipes-core/gettext/gettext_0.21.bb
@@ -171,6 +171,7 @@ do_install_ptest() {
         find ${D}${PTEST_PATH}/ -name "*.o" -exec rm {} \;
         chmod 0755 ${D}${PTEST_PATH}/tests/lang-vala ${D}${PTEST_PATH}/tests/plural-1 ${D}${PTEST_PATH}/tests/xgettext-tcl-4 \
                    ${D}${PTEST_PATH}/tests/xgettext-vala-1  ${D}${PTEST_PATH}/tests/xgettext-po-2
+        sed -i -e 's|${DEBUG_PREFIX_MAP}||g' ${D}${PTEST_PATH}/tests/init-env
     fi
 }
 
-- 
2.30.2

