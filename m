Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7E7EC46CD2
	for <webhook@archiver.kernel.org>; Wed, 24 Jan 2024 09:42:07 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.18995.1706089320664112635
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jan 2024 01:42:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OojRI2wu;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-50e5a9bcec9so5925337e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 01:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706089319; x=1706694119; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bXWyBzTbk88cVnr+t+cLjlsAkqmzdMLBjKI4+X6Uavg=;
        b=OojRI2wunK+q+Vj8oncSQ28GZ64ukf9xLXsdizi0ZBEObbUX+qW8TVdg4esUxhfyAI
         9BXF/cL1lw9J/TjeQx5TmzCU2hb4aDhO0Jou2/p2j9bdMQv70xA5u5QpOQazKRgL7ety
         AI7QNES7s/bNfgsvRsRa5GbuvtSBoS21y3LxGl7zLEm1XvlSKj6ZFTr9MGljQfFCQU5z
         dw4xM0kvEiK14y/sf4aWioPHvmhemOPtB0iWl5qV5H4VT5fJaOCDoJI6rwdHRT+vndOL
         RM7ZcX96s95AJnv0+Iaixe5WaQsAi5daR+iVLGNYt3aEmutT8F+N0W2f681DPZvWbvHM
         hyOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706089319; x=1706694119;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bXWyBzTbk88cVnr+t+cLjlsAkqmzdMLBjKI4+X6Uavg=;
        b=FrH5ztK0dtDsYOz+yExNJfsYEXo5fYEXVAFOED2QEPlD08tusUnlgnD8MOtvBVelUA
         T+epsbO4v88uYkQ2YJ3skGYaJ+4UIAUz7rq70S1txnLP3e+p/0sNsLNuy0x0Nis5t71m
         q66WviSAJB5brfZx8nT0yOAUt0i+U2mlqoWod7uE8sZ3huParjMObjWn+zl947kxJeHQ
         18DHHaiiYZ5y241++5xP7jg5Hm8BqbZK+rZY7OPsp8RLHfGWweVI5AwoTa5jDEb6MCPg
         56kmO+gdqcNG5Ou/O/GBBGHAtXdYGnAQpFsvsNeRcc5LTK80AZXtRrBEgVaKcHeWlKfB
         7jSA==
X-Gm-Message-State: AOJu0YyrsovGGYYCtm/qNZw67H/7jP4mWuX266QC7tO1GjgTs49tiRB1
	nHYZOAyWS8shoZTxEJOdmq86M8JGz37c40mnSl+0vWOthqxwAqHsG4e66CmdMbQncMkc8aMQEWL
	uWHRdSklq9YoXcxMRBlKPrv2pugI=
X-Google-Smtp-Source: AGHT+IGV20nqfGdkR6e0SSd64lK5T9cB8tAAmsOTg94ki7qscPcUTPf2OBTlWEfbED0lCv8AMJ3Stvgl83LhVddBJz0=
X-Received: by 2002:ac2:4ada:0:b0:510:1461:d029 with SMTP id
 m26-20020ac24ada000000b005101461d029mr159117lfp.28.1706089318406; Wed, 24 Jan
 2024 01:41:58 -0800 (PST)
MIME-Version: 1.0
References: <20240124090402.3126423-1-chi.xu@windriver.com>
In-Reply-To: <20240124090402.3126423-1-chi.xu@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 24 Jan 2024 10:41:46 +0100
Message-ID: <CANNYZj-XFMk+Zburj-Q2xLk04BWg=qv8Kk0+=XAOwDdKpjpkQQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] xz: Add ptest support
To: Chi Xu <chi.xu@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 09:42:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194264

On Wed, 24 Jan 2024 at 10:04, Chi Xu <chi.xu@eng.windriver.com> wrote:
> +Subject: [PATCH] Update test scripts: replace ../src/* with /usr/bin
> +
> +In order to run scripts on target, replace ../src/* with /usr/bin
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +-if test -x ../src/xz/xz ; then
> ++if test -x /usr/bin/xz ; then

It's better to bundle the xz* executables into the ptest package where
the script expects them, and avoid making a non-upstreamable patch
altogether.

> +ptestdir=$(dirname "$(readlink -f "$0")")
> +cd "$ptestdir"/tests || exit
> +
> +# executables test cases
> +tests_exec=$(file $(ls test_*) | grep "ELF" | awk -F: '{print $1}')
> +for i in ${tests_exec}; do
> +    ./$i
> +done
> +
> +# POSIX shell script test cases
> +export srcdir=${ptestdir}/tests
> +test_shell="test_files.sh test_scripts.sh test_compress.sh"
> +for j in ${test_shell}; do
> +    if [ $j == "test_compress.sh" ]; then
> +        ./$j create_compress_files
> +    else
> +        ./$j
> +    fi
> +    if [ $? -eq 0 ]; then
> +        echo "PASS: $j"
> +    else
> +        echo "FAIL: $j"
> +    fi

I still don't understand this part. If these scripts are executed as a
part of standard in-tree unit testing, what prints PASS/FAIL in that
context? Shouldn't we reuse that, to replicate the in-tree testing
sequence as much as possible?

Alex

