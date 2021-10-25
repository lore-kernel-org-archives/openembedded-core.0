Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 787B6C433EF
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 20:10:30 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web09.2444.1635192610196067594
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 13:10:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=V4ehDYwb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id e12so14921784wra.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 13:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YAT3PWV+LOB1vWOq4J8jCjG/WfF5lYXxn9lWkGI6qDk=;
        b=V4ehDYwblcQH0CaObDK0Vq57wIVzEXTEotZESQCc9uktuR9/hbTmbnFGSCeaUNE656
         jkZxm9aD9NtyJPaKTQWM4eHoNbJnkiPNfkz5msuMiFBwq9eRKhHHWSTuQVpHP8YRyBfF
         hPOFOO1m97tCV4UeoDTex67gHAc0P8FHWT7CA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YAT3PWV+LOB1vWOq4J8jCjG/WfF5lYXxn9lWkGI6qDk=;
        b=cUsHIWiSyzcZPhijNPZTfmezm1LgekdYt5I3f53LIG9d2CS8Vbz5T+gmtuX86UbAdN
         7Nwsy5EPhtMbI+qYJx/0PzN3pDQ5gi40frJHsjPZeyn6TS1UmYHfVJeBsMT2OXKFgUBh
         HpKGnBd7mK3EFZSmiKTjiRyO8T5JxiyXXh8rM+BsUVn6nbkugIq/A1RQZApF1xF7Ew9p
         Qb/qrNVeB0joWNewVnpw7iizJI/Uql0Yx4pvOkhEZHRbbeYFRGS0zlEoVEFv4vs8rEiH
         E/xeCR+Wp52nsEc6j0smvZ99JxEjap1fDpdEfgXKFuJjPq9q/hXHcY9X6WDbi1npai75
         hjwQ==
X-Gm-Message-State: AOAM532dPTNWu1slHuxD6o4xo209GJfPBleND6768MW9oNxOYY3VqUGR
	fWX0XHBvbTVNWWdVidffYRRQNbftvpTGDQ==
X-Google-Smtp-Source: 
 ABdhPJw9z5DTb5BP2xPXSfhEQi8bQYQLNPRAt37KdqfiLWbQaKDeeX4LVLt61PGgXw6ArYaDfQ4C8A==
X-Received: by 2002:adf:f50f:: with SMTP id
 q15mr26827254wro.324.1635192608392;
        Mon, 25 Oct 2021 13:10:08 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:5fb2:414a:7b8b:6fb3])
        by smtp.gmail.com with ESMTPSA id
 d16sm9495556wrq.66.2021.10.25.13.10.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 13:10:08 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] staging: Fix autoconf-native rebuild failure
Date: Mon, 25 Oct 2021 21:10:06 +0100
Message-Id: <20211025201007.3281452-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Oct 2021 20:10:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157362

When rebuilds are triggered, autoconf-native can fail with:

| DEBUG: Executing shell function update_gnu_config
| install: cannot stat '[BUILDPATH]tmp/work/x86_64-linux/autoconf-native/2.71-r0/recipe-sysroot-native/usr/share/gnu-config/config.guess': No such file or directory

which is due to update_gnu_config running before extend_recipe_sysroot.
This only happens rarely since usually the prepare_recipe_sysroot
function would already have set things up and only in the invalidated
task hash cases does this rebuild in this way from configure only.

Fix the code to prepend this function instead of appending which
resolves the ordering issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/staging.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 65a6cd5120b..25f77c77350 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -620,7 +620,7 @@ python staging_taskhandler() {
     for task in bbtasks:
         deps = d.getVarFlag(task, "depends")
         if task == "do_configure" or (deps and "populate_sysroot" in deps):
-            d.appendVarFlag(task, "prefuncs", " extend_recipe_sysroot")
+            d.prependVarFlag(task, "prefuncs", "extend_recipe_sysroot ")
 }
 staging_taskhandler[eventmask] = "bb.event.RecipeTaskPreProcess"
 addhandler staging_taskhandler
-- 
2.32.0


