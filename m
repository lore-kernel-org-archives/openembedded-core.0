Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37538E6ADF7
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:58 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87712.1766434131466609224
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NCqIxNoK;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-649e28dccadso7004688a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434130; x=1767038930; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a43NJY5WmkIKbnah/gn+ZqW5xUNcd5st7cJmGTf3bVI=;
        b=NCqIxNoK7eMi23gqWYB2IYI/TVhM7Lt+tgto6hH/v9jv5YUZhBLluchOOP6ismosjK
         HdpIut3YP43/pibDW0NoR0gcb80+QBee+UqSA+Kc1H6NbiPzDPE5TViGg4XbrxyynfVG
         a9nJc/akd7tTXQvy72lrTcxeon89OPgaGOawKDWzykBTslAgbWeiYU/s+3FGEY45RAkc
         X4lvTy75ij2boOD3iH+KyBqvLIL2wAct18y0xVyB7tPQX2SbImEHADiXU81H+xIgbTjp
         7pU+GzBqVa+o8FbIDX27j9fWLFS08mMeA65Mnz05vi5+PBP5iuFw7WqGmj+QacP1Jwf/
         j3CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434130; x=1767038930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a43NJY5WmkIKbnah/gn+ZqW5xUNcd5st7cJmGTf3bVI=;
        b=AFQonq2PpzodxiJD1Bvx7fDtE7eZmXcJuUGYIhc3xQvREZ7B5RZapd3KAsKOJBhTyR
         8Kio6YJK0g9l3XeD9mnhLzuZM6mstKIAT77ctg8wgLwTFeMvkTxCxhDJtO4/rByNoX3a
         amM7ubXEdaH5rme9E75r42QPScCN+G+GdsgqHFuzuKdKrsXnq/mdMj/eTG7SJ5nL1Nrb
         +vuH0oygDZBxkyxYSwYuNKnAQwy7dSWz9qjV4eZxXbUB2sbsFdlRetjPaq2Az+X0yPVz
         V9gB85t7SJdxNwnMtg2WUXgRg1zvXVPPr3MLsbAZ2sKmSh+V0OaRAK9FCnHQ/Y3tah9k
         5NiQ==
X-Gm-Message-State: AOJu0YwGh54ZUsUa69UiEVntc6oSdqMGx2WJ8d3tpvXayIym89b2u8BH
	0mHraiEw83btrgWsPPWtq6JTOHEzVpeiSNB80KLXnwJTBGPFaGBeJhHqs1d96A==
X-Gm-Gg: AY/fxX6+Vxdjbtj2yCDP9tJ1YmKZRLhXndnBcROBjRbNJxkbdeEQXfPbkbMdaozDlbB
	ORt0++cXvrEKY/YvpI2cYmMOQySK166dXXSyhpeegZRCps8gYIZvV3s/mzCL4RHtbPScHHzXg2b
	d/UwQ+ND+jFya56pzRCt3mMR4hx/NGR5SzNo1EJPFDQXVKhigGYPspH+DQ74ky0xetk/ilAjiZz
	IOl+/XUf4W/R82Ckq0DtEr9X9nh4CkCULyG8RB8b7mxAyBSvWmUIMc4DCjnkDyyMQvOP1VSfILu
	Ute5buZRZS68f7RxgrL1OD8B2pDI2hV+hZi6NmXq4mIVj7a+TnL0mDLGxrH8GOY0+DL0M7kxSEh
	SgsyzMhkni4jyMR3zYZrEPKWDW/8BUwnXhL1PmoXHqHxwLeoUa7Gbc7uWycsv67Lq2Ad7i4vhdM
	gzwcfPUTU4Hc/Zv2nspXgjintX6N4PPJ1kDW4BtxBxIULW0Wk=
X-Google-Smtp-Source: AGHT+IHF6M8FSwuOIAKPGS3gdekFjoc2qO6X/AjFav2QQf+v5UBcQ4Wu54s5xYvY3i7OWJ87JMCFew==
X-Received: by 2002:a17:907:e158:b0:b80:42cf:1157 with SMTP id a640c23a62f3a-b8042cf11d5mr845198166b.36.1766434129809;
        Mon, 22 Dec 2025 12:08:49 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:49 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 094/114] rpm-sequoia-crypto-policy: upgrade to latest revision
Date: Mon, 22 Dec 2025 21:07:16 +0100
Message-ID: <20251222200739.2278706-94-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228418

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../rpm-sequoia/rpm-sequoia-crypto-policy_git.bb                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
index 19b86ae391..d368159df2 100644
--- a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
@@ -10,7 +10,7 @@ inherit allarch python3native
 
 SRC_URI = "git://gitlab.com/redhat-crypto/fedora-crypto-policies.git;protocol=https;branch=master"
 
-SRCREV = "ae1df75b1155294ebbd3c84fd206ffb55414c3ec"
+SRCREV = "19878fea4c5f62208655e32269842bce55c819b2"
 UPSTREAM_CHECK_COMMITS = "1"
 
 do_compile () {
-- 
2.47.3


