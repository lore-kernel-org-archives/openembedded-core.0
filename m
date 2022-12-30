Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B87AC46467
	for <webhook@archiver.kernel.org>; Fri, 30 Dec 2022 20:33:06 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.27640.1672432380497070554
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Dec 2022 12:33:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Cl0DAkVl;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id o1-20020a17090a678100b00219cf69e5f0so26797935pjj.2
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 12:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=50y/ZNRw67JHVKoSfwCm2Mp/w9z3lrDT3tN9a6uXfOY=;
        b=Cl0DAkVlYkd4amVYjYOdTGMgTPJcaG8m6L49lUQsZHi/jda4uw1l8vH7R51cEAhy5/
         IdgEgpqw3m2CbIi55rDbIJo3vLaGSi73U2pF540dUwy3q05KtGvFJ/GUtr6nYY8WiG3s
         Z0N70zRWPp8To9I53gVe4UGLyhGr19s+k6BLYbXSDdrWqOA96YmlxOfjAMdrbn+5L2My
         /tz1l9RReeAqobNCjv6F0fNQTr8hz1p5hHzlkhunw617YGbOhSJf3MWjfLpj4SWf+nDZ
         09N9r36/1NsrD8J2KbQm5eSUZ9p5PsvIsMpO0qIC+m9wRMgFGHhjuHMCuhTAgfmYFEUS
         INuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=50y/ZNRw67JHVKoSfwCm2Mp/w9z3lrDT3tN9a6uXfOY=;
        b=DWPn1niviPJSRjIe+T6g0eN5PxjNMw6c/VRqrZuy760SLoNEzLoiGSmUFzKP8BkEce
         qOVwFtX1J/zSle5iu8VSB4qfJnldfFNwRfYVg+H7E7TvTQzqymyxRaStFS3Jju9AUM63
         ghuk08g4G50ogBDddA+8FQGS7+O3gQDcJamLb0K3mvkkmY57nNDKXzlFtMEKi+5PDyvU
         mTWDliNHQ/59pl2QoQ/ZwwthJV2suqoba+A9J/l5NLWXWScmifU5Gm0/YSECjyfnwekm
         UBEE91E5cF1YOHxX7zIj1z3Z1C0cGBQ6hHiK2fLkEzOKXZzCoE8kYav9siwGUvLIgD+v
         uDAA==
X-Gm-Message-State: AFqh2krqHHU/gdsHEnRQVXYL+JuGdKZQiW4rwf58o0flF5G1H8hlv43O
	uUXASAhrl1cKPgROaJxNKpQ/EmCUPz0=
X-Google-Smtp-Source: AMrXdXuIpqXAc2+hp0SHFbiY3H68erYimQqxqCjOjmA/dedaEIfTSDyuLNlrgSoI0IolIZMypQWB4w==
X-Received: by 2002:a05:6a20:d013:b0:af:ae14:9ecb with SMTP id hu19-20020a056a20d01300b000afae149ecbmr33960175pzb.17.1672432379554;
        Fri, 30 Dec 2022 12:32:59 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::bccc])
        by smtp.gmail.com with ESMTPSA id x15-20020a62860f000000b0056ba6952e40sm14093792pfd.181.2022.12.30.12.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 12:32:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] strace: Replace off64_t with off_t in sync_file_range.c test
Date: Fri, 30 Dec 2022 12:32:54 -0800
Message-Id: <20221230203254.1087816-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221230203254.1087816-1-raj.khem@gmail.com>
References: <20221230203254.1087816-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 20:33:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175176

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0002-tests-Replace-off64_t-with-off_t.patch | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch b/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch
index ce0428e977..0cabdfe99f 100644
--- a/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch
+++ b/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch
@@ -13,8 +13,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  tests/sync_file_range2.c | 4 ++--
  2 files changed, 3 insertions(+), 3 deletions(-)
 
-diff --git a/tests/readahead.c b/tests/readahead.c
-index 10723785c..b9597e697 100644
 --- a/tests/readahead.c
 +++ b/tests/readahead.c
 @@ -42,7 +42,7 @@ static const int fds[] = {
@@ -26,8 +24,6 @@ index 10723785c..b9597e697 100644
  	-0x8000000000000000LL,
  	-0x5060708090a0b0c0LL,
  	-1LL,
-diff --git a/tests/sync_file_range2.c b/tests/sync_file_range2.c
-index 0f7c9e428..15a5fec71 100644
 --- a/tests/sync_file_range2.c
 +++ b/tests/sync_file_range2.c
 @@ -20,8 +20,8 @@ int
@@ -40,4 +36,17 @@ index 0f7c9e428..15a5fec71 100644
 +	const off_t nbytes = 0xfacefeedcafef00d;
  	const unsigned int flags = -1;
  
+ 	int rc = sync_file_range(fd, offset, nbytes, flags);
+--- a/tests/sync_file_range.c
++++ b/tests/sync_file_range.c
+@@ -20,8 +20,8 @@ int
+ main(void)
+ {
+ 	const int fd = -1;
+-	const off64_t offset = 0xdeadbeefbadc0dedULL;
+-	const off64_t nbytes = 0xfacefeedcafef00dULL;
++	const off_t offset = 0xdeadbeefbadc0dedULL;
++	const off_t nbytes = 0xfacefeedcafef00dULL;
+ 	const unsigned int flags = -1;
+ 
  	int rc = sync_file_range(fd, offset, nbytes, flags);
-- 
2.39.0


