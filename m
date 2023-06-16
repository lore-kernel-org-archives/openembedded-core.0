Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF290EB64DB
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 14:38:08 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.242.1686926279578548281
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jun 2023 07:37:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=5EwjR0lA;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-666748c1edfso736473b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 07:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686926278; x=1689518278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mFhI5ntYXogRZRfl4dWiyQRljHDYXMxezFl3Htd0pxg=;
        b=5EwjR0lA5Wlg+C2FDoC4kYzBS2kx+IWy9bqEi6p6CO7XpqCLUkBO3MS77pEF7TIj6P
         z6EIwXpw7dWsJkl9omQIFpNcJfe4qamH024P6tcUM9Dq2WsbdlojgspaF4hGbLsvEfEP
         SBfk3SeRVy17TB7WbmsM3P/Y/luz0lVABpJlRTAGQLowF/z2jecbenrvxC5mohrim40S
         OHaSRY4GYEPJUZEPKXQlskjAfQwvSHsIPJ7fGa+3U8ahFbIMPP6dSz66xQblUU6Pzrkw
         8UOPFXJLNNwCYOJTzm/wVd2xxcFtCPftVoEC/eSCEs8Svm/aGx9wizZgT5JFjaIeOrIE
         Qxgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686926278; x=1689518278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mFhI5ntYXogRZRfl4dWiyQRljHDYXMxezFl3Htd0pxg=;
        b=bRH3ajIUKNImE7IXjrWU/bSmZiNe2CaDpm7NUYc3ogYLumaT+Knut4U5ymCuD6N/hg
         RtT/iOVnWlUPIOvJJzbyZnSV5AadxcnWx1JGIPmVKoXcz8cMMjncdhI3ZWtMe9bWBX4h
         P/E/KDFKd18n2znhVs1mhtE3zIcwPQ48jkcdV1zHJDGzi8iZpEOrgppqxa19pd+p6b58
         U6rp98DXX/5AAesEd/qsQ9QktImiwfFzX/OxpCdo/cDzbSYg4YdA9y6TAee7bDwPnMnr
         rUIdtw2DifR+hefRJNV3X/9ePpXs3tDpkMkV4c+7sORY7wm134CzG9MennWmSSaNgkjE
         TXpQ==
X-Gm-Message-State: AC+VfDyf+hGwL2kryghDErRM+CBP8ODBsw/gFnZSKHIRwrRBzlRxANkZ
	jOH2FPPBzxZZH8iv4vU0OA12PcCTi2djZFMH2pI=
X-Google-Smtp-Source: ACHHUZ5ZOixKVlY5FWnZC5b2OlhKBd00Gr1ZBeQEEDFF/7JHIIl9L6rMynLG5XnKtC8HDrJbSSIv8Q==
X-Received: by 2002:a05:6a21:3815:b0:119:be51:59de with SMTP id yi21-20020a056a21381500b00119be5159demr2014104pzb.7.1686926278614;
        Fri, 16 Jun 2023 07:37:58 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id k21-20020a170902761500b001b03f208323sm15865547pll.64.2023.06.16.07.37.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 07:37:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 22/24] selftest/license: Exclude from world
Date: Fri, 16 Jun 2023 04:37:13 -1000
Message-Id: <ce738e11c5170be40ce76e91e1b91aec8579977b.1686925952.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686925952.git.steve@sakoman.com>
References: <cover.1686925952.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 14:38:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183043

From: Richard Purdie <richard.purdie@linuxfoundation.org>

These test recipes shouldn't be built as part of world builds. Some recent
changes are exposing issues from this so exclude them.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 80d3f5586cd060ae69fbc6dec2e8978d87da10ba)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../recipes-test/license/incompatible-license-alias.bb          | 2 ++
 meta-selftest/recipes-test/license/incompatible-license.bb      | 2 ++
 meta-selftest/recipes-test/license/incompatible-licenses.bb     | 2 ++
 .../recipes-test/license/incompatible-nonspdx-license.bb        | 2 ++
 4 files changed, 8 insertions(+)

diff --git a/meta-selftest/recipes-test/license/incompatible-license-alias.bb b/meta-selftest/recipes-test/license/incompatible-license-alias.bb
index e0b4e13c26..1af99e7809 100644
--- a/meta-selftest/recipes-test/license/incompatible-license-alias.bb
+++ b/meta-selftest/recipes-test/license/incompatible-license-alias.bb
@@ -1,3 +1,5 @@
 SUMMARY = "Recipe with an alias of an SPDX license"
 DESCRIPTION = "Is licensed with an alias of an SPDX license to be used for testing"
 LICENSE = "GPLv3"
+
+EXCLUDE_FROM_WORLD = "1"
diff --git a/meta-selftest/recipes-test/license/incompatible-license.bb b/meta-selftest/recipes-test/license/incompatible-license.bb
index 282f5c2875..6fdc58fd30 100644
--- a/meta-selftest/recipes-test/license/incompatible-license.bb
+++ b/meta-selftest/recipes-test/license/incompatible-license.bb
@@ -1,3 +1,5 @@
 SUMMARY = "Recipe with an SPDX license"
 DESCRIPTION = "Is licensed with an SPDX license to be used for testing"
 LICENSE = "GPL-3.0-only"
+
+EXCLUDE_FROM_WORLD = "1"
diff --git a/meta-selftest/recipes-test/license/incompatible-licenses.bb b/meta-selftest/recipes-test/license/incompatible-licenses.bb
index 9709892644..47bd8d7c00 100644
--- a/meta-selftest/recipes-test/license/incompatible-licenses.bb
+++ b/meta-selftest/recipes-test/license/incompatible-licenses.bb
@@ -1,3 +1,5 @@
 SUMMARY = "Recipe with multiple SPDX licenses"
 DESCRIPTION = "Is licensed with multiple SPDX licenses to be used for testing"
 LICENSE = "GPL-2.0-only & GPL-3.0-only & LGPL-3.0-only"
+
+EXCLUDE_FROM_WORLD = "1"
diff --git a/meta-selftest/recipes-test/license/incompatible-nonspdx-license.bb b/meta-selftest/recipes-test/license/incompatible-nonspdx-license.bb
index 35af0966ef..142d73158e 100644
--- a/meta-selftest/recipes-test/license/incompatible-nonspdx-license.bb
+++ b/meta-selftest/recipes-test/license/incompatible-nonspdx-license.bb
@@ -1,3 +1,5 @@
 SUMMARY = "Recipe with a non-SPDX license"
 DESCRIPTION = "Is licensed with a non-SPDX license to be used for testing"
 LICENSE = "FooLicense"
+
+EXCLUDE_FROM_WORLD = "1"
-- 
2.34.1


