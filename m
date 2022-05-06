Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DF1EC433F5
	for <webhook@archiver.kernel.org>; Fri,  6 May 2022 06:42:15 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.6414.1651819323754255896
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 May 2022 23:42:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NpOk2SRg;
 spf=pass (domain: gmail.com, ip: 209.85.208.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id a21so7617276edb.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 05 May 2022 23:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FbA5HAdRDDgRrNaUi/qJxXusSrd7anOaA9unP9XzBuE=;
        b=NpOk2SRgJJONxfiglJKZboi69YxpN++iVOXuvpVLJ2fDuFAk+2Hy8QOnTQaNMyCoV0
         693gwuVgkJYv7N50ZPr3Kw1PjWJ+ULgEmYJjHfWCAWBniguLzNsklgnrV9KtA7HxzY/l
         4Z6josoLKKkHUQYyxIY6sKAMPMuPapmsaX/o1wUCdO4YxKtsOVmLpFLnDirKCFq55H9l
         zism6Wsoq8AKpE1D+7O5/kQn9fcoAPzzSpO4JpL8AreWk7TYGJI7DKrYMyqs8hw5jgqE
         j8LuR8ukLoarNnQthq3kjw7G+uCtoH/5QIzItJIFjrykk5vshA4Q1U1QOBB0s+DgN0k5
         +u/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FbA5HAdRDDgRrNaUi/qJxXusSrd7anOaA9unP9XzBuE=;
        b=pAVKZjCpodynTkfe/maWJcKPrak0Oq+mrgER9/lO2GTCBfNuqdbV8rmuOsbcNtT5za
         CtKADokt7zDT2z01kcXxxpYqc2doAAk6Gpt4tKg3swfHU5+V2GzuUlsOK617jimc9mTR
         6jcswyfB3KLxaIukBx9F4Ep5BVOKc5LKqCfTBemkY7QW9VEBPWxxVPqrPphzF9edJ0NF
         dsq6c363NqZSylcFRurjYYR+slf8XfPKfopBKPK0Z8dWHfWqtZKrBfLLiT+kiLC3pJ2f
         2/64iEQ3V9n6dXvLM8SOenzZb54bKNepjSIuHdmThjcyxxZGL7DQCcLtC7nlLnSh//Wm
         E9Vg==
X-Gm-Message-State: AOAM532SSDO3ChVh2Qw0GttiIEHtlBupqcm2cU4VDomrs4Bz705D+Hnj
	aU2km22emU0NCatPwuSYhwCyXHBWz/s=
X-Google-Smtp-Source: 
 ABdhPJyuL77Qs3qoRcv91VlOwyM70Xa+P7di/Ab/jmOsnoYI9U9zUBgXjnqKdUXgJ/KuPe2DP5iioQ==
X-Received: by 2002:a05:6402:2397:b0:426:4967:8574 with SMTP id
 j23-20020a056402239700b0042649678574mr472636eda.197.1651819322132;
        Thu, 05 May 2022 23:42:02 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 s19-20020aa7c553000000b0042617ba63c1sm1819560edr.75.2022.05.05.23.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 23:42:01 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/3] stress-ng: disable apparmor from the correct spot
Date: Fri,  6 May 2022 08:41:55 +0200
Message-Id: <20220506064155.2106140-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220506064155.2106140-1-alex@linutronix.de>
References: <20220506064155.2106140-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 May 2022 06:42:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165321

do_configure uses the base.bbclass version, which can
call 'make clean', negating the disabling.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-extended/stress-ng/stress-ng_0.14.00.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.14.00.bb b/meta/recipes-extended/stress-ng/stress-ng_0.14.00.bb
index ada35dbc4c..e7cc1d1846 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.14.00.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.14.00.bb
@@ -20,7 +20,7 @@ RCONFLICTS:${PN} = "stress"
 
 inherit bash-completion
 
-do_configure:prepend() {
+do_compile:prepend() {
     mkdir -p configs
     touch configs/HAVE_APPARMOR
 }
-- 
2.30.2


