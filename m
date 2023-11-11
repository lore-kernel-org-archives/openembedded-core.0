Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37F26C4332F
	for <webhook@archiver.kernel.org>; Sat, 11 Nov 2023 15:03:44 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.53374.1699715017307026577
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Nov 2023 07:03:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ljzK8Nw7;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1cc53d0030fso23662475ad.0
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Nov 2023 07:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1699715016; x=1700319816; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pLI4Ab2c61bGJmlpV94OlDnyW4FyFGMJyyA1fnGvw6s=;
        b=ljzK8Nw7L0D1Ou8rDxdaUX3ryuMMHQoTs7BDL4403iyhPh9OKhOBY757ft8YSNLvZY
         A5JG5jHeplWtbVWPQTJMRblf53Lj2MgKeWvTP++OLfcz6UQhRZXdR5ceeUnLz+gvbGFF
         ORhIijXaP2DhfccmNBmeEeQRJPpREU64UN2lWnviAMWuRYBu0Um8AQ/BLSb/1fHqkWLn
         gWto1ZBIVdY7o0ytCEDR70bczfP5FNh1E94StU/vQVLSj+l+dGeW32B60v+2Fh/rlPiS
         ny7A34TfPPzr9QzojYeeWninEp3m6HmZYbAOefnd+dje/4X7kYsHzp+WeTjBuR+f043l
         Yh3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699715016; x=1700319816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pLI4Ab2c61bGJmlpV94OlDnyW4FyFGMJyyA1fnGvw6s=;
        b=PQpgRT0LRzuQw0S62UksVHTvKooR54ezR15cJa58iuj2mN7byJS64dEo0B63uOz6v1
         OKuckUZZtB2PXYlzBGw9nJAVsmz8+Rx4CZuq6EQXlVXxurQML7aBJz84HqikdRcc9tCM
         i4TlaecqhSidQkzrvliYm0HSije9uAZEqCs2rrWnyjJjk/w9zR5yG6DlmMnSALzOJBYT
         pB0Q5bFvLaaTVjXGRQ/uVFQAXwPBc+Fo2VLZr6QiKFp1qnMQMEvsDgm75cygsI0YPXel
         VS8aTl2re6hOWhOEHVgjaSQLfFA7/RhtdoJxY/B2G9kTDjEWAUfXb9WkxsxT+XenOjtO
         9mjw==
X-Gm-Message-State: AOJu0YyE1ghlVHWRphogS6ZaXGPOPSZ2QTyImU6QWKdayF3NxrbZ2IlX
	MaZPv6RwIF0wcDkZZ85pfWvAa4wmzcSM3VOxjj6zPg==
X-Google-Smtp-Source: AGHT+IGb1N9CffPRwfAQE+8GS6anJLbnP3HJ/dsjDvGT17/9GfeZGU0SQYNySB5hGyhkJO0h7IG2Vg==
X-Received: by 2002:a17:902:d501:b0:1cc:33e7:95f5 with SMTP id b1-20020a170902d50100b001cc33e795f5mr8384673plg.33.1699715016397;
        Sat, 11 Nov 2023 07:03:36 -0800 (PST)
Received: from hexa.lan (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y18-20020a1709027c9200b001b53c8659fesm1379200pll.30.2023.11.11.07.03.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Nov 2023 07:03:36 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/15] resolvconf: Fix fetch error
Date: Sat, 11 Nov 2023 05:03:02 -1000
Message-Id: <e824891904358a385f90490bac7098c58cda41e4.1699714834.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699714834.git.steve@sakoman.com>
References: <cover.1699714834.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Nov 2023 15:03:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190428

From: Naveen Saini <naveen.kumar.saini@intel.com>

Branch 'master' renamed to 'unstable', which causing following failure.

Error:
Fetcher failure: Unable to find revision cb19bbfbe7e52174332f68bf2f295b39d119fad3 in branch master even from upstream

Switch to 'unstanble' branch.

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/resolvconf/resolvconf_1.82.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.82.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.82.bb
index f482bd297f..5f0a5eac70 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.82.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.82.bb
@@ -11,7 +11,7 @@ AUTHOR = "Thomas Hood"
 HOMEPAGE = "http://packages.debian.org/resolvconf"
 RDEPENDS_${PN} = "bash"
 
-SRC_URI = "git://salsa.debian.org/debian/resolvconf.git;protocol=https;branch=master \
+SRC_URI = "git://salsa.debian.org/debian/resolvconf.git;protocol=https;branch=unstable \
            file://fix-path-for-busybox.patch \
            file://99_resolvconf \
           "
-- 
2.34.1


