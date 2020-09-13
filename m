Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.34540.1599983045447534937
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Sep 2020 00:44:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ffwKXx5b;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id l126so10098813pfd.5
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2020 00:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o8ZDSCZ0AGf85FQo7htQEbyo3232mTCYISYadTCu524=;
        b=ffwKXx5bIknbarOAZraMIYCdVJLR5Q549SD79zliT49d5QnpwqDxQXYAgAiFDNAoFO
         tW3cG1+xt9FMldhDovDhGSosUoPecLRtUmWPGqXCjYAWWD/oqLWZwErE8hOKdXD5uZrE
         POo0Faaxjwt8kNoipko6Tscw3ZElSQ9edbVRd2Hv463OJSPJiOQV+Sj1+wJA0SiE9Unx
         1mIpAbrFf4N+CeP3aYzIrQchBmfPOTYq0dgPlsJG8uMcd2UHJaayYpUOSW/zWuPGhmwn
         68Ai/c+3Tve7S5rqdafNdjCgXDnembz29f+kie8ko8w6WMCV30f/OmRFF0el6pMSZHL1
         wx6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o8ZDSCZ0AGf85FQo7htQEbyo3232mTCYISYadTCu524=;
        b=KoXDbiDOHAnicDDzuribTYLwcwOtZlA/LYCwiVBZfsf65xpR87Wx26UhrWj1aMHRwh
         kUlDqaUBgo+YnSwm/675ksy75z/oeiRHyjWbPTo6IkDfpNQoVhY2HoAHo8AAdPNXb3Wj
         BY5/RpOQGkWQFKjRgU5tjgEpbKpNwkuO64xnvIoP+KM7YaKghy4Dul9tJLVOM5qlSR0J
         guw21h6NGGxh3QFqUMjmATUj8nvR/ZCvgd1IzOItp7nQ0MvlEBhdHutVJTLbLNK4kNZS
         OPcz52xGtoEh7TC2X+M7GR5E6Lw2H1TmFFYr29njPcEXsf+RWTFvanBrXyCr7BU6a25I
         zHpQ==
X-Gm-Message-State: AOAM533PJgcwqVNFx1QlDjegmTrg2HF51+70YSsyTlLuQvtJQwniISfL
	zmZC40vEZylSMY2aPphi8xoWgsHB5oUBtw==
X-Google-Smtp-Source: ABdhPJzcjg0UXGJA0QiUOKq9kXFsT3Qa6Dru39AL6n6g48py6MO50XUzwVGiuUfP8hgqqOTzWulIyg==
X-Received: by 2002:a63:3046:: with SMTP id w67mr7024551pgw.45.1599983044381;
        Sun, 13 Sep 2020 00:44:04 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1759])
        by smtp.gmail.com with ESMTPSA id a13sm2726671pfl.184.2020.09.13.00.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2020 00:44:03 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] populate_sdk_ext: Do not assume local.conf will always exist
Date: Sun, 13 Sep 2020 00:44:00 -0700
Message-Id: <20200913074400.1691397-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some distros may not have local.conf, and use auto.conf or site.conf
alone to describe distro config metadata, therefore make code robust
to not fail eSDK builds for such setups

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/populate_sdk_ext.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 44d99cfb97..d659b6940a 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -310,8 +310,9 @@ python copy_buildsystem () {
         if os.path.exists(builddir + '/conf/auto.conf'):
             with open(builddir + '/conf/auto.conf', 'r') as f:
                 oldlines += f.readlines()
-        with open(builddir + '/conf/local.conf', 'r') as f:
-            oldlines += f.readlines()
+        if os.path.exists(builddir + '/conf/local.conf'):
+            with open(builddir + '/conf/local.conf', 'r') as f:
+                oldlines += f.readlines()
         (updated, newlines) = bb.utils.edit_metadata(oldlines, varlist, handle_var)
 
         with open(baseoutpath + '/conf/local.conf', 'w') as f:
-- 
2.28.0

