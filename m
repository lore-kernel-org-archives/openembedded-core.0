Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73684D3C527
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 11:03:52 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13164.1765364626362404819
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Dec 2025 03:03:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=mdsqqOBm;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.208.48, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6415fc4093bso982989a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 03:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1765364625; x=1765969425; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rr7gIuDm4NBc47Dk+FZvMdqdV+j8DGLfSt/7BpLfNlk=;
        b=mdsqqOBmBHXrd7MnyZvGvlY0Q2cgx4GtdWEg41qWveAxWUht3YNcaTzsUjgGUTncsM
         8U0a74+f9qdxf0abKfQbSxbIglKzYB+9X32BF2uZnTawLWnILqvewBtt7oB/+MSAEQHR
         U2sX6WWnrRos6lzfw+HBBvmWdOYXKpnnlH0jU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765364625; x=1765969425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rr7gIuDm4NBc47Dk+FZvMdqdV+j8DGLfSt/7BpLfNlk=;
        b=nD7DvOetzCQQUbfy+nvA7gVBajD4ztESVBiMO+LlUBO+Y7Um8ZDTHsXtNrSVYeyPhH
         Q15yt/+SBDgqOU1k6rKpvrHG6aF6VNB0VoHXFYBS27Q1CDKJm9olTARp/jiUDYhDER0R
         L6yMXei7d4aPQ3W1oFkFtPjTuFs9XEi8L0gy61H7D/H9oSxcuG9FbepbDPWgrdsmZYPJ
         CoF/dDl1xk0gQEqJmIudLjNNCto9UCoyLhC0sP93+2rGyJBXGyw96bKRsvOwjV2TdXsC
         BJEpVrCCPPBoPaFET4yjAUVs4TdvPyk+n11TYzzfTfJQFMnHbtPzcW2Lw88SaMhLb8qo
         9PIA==
X-Gm-Message-State: AOJu0YxGAtgmPyqydIPGa7GBWVRBsW8R78np/XFD1KzF2za+IOb5cIQ5
	IHgKYGjOyA/8ca75PYj+I6g9C8V7+KKzHHolRThdFyNpZbujCRWKzUWeajUlhkhrw+t6KjMGSqe
	FjSfG
X-Gm-Gg: AY/fxX7bZ4HxOaeCRXepR50FKDiaBLD45vMU6PFbzvnfZowkZ+ET9jGeI8HSENKZpLn
	4FjKOMhdhwncmYzAcTgKUNH03Dy1vAHrq4vXAmMEWaUT0L4OyNM6DBdQwupD12sKKniFhD1QU21
	5RYIA1+MkqnxdNJ94VhzXfTQeBzBVsTaO5CRrw7ownLYwfKySy9m4z82M9AcjCrcLrdeRSNGZFb
	04enS3WoeSAv43/hKQNgi1gN+CT6HGGe7m90ou1bxYmsdRB20NnHdYW5d4RnblsAfkDlTscgg2s
	QTOY5sPlb7OMTIWjqwQ86ZBsIh+5mpIzOwOGm4t2n/nzy/ooruReZrUWqL7kcIot1ABMuyzqScQ
	NyFWDfeFdryHNuXSmIKRzxQhxJURScUNobf5/8A5UXCql5Va8ey0Efu32SMs64rw4HaAVAAR12K
	u5+PX4rBYAoG0Uhr2nmzX3xUYzMSKl7OkDo4G5bpS9mC++fCHMtz5mgl5e1rJscS6jiYHze8Kga
	F2bUfC/twuFJDgPl48EEEba3Kk23BoMs8Tin2BD3AzlpQtDPicE
X-Google-Smtp-Source: AGHT+IHMfIGbHY544ADiQ5VAptc6u0UrWuHUYalVQdPuuD4nbrQtpQBph72R6ycaKz8GY27EYW/B+g==
X-Received: by 2002:a05:6402:40d1:b0:645:7d1b:e151 with SMTP id 4fb4d7f45d1cf-6496cb4d5famr1132253a12.1.1765364624750;
        Wed, 10 Dec 2025 03:03:44 -0800 (PST)
Received: from adam.arnhem.chello.nl (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b2ec31a7sm16227636a12.2.2025.12.10.03.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 03:03:44 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH 3/5] libsolv: explicitly enable comps for rpm packageconfig
Date: Wed, 10 Dec 2025 12:03:38 +0100
Message-ID: <20251210110340.3631065-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251210110340.3631065-1-adam.duskett@amarulasolutions.com>
References: <20251210110340.3631065-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 11:03:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227468

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


