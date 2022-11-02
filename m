Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CE01C4332F
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 03:18:52 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web09.2238.1667359131141669183
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 20:18:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HDhNDIoj;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id v17so12336023plo.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 20:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WLN0XRY3SwO1ZT3yJgEUl+wkhTl14dR28Kf2ZmeVFhI=;
        b=HDhNDIojk2xhE0tqjlNf4FOEx/CXUHcoLZDaEGpEGH0i16ZoUGoQ313Ac18hBHvgca
         Fa1rWnXMcf+bDBcGLHk6fhUDX5VGvGrpQAaUI5pwfRaZJcPb2VCn/6dcTAcDh44z9rhZ
         Sr/5cxUFa7NQTUvpDuRfe52z0dSu0fXALrrK/a8UeK8hpgZnJBYZo/d6icWzsPHscVHC
         agwB8Z3z9+f/Quf6JFTYnJlmeTnRUQQ9jSW/PmnMIzKRhk1lG+4Sihg4xUZBB4mFWq3M
         jOOPZyzh1+r/ZEXiFu/mSvWrvzbZtyJN1XkCY1jAuIsa+FlckVEfsGrYwQ5ICWsM31b8
         t3dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WLN0XRY3SwO1ZT3yJgEUl+wkhTl14dR28Kf2ZmeVFhI=;
        b=vKNk8Z2XnvKYZRPCsJ4SIBLsGDyP3eU93DBka08ReOqF+nIyfNjWaIMOFYwkwaipt6
         um2ptD74UefFBEw18ZiMBEXBe2vUODB61/ymU235ibrhYPS3cFXg9xmRvjGa0iQ2ZPMf
         7MKcfgHmQ+xnBllwA92L+EUkXuU3RbyLzogMEHFqm1WpkLTClWJu3QebwFTXx9pLAMcR
         Q7fiwB3hndoKMHgwexiqmv3cEQ8fIQ6jYI5nIoP2kkPiLcvlC73ILkIpM4i9pbIu7gQE
         MfDskTBNw0IjWea2Y10iVhHG+rMQcEIfp9Cxp0DgPkdUehO4CNz+BJcBGsmjlQhgFKvx
         E2Yw==
X-Gm-Message-State: ACrzQf0E3HtWCTYt45tIvXvMU9sQpRdRqvbE/3qczbwv7gx9yI/6uzk+
	VDni/LR9nuThEGA+/61GhYqMOSU2aZuhHg==
X-Google-Smtp-Source: AMsMyM7XcF2F3CTv3+920R1R/7yBvSQMcARGc7q6sSMZbco9JElDN7IykOcFyZjM/lrBhqy9/VMiJg==
X-Received: by 2002:a17:903:1112:b0:179:ce23:dd57 with SMTP id n18-20020a170903111200b00179ce23dd57mr23212057plh.114.1667359130172;
        Tue, 01 Nov 2022 20:18:50 -0700 (PDT)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:5e16:97a8:56b5:1576])
        by smtp.gmail.com with ESMTPSA id y22-20020a17090a16d600b002139459e121sm269644pje.27.2022.11.01.20.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 20:18:49 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 05/11] python3-pytest-subtests: upgrade 0.8.0 -> 0.9.0
Date: Tue,  1 Nov 2022 20:18:24 -0700
Message-Id: <20221102031830.3606777-5-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221102031830.3606777-1-tim.orling@konsulko.com>
References: <20221102031830.3606777-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 03:18:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172567

https://github.com/pytest-dev/pytest-subtests/blob/main/CHANGELOG.rst#090-2022-10-28

0.9.0 (2022-10-28)

* Python 3.11 is officially supported.
* Dropped support for Python 3.6.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...ytest-subtests_0.8.0.bb => python3-pytest-subtests_0.9.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest-subtests_0.8.0.bb => python3-pytest-subtests_0.9.0.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb b/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb
rename to meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb
index b092912b32e..bfaff39077c 100644
--- a/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb
+++ b/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb
@@ -7,7 +7,7 @@ BUGTRACKER = "https://github.com/pytest-dev/pytest-subtests/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=242b4e17fa287dcf7aef372f6bc3dcb1"
 
-SRC_URI[sha256sum] = "46eb376022e926950816ccc23502de3277adcc1396652ddb3328ce0289052c4d"
+SRC_URI[sha256sum] = "c0317cd5f6a5eb3e957e89dbe4fc3322a9afddba2db8414355ed2a2cb91a844e"
 
 inherit pypi setuptools3
 
-- 
2.34.1


