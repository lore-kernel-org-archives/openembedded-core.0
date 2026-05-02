Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA493CD342E
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:31:25 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9522.1777739480272954158
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:31:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BIkpTIuw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso24229735e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 09:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777739478; x=1778344278; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v7yO7ZonkYSZ10OR4UKmGDl0UDGYZg398xGTn5IO2XE=;
        b=BIkpTIuwM8mwoIC61i6IBuiu531EWohHHYtg9mka0vcrzA6MLTUsuOa2OVoYi407sh
         Tzbs4kxXKaWICv4jTa92L+MYeW2srYnsVrvZsk09bKFGV62kBPtcDBHUxNuKl7x3BwOf
         6sljiAyDt9Nlemrk3lnLvjqQBwM3Lsc09WxDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777739478; x=1778344278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v7yO7ZonkYSZ10OR4UKmGDl0UDGYZg398xGTn5IO2XE=;
        b=HbXqf7oKDKDq+muDNPvD/0MZbgPvZzv3+Jth17ycFUEGmQ21m3JoxKlCT+RMIcSoET
         JqDcNkaVoyfHBUCNf5i1DwIYzRZWXvMACvnfuHylemfgLFPDTJm+LvGT/7oaatyDejgP
         ynY2+XlZMdOsfk/0kOA/nRnPLIjGq2NmNcKdFq0imerO5bpxuHKeNqRqO6PWxb6jia/a
         Mn4vKc6BA4HKm51UIKBzfYEFJezXwf2bh0InMbu68CWHRGY0MwwlwCyvQIXX98yB6aut
         kyRYI8+BkswBUukh41nFS0ad5ZDhBwkjvfhuufaGoi8l+TJ5A96UWY721R4ViSxzc/UU
         7CVA==
X-Gm-Message-State: AOJu0Yz3miM9s1IaSG9mDzBYLWsW8mT7VoUDnuJrVDwBdsBQJ5HE9JMY
	uvfcrSnY9o0dBVpkax78aUMBhLCuzb2Qc90gRyCWCsdIYCw+gwdx2+p3BaMRqZW7fACdY9cmeLY
	ncyCk3RP8M7XwPa2VJ2dUezBJj3ja7/yPhnjho3KiqelhNqduYG+0NR1sNllhfOS1b0KTHVmgQT
	+ab3unV6CvAWRMVko=
X-Gm-Gg: AeBDiett8LdpKClPCznvISODBIHmEPTbdxxWh9XFYCoRioZHGkg+6qL/DDFc/6PFclT
	Pfq51BFstw8l0+6rhkxH/fL9v7nSnfDPrnEsNKNhZRoHWqLUw2uAgonlh+MkAkLLFWVM/Eom+fD
	iN1uGqaxNgyJXvxYCV+PRzak/8WdQ9Yx00MomiT6pOmAqWUV/Q7SI1dg8fbDZpYWvKczOmA77KM
	q/CplNiEpbHNqjalHB6oZugAhveDF6709AxKzhAQLQiVpvdFtBnbIzGjIVWBC8kF5ujzDW8iq2m
	Ih/F6zfwDOoq6wMd6aUxlpOmwnkDycVz4U6k9KEvgxVSMkVw2hp56AXeoic55VF+g7GzDFiY1Nv
	3EZvS/TDTYylCZVawfI+mqYri5Fwau+j0riNLpARzufdU9ywwWyG6rnwfPOTwWjLmSU/9ARP8YA
	6qxO0/twWklpCOBNqIcpUcYVZEVZgMqz00ubFEMiXCpxIXa/xL7cnxbBBn0i+SdzU=
X-Received: by 2002:a05:600c:3e05:b0:489:1ff1:74df with SMTP id 5b1f17b1804b1-48a9852fbcfmr57591595e9.1.1777739478090;
        Sat, 02 May 2026 09:31:18 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm11971926f8f.31.2026.05.02.09.31.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:31:16 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 52/62] repo: upgrade 2.62 -> 2.63
Date: Sat,  2 May 2026 17:29:12 +0100
Message-ID: <20260502162929.1377831-52-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
References: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:31:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236361

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/repo/{repo_2.62.bb => repo_2.63.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.62.bb => repo_2.63.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.62.bb b/meta/recipes-devtools/repo/repo_2.63.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.62.bb
rename to meta/recipes-devtools/repo/repo_2.63.bb
index 769c7e16ef5..c3cb5a88a9e 100644
--- a/meta/recipes-devtools/repo/repo_2.62.bb
+++ b/meta/recipes-devtools/repo/repo_2.63.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v${PV} \
            "
-SRCREV = "ade45de7707e25d8a11b3beedf754caa44aba34d"
+SRCREV = "baa281d99e59dbf1447524e6fd95b384cadbc06e"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 

