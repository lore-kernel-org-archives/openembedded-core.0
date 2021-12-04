Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85E60C433F5
	for <webhook@archiver.kernel.org>; Sat,  4 Dec 2021 18:18:12 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web09.27920.1638641891594122576
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Dec 2021 10:18:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=frJTFmYa;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.179,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f179.google.com with SMTP id de30so7131088qkb.0
        for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Dec 2021 10:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m99UcRaXvtEks9XhuKR0cTLx9svMF8Ayq4TesbR1u+U=;
        b=frJTFmYaq1FuMwl6eXFrbDn4rxDELAQccwHXc9ItnvtMNLAHD2OYJJM93kRkUyZZmy
         LmHCenziZLZFYFoBjUpZy4l0Q7O8yOCbI69rW0zRTISSPFq24JoyFrg4D71zEcjeuBwG
         qB1YPvkEm54C6E4FOZsXoEoTFVMQmru/duTDoejENIAT3ZNvwloegAejEhQR1g1z2OlX
         Rdt3V/NpLrra7vMD6yFamMeuyBeOV/PTJumBPuW5oyd9cJl5WFBl4QbM9T+npuY2/iwl
         4qtXeUxLRRj/D4F7PlgPg0WGUEK77ID3bZAHTgARjsLFNFlBSUGTZ7Md8lL/yeBz6zC4
         O/Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m99UcRaXvtEks9XhuKR0cTLx9svMF8Ayq4TesbR1u+U=;
        b=adBsQqdJowGgPdHQuRKhibkcXzwEd//2D6eTlJnLjojd0bF3mICKx+pMHUbw3zMW1T
         HZhFggKL2v32va33GTVu+9GI+kUJNC48waAUlmGWBt+1ooRT7rozjQ096iK3F4n7ymCx
         NwxNc8BNhlB+lIZjNf1DZkk4p6lmIVDyYYfb/vh/oYVyzjFSsRN3PKWEBSxu22293Ct5
         GfBXD1raDq3OjnXVMBpgtWfg/Di9W+iMAM93Y2FvGRnhuNj+DOBtWM76fbyb/C+hqbWB
         xVST3mY+tJBybcaLnhn8pip7AXOQsCafK195wDpPvTf6t7gxucNpkfLg8QNK5M776nBD
         GQQw==
X-Gm-Message-State: AOAM5321nkm7LvAYQGSNNsMBgVaDHYfKCv/q93Dme3xaRWPM2MtpGdRy
	B9GzkgeQ47A7xRfY2RdbHR8RPfUd8DwHtg==
X-Google-Smtp-Source: 
 ABdhPJzKsPWd34Efk+otOUs/A8vhZk6Qo+RQEbpv5l9jOINuFvaQI8HcfnKE3Tc0bGFYBtU3fljIhQ==
X-Received: by 2002:a05:620a:1a19:: with SMTP id
 bk25mr23740315qkb.479.1638641890554;
        Sat, 04 Dec 2021 10:18:10 -0800 (PST)
Received: from localhost ([2605:a601:a605:bc00:885a:4800:3028:e39f])
        by smtp.gmail.com with ESMTPSA id
 b5sm4012204qka.51.2021.12.04.10.18.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Dec 2021 10:18:10 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] yocto-check-layer: disregard checks if referencing another
 README file
Date: Sat,  4 Dec 2021 13:18:09 -0500
Message-Id: <20211204181809.17100-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Dec 2021 18:18:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159179

It is permissible to have a layer's README reference another README.  If
this is the case, avoid other checks.  Do this by checking for the word
README (case insensitive) in the README file.  This might be too
permissive, but follows the pattern of looking for exact words (like
"patch" or "maintainer") in READMEs.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 scripts/lib/checklayer/cases/common.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/checklayer/cases/common.py b/scripts/lib/checklayer/cases/common.py
index 52c786f77b58..fdfb5d18cdc6 100644
--- a/scripts/lib/checklayer/cases/common.py
+++ b/scripts/lib/checklayer/cases/common.py
@@ -26,7 +26,12 @@ class CommonCheckLayer(OECheckLayerTestCase):
             data = f.read()
         self.assertTrue(data,
                 msg="Layer contains a README file but it is empty.")
-        self.assertIn('maintainer',data)
+
+        # If a layer's README references another README, then the checks below are not valid
+        if re.search('README', data, re.IGNORECASE):
+            return
+
+        self.assertIn('maintainer', data)
         self.assertIn('patch',data)
         # Check that there is an email address in the README
         email_regex = re.compile(r"[^@]+@[^@]+")
-- 
2.20.1


