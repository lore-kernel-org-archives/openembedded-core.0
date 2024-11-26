Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A845D3B980
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 11:12:02 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.43799.1732619520729681957
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 03:12:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=F9xqI/zn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4349cc45219so22403575e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 03:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1732619518; x=1733224318; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=kd+TEWJGNkVz7RX/dvC0ExSZ3Qfh1FmptfFj8murXIg=;
        b=F9xqI/znE+vc3r+g8QFUuJve6gBqgaTlvepUwoXyiMGiafzvrIpxpPOteroNRv74zB
         u2W+oOT5zPb577FFYXWFsTWfYeMxfG63olhEHbOHRzbrmjNCK+z3+YkPcs9ya+4087bw
         sjsT2YLshj26+oQORPhIo15z2I74Jshc33msg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732619518; x=1733224318;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kd+TEWJGNkVz7RX/dvC0ExSZ3Qfh1FmptfFj8murXIg=;
        b=BnQ0ROxCde9aSSUV08O3NFjErf26s2tTWDjeVSRryTVsWj8nLFuDi/NW3RD2R5uZLY
         wEGYeYPitW+NqWHcf1hRltIhtLpcH9D2It0s6CMRJuV4n9iZWc3gu934DfF89Pjj8aWa
         /2wcj7RNNdX6+mHAScWe3k3sXFQyYZynIZIazOApxZCFVLYA7rwoMobRbCdWim8b0t2r
         RYIdfMs+q582J4CgY81PeRiF6qkQ2kzXqrUJFpgmQJqdtKufW8tSQFah2A9RaK48BI6t
         yS/h5LGoJduf1+7KksauSTbgkmux7Th2OpfUCTX+xTsLMvzqv/L2HmkTyVgqF0JNAzy+
         4FOg==
X-Gm-Message-State: AOJu0YxBVr7BHpQLmssDnxLmSso40LL1+p6cnldkskNJqaS3tycmnjI8
	3J03nDkkaJBUNLRneriyvr7PW4YKpxffk9NDstePGexRsuo4UvXQ6wOwsnPPInPGdtOScWryKLM
	q
X-Gm-Gg: ASbGncuhJcO8148vt8KlzE/3ajrtKynJS7/BviBAcZqZf/gkZdeHiIJRszIyqlbZkxA
	GMCDQcfDKwe82Wd5rl5ybIYykEEL0y0Q7xrZ5+pnSiqnYaRCUxT6cqNIKCQ0C8rtq3eJLw8qkRD
	8r22ScDFCX9eSUraafrkrBMuuV28SctQ7Uzkm0MSbS9EtmrbzzeC6uwbSCqrBEXXIN9aCdAIOTU
	hWcu+aUF9OgwziMbjKEJaPce9Ju2aJ6v2GJLg9cgc5IM2HY7fYPrFTsib4lG7+72itOmANBFDLw
	dfA=
X-Google-Smtp-Source: AGHT+IE6nskMq3ZuNy/o4so+w8ReoLDK46TcHyUMDXzhiBCCHPej+Rte6E7cvKX3p2Ux6g/++ZVawg==
X-Received: by 2002:a05:6000:1541:b0:382:22c6:7bcb with SMTP id ffacd0b85a97d-38260b455f0mr13054735f8f.3.1732619518234;
        Tue, 26 Nov 2024 03:11:58 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:cd02:66d6:ae48:875b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fbedad6sm12952247f8f.91.2024.11.26.03.11.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 03:11:57 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] resulttool/store: Fix permissions of logarchive
Date: Tue, 26 Nov 2024 11:11:56 +0000
Message-ID: <20241126111156.3207482-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 11:12:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207846

We want the results directory to be visable to other users, tweak the
permissions of the created directory to ensure this is the case.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/resulttool/store.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/lib/resulttool/store.py b/scripts/lib/resulttool/store.py
index 578910d234d..b143334e699 100644
--- a/scripts/lib/resulttool/store.py
+++ b/scripts/lib/resulttool/store.py
@@ -87,6 +87,7 @@ def store(args, logger):
             if args.logfile_archive:
                 logdir = args.logfile_archive + "/" + tagname
                 shutil.copytree(tempdir, logdir)
+                os.chmod(logdir, 0o755)
                 for root, dirs,  files in os.walk(logdir):
                     for name in files:
                         if not name.endswith(".log"):

