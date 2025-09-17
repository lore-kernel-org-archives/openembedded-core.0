Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7237CAC59A
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 13:11:22 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.22495.1758114677846195788
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Sep 2025 06:11:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LgBVKzpQ;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3e9c5faa858so3891630f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 06:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758114676; x=1758719476; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pt7pqXmNXdVb8Dy5h/F7/K71QGgVDh1kZL8QVK4bSPQ=;
        b=LgBVKzpQubRYuN5PNIY5nUqjFmO+f7yM0fgKzd9rrzyjX8dysVca4FonfMKXNB7uTX
         6a5/kcbEpVaklfte9eefhDUK9+i0Anxq+NvkQDFas5jtUit89R4C9kS2qxP26neu+tbO
         wT4TI89FcPLcpSdw6lPJJG6c2Z+DiKHnPFC7HpR+cpXgwQLTJIRcg4O0TrFkjii9k476
         wp7xrQZ8Ihp9HkdY5f7GMeVx3tlrwoPYCUcNvFINfN6x/ztNUh1yHwbY5fwGSo4sE4BL
         TeRwgBSr57z6W6TPVK+auwEX/eBVP/7RLr1fPDcWtNcHba2gtn8wjPEaZlU+bL6dZWi/
         p2Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758114676; x=1758719476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pt7pqXmNXdVb8Dy5h/F7/K71QGgVDh1kZL8QVK4bSPQ=;
        b=MZlJrfjGZKYr62DyvXFY9FqG5AuqNvRBtg3GZensV4fstxyRf+oUyyeNa5ojaDEsil
         7X5JHn/9qBddHpy9WmbQ/mrr1WY6GsbYLlf01K9MttRAIQEIENSgTJphBtnWjGvQMAZO
         S5ip+ozSM0cfLXpl2JjqyaNPvemhEaEWjXcUMBAYUanIDZDsKABaHB+T9A1zWxpVhIUY
         f0RlKVeA06uF2RWmgy29/xp22DS+2AxmrIR6s4LIdzb542SC/a82pzY9/N5fb9wqDD9i
         Wtp009dcbxJ1EQ7eMy6RWEvxwzlgqqEX7rZq20oI3EN2kxDouGYitsl/bD0zjkJDdm6P
         YLJg==
X-Gm-Message-State: AOJu0YzgUAHLcYw0BYigfldPd0cNj7yCxJ2tFf/zFxvZtHRV29WLHckj
	oDh6c/r0k1Dqm0hV2FyOapkUiQ/0RSAP0NyULlQV+DJaUwM1RjSXomqsxnqiew==
X-Gm-Gg: ASbGncs20KNkMjFIiG/6xVwH/uCQm1C8zje3F42h1Qj4UiqMJL9ZWrBG+A6Npx9CD4S
	zVYHURx6XkKdFdRtJGwSVy4JANgEhVZtwlUy+RiqTjO+vqLPfVVIBkzvqRtdGuSxGeL1iLeZ4kN
	bgxvVBM953BTHMLoMeUJkiQJrgPAMduMrAnCqNzRC3CCHqv4/oB31OEKUGZqIevAnmWXnnbrMAI
	mhRUoBokI9uqzbGmDHxGIATBcwdpxIEC2+ycJllwP9GyC9KSsCIwk6lSyKsxNQS9TNSEydTSEWO
	ANrjAmkNEUS+fCb4bc75Pi4Xe+MtlNfuF9eA8hJwLtrNSzhzqNO23AmKA+Ad4bQiP0CnfzDdDEb
	OZWVxPVj+Gs/VLPnEDWbvK9OYqtouuGfjclEOd3yyjO7JQ1oxABHlOFER
X-Google-Smtp-Source: AGHT+IF9pK65bR79rPPWk+MpT2Om3PLkQvtqPpGuw3eCIHxFN+ilB32h+530evI+syywVjbD/Ub5kA==
X-Received: by 2002:a05:6000:438a:b0:3ec:42ad:58f with SMTP id ffacd0b85a97d-3ecdfa4c665mr1806423f8f.59.1758114675976;
        Wed, 17 Sep 2025 06:11:15 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3e81dbf9acdsm18788579f8f.55.2025.09.17.06.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 06:11:15 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [walnascar][PATCHv2] sanity.conf: Update minimum bitbake version to 2.12.4
Date: Wed, 17 Sep 2025 15:11:11 +0200
Message-ID: <20250917131111.2490120-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 13:11:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223601

From: Martin Jansa <martin.jansa@gmail.com>

Needed for multiprocessing module in bb used in the next commit.

It was added to bitbake in 62be9113d98fccb347c6aa0a10d5c4ee2857f8b6
which was backported to 2.12 branch and tagged as 2.12.4

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/conf/sanity.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/sanity.conf b/meta/conf/sanity.conf
index 6d3911ff94..38bef17edc 100644
--- a/meta/conf/sanity.conf
+++ b/meta/conf/sanity.conf
@@ -3,7 +3,7 @@
 # See sanity.bbclass
 #
 # Expert users can confirm their sanity with "touch conf/sanity.conf"
-BB_MIN_VERSION = "2.12.0"
+BB_MIN_VERSION = "2.12.4"
 
 SANITY_ABIFILE = "${TMPDIR}/abi_version"
 

