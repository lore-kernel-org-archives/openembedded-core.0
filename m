Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A677CA0EE4
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 13:53:59 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.25682.1694526836632583283
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Sep 2023 06:53:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Bp7Yfo9e;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1c1f7f7151fso40595385ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 06:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694526836; x=1695131636; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TzeLOmuSCBfKxoIAxXHq9OHKNPThm/uQFgM1xjNFMIo=;
        b=Bp7Yfo9e8EoQo57LdlmVxhlFQXr4n7wlr6hqlddjWS39O75c4FU6oKvt18paQueajo
         X3AkjnswQ4twyOHyXCe3a1c5Ae25w0LIhRwbQTZumMU98XIoH982dmtpUn18b3UMxS4Q
         FEBysbNtWl7TrMVn1CwH4DyL2phEiORRqTopJhqBzL+XckTJ7nRTIzxwLkoOf1Dp1pyb
         owqnnFm+FaKiApEquv66yI6g5utXZJMwFgdAKaqGhn21Qm1lrH3p/VQuplfBRXgpyKcQ
         XCmyDkHfcmTPbNSG4W0bU5hkWYZwNhYxdJ+39XBeTolfqyGOuzcR0W0DjHzxBnvzodBL
         uWRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694526836; x=1695131636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TzeLOmuSCBfKxoIAxXHq9OHKNPThm/uQFgM1xjNFMIo=;
        b=PHsm+yoo9Fm6qDyd8IOs3Tm6MIFkY6h1pZDGE2CZCkdJy0JlNnTqu3xb9OTCl4g4xA
         Iz/HTyWCDf0qJqk+3+u47eCbLoh3yV8Ye1lKmkNeMD/Lntp1AV1Ec2Gc7ycpXBkbSCp6
         E25XjT8vbChZp20WAjDln6ApGsDlVY441HHd7aS07bGygaswQituKBVVUXAHY80okFcA
         V/q8b+GrE8+NWIMX+e3B+7Ntq4p8v5k2HFVtqElxRB6rHzvNBH4nGWMvtzQ6h5Bqm0Pl
         65sBJeePzcoqmyvrhc6pMD+l6rGFGgOEoDK5Fe2hiN/RAVSeqQpI+pGuItgtFyoUAO5L
         ONmg==
X-Gm-Message-State: AOJu0YwLprhjSGljXCElCjjMTPz1EOVQ/g3MOM+SLkAXYcwdxBducAMA
	OLzKTNe1Klm0bH1S9Lj1OipHuepTsH+0Nzu19ac=
X-Google-Smtp-Source: AGHT+IGd8aq3cKVyWxfVK882cxORReNq7rSZfBQ+Qp7BtnZ2xFSQ7KOEeulNIkfHz9rZfjBcu0Hp3Q==
X-Received: by 2002:a17:902:e88b:b0:1c0:b8fd:9c7 with SMTP id w11-20020a170902e88b00b001c0b8fd09c7mr11711984plg.43.1694526835751;
        Tue, 12 Sep 2023 06:53:55 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j7-20020a170902da8700b001bdeedd8579sm7635246plx.252.2023.09.12.06.53.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 06:53:55 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/14] selftest/cases/glibc.py: increase the memory for testing
Date: Tue, 12 Sep 2023 03:53:19 -1000
Message-Id: <50b07b4c0c814f2832816cf83863687155429b21.1694526588.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694526588.git.steve@sakoman.com>
References: <cover.1694526588.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 13:53:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187525

From: Anuj Mittal <anuj.mittal@intel.com>

Some of the tests trigger OOM and fail. Increase the amount of memory
available so we dont run into these issues.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4d22dba482cb19ffcff5abee73f24526ea9d1c2a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/glibc.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/glibc.py b/meta/lib/oeqa/selftest/cases/glibc.py
index cf8c92887b..f2ed822bf3 100644
--- a/meta/lib/oeqa/selftest/cases/glibc.py
+++ b/meta/lib/oeqa/selftest/cases/glibc.py
@@ -61,7 +61,7 @@ class GlibcSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
             bitbake("core-image-minimal")
 
             # start runqemu
-            qemu = s.enter_context(runqemu("core-image-minimal", runqemuparams = "nographic"))
+            qemu = s.enter_context(runqemu("core-image-minimal", runqemuparams = "nographic", qemuparams = "-m 1024"))
 
             # validate that SSH is working
             status, _ = qemu.run("uname")
-- 
2.34.1


