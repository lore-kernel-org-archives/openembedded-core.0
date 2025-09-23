Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2E62CAC5AE
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 14:39:13 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.18546.1758638347579141690
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Sep 2025 07:39:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Wrt4z/4q;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b4755f37c3eso5262785a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 07:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1758638347; x=1759243147; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vYgBk41CcVM3yG65ICYzVBjKHduHbC/DN7LdcJWYLNU=;
        b=Wrt4z/4qjHPXq9RHBWiO/vQAaA1yWc2f7ryXqDUVczWd7CKokkKy4TXccXzKsQ+w3k
         i/ZDJkQviARG0L9X68PjEPxpUw0oOqUyw3BeHKr/T1eMvUL+2Cx37nzEBTF+t0eg/NRi
         qWU6N9AsoZ8gX8IFUu3pKDXPiSk03xf9z36GiDjnUwe/dZCoCdaUblJ1mpW8O7AsFh5G
         WCnLR4haMlIzozjlRsXnH2ymvGQkF+1v2M5071lJCYIlruCan43Tac7hhwKxTg8+xmir
         WlktYqZ5isWLAqrNxn+ox2nmTSwY/PgKrHjwZpRpwT81TB36bsxvZXto3O+cesSiVUBG
         QtVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758638347; x=1759243147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vYgBk41CcVM3yG65ICYzVBjKHduHbC/DN7LdcJWYLNU=;
        b=eFUidsyGS3tR06+eYH0F5PmaP0c6C1T7gwdP7bGQqvG/IHjGnYgVZdYrClEEv/0lA+
         9W/y9e2CyCVJ/mml3FCIxS9Xu4vfNoQheU8ZZBjAWCf+zF0qWmeJ16grd+ZCVnq/riOn
         nwEOgCJMYzLIbY6GhiEP6pEkcZusZ8+ZdISuHUKv1iphFEKWjIuAr0Z5/Tn92WhZE3Fi
         yJATTgEn+BZwJnzIz9C4GPHqjMep+e3tPRj//54w3SDvz1IqpytXhILOf35cxB8DYrre
         38AG1r37IBVASp129QlqIUqlP7soXZkLHFOGziAf1rtoNIki08+JDOtKLcfi98g3v/iE
         W6EQ==
X-Gm-Message-State: AOJu0YyFNnjbvz1lczs0ijRvaWdwBR6VFHsdvY/8wQ18ZdXVo0dQy8FA
	LrkYrZPPC3Jt2Ejb3MBHIpcANIXTy27HKhfdDg1KCQvm1O1gaq97rZ/m/WyMWWZtBeMej9ba8HZ
	dY5LkggY=
X-Gm-Gg: ASbGncvpRTBX+x8ETI/YYfBZ2Vd4mNNKkofT7B2dOyrysmEHdEiFL7BB1xKNEVhfqxs
	4g8w1z7ShHuyv07q6Am2hVEGRKshJ2MNf3psBDKoGxDu/HgY05xzUaecNQtV/rCku2pnq+HKJQg
	QBEZxBJClhRRiJGE6U+5aDSogo+RfTffjB39pNtUWSlXJFV7hg1Dw4q4woNBBJjBDGmx5WjfJ2q
	dUQPSve3+IwUV3l5OkpQgNLSzwR+KFKW2vAJuMT7Dp2wpwpdHL+9WMe89cZxDHVFjnuSCbmbU9N
	Jqglmm6QDxTuiDHTJbqINhcPnME9NsCj18RG+VoTMIJbMe4f8j7I58Tl7HKq18H1dezDH3OogOh
	TAp9b4gcmC3XsDvRy1F2Yixs=
X-Google-Smtp-Source: AGHT+IFDYwP/XAPmsw6Jpoj15CoJgtCu0Ea4AQLRHfzMguMd37mhvSmUjLQCEfgd+VkDFCyxkvAq4g==
X-Received: by 2002:a17:90b:4cc6:b0:32e:43ae:e7e9 with SMTP id 98e67ed59e1d1-332a95b851cmr4040810a91.17.1758638346675;
        Tue, 23 Sep 2025 07:39:06 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3f58:7e15:309f:29c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b55100df86bsm13428368a12.23.2025.09.23.07.39.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:39:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 5/7] sanity.conf: Update minimum bitbake version to 2.12.1
Date: Tue, 23 Sep 2025 07:38:40 -0700
Message-ID: <fcfc3056b0b8d0c63fddd0a7624622aee9a1c2f1.1758638188.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1758638188.git.steve@sakoman.com>
References: <cover.1758638188.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 14:39:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223888

From: Martin Jansa <martin.jansa@gmail.com>

Needed for multiprocessing module in bb used in the next commit.

It was added to bitbake in 62be9113d98fccb347c6aa0a10d5c4ee2857f8b6
which was backported to 2.12 branch and tagged as 2.12.1

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/sanity.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/sanity.conf b/meta/conf/sanity.conf
index 6d3911ff94..5d2bedf011 100644
--- a/meta/conf/sanity.conf
+++ b/meta/conf/sanity.conf
@@ -3,7 +3,7 @@
 # See sanity.bbclass
 #
 # Expert users can confirm their sanity with "touch conf/sanity.conf"
-BB_MIN_VERSION = "2.12.0"
+BB_MIN_VERSION = "2.12.1"
 
 SANITY_ABIFILE = "${TMPDIR}/abi_version"
 
-- 
2.43.0


