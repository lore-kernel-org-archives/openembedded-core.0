Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6805ACDD56B
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 12:58:43 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.18934.1726750720181321080
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 19 Sep 2024 05:58:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ee2KWEYu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42cbaf9bfdbso7218545e9.0
        for <Openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 05:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1726750718; x=1727355518; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=i31n1TlWSLy2d4w8WymGXs7HWm9S0LXf4nS6fCGuRRY=;
        b=ee2KWEYuJl+B7i9R4Jri1XmndReyM1mIvKVg0EbSygIQoV5EbwI5kLusL8fC6JMIwB
         v0LQhG6XY61MOMDloTQImLhRks5Ql8m+cqUdMS/t/sLpZba1L5b7ZuID4+95V09C1zKL
         HyjrkThY56J3ODTjl+pZf2bzLDrPqzf7EAAbc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726750718; x=1727355518;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i31n1TlWSLy2d4w8WymGXs7HWm9S0LXf4nS6fCGuRRY=;
        b=eRKtM+vlcOjYmfdC3BTvjjKejlB7DRDR5ZdULttcIr13uhLg0EB4ClgM3WkFJdVtzw
         znv3CkjK7iuHMDOAe3OJ5S4CtnbL5W7LyO181/YJZwaiGwjxUnaDOWQp8l0DvGhV940c
         INP6lVE+psPDHTo8vzeXihKxQBOGkHoy1xokZtP6k8Uc9G78mfN2gcI5/xPBfo9x+p1Y
         pQZnQ3sQgvNnYFQg6/RMfYlW+mlnuMFarqZmfacKJpA1hwYuH/VwRO7nedjAPJ0DKmlr
         XuRyzYlG2nmW5WjQFjlKZkqsGLFyBieGhxgOdgWHDqm4Oxjw4d++PJukVHlgzsnE0D1i
         H3Lw==
X-Forwarded-Encrypted: i=1; AJvYcCVTCV6IaxSYYYfmoRk4pOFLpMpknwPARQs9SjqWWnq2dhLSYIYh7DNanAZUS5zJvAoRh+wLWSdrKEfG9Qne5YSRfg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyLcn8/E4vzY3yC0sUntQKhjM9C3spS2MM9bq2IJy+3ss3v0MfG
	LHH5TppQDSEZlcXFCdkfPwy1O78jjL64+4I0lb310QrpEtbYmQFdlSuEkiDysdA=
X-Google-Smtp-Source: AGHT+IEiwqL2RAK9b4SXVm7kYI4lEO8knv4/VWJWQhrAi4K+0n9XFptwFk8MYsmqbURHDFsjoejwqg==
X-Received: by 2002:a05:600c:1d05:b0:42c:c08e:c315 with SMTP id 5b1f17b1804b1-42d90827159mr187400845e9.16.1726750718511;
        Thu, 19 Sep 2024 05:58:38 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f722:770d:8a57:e159? ([2001:8b0:aba:5f3c:f722:770d:8a57:e159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e754c5fb9sm21051825e9.43.2024.09.19.05.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 05:58:38 -0700 (PDT)
Message-ID: <7a062edc9676b801da41ea875a7a4e82267a751f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] oeqa/postactions: do not uncompress
 retrieved archive on host
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alexis.lothore@bootlin.com, Openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>, Steve Sakoman <steve@sakoman.com>
Date: Thu, 19 Sep 2024 13:58:37 +0100
In-Reply-To: <17F6955C7A69DDF6.31299@lists.openembedded.org>
References: <20240812151404.134030-1-alexis.lothore@bootlin.com>
	 <20240812151404.134030-3-alexis.lothore@bootlin.com>
	 <17F6955C7A69DDF6.31299@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 12:58:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204684

On Thu, 2024-09-19 at 08:42 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Mon, 2024-08-12 at 17:14 +0200, Alexis Lothor=C3=A9 via
> lists.openembedded.org wrote:
> > From: Alexis Lothor=C3=A9 <alexis.lothore@bootlin.com>
> >=20
> > Current postaction module executes a remote tar command, pipe it in
> > a SSH
> > connection, and uncompress the raw stream with another tar command.
> > With
> > this command, the whole artifacts tree is directly available on the
> > host
> > executing the test, but it is not very convenient if we want to
> > download
> > the whole retrieved ptests directory.
> >=20
> > Stop uncompressing the retrieved ptests archive onto host, just
> > save the
> > archive as it is. The new output then looks like the following:
> >=20
> > tmp/log/oeqa-artefacts
> > =E2=94=94=E2=94=80=E2=94=80 oeqa-target-artefacts-20240812-juzqdb80
> > =C2=A0=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 host_disk_usage.txt
> > =C2=A0=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 target_disk_usage.txt
> > =C2=A0=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 tests_artifacts.tar.gz
> >=20
> > Suggested-By: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > Signed-off-by: Alexis Lothor=C3=A9 <alexis.lothore@bootlin.com>
> > ---
> > =C2=A0meta/lib/oeqa/utils/postactions.py | 3 ++-
> > =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/meta/lib/oeqa/utils/postactions.py
> > b/meta/lib/oeqa/utils/postactions.py
> > index 3b537146c50a..d5080523aa83 100644
> > --- a/meta/lib/oeqa/utils/postactions.py
> > +++ b/meta/lib/oeqa/utils/postactions.py
> > @@ -68,7 +68,8 @@ def list_and_fetch_failed_tests_artifacts(d, tc,
> > artifacts_list, outputdir):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (status, output) =3D t=
c.target.run(cmd, raw =3D True)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if status !=3D 0 or no=
t output:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 raise Exception("Error while fetching compressed
> > artifacts")
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p =3D subprocess.run(["tar"=
, "zxf", "-", "-C", outputdir],
> > input=3Doutput)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 with open(archive_name, "wb=
") as f:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 f.w=
rite(output)
> > =C2=A0=C2=A0=C2=A0=C2=A0 except Exception as e:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.warn(f"Can not retr=
ieve artifacts from test target:
> > {e}")
>=20
>=20
> This change is causing failures since archive_name isn't defined
> anywhere :/

I'd also note that scarthgap actually throws errors:

https://valkyrie.yoctoproject.org/#/builders/73/builds/135/steps/12/logs/st=
dio

Exception: NameError: name 'artifact_path' is not defined

which is related to some of these patches :/.

Cheers,

Richard





