Return-Path: <sanakazisk19@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B799CD1288
	for <webhook@archiver.kernel.org>; Thu,  4 Apr 2024 05:53:52 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.31712.1712210029715519223
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Apr 2024 22:53:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EcjoS/UO;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: sanakazisk19@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-34339f01cd2so428292f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 22:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712210028; x=1712814828; darn=lists.openembedded.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/zuE/bEseUjvmyMoKFbVe51nAkBuEgmRDwM1pQZsKBk=;
        b=EcjoS/UOgTkz5TvPIfxBfvHYhW8IIFUsulZ5pNP9BrGgF+msqNNE2/9HnYstUdDh13
         JcvMmUo3mEVhWZbp4dCjoqShXrhQNUPBrGW4sknvyZIrRQCY08nSjgYKflAdKAIiGS9J
         DBfBBx6QFLFTSkWt+zDQrMxXAnq582HlcbArh3F49P1GsBGR7/C/wHWt5SBKr+pZ+Jrs
         m9YFc8hhoBYEYqI/qQTmHpwx3M78jQ6w7hXIpcpJeWxQBUQEsQ3PHeUDkLDg2iUBWGQ9
         WmUh/+azu+LTCxsfB52eoe6+uWFVeliBztVInDrQoU7DE/qloyIHTqK1xlHrlGs737+d
         Q0WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712210028; x=1712814828;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/zuE/bEseUjvmyMoKFbVe51nAkBuEgmRDwM1pQZsKBk=;
        b=NtI1xCqai2Hhupb51HR5DQct4qh9/NmuOHF+VN3fg7wfonjdUwq2j1ocgq7cnWgqo4
         7E11DMwteMeCYvpA9ysfkTEkPQ3BqnF3w39Jh9gN75AIgJS4IDFiyTvuyhzN23ShojR9
         7zQGcY/7dyBGwOOngZqzd5Xr0oCj7THTclkw9Cu0BELzgJZKYd7IHSwejJPiVu/AUnJd
         5O/oEbKki7O2bjJNDwPPkoi7YwFCzrssUJFNf77MXkI5BNQ+zz/evx9YfGsIjFhTaFmE
         s/0EKTWCi+XDHIzTJczYsza3yJe3+AvNxwnt4Oaot1yaOCDE9QIvbJBxaMLbBYrXaO3q
         Ggpw==
X-Gm-Message-State: AOJu0YzX6XuTolqK7sb/1vY/92Cq4O3JZnD05hkOsZtuaM9wMZpTWMMN
	e+vigzBTczpORYszmPrKQilM+R3jooOM3RxaDwyLDb9hvBVVOwy9BxX7rkFj
X-Google-Smtp-Source: AGHT+IGhXEUkWhbDzuyofp1n2c/qpFt6u0rxFqY+VyQoku2TgAJeV+nEaTuZe46jT+SZnbJp0TkDaw==
X-Received: by 2002:adf:9783:0:b0:343:3e5b:e8af with SMTP id s3-20020adf9783000000b003433e5be8afmr838065wrb.52.1712210027500;
        Wed, 03 Apr 2024 22:53:47 -0700 (PDT)
Received: from GL-449.bmw-carit.intra ([212.118.206.70])
        by smtp.gmail.com with ESMTPSA id u5-20020a056000038500b00343491b9cbesm11861357wrf.41.2024.04.03.22.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 22:53:47 -0700 (PDT)
From: Sana Kazi <sanakazisk19@gmail.com>
X-Google-Original-From: Sana Kazi <sana.kazisk19@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Sana Kazi <sanakazisk19@gmail.com>,
	Sana Kazi <sana.kazi@kpit.com>
Subject: [OE-Core][kirkstone][PATCH] openssh: Add CVE-2023-51767 to CVE_CHECK_IGNORE
Date: Thu,  4 Apr 2024 07:53:44 +0200
Message-Id: <20240404055344.15844-1-sana.kazisk19@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Apr 2024 05:53:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197946

From: Sana Kazi <sanakazisk19@gmail.com>

Add CVE-2023-51767 to CVE_CHECK_IGNORE to avoid in cve-check reports
as upstream does not consider CVE-2023-51767 a bug underlying in
OpenSSH and does not intent to address it in OpenSSH.

Signed-off-by: Sana Kazi <sana.kazi@kpit.com>
Signed-off-by: Sana Kazi <sana.kazisk19@gmail.com>
---
 meta/recipes-connectivity/openssh/openssh_8.9p1.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
index bc8e2d81b8..6411a64eff 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
@@ -49,6 +49,11 @@ CVE_CHECK_IGNORE += "CVE-2014-9278"
 # CVE only applies to some distributed RHEL binaries
 CVE_CHECK_IGNORE += "CVE-2008-3844"
 
+# Upstream does not consider CVE-2023-51767 a bug underlying in OpenSSH and
+# does not intent to address it in OpenSSH
+# https://security-tracker.debian.org/tracker/CVE-2023-51767
+CVE_CHECK_IGNORE += "CVE-2023-51767"
+
 PAM_SRC_URI = "file://sshd"
 
 inherit manpages useradd update-rc.d update-alternatives systemd
-- 
2.17.1


