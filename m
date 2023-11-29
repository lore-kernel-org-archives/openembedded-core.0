Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3F85C4167B
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 14:32:53 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web11.34310.1701268364116056528
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Nov 2023 06:32:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=hF173IWf;
 spf=pass (domain: baylibre.com, ip: 209.85.160.172, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-41ea8debcdaso34848611cf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 06:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701268363; x=1701873163; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=BBHpsIg3mOZMx0A7KZeit5tgYQG3OrqgvOpAguNbsxo=;
        b=hF173IWfzizLprjS/5w1aTMyJcCLnnaU1DS2dEnTcZ2ij9N9hmU56jED1Q0Vqx2Vc9
         rJkH2NCf+SN6OcaJtEm98Cy90mEwZvgrg774hnrAp0qjTFyfeCjhkuCx+xGcM/9GXoa+
         4KteCt53/3TlHaw5T0DBC2sAcXZadXaHG7dc0FGcM4uuxVdUjtN35nOK9/bAkrNyEo8K
         KjEY+ZS4v/fehdA5qk5T+zwMdkYHUIL0BHbTveNubXSkuiQxrHSS8v+ZuFqRfIJdZIFo
         hN4bkjkEe/Tgbj3RD12HNBRJuBnO8shDJpLqPX8K9UND7dj3IvgHTZIL6ZMV04ki+M2i
         q70w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701268363; x=1701873163;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BBHpsIg3mOZMx0A7KZeit5tgYQG3OrqgvOpAguNbsxo=;
        b=XnLFzu0wsHRpHDWKQM20US9Q8aT8N+hI+brNGAdUo+y6bVGrptaXI7K2Zw6LcGoNSn
         q9I3z/ZjxryvdHv+EGo7HS1MoDEEDxG9Sq6rKSZZmPOm7wJx4ocTVZAhOrw1asC5k4VI
         xHE6TRzcio8f2nWeNC2jPbPmC2KHjn73JGZIAeqiIuAOXYNQaVLZ8qMF04TXNSFg1fTA
         myoc/joebnrK+0UZSy4m5+FQ2GT6tdYjL20Ftd4riRo+ruu3OzQdTOmXWIO/gErFjqO1
         t3q/Hz2qd2Db1ak2qhPdRbi5LgWAfRhtsCnfcJ06Fsb0OEqW6wi8qJRKnt0V/FRp951F
         TZVw==
X-Gm-Message-State: AOJu0YwK10RLdT38MjRdWFMCHn6uOAy0KBB2DSN01ya9zRi/Ck8v349I
	/jK96TFQiA8SKXkQ9SQbZGR0qTbNqMcrFmx9pmQ=
X-Google-Smtp-Source: AGHT+IHTUFPoRGpcR7W5tq8BlcW1SfxG5vYFLjBLjD8Ab36LK+N39t7AyUs2y91xnvJcVY+o1jhHvQ==
X-Received: by 2002:ac8:7c4e:0:b0:423:6e3e:72ab with SMTP id o14-20020ac87c4e000000b004236e3e72abmr22048388qtv.55.1701268362527;
        Wed, 29 Nov 2023 06:32:42 -0800 (PST)
Received: from megalith.. (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id k7-20020ac80747000000b00423e8021da2sm731904qth.42.2023.11.29.06.32.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 06:32:42 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] patchtest: shorten patch signed-off-by test output
Date: Wed, 29 Nov 2023 09:32:41 -0500
Message-ID: <20231129143241.39382-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 14:32:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191453

The patch Signed-off-by test's output line is excessively long, and can
trigger a failsafe in the patchtest automated service's email content
generation. Shorten the output by reducing redundant phrasing and using
os.path.basename to get only the failing patch's name, not the entire
path, as the submitter should have a good idea of where it is located
regardless.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/patchtest/tests/test_patch.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/patchtest/tests/test_patch.py b/meta/lib/patchtest/tests/test_patch.py
index 65d0f930b05..d7187a0cb1b 100644
--- a/meta/lib/patchtest/tests/test_patch.py
+++ b/meta/lib/patchtest/tests/test_patch.py
@@ -6,6 +6,7 @@
 #
 
 import base
+import os
 import parse_signed_off_by
 import parse_upstream_status
 import pyparsing
@@ -87,7 +88,7 @@ class TestPatch(base.Base):
                 if TestPatch.prog.search_string(payload):
                     break
             else:
-                self.fail('A patch file has been added without a Signed-off-by tag. Sign off the added patch file (%s)' % newpatch.path)
+                self.fail('A patch file has been added without a Signed-off-by tag: \'%s\'' % os.path.basename(newpatch.path))
 
     def test_cve_tag_format(self):
         for commit in TestPatch.commits:
-- 
2.43.0


