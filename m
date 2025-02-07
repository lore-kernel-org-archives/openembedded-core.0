Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54B64C021A4
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 22:07:14 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.1176.1738966028918104293
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Feb 2025 14:07:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zHS2WgBd;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21ddab8800bso37561505ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 14:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1738966028; x=1739570828; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yYRn5cHag0g7BDJjf/gZUUIGNBlzguKat19+jq1R8OY=;
        b=zHS2WgBdkfhyMahpa9DSwlU6Xq/f9wk7vDNR92zI2nDQQ+gQf+z6+dQd6cQRoBMz6B
         Wpdmap6gXCfRF1vYNzFLhBL3H85AfZYHW1NN+qfAUds2h9Dsr90KngIWcHwdBqIqhteO
         3ACmcOh6kUJRBRClueiPLgfvwD3J3ovJ5GUXpxHJ60eZwznczFfbYUiN3HodSnFDSE13
         uSbmgDxXbB+u6QHhpxTBH3wx13dCWAFMs+Om/N2xw7tTMHs0Y8gNOeM3zMRi5OxHFpbU
         qKdVRsBPHJ9Sl9gLBjDy6TqvwE7YGLNL7z7I97CtAjtSL5FLoML9filawImu2TSkUeXV
         /n5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738966028; x=1739570828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yYRn5cHag0g7BDJjf/gZUUIGNBlzguKat19+jq1R8OY=;
        b=rbCnsv7cYT429Qa9HKSjyCSrZzFKzkMJRCnyzHYOnTdO7CPoYc+dijzzf9wAK+1IyY
         uuEwyX4FI429Y6feCrTUCy+xP8VxZEsYLO/IvxryX1I2rH/FCnK2RmN957Z3KW1dEWYv
         KZ5eWUCD2LmhsFXlTJLS1V/dWrEGstlhGD0i8cEX4/gRvDDrcKKfDbm9FRxppo9EQ77Y
         urT3pMdWNjg0IraM1B4fHuitk8M6IAARlXti+xtqseq5EsQHjH8RegkTHB7sylnvfUwO
         IGBTmCijs5g01uk7FbAkDh0RkJQR58kgfkkN+TdkIAtRVNtg+2js8z7YOUFgbMd6UUK7
         gvIw==
X-Gm-Message-State: AOJu0YykojUf0qNX4cIVIXoH7QFgE8AXtPHcQhjWiNnq1DRzZL1gDDm2
	gxLDGDbHNvLVxRoCX/za2yXtvrnF/fMWm3Ib4G2BGQ93/zxHJF4XYL19JJQikx8QfLKVpqa9iTj
	6
X-Gm-Gg: ASbGncu5BsxxzZdndsXWexXgKiorASJ57/fr+5r6K4kJTmk4b6lHiXzvsPUNz5Y6s1k
	PUsDVm27ohw2A87hePct/abODH6+89ppuYeir2mAVA/eTHyJiidrSNfePy1yYEYMCz6NOqEQKf2
	Ydx6ZuDmKyRGTuhafjMrwNBEUwcJhuoiebZGa0MaCmCHv+rcEda1kjPWWrLTxqHz/SF+rfIC1T7
	kr8bDEBdyuQqQyP9Or+qQj7XkKXKD78OaTuF+PF77sGjQlKShGHqzddWbHWTM7GSmON/ndAaivZ
	B5G0
X-Google-Smtp-Source: AGHT+IGdZIbdzKTa4/UfXoTXtz6T/3aOg1y8rSw2F4VSRnz5J5LgIecO4VFt59KPIZZpFbUC9df2KQ==
X-Received: by 2002:a05:6a20:d706:b0:1e0:ca1c:8581 with SMTP id adf61e73a8af0-1ee03a8dbb8mr9505034637.21.1738966028174;
        Fri, 07 Feb 2025 14:07:08 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad51af65a31sm3586737a12.53.2025.02.07.14.07.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 14:07:07 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 08/12] resulttool/store: Fix permissions of logarchive
Date: Fri,  7 Feb 2025 14:06:49 -0800
Message-ID: <3600dc1053e083c5379ebf38fa1dd53a7f44a6f9.1738965898.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1738965898.git.steve@sakoman.com>
References: <cover.1738965898.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 22:07:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211007

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We want the results directory to be visable to other users, tweak the
permissions of the created directory to ensure this is the case.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ed9d887e8d71a800db19826264de552f7736dc6a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/resulttool/store.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/lib/resulttool/store.py b/scripts/lib/resulttool/store.py
index 578910d234..b143334e69 100644
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
-- 
2.43.0


