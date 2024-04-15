Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46127C4345F
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 14:41:38 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.22809.1713192094442887308
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 07:41:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=l4QwWKZx;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.208.45, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5701dec0c0aso1550972a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Apr 2024 07:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1713192093; x=1713796893; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K9/Pbrvl2Ac1Qfwga+UmXt58ZeEWJvuZ1qO34yvmvHg=;
        b=l4QwWKZxH9FWDEMirM5bLazRuaKmRg5U0J/FzSeFeyhpg1lBReyDFcu5BpFIK6d2AU
         08I1a2bhauE3VZwwaC/iTLP8XaIgUK+FIYqax14jlfBs/+fcOGynqsMqkmx90sZ5iZVS
         egpfs24t6kkpOy6BE6T+e6f4AyiuQkLv0HmWEkU8TffmwjpsazRfbWQMr5bSbOc6weXq
         VXhARNocc+jo0Jnk5X4tf2ODGFcZsUjoJDYuYBrSHMMO4BFVZwczTmQBz4ksY3tEMJlA
         gho51tE0v5y8kD2WOP4rd//HXZ+zdC3QEal1DfUXjg01d6LRKPj1GWEKonHN67uxQqAk
         ooJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713192093; x=1713796893;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K9/Pbrvl2Ac1Qfwga+UmXt58ZeEWJvuZ1qO34yvmvHg=;
        b=rQMl54Dg+O/P8KadxpHFQZEnICw1yhVY+AbvM58AlED9d5skyiGxBHOixTcGVccLbs
         tiCeChWLs2GPiYdb3Hhclq8XE+FckvN2bfHYT1J/HeJ8M1Hb4R/moBSzKiI+ZYuzaU5X
         x1cQux1zl7lCj3YTb10J5Facl+5TggH6eShpXH3wB9HEXTF4eolDertN5hqVHR+Bkrif
         DwZYvmBL51S7vZ1l07Z65uiRQjE4Xf58g/rODv6tHLvTFUF8l16ZE9e/kh/h7aMXNp+Z
         +wvZdlWxVGD/2rzE78FtLhDmfqyww7qGasf8/kkg9klHaY9OVU5iunExanTTP113LZtS
         gT7g==
X-Gm-Message-State: AOJu0YzF/evRzvMTXtJ3rNBuZxhF5LO0+3SlVgYqCloKCY5/o4hugwXm
	N+/QFHZKwgJRqY+mQWqBDXEi3WTmiFksMCcHU248DjiE6z+r97b4jqfm8dt0dT8MuE7AxI1xvBw
	x
X-Google-Smtp-Source: AGHT+IHCLZvNKmdQJAWT3zw/IyBM1npx7XqU1qQo3TirMapvc+6DPeXfqgxLmcSBzKQ86LVhYXpaRg==
X-Received: by 2002:a17:906:538f:b0:a51:c0ad:75ac with SMTP id g15-20020a170906538f00b00a51c0ad75acmr6050816ejo.19.1713192092760;
        Mon, 15 Apr 2024 07:41:32 -0700 (PDT)
Received: from localhost.localdomain ([62.72.77.226])
        by smtp.gmail.com with ESMTPSA id bq3-20020a170906d0c300b00a522f867697sm4658749ejb.132.2024.04.15.07.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 07:41:32 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-core@lists.openembedded.org
Cc: Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH 0/3] Improvements for performance test report view
Date: Mon, 15 Apr 2024 16:41:26 +0200
Message-ID: <20240415144129.92641-1-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Apr 2024 14:41:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198239

This work is done according to "Milestone 9: Build performance test report view" as stated in the Scope of Work with Sovereign Tech Fund (STF) (https://www.sovereigntechfund.de/).
The current report can be accessed here: 
Performance test report HTML (https://autobuilder.yocto.io/pub/non-release/20240117-15/testresults/buildperf-alma8/perf-alma8_master_20240117090048_663f180574.html)
The report is created using the `oe-build-perf-report` script in the poky repository. This script generates a performance test report in HTML format using the data from the yocto-buildstats (https://git.yoctoproject.org/yocto-buildstats/) repository.
The report displays the performance test results in line chart format. The chart x-axis represents the commit numbers, and the y-axis represents the test duration in minutes. 
The report also includes a table that displays the measurement statistics data for each test. The report is interactive and allows users to zoom in on specific sections of the line chart.

The current report format required some updates to make it more interactive and user-friendly. And this patch addresses such improvements:

- Add Apache echart (https://echarts.apache.org/en/index.html) library to create oe build performance report charts and make them interactive.
- Restructure data to time and value array format to be used by echarts. It also converts test duration to minutes and adds zoom to the line charts.
- Update measurement statistics data to include `start_time` so that time can be displayed instead of commit numbers on the chart. It also updates default commit history length to 300.
- Add styling updates including page margin, labels for x and y axis, tooltip, and section descriptions.

Updated report screenshots: 
https://github.com/neighbourhoodie/poky/assets/13760198/65a1890c-fd2a-40d4-ac90-f13055735e53
https://github.com/neighbourhoodie/poky/assets/13760198/1ed43876-73a9-487e-aed3-ca0edf97514c

For local setup, you can do the following:

1. Clone the yocto-buildstats (https://git.yoctoproject.org/yocto-buildstats/) and the poky repository (https://git.yoctoproject.org/poky/)

2. In the poky repository run the following to build the report HTML:
```bash
./scripts/oe-build-perf-report -r "LOCAL_PATH_TO_YOCTO_BUILDSTATS" --branch "master" --commit "663f1805742ff6fb6955719d0ab7846a425debcf" --branch2 "master" --html > test.html
```
Note:
- Add your local path to the yocto-buildstats repo
- The above command builds the report in a file called `test.html`. You can access it in the root directory in poky.
- This exmaple report uses the commit `663f1805742ff6fb6955719d0ab7846a425debcf` from `master` branch.


Ninette Adhikari (3):
  oe-build-perf-report: Add apache echarts to make report interactive
  oe-build-perf-report: Display more than 300 commits and date instead
    of commit number
  oe-build-perf-report: Improve report styling and add descriptions

 .../build_perf/html/measurement_chart.html    | 116 +++++++++++-------
 scripts/lib/build_perf/html/report.html       |  96 ++++++++++-----
 scripts/lib/build_perf/report.py              |   4 +-
 scripts/oe-build-perf-report                  |   6 +-
 4 files changed, 143 insertions(+), 79 deletions(-)

-- 
2.44.0


