Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26355C4829A
	for <webhook@archiver.kernel.org>; Sat, 10 Feb 2024 07:46:00 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.10073.1707551153851757265
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Feb 2024 23:45:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=R+yDGBuB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-33b728b6981so52924f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 23:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1707551152; x=1708155952; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Md611NgevfxeSLKbHCO9S2mhxSc8gp5yvGL72ZGhLoQ=;
        b=R+yDGBuBMUp5BN1NyRxsUS2loaDz0JSLL/YFzQmNn5N9hgZURHU3kDBdCS8TfhBz97
         Si0IJlZDDNX5oEho5dE+p8Ecu1dz70nTXUixN5ZB4upUOr1iZqUuWYs1un1qG1A5HByH
         HuapViLjmhp2HMoLPpHh/tuOW53pNElBp2Q18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707551152; x=1708155952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Md611NgevfxeSLKbHCO9S2mhxSc8gp5yvGL72ZGhLoQ=;
        b=F6BWpd9nvU9PwpVcmPOoI8oysqbBY0XPhfhah8IvngZVV8+LF9VaRdQDRiYKfOxC8D
         wfqpyvdBwEYEHhL+jAqQzZtKBrQgp8CQlQfmyvkqEtKfRGgGYJF05ZQsOt4sRizqpPGr
         QDel5rGmJv4jt3HGXtcrZEdD16BseFj2cWw+y+hND4/U9qu7TYaivOc5MINjD9sJJxAB
         1jZ5P7JW72bkmkVFSP7kAbSgbR/w+I/Sdvggoy8uBmPfa+R0utSl+7pLlD8677bbQ3Zn
         OEsf/864rhHw2YqxbiKKblmzuLBEReHlryUi3FFggtl9Ob7omsMGpreQnK80R3LIawCY
         x9gg==
X-Gm-Message-State: AOJu0YwWpn11TRroM9mZ+LaAtybpYGMAB24eWA3y0b39s8pLZVLtsrDK
	+dgW5hDhZhNpVIDfBBSz5wtbAcQ/SJB5zDfL5mZxK1rXFGSJBYdzHFd8SKDH1QSKgINTVkNhl5G
	4
X-Google-Smtp-Source: AGHT+IGAUmjQgv/koeWnoh64+f0TALhEd3XmxNjzVmcs0YvGnqDrtOWbEdF3iuecA53DLjS4aFuYwg==
X-Received: by 2002:a5d:4e8b:0:b0:33a:e7de:aa8b with SMTP id e11-20020a5d4e8b000000b0033ae7deaa8bmr849845wru.26.1707551151913;
        Fri, 09 Feb 2024 23:45:51 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:c350:b3c8:3bca:cef1])
        by smtp.gmail.com with ESMTPSA id a15-20020adffacf000000b0033b39cba5e4sm1147240wrs.116.2024.02.09.23.45.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 23:45:51 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] insane: Clarify runtime/ warning
Date: Sat, 10 Feb 2024 07:45:50 +0000
Message-Id: <20240210074550.3489077-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Feb 2024 07:46:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195254

We should be pointing people at VIRTUAL-RUNTIME, not virtual so tweak
the warning. Try and make it clear the difference between the build
dependencies and the runtime ones.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/insane.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index 828f618cda1..fa950652921 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1611,7 +1611,7 @@ python () {
     for k in ['RDEPENDS', 'RPROVIDES']:
         for var in bb.utils.explode_deps(d.getVar(k + ':' + pn) or ""):
             if var.startswith("virtual/"):
-                bb.warn("%s is set to %s, the substring 'virtual/' holds no meaning in this context. It is suggested to use the 'virtual-' instead." % (k, var))
+                bb.warn("%s is set to %s but the substring 'virtual/' holds no meaning in this context. It only works for build time dependencies, not runtime ones. It is suggested to use the 'VIRTUAL-RUNTIME_' instead." % (k, var))
 
     issues = []
     if (d.getVar('PACKAGES') or "").split():
-- 
2.40.1


