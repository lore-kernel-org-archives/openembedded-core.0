Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63A51C4345F
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 14:49:52 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.22887.1713278988333163724
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Apr 2024 07:49:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iT9rb80u;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-343c7fae6e4so3714969f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 07:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1713278986; x=1713883786; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wRera7aGSKMoz6dep8oVyJRUwIO2XtJIqxrYECjwJUU=;
        b=iT9rb80u3IjkL+mj2PS0bpKmJIj/LVjsdcVBe6lUo3Axl8YeySG1stMWXY+r8oq+Lz
         uHPfki183pJJYaHkyp9TE1S7P+9b7YgpvcE/CNhSzDEdK8OOlAjg30cDbObjDWTsn5pg
         Uza8faVSY6CUuXzZ3H/dXY94SCvcvtDm2fZxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713278986; x=1713883786;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wRera7aGSKMoz6dep8oVyJRUwIO2XtJIqxrYECjwJUU=;
        b=sI4U7atxwM4kOEaMscy5/GaFZzstYRDQiccoalUjzH9MmFEb1FeL+2XqNqTzLZdMRg
         UvWpWpcVwLzqdGgmWVtRnTL5BNpqFGaEo1zXbkX+rm9GXgpeia0QvZ5vWlMnJjrUXbht
         EgGiK6HSlBvO3eCjnhaZx8lj0neovVCDU4/gMMo79g9DOcYinaft43qRtQjmJz1Fn2OQ
         Ym+MJpArQ1z3zYKLxCMyhStg/FRoZHgJz5yrO7xcr0am/ahiQNY3fg6So/QxYUvv1mPn
         znfq5PC6f6AXNsa4LjfTvJjiQBTDMY+wqpYwluw0BCeLMPHFxTBhzHxWaQvNw+QYwbkk
         7zRw==
X-Forwarded-Encrypted: i=1; AJvYcCWX4Mz0WF93ep3/Eck4t1fb/Ck9ag70xp6G8P9ldvHPwys0q22YQXngQQffiRUSZe2f+bkn1a/LWjKdbigb1a/xOfoAKW3ggQ8PxhSZYVJRZ4sZZObznzFf
X-Gm-Message-State: AOJu0YyWCEbjt43eQ9JiRRcxPTBawu3DzxJ5AXcxSF5AcrIn7CzXwjrS
	yGC5ilL+Y1UX0+U35bKtF0uKahF5uKa23M6L9DPjjBnPEZrJYBADDlvGcSZ1zpw=
X-Google-Smtp-Source: AGHT+IFdJ/VEIxiwd/MU+oDuKzjHYwNPLqS/YcVNdQkLNXXs1I8LCiJJzgiwJWHYKlYWms3Hm8ShGQ==
X-Received: by 2002:adf:ee48:0:b0:346:c5d8:38 with SMTP id w8-20020adfee48000000b00346c5d80038mr9006475wro.10.1713278986417;
        Tue, 16 Apr 2024 07:49:46 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6c42:333b:a17b:9fa9? ([2001:8b0:aba:5f3c:6c42:333b:a17b:9fa9])
        by smtp.gmail.com with ESMTPSA id h5-20020adff4c5000000b003437a76565asm15083667wrp.25.2024.04.16.07.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 07:49:46 -0700 (PDT)
Message-ID: <5e46a5c002cc62e0da9f3053c890120eb4582820.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/3] Improvements for performance test report
 view
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ninette@thehoodiefirm.com, openembedded-core@lists.openembedded.org
Date: Tue, 16 Apr 2024 15:49:45 +0100
In-Reply-To: <20240415144129.92641-1-ninette@thehoodiefirm.com>
References: <20240415144129.92641-1-ninette@thehoodiefirm.com>
Autocrypt: addr=richard.purdie@linuxfoundation.org; prefer-encrypt=mutual; keydata=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
 YNvg==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 14:49:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198453

Hi Ninette,

Firstly, thanks for these patches, it is great to be able to try and
improve these and make the data more usable and interactive.=20

To help others visualise the new output and test the patches I've made
a test run on the autobuilder and the results are:

http://autobuilder.yocto.io/pub/non-release/20240413-21/testresults/buildpe=
rf-alma8/perf-alma8_master-next_20240413135138_904bb385c3.html

and=C2=A0

http://autobuilder.yocto.io/pub/non-release/20240413-19/testresults/buildpe=
rf-debian11/perf-debian11_master-next_20240413064005_7116cd908d.html

In general I love the wider commit range of the new chart and that you
can interact with them, this is great.

The is one big problem which is the change to "start_time" which is
problematic. We need the commit numbers on the graph to be able to
decode which change a given point in time represents. Is there a way we
could show both the commit number and date of the build together?

I think if we could fix that issue these would be good to merge from my
perspective. I have shared links to the examples above in our weekly
status report for others to review as well though.

Cheers,

Richard



On Mon, 2024-04-15 at 16:41 +0200, Ninette Adhikari via
lists.openembedded.org wrote:
> This work is done according to "Milestone 9: Build performance test
> report view" as stated in the Scope of Work with Sovereign Tech Fund
> (STF) (https://www.sovereigntechfund.de/).
> The current report can be accessed here:=20
> Performance test report HTML
> (https://autobuilder.yocto.io/pub/non-release/20240117-15/testresults
> /buildperf-alma8/perf-alma8_master_20240117090048_663f180574.html)
> The report is created using the `oe-build-perf-report` script in the
> poky repository. This script generates a performance test report in
> HTML format using the data from the yocto-buildstats
> (https://git.yoctoproject.org/yocto-buildstats/) repository.
> The report displays the performance test results in line chart
> format. The chart x-axis represents the commit numbers, and the y-
> axis represents the test duration in minutes.=20
> The report also includes a table that displays the measurement
> statistics data for each test. The report is interactive and allows
> users to zoom in on specific sections of the line chart.
>=20
> The current report format required some updates to make it more
> interactive and user-friendly. And this patch addresses such
> improvements:
>=20
> - Add Apache echart (https://echarts.apache.org/en/index.html)
> library to create oe build performance report charts and make them
> interactive.
> - Restructure data to time and value array format to be used by
> echarts. It also converts test duration to minutes and adds zoom to
> the line charts.
> - Update measurement statistics data to include `start_time` so that
> time can be displayed instead of commit numbers on the chart. It also
> updates default commit history length to 300.
> - Add styling updates including page margin, labels for x and y axis,
> tooltip, and section descriptions.
>=20
> Updated report screenshots:=20
> https://github.com/neighbourhoodie/poky/assets/13760198/65a1890c-fd2a-40d=
4-ac90-f13055735e53
> https://github.com/neighbourhoodie/poky/assets/13760198/1ed43876-73a9-487=
e-aed3-ca0edf97514c
>=20
> For local setup, you can do the following:
>=20
> 1. Clone the yocto-buildstats
> (https://git.yoctoproject.org/yocto-buildstats/) and the poky
> repository (https://git.yoctoproject.org/poky/)
>=20
> 2. In the poky repository run the following to build the report HTML:
> ```bash
> ./scripts/oe-build-perf-report -r "LOCAL_PATH_TO_YOCTO_BUILDSTATS" --
> branch "master" --commit "663f1805742ff6fb6955719d0ab7846a425debcf" -
> -branch2 "master" --html > test.html
> ```
> Note:
> - Add your local path to the yocto-buildstats repo
> - The above command builds the report in a file called `test.html`.
> You can access it in the root directory in poky.
> - This exmaple report uses the commit
> `663f1805742ff6fb6955719d0ab7846a425debcf` from `master` branch.




