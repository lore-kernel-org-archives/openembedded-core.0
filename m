Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE795CD11DD
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 16:44:33 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.50466.1710953068533860386
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Mar 2024 09:44:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Qtl04FY5;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6e6adc557b6so98941b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 09:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710953068; x=1711557868; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NHO7zcpN++T4K/yoj1mLAkUqMCfyo17sDK2LDVZtdWU=;
        b=Qtl04FY5PEXAy4S5Vbyj8e3+qFy/0+41zj6PyN7g36oh3rQ1mHARyi3J6nnRQWyh6O
         EUO5igMYQW4n/pGeNyEp9IKzLsb2eYTcNT1O7eutsuH0CCviAqLmpHIsMYRmRXMtyzpm
         WmPuKajUh31RCvQbU1M5l/+R11WdmLhNtmjXan8hFq2hI+EmQQ7kMSZN/H+S1uLeUj63
         iUmXsliTwrWLMhNWuiErE672MszHblNYoXjfPJUH40HfiEsAaA17ypkgJ8WiomigijiY
         c9rivxjNpGG1vGICnHqx/5Y+ZWUpHTXiSeDijCawtjz2PN0xhPWbd/DcewUAtuJu1YyS
         it4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710953068; x=1711557868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NHO7zcpN++T4K/yoj1mLAkUqMCfyo17sDK2LDVZtdWU=;
        b=JBRCJHSjVt691c8QkO5auxXurwig9EJXrIRMs+b/lt16QQAF2EQZypx3xH+nu0abU0
         33SaLoG4K0tTlsuPhda9jHmO5myb7lyCsKelnhMsJu/djxVoiz52jaTj4cD9CQdUdR/j
         d6KqJ8Wy/DQ2iQbBlN/mRhpa7o68cH33wxPFu0vYKa82wTI1/1a48emrG68ci6zxbRao
         gPIVnZ9umQWDlb1U6A52EUDkii8ADjLjZK8ztmam1xZZYH5MOY+KFNzjpY6FBNRqYzE1
         CB9bkRYFpOYTknSLSINKlAXYMRG9pk4pQ0vZ3idGsuAnMbWDItQ60BK6F1Il93Tn+A6w
         GQQQ==
X-Gm-Message-State: AOJu0YxrBNcx6qjtINAFLvYswgRG/GdzohkqXZ84ER0sU6dkYQXQBpTN
	B4MnI/eb7iu7m3MixNDJtlOtnhgB2DD7Q6uJqBkL0PNX4ai0rqT0DAdH0G1a8RrZ/N4VrF1q9/9
	8vMk=
X-Google-Smtp-Source: AGHT+IFofq56afokkoh4elNMHSjX66Db+JhjzwcYfhQwaAwlbV6EswZOD5ZVvOZHcIOV+GU5e+PnSQ==
X-Received: by 2002:a05:6a00:2394:b0:6e6:9942:fd97 with SMTP id f20-20020a056a00239400b006e69942fd97mr21571866pfc.15.1710953067847;
        Wed, 20 Mar 2024 09:44:27 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id a3-20020a62d403000000b006e6bfff6085sm12725437pfh.143.2024.03.20.09.44.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 09:44:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/12] cve-update-nvd2-native: nvd_request_next: Improve comment
Date: Wed, 20 Mar 2024 06:43:59 -1000
Message-Id: <9ba959475d84b2e87e14ceba11787b10afca45ba.1710952928.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710952928.git.steve@sakoman.com>
References: <cover.1710952928.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 16:44:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197392

From: Yoann Congal <yoann.congal@smile.fr>

Add a URL to the doc of the API used in the function.
... and fix a small typo dabase -> database

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e0157b3b81333a24abd31dbb23a6abebca3e7ba7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 506b4b6bbf..a703b68aac 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -123,7 +123,8 @@ def nvd_request_wait(attempt, min_wait):
 
 def nvd_request_next(url, attempts, api_key, args, min_wait):
     """
-    Request next part of the NVD dabase
+    Request next part of the NVD database
+    NVD API documentation: https://nvd.nist.gov/developers/vulnerabilities
     """
 
     import urllib.request
-- 
2.34.1


