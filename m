Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45C6BC3F2D4
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 14:47:29 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.7348.1654699640038011365
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:47:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=yY4IpYZA;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id
 mh16-20020a17090b4ad000b001e8313301f1so10029432pjb.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=OkcFYiMuBWbcXkfFRZtxXOe6JOmnn1fmIAmG8LKlZ5I=;
        b=yY4IpYZARr9JCC65WYDk91P8vzdJj2cCkSYjt0ewPArTAFYmoyNgM88bG4/6gcP1Ma
         5oNsl010B/3SwZCxxz44bkhSZh22N5e+pkLTa4viJIKEeIOYxlseamIfqS5vwgxX72a4
         mSmFF7JlQaL9Qa+OKh573fQrqcuVTlrJLZqB2dyKNNQNKeXBSq3zD7Vb+rKQc2ZfvLms
         9eBls03UP9Ca3NhEK2W8iF7mwIeq7WagmMusXVuqDs7cR7mhTxfMK7gAtICh3oCiJ+7O
         PBJ6RfRDsKQTGcUyUzQ4B1iY3Ee9MsAhK6vRSddjBMCzbMD+PvKtn2tYaZpi755emh5v
         mQfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OkcFYiMuBWbcXkfFRZtxXOe6JOmnn1fmIAmG8LKlZ5I=;
        b=ME5VSvZcyRtlwmbuXKK8944NRROJ+cYTmN5xcs2+hoCRI8RT84k6o6+hDIqUn9MDc+
         DvSrFi2SxozqgL+5xJGKR98Ejl44IkTW13jLdtdgEx57dhIabZ5RN7u5vnrqX1j74qmp
         Slx2n3mpOKE+/vW7nV7BmsAu/MrJl3ERedLbnUNVGH3Z0UIg1CkuZxCd1LMrfDe36Zkg
         MqU2WwrUUb1QwHkimiEhf4l7l4uqpw4h3/n9S8MsfOEw+Xd1DNsk8GQnxr1cI+56b+3b
         4rezgMo8GWcHPFqxJ4yNiiP0rFleaUwfze3kwL41mxPwC9NJhP8AIyARIvOT5RBIvxie
         A2fA==
X-Gm-Message-State: AOAM532RZ4/oxxlh6TfTzz30FukbmPpYuvMrGGgNyAcVicPbkLS27R+5
	kFfQeGptZzIBLrjLUOyrJf6Y/VdwYrZN23PH
X-Google-Smtp-Source: 
 ABdhPJwoa71/s1BmZI6iBMBtPNCiT04GcxShCj6NXa+e1QqUQbU6xSt6iPfmOFbimAQb2btgg5790g==
X-Received: by 2002:a17:903:11cc:b0:168:eae:da4a with SMTP id
 q12-20020a17090311cc00b001680eaeda4amr6544254plh.21.1654699638305;
        Wed, 08 Jun 2022 07:47:18 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 bg13-20020a17090b0d8d00b001e08461ceaesm16709701pjb.37.2022.06.08.07.47.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 07:47:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/14] curl: Fix CVE_CHECK_WHITELIST typo
Date: Wed,  8 Jun 2022 04:46:33 -1000
Message-Id: 
 <7b2a1d908d3b63da5e9f072b61dd3c5fa91c7b8f.1654699348.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654699348.git.steve@sakoman.com>
References: <cover.1654699348.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jun 2022 14:47:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166744

From: Robert Joslyn <robert.joslyn@redrectangle.org>

Fix typo to properly whitelist CVE-2021-22945.

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/curl/curl_7.69.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-support/curl/curl_7.69.1.bb
index b53b00cc38..5a597a7dd9 100644
--- a/meta/recipes-support/curl/curl_7.69.1.bb
+++ b/meta/recipes-support/curl/curl_7.69.1.bb
@@ -42,7 +42,7 @@ SRC_URI[sha256sum] = "2ff5e5bd507adf6aa88ff4bbafd4c7af464867ffb688be93b9930717a5
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
-CVE_CHECK_WHITELIST = "CVE-2021-22922 CVE-2021-22923 CVE-2021-22926 CVE-22945"
+CVE_CHECK_WHITELIST = "CVE-2021-22922 CVE-2021-22923 CVE-2021-22926 CVE-2021-22945"
 
 # As per link https://security-tracker.debian.org/tracker/CVE-2021-22897
 # and https://ubuntu.com/security/CVE-2021-22897
-- 
2.25.1


