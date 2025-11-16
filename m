Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21325CCD19A
	for <webhook@archiver.kernel.org>; Sun, 16 Nov 2025 23:47:49 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4945.1763336867025303842
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Nov 2025 15:47:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SUqyNWnA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47774d3536dso30191475e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Nov 2025 15:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1763336864; x=1763941664; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=csNQ/Py+cJiDkvFHsO8e3qtQLoku810pbXNk2lBsOJ8=;
        b=SUqyNWnA48ucXZu2o6VqAJPGl6nVZI5O4i7efGeE4gKix9MtQAL3OpdjmeOA/gfuo0
         lf0t1e1KbwMfCzx/RmMD9k/3atdQE4kifR4ucl5jAkbkfya0SXN3mBiO/KZAdyM1bwoj
         2bhxlVOzQ/zfAW4gKMSOA+KVAhzPPpkqQMh/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763336864; x=1763941664;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=csNQ/Py+cJiDkvFHsO8e3qtQLoku810pbXNk2lBsOJ8=;
        b=oh2KrlmYGDt+I/hAoXvVKtzk5El7IyWRWYy+P7b9Mxn48ROMFs7e69NAP6ZcInETJf
         VTpOpJDYC1kboPWmRr2bhupNXepPkCfIfcva7voRtbzmXwyO+0tU3TWgZBpRIWjYNc6C
         eBVQA7nf5diRNa5cop+5etxS5r4Jpip8f6KQEyNAofIF2GoroWUUWBcCCtpPL6DXPq73
         sTu+CElenxPD2LBrY3R3YMmKPNphoN59UUCRdlpBBM6s4DlVAs7rPhwc+QB53MGU4gQt
         1rxbY4BJZpxEz/ahwSGKyuVK2YTdle3Y2mj6XkaIn32srpueQcqP88pJpCWZ4cX6nXzy
         QBOw==
X-Gm-Message-State: AOJu0Yy8OX2Y0IS6sg5mOLleO5E2EJZLvewwJFmxzPOuhwX3wcRx1s+y
	1YEeisA9YPgw+gmZMkWuNbzScTqCvHumeg3NikTnMaxwU5SpA3N1krfM1Hc5oKUxU06BlxqTjiq
	mMZp/
X-Gm-Gg: ASbGncuIOxtG9mrRZFBdkiQ9BZL9pk976WoaSTgNe1UaZNQqFKsQCEvoEF8PsJXp3j7
	BdDgMya1GMMs2WN+bDCcDpwO1zsvbXpGAaX1HnKJZY8uFnZuQjnpQeejPraj4Y/mnOPQ9XzuWEP
	GtHD+ksnC20RCPe6FsdNjy+UaQuuioaPf6nm0SIMCHoO1iM9sGe/yxZAvNK3of1NmoZK+r1i7NK
	xL60vUES0W2QNekKDuHz361nncA4GnnpQ2rnQ9TzKfPEN8fVhsSRzmf286GCsUlIfrXjPHZNJg7
	7VDWUNx8MGuIoFSSsXnCjdI7qr5aF+j2zXZd1wkxFv9TDGrqYnnc8PwumzkcNgIas1B04mrM8hn
	QYt9f/w0/MsVfaBH636Hz0fePSv1qbqlnmT26X0BYmsPbqH901DpJJgyV01vY5zxICGi7fivMwS
	NjH4ilMiW+yXygqkTya4r3wfPeOww9
X-Google-Smtp-Source: AGHT+IGefFkTnynqWWrhcOqC087oZG2iMGeEGz/ysmHKYS7rGOZMRn2Y8xEbORuHhPRtCQc0cDHWhA==
X-Received: by 2002:a05:600c:1547:b0:45d:5c71:769d with SMTP id 5b1f17b1804b1-4778fd89eafmr105035615e9.8.1763336864221;
        Sun, 16 Nov 2025 15:47:44 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:e709:ebbb:d3ce:b049])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47795272c53sm136616895e9.9.2025.11.16.15.47.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 15:47:43 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oe-build-perf-report: relax metadata matching rules
Date: Sun, 16 Nov 2025 23:47:42 +0000
Message-ID: <20251116234742.29178-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Nov 2025 23:47:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226477

As the poky repository is no longer used, measurements are indexed using
the oe-core commit. But as bitbake, oe-core and meta-yocto are now
retrieved from separate gits, while measuring performances for a given branch
at some time interval, we can get the same commit for oe-core but
different ones for bitbake or meta-yocto. As a consequence, metadata
associated with the same index (oe-core commit) might differ.

To work around this, relax the equality checks for commit, commit_time
and commit_count since they might no longer match.

Ideally we'd group them into separate results but for now, treat them
as being the same.

[Based on work from Mathieu Dubois-Briand but fixed differently]
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/build_perf/report.py | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/build_perf/report.py b/scripts/lib/build_perf/report.py
index f4e6a92e094..9f5e8a4a0e3 100644
--- a/scripts/lib/build_perf/report.py
+++ b/scripts/lib/build_perf/report.py
@@ -137,9 +137,12 @@ def results_xml_to_json(elem):
 
 def aggregate_metadata(metadata):
     """Aggregate metadata into one, basically a sanity check"""
-    mutable_keys = ('pretty_name', 'version_id')
 
-    def aggregate_obj(aggregate, obj, assert_str=True):
+    # A given OE-Core commit may point at different meta-yocto/bitbake commits so we have
+    # to ignore commit/commit_count/commit_time differences
+    mutable_keys = ('pretty_name', 'version_id', 'commit', 'commit_count', 'commit_time')
+
+    def aggregate_obj(aggregate, obj, assert_obj=True):
         """Aggregate objects together"""
         assert type(aggregate) is type(obj), \
                 "Type mismatch: {} != {}".format(type(aggregate), type(obj))
@@ -151,7 +154,7 @@ def aggregate_metadata(metadata):
             assert len(aggregate) == len(obj)
             for i, val in enumerate(obj):
                 aggregate_obj(aggregate[i], val)
-        elif not isinstance(obj, str) or (isinstance(obj, str) and assert_str):
+        elif assert_obj:
             assert aggregate == obj, "Data mismatch {} != {}".format(aggregate, obj)
 
     if not metadata:

