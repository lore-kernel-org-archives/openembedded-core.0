Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD06BCCD199
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 14:17:43 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.9877.1760624254470031266
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Oct 2025 07:17:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y28DAa4G;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-46e3a50bc0fso6379425e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 07:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760624252; x=1761229052; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B3vdC+xemYY7rO5lo1tspk5IEvRNScVESCTLJ2x1FYo=;
        b=Y28DAa4GEPnBPu86tsRPpnkIAtEs+onxF0VXzvCUbFB6yVkBlIGh5qLaa0yVxK0vos
         I4rLNL4J9a4gIVQalNiErNa14tiCeY7rnipJnIhaBCTH4OugFRd6FqO+Eg8POZ2G9Pi9
         OAkI3VScFk43bquriIbWpzv0VudLuTVw7TGmR9nBffGr/nVFvs8JaYM558dldKKxoid8
         KrLJn1o7oeS0es1tcLzp1Ra8kfgRv0D0AB9GTP5e2jvRfvu+oTXn3cQ3ROn2ey4Zwiev
         UthLFo3CKcGiasNveS9pFg5/JruRnCftLhxKVXFl8h5C29UWOnD/0EZS8hRr+TiOEBHx
         JGxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760624252; x=1761229052;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B3vdC+xemYY7rO5lo1tspk5IEvRNScVESCTLJ2x1FYo=;
        b=tHyC/2dz+VjTAaLW9GWnaDwADPU3ldOpoYfIZCnTeN6gg7KlYOuo3RNYaxDmFOWFAg
         pF7WIVbMJv3uEsllk9ShBIeXkN+j0wyupzfpIAlYSZD1z8ZVHSJ0G9A23ap0wosDVQvX
         31p7nBnUVUnDsQq2Qx4A5RSKOTH9BCvglcT/CQouA4BC2SIuv9PsaxJPumLYGB5t5LWX
         4bhiaLyiKaB+cQ02CpWeI9TS4xm/e+I6j9aMZPVvlv+WcaAUfD6Z3Y4ECbqgV+pxlf5l
         3na8GrCKQvSfe40jYHqPrYipSzxX8MtRvMIuCPi4mBeT3RxVyP06MxHFdOIiZNkyqRNW
         RQ7A==
X-Forwarded-Encrypted: i=1; AJvYcCWREgPhjPZ42lskI8TmO8PPAj4iA/L/WA76yoMeANy2jSrdoMTI95/CfrhllLQT/AON1kdbM+oedmbz/eJLBIzYrQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz2d4nkc5vHdpppO8TVNIhccQHgZcxlvWuDKvBa8XL82LrS6dp8
	cVu0hQcFtIQUmO1viTaF0FNmQWVtpqOPpL8bjy8tU8OKI46V1BdWs8V8L/PlFA==
X-Gm-Gg: ASbGncuPX6OAG+z+m+kwbaOZGM6WuFbwushzH6OTaSC5DWuDAWkCfxKJyuX7TGhWzYY
	huCD1lh0EO+ScG15Hhf4/GTCpVC95WlgWZ7EOaDPnAXJdPFdI0uEnLYQ65mK1xovEzSsv9qfmgK
	bLzBN/rM+nZ8uEU2dB6DfUjCngJWeSk5/3fk2zsK7asebUynblsivXASupQez4+DsnrKV9N+D0t
	/o/AWo56RI7PPcaghWrnhnT9mJQjrT3WFJ9qe9vyjETSweM7rPcp4vUAzxEUBxaoDie52ncTZ+v
	iXwua1S2bnYkfTgRTjGb/Qngr9ci5vl7Cd3UGenfa8yDHGO9hv0OsDw31SxiP4bqL3XOi8JFBib
	c60Rd9wWNKDDyQZLt5/k4IhYHyGui6oDbIqtUaJN9ImbcGTStZxAlzrCBLgBsOzguDSZ4BkoXR9
	9z4aVIDlHAsv/1I2RJiik=
X-Google-Smtp-Source: AGHT+IFXHWIpsDW+Zd72sZf7dCyMixxrH7Xr7ERm2wFLrYcvSn8bnlJsK4Y1pCVlcWr25lwxTT0Kzg==
X-Received: by 2002:a05:600c:34d0:b0:46e:37af:f90e with SMTP id 5b1f17b1804b1-4711787441fmr1445405e9.6.1760624252192;
        Thu, 16 Oct 2025 07:17:32 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4711444e3fesm30846305e9.15.2025.10.16.07.17.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 07:17:31 -0700 (PDT)
Message-ID: <48ccbbc2-f765-47a9-80f9-26a1d97dbe82@gmail.com>
Date: Thu, 16 Oct 2025 16:17:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe-core][walnascar][PATCH 1/1] cmake: fix CVE-2025-9301
To: saravanan.kadambathursubramaniyam@windriver.com,
 openembedded-core@lists.openembedded.org
References: <20251016141412.2267180-1-saravanan.kadambathursubramaniyam@windriver.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20251016141412.2267180-1-saravanan.kadambathursubramaniyam@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 14:17:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224969

Unless something extraordinary happens, today's Walnascar release is the
last one from that branch. Most likely patches for Walnascar will not be
applied anymore.

On 10/16/25 16:14, Kadambathur Subramaniyam, Saravanan via
lists.openembedded.org wrote:
> Reference:
> https://nvd.nist.gov/vuln/detail/CVE-2025-9301
> https://gitlab.kitware.com/cmake/cmake/-/issues/27135
>
> Upstream-patch:
> https://gitlab.kitware.com/cmake/cmake/-/commit/37e27f71bc356d880c908040cd0cb68fa2c371b8
>
> Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
> ---
>  .../cmake/cmake/CVE-2025-9301.patch           | 71 +++++++++++++++++++
>  meta/recipes-devtools/cmake/cmake_3.31.6.bb   |  1 +
>  2 files changed, 72 insertions(+)
>  create mode 100644 meta/recipes-devtools/cmake/cmake/CVE-2025-9301.patch
>
> diff --git a/meta/recipes-devtools/cmake/cmake/CVE-2025-9301.patch b/meta/recipes-devtools/cmake/cmake/CVE-2025-9301.patch
> new file mode 100644
> index 0000000000..a5bb2b5f92
> --- /dev/null
> +++ b/meta/recipes-devtools/cmake/cmake/CVE-2025-9301.patch
> @@ -0,0 +1,71 @@
> +From 37e27f71bc356d880c908040cd0cb68fa2c371b8 Mon Sep 17 00:00:00 2001
> +From: Tyler Yankee <tyler.yankee@kitware.com>
> +Date: Wed, 13 Aug 2025 15:22:28 -0400
> +Subject: [PATCH] foreach: Explicitly skip replay without iterations
> +
> +As written, foreach loops with a trailing `IN` (i.e., no loop
> +variable(s) given) lead to an assertion error. Handle this case by
> +exiting early when we know the loop won't execute anything.
> +
> +Fixes: #27135
> +
> +CVE: CVE-2025-9301
> +
> +Upstream-Status: Backport
> +https://gitlab.kitware.com/cmake/cmake/-/commit/37e27f71bc356d880c908040cd0cb68fa2c371b8
> +
> +Signed-off-by: Tyler Yankee <tyler.yankee@kitware.com>
> +Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
> +---
> + Source/cmForEachCommand.cxx                  | 3 +++
> + Tests/RunCMake/foreach/RunCMakeTest.cmake    | 1 +
> + Tests/RunCMake/foreach/TrailingIn-result.txt | 1 +
> + Tests/RunCMake/foreach/TrailingIn.cmake      | 5 +++++
> + 4 files changed, 10 insertions(+)
> + create mode 100644 Tests/RunCMake/foreach/TrailingIn-result.txt
> + create mode 100644 Tests/RunCMake/foreach/TrailingIn.cmake
> +
> +diff --git a/Source/cmForEachCommand.cxx b/Source/cmForEachCommand.cxx
> +index 33dae79f..9b9a60b3 100644
> +--- a/Source/cmForEachCommand.cxx
> ++++ b/Source/cmForEachCommand.cxx
> +@@ -101,6 +101,9 @@ bool cmForEachFunctionBlocker::ArgumentsMatch(cmListFileFunction const& lff,
> + bool cmForEachFunctionBlocker::Replay(
> +   std::vector<cmListFileFunction> functions, cmExecutionStatus& inStatus)
> + {
> ++  if (this->Args.size() == this->IterationVarsCount) {
> ++    return true;
> ++  }
> +   return this->ZipLists ? this->ReplayZipLists(functions, inStatus)
> +                         : this->ReplayItems(functions, inStatus);
> + }
> +diff --git a/Tests/RunCMake/foreach/RunCMakeTest.cmake b/Tests/RunCMake/foreach/RunCMakeTest.cmake
> +index 15ca4770..acfc742e 100644
> +--- a/Tests/RunCMake/foreach/RunCMakeTest.cmake
> ++++ b/Tests/RunCMake/foreach/RunCMakeTest.cmake
> +@@ -22,3 +22,4 @@ run_cmake(foreach-RANGE-invalid-test)
> + run_cmake(foreach-RANGE-out-of-range-test)
> + run_cmake(foreach-var-scope-CMP0124-OLD)
> + run_cmake(foreach-var-scope-CMP0124-NEW)
> ++run_cmake(TrailingIn)
> +diff --git a/Tests/RunCMake/foreach/TrailingIn-result.txt b/Tests/RunCMake/foreach/TrailingIn-result.txt
> +new file mode 100644
> +index 00000000..573541ac
> +--- /dev/null
> ++++ b/Tests/RunCMake/foreach/TrailingIn-result.txt
> +@@ -0,0 +1 @@
> ++0
> +diff --git a/Tests/RunCMake/foreach/TrailingIn.cmake b/Tests/RunCMake/foreach/TrailingIn.cmake
> +new file mode 100644
> +index 00000000..e2b5b2f2
> +--- /dev/null
> ++++ b/Tests/RunCMake/foreach/TrailingIn.cmake
> +@@ -0,0 +1,5 @@
> ++foreach(v IN)
> ++endforeach()
> ++
> ++foreach(v1 v2 IN)
> ++endforeach()
> +-- 
> +2.49.1
> +
> diff --git a/meta/recipes-devtools/cmake/cmake_3.31.6.bb b/meta/recipes-devtools/cmake/cmake_3.31.6.bb
> index 2d343d6f52..a71928ea9c 100644
> --- a/meta/recipes-devtools/cmake/cmake_3.31.6.bb
> +++ b/meta/recipes-devtools/cmake/cmake_3.31.6.bb
> @@ -11,6 +11,7 @@ SRC_URI:append:class-nativesdk = " \
>      file://cmake-setup.py \
>      file://environment.d-cmake.sh \
>  "
> +SRC_URI += "file://CVE-2025-9301.patch"
>  
>  LICENSE:append = " & BSD-1-Clause & MIT"
>  LIC_FILES_CHKSUM:append = " \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224967): https://lists.openembedded.org/g/openembedded-core/message/224967
> Mute This Topic: https://lists.openembedded.org/mt/115789643/6084445
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


