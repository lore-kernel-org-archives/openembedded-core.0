Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1BB4CA0EE9
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 16:45:26 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.16486.1755276319046036323
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 09:45:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=oA73ZBnD;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-32326e66dbaso1625188a91.3
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 09:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755276318; x=1755881118; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EgunYcJp8Ik1U7XoIgkfESNl0RRUJO/u/xE+MOOgRp4=;
        b=oA73ZBnD0IwuGYDnO+cQU53G6GRtF1qvXSoMzH6H3mHCnwdjzn6Eff55zLUEAAEOBS
         0hXQmKrZOlereE18ff/nXCw6w8ltq7wJBDIzFJ8YJAs85oYdzWdBjP/9GxYK29D+jQ3M
         w+5w3cokM+zX8lc3aIaHCm0vDqPjpBUspXxHwGgEeNv7gsoAh+iQVh80ZYDNB7asoWQ1
         eTJTYmeZK35HF38luKTAQ15kPBDfR+maFFJ+2XFZxuUMnt7X49uSA5MAJawREYx+COSb
         02KnSNkYcBnj5xKJqNlEVl8pkfBgWOw6cZWrJ1eEEVS92u9ncNOiLmLL58OU5gd7r1CG
         qkww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755276318; x=1755881118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EgunYcJp8Ik1U7XoIgkfESNl0RRUJO/u/xE+MOOgRp4=;
        b=QiC88Oa4NINhi+MPyo/aBvkMj9L4bLprqYJLgPb9BNNY3+bEhBM8S1LhipUUNNJ9lN
         7kqXbRc9J5YXRoDHzaTslq8K0rcO4oeblx9H+AbsC5G8KjC2nEt/IXBDZgIQ9pwqvYbu
         SgaOSm7lVxw/3mIekE8JPGL7Tk8TTY0vTJXIJ+zoS6Bunzrmmfj/jiBG/bzwciuMXetL
         HgiseUIpk8Hv6mneJZpiNJNL3GMQrQxGb/bRABTge9qRymVkN0nvQyzPf8pN8WY+NV+K
         Kv06TVVJKWZO3A7Bu/2mPINhMcqeF4KZ5rUthUon9XhuyeF5JMY6zG5NaUXAW+/ppyiD
         oc1Q==
X-Gm-Message-State: AOJu0YxI/0pYpH1AaZ/9rHB+yl/PAy+/RgPTjiuordtJ1n2kyccXI/Qz
	2lTYEtugt/x462rw+peYccDFGYZT11K124P2NSZVhyDRSDUuxnxxMVRGWtEKo8h/QHY4JtqH209
	jG0+B
X-Gm-Gg: ASbGncuAngbWAlVSZ0W+4lZ85iS9gGAjxVRBTnJ7w9arA6JXKlD8LQIy+ScNstat2we
	I3iK6oRhNk0HBje12t+47cnM1NqXDx4nP+F9DqD+atLKJvJKYo4LQqNPAPOPlYZClwSPbro2zen
	+hwINE8PD44f8TWJD1Sw5qgn0nyrD4qrnlutcWn+mOR8RGJHapsUL28lTL9woeJcqtprxA9S4i1
	beiwNpB3uRNw2q2xMarRC9zRX7kDAgLOiCOP4YnC4jdbkVRZEYQNPSD7BwwBNefTB9EalgNQqtb
	FG08MWdQZqoqEz6eTGH9Il9nExaJ+Ff8IzdkioXCKcSyRQ3uaHpt6fR4s0b2jfz4ISyLzQLsQVm
	2bGwdLv3pMGEv5v+2n9UW67UP
X-Google-Smtp-Source: AGHT+IEJoQz1zKTrDpf+VQpcHGlQsjK0h++KmJuSH3m4WKKKuTdVftYruYHuCkYgOHN8gUUka9Qnvw==
X-Received: by 2002:a17:90b:4c0c:b0:321:38a:229a with SMTP id 98e67ed59e1d1-32341e12681mr3703610a91.7.1755276318235;
        Fri, 15 Aug 2025 09:45:18 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3ec5:7840:3390:1caa])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32343c9ab2asm1554476a91.30.2025.08.15.09.45.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 09:45:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 9/9] go-helloworld: fix license
Date: Fri, 15 Aug 2025 09:45:00 -0700
Message-ID: <fa45d6d5bec8fe503ff6b9166a3b4af31ea95369.1755276097.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755276097.git.steve@sakoman.com>
References: <cover.1755276097.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 16:45:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221989

From: Quentin Schulz <quentin.schulz@cherry.de>

The example repo doesn't seem to have ever been under MIT to begin with
but rather Apache-2.0. It was then changed to the license used by the
goland projectm that is BSD-3-Clause, 2 years ago in commit 00c7068f9d83
("all: update to Go license").

The license file exists in the sources, so use that one instead of
taking it from the OE-Core license directory.

License-Update: Incorrect license is now proper

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/go-examples/go-helloworld_0.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
index 98cd4d8103..6f0214aa60 100644
--- a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
+++ b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
@@ -2,8 +2,8 @@ SUMMARY = "This is a simple example recipe that cross-compiles a Go program."
 SECTION = "examples"
 HOMEPAGE = "https://golang.org/"
 
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 
 SRC_URI = "git://go.googlesource.com/example;branch=master;protocol=https"
 SRCREV = "d9923f6970e9ba7e0d23aa9448ead71ea57235ae"
-- 
2.43.0


