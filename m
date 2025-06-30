Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 211CDC7EE39
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 09:36:59 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web10.35553.1751276212915333906
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 02:36:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D2VKV8bw;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7d425fc4e5fso329166685a.0;
        Mon, 30 Jun 2025 02:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751276212; x=1751881012; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ao50wZzPW4pQX4ZJ0XuBFayiByBIcitMyJSXRovmhlE=;
        b=D2VKV8bwYXt4HzfHrImaPUMyoojHuqpWqOX3Z5J4ZT43L+Ed/6q34t1/hYE/DiitoE
         RBTepdWMF3SHuFC6aPQeT8bpNAPlc3I3Y9lYqkbk5V+7SyK5r0C/3Xmmp9h3Mby8FUsP
         15wmHdmIhXYweF6DWrFHnNPI2HQRNziRN+ElGO4L4kZbg5eZA33ojsw6HswPJ2mys4KO
         xPdM3p3umDE2xIQdxaZClArcOg4ZbycQk+3RqUwsT/13ejo+3TyVg7EE9/558svRgQPk
         E0LkPAsp1aA3UkRw0ot05+lTvmfM7rNPuuqLViTKuA3cE2jENiS9SDon6IRnCMsLC6jl
         Sfzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751276212; x=1751881012;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ao50wZzPW4pQX4ZJ0XuBFayiByBIcitMyJSXRovmhlE=;
        b=YNdPFfMT9tAHRXnFfP3AVqHV11/Q35QPqRABq7L8EJzw9NUhDOeYTGtPoteyj3pE1y
         63Q0BunF7zque6TmGJomk89HYJOnRUlj2VbaxEwPNUlXuzYcz45j4GRDEGyqmS6CFAxd
         fg+5UTj9aasbD3BrktFlRWZxYf4IgcDRmUzFezcpbQFe90tWFm2EMNqmKRjubvfgSjEA
         LbtVlfrxWkOiEH2XeoPxAfyaMv6Xkgk0Mmoyf9favr403jak0Qk5NUKdEoF7hNPpFpWf
         t+7w3heHnYGJyqHcWpdcTA5ZTgld1j6ACdgMhOBbMgacOVQQ8f3yKxWQPCnTBkV39KyP
         55yA==
X-Forwarded-Encrypted: i=1; AJvYcCXH8KV/nQA1KKlx/BMcGYsNX9OV3PNC3/P+zFrJMBuaiGeBrQ2BQCb74dROfEiEEBXF2Vm52u6ewuyDab5VJeDSfBY=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw/yf9owjXHke0qx2MuJqCVLCmbOsoijaObwBApOsvUxLFtgYZ4
	H7Is2VDkdcIPAizNJ3VJtgkr31yKLShryhvMEYl+ZwthS0LyFiQb5Gfzv+zx70KkiGkAG4t1B8v
	qC1hWGsNLIvaASIcEQNF6yMJQLgca/Xq0uw==
X-Gm-Gg: ASbGncsNn3mf41bHygy040Ma4cfRKfDIqCBTjVmqyxBNzF6iHlpUBhZ/Qyopev6Z6B9
	Xehz3+8kkfGMGhM6IUJwm1eICGna5546vB5s6TJ3SvswMbMIqGhfMpurPsY67lA3zo8tV5vBdH4
	8PSLeDnC2wSpRlHp5NfMXigSuu+HKie6qWTJJFBrgDAWqo9JNj/3AwJlBfXiYn4+RbFBgxQ4FlT
	R8qcw==
X-Google-Smtp-Source: AGHT+IEgmRROkyDmf2aV05myk45F4P/g4UqFj2xm/09H0mPpc3JHIEz/eCkgvtOw6pfn+cpq2h/wdgI2g0OL2IvNWJU=
X-Received: by 2002:a05:6214:5007:b0:6fa:d9de:a3fc with SMTP id
 6a1803df08f44-700036ae260mr227513266d6.34.1751276211734; Mon, 30 Jun 2025
 02:36:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250629090757.11773-1-wen.yang@linux.dev>
In-Reply-To: <20250629090757.11773-1-wen.yang@linux.dev>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 30 Jun 2025 11:36:40 +0200
X-Gm-Features: Ac12FXy3vi-GUtc_DghRg0etPdd9SNQKQBtSvqWgw31bWIAnIOXtII5rkT0maVY
Message-ID: <CANNYZj_UPRBVoOTmewQsHrzQTUM4O+uv9p419Q43ac0LzOnZrw@mail.gmail.com>
Subject: Re: [oe] [oe-core][PATCH] pstack: add recipe
To: wen.yang@linux.dev
Cc: openembedded-core@lists.openembedded.org, 
	openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:36:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219500

On Sun, 29 Jun 2025 at 15:30, Wen Yang via lists.openembedded.org
<wen.yang=linux.dev@lists.openembedded.org> wrote:
>
> This recipe provides pstack for C/C++, Go, Rust, and Python.
> +SUMMARY = "A utility to print stack traces of running processes"
> +DESCRIPTION = "A from-scratch implementation of pstack using DWARF debugging and unwind information. \
> +Works for C/C++, Go, Rust, and Python. A traditional pstack command can generally print a backtrace \
> +of each thread in a running program, and sometimes from a core file. This version of pstack uses its \
> +own self contained ELF and DWARF parsing library, libdwelf to parse the DWARF debug and unwind \
> +information, to get a stack trace."

This recipe should be going to meta-oe, I don't think it meets the
requirements for being added to core.

Alex

