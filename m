Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B95BCC77B7C
	for <webhook@archiver.kernel.org>; Sat, 22 Apr 2023 15:59:59 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.10439.1682179197335455652
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Apr 2023 08:59:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=I0OBWxhW;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-2febac9cacdso1675043f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Apr 2023 08:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682179195; x=1684771195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q11xLxpqteyriq9xx8iPLbj38UBSjXHRIFtO8X+vK70=;
        b=I0OBWxhWelWvt43shgX8FhHYN3YP6gZ3KmIL/Nc6V6IMe85AaV+H4O0uqRuWGqjREo
         FBIGQV2p9cS98p6/L8xww2tyK2FjEssBRDVTwdxnEDd86d+p5dFm2ltl/EUheUSGEvs4
         PJVDHZjABwSCBYCbADDEt5FALs9Ba5Yj/2klRvUix8BeRYdFK2sV5VZKrk8qf+RDMpms
         arZ20Bz9Q3CiFR5EHRo6zDX1MdCyN8s4Tkh2VvFTci2H3J5uBXi8SvTh9ml5/rdnN92L
         OlPy7wdtG+b/egOhdeZzWN8u0Rw1JNvh7WUfJS07/RaZrfLovEZLNIpAEnwsThXz/9N5
         +Rxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682179195; x=1684771195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q11xLxpqteyriq9xx8iPLbj38UBSjXHRIFtO8X+vK70=;
        b=RmWwFa/fbjKo82A5JALiqUY7OgllIZZn1hrgTAawMw+skz6NP19I+oVNVAyyFnDuw4
         noL7DXBiST7ooqQmYdmcqsBsFefUVbtC8em9MuPmESsQlCAzU9Si9GHUy4KvROjnE2ZW
         Q/P/gbepPbDUaH8usTVe6RyaDbvs7l4VmFDT1YsmOFYTSMpzIEtEsn1vBtQgIxYRj0Um
         w/hFYbnCleDrOv20YQz0+uTkN3ysJlQRJ16yS3aSujXm8ki53sbLkK4YBeqxXCJin5FU
         SUa+ARQwjJlwj9a6oTJDITZcl+TWNKN8xl+Ppq7CkY8OuY9+WEiyXV+edsR/hhtDPLom
         3yMg==
X-Gm-Message-State: AAQBX9cQcQ+KWIKOsk5MmXq92KPS6GHbm2B20DugFGXlvPye2O7eAkCS
	8bqGhyhkVnQw1irO0FYvyRX6vydXd6M=
X-Google-Smtp-Source: AKy350bBxzWdyvWl+QTV85ZDUwRXtyaS8lDr2kp8NgjD3sUhMN1cQJYf43LlBVJPBodUB3uGwKtiCQ==
X-Received: by 2002:adf:dd85:0:b0:2d1:9c50:5746 with SMTP id x5-20020adfdd85000000b002d19c505746mr6282011wrl.12.1682179195430;
        Sat, 22 Apr 2023 08:59:55 -0700 (PDT)
Received: from work-pc.. ([2a01:e0a:8d5:c6c0:446e:1477:ec70:1aee])
        by smtp.gmail.com with ESMTPSA id e29-20020a5d595d000000b002fddcb73162sm6798184wri.71.2023.04.22.08.59.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Apr 2023 08:59:55 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] python3-bcrypt: enable build of unit tests
Date: Sat, 22 Apr 2023 17:59:42 +0200
Message-Id: <16bcdbc98416ac7f70147b2e5bd02ed8b5d7bece.1682178812.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682178812.git.frederic.martinsons@gmail.com>
References: <cover.1682178812.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Apr 2023 15:59:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180321

From: Frederic Martinsons <frederic.martinsons@gmail.com>

The source code of bcrypt extension doesn't define any tests
but it is to show the ptest-cargo usage

Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
---
 meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb b/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb
index 21f2eb6ba4..b4f245530d 100644
--- a/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb
+++ b/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb
@@ -7,12 +7,14 @@ DEPENDS += "${PYTHON_PN}-cffi-native"
 
 SRC_URI[sha256sum] = "27d375903ac8261cfe4047f6709d16f7d18d39b1ec92aaf72af989552a650ebd"
 
-inherit pypi python_setuptools3_rust ptest cargo-update-recipe-crates
+inherit pypi python_setuptools3_rust ptest-cargo cargo-update-recipe-crates
 
 SRC_URI += " \
 	file://run-ptest \
 "
 
+CARGO_SRC_DIR = "src/_bcrypt"
+
 require ${BPN}-crates.inc
 
 RDEPENDS:${PN}-ptest += " \
-- 
2.34.1


