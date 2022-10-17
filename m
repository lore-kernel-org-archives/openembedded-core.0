Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51DF6C4332F
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 23:09:06 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.643.1666048144202412891
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Oct 2022 16:09:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=EPaBPTcl;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id y191so12479918pfb.2
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Oct 2022 16:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/sQFI7zHg3r9Cygft81jQbjxjdmuJgNKsH6y+ID50nw=;
        b=EPaBPTclZ54CJcBQZQavnEB/KdRZGw3CD/DPyF99YskiZ3/uR7hU3TMY7Jbt1uNB8P
         Hoegu3+y1LM1MOl2U8dObQXdN6teIV+1SH6s20SUv/vpxG5qrOg22JPok8MHzZGZ3x+y
         w5uznEy2+3hWuheh6VC+oFO9EqOAwCmeZo0K7OR/60HPHvAGX0N/iHqHsFr4LMUcNgMs
         ovCsPMJCVBclNCDAk5/TjgRe5rQ5qlG/MndFc2XmvCmmhdKq7ykXfl7lZrpFRk2D9gi4
         2XhBo69uAvQG+3n/V2HwWMWvuIcbZ+UUYqgRwbtqFtAY5dPSk6yOLvJHq4bjaUtUJG0v
         2YOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/sQFI7zHg3r9Cygft81jQbjxjdmuJgNKsH6y+ID50nw=;
        b=VaTPP4i5II1hLlzA1194TVCV2RinKFXs+91o4Rw6yoZ4cIjwPElmDFXDYbkQkEUoyL
         PvGtpcq8SMM1Uk4OYPtcKRe5ClD2srv1NDWhHoCEnRNLG3y6MT4/FkDtw1ud8J+7SrXc
         nH+PNhv92njF0dUTjXZGNVNGp7fTa4T+jfjuFdo+D+4MMcPYIM35qCvZWRx1iOY4buCe
         EfNGm/bGZNb83D0KebxYHg83r4zxOMnvCuJ08R5Ee8Cho08GU05afzO12+QfRnCCd9Hc
         vvBYKi3PGYwpS+DqMhcSUhg4Ag8+KBKPL27XBb266NMFYHNc4n4zdURaB42SOU24lM70
         K3TQ==
X-Gm-Message-State: ACrzQf2MTM6gCgYyQC4m6BlYamI0i6QUdsGyCCP01nAdMNXRRKeBhPTM
	tS2BlpQhySdB/gxaBdNE2E19x0/iDbpr02qz
X-Google-Smtp-Source: AMsMyM69YTHAEDQ0afsbADjF87dEFFpWE5H+0cPWDJSRrabS1+fQJaU64JrlhqAEKSP9TVzeJDyhGg==
X-Received: by 2002:aa7:9614:0:b0:562:b07b:ad62 with SMTP id q20-20020aa79614000000b00562b07bad62mr118917pfg.79.1666048143173;
        Mon, 17 Oct 2022 16:09:03 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id j6-20020a17090a694600b0020aacde1964sm10119479pjm.32.2022.10.17.16.09.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 16:09:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/13] uninative: Upgrade to 3.7 to work with glibc 2.36
Date: Mon, 17 Oct 2022 13:08:25 -1000
Message-Id: <bfbd86a8acda86048cac48e8b4759f644a24d4a4.1666047986.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1666047986.git.steve@sakoman.com>
References: <cover.1666047986.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Oct 2022 23:09:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171927

From: Michael Halstead <mhalstead@linuxfoundation.org>

Update uninative to work with the new glibc 2.36 version

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 410226b053e14e32add1f9b4b811f84a1c445a7c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 411fe45a24..7012db441b 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,10 +6,10 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_MAXGLIBCVERSION = "2.35"
-UNINATIVE_VERSION = "3.6"
+UNINATIVE_MAXGLIBCVERSION = "2.36"
+UNINATIVE_VERSION = "3.7"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "d64831cf2792c8e470c2e42230660e1a8e5de56a579cdd59978791f663c2f3ed"
-UNINATIVE_CHECKSUM[i686] ?= "2f0ee9b66b1bb2c85e2b592fb3c9c7f5d77399fa638d74961330cdb8de34ca3b"
-UNINATIVE_CHECKSUM[x86_64] ?= "9bfc4c970495b3716b2f9e52c4df9f968c02463a9a95000f6657fbc3fde1f098"
+UNINATIVE_CHECKSUM[aarch64] ?= "6a29bcae4b5b716d2d520e18800b33943b65f8a835eac1ff8793fc5ee65b4be6"
+UNINATIVE_CHECKSUM[i686] ?= "3f6d52e64996570c716108d49f8108baccf499a283bbefae438c7266b7a93305"
+UNINATIVE_CHECKSUM[x86_64] ?= "b110bf2e10fe420f5ca2f3ec55f048ee5f0a54c7e34856a3594e51eb2aea0570"
-- 
2.25.1


