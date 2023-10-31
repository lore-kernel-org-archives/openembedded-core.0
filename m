Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10A7DC4332F
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 12:26:31 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.184916.1698755181045326832
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Oct 2023 05:26:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fJ4vReC9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4079ed65582so40614935e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 05:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1698755179; x=1699359979; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ta6SJX6GAB/zvpw+/BPF4TbALACQJSFDUsmnxlkETWQ=;
        b=fJ4vReC97NA1WT10TraAYS0O+OhMTaCz/acYyx9bntk/11YRhBnNcS8yqaKtNYnV7o
         V6oHFMIqBeXcWK7oS7DR4URr8GijGZpuE1YlhRE7WdTK6d5EuIbDG8Jmeb1w41lwAyLP
         ujMicxqJkG05cW5YgBdERrNFJxxXehe8EDsNw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698755179; x=1699359979;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ta6SJX6GAB/zvpw+/BPF4TbALACQJSFDUsmnxlkETWQ=;
        b=PTTLTTj4p/EtGbFLSSWDLdmBn2MvGghuv0334BH+k43Yhkfxrp6+vvW7QyqIdQPjcK
         ELBP6T/Gyv/O8n7H8EnZBUTK0WDEkzhYrg5D/eOVx2k36m04cswC5hhbjA9+3XrMx4YI
         L84wdNl1ItbKfqQLZO9jUVAClhmlXrVdC349CBTs0SgBmt7NBVSvbqeGMJoK6zdhAWAX
         vpYkNNjKpxsCwQaoXTobS/8NF3L2WZ0FlMc6H7ZvMmDLVL24mW5YRwRGdwHf6UqNYrr9
         XKQ93Avk9ID2eIu4A3fWE0ngzfBSJdYMT0lI7Ml8J9Hw6oOyJ+KoWTagMXQHK9TnRsCe
         WCjg==
X-Gm-Message-State: AOJu0YwYiJ0KgvqhJBHFPfcPo4acjo9A6riyDMMnTazymjtClQTbZ0va
	F3JRJbybeq1GyJX2RyBK02DVkw==
X-Google-Smtp-Source: AGHT+IGE4OH+PUVxly1Cd3SNxlcJ05ytKdhvx0/EEOoGdAbjzvGXNkx9j/dBOaY9V48Gb6TIebRwZg==
X-Received: by 2002:a05:600c:3c97:b0:406:eef6:3540 with SMTP id bg23-20020a05600c3c9700b00406eef63540mr10550806wmb.0.1698755179384;
        Tue, 31 Oct 2023 05:26:19 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9850:4974:d357:58d5? ([2001:8b0:aba:5f3c:9850:4974:d357:58d5])
        by smtp.gmail.com with ESMTPSA id t11-20020adff04b000000b0032da4f70756sm1420471wro.5.2023.10.31.05.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 05:26:18 -0700 (PDT)
Message-ID: <ba031885caf9dfeee099cbf4748a06f769c9de95.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] package: split strip cmd when ccache is used
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Javier Tia <javier.tia@linaro.org>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 31 Oct 2023 12:26:18 +0000
In-Reply-To: <20231031042735.3842176-1-javier.tia@linaro.org>
References: <20231031042735.3842176-1-javier.tia@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 12:26:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189838

On Mon, 2023-10-30 at 22:27 -0600, Javier Tia wrote:
> Using ccache stopped to work after 77497dbdca with following error:
>=20
>   FileNotFoundError: [Errno 2] No such file or directory: 'ccache aarch64=
-trs-linux-strip'
>=20
> Signed-off-by: Javier Tia <javier.tia@linaro.org>
> ---
>  meta/lib/oe/package.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
> index 1dd20f85eb..2685da0af9 100644
> --- a/meta/lib/oe/package.py
> +++ b/meta/lib/oe/package.py
> @@ -39,7 +39,7 @@ def runstrip(arg):
>          newmode =3D origmode | stat.S_IWRITE | stat.S_IREAD
>          os.chmod(file, newmode)
> =20
> -    stripcmd =3D [strip]
> +    stripcmd =3D strip.split() if "ccache" in strip else [strip]
>      skip_strip =3D False
>      # kernel module
>      if elftype & 16:

That looks very like a hack/workaround rather than a real fix. The
packaging code shouldn't know/care about ccache.

Should we always be splitting strip?

Cheers,

Richard



