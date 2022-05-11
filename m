Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40C68C433FE
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 18:20:12 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web08.409.1652293194705572555
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 11:20:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=PWM4ekTw;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id m12so2684919plb.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 11:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=x6EeKBHE3rdete5IdmBiVRYMyuaDmKehY6Bd+e1156o=;
        b=PWM4ekTwDkp/P2AEEu32AkHtF0EF65Jy0GTKtrKQEv5FVDXyLrXinGtofPavYVfGN6
         YNR/4eDVhTjEnqU4nYLwys/J1tXzxFCsWvfjQ4HQEVV7xSw3t51nL+xMWkvkCeIOjUKN
         /iyCwVvVokOWaI/foRq4n9ipSDplX3V8tyESih5mMxEVZrm3i+JCKNUbLVce5fLDfAQ1
         MKFzVtxpnglo4TcabQEAIfpIso4Mwqj3jo8bESLzaMrIrY9J2PTu97r0AyJ19HfxUnI9
         6q2Mzv9zjllt9tu8Dj9P/gDXbu8YayAU4bpHVCSBn/d7e2HYsi+7sbEQYVDnb4RLlYaS
         lT/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x6EeKBHE3rdete5IdmBiVRYMyuaDmKehY6Bd+e1156o=;
        b=CvKq9bv3OSp/CN2xwaQUNjWKIrXo7djJwoI4R2pL2uM2nMap0iKKnKK8VylO7xEbFE
         218r6PO/xsbBtL8jhVCXUTl+Q1gFhNsII8sZSHWoodBj4dGeil4FzKSmXfICBgpi6lKY
         34J5BCEyyeEHIZHDh6Ga8E9eHYywIKieLHGIBIJKoZmkEu12KBpFCxZJa1NI945JAN8+
         pm+SQcA00nhMIxiciA3Vnjw+8FY0kDshXXZnoRnecvICxvNVuxidfQ7A3xVU9vR7F0zs
         mENEtTyq3iDUWL8GKIfXWNniXr1FirIfhqch+7E8RzxWHE0B1r44ezHaOIDZ1oeV4tHh
         Lgwg==
X-Gm-Message-State: AOAM530mf4HerXO/XzpOq6WbJa7afEeyJsuZlOjdlFHvahpby0SxhzUL
	V5OHntj92VbTW6BvtOi387jFMLxo+l2g7tgh
X-Google-Smtp-Source: 
 ABdhPJwv52zVmXh+XvuLzMEUcA21UGWufHME0zz/46Pv981z6gjA7v0CW4Mf7hS+DRIXdatN8TNm2g==
X-Received: by 2002:a17:902:ef43:b0:156:9c5d:b0fe with SMTP id
 e3-20020a170902ef4300b001569c5db0femr26708820plx.158.1652293204276;
        Wed, 11 May 2022 11:20:04 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i14-20020aa787ce000000b0050dc76281bbsm2126132pfo.149.2022.05.11.11.20.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 May 2022 11:20:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/14] cve-check: no need to depend on the fetch
 task
Date: Wed, 11 May 2022 08:19:24 -1000
Message-Id: 
 <72e5204bc7272414cc7bcfba18f52a177242ed79.1652292852.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652292852.git.steve@sakoman.com>
References: <cover.1652292852.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 May 2022 18:20:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165511

From: Ross Burton <ross.burton@arm.com>

The only part of the cve-check task which needs files is the patch
examination, and typically these patches are local so fetch isn't needed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2c9b3186d3b7c18cbea239ab9b06e85b7c243b54)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit 3dc8edd6611e7ad4abcece44ca4701eda7aeff94)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cve-check.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index a7156cbdfb..41b4eb2dbf 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -121,7 +121,7 @@ python do_cve_check () {
 
 }
 
-addtask cve_check before do_build after do_fetch
+addtask cve_check before do_build
 do_cve_check[depends] = "cve-update-db-native:do_fetch"
 do_cve_check[nostamp] = "1"
 
-- 
2.25.1


