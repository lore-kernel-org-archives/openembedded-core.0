Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92BCFEB64DA
	for <webhook@archiver.kernel.org>; Thu, 20 Jul 2023 11:24:55 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.10527.1689852292254969507
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jul 2023 04:24:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=eJDy1qyq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-3fd190065a7so4991865e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 04:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1689852290; x=1690457090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=vNBBxyhty/kJCEmyYZZH6SYwPivt0tVEBIAjBGtX1mY=;
        b=eJDy1qyqYTtnj975bVqz2Sl82LJlhGCSd6ViD54obxTE7Cpt8WG+C1x3oIz9Dh9AJn
         HAT24VFrSUGXXAMIodsUMoVvasUNLftiLUTEvBlzpYs/YC5POXR7WZDjG4ZTyF8/8DqM
         NdCwqnzNu6qcrlYlrQQRiSZnH+MSdtv0OMc2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689852290; x=1690457090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vNBBxyhty/kJCEmyYZZH6SYwPivt0tVEBIAjBGtX1mY=;
        b=gCoXOfy+47WeV8KdgBIY+3okHE0yjv0FHKQ753vw/tUguLI1Zgn73bTBjgM/LiY6XN
         ICjJKnckWjRslgrWn7/+S/jjxwxdA786PMhQlP8nrC6oX68RtxbEBFlcFeFtyLrvhlFT
         MEH1GSIZJ6wRLN23dj62l+98+zvyMmEhMmS2bgIqkSYy8urDcHcFMJuCwoNGXkpvfzP3
         fV7T+qxs6z8V343sY6k96WpvskPdNyRgbiWZskYHbGkMWFIcYOH3ysdW+hNndRGPKsSW
         1aIRXiTL1N0getVY3f2J09gvfc3MM0wHBfCouGnqTi6KzRc0eb3oD2KXgRXfw6JuRJJS
         nlnQ==
X-Gm-Message-State: ABy/qLbcFFRBoOBbl4FZp7kv9WatMyDtHSVXMpzALvy06AJEUYlaOQVg
	Vx0hrl+IgmU7XQjJJfN3LvjHCyZrvFs2Qtza0J0=
X-Google-Smtp-Source: APBJJlE3iHNbm+Of1rvb+x6G849Ykgy/gGExW02qLcErvcFmGgIRijVD77/e3/R2T2jhS1bk4HFpEg==
X-Received: by 2002:a5d:5092:0:b0:313:ebf3:850e with SMTP id a18-20020a5d5092000000b00313ebf3850emr2385306wrt.37.1689852290147;
        Thu, 20 Jul 2023 04:24:50 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ba5b:ff9f:e968:6d69])
        by smtp.gmail.com with ESMTPSA id a23-20020a5d4577000000b00314315071bbsm1085605wrc.38.2023.07.20.04.24.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 04:24:49 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] glibc-testsuite: Fix network restrictions causing test failures
Date: Thu, 20 Jul 2023 12:24:49 +0100
Message-Id: <20230720112449.854654-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 11:24:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184633

The check target for the glibc testsuite uses networking to access
a QEMU in system mode. This was resulting in large numbers of test
failures for the x86 targets that use it.

Enable network access to resolve this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/glibc/glibc-testsuite_2.37.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glibc/glibc-testsuite_2.37.bb b/meta/recipes-core/glibc/glibc-testsuite_2.37.bb
index e8ad2a938b1..2e076f4b0f4 100644
--- a/meta/recipes-core/glibc/glibc-testsuite_2.37.bb
+++ b/meta/recipes-core/glibc/glibc-testsuite_2.37.bb
@@ -16,6 +16,7 @@ TOOLCHAIN_TEST_HOST_USER ??= "root"
 TOOLCHAIN_TEST_HOST_PORT ??= "2222"
 
 do_check[nostamp] = "1"
+do_check[network] = "1"
 do_check:append () {
     chmod 0755 ${WORKDIR}/check-test-wrapper
 
-- 
2.39.2


