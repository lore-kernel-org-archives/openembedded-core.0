Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19E511099B2A
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 17:22:17 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15666.1774020400075535418
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 08:26:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hqtCWqrF;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: ernestvanhoecke@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43b40fb7f95so2107116f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 08:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774020398; x=1774625198; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N7hS1r0j61GEfzWE1q7mcPBSgBJ9L6u0Nuyj97dD78o=;
        b=hqtCWqrFG/zfLQL22hG5s5QyAuMp14w/0KRiQlUR5kN6+Iohe6r98eeUU8RimqTike
         Si338qGTfid3Kt/Yu8CxmvFFqID7851uMv9rScXcWcsIldmljG/mvlaG32k3mlrmdAL5
         ROhlmpQn2flOI2YezPtdi8Fl6OhHpgwDEVzAI0CdhCSgyEIeGAb1CFdLGKoZzEYk/gdN
         krrGbYFzXXEQ2yuV/Z8XOqLilBiOjbgYdzVvLAfBkqArkHm8/MUfHwCrtPIb+20dgfWp
         8fErSq9KgF/xCL/BGmkvygEcuNUNmhfGHvY5K5IEBe4y3PagdYZcYIcDc9bKeYpfNyqb
         ZQrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774020398; x=1774625198;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N7hS1r0j61GEfzWE1q7mcPBSgBJ9L6u0Nuyj97dD78o=;
        b=Nj84K++fdt2QZZeCGzZWKWMFlFvbuHgZwgu3wwRwYm5a/YeXvyHmBqmLJPjeK/Anxc
         cXi1ajJa9jaCYQN+4R+DO947BMzmexZZdhw+zhqTzaENkH02R+rdhupe9CGUBLAKq0Eq
         xQ0EfQN5NalulwtpKUEyZOUYXt9Je5yokDocBs8AxFR3+RndcOE55+Xgc6wu4YUZgKJY
         TDh1uqQCgtJOr+ntEn/VN+54fc+iyJNrPyWuMcDKabWb0kFmQSluEqZ4dc4yJGldA0dm
         zaGciRomWRjQtivBhDiLgr1NagvjJCTH2BGt2yj0IM3+iqg7cBpsZc2i1uhW7Ep3f1A0
         qX0g==
X-Gm-Message-State: AOJu0YzP/GZa8B1qtQAGEuvsW7X2Kr3qvcxGGECfry1DdPIhpukTslGw
	v7rzP1zk9e5c7xbz4vIwrdp8LzjAbJV6l7uIBBRXzKUVidNNxdX9EL3p
X-Gm-Gg: ATEYQzyhgtMuVWeKiQNEaYWBfWRXOPS1S69JBJtMb8DStN/Apz08KIwTYdCSM131X2L
	Iavbl7ITpmiLmILe4M+zgDDDuzQZHjlo2VYOjnvBUZFhoqBVls0QeTIPCg3sNpV9DKcFmSP08tR
	4OA8WJNwENcOmTZhYgf4P2DIKjm8hLwOynh9XW4jzKzjCNTD+1A9WgHcDlPkvS4330d6qj6y0r4
	FKdSrKRAXFcqJrA7U5fJM5Sec1UaZE58So+ueXauaEep29kYMSp/R17VGvChzOqDFf0nEuxqgPv
	M3CQNg2YFDZ2+vv8cgFO1vpv3DyVzzcSiD4p3nRxET+lmcaJQPrCxOeJGDorrn90wX3T0Yk1J5o
	a/rr40iv7iuv8OpM0e8w63Wd8GKhrJEbSRjbc+RLl13bnCJ4FHL1fEcM6M9K1rzcdLOp7exob2T
	0+0fyaw0Xctiwwqg7b4//uloFj7xOPjtIfLQxn+K+qNojMnEMZ87UpDJ9eO5x1QTxKe6UQfLKEC
	OmC9Dc+LNSElTn7vVKr6ZAKLmgiPZJy/0nL4wu5
X-Received: by 2002:a05:600c:45c7:b0:486:fba7:b150 with SMTP id 5b1f17b1804b1-486feddb6d8mr51187005e9.15.1774020398267;
        Fri, 20 Mar 2026 08:26:38 -0700 (PDT)
Received: from ernest.hoecke-nb (2a02-1812-1193-400-55ca-2f77-dd7b-9cf7.ip6.access.telenet.be. [2a02:1812:1193:400:55ca:2f77:dd7b:9cf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe879d37sm25998495e9.1.2026.03.20.08.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 08:26:37 -0700 (PDT)
Date: Fri, 20 Mar 2026 16:26:36 +0100
From: ernestvanhoecke@gmail.com
To: Quentin Schulz <foss+yocto@0leil.net>
Cc: openembedded-core@lists.openembedded.org, 
	Quentin Schulz <quentin.schulz@cherry.de>, Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH 7/7] mesa: depend on mesa-tools-native for less expensive libclc dependency
Message-ID: <yj4junqgkdaddl3upgyn7pzeqvlbr2q4a7zl6llrv2kzlbznlr@62bryfzytptx>
References: <20260206-mesa-tools-native-v1-0-166935b0e379@cherry.de>
 <20260206-mesa-tools-native-v1-7-166935b0e379@cherry.de>
MIME-Version: 1.0
In-Reply-To: <20260206-mesa-tools-native-v1-7-166935b0e379@cherry.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 17:22:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233629

Hi Quentin,

Recently our do_configure task of mesa started failing with the
following error:

| Program pco_clc found: NO
| 
| ../sources/mesa-26.0.1/src/imagination/pco/uscgen/meson.build:7:17: ERROR: Program 'pco_clc' not found or not executable
| 
| A full log can be found at /var/home/vhe/build/tdxref/master-extint/build/tmp/work/aarch64-tdx-linux/mesa/26.0.1/build/meson-logs/meson-log.txt
| 
| Last 10 lines of meson-log.txt:
| int i;
| 
| Cached compiler stdout:
| 
| Cached compiler stderr:
| 
| Compiler for C supports arguments -Werror=pointer-arith: YES (cached)
| Program pco_clc found: NO
| 
| ../sources/mesa-26.0.1/src/imagination/pco/uscgen/meson.build:7:17: ERROR: Program 'pco_clc' not found or not executable
| 
| ERROR: meson setup failed
| WARNING: /var/home/vhe/build/tdxref/master-extint/build/tmp/work/aarch64-tdx-linux/mesa/26.0.1/temp/run.do_configure.144042:173 exit 1 from 'exit 1'

Reverting this patch fixes the issue, but it does not seem to be the
commit that introduced the problem. It only started later, presumably
something changed in pulling in libclc or a similar issue.

I can bisect it more later but already wanted to ask if you or someone 
else had any ideas. Thanks!

Kind regards,
Ernest
 

