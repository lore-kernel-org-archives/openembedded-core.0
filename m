Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EA6CC47075
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 03:18:16 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.5044.1700018286696917510
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Nov 2023 19:18:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=H7p+DQhG;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1cc329ce84cso56805595ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 19:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700018286; x=1700623086; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pLI4Ab2c61bGJmlpV94OlDnyW4FyFGMJyyA1fnGvw6s=;
        b=H7p+DQhGbp+K8J6y8CXu5vYKWE9e0SOaltQbAJjg3edMLkoSIiaK3OarhNT1Ug3ILK
         FOItEs0XGOJqBW4Tb8mmG8pfMrHQHy5hKIjfkysSVbbTvQNcfIg4ZklY5E8DaTloBvr8
         d37KOgMVfUG4scUskkFCoPnzx9Bi8+YUHoaUshOBZoBNQ6m1vbzSRKz03htNcDCYx9Oj
         IOR57/NHlVc3PINRh8sfQLCkPMQycNEeSkKrS5ApwoWYn1h5Hcbee2X/+zS8Hr8z1bMI
         dZW25Svv2pjM592QrZku+feOW93KnbCkGYkckhDM8p71LaeoPjtFwvtuVKG+pNrWvluB
         HGNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700018286; x=1700623086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pLI4Ab2c61bGJmlpV94OlDnyW4FyFGMJyyA1fnGvw6s=;
        b=oalM9ruGMYOooHqqb87rRRNN9hGv5wFSOKun+LfWxQXv1/47OsxW7X9KllLuS2BqRW
         Z0uXb0kr3Q35/7DfPxscdtRTN9yMcUodmwb9P63G9xy04dVb9ZGv7/CdUJyBv90U045e
         zaezMWuTmeK69P5iU6OFByrTNjwTOyHxZ0qN6Rj56Cl9cYalYwP0nqGG2Ttxs8PcaBwa
         vxOkSm2V7oWvFwBLxaD6QQM/BSIia3dLXkHcr9H+Ecl936mmO1LKtQ77yMh+bIBhKBsT
         E497nRLiSXsRMtBjT0cmC84n0hRP8Lt4gvGUXSeXB09To0XqXWgd/83i54839IZw0/m4
         s+ng==
X-Gm-Message-State: AOJu0Yzp1+OUTWYwQcUhn5HG6fi7/BiPbH3TbifCjQZ4lsnTEe1pL1Xi
	VAPU6uLpPZ1aUQkOHzoWbBtKjm4P4tCybHVp+hTBBA==
X-Google-Smtp-Source: AGHT+IEyHeZcf4TExQ7IRg7OtLHHH4LR4hdXd7YyaziF8CLCziKAzE12WexvUeJd9nOq3teMQz2wdA==
X-Received: by 2002:a17:902:b618:b0:1cc:449b:689e with SMTP id b24-20020a170902b61800b001cc449b689emr4138855pls.20.1700018285826;
        Tue, 14 Nov 2023 19:18:05 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id l5-20020a170903120500b001c6187f2875sm6369300plh.225.2023.11.14.19.18.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 19:18:05 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/17] resolvconf: Fix fetch error
Date: Tue, 14 Nov 2023 17:17:31 -1000
Message-Id: <d4b96dc1e457b4e68c5bad685ffcfd2f250162e7.1700018112.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700018112.git.steve@sakoman.com>
References: <cover.1700018112.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 03:18:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190544

From: Naveen Saini <naveen.kumar.saini@intel.com>

Branch 'master' renamed to 'unstable', which causing following failure.

Error:
Fetcher failure: Unable to find revision cb19bbfbe7e52174332f68bf2f295b39d119fad3 in branch master even from upstream

Switch to 'unstanble' branch.

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/resolvconf/resolvconf_1.82.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.82.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.82.bb
index f482bd297f..5f0a5eac70 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.82.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.82.bb
@@ -11,7 +11,7 @@ AUTHOR = "Thomas Hood"
 HOMEPAGE = "http://packages.debian.org/resolvconf"
 RDEPENDS_${PN} = "bash"
 
-SRC_URI = "git://salsa.debian.org/debian/resolvconf.git;protocol=https;branch=master \
+SRC_URI = "git://salsa.debian.org/debian/resolvconf.git;protocol=https;branch=unstable \
            file://fix-path-for-busybox.patch \
            file://99_resolvconf \
           "
-- 
2.34.1


