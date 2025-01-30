Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1B59C02190
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 15:35:20 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.18077.1738251315650109072
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jan 2025 07:35:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=KZSEQJYK;
 spf=pass (domain: linaro.org, ip: 209.85.167.53, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53ff1f7caaeso963744e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 07:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738251314; x=1738856114; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E86CcozagmLsYaKrTI35C23FsWAcVJRx2zN2PM6uAWY=;
        b=KZSEQJYKBj2H5eT4jJqcVzXMUdMWgrLUdZzrfRYb91KrVzFyxOWPgyMClLsTyg3nwi
         aCNbA7RlS0JjyKrJqKanEqOlXV66Teq8oRfvw9VzIugnm+tgKR3mkfI8PkBSmDoEB8st
         bLwig0A9DJB+ftDpSs/YdtmhYzK49VV7v8efeui/ABMz6wmJP2ltQLnc+mUP2v0aZqAO
         fmGlwUfIRVRKzb8osFf1+yy0ob3njyo9J0tt1/8yoKEuz9ddxOq4Dp2C3hS2Wb5Xyrj/
         rrN8OQrh1gFUC3LzR1YiJcBBYnr3qLsHSSw9zb9sx6dtDKxtEc2Bg9NmcUFR5VXmWkok
         gtlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738251314; x=1738856114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E86CcozagmLsYaKrTI35C23FsWAcVJRx2zN2PM6uAWY=;
        b=gFPH6CTvlqprwzLqgajyJBfhLWXGDxToHc+vsjsLHP1tD1XlCZ8LNjvAzHqFfiBiDr
         4ctxQ0amMDP7tj2Er3AhWnHQ0SU9n/1oew8VX28q5+ZFOs2iFU/89zHJQn+l+Y+gB9eK
         XgqUj7m0cn+Y+ZkKjWvo5mLchhO43OCK4x1WAiftfuvsO3RzeYdO6/ZdjVHLtGnAs5yw
         DpXGfc0fQOhuYqa9twhCwQVJ1zGoT9xzUXinZaFLrz8GR4GfR+gIdTlLfPCT8ejGNkUO
         eBxgKM+VAiJMiLK8pRJUrO+kfV/f99ullVWQZOmfKh++3FSSW55CB3v/X8u16msMO6s6
         F0Iw==
X-Gm-Message-State: AOJu0YzLMe5I1ZjEJqWwbgQkTQQz7j0Xjrorf13KJdTrtwLCRSU63Zf1
	wZtXQJZYaE0mFMcbApnOsMxtBAWpzpT90GFS/lNOeCEPjDkT22MEM2pFEvpq3YhDsbEehUfTcx9
	07Fc=
X-Gm-Gg: ASbGncuXRZ/GvYcUxqNkKmoh/6qJJHe0nnw441tNxiV6PR81inPcfB7TIWi+MPROEcT
	VaIXB3b+lmqm2SJI3ar/KzoU9sVAElc4Bxu7B0MT1VsBwQCPJN7mr9Ll9Z54a7eMX7YW3e4cWQe
	8UESTMzI3T60Y7SZ3bh0afB7aHLJRh0BTSlC0yuJEp8tdMX/6P5s+liyeKeJctoI29uzC6HCPlf
	RYK4oaK7FP42QKrNS1Gzy04rNOqLMh3MZjAYI1JB32jeqieTJ1Prg9BkFwvidGj4SuHeL1Fx39c
	iyyg+Lok/Hmugq3Qprl+rZKoj3SWxqK8gAWG+V86U9jyLwx/h2ekxvbbjyG9
X-Google-Smtp-Source: AGHT+IEWpCLU1/4xd6Hv6t2GMKP2hii0HL+IL8Qm+wO4A3BbmazuO1oPvrS0pevmXXQwnvfmg4ZaXg==
X-Received: by 2002:a05:6512:3a8e:b0:542:8d45:cb3e with SMTP id 2adb3069b0e04-543e4beb1d2mr2673878e87.18.1738251313788;
        Thu, 30 Jan 2025 07:35:13 -0800 (PST)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebebecc3sm186125e87.242.2025.01.30.07.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 07:35:12 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: meta-arm@lists.yoctoproject.org,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 2/3] uki.bbclass: capture ukify command stdout and stderr
Date: Thu, 30 Jan 2025 17:34:34 +0200
Message-ID: <20250130153435.1074941-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250130153435.1074941-1-mikko.rapeli@linaro.org>
References: <181F17E3A23753E5.21193@lists.yoctoproject.org>
 <20250130153435.1074941-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 15:35:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210450

ukify tool can show important warnings and even errors
if it fails so capture the logs.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/classes-recipe/uki.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/uki.bbclass b/meta/classes-recipe/uki.bbclass
index 92f690526d..ccda042ab4 100644
--- a/meta/classes-recipe/uki.bbclass
+++ b/meta/classes-recipe/uki.bbclass
@@ -190,6 +190,7 @@ python do_uki() {
 
     # Run the ukify command
     bb.debug(2, "uki: running command: %s" % (ukify_cmd))
-    bb.process.run(ukify_cmd, shell=True)
+    out, err = bb.process.run(ukify_cmd, shell=True)
+    bb.debug(2, "%s\n%s" % (out, err))
 }
 addtask uki after do_rootfs before do_deploy do_image_complete do_image_wic
-- 
2.43.0


