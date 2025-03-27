Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59F77C36011
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 14:43:50 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.51663.1743086625114352309
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 07:43:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=F66G4FGd;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22580c9ee0aso23345035ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 07:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1743086624; x=1743691424; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ezc4l0ONo4CBQGusmJWtNZx+ToEBnBifGHnoPUJqlk4=;
        b=F66G4FGdqVoA0SZexpPgeanyQy9apIZaqo4jRmzc/1/oEnQX6lwr8Wk5lY0Kd4Gahx
         rA0R7b3jJQwP2EAQFWnMQL8Y8lakRlu6Xg0K8oADGYqQRenwRTQJv2/aa4DsYjV2SdmG
         Yr7Ap2gUd4JWxAuzDbxFwUf1IcpcXIHjEE1j6rHAWO/0KW2lolYgOTwIlJRa01ZGVhpL
         7xt8dzMaQB+ZWnEEvppxgHFgqVa2ytHiKggadqHZyYnn0FsYZDOXB45q2G7xkGfcr2qo
         YCgBXWzh/Lhvd2j8tT3hSh96tiPuTFJHWbD5Ml9RZixjh4T2o4FgzQ52Ku/H1HeZM3qq
         HabA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743086624; x=1743691424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ezc4l0ONo4CBQGusmJWtNZx+ToEBnBifGHnoPUJqlk4=;
        b=A0Hj7aKBaYPPcqhs/gXwVAU3w+9M/LbfeDD9wNk+4CjmzWbJRfzfdvUYJYUQE58uNr
         ua9Y7EMft74u53OIB99XM6meaUtGBWwKxLi7B3ND2CnIk8pIyZXTh2mith62MWeuxVYl
         ZgWUfnWslaYM9ReZ5aNhAQHasZs5Pn/ucxaeK986wYCjXq36IPKvpKaZFzrn4VFHaRBv
         XYEErGBjmRHuZ1C4ATOURmxmeHLYvj7GEDdoR1r/T8Yi2Y328mo5rF6nGQuzh5XYUVqq
         /g3yPHr6w1DKq26ssHoP2D59Oj9v9oFZ0h5hTV+NJVirSLxJVTrCVyzhfQZAT85aNeRi
         fbng==
X-Gm-Message-State: AOJu0YxcWjSljOMIa+LFQ5xcMsik9tIZLTXeEWhPaLpJhpWrR3uUVk/F
	rwtIa93yyfxq/9X6j5DC4GbWRY4YF68DJ7LTSOwTwxsm6rPUPo9PxMESy6NRUGDWkQg08MMrkqu
	9
X-Gm-Gg: ASbGncsGqbX8C+gYj+OdG8mWhvbVXuFMy28Ontt9SItbTTXupYyBycnD2Cb8uDnKgb1
	mJ9hPntS0DXjKVbsUq14MD/4Owdg1jgxp6tyC1EgGw+T5yeOutBWucm597mFDstjLuu27LXGN7g
	pAijREwof15PXVzMsC7epzIbt2ESHWBh7z6TT+6brjASWtiihEIcggRyPiNsAxRDf6fnfT1g4dM
	f22q98rpF2N/H69D5ZlfL+goMDhZQc0fYX024qg41yxytNlVlNBIPp4gXtoqfnbtUMd/ElLcRyP
	ZfH0Jhv8gbKvQhoRJN4aBty7B+Z/1pctE9s=
X-Google-Smtp-Source: AGHT+IHdfhcN++6LnBka7P467rO6igUCfF0WNtqfZNc/WaJm0hYt+Y2kToXkbMJF5NZo16z0VykCSA==
X-Received: by 2002:a05:6a21:789b:b0:1f5:7007:9eb8 with SMTP id adf61e73a8af0-1fea2d7557emr6094496637.16.1743086624228;
        Thu, 27 Mar 2025 07:43:44 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:811c:968e:2c1:6363])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390618e5absm14819074b3a.175.2025.03.27.07.43.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 07:43:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/4] vim: Upgrade 9.1.1115 -> 9.1.1198
Date: Thu, 27 Mar 2025 07:43:28 -0700
Message-ID: <0ace90f2918496ceae32aebea05bb826d1e3dad6.1743086467.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1743086467.git.steve@sakoman.com>
References: <cover.1743086467.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 14:43:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213755

From: Vijay Anusuri <vanusuri@mvista.com>

This includes CVE-fix for CVE-2025-27423 and CVE-2025-29768

Changes between 9.1.1115 -> 9.1.1198
====================================
https://github.com/vim/vim/compare/v9.1.1115...v9.1.1198

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8e540bd287fd56e3a714f81395b59dd508a6d957)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 823cfe24c7..c7f3987134 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -18,8 +18,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".1115"
-SRCREV = "c0f0e2380e5954f4a52a131bf6b8499838ad1dae"
+PV .= ".1198"
+SRCREV = "f209dcd3defb95bae21b2740910e6aa7bb940531"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.43.0


