Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.web09.8393.1608021529277260469
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Dec 2020 00:38:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nathanrossi.com header.s=google header.b=joFeRNE5;
 spf=pass (domain: nathanrossi.com, ip: 209.85.214.196, mailfrom: nathan@nathanrossi.com)
Received: by mail-pl1-f196.google.com with SMTP id bj5so10628661plb.4
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Dec 2020 00:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nathanrossi.com; s=google;
        h=date:message-id:from:to:cc:subject:content-transfer-encoding
         :mime-version;
        bh=v91/ikjqyfq9gkz+jNAbJO32rpqQndIwsEoWXnMuXxE=;
        b=joFeRNE52J4GveQkITENfATTc0vfQ3EPcoLZzJhVw39Ns4JwuRBxvgM0m+Dm9Zwv9L
         oRFOznSuGpMql+nCUrnxKx23yPW4+05WrMLncffuNrK/MLuMScjxqugs8KaC28VN5StB
         ePw4NhIjGUGfmHEdunSZodty4M+vcwItCZVup09pta323eLWjLx/oa5AKufF1wNODOFF
         7GknBnkLZjoSIwFCSZRtbLYvQZdueXN5CDdOZDBiyCv2YoaBLDL6bOpa8aBTN9Czjezg
         Wk9CTLtALbJ8j/7MQdqGYkKmrP0VlVbWImBs8J9vxs1mGFNNGjwtuuIORw10FdL/wTuh
         weYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:from:to:cc:subject
         :content-transfer-encoding:mime-version;
        bh=v91/ikjqyfq9gkz+jNAbJO32rpqQndIwsEoWXnMuXxE=;
        b=oqibnggGADTphubDt5wSIe5jWlSFdhcNblBULZ8U9kpOZ2iA9YCYurU08eG0PLrk/u
         G9u8qui39xOD8ERKPplyTjlzYN0Ho8AZusrXP/RXNF2iFtlwTlyaKRuXM1pchr9mD7ct
         S7s5dJr5i9QwZlfX9SSaEs468fZ3XJesG0npRkLihRCXpAqmPEfZGKeBwISZq7rGcpa8
         ablZRUbGCm2vBt7haiOg3sj5wd8aE1RpO9pxxTpmSjC+OV33cUirht2j7BXexaPDqlH6
         E1kxACJt1txobRBd0dLuzzbBCU1iLSMB8Q01ZATFVj6Bw90jCV9y8BlrvJM292DIBenh
         RJsQ==
X-Gm-Message-State: AOAM533i62/EpT0++CKtvnGyMHs4vlpVuph9mNFihJzDR/R0Ef3HSBhR
	Xca8z2j07ua9btq3OgetF/04T8cO7kIzuIwX
X-Google-Smtp-Source: ABdhPJz5xf2ToEGlKVjzvwlMK1cRqljT5rqg23C8ua6r8NtO4PmyEQNtxW/hdrAcYAC6P7webZIKlg==
X-Received: by 2002:a17:90a:d70e:: with SMTP id y14mr28897289pju.9.1608021528572;
        Tue, 15 Dec 2020 00:38:48 -0800 (PST)
Return-Path: <nathan@nathanrossi.com>
Received: from [127.0.1.1] (117-20-70-209.751446.bne.nbn.aussiebb.net. [117.20.70.209])
        by smtp.gmail.com with UTF8SMTPSA id c10sm24737935pfj.54.2020.12.15.00.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 00:38:48 -0800 (PST)
Date: Tue, 15 Dec 2020 08:38:43 +0000
Message-Id: <20201215083843.1362271-1-nathan@nathanrossi.com>
From: "Nathan Rossi" <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
Cc: Nathan Rossi <nathan@nathanrossi.com>
Subject: [PATCH] coreutils: enable xattrs by default for nativesdk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

When using coreutils nativesdk (e.g. with buildtools-tarball) for
running oe-core builds, a number of recipes/classes/etc. expect xattr
support. This requirement is also expressed by the existing
PACKAGECONFIG_class-native default including xattrs.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-core/coreutils/coreutils_8.32.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/coreutils/coreutils_8.32.bb b/meta/recipes-core/coreutils/coreutils_8.32.bb
index 4eb357e310..320f93bdc2 100644
--- a/meta/recipes-core/coreutils/coreutils_8.32.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.32.bb
@@ -39,6 +39,9 @@ PACKAGECONFIG_class-target ??= "\
 # The lib/oe/path.py requires xattr
 PACKAGECONFIG_class-native ??= "xattr"
 
+# oe-core builds need xattr support
+PACKAGECONFIG_class-nativesdk ??= "xattr"
+
 # with, without, depends, rdepends
 #
 PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
---
2.29.2
