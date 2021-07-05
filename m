Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web09.545.1625524578095175924
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jul 2021 15:36:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=dQIHkfjW;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.44, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f44.google.com with SMTP id m18-20020a9d4c920000b029048b4f23a9bcso7724140otf.9
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Jul 2021 15:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=X7VtTTjcDVYYkqdlwhSFYSrfMneAYBiT3rIa43MhIOc=;
        b=dQIHkfjW8OSWIDOe2vldSCvq939T3R5OpuzziFFvv8J/NT5LhGMkFA3KoIhVgehSxk
         yBkNTHvEgUwyeaXpvMD8LsCVJkR12R5UyEaRbzHZFobolEDz/f4sIOxqvVSCbR/upYvV
         Ly+SFc2jlO7tUUNBsd+VHHnfQ9B8GxGbKSb0s2zgJew70ryo54Jr92+NvclFmUkYOg0v
         fuDc7EUPcflBf0DqxwWL3Qk9abp2pdRF/OIoBXoHblJmqyQGWEpRQUI4YF8QF69T+OTE
         bPmYPfXCooy+UYfRDpbEMiZ3xyNPDRPJ+Y9gHMG+VwWp+noEucs2P96tjcZFz7KaPBS4
         Fu4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X7VtTTjcDVYYkqdlwhSFYSrfMneAYBiT3rIa43MhIOc=;
        b=dXgSnUc8qyZIOnu0qRoRKnONoV/opvoyvZBmB3QFK/pwJN1WU26/SCZdoYyB+PeByA
         bn5Us26Meb6xH0uy02cU9idTiYVBvpql3itCS450qtUYv2AwzglPtHD4OymKROhOQt+A
         GMACKoXC1qFFY+Gmq6rC1ClSdY2xuhSxKUpaU9gCcoMzhYPxRqowcSpQrBk9F1xSrsB8
         S2UftZcEKMZU2DX5kSjI2oeyUze/rWwQvSEmhVlrBhpvT0dHoIQVi1as7inOVqaKwdQP
         HBloMToZ87r4GjdJ8wo1OZGYIwSU42iWxHxllw6/JpGi8PQGbWX6G/1j2n4jrJoW64+8
         Mu4w==
X-Gm-Message-State: AOAM530oHfNgbe8xs0Me2M6WiN9VE56nWhjZCBq6IKPb64ZLQw11JkBA
	1kx1Jae8zwOuVPoH+AfZvixPphve0KzyS9cD
X-Google-Smtp-Source: ABdhPJwbXQ+AOfh753mJIKMAVJ284X+Tsx8KfSgFiM9DCd2BbTxXvZXCKQJqyiPPGQiTiw62IA0HEQ==
X-Received: by 2002:a05:6830:3185:: with SMTP id p5mr6216674ots.135.1625524576975;
        Mon, 05 Jul 2021 15:36:16 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id i16sm2870178otp.7.2021.07.05.15.36.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jul 2021 15:36:16 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/19] kernel: Fix interaction when packaging disabled
Date: Mon,  5 Jul 2021 12:34:46 -1000
Message-Id: <6683b784d3258672c8d56c945db02ba37379cbf6.1625511812.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1625511812.git.steve@sakoman.com>
References: <cover.1625511812.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

When packaging is disabled using the nopackages class, ensure we don't
add to PACKAGES. This fixes builds where we have an unpackaged kernel
alongside a packaged kernel.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2522daf22e2c27dd9c7926feda0345978217c6c3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 85c6594c27..2a3cb21fc0 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -91,6 +91,8 @@ python __anonymous () {
     imagedest = d.getVar('KERNEL_IMAGEDEST')
 
     for type in types.split():
+        if bb.data.inherits_class('nopackages', d):
+            continue
         typelower = type.lower()
         d.appendVar('PACKAGES', ' %s-image-%s' % (kname, typelower))
         d.setVar('FILES_' + kname + '-image-' + typelower, '/' + imagedest + '/' + type + '-${KERNEL_VERSION_NAME}' + ' /' + imagedest + '/' + type)
-- 
2.25.1

