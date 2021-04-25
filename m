Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.3821.1619369923605325528
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 09:58:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KrjB1IGb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id y5-20020a05600c3645b0290132b13aaa3bso3794367wmq.1
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Apr 2021 09:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N+ohdkA5rI9bTU6uUCzA+3/2odkn48QT9zXtyMrPZCs=;
        b=KrjB1IGbndt5MBd2UMVF2DLn+qXO9uZZ5lLYojNukZUHS8w4jUaimp34jc5WNENaYP
         7hAUvGq8+MXy4I5Tha2wep/85YFgNvd4+MX2G+9dlRRdUblbn2rf9isdqDq35YGBDOWY
         FtYZ025jj5PMTGnLxKpfOshrxCdBnErEblgkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N+ohdkA5rI9bTU6uUCzA+3/2odkn48QT9zXtyMrPZCs=;
        b=RfNRCJetbgZFwFBNEI3EzCbRaxH1l0oj5DVXaZo5bqMHf4+tZT78cyoiEjdDGzDdp1
         1huBahUpivOWWrgJsrpabC0Mr5SFlz6KpYqeNI4K4Ybetg52bPHvedtvr7EKHerTR0cW
         zjIR9hhMb75tITRNmotsQwF24PL4XuROwgG9TPWh4db4J2xJdDxkmLqQWe3tO7cnBg9r
         jZFNNSUWOvCgD22/Gt6kF433P5KQKd0iUCe5xQwiVP9zNiaLi1AxQB1ZIKdfRRXhQPBh
         A1R6GkvkuubJgy89S4ZV8yw2OuVAtXFcFTM8egekmAUebh10jVQ1IfqCAAYchTMnWOyO
         CKcg==
X-Gm-Message-State: AOAM532bW9ctK5EIBxBFcK4sDj1IWVo23a9zQG2CqtMa03IAcAKzkRZh
	rdEFeE9Tu8SJfeXVSBqeaiOg0WpdLbwDiA==
X-Google-Smtp-Source: ABdhPJwuwsCQ3nSTn5bM5WHtCMtBclFOtsxvU48GA/S+S0vEBNN9WGIGuGz4n+oN9KpS+TNXOMvKMg==
X-Received: by 2002:a05:600c:17c3:: with SMTP id y3mr16908450wmo.185.1619369921952;
        Sun, 25 Apr 2021 09:58:41 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:ef93:a2fd:16ef:8c9f])
        by smtp.gmail.com with ESMTPSA id a142sm17274410wmd.7.2021.04.25.09.58.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Apr 2021 09:58:41 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] libseccomp: Fix reproducibility issue
Date: Sun, 25 Apr 2021 17:58:39 +0100
Message-Id: <20210425165840.1671595-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rather than installing libtool wrapper scripts which won't work on target
and aren't reproducible, use the real binaries.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/libseccomp/libseccomp_2.5.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb b/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb
index 98b2639742b..8fe1023901c 100644
--- a/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb
+++ b/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb
@@ -42,6 +42,10 @@ do_install_ptest() {
     for file in $(find tools/* -executable -type f); do
         install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tools
     done
+    # Overwrite libtool wrappers with real executables
+    for file in $(find tools/.libs/* -executable -type f); do
+        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tools
+    done
 }
 
 FILES_${PN} = "${bindir} ${libdir}/${BPN}.so*"
-- 
2.30.2

