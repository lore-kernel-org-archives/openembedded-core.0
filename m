Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B6D1D44178
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 10:33:24 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9938.1765535597670091055
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Dec 2025 02:33:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=pMACKnHM;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.208.51, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6416133c627so166992a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 02:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1765535596; x=1766140396; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rr7gIuDm4NBc47Dk+FZvMdqdV+j8DGLfSt/7BpLfNlk=;
        b=pMACKnHME5LZRPij3xAG4r93bwq//tdeB4mX9/ug6JNhvUnvLrNV8b3FAJ4R5uvxkY
         xfzfLUeJL+LbCgpMw9HVhueg55KYPFqfvfkNgbWmyhJCW2hTikb+l3p4rU1ormedZ9vE
         iNsYnjHKpTtefQlqXkfu2haMlKohZbqhYS2Rg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765535596; x=1766140396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rr7gIuDm4NBc47Dk+FZvMdqdV+j8DGLfSt/7BpLfNlk=;
        b=ANv7uIOrv/YiNEkTnX7YpB/1q0yoZw8hhQvDoWpWwSPMH6m2MZMpJBlRug7VCHK8z0
         1IIIJkoQsSyjmB9K+wUyNw/he3Shn7j7yNC1Y86v4HhyEZvy4gtk7/vTOzOC7ErafZqZ
         via0LUqCSTUPLCtTqVj99uFSpNSM4iG6marZrbx3K5DgXB2KsmKcq70pT6balzukJu04
         Ajmo8eSWXPqKEg+NSmCswcE8K3yO7wBvsBJR9J8PPip1msuazqs8uu+qgBHh0sIXUhyM
         Cezkm1PSMNU0OQv8UvE+cOMc/qWeq5Vsi2cMgdxgfSax0HWWYnNmnzLyio8cblb4u6gQ
         uBMg==
X-Gm-Message-State: AOJu0Yx7hrvSP8oURf5sI0Q2C58jtcHy2EF8lJapyXrEeNYYqtjg4VgX
	uT8a4SZBQdDWgEKiZ34LKg2vsfp7raThNvB7nXQ6js4fCCTmX/avD3rMzjnGF63xtwHtuu6K4ur
	egHXy
X-Gm-Gg: AY/fxX6rp6z+yUr0fEXsZOuJ5Z2IGwlE34DqsNNVuSF5WZvwXLiN6r+qY40Vv2pdX8U
	Sk9FD+VIWzRycvWtPCjHZpaPDFf7i2gix+nYJTku40sTJMhrWqcZ+M7yLCUroB7W/ztlWVWZShF
	stkzw4pP21M4/Mbwq24dwxYH9Ctx9ZAvvnBJGRkjGgERyRPtcHnip9Pp4fuMsgEG375eMHhj2lR
	mrJiLhRdfhrKmT5SHyYoEESZne7d+h9ejuVnBf2eDJRrrkaHeKyHZQc+WgpEm+Hu8EX2jYi/6Xt
	/d57zwTJrkRR3uTBmkjumq2qFhOY74v7QhaNiR4v6/9eFqPkRWpaxzYSI7vX3McxmlBz+wzc7qf
	PFjH52sajRMHIA06v6/VAFXAHuw/UVaU06rZ6PFZKta1hWN+2AYBVjhL4BZBA+92teDRmqAeiBz
	Lt9eUVaMKo1UVT+IrzfzR6xVRtjNrk1oaPDJ2R7cd6KVolIf50RzVX0ds0UguNL6U/B3Q0n+2Pj
	KBJ2As5LCxxpd0JCK9ycmeDthwdRehwnQ8PGvaBZqL7MInLuWjPd4ljSQ==
X-Google-Smtp-Source: AGHT+IFvalVtLQLbBJqK8hX0vc6tE3ZakjXLDMrOUINLq+XAlcBc17626aLFy8GchdQIs6Hwc2ckUg==
X-Received: by 2002:a05:6402:1452:b0:640:abd5:8646 with SMTP id 4fb4d7f45d1cf-6499b331204mr858519a12.4.1765535596043;
        Fri, 12 Dec 2025 02:33:16 -0800 (PST)
Received: from adam.amarulasolutions.com (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-649820516desm4935216a12.14.2025.12.12.02.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 02:33:15 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v2 4/6] libsolv: explicitly enable comps for rpm packageconfig
Date: Fri, 12 Dec 2025 11:33:10 +0100
Message-ID: <20251212103312.2077322-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251212103312.2077322-1-adam.duskett@amarulasolutions.com>
References: <20251212103312.2077322-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 10:33:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227583

dnf5 requires solv/repo_comps.h

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 meta/recipes-extended/libsolv/libsolv_0.7.35.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.35.bb b/meta/recipes-extended/libsolv/libsolv_0.7.35.bb
index ec74308bb5..52bbc1c4a3 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.35.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.35.bb
@@ -19,7 +19,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 inherit cmake
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PACKAGE_CLASSES','package_rpm','rpm','',d)}"
-PACKAGECONFIG[rpm] = "-DENABLE_RPMMD=ON -DENABLE_RPMDB=ON,,rpm"
+PACKAGECONFIG[rpm] = "-DENABLE_RPMMD=ON -DENABLE_RPMDB=ON -DENABLE_COMPS=ON,,rpm"
 
 EXTRA_OECMAKE = "-DMULTI_SEMANTICS=ON -DENABLE_COMPLEX_DEPS=ON -DENABLE_ZSTD_COMPRESSION=ON -DENABLE_STATIC=ON"
 
-- 
2.52.0


