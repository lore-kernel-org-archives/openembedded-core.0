Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web08.7233.1619756292355663549
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Apr 2021 21:18:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LVgnCf4q;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id gc22-20020a17090b3116b02901558435aec1so1081601pjb.4
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Apr 2021 21:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MT7HyK8WiSOjzOgTdmOY8Geklwm+9MZeUB5fQTbeZSo=;
        b=LVgnCf4qgzfoFuUjXCJ2kw3y1VhdsPR3mq/OqRQfiXpimZ1ftEWkXxOgwmSsz0wXdU
         9D19RYFVh+yc8rdsRNfpPuRP9COj5tMahYqDF1xsHPOpTdPcls5wkzoghoJztkLZcCrf
         bAM3VQf+/ippVAkCnUY4wLZ9r48duIe1KLYLouesm2pAcP2tlFNzhujWxALVWjfnMMG0
         /Qc88037DTednOyGS/mZppgKRH7ahXdTaBzq2yCa5OvXYSq0KmHInw1GHWBbSizy/d7m
         k48q3P2HWS70d5NuGhQNwTM0dAFp1ZqNsGKU35QLskXHCMDJySc+z4KEmY+RvtpXnVHh
         Yhjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MT7HyK8WiSOjzOgTdmOY8Geklwm+9MZeUB5fQTbeZSo=;
        b=YIw6ldyflQEPWNarSJImQc5aFIRj6C2YqP0ak2oq5G0WoynBBsYyHCPUaKTZirhBvg
         GL4X2stxUgozfWrmt3L8oBJilXlASaoJoWoAnNqdd/2xFoGJwkfL6ewmd2LRS4gnCbF4
         3f4ykmkyxr6TL5kABA/WseBU+i0UFjxqADc+1L/xWUR0+YHOzB3FrxDRHldnnsTpu+Ya
         Qx98GhcRu0nJx/J8fhPsE3L1F/XCgWmQAr/wUIh81InJy0uInadnWUZTszfqcXL6YMCT
         0MqhHYH5EqwziXHqRG2ZXh5lda7yYu95rlBwuFpGNSaTpYeum4DVRnV9TQiBH1qeLbAh
         Q+wQ==
X-Gm-Message-State: AOAM530R7dnMSnyrIRiI3Z71gv0Tepqe0FxlYbaSDRiGUgIPabAKN4tt
	GGk8Xfg0pi2nMutbxjcBrlQ2+a0sJc0nFg==
X-Google-Smtp-Source: ABdhPJxaXDqbpa8jqHkv786XTD66Sk6d3QersXR0Y9L228sI8SnRREnQWEhR8lbc933bIMEjVEIC3Q==
X-Received: by 2002:a17:902:788b:b029:ec:c151:b5e with SMTP id q11-20020a170902788bb02900ecc1510b5emr3361031pll.75.1619756291525;
        Thu, 29 Apr 2021 21:18:11 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ef3])
        by smtp.gmail.com with ESMTPSA id g18sm591891pfb.178.2021.04.29.21.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 21:18:11 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] libpam: Provide needed env for tst-pam_start_confdir ptest
Date: Thu, 29 Apr 2021 21:18:08 -0700
Message-Id: <20210430041808.2520362-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210430041808.2520362-1-raj.khem@gmail.com>
References: <20210430041808.2520362-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tst-pam_start_confdir needs a file called confdir and it should reside
in directory pointed by srcdir env variable, therefore copy confdir into
ptest package and export srcdir before running the ptests

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/pam/libpam/run-ptest | 5 +++--
 meta/recipes-extended/pam/libpam_1.5.1.bb  | 1 +
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/pam/libpam/run-ptest b/meta/recipes-extended/pam/libpam/run-ptest
index 69e729ce2a..9c304aee47 100644
--- a/meta/recipes-extended/pam/libpam/run-ptest
+++ b/meta/recipes-extended/pam/libpam/run-ptest
@@ -2,9 +2,10 @@
 
 cd tests
 
+export srcdir=.
+
 failed=0
 all=0
-
 for f in tst-*; do
     "./$f" > /dev/null 2>&1
     case "$?" in
@@ -28,4 +29,4 @@ if [ "$failed" -eq 0 ] ; then
 else
   echo "$failed of $all tests failed"
 fi
-
+unset srcdir
diff --git a/meta/recipes-extended/pam/libpam_1.5.1.bb b/meta/recipes-extended/pam/libpam_1.5.1.bb
index 4363e16b9b..f0c8caaac2 100644
--- a/meta/recipes-extended/pam/libpam_1.5.1.bb
+++ b/meta/recipes-extended/pam/libpam_1.5.1.bb
@@ -154,6 +154,7 @@ do_install_ptest() {
     if [ ${PTEST_ENABLED} = "1" ]; then
         mkdir -p ${D}${PTEST_PATH}/tests
         install -m 0755 ${B}/tests/.libs/* ${D}${PTEST_PATH}/tests
+        install -m 0644 ${S}/tests/confdir ${D}${PTEST_PATH}/tests
     fi
 }
 
-- 
2.31.1

