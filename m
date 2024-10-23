Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84360CF537A
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 12:35:11 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.7917.1729686908986428851
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 05:35:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=cXQFE1s0;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-20caccadbeeso73242195ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 05:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729686908; x=1730291708; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3R/GTia7TKN0/D4O0gpaLhVsGnung80HRz+AM+9Ublw=;
        b=cXQFE1s0ZVTGmwXeO6ubGkAnNOHZgnH5cm4s4SJNk26+iSQpayhT1Hm9umv+7KUCFj
         +CqyX6zG+rQMShPgfw0UMJYfVVcLZ1xZBDUquCzx9jDtH7SifuW6HYGYA/ue6tcJd8Eg
         F0fmmKDl8IVylZvyGaw5TJlAZx6wXNEbZB6Ec0hq64iMjVuAr95yXgqR9KO/9XGdoYkQ
         UANEWBgzL7Z/FaA41G6G8j3pVrtSgtO226KLIgiEhExsvpKnlXQlfA1zgHECOFbL7C2/
         jEtUQ/iDg3naPIaFuAAOQbK11IRb3E/AUsx1kjs8LRcTmmTbtXpihRw7S6izfGpNFRPf
         UdFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729686908; x=1730291708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3R/GTia7TKN0/D4O0gpaLhVsGnung80HRz+AM+9Ublw=;
        b=bw4astVCTUE2XSU3ZUjwNsdoPq6Ta8+HPXnVU0C9rImHJY9vphG/VxnT6ADsOhlalE
         l93LAgFrNj9+lJJES3F6xg49SJG5Rc185nnz8RzWCgyXjb5o/QxxFYpVWp7ZD2OY+XbG
         SJo0HHg3vxyfamY7d9PBjOdf4rSxmvcFspYFhiKxR6Fh10mEGIP33NRpeq+ptNd4HSxE
         jXqNv9MmFvXOktH+2aYXisJmmUmsjAYwZ22h9jj+x++UVB097/5WgreZbYb2TS6ArWZF
         9nwaKH82V75fTqC4Q0/zbi6GtY6l5dt9n85A9srcKBiFZ9DopdEEbD2xcM+IVFCurQy+
         PAzg==
X-Gm-Message-State: AOJu0YwVfUtifkaaDTqdgo7knezv4Ehxe1k3ocMxS3ko2PHRTz24XV/S
	xX0Fh1FivqtuSI504+IVGw51DXtM/Cvh2tlZKdFfadLBZOmGnPAei8h0mCVq0/zWZnX+tuIBZM3
	k
X-Google-Smtp-Source: AGHT+IEwtdvpiyFUCb4vRyb6gVVLFoGubKtBUDXG0xbQBSfEiRzoUahDWVboB0o3R7vWKWGmxnFN0Q==
X-Received: by 2002:a17:902:ec8d:b0:20c:dd71:c94f with SMTP id d9443c01a7336-20fa9ea09bdmr23883405ad.41.1729686908234;
        Wed, 23 Oct 2024 05:35:08 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4a40:d08b:8aa5:305c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0de3dasm57294245ad.226.2024.10.23.05.35.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 05:35:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 15/27] oeqa/selftest/gcc: Fix kex exchange identification error
Date: Wed, 23 Oct 2024 05:34:23 -0700
Message-Id: <971d63d5b4982ce9ef4c4be742ba83a9708267da.1729686660.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729686660.git.steve@sakoman.com>
References: <cover.1729686660.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 12:35:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206226

From: Harish Sadineni <Harish.Sadineni@windriver.com>

while runnig oe-selftest for gcc, some of the testcases that need to be run on qemu
are not running due to below failures:
- kex_exchange_identification: read: Connection reset by peer^M
   Connection reset by 192.168.7.2 port 22^M
   ERROR: Couldn't create remote directory /tmp/runtest.3549814 on ssh

To resolve kex exchange identification error increased the MaxStartups.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit df64d5ab6eb37dcdc2046f449ec539a3f4b985c8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/gcc.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/gcc.py b/meta/lib/oeqa/selftest/cases/gcc.py
index 4cc0894d42..1bda29a72b 100644
--- a/meta/lib/oeqa/selftest/cases/gcc.py
+++ b/meta/lib/oeqa/selftest/cases/gcc.py
@@ -83,6 +83,8 @@ class GccSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
             # validate that SSH is working
             status, _ = qemu.run("uname")
             self.assertEqual(status, 0)
+            qemu.run('echo "MaxStartups 75:30:100" >> /etc/ssh/sshd_config')
+            qemu.run('service sshd restart')
 
             return self.run_check(*args, ssh=qemu.ip, **kwargs)
 
-- 
2.34.1


