Return-Path: <wltu@google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FF13C4345F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 21:07:06 +0000 (UTC)
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
 by mx.groups.io with SMTP id smtpd.web10.25666.1713388023558150126
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Apr 2024 14:07:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20230601 header.b=0hnQ0B7K;
 spf=pass (domain: flex--wltu.bounces.google.com, ip: 209.85.219.201, mailfrom: 39jkgzgqkacmvkstfnnfkd.bnl@flex--wltu.bounces.google.com)
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-de45d0b7ffaso358977276.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Apr 2024 14:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713388022; x=1713992822; darn=lists.openembedded.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wHQvyWM9E4XUPMqUp1bDzCt42ti4JsBMvAwYyXbo37Y=;
        b=0hnQ0B7KL9nb+oq13/BsWwIttxeuyVF3bcMz89992v79V2ZjnCgQJgsQdcwg/sIflh
         QXly7BkfYeOXOuQtRbjMcdUcG0vNinoJyLbqFj7+pvR/ZAKWrvccgTvket1bXEMO4fm5
         Aw+lvLmzvtccaKPt+7FTwaIDOfjfZBAfy7EGChbB6xBveizljfLtVA7upA2DzScDcJek
         NJvBnFFNxHlafEiAECkwBdobwScYHD6eY9iehC7IRz2bH328htWu5Nx4VEQet60mt2VG
         ldP5ae3yYaebfNBXOIJ5bhiYk07+fjsxUS9t3s7wcp6/tXqOZAqDqFHLbLi4SiGNgDYj
         qbpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713388022; x=1713992822;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wHQvyWM9E4XUPMqUp1bDzCt42ti4JsBMvAwYyXbo37Y=;
        b=pVJchk5Ycj0e4WTr59S+U9rquEvAxypXgf8eVEwgpqpyBonVKEqXY/5ixSFJVujRXZ
         lkBJjLHutriZRFalSeEbVdx6ITMv3c98JMdlNbYMeea5yg0+IU8QOhqd9wEbrcn9h8Bj
         FRSdR6NNAsOmVTtuO+mb9LuydOEatdtCXkGBjcyZ9Kf/365MYYZC1RZcFfdF5Xk5gVuk
         pki22HqmcqGRCIDyTFM4Pja1BXhPmkKJ4I/0/Mn/OPIgcSSm3pnVN8O18hBehcpfFkOn
         ml72Az7r/a5u+SwRpLln/hMGXcmzCk/l+CXsDVx1TrUWQlRdvytqeRbuSDQiou+Qjmbo
         kM1A==
X-Gm-Message-State: AOJu0Yx9WoyWD9wVpkTdnLyl2dM6UtVTrauP6s7fE2omCga4k7vxwv9O
	wq/iFTV6nPW1sRf5KdcjRr/wtyK9yeTDr1A0vhNh6hSqDJrzQiD47h3Vf9SCHiKG5JHF0lnwuoS
	ViO5NKo8HZkDpqNXyFMJsTevqzbrCA/JgDQ+DlX7D5cT9gIEuDIKlRwmcA6bvzrwcb9j/K39hB6
	j7HSwS0TndTnaKSCjC0KBj4NrTRCyx+W3fEgX9+4ZUrQYFgQ==
X-Google-Smtp-Source: AGHT+IHkag3J3EWZvg3ueI6Fx4K4EI2dFig8lx0i/H+SfUNG/nzJU5NxwCknLYySmqRhPRucFNOlvW2M
X-Received: from wltu.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:d48])
 (user=wltu job=sendgmr) by 2002:a05:6902:1141:b0:dcc:8be2:7cb0 with SMTP id
 p1-20020a056902114100b00dcc8be27cb0mr64900ybu.0.1713388022566; Wed, 17 Apr
 2024 14:07:02 -0700 (PDT)
Date: Wed, 17 Apr 2024 21:06:58 +0000
In-Reply-To: <CAMKF1soiKx-fr4r+eGWNFPk1AQ576MRsVehLh_v4fZtQA9e0zA@...>
Mime-Version: 1.0
References: <CAMKF1soiKx-fr4r+eGWNFPk1AQ576MRsVehLh_v4fZtQA9e0zA@...>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
Message-ID: <20240417210658.121294-1-wltu@google.com>
Subject: [PATCH] rust-target-config: fix feature for vfpv4f16
From: Willy Tu <wltu@google.com>
To: openembedded-core@lists.openembedded.org
Cc: Willy Tu <wltu@google.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Apr 2024 21:07:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198485

Based on [1] which fixed the target for vfpv3d16. Adding the support for
vfpv4d16 with the same set of changes.

Tested with running tokio which hit coredump before the change. It
worked fine after this change.

[1] https://lists.openembedded.org/g/openembedded-core/message/185702

Signed-off-by: Willy Tu <wltu@google.com>
---
 meta/classes-recipe/rust-target-config.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
index 926b0630b1..330ad8a3f5 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -21,6 +21,9 @@ def llvm_features_from_tune(d):
 
     if 'vfpv4' in feat:
         f.append("+vfp4")
+    elif 'vfpv4d16' in feat:
+        f.append("+vfp4")
+        f.append("-d32")
     elif 'vfpv3' in feat:
         f.append("+vfp3")
     elif 'vfpv3d16' in feat:
-- 
2.44.0.769.g3c40516874-goog


