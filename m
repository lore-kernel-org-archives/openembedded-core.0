Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 147EFC54E63
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 15:42:32 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.15042.1709739746291854170
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 07:42:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nI2y+ryo;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a3f893ad5f4so1018836966b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 07:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709739745; x=1710344545; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P589AknBtDicQZO6cEZGqLTArlri9VyD2xLtTtkIjmM=;
        b=nI2y+ryoMTpPmvUp8lI+hXcTFjrTzamgjEwTfit44wvenCMmRpoqmL8fnF4pk8MRIy
         eRtwAxXa8f1f2jWRPRLRMop+8pbqo/+j/vNnpp1frIUqcX3fG5arPdaqCgjFySp8m7qQ
         ZTpzRvtFJUC6JI/zOnhkGGydCTBrWZ+Ryi1HqNbrqef+n76kAkSfH99RsFXfk0JMuzZW
         4CuNPgWCZRef8LViPeZ5CzOKruGPCUcfgoyAnYAvVeBiOkuY281DaYC/8yBplQ52KaTl
         I206YM2frCcjIGXjFNImLYwBQe5Nf0qp+bbCbzHQrx3TLs7qwVO2S5Vt6t0NKWUqMTZo
         JSRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709739745; x=1710344545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P589AknBtDicQZO6cEZGqLTArlri9VyD2xLtTtkIjmM=;
        b=adLvAzSmIZf3VPPLG6J8xWVkzIlAsTJwWrYWlUXq4mKMdxxqCg4HXt0Bq7IxqD8Fxg
         DnFaHmfJ997ul84OFAaDCqLLwhkCJIgFwrNlcWZ/KLeEB5csMq+/gKuLx00alPzM5VZ3
         uuDKteqhebNOcZQurYXbu1JIerhHDHazZZVMwpN1BULPyNyT1h/ca7E077MH8dX6K6qC
         rag2EYM9DoUXJypCkTnsSCJdlcHqS49R+0OUJi5C95tdBcZm5MbQAyBwna6zCvHuKx9k
         ysCjmOl1bKYFA+XCcOv/5i0zK+58l6eNwHl0ittEU8mQFXxAxc+8VgEv4L5cRdsCkIXQ
         tPMw==
X-Gm-Message-State: AOJu0YzmcJFEpDs6t3vw9ScLzV8m2xpWV1rGQpNAZnSLb3XITM6ei5YB
	BeR2LWEdCE7B+zrV+gQlfZFvru+p6dJXLCmpbGT782KhWhBRRwC0/qhR/aX3
X-Google-Smtp-Source: AGHT+IEGwdscui2L9+iD+8YZg+6TE/QHPRPITQY2rKqETY+J5QxzW0ic5iIiKvjfCcgZ7/ExaA4d4A==
X-Received: by 2002:a17:906:aa0f:b0:a45:5313:bfb3 with SMTP id ko15-20020a170906aa0f00b00a455313bfb3mr5796705ejb.40.1709739744672;
        Wed, 06 Mar 2024 07:42:24 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id x11-20020a170906710b00b00a4434e9938asm7209343ejj.84.2024.03.06.07.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 07:42:24 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 44/47] update-rc.d: upgrade to latest revision
Date: Wed,  6 Mar 2024 16:41:48 +0100
Message-Id: <20240306154151.3741709-44-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240306154151.3741709-1-alex@linutronix.de>
References: <20240306154151.3741709-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 15:42:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196727

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/update-rc.d/update-rc.d_0.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb b/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb
index 043cb3f13ea..ba622fe716c 100644
--- a/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb
+++ b/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb
@@ -7,7 +7,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://update-rc.d;beginline=5;endline=15;md5=d40a07c27f535425934bb5001f2037d9"
 
 SRC_URI = "git://git.yoctoproject.org/update-rc.d;branch=master;protocol=https"
-SRCREV = "8636cf478d426b568c1be11dbd9346f67e03adac"
+SRCREV = "b8f950105010270a768aa12245d6abf166346015"
 
 UPSTREAM_CHECK_COMMITS = "1"
 
-- 
2.39.2


