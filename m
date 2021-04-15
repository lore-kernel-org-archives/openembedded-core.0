Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web12.6761.1618492425582878456
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 06:13:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=B8lJmRov;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id 12so23290300wrz.7
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 06:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kZGEOULxN3L4IgpvKYdhxvltJSN0x4GBf4MV2liO1Ak=;
        b=B8lJmRovb+QjQTchbmP3O+1zwh96b9HuOaeXX+iTNLn+Be2bX1b/OKDe0eKA+kMv8+
         LCMH/CSJyN08lQQNlEZ0N3NlYmeKV6SFTCB4p7I/ovcrbYnaHaOqAMsgc1fPDELkFVrj
         RfvFQ1KlXuTUVrzNNs2w12g7dDI8gqEvDyB6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kZGEOULxN3L4IgpvKYdhxvltJSN0x4GBf4MV2liO1Ak=;
        b=XFXdI2fFzE51TmbiIUO+KW2bjWAah8qqcfuLt8FFzDKgMLJirNwsAtiAVz2urL6TX+
         bMCzvGfkdE+Xm1jfONXdzWylviEBHLOQv1T9D5oeVVPDyFqJQWfE8DT2qpsYmwJsiiRO
         ARRZ3Hq3lH+Q6CSj0uXmnTR1quYMQn9rJXil08ndkX9QASTZ8grv5+OkVn88IdxD5a6B
         9tNB4pMNdWe8L+ErBScgYvjp139+UUNSL9EVo3zaCO9yHd6HjFxJeTXgOoC9qWJ2Zc1K
         0j/BgY0KK/28c4qQ5EBRTCY+fbNy+gbNg3+BxZNkNToBTR5gJiQPeTI8c6yE5rRPZF7+
         H3PQ==
X-Gm-Message-State: AOAM533NrW1eV5PsRZnSLA+o+mufNJT9v6c6zphuEkgMPjwALmvWPadv
	P1YQ4NaCda0pP005xeMrdql1MaQI1WYvpg==
X-Google-Smtp-Source: ABdhPJxWtD49Q+E+267Zjr30jhbWW/dvG06h98JEt/WXTql4shAK2WIa8/md3b3X/fKesiwgC9EuHg==
X-Received: by 2002:a5d:6d0f:: with SMTP id e15mr3554429wrq.218.1618492423893;
        Thu, 15 Apr 2021 06:13:43 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:b769:fd13:2e7b:1bdf])
        by smtp.gmail.com with ESMTPSA id z14sm1751724wrs.96.2021.04.15.06.13.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 06:13:43 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/selftest: Ensure packages classes are set correctly for maintainers test
Date: Thu, 15 Apr 2021 14:13:43 +0100
Message-Id: <20210415131343.1315874-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The dnf packages aren't parsed if rpm isn't in PACKAGE_CLASSES which means
the aintainers test failes for OE-Core (where ipk is the default) but not
for poky (where the default is rpm).

Ensure PACKAGE_CLASSES is set so it works in all cases.

[YOCTO #14277]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/distrodata.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/distrodata.py b/meta/lib/oeqa/selftest/cases/distrodata.py
index fbc0c2a98da..0ad6e1ef91a 100644
--- a/meta/lib/oeqa/selftest/cases/distrodata.py
+++ b/meta/lib/oeqa/selftest/cases/distrodata.py
@@ -99,7 +99,7 @@ The following recipes do not have a DESCRIPTION. Please add an entry for DESCRIP
                      return True
             return False
 
-        feature = 'require conf/distro/include/maintainers.inc\nLICENSE_FLAGS_WHITELIST += " commercial"\nPARSE_ALL_RECIPES = "1"\n'
+        feature = 'require conf/distro/include/maintainers.inc\nLICENSE_FLAGS_WHITELIST += " commercial"\nPARSE_ALL_RECIPES = "1"\nPACKAGE_CLASSES = "package_ipk package_deb package_rpm"\n'
         self.write_config(feature)
 
         with bb.tinfoil.Tinfoil() as tinfoil:
-- 
2.30.2

