Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE19FCCD184
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 19:31:59 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.9223.1760038314022977276
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Oct 2025 12:31:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=lIM7yS2T;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-794f11334adso1184861b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 12:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760038313; x=1760643113; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qo2N2h5220Ky9Xn/B4HoHFGptFS76IfX9XRwYdGRESU=;
        b=lIM7yS2TXv7mLFWX5nTQ13iDoMdGLESfjeKtNvTU5A0klegARveAXvhQBQ318QQE2M
         2haat2ycIPzyfkPQC6OT4Fs2W2qu9d0ucEzZf/F8kV8PytKSdG70Lyx3GWxpHvZyldcx
         F3jsllnA4p73++CNdEZc3gER4T1E2kIBfN49MU5y6LtPM2p5j8LRM+h+zVsnG4qzzlpY
         CrDZU0KUS2XBR+edn9Qu2Ti7HwsWcLScrJXYaWoMERnqI8JOV0KLpyyUrlNJV7+niHov
         6wbsOZYEB4SVxsa+5Su3S0z3Xyh/2GFtwKTzQ4ubGxI0W0A/yVJPk6iV5YUfe1Ffto0d
         8+1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760038313; x=1760643113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qo2N2h5220Ky9Xn/B4HoHFGptFS76IfX9XRwYdGRESU=;
        b=vqU6SVj/1dN+uN69houY+fEds9CPlLniBA6I0m/N0L6X3eiN4GeolOi7AH2+gevCFN
         ulVgetOnq4dbYSS3vkwM9aG37CqT6zuHYdSSrJYG79YGTBSoS0cx3yP7zqgxYaQEWkld
         O7grzKTjT94saf0V2ofiVmJkGWsIXwemYBi6CGYXg3CWC+KDJj64SPKBSjixvumMFvoC
         fq/KbLgjdPs8w8+6VHwkGYvcWHH3jKvtvAX98yzIg42a9g4lUhTMf+KVtURbyyARxHEU
         /rSiKKdJjuhIztuloZYDlZLblz4vqBb87AHxL8eIzdzjDbey8J5k5E5jIJ811WTpGUo9
         u6vg==
X-Gm-Message-State: AOJu0YyJFy8nzrxyODzta/gbvCKlzpoDKlJAty2khk9EGw2qRi8bCH4L
	Ha2vYV9g4rWVsw3RvQXL0Skeu7uAsFDNzi9c+qT+IWhM0Ewwqn4iIlwqLteKTwncLUbZwufh+42
	u8VkE
X-Gm-Gg: ASbGncuOcVpkK/1RhlThHQXSZScJ2VIE+J/j+psH2Ul5TwZ61GiFYmXA73GRcMxfQWU
	cHvGGVQn8osv8wdUv8EkvheQeRr/xMkY/9yUWzVkOFoUP/lZB7/ETBAhWk3vUMtsUljyc69JYKk
	qSuYYg92ymdzRxjKQEq1dfUauVzlegeGudaRtKpcGI+PdmakHbjINM2ThT6JotGfOzPfe0LLUTE
	x/Erhf/lS3ppMeRCpsjgwvVhJ4GvFEJQY/m2/b4VUkIPA18VMb6i/LnNsSAyGfpuPWf75q36SQ/
	XMhTs2RbTFxeQ26hrfyecVrzv8NLJtUjt4z+yjzlYxTY5SKwtmX/JK7wXp0PF6mX2V1oMpqavT9
	+0O/7a/FvUftMULKWhXxhI52lEXkee7altXSsGA==
X-Google-Smtp-Source: AGHT+IGP1K48KbVpJajNnnhdG0s7G+x3rguuUmU0R++V5bFFKZzbGfTcHorINSd3XNDH0/NswUCkyg==
X-Received: by 2002:a05:6a20:2446:b0:262:4378:9df2 with SMTP id adf61e73a8af0-32da845f861mr11220059637.44.1760038313294;
        Thu, 09 Oct 2025 12:31:53 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:b96e:4301:8642:779c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2d51sm495864b3a.65.2025.10.09.12.31.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 12:31:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 24/24] oeqa/sdk/cases/buildcpio.py: use gnu mirror instead of main server
Date: Thu,  9 Oct 2025 12:31:08 -0700
Message-ID: <0d11c9103f072841baf39166efc133f2a20fc4dc.1760038088.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760038088.git.steve@sakoman.com>
References: <cover.1760038088.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 19:31:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224643

ftp.gnu.org is the main server of the GNU project, however download speed
can vary greatly based on one's location.

Using ftpmirror.gnu.org should redirect the request to the closest up-to-date mirror,
which should result sometimes in significantly faster download speed, depending
on one's location. This should also distribute the traffic more across the mirrors.

This information was sourced from https://www.gnu.org/prep/ftp.html

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/sdk/cases/buildcpio.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/sdk/cases/buildcpio.py b/meta/lib/oeqa/sdk/cases/buildcpio.py
index e7fc211a47..00088d0ea0 100644
--- a/meta/lib/oeqa/sdk/cases/buildcpio.py
+++ b/meta/lib/oeqa/sdk/cases/buildcpio.py
@@ -17,7 +17,7 @@ class BuildCpioTest(OESDKTestCase):
     """
     def test_cpio(self):
         with tempfile.TemporaryDirectory(prefix="cpio-", dir=self.tc.sdk_dir) as testdir:
-            tarball = self.fetch(testdir, self.td["DL_DIR"], "https://ftp.gnu.org/gnu/cpio/cpio-2.13.tar.gz")
+            tarball = self.fetch(testdir, self.td["DL_DIR"], "https://ftpmirror.gnu.org/gnu/cpio/cpio-2.13.tar.gz")
 
             dirs = {}
             dirs["source"] = os.path.join(testdir, "cpio-2.13")
-- 
2.43.0


