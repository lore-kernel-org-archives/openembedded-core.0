Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C863CD4F5E
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 06:39:48 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6157.1779259181781548656
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 23:39:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Wl75rUgA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-44c350a5b87so2649525f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 23:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1779259180; x=1779863980; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vn7gbpPhPvVKVpq3Usskl/SqniMkpPjNafvUGw7tpAk=;
        b=Wl75rUgAz4PBNYPDPAclje3szUIZnvwxvQTQ/dvUaA4+v2deqf8xDAW59U9HHDtxUE
         jeDGMG9yyBNI44DlbeJOt2AtSTzYczXRjGmuKI/Ai+5qk2pMyq1cv0VM/KKXvvhr4eUz
         5/hWZzvg9APgE+A1gZ0LonZ5Ej9RIPXWv/4f8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779259180; x=1779863980;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vn7gbpPhPvVKVpq3Usskl/SqniMkpPjNafvUGw7tpAk=;
        b=iodt5VtsJN9vm5C6hYwS1V+2CzP8JiRCbvIDCasSvPMi7d2EDLes0Nfek3eLd27SI0
         rWqp2ros9ie7Z8vn2LR7VAyMhIUWTRjQjpH3zIqXTBMdnK4Q+zFTdh8ERzv3yIywzhct
         /kY/9F5EY6Z/gBNxdCfvX8eARmScbDWuqOSMbXNG61SXprGcBKoUwe8QWnrfoUQ4jGb5
         2qxvr5TIRiTaURXgVAebYKBTCJq7ERN1UlJedrq6/LkrgGUaQMM8ZbrG81BRCYY2v9aN
         1Ywl3swsWfnTuUlalSs+FZIdq1v5WBmWkUgt6pVc9dVRidF28RfVo8tFm+SyJx8zMmdH
         zCZw==
X-Forwarded-Encrypted: i=1; AFNElJ/W3xFgOqrDcSPk1tBSvuIg0EeT1xfWmfGW4ZWbhKdPypaGjwobykOv2QMXOkL7vhMabaKR1Koub808xEje+r6GTA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy5sJGObC3/M8i8n9ANnz7SoKjMDCKYUTe8BHo0XvESwQcp1x9c
	oI7e/Y10Gf1lrow0Yui5G2clU/C4hw9BLogHT70SDUVxfUD3+sQfNEnaOz1wc9JWwu+eb5unLf4
	34s84
X-Gm-Gg: Acq92OFJpVkh9iB9L3eDwJM5n7MYfmX8Jc+bDZc4gex4Rx7PBBq0/qy0+xYmqYRXm6t
	1MDmTdBD1m5GhasgXoMbsGnF9daFMJPhexhWTbj5xwyFaw3D40v7mDWXhFrhZOxNlomHq31WlpF
	qFPTrGu4UIMJloeWcC5bzHUCBHDltWKbxr4toxgXikzzssFnEj41TJvuenMDXvF2jA28wGvg3nk
	phwKAD4LNwV9yE4RrNYN7YOuthxDEiTGrDEVbOWNzVn91a7HcGoLrJiWFeFU+pwnxVlN2p149Nb
	X5HGBxQVx0VHQzAUp43x68UresSH8CmLUmmGQYMmLtNWjOFAnVWgNJiE1GCea33tnJQgKp6SBjy
	iWeIQ+i8oIrcjb0Q34s2q1JiMAUpYImKBkcmCfYZxb27iqpxN/354obr6KIllLdHgVzkWy1/y9M
	3Y/33/w+q/kOBJHbXe1cqUjHZV9il+SqIPDA6IqapYjzVWz2vKoKvs2e2Lac2r3dl+w0AELhUBf
	Fw54qpa/IszVgCd0mpPePRQ5TM=
X-Received: by 2002:a05:6000:24c5:b0:45a:cea8:e4b2 with SMTP id ffacd0b85a97d-45e5c5ebcdfmr35278867f8f.29.1779259179883;
        Tue, 19 May 2026 23:39:39 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ba52:db3d:42e4:2c0d? ([2001:8b0:aba:5f3c:ba52:db3d:42e4:2c0d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec3ac86sm50945293f8f.14.2026.05.19.23.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 23:39:39 -0700 (PDT)
Message-ID: <ee09cd976a5a301e7ed4eb6a3c419eb05e965508.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] perf: disable BUILD_BPF_SKEL when rust in
 kernel feature is enabled
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Harish.Sadineni@windriver.com, openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Date: Wed, 20 May 2026 07:39:36 +0100
In-Reply-To: <20260519152512.662193-1-Harish.Sadineni@windriver.com>
References: <20260519152512.662193-1-Harish.Sadineni@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 06:39:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237384

On Tue, 2026-05-19 at 08:25 -0700, Sadineni, Harish via lists.openembedded.=
org wrote:
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>=20
> Enabling the Rust in-kernel feature pulls in clang-native as a
> dependency for the kernel build. During the perf build, the presence of c=
lang
> causes all BUILD_BPF_SKEL dependency checks to succeed, which makes perf =
attempt
> to build bpftool as part of its build process and make build to fail.
>=20
> Previously, When Rust support was not enabled, BUILD_BPF_SKEL is set 0 du=
e to missing
> clang dependency.
>=20
> Error:
> > make[3]: *** ../bpf/bpftool: No such file or directory.=C2=A0 Stop.
>=20
> As a workaround currently disabling BUILD_BPF_SKEL to make perf to build.
>=20
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---
> =C2=A0meta/recipes-kernel/perf/perf.bb | 6 ++++++
> =C2=A01 file changed, 6 insertions(+)
>=20
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/=
perf.bb
> index c3ef25fd99..6e4d395828 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -438,3 +438,9 @@ perf_fix_sources () {
> =C2=A0		fi
> =C2=A0	done
> =C2=A0}
> +
> +# Disable BUILD_BPF_SKEL when the Rust kernel feature is enabled.
> +# Rust in kernel support pulls in clang-native, which satisfies the
> +# BUILD_BPF_SKEL dependency checks and causes perf to attempt
> +# building bpftool, resulting in a build failure.
> +EXTRA_OEMAKE +=3D "${@bb.utils.contains('KERNEL_FEATURES', 'rust', 'BUIL=
D_BPF_SKEL=3D0', '', d)}"

Wouldn't you disable that unconditionally, or add a PACKAGECONFIG for
it which we just disable by default?

Cheers,

Richard

