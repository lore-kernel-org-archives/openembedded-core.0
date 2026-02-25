Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14FD3F4BB72
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 07:49:50 +0000 (UTC)
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40954.1772005789131936548
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 23:49:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e23fRwmj;
 spf=pass (domain: gmail.com, ip: 209.85.219.65, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f65.google.com with SMTP id 6a1803df08f44-897023602b1so74294076d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 23:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772005787; x=1772610587; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kGnFgepwonXHcovmxZ5ZV2ZxktWvuT8ViAUuKO2yQgo=;
        b=e23fRwmjESUb1fww77wefCU2GSVf8pg3/n6bGeB3BnjlG+8QLz1KvpnqKV37BNEjv4
         ts1+12Py3yFrpOJ8ekZsYRCm4lNyCoH/6pyN/Ab0MK+/RWroDovHTyPiud2/BkSQSO0d
         H5sDsneeq+Jzv96m8MHetFyKcxSRrgztr4H5ZqWYP/N9K01tYENRH+ZlMQ6wu+34ipwt
         MSil4RXD21zmOpRCRIO0Bijj1u3AZj2Q7bWTbluwlWVgejSiSbbAbiHy3HnLUAOBWXwr
         oSoHskiLLAmN091nKhyeQrb8mgBfmrLmLsGIqD9bcHrXch+N+HzOKOdNruLnw4YuCh7Q
         PXBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772005787; x=1772610587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kGnFgepwonXHcovmxZ5ZV2ZxktWvuT8ViAUuKO2yQgo=;
        b=J1kstyYptWnAdUJaBpP6fqD1tYq7OXZZUaNnamT6Vskq6yoE0IQIEauIcmeEN5FZ1Y
         +GyPNTSp0NB+lOgD2iLJlEKDRAcUKfH6cZEFO1qQ7EspXJP/bfzGicsFNN9SMj3+chlw
         b16j6d8HcM1raZKvLfEy41nW9IMXNXi0GffcJ1NRjTouheqiwPvhT1PWQ2KfMwvSxMFh
         +LgO3azN+l6R5MyEAzez0phqulA94TA/FdRX451GkE/uWWkzrfq9OuK5vjM6WG+hrKkD
         P34nHskrx2MWsuQL/PAsvX0HEvRf89xmrVDj20KpgPx6hsA8CmJUf4JeiXb5Pc2/ldqI
         fuSg==
X-Gm-Message-State: AOJu0YzwEW1WZIW/KZOCsC3/xoyL5r3zjA5KKXa1gb8x92QJYviSy08i
	HHv21YgriE1mpq3CvUorin0vVqa5q0bbypgwShZ01++U5ucdYYMGdvTZZ91ExrH1nqo=
X-Gm-Gg: ATEYQzxlhvvsbQp4N3oCPKsExYx3XXZ8huMpr7i+KgNWjFFLnppyI9rp193/Wd46/yK
	9rPrGipMmqkJavlnjYMDOcMFb0Zu+zqRabSVBNrcXOHsT8D9qb5K5h5yzJ22XQ0quQHPDtm0nh5
	mHw/Pu3MiS8FyQl3dc0IEOMCtLCl4tCfNq8JAmRuO6NT9q9F1I6kQnvCkHLCcnzTpQvJtZqDT1Y
	hWtKW9llsE+wjLUEAEgeMMlwPJwJ1MaI+IHJlIBYeqE8Q9cfd4nD6Wo14DAhhGMf2UmA9TT/WLG
	HLINBY0kWkNLtCtuIMHp79aWmGnJWe3OQygTaXSSWgBF8qabvoHtqv8RSmwI7cjhHFNKNTxR/DQ
	nHolK9q4FuQRSDts8Sx11iRhPmG/PGBoEGTdtoQT47xvNRbip/APXeIJk1htq7hn+3Axnx3Ectp
	JR0iwZ8L9VYKx8rKGNffKMGa4fmqPUzh3nCOJyxwKv98VY4lFKUD7El+KZ1W+YVx540A==
X-Received: by 2002:ad4:4eed:0:b0:882:3f38:4fbc with SMTP id 6a1803df08f44-89979d9e648mr222096666d6.61.1772005787225;
        Tue, 24 Feb 2026 23:49:47 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb8d0614fbsm1390089785a.17.2026.02.24.23.49.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 23:49:46 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v6 6/9] oe-selftest/cases/wic.py: oe-selftest -r wic.CLITests -> PASS
Date: Wed, 25 Feb 2026 02:49:28 -0500
Message-ID: <20260225074931.1661345-7-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260225074931.1661345-1-twoerner@gmail.com>
References: <20260225074931.1661345-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 07:49:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231935

Changes for the wic.CLITests oe-selftests to pass now that wic is a
stand-alone app and no longer part of oe-core.

Note that the base class for these tests had to change to WicTestCase so
that the wic-native tool would be built and available.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v6:
- none

changes in v5:
- rebase with master
- split back out into smaller patches
- now that the sector-size re-implementation is ahead of this patch,
  various wic sub commands (ls, rm, cp) no longer need a --vars file

v4: skipped to align/combine with other patch set

changes in v3:
- squashed into 1 large patch

changes in v2:
- none
---
 meta/lib/oeqa/selftest/cases/wic.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index e9c28baf51eb..22163ccdb3e2 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -99,7 +99,7 @@ class WicTestCase(OESelftestTestCase):
             WicTestCase.wicenv_cache[image] = os.path.join(stdir, machine, 'imgdata')
         return WicTestCase.wicenv_cache[image]
 
-class CLITests(OESelftestTestCase):
+class CLITests(WicTestCase):
     def test_version(self):
         """Test wic --version"""
         runCmd('wic --version')
@@ -139,18 +139,18 @@ class CLITests(OESelftestTestCase):
 
     def test_list_images(self):
         """Test wic list images"""
-        runCmd('wic list images')
+        runCmd('wic list images -v %s' % self.envfile)
 
     def test_list_source_plugins(self):
         """Test wic list source-plugins"""
-        runCmd('wic list source-plugins')
+        runCmd('wic list source-plugins -v %s' % self.envfile)
 
     def test_listed_images_help(self):
         """Test wic listed images help"""
-        output = runCmd('wic list images').output
+        output = runCmd('wic list images -v %s' % self.envfile).output
         imagelist = [line.split()[0] for line in output.splitlines()]
         for image in imagelist:
-            runCmd('wic list %s help' % image)
+            runCmd('wic list -v %s %s help' % (self.envfile, image))
 
     def test_unsupported_subcommand(self):
         """Test unsupported subcommand"""
-- 
2.51.0


