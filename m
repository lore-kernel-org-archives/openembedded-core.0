Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4326ECF58F5
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 20:42:41 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17331.1763584954835842261
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 12:42:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=VIbTCX9O;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7aae5f2633dso145452b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 12:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1763584954; x=1764189754; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KzbxCuLZuOE8DhzKp8bEBUMr519lVeflWKm/mKwxjfg=;
        b=VIbTCX9OL9PShCYudzZPQAJW+tTcWp1A9HzvyOhC19BUYdY78eU7/7C1vv2eaid/dd
         exS4OzY95fH70tsrjB54mjIynfxBvF4gjCO+JKgV9KIzU5v2F4f9innfi0h/992bmZYQ
         Tg0OA2b8nR6M4zx00LuoqBAjmQ065t3UDS4n4S0lwFIlZ9vk0Qfu6ssC9yLBMyplsAaP
         9HqaRWPgDo9fdo8152oryN0yBPuJZr1sF1A6dfOB16znuekCW4woq9ZneFIOdLfU4s6C
         6b5jQZcikn/MGjO6iPZwygIGu7csrqCJFyGNOQfSfn2/XzdhTqtPtMk/37yi9dWOgVho
         NozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763584954; x=1764189754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KzbxCuLZuOE8DhzKp8bEBUMr519lVeflWKm/mKwxjfg=;
        b=cJCte2Yqy1yFBRCbMogIHseWNi/8BKwEHi9VEFVOPjMXStii5q44S4D94p7f6VaF+9
         vEOhIF29VT/vmYPmfpj1jQcVEuDTtP2SLwlAIHsTFS9UFqn6wbpshWogsQa5yhKzsx3x
         DO9Xwf7zcl6+zcTc8vevNC0fbD3HvqsEYyTTmCUOVW/BUCXxoHEB3zakNS2SmgeKjojI
         z0MPMavJNF23d2cJRz0udogqIF8Zit99UGGmKAXX+muuEgPiHRE7Ym44QZTunlrq4cQR
         quYKc+qQJZkUUqK4JTWVqr6FNDwjdd2I3CdNfQVvphbfhRio4r9PPgAhqBXnFpz6lfu0
         NIOA==
X-Gm-Message-State: AOJu0YzMUnmDflHLa04dlta+Q1HjblXfNV4VMv6HG3220JGJXbEJqwG4
	BJuFKEk6lj4DKksfu0iVe0VDr19aUjRdFHCy56oMOzsJrdjoFq95bM6Ua76vt9vD1SWjaNvuxqc
	/r7T6
X-Gm-Gg: ASbGncsUK+hMPQnSMBJW3FQbAiOlOIYUY4BZA3C0sdNDjBzqckiKsZwrFc/Ym2zFbei
	fvRWihFQxqsw26c2Mp2VKN21QdBdJGg75EcuXWEGeybhK8Yp7n58FFJP/hY9jW3UXtYR6QLM61o
	dhTiioLKdcLPMt2j0eOXkCY3V1CsWq/Gm5bbPCKXcGWO7z37k0K5dno86lobV9a7sAot8fEv0AY
	Al8rvF0SXQqH+X9EscHB3ctIh9Sz3RjodlRAbnur/me/p5jom/CAzhQEYjOJxzHy/kAGn4XYQHz
	VzF9qh6qdyl3HtUcU+orsXL0qmrpzUIcitPJxofmSWDw7TPh8sdrB3KSTRCKdcbb32k0eD533/F
	7jP/ezl+1xF8FxoWR23VdrMZ4KcZfZv3ohCXOWqZDK+uS9kj4nBKTKAx2aJCZGjaiKR7Sz3pdDn
	KrHXS53g4bPdJw
X-Google-Smtp-Source: AGHT+IFSF6ind0QnE+hBmSSuuJE1HeZ5w1SXcALGtm1XKgMGfFpcmv+DOnzOin3yYP9/+wslK4M5vg==
X-Received: by 2002:a05:6a00:1249:b0:77d:6a00:1cd1 with SMTP id d2e1a72fcca58-7c3efb55e60mr503582b3a.12.1763584954096;
        Wed, 19 Nov 2025 12:42:34 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:95e8:2651:d6f9:404e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3ecf7d5adsm269866b3a.11.2025.11.19.12.42.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 12:42:33 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 7/7] oe-build-perf-report: relax metadata matching rules
Date: Wed, 19 Nov 2025 12:42:15 -0800
Message-ID: <ff72b41a3f0bf1820405b8782f0d125cd10e3406.1763584791.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763584791.git.steve@sakoman.com>
References: <cover.1763584791.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 20:42:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226597

From: Richard Purdie <richard.purdie@linuxfoundation.org>

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
(cherry picked from commit e7dc42e30c76bf0fbb4d3cc019bbec675bac55fa)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/build_perf/report.py | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/build_perf/report.py b/scripts/lib/build_perf/report.py
index ab77424cc7..a143b74653 100644
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
-- 
2.43.0


