Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F83FC3DA4A
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 21:55:05 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.4942.1724104498665913720
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Aug 2024 14:54:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZbeDlm6+;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-201ee6b084bso39715015ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 14:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724104498; x=1724709298; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XbwtUMCZk+TTr9eqTAQzgxyL4zmWTapRHaAztzB7Ft8=;
        b=ZbeDlm6+5Zcc4j8LOCUVZLSVDhl9Mx/j3jbjsINiwKCSMOXxP2uQdYcHc1oGE/Oxn8
         xgp+wSDyJ5+mGM9lh96u7WHR3WDaHfnopavt3H3N2pZC96y6U1hV3qVAJwokNLa5QlKv
         F7wqhE4sRRCymLn7kHWitdDoeQgF6cySEzIHRq+zV0N4eNfKPmsPxUX6QetxkGZn/1ki
         N3ddZiq0/9j27nVztMkVXyg4Dc4oq8JSLZZmmVAic7d2myNwDSUZteQ57Y3DuLU80Yer
         v8dyJnv8q5eYXEaVaI/W+iRSOMpaa4fWQeiiud+otBAR2uEUnoSLrGFoCSf+49I1A33e
         hYKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724104498; x=1724709298;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XbwtUMCZk+TTr9eqTAQzgxyL4zmWTapRHaAztzB7Ft8=;
        b=virIu1auSE437U6NdVJY/CqWmm6s0Y+33Z7Ckv9HE/IcjN1KSeZoQcuBm97GwzUoqU
         0vhKD6qPplE7sOC/kVQFQeTYMKNwg/7SOCWQ/55J7pSLvVEloqm2WB6N5sSRC8NluzVP
         XoheDnUYBQO9YMBFI0fMLYcqlrYAJ2XxIRvkN6rsiAqWQoBIMS0QKSkmZsnb+vpnX/GA
         uLFL9SZSPNxEQ4WFrWsNfTpPnyCWl1YHPS3lx+AL+N32dKIc+22AVJgu8nzh+rLseAgV
         ctqY72KLs0RCrWoY3D3niAqcPtlBpB8UZIPNjkxNUbaTRvraBzWq4Oaw5W+HKLvmvLlx
         JzwA==
X-Gm-Message-State: AOJu0YxoKz/qkLsV2+ZW8i2qS5RmPEU/i5FXW0UQGjTghXxBKzLz4j+r
	+RpwYr386ZVhJ5W7iU5UndjzG5mPI0CH9EaBj0R2oWK8LEEGOAIxKfKAfA==
X-Google-Smtp-Source: AGHT+IHJDkJKOI+Phjk3ZI70uUFuluIT58qnF4kBkVCoK+ADV3QM82k+Bz5QsoiUWCrXc/ZFqi87AA==
X-Received: by 2002:a17:903:10c:b0:202:41e:dac3 with SMTP id d9443c01a7336-202041eed8bmr115186435ad.2.1724104497652;
        Mon, 19 Aug 2024 14:54:57 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e13d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f0319722sm66727625ad.66.2024.08.19.14.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 14:54:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] openssh: Mark CVE-2023-51767 as wont-fix
Date: Mon, 19 Aug 2024 14:54:54 -0700
Message-ID: <20240819215454.110498-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 21:55:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203520

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-connectivity/openssh/openssh_9.8p1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_9.8p1.bb b/meta/recipes-connectivity/openssh/openssh_9.8p1.bb
index 9554b4783f4..83145dbd185 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.8p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.8p1.bb
@@ -37,6 +37,7 @@ CVE_STATUS[CVE-2014-9278] = "not-applicable-platform: This CVE is specific to Op
 Red Hat Enterprise Linux 7 and when running in a Kerberos environment"
 
 CVE_STATUS[CVE-2008-3844] = "not-applicable-platform: Only applies to some distributed RHEL binaries."
+CVE_STATUS[CVE-2023-51767] = "upstream-wontfix: It was demonstrated on modified sshd and does not exist in upstream openssh https://bugzilla.mindrot.org/show_bug.cgi?id=3656#c1."
 
 PAM_SRC_URI = "file://sshd"
 

