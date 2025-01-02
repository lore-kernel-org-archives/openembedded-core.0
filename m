Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 507F2E7719B
	for <webhook@archiver.kernel.org>; Thu,  2 Jan 2025 09:41:27 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.5200.1735810882046007294
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jan 2025 01:41:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PS01OMHw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4361815b96cso73262405e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 01:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1735810880; x=1736415680; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AD0ctLERvvsDujBnSEntSy8BD/DJSeiH0RsoOf3N8yE=;
        b=PS01OMHwCtH5A4mt+36mmHjnL2+MmR9BZ5XYU+cyF3I37FjvSvm+3mGuQixzuVCOst
         tGvPedhjTl06zr121tiVZ1r3yhVaGcB4YgnJP5Pn+5EsDPpHToVhMpI3S8wicDYJ1Rk7
         BTsgzbT6GVcyJ3a+K21Hyym/drt4V5IX8WEl4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735810880; x=1736415680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AD0ctLERvvsDujBnSEntSy8BD/DJSeiH0RsoOf3N8yE=;
        b=wN1KGPKhRk5PzX+1QpZt44IWsj9e7ci/f6zZMSVad1CfdJ/7rDMX4JlUbCnR59fxTx
         gAiefWkxKCfJSLDLdctz8Rd7UZ9phqaaeYxWElZtVKAZJdhlu7zRXvD1dxQix7KEE/aJ
         k21ng3s/3p/l7bDXVVmjdr+V+cSrlfkbZ0TdH7sqlKS7tmeTwwF3j7JFLsbfUlvEXf6V
         uh3w2zjGbY+bjDUzXrO3xB9p13G0MfY0nKpn/BDqEekMMmUfyFt8UwSMZbgjBQrHrQMm
         rL58BI+XQAYs+7LhgQVoOYx2VJCSWUAkZ86KedioTQ133KZkhgrTvll5BRgYarfvZfux
         eRoQ==
X-Gm-Message-State: AOJu0Yzo638arklAvxYGiRpPqhicrSPV2YFrPCdokePsLltVfK5XB0g2
	OFFCCccvowgNiY0kvRxb6bB/g2sqLhIced49X+7I/0u1DgqSJxQ9rSzXzx3sw0nRJV6nrXOjUiE
	oE4o=
X-Gm-Gg: ASbGncuxKvyqnqT5Iy2vMBjEnDFsTuhvjDVo2YE78VP23igdQ7bn5i2e0WT6JTmBq6d
	+Y6UU81FkZ6u9miLaQC1jNORJonzMGBTyHhbFffPGQ3UopLpyryLrMOLMWTJ9qeNnA/bw3n2MWk
	OaRRi7uc/KBw/e27hn282U/+PmIxVY2R9e7bidnUBF/H9KCpV/+tf2MVLwwad+eEm/vLTchKPRs
	trsPbLsprF+e5qnEN7a3CWTUD1ooW5Ip8DURPbHnlm5r5mpv3z8K41egkZTgDLwZMc2cTwVjOh8
	fBfOfbaPVw==
X-Google-Smtp-Source: AGHT+IEXo62giCWR/7+q/u/7rZ0XEheNlK54vVMuTJzt/XecpMKqqrFCAUUXdDbMEr6TC2hoCk39kg==
X-Received: by 2002:a05:600c:3b23:b0:434:feb1:adcf with SMTP id 5b1f17b1804b1-43668b5f3b7mr332517045e9.25.1735810879870;
        Thu, 02 Jan 2025 01:41:19 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ae2e:9f02:55c2:739d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b119ccsm479785625e9.24.2025.01.02.01.41.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 01:41:18 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 13/21] puzzles: upgrade to latest revision
Date: Thu,  2 Jan 2025 09:40:44 +0000
Message-ID: <20250102094059.322187-13-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250102094059.322187-1-richard.purdie@linuxfoundation.org>
References: <20250102094059.322187-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 09:41:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209273

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-sato/puzzles/puzzles_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 17ac1fe7e23..677a9e291e0 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -10,7 +10,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI = "git://git.tartarus.org/simon/puzzles.git;branch=main;protocol=https"
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "8e83f39eb989d36f10fcf4be7c4dd5eaa0e69f02"
+SRCREV = "79be403101d055d2fde3611a5f133135d4094ee9"
 PE = "2"
 PV = "0.0+git"
 

