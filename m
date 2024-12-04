Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28064E77170
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 20:45:37 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.25630.1733345136519279654
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 12:45:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=n3VjzZ1G;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-215cc7b0c56so1398605ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 12:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733345136; x=1733949936; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FqCFXr63BV/To2djs8Pkrk4glJPRCZ8K3tC2riG44o4=;
        b=n3VjzZ1Gy6xF21A4Id9DmnY9D2rwRkO1YM93bI3ZwKj1QMXOdmQ1aFq7mXnq53iqbd
         waC0R7nVp5UP8yFvop0S9A87Pv5tF0iaWIDKq5UISkJo6Kq65fPl4p6EasLEdWugaqk5
         KQ2B66qVs3+v025Bk0+QUlp3F8Nlfe4yKPMn6icLwtXpTp1P+fF8IzjCEHhPXCX71syB
         y522nJF2Ag8A1MmFuLdX4opkdxBzLC0gTmu8g2S7z6bGVQ8mMjKs+7Ra/7n+MzAJuq70
         9xwMwp5GDwGA7Bs9NajR85hGCNHc3EHZvPYo8q4dQMluBz+OBlUl2D+D1FXErAk8jFjt
         nLng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733345136; x=1733949936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FqCFXr63BV/To2djs8Pkrk4glJPRCZ8K3tC2riG44o4=;
        b=OzV9aliP9MUZJfV3F+RdTsemD6H5a+ClA3iQi2JcqCfCBF55n/VqC4V8Ei1Se4rLjj
         DPCEBEONy+fYKcli0N1zIoiU1IR3D4vwP3kM7ZYylJPygi6ilIMDsZGCc8dX5a9Z/79j
         iZz//eFBGAfh638z7b++wJs7n+s2TrWAiAOP95EFnng/pjI05FUDonEtBHSEl6Hv7XtB
         oCscgMDJoT5UMmMPOtsJ3Ur3OhXjZHyLJX0tAtBcj0mIgf9usw9QY6qH0iKx6m+VYiec
         EdNgKB4vcl7m8wrtfp/Xh9f4wiHGR7Lrvf+Ys8t2pODSB5csV8PPZtE/8V6CfrjpyATU
         ZyNg==
X-Gm-Message-State: AOJu0YzMqpN4csbZet0cFMpcyHtJJNXbBV0SssqaOv6UiGjRb8rVlZob
	feVm1qC79uArlCp1aGwUQw64ZFIndPQl9S1dKoJu/73ZTq4DUutOarVnLs/EVi7akALMCTB3PNf
	n
X-Gm-Gg: ASbGncsxiWEVdozU8PtVJKz3WnkekDFh0jIoGHXKNmxmDWkoF65zT64UPo36dUGLcf8
	Oh4Wb8qXBRiSExjq1JZ28GW35jBT7+BlB8dA0Y7/gWSpZ3JfJuhTpnuN35y0U9E4sU0g7eb68wG
	jd2rBBKVPm0nQLAwi7PXgAxZCLsNcoBcsiq1UcZ+SHXHaGeDAxsM5rxNNWD1mC8nzc2rcjRYblX
	amiQl+X+KUS4z+rvh5eZ7CGi9qYGk5sLp+8km8=
X-Google-Smtp-Source: AGHT+IGgR9fCVXUAQajLDwbXJfnMLaAMhmq5N4HtMOLtGlNVm1g2Izld1QvRNBdkx+onADIDqDATww==
X-Received: by 2002:a17:902:dad1:b0:20b:ce88:1b9d with SMTP id d9443c01a7336-215bd16224amr97235735ad.45.1733345135842;
        Wed, 04 Dec 2024 12:45:35 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2154dae56e8sm91387575ad.19.2024.12.04.12.45.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 12:45:35 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 06/14] resulttool: Allow store to filter to specific revisions
Date: Wed,  4 Dec 2024 12:45:15 -0800
Message-Id: <42a21e6f942208da75ae1121468379044ece77dc.1733345023.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733345023.git.steve@sakoman.com>
References: <cover.1733345023.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 20:45:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208350

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We have a challenge on the autobuilder where test results from both OE-Core
and poky are being mixed together during result storage which is confusing the
data. Add a way to filter to specific revisions as the least worst way to fix
the various issues this is causing.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3f276a0dc65341668788853be2cf27ab6aa12b13)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/resulttool/store.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/lib/resulttool/store.py b/scripts/lib/resulttool/store.py
index e0951f0a8f..430213bbfe 100644
--- a/scripts/lib/resulttool/store.py
+++ b/scripts/lib/resulttool/store.py
@@ -65,6 +65,9 @@ def store(args, logger):
 
         for r in revisions:
             results = revisions[r]
+            if args.revision and r[0] != args.revision:
+                logger.info('skipping %s as non-matching' % r[0])
+                continue
             keywords = {'commit': r[0], 'branch': r[1], "commit_count": r[2]}
             subprocess.check_call(["find", tempdir, "!", "-path", "./.git/*", "-delete"])
             resultutils.save_resultsdata(results, tempdir, ptestlogs=True)
@@ -102,3 +105,5 @@ def register_commands(subparsers):
                               help='add executed-by configuration to each result file')
     parser_build.add_argument('-t', '--extra-test-env', default='',
                               help='add extra test environment data to each result file configuration')
+    parser_build.add_argument('-r', '--revision', default='',
+                              help='only store data for the specified revision')
-- 
2.34.1


