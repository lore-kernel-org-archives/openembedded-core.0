Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FFCDC433EF
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 09:53:30 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web09.23316.1656582806471428273
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 02:53:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=X+Eq2O1F;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id
 205-20020a1c02d6000000b003a03567d5e9so911398wmc.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 02:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=HRTt8oUI/SO5Akxo5zZPJSAs8Db3MHdl1ZLZihnjCSs=;
        b=X+Eq2O1FEMP+niG/JJ8dlkGVFaKLAexZ6Uv3AuleE5GyLXk1u4HQZs57RxfHjI88HO
         WdoHesBQ2P2AyXi3s2VsYHGmSGbPpT0gpIokPsWgwjIYo14C8CxatMRGYZXXuBwMXgi+
         NXzRjkwWpmwbEF4kHznbG2MV0LqVTKccnrdLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=HRTt8oUI/SO5Akxo5zZPJSAs8Db3MHdl1ZLZihnjCSs=;
        b=46avGNzGmV1VP6ZF3Ns/YRiA2UA0NmEcDJacKIu4YvmLdnvQWPwMVNBtlb34nF+9t5
         TChfDsjG+ASiTMdjtSA+TJelFZHNPlDaLgR5iXK06njXF4yXHaIiaq7S28Pt13wjzfGD
         juodOhxFSp/I2G7HAcGIVrma1nbNgpn+pWXT3cuhsSNtPwTwZfjU7t22p2UP08ywOPcs
         G1vXGFH7W9lq+lArvAKwAciTPUN8UFiDFZAJHXXzzQDFXLgiB2UoTX/89zWF6iDTknOx
         oZRzQrqWsZDhCnZFPMLxhqRDuRmhzzTOcyR1SAgGyOxPeJWHyK/h/hznWWJk5R4uuHBW
         7Dzg==
X-Gm-Message-State: AJIora9yQEuC+Jb0d6+LbMZDBIWedvB66jVk6WdJyPvjbYebIzblJa28
	0zLl2buJffWDtH0NWNBw6qWW3g==
X-Google-Smtp-Source: 
 AGRyM1tHgsLowO1EvxAD4bhPSmBbP2c5DQ/0zRjbQPIenup6KQaoVa11ijI2TojxQA0aGrn1upe22w==
X-Received: by 2002:a7b:c18a:0:b0:3a0:4fe4:41d9 with SMTP id
 y10-20020a7bc18a000000b003a04fe441d9mr8687961wmi.58.1656582804667;
        Thu, 30 Jun 2022 02:53:24 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f06b:8b84:2b52:384a?
 ([2001:8b0:aba:5f3c:f06b:8b84:2b52:384a])
        by smtp.gmail.com with ESMTPSA id
 r23-20020a05600c321700b003a03564a005sm1953072wmp.10.2022.06.30.02.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 02:53:24 -0700 (PDT)
Message-ID: 
 <566a77ac43e2ee7d4bb3204a0290fd6dedd3713c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] runqueue: add cpu/io pressure regulation
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Aryaman Gupta <aryaman.gupta@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 30 Jun 2022 10:53:23 +0100
In-Reply-To: <20220629201016.1948793-1-aryaman.gupta@windriver.com>
References: <20220629201016.1948793-1-aryaman.gupta@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jun 2022 09:53:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167408

On Wed, 2022-06-29 at 16:10 -0400, Aryaman Gupta wrote:
> Stop the scheduler from starting new tasks if the
> current cpu or io pressure is above a certain threshold, specified
> through the "BB_MAX_{CPU|IO}_SOME_PRESSURE" variables in conf/local.conf.
>=20
> If the thresholds aren't specified, the default values are 100 for both
> CPU and IO, which will have no impact on build times.
> Arbitary lower limit of 1.0 results in a fatal error to avoid extremely
> long builds. If the percentage limits are higher than 100, then the defau=
lt
> values are used and warnings are issued to inform users that the
> specified limit is out of bounds.
>=20
> Signed-off-by: Aryaman Gupta <aryaman.gupta@windriver.com>
> Signed-off-by: Randy Macleod <randy.macleod@windriver.com>
> ---
>  bitbake/lib/bb/runqueue.py | 39 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)

This looks like a good start, thanks. There are a few things which will
need cleaning up in here as this is pretty performance sensitive code
(try a "time bitbake world -n" to see what I mean).

Firstly, it is a bitbake patch so should really go to the bitbake
mailing list, not OE-Core.

> diff --git a/bitbake/lib/bb/runqueue.py b/bitbake/lib/bb/runqueue.py
> index 1e47fe70ef..9667acc11c 100644
> --- a/bitbake/lib/bb/runqueue.py
> +++ b/bitbake/lib/bb/runqueue.py
> @@ -159,6 +159,27 @@ class RunQueueScheduler(object):
>                  self.buildable.append(tid)
> =20
>          self.rev_prio_map =3D None
> +        # Some hosts like openSUSE have readable /proc/pressure files
> +        # but throw errors when these files are opened.
> +        try:
> +            subprocess.check_output(["cat", "/proc/pressure/cpu", "/proc=
/pressure/io"], \
> +                                    universal_newlines=3DTrue, stderr=3D=
subprocess.DEVNULL)
> +            self.readable_pressure_files =3D True
>
>         except:
> +            if self.rq.max_cpu_pressure!=3D100 or self.rq.max_io_pressur=
e!=3D100:
> +                bb.warn("The /proc/pressure files can't be read. Continu=
ing build without monitoring pressure")
> +            self.readable_pressure_files =3D False
> +
> +    def exceeds_max_pressure(self):
> +        if self.readable_pressure_files:
> +            # extract avg10 from /proc/pressure/{cpu|io}
> +            curr_pressure_sample =3D subprocess.check_output(["cat", "/p=
roc/pressure/cpu", "/proc/pressure/io"], \
> +                                   universal_newlines=3DTrue, stderr=3Ds=
ubprocess.DEVNULL)
> +            curr_cpu_pressure =3D curr_pressure_sample.split('\n')[0].sp=
lit()[1].split("=3D")[1]
> +            curr_io_pressure =3D curr_pressure_sample.split('\n')[2].spl=
it()[1].split("=3D")[1]

This is horrible, you're adding in a fork() call for every pass through
the scheduler code. You can just open() and read the file instead which
will have *much* lower overhead.

Even then, I'm not particularly thrilled to have this level of overhead
in this codepath, in some ways I'd prefer to rate limit how often we're
looking up this value rather than once per pass through the scheduler
path. I'm curious what the timings say.

> +
> +            return float(curr_cpu_pressure) > self.rq.max_cpu_pressure o=
r float(curr_io_pressure) > self.rq.max_io_pressure
> +        return False
> =20
>      def next_buildable_task(self):
>          """
> @@ -171,6 +192,8 @@ class RunQueueScheduler(object):
>          buildable.intersection_update(self.rq.tasks_covered | self.rq.ta=
sks_notcovered)
>          if not buildable:
>              return None
> +        if self.exceeds_max_pressure():
> +            return None
> =20
>          # Filter out tasks that have a max number of threads that have b=
een exceeded
>          skip_buildable =3D {}
> @@ -1699,6 +1722,8 @@ class RunQueueExecute:
> =20
>          self.number_tasks =3D int(self.cfgData.getVar("BB_NUMBER_THREADS=
") or 1)
>          self.scheduler =3D self.cfgData.getVar("BB_SCHEDULER") or "speed=
"
> +        self.max_cpu_pressure =3D float(self.cfgData.getVar("BB_MAX_CPU_=
SOME_PRESSURE") or 100.0)
> +        self.max_io_pressure =3D float(self.cfgData.getVar("BB_MAX_IO_SO=
ME_PRESSURE") or 100.0)

I did wonder if this should be BB_PRESSURE_MAX_SOME_IO as the order of
the information kinds of seems backwards to me. That could just be me
though! :)

Cheers,

Richard

