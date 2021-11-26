Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41BFBC433FE
	for <webhook@archiver.kernel.org>; Fri, 26 Nov 2021 04:36:30 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web09.20185.1637901389574655376
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 20:36:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=N9hA7kCe;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id
 gf14-20020a17090ac7ce00b001a7a2a0b5c3so9044385pjb.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 20:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6N01THxaAn/JdSBWv1WLHPIzWfNzSqHAvYsMv2+Yso8=;
        b=N9hA7kCeYLpLedndVRMUHum3assK/JLyQGCwUiqO5uusOKO3SlKrE2Ub5yRyM9r9vE
         JkeDepwVcT3Mqk2CloaqAqf5xaxm45dyQgD7tQz//o6lNust9Usc5eEWpQhugUxB1CBQ
         XQH+B7pAX65CXtL2dhsLDSzRW1UGXHlTjXA8GtNr/Z024Kr2WPHrjSzGZqZuNy8c36xR
         eNSVdUXvj945mOVrdwsOzKdmLvnFMaCYlBNE/YngnzGy5k5Hh1kM2W0DdNYNhOz7XSYG
         aeEKSeNC4WlMbkmWiCMac4yN2nu0LRnyeCIxnAvVv+HOxE+KnmVTnx8ZauKB+Up1DcFY
         hXAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6N01THxaAn/JdSBWv1WLHPIzWfNzSqHAvYsMv2+Yso8=;
        b=pA4dzg2YnqH6hNLJYJG6Hs29WoZsiG2pu/tQcCeeY9uN7PQoCP/tBWAJxqQ57/NX20
         YDc7QpMQmhF4ufArR77yg+4BKqZuP5KR7m7Rrqj90AuBaM/W5Q9Z1r9WSCYFZIlNqkTm
         kQSp2YlVErTCWMON2zTaWh1HygwKFRp8LWRtMgmIFKn+FLeCVsBDMIR2tAflMD7BFE4Z
         JOysfZNiaMLcCNztu0XQah338AGX5L6keSJCrKSTPTi/jQM3OminK4A8/gQMC30qYcgT
         QGkcVb0wopdn3/Z4/Iw3F4kqefIZE93vd6Em3eeU7zXkBulAPBlaZDYiIEdJGpgtDh5b
         2QsA==
X-Gm-Message-State: AOAM5339xZ4ZJMP9q5VB8SlZVZibEpLofDPe6oxHSwrX3tUY8GRp7cob
	Nvr9BYN2VD53YbD5LprWUajUgR/M2yQ=
X-Google-Smtp-Source: 
 ABdhPJzyW6kwiAyeibyf7moVKfA+3nX/W4zZ61NfOCa72EirVE8i6EqabtDPxQVJ8i0G6wJRxt60zg==
X-Received: by 2002:a17:90b:4c02:: with SMTP id
 na2mr13056476pjb.94.1637901388818;
        Thu, 25 Nov 2021 20:36:28 -0800 (PST)
Received: from nereus.local ([2601:1c0:6000:1830:2111:e66e:a58a:6736])
        by smtp.gmail.com with ESMTPSA id
 fw21sm8909282pjb.25.2021.11.25.20.36.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 20:36:28 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 17/26] python3-setuptools: do not depend on distutils
Date: Thu, 25 Nov 2021 20:35:56 -0800
Message-Id: 
 <dbaf2aa01e829effb1f5546253331f0b5b0d4476.1637900380.git.timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1637900380.git.timothy.t.orling@intel.com>
References: <cover.1637900380.git.timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Nov 2021 04:36:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158813

No longer depend on python3-distutils, current versions of setuptools
vendor as _distutils.

[YOCTO #14610]

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 meta/recipes-devtools/python/python3-setuptools_59.2.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-setuptools_59.2.0.bb b/meta/recipes-devtools/python/python3-setuptools_59.2.0.bb
index 704f58abd31..9ff4095c7a9 100644
--- a/meta/recipes-devtools/python/python3-setuptools_59.2.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_59.2.0.bb
@@ -22,7 +22,6 @@ RDEPENDS:${PN} = "\
     ${PYTHON_PN}-compile \
     ${PYTHON_PN}-compression \
     ${PYTHON_PN}-ctypes \
-    ${PYTHON_PN}-distutils \
     ${PYTHON_PN}-email \
     ${PYTHON_PN}-html \
     ${PYTHON_PN}-json \
-- 
2.30.2


