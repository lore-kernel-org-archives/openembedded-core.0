Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F052C433F5
	for <webhook@archiver.kernel.org>; Fri, 26 Nov 2021 04:36:18 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web08.20247.1637901377851688983
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 20:36:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=q7xeux2a;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id
 nh10-20020a17090b364a00b001a69adad5ebso7157310pjb.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 20:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6lLwt4GpoDevz1AN7Vy8oVSzSMr15Iek3sUK3npTvwA=;
        b=q7xeux2aa3UgkCwDDwYqmIu4BoCdHVyDlBI3ARz76Y0Ajrpz22bg8ODe+3lWFNny2t
         MwacRpiK2X4rOrl09O2Q549BpLfJRTkf8OIJ1qcn7eJCIJdlWhDkzANvzuCxOqA/Y9mh
         tVGK7YOH/9xeac7M8nfdLMCHZpq5cM6WXvECR4G6E2yVOmZ0P1/qxR+HtmdtObEbDL29
         0jZhVZkD2ahjZ1dMPuJ2wSJ3l1qtoYAfk+WKwUhMC2ronWD33VsjCschAWqi+TU2oPyK
         ej9uzElpDCKj3NK3N/RTdS6TyuAKKmywo70ZHhCBqmIb25/B5DQADl5On8IkXHBveSdT
         u+SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6lLwt4GpoDevz1AN7Vy8oVSzSMr15Iek3sUK3npTvwA=;
        b=kd6hpNotMIeHQ7o1wgoCl9H6IAnyyLohSba5Erwg2MgdiqpyqYPauE/WM+ejsskOEz
         dSY6H6uDlJshvgJDUWPmtuks+dtAJJCL4NEHbHJ4sxLptSiDJPCvaPSfX6h6ZXv5Gd9f
         4ixNStZFwD+yE7lRLzHqcCyAPF9g5YcjYtX7YLofIkIgQrhtgYuYDqNd5SkOFGZv+RHL
         Z7c/MX53R4V8h7VgHf8KG5VBlJpsXdQyyNHVUF+1o+OoZTUUKO7slAeaOh0MzV4GvqmM
         HoakVTZPcqDoHbogcx3SS04ZH5I1h2qzbUBxFJVJCCQj7c5t3nmRncdcrK4AaphDRDa7
         PKUQ==
X-Gm-Message-State: AOAM531AxpEo7TX97JCgUWBFzYkQAOQTLWLBybqSoF9zwbML+TBsRj8a
	KAJG1fF7AfzkyhqEqbRVG6Qu4NdnNVQ=
X-Google-Smtp-Source: 
 ABdhPJw5ZxqKGygNtY3SbLi4RLSfUNFXSSdvDSPSrnFX5LbCWw51V6EmT3eQCIGzLvPrQS6Czk+ciA==
X-Received: by 2002:a17:90a:4d0c:: with SMTP id
 c12mr13103047pjg.151.1637901377090;
        Thu, 25 Nov 2021 20:36:17 -0800 (PST)
Received: from nereus.local ([2601:1c0:6000:1830:2111:e66e:a58a:6736])
        by smtp.gmail.com with ESMTPSA id
 fw21sm8909282pjb.25.2021.11.25.20.36.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 20:36:16 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 04/26] dnf: inherit setuptools3-base instead of distutils
Date: Thu, 25 Nov 2021 20:35:43 -0800
Message-Id: 
 <ddf3f6a1ac74e679ab1302f4561a3b7c5cf10f47.1637900380.git.timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1637900380.git.timothy.t.orling@intel.com>
References: <cover.1637900380.git.timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Nov 2021 04:36:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158800

[YOCTO #14610]

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 meta/recipes-devtools/dnf/dnf_4.10.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/dnf/dnf_4.10.0.bb b/meta/recipes-devtools/dnf/dnf_4.10.0.bb
index cef2c03e4e2..6ff2a6b1e6f 100644
--- a/meta/recipes-devtools/dnf/dnf_4.10.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.10.0.bb
@@ -23,7 +23,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
 
-inherit cmake gettext bash-completion distutils3-base systemd
+inherit cmake gettext bash-completion setuptools3-base systemd
 
 DEPENDS += "libdnf librepo libcomps python3-iniparse"
 
-- 
2.30.2


