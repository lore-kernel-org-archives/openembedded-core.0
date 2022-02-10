Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9C27C433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Feb 2022 17:54:21 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.13693.1644515660771073102
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Feb 2022 09:54:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EkU8VEiH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id v129so3936259wme.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Feb 2022 09:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XHJ+q2XVsSuH186x+8b8CViZ/GwkFPA4OZ50cUemibI=;
        b=EkU8VEiHEkGf9lhmjUJCRH/6BVSm+yt4VM9nAq/MaiB6M/T1elNGH/23nB4M5C9GKz
         WhsXAdcXCCigG3T6JMsoD2flPymKPzZFRTkG19JOVyrXYyAYr2/X3U5yu4nB/HzffBTo
         AN1ueGUiS9oDG/1dzMhX47rBDQI/DxrEmXSuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XHJ+q2XVsSuH186x+8b8CViZ/GwkFPA4OZ50cUemibI=;
        b=HOZoqtvRLzUpcCICFq8bfK+tV5exiu248RgaN7SOynl52mHW8RMlsRiy9G4b+QyAuP
         IZmhrzSlDq57giukE3TYVGLArbN7xv49Vva9b0P4SWMcDP7C5NLjf6xCYUWdPhhX7OhG
         NguGV1ohOHCgWV++yhUg3BZxOkXSRbdIz3l9u38t4q254RH6cEOCSvKGt2FSjOD/AMTK
         7tZWUCmkskpyum0Lev24I8uJ2/aBwStLVW8/7U5Qh5oxU8eY0HVErci7Hp+Jnp2nuf8g
         YD+TLrdYhpgkOXASLfIx60RGVBUno3XtNywgZyxLruxYROZCYwgyjgvfYUGEtZ8Ad9hy
         JGLw==
X-Gm-Message-State: AOAM533UcnNkGN7RRcxhSuPL6ELGo841EU82EcpfnWdVFGP0kTKajXpS
	UPD/B1QywzQuXAvMCLoERmWKPkZGoVzVBA==
X-Google-Smtp-Source: 
 ABdhPJzSQ/k4YtdZLsVo2dm09xFjkv/5PSuV0ucVO2Yzje4sru89a76ju6FqpzdD9h/NjA/DOEjkqg==
X-Received: by 2002:a7b:c248:: with SMTP id b8mr3164374wmj.194.1644515658982;
        Thu, 10 Feb 2022 09:54:18 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:7dcb:9837:5409:449e])
        by smtp.gmail.com with ESMTPSA id
 n126sm2178461wmn.27.2022.02.10.09.54.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Feb 2022 09:54:18 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] buildtools: Allow testsdk to access the network
Date: Thu, 10 Feb 2022 17:54:16 +0000
Message-Id: <20220210175417.2695557-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Feb 2022 17:54:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161623

Some of the buildtools tests test network access so allow this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index fb28930656b..166671316ac 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -110,4 +110,5 @@ python do_testsdk() {
 }
 addtask testsdk
 do_testsdk[nostamp] = "1"
+do_testsdk[network] = "1"
 do_testsdk[depends] += "xz-native:do_populate_sysroot"
-- 
2.32.0


