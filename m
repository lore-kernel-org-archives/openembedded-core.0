Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 490D6C54734
	for <webhook@archiver.kernel.org>; Sun, 25 Aug 2024 18:50:05 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.37007.1724611797705399604
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Aug 2024 11:49:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=wnGprGOS;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7cd9d408040so2456168a12.0
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Aug 2024 11:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1724611797; x=1725216597; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/odtV6tlh5TXgDyANMJxi40NNE+X8c2JICDo+9S0JcQ=;
        b=wnGprGOS0SwPhZovVQWD2iDlP6JIw2kU0IPiq8mqhTGnoyUOILWnfzwQBGmmDLUsv+
         FVvwm8HfRx4xGrTJl8/0jJdeNUXtLuYMmZ5+0CPeWuO0MHFuBhhHh9BNjN8fhmrszuF9
         oPR4CVyKaOPx4ypuL2in7Yn/Kk0q445Ez1IF4jL53IMxzbo8SQiAbEPejaRUbYKtVaea
         r4TNzNUdNhYZlLNKNrZp/dAKCxwTx+nJBPWvCCV7MgyG3lvVb++5w8m838BRuCXk11y3
         Uuz8jSRlhk/nwtWvX6CbrAwMMEpZEl/K8NETo3/lEnf/SVXqx+ulQ1yenPwxA2QQtJ8l
         RdFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724611797; x=1725216597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/odtV6tlh5TXgDyANMJxi40NNE+X8c2JICDo+9S0JcQ=;
        b=DG0YJ4ujRA7HlS9TA/VoGJsDIjdINxER038mCDnCLixJ36vjw+AM1ibXQxCNqc6bR3
         RZ+qz45zQw3SEojyVvbV0JkmU7wvuRoXUWtFE0pllZFfcTYtQFLCkAGrsfonmV/+xFmx
         xI20uejojtledI7gUJeJspDp/TI7YcBko+hGPkUsAS8R38yzoLhPY5AtFaxDZgyMdEio
         846dEHHgyky//RhpO4S3T01DqwjbSxl4WBXvdLyMYipFG64W71SGU+VahlicC/BCT9p5
         rvkCeW5y+lAtaFRKv5VRO5wLGl2ccYJm71vPWMexZaUJ37IToKXhXmjiD3ifWHE4jvJG
         FHfw==
X-Gm-Message-State: AOJu0YzrtvrcNR1tEvIqfCP03rYFbiVAXqscUjEe36Ez9ytrZACezm8X
	9uYSDOc8+ExNsyVFnVmtRP3ATLXjxO32exAirLvUwYjtrFGU81TRpvQ7aDaSvG0vGvYSMZGEEEB
	NGpQOWw==
X-Google-Smtp-Source: AGHT+IGeZWWLDei7nR9tRaSDAd7BbzCmn3nWixBzFfNwFlRo/mn/JSw/F6LoFTBUF0FItKgn8ZyKxA==
X-Received: by 2002:a17:90b:356:b0:2cf:fe5d:ea12 with SMTP id 98e67ed59e1d1-2d646c4ddb0mr9663805a91.24.1724611796925;
        Sun, 25 Aug 2024 11:49:56 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d61391fe09sm8294216a91.19.2024.08.25.11.49.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Aug 2024 11:49:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/6] libyaml: ignore CVE-2024-35326
Date: Sun, 25 Aug 2024 11:49:46 -0700
Message-Id: <18e011245dd978985eecc368c503822f61d52f21.1724611692.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1724611692.git.steve@sakoman.com>
References: <cover.1724611692.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Aug 2024 18:50:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203726

From: Peter Marko <peter.marko@siemens.com>

This is the same problem as already ignored CVE-2024-35328.
See laso this comment in addition:
https://github.com/yaml/libyaml/issues/298#issuecomment-2167684233

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/libyaml/libyaml_0.2.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libyaml/libyaml_0.2.5.bb b/meta/recipes-support/libyaml/libyaml_0.2.5.bb
index f7c29e7e0f..e30dc5a43f 100644
--- a/meta/recipes-support/libyaml/libyaml_0.2.5.bb
+++ b/meta/recipes-support/libyaml/libyaml_0.2.5.bb
@@ -19,6 +19,6 @@ DISABLE_STATIC:class-nativesdk = ""
 DISABLE_STATIC:class-native = ""
 
 # upstream-wontfix: Upstream thinks there is no working code that is exploitable - https://github.com/yaml/libyaml/issues/302
-CVE_CHECK_IGNORE += "CVE-2024-35328"
+CVE_CHECK_IGNORE += "CVE-2024-35326 CVE-2024-35328"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


