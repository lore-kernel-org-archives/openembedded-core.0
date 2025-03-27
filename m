Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83E84C36011
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 19:44:38 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.5273.1743104670015861937
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 12:44:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=g0nl9hZ9;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-224191d92e4so29627665ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 12:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1743104669; x=1743709469; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ezc4l0ONo4CBQGusmJWtNZx+ToEBnBifGHnoPUJqlk4=;
        b=g0nl9hZ9AeDvO6RbuCwK5xCyoMNjYdDpY5IUeaWFYhKWOcq3jZftHD1NuXuUWtY5O8
         +DTZDBczMxppAUdt+Fsmk/y9c7CzVU4/bb+B/XIkUCCLBCX6oXmckffIW5Of7+WqM4Cr
         bLz5dEpC+RKjd73+M3EUrrtS96TmGNCkk9jBdJdqaUrt8vBIBvlitsQ7Z5r792heNDOc
         uZQzmFytxlEI22wndBI/O2P4Gm6ap5IecGf5GfPsg/bdM5+zdYBM7DLiNA5n4EZBwfqx
         P2BajN8v4kXasttl7B2o0WzRqgfxYGdwxI4jzjjrStxkX7I+1ZN3/x0p8k0o1uTNXOF7
         IgTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743104669; x=1743709469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ezc4l0ONo4CBQGusmJWtNZx+ToEBnBifGHnoPUJqlk4=;
        b=cCoQHHJYxhTvrveoLNz7XngrFWQDzZYKPn5M2QHWBuR0xSVrvtbyiE/hJM7WVzVj/U
         XHokGNXNAShWQiZR1XpngA7+a3djX51Kb2h89ckKVo9BTVL+T19EArIWxH3zi7Mslvj4
         ssV0oCs6aDHqjqSwEu1F6II9DZ9s/YWVTc3xsqw+cb1EPo69elkuEQRBkw4SJRpqoPW+
         hx3YMWGbXcy1yLfqvR9dP0J6bB8cRz87DxSxCnEyHna834By5q1CbFp6bkDnnlZOpdfi
         hk5hlK8oq22w38k9si3pCrUo9Up8ckkvRpw+mkAwf8i7GxqhrG0xS55f6hlfhclu+A+2
         z2/w==
X-Gm-Message-State: AOJu0YxbnAA28LJea37fx/KDrPom527iFZnoeTLMLin/sKOn4jDyUTAf
	1j72p+OFM6Svb0xSvJX5McPHuZJKPowuXpWhIodamwY+EMrH7HVo0RvsMaK9pmAXsN6xHumL/vA
	K
X-Gm-Gg: ASbGncuGBuWpKtYRfx6B/RWQ+JSRAPKY0jPKvMytkaZ8HHBYwv6JwY7Uui1T4c6v0Zz
	eIvSmhqsfne5NW6m6AF4xHRBvc97CmF9+bMusRgFpwOL1ToFrkFHcxGua2ctcfXPGcDis9sM1EM
	2nhDuistR8u6Cb+d7BpG1LUX3Z5Kjd1WhJr9eQ4ek2H5KH1X7lach//BD2Qiqo0+jrUkkVqZ1My
	JCa8ZumMKuJpmS+w051sV8q5DG9+lAuaczOR233CNW4/35/fLun4K2iltQgiuuAv2Uxj3KGs7g3
	n2JawAhOeBG8FI3xDN1OQUWGW3QY8MIvmHhXpNY9jjQR9g==
X-Google-Smtp-Source: AGHT+IFRlsa5sioGMIhJuKOLzhcdI4l1GvA3OZYz3a11R+f0Q5sYDCT6GYnp99ETwmY+9sZIhMaBVw==
X-Received: by 2002:a17:902:d551:b0:216:794f:6d7d with SMTP id d9443c01a7336-2280495aa5bmr84025145ad.48.1743104669230;
        Thu, 27 Mar 2025 12:44:29 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:811c:968e:2c1:6363])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eee0882sm3865875ad.75.2025.03.27.12.44.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:44:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/10] vim: Upgrade 9.1.1115 -> 9.1.1198
Date: Thu, 27 Mar 2025 12:44:08 -0700
Message-ID: <a6cf72f3a01d8e6ea310d6759d5b98813e3edaac.1743104524.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1743104524.git.steve@sakoman.com>
References: <cover.1743104524.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 19:44:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213779

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


