Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 063A2CD98DE
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 08:04:22 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.105055.1781424256079449592
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 01:04:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Dr0wb+lx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490ac10e337so15118215e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 01:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781424254; x=1782029054; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8NceAk5UWdEPQFIy/IJJLsjtGctaEaDEhjzMHO62F6U=;
        b=Dr0wb+lxnjujvgopN8SdTuhI/NUxfBUfXvla2SnIfrAeZtaPhXqohqDWTm9s4UzoEO
         E834JnH9D6hW7+IbHEOSjBz9+jVbBOZHRazK8s8xnNcOAB7BFedJdx83hskYVw0/HogY
         EbF1dZ+mTjCduggi9FlyE1Shl33Kf9hFB8EOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424254; x=1782029054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8NceAk5UWdEPQFIy/IJJLsjtGctaEaDEhjzMHO62F6U=;
        b=FIG8HuhlwbuQQzbKFXfjJf700r+1uC2n9Ql2gfWkCgE/MwYitA3Zc9qNWeGPL5/LKq
         p5h6W4g7+zjwfx6ALFyWgFSot0HIDF/xbKABktXiwLRixGQ1VpKjnXi6IzCPYZdNREWQ
         ly+xst80uoB2TMCP0OKq3QeLJNWQuJb1l3BKF70/pZeSra6MrAMS5f8Yqrkl1qX8NRo1
         DrdILYKlq3hxfL5tmEcSFTPHqq2A91Q2TUEpL5awP85pahUbaiCjNJJOqvbXt4yWNrqX
         rit4yaKkA/8ey7v4aZm/DBsqrwgBFvNCB0tp8+5hD56H5DsMkOn6f/irphZQLot8vocJ
         /L8g==
X-Gm-Message-State: AOJu0Yz81vWgQW00X3+/231mjjZ4np+M96UbMu/UpEU3A7siGaudHLDZ
	zku3GOsYkBtrhTRdio3TKDti15iMQ0if6nWjXwdIS7KDc86ra1sq3i6ihYR9ElGVRjs/MfiK1tu
	lMA9N
X-Gm-Gg: Acq92OEcmC18uP79kojlVshwkgXH4unT2jrtB9Glm70gkfhwWwuGxbcRs6Yu92PWsV2
	XmWOnZRv9mMRFxmUQXr3nKXSYvndIqviNNrQftKQA9/+52FBnsJAD+XQJEqGHRsORW64c8Sf0Gx
	Yl2rhGFgSuTDqvjui3ayEJkAphtPK46xHx1w2oV7hpoAyNTx5lhKvUneD9T/0eJfi9f0OiAAWwN
	5GF9UtgLKvjsO8p0IcFRNUOCPG0xlh6hxDQkhTdFXlGbSVgoa5q1JSCKwjat+n03SPtErQlKw76
	7jELpKtcM2rLW6YbFxgjQHu6vdzmHKGzITyBvMWGIArCkuFeBdcczwDpc7jH44cXnZvcb0HdjsE
	4bGj1YNP6McmmNJobiK7Iwy+1zrZMk3dBxQjnOHlz+9PnLNjIoz9mCg1yj2CQFnxjPVzNm0RfWm
	XVopu+1cKIyS8W14NgQ+kHvzhwoGIpV7g7ncu3BBZmv3n0/RyPJ3jj
X-Received: by 2002:a05:600c:47d3:b0:490:d354:bcf4 with SMTP id 5b1f17b1804b1-492200e2409mr43382885e9.27.1781424254307;
        Sun, 14 Jun 2026 01:04:14 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b23b:4f5a:d2e8:6789])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edf89sm149999065e9.1.2026.06.14.01.04.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:04:12 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 42/56] repo: upgrade 2.63 -> 2.64
Date: Sun, 14 Jun 2026 09:02:53 +0100
Message-ID: <20260614080307.4017177-42-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
References: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 08:04:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238726

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/repo/{repo_2.63.bb => repo_2.64.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.63.bb => repo_2.64.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.63.bb b/meta/recipes-devtools/repo/repo_2.64.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.63.bb
rename to meta/recipes-devtools/repo/repo_2.64.bb
index c3cb5a88a9e..8cbf223571a 100644
--- a/meta/recipes-devtools/repo/repo_2.63.bb
+++ b/meta/recipes-devtools/repo/repo_2.64.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v${PV} \
            "
-SRCREV = "baa281d99e59dbf1447524e6fd95b384cadbc06e"
+SRCREV = "2d54384a5e59fddd0626ec091cc0ad11511d834e"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 

