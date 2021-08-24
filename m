Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web09.5784.1629842200923010144
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Aug 2021 14:56:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NYAC3rbw;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: armccurdy@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id p15so2269754ljn.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Aug 2021 14:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A//d+ONewz74CxXV3pU0jOKhNyPzuvl5NtKM/xUNbog=;
        b=NYAC3rbwGoRe3wlMRX5VheAXpO5vSj1qPvI3V+9CS1ZJn01c4t7gXQ9lsf20lzaqie
         2uYqB/p3qcDk7AP6praLO4d8C0e94tkervniVAdU/cXqzep2oEFxt79vd98cqn64t0CG
         PBbQZ/l2O32zY9LqACG70Q6lK5B7HhT0nKgZ05K54Zw4b2Om2BF1Ww4OVKgRXHIcR8go
         DIlAMe4VJru1Jv9KPwzqOr24atuRYvaaRqZhUhARi7FajnOEtO5AiOE+fV8SWZq5pxAN
         zp3foESZHIQjeSwJCGM9f3AfTcUfXo2Hsy9xdn2KSe0JF+96lCnBRAAwO9RIQWwfwuIv
         s8kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A//d+ONewz74CxXV3pU0jOKhNyPzuvl5NtKM/xUNbog=;
        b=ataYWjyJMVgjUT3SXNqy7EiR1ly19CJOHp5mG9TrOoQHLdAijl380Cp1/CP1kapcLz
         gLdCyubzTRSW+j4BGhoy7muhWsJtBcIMmuSvYJowt+ofhtjsYfX+7wy4Lio15OLKR0NZ
         7Au4rZeT+v6iiD2RLHWOw5CyEVBmYvxpCfMwbfQm85F8fZFUAgURay+fhh+NDsCK2Rvv
         1k7GGN1TcUewJbrfSzRjfhkNcfziaCHf1A6H4hCNX0tYnsMFWbyTWznnPfoOseEi8mja
         72RoJWAGGQdHnNTlstAtDACXMXHEQbUUZXp5H5bJuqZRbgfe7+hjRNG7nXrpc3wY7CoZ
         +cIw==
X-Gm-Message-State: AOAM531Tig6+XeTbBgABf59mVxdhzWcqc9DuWvDv0XONlmf1Gq91ZCxV
	QgQ08xcl6sQ4eLBhyYoi3RSC2+1zd9h+KK08w00=
X-Google-Smtp-Source: ABdhPJwyY5hl3oVA9yDIAKfyQUFvSKQibnFMcbi3hmz7fs9O8VK/ovn4iOB2CEboSJ13HZTVdNN7COjUyN0/XGSG+7c=
X-Received: by 2002:a2e:9049:: with SMTP id n9mr10378556ljg.425.1629842198874;
 Tue, 24 Aug 2021 14:56:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210824094022.27915-1-changqing.li@windriver.com> <d275d9bb3d50298a32dc272e7f5bd0f0653a5fc8.camel@linuxfoundation.org>
In-Reply-To: <d275d9bb3d50298a32dc272e7f5bd0f0653a5fc8.camel@linuxfoundation.org>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Tue, 24 Aug 2021 14:56:22 -0700
Message-ID: <CAJ86T=W_qP8OijRXsY0Ez+424-uxdUt9zmyK8T7mba_KdUV_Gw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bitbake.conf: update way of setting XZ_MEMLIMIT
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Changqing Li <changqing.li@windriver.com>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 24, 2021 at 7:15 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2021-08-24 at 17:40 +0800, Changqing Li wrote:
> > From: Changqing Li <changqing.li@windriver.com>
> >
> > Update way of setting XZ_MEMLIMIT, considering scenario that
> > running bitbake in container, to avoid OOM Killer of xz.
> >
> > For example:
> > Container has memory limit of 30G, and host memory is 300G.  'xz
> > --memlimit=50% ...' will get host memory, so the limit for xz is 150G.
> > And because of the container memory limit is 30G, xz can use nearly up
> > to 30G memory, which may cause oom kill of xz.
> >
> > Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > ---
> >  meta/conf/bitbake.conf |  3 ++-
> >  meta/lib/oe/utils.py   | 12 ++++++++++++
> >  2 files changed, 14 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index f6fb2aa698..2b36e083ca 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -809,7 +809,8 @@ BB_NUMBER_THREADS ?= "${@oe.utils.cpu_count()}"
> >  PARALLEL_MAKE ?= "-j ${@oe.utils.cpu_count()}"
> >
> >  # Default parallelism and resource usage for xz
> > -XZ_MEMLIMIT ?= "50%"
> > +CONTAINER_MEM_LIMIT = "${@oe.utils.container_mem_limit()}"
> > +XZ_MEMLIMIT ?= "${@ '%d' % (int(d.getVar('CONTAINER_MEM_LIMIT'))/2) if d.getVar('CONTAINER_MEM_LIMIT') != '0' else '50%'}"
> >  XZ_THREADS ?= "${@oe.utils.cpu_count(at_least=2)}"
> >  XZ_DEFAULTS ?= "--memlimit=${XZ_MEMLIMIT} --threads=${XZ_THREADS}"
> >  XZ_DEFAULTS[vardepsexclude] += "XZ_MEMLIMIT XZ_THREADS"
> > diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
> > index a84039f585..581072ac0d 100644
> > --- a/meta/lib/oe/utils.py
> > +++ b/meta/lib/oe/utils.py
> > @@ -252,6 +252,18 @@ def cpu_count(at_least=1):
> >      cpus = len(os.sched_getaffinity(0))
> >      return max(cpus, at_least)
> >
> > +def container_mem_limit():
> > +    limit_in_bytes = '0'
> > +    proc_sched = '/proc/1/sched'
> > +    if os.path.exists(proc_sched):
> > +        with open(proc_sched, 'r') as fp:
> > +            initinfo = fp.readline().strip()
> > +            cgroup_limit_in_bytes = '/sys/fs/cgroup/memory/memory.limit_in_bytes'
> > +            if initinfo.split(' ')[0] not in ('systemd', 'init',) and os.path.exists(cgroup_limit_in_bytes):
> > +                with open(cgroup_limit_in_bytes) as fpc:
> > +                    limit_in_bytes=fpc.readline().strip()
> > +    return limit_in_bytes
> > +
>
> Whilst I understand the idea here, this is an awful lot of hardcoded values and
> "magic". I'm not sure we want all bitbake processes to be making these kinds of
> queries/decisions every time the config is parsed...

I'm sure this was discussed before but I forget the answer... how much
compression / performance is lost by setting the XZ memory limit to a
fixed value which is reasonable for all systems (e.g. 1GB? 256MB *
XZ_THREADS?).

As well as making the code simpler should also make builds more
reproducible by not depending on some detail which is specific to the
host (ie total memory size).

> Adding the function to oe/utils may be ok but I'm not keen on making it the
> default.
>
> Cheers,
>
> Richard
>
>
>
>
> 
>
