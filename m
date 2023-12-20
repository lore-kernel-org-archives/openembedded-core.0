Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7248CC3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 10:05:06 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.18481.1703066701065190790
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Dec 2023 02:05:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=djzU6m9C;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-33668163949so3363165f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 02:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1703066699; x=1703671499; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eF+cjn5SQ+OdPZcf6Wy5jfdasgMighuFEJHje+OYrik=;
        b=djzU6m9CADe2rLXlCpO7OiAG2xSHmJjW5pnrE+J1ZqKTtl2chsa+gDs1DzwqDle/+g
         14lpNrcXCwRuiZVoQj+CVaKK+c8oxryUpIxFnQVBedu/WptAq5bGcxkdWU1wxdHKKGQF
         Qp/niwIe0EESfWKV7jZlOJjRwteWXTm3HTnSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703066699; x=1703671499;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eF+cjn5SQ+OdPZcf6Wy5jfdasgMighuFEJHje+OYrik=;
        b=gEyXChfAlcQoGoFhetd6yM82wGGScULIDKsgnJ6SxHyvzxioVFZM87W6KWpGLMmc84
         86C291pFle6onF9ixHZpfDTOr4tUsF/9CdGakH18hfMxM8/C7c9+R+2QsB03el/bF6kM
         C59ekT+F0L8K4o88yerT2V1CNRwcDL6RqnemXsWbphBS+vp+E2+apNslB6FwZ0jgHDJ5
         oMbk0lMRkdTlJOkkDUYUg1nX/huOhPMzCV9L4gxlzsnDh1UswPuNbvk/OUjTopVu4odb
         1JCFqMG5lWMICo7a1NlK1wUjHMuNia94opmm97N4Pr/uMhw2x0xYtFlWjZKGt5u+8FI8
         iRdQ==
X-Gm-Message-State: AOJu0Yx1NO3WjBcZ4VGRqjD+75ic2xSRbrf6w7yOT7DkpLxAFEX3mH21
	EyvD8tzoIu6wobg/bjBurIS2+w==
X-Google-Smtp-Source: AGHT+IGBJvw3oBr5VLn+5InV9N0sEQrunE9avOtl14dLWxSuy3KeWwFMaZlaSioJMF5JopD3ytIXlQ==
X-Received: by 2002:a05:600c:4711:b0:40c:6ae0:936f with SMTP id v17-20020a05600c471100b0040c6ae0936fmr2507027wmo.275.1703066699103;
        Wed, 20 Dec 2023 02:04:59 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:c9b9:95cc:382c:f70c? ([2001:8b0:aba:5f3c:c9b9:95cc:382c:f70c])
        by smtp.gmail.com with ESMTPSA id m15-20020a056000180f00b0033677aae2e2sm2127213wrh.107.2023.12.20.02.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 02:04:58 -0800 (PST)
Message-ID: <3a7d3b6a2762163c7ca668c205962cd6cf5d5fd4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] qemurunner: Impove handling of serial
 port output blocking
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 20 Dec 2023 10:04:57 +0000
In-Reply-To: <87a5q52oa0.fsf@draig.linaro.org>
References: <20231218152951.3398964-1-richard.purdie@linuxfoundation.org>
	 <20231218152951.3398964-2-richard.purdie@linuxfoundation.org>
	 <87bkam449t.fsf@draig.linaro.org>
	 <86be77c51628028eeda996117c5eb02eb8bf5941.camel@linuxfoundation.org>
	 <87r0ji2lc9.fsf@draig.linaro.org>
	 <8c50fc53a29c4dcaab6316ec5b39b91c0d6bfa94.camel@linuxfoundation.org>
	 <87a5q52oa0.fsf@draig.linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 10:05:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192786

On Wed, 2023-12-20 at 09:53 +0000, Alex Benn=C3=A9e wrote:
> Richard Purdie <richard.purdie@linuxfoundation.org> writes:
>=20
> > On Tue, 2023-12-19 at 16:44 +0000, Alex Benn=C3=A9e wrote:
> > > Richard Purdie <richard.purdie@linuxfoundation.org> writes:
> > > Yeah I'm only seeing A10/A11:
> > >=20
> > >   o regression_1010.5 Invalid memory access 5
> > >     regression_1010.5 OK
> > >   o regression_1010.6 Invalid memory access 6
> > >=20
> > >   WARNING: here A10
> > >   WARNING: here A11
> > >   WARNING: here A10
> > >   WARNING: here A11
> > >   WARNING: here A10
> > >   WARNING: here A11
> > >   WARNING: here A10
> > >   WARNING: here A11
> > >   WARNING: here A10
> > >   WARNING: here A11
> > >   WARNING: here A10
> > >   WARNING: here A11
> > >   WARNING: here A10
> > >   WARNING: here A11
> > >   WARNING: here A10
> > >   WARNING: here A11
> > >   WARNING: here A10
> > >   WARNING: here A11
> > >   WARNING: here A10
> > >   WARNING: here A11
> > >   NOTE:  ... FAIL
> > >   DEBUG: Removed SIGALRM handler
> > >   Traceback (most recent call last):
> > >     File "/home/alex/lsrc/tests/trs/build/../poky/meta/lib/oeqa/core/=
decorator/__init__.py", line 35, in wrapped_f
> > >       return func(*args, **kwargs)
> > >              ^^^^^^^^^^^^^^^^^^^^^
> > >     File "/home/alex/lsrc/tests/trs/build/../poky/meta/lib/oeqa/core/=
decorator/__init__.py", line 35, in wrapped_f
> > >       return func(*args, **kwargs)
> > >              ^^^^^^^^^^^^^^^^^^^^^
> > >     File "/home/alex/lsrc/tests/trs/meta-trs/lib/oeqa/runtime/cases/o=
pteetest.py", line 27, in test_opteetest_xtest
> > >       self.assertEqual(status, 0, msg=3D'\n'.join([cmd, output]))
> > >   AssertionError: 255 !=3D 0 :  xtest              =20
> > >   Run test suite with level=3D0
> >=20
> > How long does it take for the test data to "back up" and timeout? The
> > logging thread should take a maximum of 2s to notice data not being
> > read/handled on the serial port.
>=20
> I don't think it goes around the logging loop more than once. I only
> see:
>=20
>   grep "got" build/tmp_trs-qemuarm64/work/trs_qemuarm64-trs-linux/trs-ima=
ge/1.0/temp/log.do_testimage
>   DEBUG: got [(12, 1)]
>=20
> from the poll.
>=20
> >=20
> > What the code should be doing is noticing the run_serial function isn't
> > using the port and if there is data there, reading it in the logging
> > thread. You could put further warnings around the code there to see if
> > it ever detects data to read on that port. A warning when it exits the
> > run_serial command may help too to see if it is waiting for data there
> > or not.
> >=20
> > I also ended up using:
> >=20
> > https://git.yoctoproject.org/poky-contrib/commit/?h=3Drpurdie/t222&id=
=3Dfebb0d892e4c3648cd88b8ecb9c0260edc45b68e
> >=20
> > to show what was going over the serial interface when I found it wasn't
> > what I expected.
>=20
> I'll keep digging.

I've merged the patches into master since they are helping the stdout
issue and helped a number of issues others were seeing.

In the final version of the patch I did fix an issue where the
exception handling from the thread was not working so well, it does at
least print a, exception/traceback properly now (in threadtarget()).

One of the reasons I asked about the warnings was in case that was
showing an issue, previously it silently failed.

I can believe there are other issues hiding in here :/.

Cheers,

Richard



