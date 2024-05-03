Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF315C4345F
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 14:43:49 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.14699.1714747425876016714
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 May 2024 07:43:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=kGxOam5J;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.218.43, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a599a3b233cso68241866b.3
        for <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 07:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1714747424; x=1715352224; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=b4VD2cosPZuGzoJ785mH6eB3Mr8k9sjBUh5Mciv7Iys=;
        b=kGxOam5JYwyfQr8Io/qVRpWLL5vu5ECcGu2RvJoqbBJ89e+UtwStec3AA1AdNcTOJ/
         WkIedJZ+gR2NVULzeF4XscLri+6S34o8SzWSCtWysR8xYPbyVhi58lSO8LXGhzgG4RnT
         oMx5r96IeXI97r0sPB+jJzQatdA1WDy/9112OtzfkfZZKye470G2nXPWhNp41ax4aVyv
         1ian19lCWHOjMJqmDu/0xVRbk0Jy8vgrAyBipyl3Qk32uai+QDvVm8wj1JHRfZDtrsSk
         AFXtfachz+fUs8pl6b2OFLQBltJBfpX60r6ec9ZuUcansnGHmTefkMsKCfIeOy3gz5Qq
         MHWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714747424; x=1715352224;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b4VD2cosPZuGzoJ785mH6eB3Mr8k9sjBUh5Mciv7Iys=;
        b=NAyF/oRj7sn3rLuvbTBU/UhzWru6jTz5wu9gBpv3ZIGh6jmS9EJ0qg5Nnn73Lfv0xw
         svEjPgVE4+nH+ClxNoqwmhdrMpHmGiZhFesTvRYBZZ5mjmpkkUVodp5WvipwoXdMQHKa
         9EJb8zp04VMqqpNJAK+3mfV0tbBmGormyaq5xEmrLnYfpVAHt/ujXUKbyhwM9NoS2zjK
         yKnU7kM+WQEB0ARax1X5F14/f+logC6DG/Td2mzZUORiyvH0UPBjq0ZfUU2ni05oErVz
         tt+6643xQXDFuixw/0QMQhiUUo4FPHki9WtlavPl7OcSDi40GTl+mIK9fYLbrXC8VHH/
         UJeA==
X-Gm-Message-State: AOJu0YzkxhES42DCAlmIsNe+1odr8ghUBoYm4lWJhspMs7BAWwgHg2iE
	Vpqxv1SBVs4mF/pTvyE6mohs9/yY5HLqm0x3dE0ckIN4PdF45gj83jWL0y3RBVMiOrXGbrzPvbY
	yf9o=
X-Google-Smtp-Source: AGHT+IEYilEJKSHP861wwVGFTpiHj7HFXGEhWQxmU5HZsPmOUUR2cGKAgN7Ps/z2iZLWrJgRmdNf2g==
X-Received: by 2002:a50:a406:0:b0:572:9dc3:ce38 with SMTP id u6-20020a50a406000000b005729dc3ce38mr2403126edb.19.1714747423890;
        Fri, 03 May 2024 07:43:43 -0700 (PDT)
Received: from localhost.localdomain ([95.90.235.164])
        by smtp.gmail.com with ESMTPSA id en18-20020a056402529200b005721b7bfea2sm1731017edb.22.2024.05.03.07.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 07:43:43 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	randy.macleod@windriver.com,
	engineering@neighbourhood.ie,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH v2 0/5] Improvements for performance test report view
Date: Fri,  3 May 2024 16:43:35 +0200
Message-ID: <20240503144340.27385-1-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <5e46a5c002cc62e0da9f3053c890120eb4582820.camel@linuxfoundation.org>
References: <5e46a5c002cc62e0da9f3053c890120eb4582820.camel@linuxfoundation.org>
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 14:43:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198996

This work is done according to "Milestone 9: Build performance test report view" as stated in the Scope of Work with Sovereign Tech Fund (STF) (https://www.sovereigntechfund.de/).
The current report can be accessed here: 
Performance test report HTML (https://autobuilder.yocto.io/pub/non-release/20240117-15/testresults/buildperf-alma8/perf-alma8_master_20240117090048_663f180574.html)
The report is created using the `oe-build-perf-report` script in the poky repository. This script generates a performance test report in HTML format using the data from the yocto-buildstats (https://git.yoctoproject.org/yocto-buildstats/) repository.
The report displays the performance test results in line chart format. The chart x-axis represents the commit numbers, and the y-axis represents the test duration in minutes. 
The report also includes a table that displays the measurement statistics data for each test. The report is interactive and allows users to zoom in on specific sections of the line chart.

The current report format required some updates to make it more interactive and user-friendly. And this patch addresses such improvements:

- Add [Apache echart](https://echarts.apache.org/en/index.html) library to create oe build performance report charts and make them interactive.
- Restructure data to time and value array format to be used by echarts. It also converts test duration to minutes and adds zoom to the charts.
- Update measurement statistics data to include `start_time` so that time can be displayed instead of commit numbers on the chart. It also updates default commit history length to 300.
- Add styling updates including page margin, labels for x and y axis, tooltip, and section descriptions.
- The charts are created as step charts instead of plain line charts.
- Add start time, size, and commit number to tooltip.
- Add dark mode view

Updated report screenshots: 
https://github.com/neighbourhoodie/poky/assets/13760198/65a1890c-fd2a-40d4-ac90-f13055735e53
https://github.com/neighbourhoodie/poky/assets/13760198/b40c326b-17d2-42e2-8e41-72e52ed2c003
https://github.com/neighbourhoodie/poky/assets/13760198/cc7ec996-9dab-435a-8fdc-82a2a4193c0a
https://github.com/neighbourhoodie/poky/assets/13760198/6e0fe09d-50e5-4b0b-b70b-6943f71b5208

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


Ninette Adhikari (5):
  oe-build-perf-report: Add apache echarts to make report interactive
  oe-build-perf-report: Display more than 300 commits and date instead
    of commit number
  oe-build-perf-report: Improve report styling and add descriptions
  oe-build-perf-report: Update chart tooltip and chart type
  oe-build-perf-report: Add dark mode

 .../build_perf/html/measurement_chart.html    | 140 ++++++++++++------
 scripts/lib/build_perf/html/report.html       | 124 +++++++++++-----
 scripts/lib/build_perf/report.py              |   5 +-
 scripts/oe-build-perf-report                  |   6 +-
 4 files changed, 193 insertions(+), 82 deletions(-)

-- 
2.44.0


