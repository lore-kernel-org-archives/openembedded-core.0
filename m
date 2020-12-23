Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.333.1608750324659595512
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 11:05:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pHW23HOZ;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id 11so10881319pfu.4
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Dec 2020 11:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iuV4R5anA+US6sEgOcZwiOckG5ZTkZGqLHNZZbTKax8=;
        b=pHW23HOZOsQM6JbjSntvSfpovGcUmEvNfISybb+JlNwF3bJma46VbwgrpIHn9h6pFp
         sMjmsiPFaoSxaiCCwpWZU1RFn793IcvYYIHG6T395jK2nAhpwaAPi4bwWiQbfhrHgJSW
         Sb5lExDCJjdZiPxEAHVdRDEWp+dWFc/Tf4vfP7eMtI/ljfA/AgyO9LdEVf1Fpjs4x+Ap
         bTg4ywQwNJNMtg90BX0NL7jSmJGPC979QYLxyU4G2nXFgLR47BpyDc5LyJWmbe7zYmhl
         puSmmoV2ezv8QmkmA/u4DTqYqpmqz9sbFIzQfWh6FGZAv/ouEI62oWhbiDo7sS8miZ1u
         PSJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iuV4R5anA+US6sEgOcZwiOckG5ZTkZGqLHNZZbTKax8=;
        b=d4A0tJ9BNGresCGWizZGeI7Yd/ivB5MQx3+Y9T+itiyxjf89TEZdU3RUkehmv0KAbB
         5ZqYk9dZtmRdrfb/kt79Awqj8sC9O76PadqKkHXdM/xUHSre0tNO821JG2ng61IU4SzO
         e+5c9qqc9hhu2xvpn7WtzI/q4QSOc/UCqUjCfc44L6JTuco3ME/YYBKZiNhEZiTJY5Id
         NlTVtbFvupBPct8qdDWkmQtVjvRt+4kn9oZ04JOwoTxk4/OE7fvXsW3EBBlwKZCTMBFj
         dHyea+kBJdbhYLu1AFyMfozcyOBXVaugWE38eHkbOb7Uber1LgAQ4jjnex0qqJRPUYWe
         cFpQ==
X-Gm-Message-State: AOAM532iFRNbv0v5Di/ARsD8LRd1sakEm5qhf+BJdmOM0tq0Bl9oXyFO
	OuHqcaLdwzyqMTNYw3vnmRgEuxlvEA/mPQ==
X-Google-Smtp-Source: ABdhPJxWuHkhN4MJ6Oim96croBk8kh5MzOEq4Mtux07XTh657EIuNvUXypLOJp5J0r9nCaSu1Fp5Jw==
X-Received: by 2002:a62:3002:0:b029:1aa:d858:cdd7 with SMTP id w2-20020a6230020000b02901aad858cdd7mr25561067pfw.1.1608750323933;
        Wed, 23 Dec 2020 11:05:23 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a8e7])
        by smtp.gmail.com with ESMTPSA id ga12sm362064pjb.48.2020.12.23.11.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Dec 2020 11:05:23 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] openssl: Enable psk for qtbase
Date: Wed, 23 Dec 2020 11:05:21 -0800
Message-Id: <20201223190521.2686842-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TLS 1.3 implementation in qt5 uses psk so retain it for now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.1i.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
index 74ca11387a..52e96b7831 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
@@ -63,7 +63,8 @@ CFLAGS_append_class-nativesdk = " -DOPENSSLDIR=/not/builtin -DENGINESDIR=/not/bu
 # bf (wvstreams postgresql x11vnc crda znc cfengine)
 # rc4 (freerdp librtorrent ettercap xrdp transmission pam-ssh-agent-auth php)
 # rc2 (mailx)
-DEPRECATED_CRYPTO_FLAGS = "no-ssl no-idea no-psk no-rc5 no-md2 no-srp no-camellia no-mdc2 no-scrypt no-seed no-siphash no-sm2 no-sm3 no-sm4 no-whirlpool"
+# psk (qt5)
+DEPRECATED_CRYPTO_FLAGS = "no-ssl no-idea no-rc5 no-md2 no-srp no-camellia no-mdc2 no-scrypt no-seed no-siphash no-sm2 no-sm3 no-sm4 no-whirlpool"
 
 do_configure () {
 	os=${HOST_OS}
-- 
2.29.2

