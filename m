Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFA85C4167B
	for <webhook@archiver.kernel.org>; Fri,  1 Oct 2021 13:50:47 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.8314.1633096247344061812
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Oct 2021 06:50:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=C2CsoUWf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id
 g193-20020a1c20ca000000b0030d55f1d984so44158wmg.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Oct 2021 06:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=xmliWqAPnJtFy3E7OSVjIMLT9wP/pnwMewqGLO83Tw4=;
        b=C2CsoUWfoEhsCPl5AlKFGpREEqMmqMreMauRDB6QsiWz4sngMW54iDa+1YngXFf9qq
         oOTVcahJ7njjvjvYIfrhebtjYbXgZlbdMFhZghW17G1sMrIJxPlYKGdnQorByqrifvVs
         aoEfDc17gDG3Kmr6UT7hXSnu3ODhuZZCoWJbc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xmliWqAPnJtFy3E7OSVjIMLT9wP/pnwMewqGLO83Tw4=;
        b=ci3lBaBridjhITC99e6izTeyyWnXvxZdXkB2bJmVwt6UxSKGcIkQkiUY/AieqiPQdJ
         adJaDvR22axNKY1E1BBw4bXfCkbxhKO6CCh3AS94OEDkUyCSj4feAR5gKnAm4brCpctB
         KR30ktXFeYGppoyiNulRoeox6KZuizYUJWJcKiDBdzPDzL90AcSMp3L8zv9G2DGk0+E0
         Rjy1RbkRsXO0JaIvgRvNs+bIrjGJuVoWtT2m4YedrtGipuhcU1gYJL2HN2c+1bTs7l06
         QyJj6dnfbOYGm/8d4sff8uZM4+YU6hSlMOlHGHmtVeNd3EzsEBWgLDxmbTHtqNKL+OCm
         3T/g==
X-Gm-Message-State: AOAM532oPq0kWGNrk85qWAIiZAT1DcodL326e31HpldcArWu3TSO2MNb
	jqPlNfkFFNXL64IfTG+ulBzbqC2MS4VvX/bj
X-Google-Smtp-Source: 
 ABdhPJy1hgKKQvos84AYm5s76QSRSrfCdEDEtAZxfPeAa6QqtS8DC9MaKtSM4W9ih3OKwBlJoNmnuw==
X-Received: by 2002:a1c:a387:: with SMTP id
 m129mr4630685wme.181.1633096245699;
        Fri, 01 Oct 2021 06:50:45 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:415a:6029:9a90:9863])
        by smtp.gmail.com with ESMTPSA id
 o19sm6193155wrg.60.2021.10.01.06.50.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 06:50:45 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 9/9] image: Exclude IMAGE_VERSION_SUFFIX from expansion in
 image tasks
Date: Fri,  1 Oct 2021 14:50:40 +0100
Message-Id: <20211001135040.2251283-9-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211001135040.2251283-1-richard.purdie@linuxfoundation.org>
References: <20211001135040.2251283-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Oct 2021 13:50:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156525

Similarly to DATETIME, exclude IMAGE_VERSION_SUFFIX from expansion in
image tasks to ensure the sstate signatures are calculated correctly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/image.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 1d88ccd8192..c2f32320278 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -434,6 +434,7 @@ python () {
         localdata.delVar('DATETIME')
         localdata.delVar('DATE')
         localdata.delVar('TMPDIR')
+        localdata.delVar('IMAGE_VERSION_SUFFIX')
         vardepsexclude = (d.getVarFlag('IMAGE_CMD:' + realt, 'vardepsexclude', True) or '').split()
         for dep in vardepsexclude:
             localdata.delVar(dep)
-- 
2.32.0


