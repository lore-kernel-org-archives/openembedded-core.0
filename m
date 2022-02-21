Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31817C433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 21:24:50 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web09.4696.1645478688858631277
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OAc1CQ+3;
 spf=pass (domain: gmail.com, ip: 209.85.214.170,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id ay3so5057688plb.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6b6hjU8Tr0y6EpLhEFIaw7+Ycu7cqKCSFhJOflzqT/M=;
        b=OAc1CQ+3cih+Folb43aA8afqsqhUopzpXg+z7HnewzugOq+mcfFTLLgHBFdg0MlPwI
         tKos7GXiN0LznNpiPf6YAceAtDOsLLILv5BMqBfmKzzoiWHN80Pv7L/vJvOUcRgxCBcR
         Fgg7myr/aXRVEXD0wnTOgJLHUzOX2NYFobS2d2jjXMgDbxkoPMPofHUSbybOHsNvvHPR
         KYGO0jRrDeRyKxpk0BHP6JQyz+Qke+myOVjHSu82Fsv01B3cNVxYf8Zpwe47xErzhjJE
         vv4Pa9AvpJQ5xtYS5AIrzngU8mvkIvdbTH8PGrFg/UmX5+N7Ah6fnqcAt8FDTPVB00Dv
         DFzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6b6hjU8Tr0y6EpLhEFIaw7+Ycu7cqKCSFhJOflzqT/M=;
        b=BHKl5j8xm5LE6H1zuuhfreKIGvpkz+paLmdzh9+ITS83ow8uWdZ7uoXxoxxsih6YvN
         hwDw5zU/mFABeiUSTPpGQw2tqojGeymVOw+OLMWdELPNLx7669Hwuyk2GN96eP/f0h92
         mT/8vviMjnT1YO0e+sljhHjOiPf5wbbo+n8JnyAe4uxmxvZaj+BaDPbWAfT+yzcEuC+1
         a+qNMW0D8Hpzr1tKIQUlIRN/Z6tfOJsdUfahGi9WxcdrnujzTzOkgcTDI/om21Ry6VED
         NAJdUDf8v9saAK6pJ3pdonP8gQ2v0YZPng6JH7kyRARaOKqTUol6+WUPvFGPWW/tLPts
         EblQ==
X-Gm-Message-State: AOAM532LHQFL3xCpPBv3mYTdRrtH6GwNxwTmaEoUp6c9mAg7usyLgAnx
	sb9MJv1SXI/VXshOszFcMZQdfdeTwrAhhg==
X-Google-Smtp-Source: 
 ABdhPJw9MjuQGbPkRGbugnaNLAgmZ7/cjTihaRzksYptPAhTT1in/N92Ow2Kjo9tQImJ3kRDZjILDA==
X-Received: by 2002:a17:90a:8588:b0:1bc:54b8:c3 with SMTP id
 m8-20020a17090a858800b001bc54b800c3mr826533pjn.110.1645478687986;
        Mon, 21 Feb 2022 13:24:47 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d01c:96b7:6393:8c56])
        by smtp.gmail.com with ESMTPSA id
 n85sm14081529pfd.142.2022.02.21.13.24.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 13:24:47 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 28/32] numpy: set PIP_INSTALL_PACKAGE
Date: Mon, 21 Feb 2022 13:23:43 -0800
Message-Id: 
 <4f492d31bba45c995d16e066e8f360bb15ed96e7.1645478020.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645478020.git.tim.orling@konsulko.com>
References: <cover.1645478020.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 21:24:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162104

The recipe does not inherit pypi so we need to manually set
PIP_INSTALL_PACKAGE appropriately.

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/python/python3-numpy_1.22.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-numpy_1.22.2.bb b/meta/recipes-devtools/python/python3-numpy_1.22.2.bb
index 52fbca94e2c..d2b2f3e38d5 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.22.2.bb
+++ b/meta/recipes-devtools/python/python3-numpy_1.22.2.bb
@@ -20,6 +20,7 @@ UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
 DEPENDS += "python3-cython-native"
 
 inherit ptest setuptools3
+PIP_INSTALL_PACKAGE = "numpy"
 
 S = "${WORKDIR}/numpy-${PV}"
 
-- 
2.30.2


