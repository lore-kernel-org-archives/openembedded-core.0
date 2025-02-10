Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F18BFC0219E
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 16:14:20 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.55513.1739204050952346605
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Feb 2025 08:14:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=biuDIViw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4361b0ec57aso45676535e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 08:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1739204049; x=1739808849; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tATJD4yZxhSYYQ7Wtgzl6SEOiBig0iKpWPv17kAxLqs=;
        b=biuDIViwGFCQCdgU/sGDKUjB3wrNoxY8k6/V+mvkE50dOvaxpfZAhXVmXKM+Gfd9Os
         p9yqmrQMzf3LTKK8h3WWhoP9dqx26JwhMzWdRe7vKhtWHS1O37a2N8PhZQQVua8Zr//y
         cn4hRDhLIanN+jXrP5DdTRARYa51yOGoqY27Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739204049; x=1739808849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tATJD4yZxhSYYQ7Wtgzl6SEOiBig0iKpWPv17kAxLqs=;
        b=t7iSnGZatoyhOjBkeIpE1RnyHwE8of6jmo6bkJ0prFHHLccm2JoQA3IJm1J6qKgw9z
         5UA6G+7MCZfbUzLWXW72U/nRs97VTaR3WYu0+Ik4Y1oIBH6XfHxAw7wmPWUNbxH+Uqmy
         7sKfgE2ZrrFFFLrdQ1orz75E1DT7FQFdSeeadwSo12Jux4XuHUAUyNvYbtZCFRdzIJ/H
         cC0dBw+j67VSY5oKMEcwfCym2UGC29c+Mv+mIf93q34uWzOkvzXwQxZR/K5w+6qoHk6z
         uvLTgJRxrD1bPdpSLshFpsjkmACIjPSnHPKZTD40nF7UtqD3oqPBOWsgtS63O/GXcBQO
         UKaQ==
X-Gm-Message-State: AOJu0YxGhlmfGvowslKzNRsf/sLkPN0U06Hf0w5cvaOpPqdwjq0TdL0g
	PX8ohwgx5BHflJiQzD2nYE3jQeth9jtshLd6qa573b+vcK7uo4emn9gaCRZYs2Z/0eAIW9x2Lru
	S
X-Gm-Gg: ASbGncvWlZJMxd1hQHib5detnSRjdYxSORpNfgnUzuZGGYqBEHPCmrSfzbtnI5DxE8Y
	kp+1nV3gWesqT3GVdoX4Y1jg1dsohVGTS5CzODiwu0vSHopnAUeqHYwvMCCS8PAMaWCaW8Ql5Xu
	I6JAXPFTCPap/nU4ahvkOQnYSUiKe6rkqCZfp08tR9qM+487Uq/hx0Zm/Up2om0ri1G6Q8bSIpL
	ZBgtHddBNdgXTUHDCg9A5oZIqSwoGj85fy5blVI4FkkZ0A06oakdwf0Qd2Ct3V50rHtOW+O2NZB
	cKQzc2O8xh0y39RrpQgNZO9/oR0mnMxkq9w2/uJevww=
X-Google-Smtp-Source: AGHT+IF5QCet4A0YcK0lBIrGmkDys2CVmEHuGanBW/wiWxJR0xjYD+qKqxpYoSg0UT9kjNzbZsRBSg==
X-Received: by 2002:a7b:c001:0:b0:434:f5c0:3288 with SMTP id 5b1f17b1804b1-439250df455mr118201865e9.29.1739204049009;
        Mon, 10 Feb 2025 08:14:09 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:d33a:26d6:1846:991])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390db11264sm182262495e9.35.2025.02.10.08.14.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 08:14:08 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] oe-build-perf-report: Use commit_time if available
Date: Mon, 10 Feb 2025 16:14:05 +0000
Message-ID: <20250210161406.384031-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250210161406.384031-1-richard.purdie@linuxfoundation.org>
References: <20250210161406.384031-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 16:14:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211102

Currently, the perf report charts use start_time which is when the build
is run. If running builds for commits in the past, this is inaccurate so
switch to using the recently added commit_time if the field is present.
Over time, the reports will switch to using the more accurate values.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/oe-build-perf-report | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/oe-build-perf-report b/scripts/oe-build-perf-report
index 6c3c726ee3a..a36f3c1bca3 100755
--- a/scripts/oe-build-perf-report
+++ b/scripts/oe-build-perf-report
@@ -338,7 +338,11 @@ def print_html_report(data, id_comp, buildstats):
                 commit_num = get_data_item(meta, 'layers.meta.commit_count')
                 commit = get_data_item(meta, 'layers.meta.commit')
                 # Add start_time for both test measurement types of sysres and disk usage
-                start_time = test_i['start_time'][0]
+                try:
+                    # Use the commit_time if available, falling back to start_time
+                    start_time = get_data_item(meta, 'layers.meta.commit_time')
+                except KeyError:
+                    start_time = test_i['start_time'][0]
                 samples.append(measurement_stats(meas_i, '', start_time))
                 samples[-1]['commit_num'] = commit_num
                 samples[-1]['commit'] = commit

