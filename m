Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.39800.1629814535485828899
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Aug 2021 07:15:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=K1/7pnPi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id v10so20341967wrd.4
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Aug 2021 07:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=2OiY2K1jvuE+dmCvPjf4ETPXM2ZYxHzAmmhfN7qlvDk=;
        b=K1/7pnPiOykM0YTbvGoALtCTynp0SlSgukugoNrlINgDCa7sqfekfb+aUPdtr2Y/e4
         l0juf//bhhu8/XU3uEvlXIPR9RZ6i1n9lG3L/sFj7krk18EYAmkSbI1UyNFSblVbaR/m
         7IFmSt/87FVwsiRY2WFjhabF7KU6n7oeXxLUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=2OiY2K1jvuE+dmCvPjf4ETPXM2ZYxHzAmmhfN7qlvDk=;
        b=Y0EFUP0QpxCIRuaAxcLFdcY8wm+7vK6nJOFEHt4BqYK+U2wMrCL2/+0vB0lIw79MCu
         1Z7ByovF+YzwJFvHjG0lS3HxfU8XZGdyngA32SQe6iEpEWilVcWe/hm0bVJirYZ8uj4p
         B4v9uiObEGFMNI5Im9zwQLlcUm9xavaXu7e7Xd9rpnUDPExmkwWRJoDyVmmH0clgC6tX
         8Yz2e4puFa59EzpOfK5LQQLrA8e99r+Y9Vd5yjg1mAiDlZIVzRBOHBliP2GPiMr9JTdN
         Bax/RX6X3BYvoZWKBi3PClAI9de52hneTJXQCJ+UDpI3kcPDadPGk5Y8gSD/Qgx3d6Pw
         sBZw==
X-Gm-Message-State: AOAM530WGc3ma20sraXSykuqcUxrOsDhDZtwYhmq/I9QEdpUAbsUOdfX
	YY+SzLdAYSchTJV34UlKLeES5gEhoqbahg==
X-Google-Smtp-Source: ABdhPJzZzZM01E+yzcANIe+UvgxjMVuhB6ljGTB8AMzV5QLqNpC77ZLiJhGlBgFsssD7bQUgXgagtQ==
X-Received: by 2002:adf:cc92:: with SMTP id p18mr13082412wrj.98.1629814533606;
        Tue, 24 Aug 2021 07:15:33 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:d23b:eedd:82d9:e12c? ([2001:8b0:aba:5f3c:d23b:eedd:82d9:e12c])
        by smtp.gmail.com with ESMTPSA id n14sm7967731wrx.10.2021.08.24.07.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 07:15:33 -0700 (PDT)
Message-ID: <d275d9bb3d50298a32dc272e7f5bd0f0653a5fc8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] bitbake.conf: update way of setting XZ_MEMLIMIT
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Changqing Li <changqing.li@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 24 Aug 2021 15:15:30 +0100
In-Reply-To: <20210824094022.27915-1-changqing.li@windriver.com>
References: <20210824094022.27915-1-changqing.li@windriver.com>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2021-08-24 at 17:40 +0800, Changqing Li wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
> Update way of setting XZ_MEMLIMIT, considering scenario that
> running bitbake in container, to avoid OOM Killer of xz.
> 
> For example:
> Container has memory limit of 30G, and host memory is 300G.  'xz
> --memlimit=50% ...' will get host memory, so the limit for xz is 150G.
> And because of the container memory limit is 30G, xz can use nearly up
> to 30G memory, which may cause oom kill of xz.
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/conf/bitbake.conf |  3 ++-
>  meta/lib/oe/utils.py   | 12 ++++++++++++
>  2 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index f6fb2aa698..2b36e083ca 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -809,7 +809,8 @@ BB_NUMBER_THREADS ?= "${@oe.utils.cpu_count()}"
>  PARALLEL_MAKE ?= "-j ${@oe.utils.cpu_count()}"
>  
>  # Default parallelism and resource usage for xz
> -XZ_MEMLIMIT ?= "50%"
> +CONTAINER_MEM_LIMIT = "${@oe.utils.container_mem_limit()}"
> +XZ_MEMLIMIT ?= "${@ '%d' % (int(d.getVar('CONTAINER_MEM_LIMIT'))/2) if d.getVar('CONTAINER_MEM_LIMIT') != '0' else '50%'}"
>  XZ_THREADS ?= "${@oe.utils.cpu_count(at_least=2)}"
>  XZ_DEFAULTS ?= "--memlimit=${XZ_MEMLIMIT} --threads=${XZ_THREADS}"
>  XZ_DEFAULTS[vardepsexclude] += "XZ_MEMLIMIT XZ_THREADS"
> diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
> index a84039f585..581072ac0d 100644
> --- a/meta/lib/oe/utils.py
> +++ b/meta/lib/oe/utils.py
> @@ -252,6 +252,18 @@ def cpu_count(at_least=1):
>      cpus = len(os.sched_getaffinity(0))
>      return max(cpus, at_least)
>  
> +def container_mem_limit():
> +    limit_in_bytes = '0'
> +    proc_sched = '/proc/1/sched'
> +    if os.path.exists(proc_sched):
> +        with open(proc_sched, 'r') as fp:
> +            initinfo = fp.readline().strip()
> +            cgroup_limit_in_bytes = '/sys/fs/cgroup/memory/memory.limit_in_bytes'
> +            if initinfo.split(' ')[0] not in ('systemd', 'init',) and os.path.exists(cgroup_limit_in_bytes):
> +                with open(cgroup_limit_in_bytes) as fpc:
> +                    limit_in_bytes=fpc.readline().strip()
> +    return limit_in_bytes
> +

Whilst I understand the idea here, this is an awful lot of hardcoded values and
"magic". I'm not sure we want all bitbake processes to be making these kinds of
queries/decisions every time the config is parsed...

Adding the function to oe/utils may be ok but I'm not keen on making it the
default.

Cheers,

Richard



