Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DA5ECD98DA
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 13:44:58 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.154567.1781617488209158760
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 06:44:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JxOhOVSQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.218.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-bf046d4da1fso423912566b.3
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 06:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781617486; x=1782222286; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5/sBxD3roYoNIdZ6XyOmkhsi9jlrERB9hGb6Z4cEGa0=;
        b=JxOhOVSQiTIq85yt+8GK0Y+bg/dgNN21WudEGK1Jc33q7Rf4rTIJoKKg+cKtTF8NeA
         ReqUMP/TgH8sq9H8g4MqYulYOgpUX858HbuUJWZR68Uwa1jT7SiieTlLBtUAI7eXiIrr
         yzgvzP9FTdNMb8phG+Vs6uHV00s/U1B2jqU3A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781617486; x=1782222286;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5/sBxD3roYoNIdZ6XyOmkhsi9jlrERB9hGb6Z4cEGa0=;
        b=W8Qehkk/cBZC11UFzbC9LyTxOzBpWlnkgUjvJiJ+ohFsKVqDwUKA+HOc+I+9wruu6B
         /ekl8fM9NbwtxatAoZo/mB5B2q9Vg4f3ypBYomgP6FmGeqEVIuNEfnXfNByYVGZzBFj1
         HapfnPaywmtfAiu2rr7pqWgeSGmdNEblRXWhnALmeA4v7F5Z0EOuu+cQeDwMVDswhuz6
         Ad+vqeE1n/vkZI+udI+TsTPCcvWchNy6vktbpxA67UZm8u1xrQiwBnjyROcaLdrx0cJc
         0V4YurAeL3W+8atBd7bdYNVlRjCYUGkPaa3z5pjMx76iOg7z/a0r1+VvIs0IvzOP4xqH
         WrwA==
X-Forwarded-Encrypted: i=1; AFNElJ8UkswIk27BnBVk7+enXEbffjx5M0gc9fKXANHrFtyWEuQJeYe3jOyPgoNK8GbpX3cBlmJeoe7QwIdWImDb+/hXkg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw1+VwWAvdeF9XGWHc0m6Yq8IYTSoVrl2WDLLTg+2zQT7eKTOOa
	8RrnzM9WfGOR8tRzg+abnE36HqojSNOU5gkYjTEiCv73qW92N42Gx5jB/DY61aaR7Hk=
X-Gm-Gg: Acq92OFl+dFDbc1V4QMwa/peUTA/SAJN/d+UAmRFNI1mX1RK/koWGXg+s5xrq4fb4Rm
	I8HQjR8rTbypE02CUzk69PmRve4q1g2fB9rQYIn0D3QhpargL6tqzEeH64NAMAWmT1Npla6p227
	fJc13cmngn0RcX0en7PjtxRpw7gmBXV5n0qdCzXTUD50wWAykUsBmZ8Fw2ocQgkIYYGuCUSehw+
	fS74KWyvJU5AeSEIbf4W5RNOYmtAB7TxOc58IkUhk++hHXdJKNLz36daEn/fI+SeljRGrIJkzE9
	zMMlv/4204IsxWUEhRq28JcLtZW8AfcO8qeADbPbwgyzT1DjP0BkHouK+DdcfQ9+vvAqCH6GyTH
	w0oUyxXzE0L5UTxPfxd3HaiZsIUcHIqn4i/PXtiEKeZv2A0/HGE5UmKwUtCal3UiOKCymAC5EBq
	OyFOpSfvO0M7ytNkpDWgUvak3iutBmv6qvoPGSVKua6YknbSJfN/t7/LdOK2nBbUB/42NRU2DJZ
	Cv/6/CE9Ic6GO0F
X-Received: by 2002:a17:906:9c86:b0:bee:280b:8be5 with SMTP id a640c23a62f3a-bff4a10c535mr676418266b.21.1781617486185;
        Tue, 16 Jun 2026 06:44:46 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3fda:ff4e:923e:e0cb? ([2001:8b0:aba:5f3c:3fda:ff4e:923e:e0cb])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb5318d8dsm627463166b.26.2026.06.16.06.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 06:44:45 -0700 (PDT)
Message-ID: <0bd08ff5a06dac60d667da9f17df183a0c971e2a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] package: replace copydebugsources shell
 pipelines with Popen
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: anders.heimer@runbox.com, Paul Barker <paul@pbarker.dev>, Anders Heimer
	 <anders.heimer@est.tech>, openembedded-core@lists.openembedded.org
Date: Tue, 16 Jun 2026 14:44:44 +0100
In-Reply-To: <77f24693-adcf-44b8-bf5e-af4a8f1bdee7@runbox.com>
References: <20260616082516.1553768-1-anders.heimer@est.tech>
	 <20260616082516.1553768-2-anders.heimer@est.tech>
	 <d85afa2fdb8aa0d09a8d9e0ec106c201b1630e9e.camel@pbarker.dev>
	 <77f24693-adcf-44b8-bf5e-af4a8f1bdee7@runbox.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 13:44:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238902

On Tue, 2026-06-16 at 15:35 +0200, Anders Heimer via lists.openembedded.org=
 wrote:
> On 6/16/26 14:12, Paul Barker wrote:
> > On Tue, 2026-06-16 at 10:25 +0200, Anders Heimer wrote:
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for pmap in prefixmap:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 env =3D os.environ.copy()
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 env["LC_ALL"] =3D "C"
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for pmap, prefix in prefi=
xmap.items():
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d=
stroot =3D dvar + prefix
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 # Ignore files from the recipe sysroots (target and native)
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 c=
md =3D=C2=A0 "LC_ALL=3DC ; sort -z -u '%s' | egrep -v -z '((<internal>|<bui=
lt-in>)$|/.*recipe-sysroot.*/)' | " % sourcefile
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s=
ort_p =3D subprocess.Popen(["sort", "-z", "-u", "--", sourcefile], stdout=
=3Dsubprocess.PIPE, stderr=3Dsubprocess.DEVNULL, env=3Denv)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 e=
grep_p =3D subprocess.Popen(["egrep", "-v", "-z", "-e", r"((<internal>|<bui=
lt-in>)$|/.*recipe-sysroot.*/)"], stdin=3Dsort_p.stdout, stdout=3Dsubproces=
s.PIPE, stderr=3Dsubprocess.DEVNULL, env=3Denv)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s=
ort_p.stdout.close()
> > > +
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 # We need to ignore files that are not actually ours
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 # we do this by only paying attention to items from this package
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 c=
md +=3D "fgrep -zw '%s' | " % prefixmap[pmap]
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 f=
grep_p =3D subprocess.Popen(["fgrep", "-zw", "-e", prefix], stdin=3Degrep_p=
.stdout, stdout=3Dsubprocess.PIPE, stderr=3Dsubprocess.DEVNULL, env=3Denv)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 e=
grep_p.stdout.close()
> > > +
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 # Remove prefix in the source paths
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 c=
md +=3D "sed 's#%s/##g' | " % (prefixmap[pmap])
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 c=
md +=3D "(cd '%s' ; cpio -pd0mlLu --no-preserve-owner '%s%s' 2>/dev/null)" =
% (pmap, dvar, prefixmap[pmap])
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s=
ed_p =3D subprocess.Popen(["sed", "s#%s/##g" % prefix], stdin=3Dfgrep_p.std=
out, stdout=3Dsubprocess.PIPE, stderr=3Dsubprocess.DEVNULL, env=3Denv)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 f=
grep_p.stdout.close()
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 c=
pio_p =3D subprocess.Popen(["cpio", "-pd0mlLu", "--no-preserve-owner", dstr=
oot], stdin=3Dsed_p.stdout, cwd=3Dpmap, stderr=3Dsubprocess.DEVNULL, env=3D=
env)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s=
ed_p.stdout.close()
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 f=
or proc in (cpio_p, sed_p, fgrep_p, egrep_p, sort_p):
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 proc.wait()
> > Hi Anders, thanks for the patches!
> >=20
> > If we're reworking this code, I think we should replace the complex
> > sed/grep/sort pipeline with Python code. We can read into a Python list
> > and sort/filter using the Python standard library, then pass the result=
s
> > to cpio.
>=20
> Thank you,=C2=A0 I am very happy to implement this approach instead. I=
=20
> strongly agree with all your comments.

There are some other things to consider here. This is a fairly
sensitive area of code from a performance perspective. You could code
much of this in python using shutil for example however shutil has
traditionally been up to an order of magnitude slower. As such, this
code was optimized to be fast, hence the use of cpio.

In many cases I worry less about performance but this is one area it
does really matter and makes a big difference to build speed overall.
python can be fast if carefully written but if this used shutil for
example, it likely won't be.

Cheers,

Richard


