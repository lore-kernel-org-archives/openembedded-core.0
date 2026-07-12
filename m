Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5F89C44508
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 18:43:37 +0000 (UTC)
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.945.1783881813260876875
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2026 11:43:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=jCAZv7TM;
 spf=pass (domain: underview.tech, ip: 74.125.224.49, mailfrom: vince@underview.tech)
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-664b05d408bso2128903d50.1
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 11:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783881812; x=1784486612; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YLHYSayuAI0+PNxiORMP6oLepN3WwbNmmuhzSMJKvkU=;
        b=jCAZv7TMNwMBDeP1czbfOdalyK91iRXa/6NL2aEIgutPTozdRHHAZ1p1VpdaT8R5Yr
         flhPs47XwQeA9i0/iJZ7KFLDZRNw9uyTHOUwxfANjtuT7n+5b3Yz58vWthgxxfYDJ07l
         BrpJdZUmdnGBwZeCEjSOnHc0cmEiInlqH04kP/LtKNTwBCO3Lvbz24l/sZBxBwphUxeC
         AkIWpKK/5np5ZtzNUGM2K2jMNo1aQ0wetnK7F12wTT8woTlJnFXeyumy0Gtj3w5Sp/SP
         0utfXJSeDhFUJXkB9BaUxzrI6He67A6wtADM98p4ls78ny0ejko4kZBu48dI09n07WdT
         9Zfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783881812; x=1784486612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YLHYSayuAI0+PNxiORMP6oLepN3WwbNmmuhzSMJKvkU=;
        b=Tmh7biWaa2bTEP8sulHtWAkhpswCJPgyxR70L30JiQnMXpSMeAJ0OUtOGIu1M9o9df
         ha04EXRQeTYWgY2JB+8ZvCKAK9z41dTdsKv2bWsz5ed1Jq8Luu9ptWeDQ1balyYWW/Tk
         C4g0dfhUtDFvShjTrBJx3WVxmaPsSG/HjgKIYNVzgP9bx7PsAq/iKOcppF/k3QyKcjHl
         HuimSoRs130K/ngsksiZ66qdiJQ/CH7LPikLT/APBysQ0OI0M7I8oUXNJFUUARmjomVT
         Vb6CfhcEM41u1yhvrjmW2nCbp5i9qCke3jd647IcMfSORTujm8IbKrwfiPMjWmXurAKa
         vl3A==
X-Gm-Message-State: AOJu0Ywn7VQMTdt8Qc5IUx4aM1g7FClD2DL+o+h/L5aZL3cpuLHZk71a
	oyjJvfNCKqyX34SClDGm7jcyYBilVtoqQChUWN2eFeOEhRNHb0jd3cnrZLFvODmwF6Vu3klIvph
	JDKB+MRk=
X-Gm-Gg: AfdE7clHJ7vkc0PTEJssblq386qmUbLqDoVP11dYOZMp4xOrQNwr6hinKDqpwa0mvt0
	q1c0u/W4vtH7FW13vEfSB6VEbBwNAAuaZQLPxHqgVV55c4Lt9vVix8WzlEm7Tb1Px2t/xgt0D4L
	c9xmygPhQSORgi6rOwWltZQjcr3MttuRQ+ULOtNGrx60m+s1/WA656CgdU08D1YQDPVxwQluhxZ
	Y5PqmMcUozGooqijopTrv4yAexS/xz1WN/Mj6GGDSyPHeAiAmO4Vuw1pQV9wFLUp0rTE35r+rxM
	cYP53F2rAlyCGSTWvyZhPc+yX2wj3YPdPpWiYLzdn7zzgjbFvsV9uvSHT2/Jlsz59sLQfJz64Qy
	/VsFLSSOYSjei4DO/ET+eHVm0VZAt1yiKDmWPjcgQy4jEYcI8m+eoYc7PC3FwajR5a22+KLdNYr
	d4A+6hlHHFVly14ZYNXdTjqNZ1
X-Received: by 2002:a53:ad89:0:b0:667:9fe4:8d8a with SMTP id 956f58d0204a3-667d7bf4573mr3467742d50.78.1783881812310;
        Sun, 12 Jul 2026 11:43:32 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66787b23b35sm11768236d50.21.2026.07.12.11.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 11:43:31 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v4 17/27] hwlatdetect: rename kernel prefix
Date: Sun, 12 Jul 2026 14:42:57 -0400
Message-ID: <20260712184307.3259642-17-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712184307.3259642-1-vince@underview.tech>
References: <20260712184307.3259642-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 18:43:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240807

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uniformity with builds if
KERNEL_PACKAGE_NAME variable were to
change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-rt/rt-tests/hwlatdetect_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-rt/rt-tests/hwlatdetect_git.bb b/meta/recipes-rt/rt-tests/hwlatdetect_git.bb
index 2dcc80965a..7abbe25dec 100644
--- a/meta/recipes-rt/rt-tests/hwlatdetect_git.bb
+++ b/meta/recipes-rt/rt-tests/hwlatdetect_git.bb
@@ -23,4 +23,4 @@ do_install() {
 
 FILES:${PN} += "${libdir}/python${PYTHON_BASEVERSION}/dist-packages/hwlatdetect.py"
 RDEPENDS:${PN} = "python3-core "
-RRECOMMENDS:${PN} = "kernel-module-hwlat-detector"
+RRECOMMENDS:${PN} = "${KERNEL_PACKAGE_NAME}-module-hwlat-detector"
-- 
2.43.0


