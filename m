Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 445A8D0D168
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 18:37:18 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13406.1767811036858734480
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 10:37:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WFdmnWY3;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-382fa66fa9dso12322401fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 10:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767811035; x=1768415835; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CyFvl18FSJZx8MIIm1l9JLSiVd8Y35DuDbJgfbxgz6Q=;
        b=WFdmnWY3nC8e1h776nPW/vpfJB26ccD+R4z/9v2lKLCh9mVOVgF1amnY5eSi+GQZjV
         cloHtfh+SjQOUAbMflrvNniNW+D06cUeRWXDNDolo4RkjXdW9gViIW3zsEpQ30925TBT
         WS3iSF8ClpUA/u6Jpw6vQtmY5q/aotueTQQJeZtKHdZ+QV//f/PkjwvBGg6ORe5xjMqG
         6bQaAhR2y1kc7pQD2UaKRSIJ9tXHUeu1ES7jQdrbysvmm0WaARVUEfuFyaH7MBT3vBTm
         uUbJyNh/in86n9zm6FwsjHGVbGGHaP5Dq10gTS9KnseC4V9yWypDgr9p7g2ovNxRAcpk
         QSSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767811035; x=1768415835;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CyFvl18FSJZx8MIIm1l9JLSiVd8Y35DuDbJgfbxgz6Q=;
        b=UMa19wQYnV+Ac4Srwmh/U3TVIrFJRnGFj64c6vU0SLbEUOe4fTKtO7Uu5DCUOvxUU/
         3qLDw2LKhcIphvXOQ5jw0nmEgPYIt6S8HHnvtrPnO/Dxzf0Z2UMMf1YDD/ZIGKhGe/ch
         0LoIY+oOZnmOruViWspig750ctJv5VwoWOoQoVIeLLeb6RrAQbTCeif13/fboLvzGKcP
         cp1v9zhcg2UmiNYBBCOdmcxt9ECwpx541L1lOrVVWyVgprpi4VA67pL+AvKVo5nWHwVx
         +BBFCQlimPxG71ITKh2esQSqkDmLVFzNm38u5eXpPcNJ69jm21AQtQL+il6813x8G/t5
         xSeg==
X-Gm-Message-State: AOJu0YxaCafYa+P74PP8tB6o7oEZN1aKZ1HPSq9Qt47oHOjfG7u1xHdO
	3KtPzBxZt1KqaZtdNEy3g9bxTtB0HRm9/uAucL/eTu2Yf3tezXk4Vx3QzNHw0DBYMpkMBXXPuRW
	u0W75KjZ+y3xFe4WZw7B/Ttl7ae5pkaQ=
X-Gm-Gg: AY/fxX5ffywXG5vqXq8fSiLlir8WmmOH2w+n/PXaRNCP/2jK4oxEqfREF+ySeqeScT2
	9mD1VpnAdgietHJf5T+94KGYocgG1LjPEUMqYJwL4NyfJoanIw7UtUoyGZSQyoT1vot8xJKNQsy
	/NFAK4/E6oUN+ZJJIBzyFv3+b49apubq9c0icxnNSwvK34aiW7eSzoQ0T5mHS9Io7EcR2LqU50L
	ZGzUiESeEy+4jiPI4Fg0g8kcpdxN193wrTXWfA5BRA96uy+pG26YnqKYApwWY8jBQnGPgkvaA==
X-Google-Smtp-Source: AGHT+IGa95HT4G5Fr50bkdSHjmmx4LbLhhSKbzcT05pHH/IjimtBs2OyQf8r16oUHVDs3Rg7aeSyndQSpeUfnJxaDO0=
X-Received: by 2002:a05:651c:30c9:b0:37e:644a:49ad with SMTP id
 38308e7fff4ca-382ff81edb8mr11210991fa.29.1767811034605; Wed, 07 Jan 2026
 10:37:14 -0800 (PST)
MIME-Version: 1.0
References: <20260107090744.844-1-liuyd.fnst@fujitsu.com> <DFIJ09ZSDBHO.216DO8W5SDGE1@bootlin.com>
 <DFIJ1YYREQ2V.3041A1DCKFC6M@bootlin.com> <B5EDA89D-D76F-4BB7-83AA-D483BD776843@oss.qualcomm.com>
In-Reply-To: <B5EDA89D-D76F-4BB7-83AA-D483BD776843@oss.qualcomm.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 7 Jan 2026 19:36:59 +0100
X-Gm-Features: AQt7F2pmWqhht3j3-fRlno3bwSEj50T-_q1-ZkbxMiAvVDWZDhkT0uTKv3N3O9w
Message-ID: <CA+chaQeSc-46VWbMAj0wkMQmThSGsF-k8A6Xd4UUwbXRL5nafA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] python3-pyzstd: upgrade 0.17.0 -> 0.19.1
To: koen.kooi@oss.qualcomm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 18:37:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229027

On Wed, Jan 7, 2026 at 7:01=E2=80=AFPM Koen Kooi via lists.openembedded.org
<koen.kooi=3Doss.qualcomm.com@lists.openembedded.org> wrote:
>
>
>
> > Op 7 jan 2026, om 18:19 heeft Mathieu Dubois-Briand via lists.openembed=
ded.org <mathieu.dubois-briand=3Dbootlin.com@lists.openembedded.org> het vo=
lgende geschreven:
> >
> > On Wed Jan 7, 2026 at 6:17 PM CET, Mathieu Dubois-Briand wrote:
> >> On Wed Jan 7, 2026 at 10:07 AM CET, Yiding Liu (Fujitsu) via lists.ope=
nembedded.org wrote:
> >>> 1.Changelog:
> >>>  Fix SeekableZstdFile write table entries on 32-bits architectures wh=
en there is a huge number of entries.
> >>>
> >>> 2.Remove 0001-Remove-setuptools-version-limit-of-74.patch as setuptoo=
ls was removed in pyproject.toml.
> >>>
> >>> 3.Remove do_configure:append as there is no setup.py in 0.19.1
> >>>
> >>> Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> >>> ---
> >>
> >> Hi Liu,
> >>
> >> Thanks for your patch.
> >>
> >> It looks like the ptests are failing:
> >>
> >> Failed ptests:
> >> {'python3-pyzstd': 'START: ptest-runner\n'
> >>                   '2026-01-07T17:04\n'
> >>                   '\n'
> >>                   'ImportError while importing test module '
> >>                   "'/usr/lib/python3-pyzstd/ptest/tests/test_seekable.=
py'.\n"
> >>                   'Hint: make sure your test modules/packages have val=
id '
> >>                   'Python names.\n'
> >>                   'Traceback:\n'
> >>                   '../../python3.13/importlib/__init__.py:88: in '
> >>                   'import_module\n'
> >>                   '    return _bootstrap._gcd_import(name[level:], pac=
kage, '
> >>                   'level)\n'
> >>                   '           '
> >>                   '^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^\n'
> >>                   'tests/test_seekable.py:17: in <module>\n'
> >>                   '    from pyzstd import (\n'
> >>                   '../../python3.13/site-packages/pyzstd/__init__.py:1=
9: in '
> >>                   '<module>\n'
> >>                   '    from backports import zstd\n'
> >>                   "E   ModuleNotFoundError: No module named 'backports=
'\n"
> >>                   'ERROR: tests/test_seekable.py:tests/test_seekable.p=
y\n'
> >>                   '\n'
> >>                   'ImportError while importing test module '
> >>                   "'/usr/lib/python3-pyzstd/ptest/tests/test_zstd.py'.=
\n"
> >>                   'Hint: make sure your test modules/packages have val=
id '
> >>                   'Python names.\n'
> >>                   'Traceback:\n'
> >>                   '../../python3.13/importlib/__init__.py:88: in '
> >>                   'import_module\n'
> >>                   '    return _bootstrap._gcd_import(name[level:], pac=
kage, '
> >>                   'level)\n'
> >>                   '           '
> >>                   '^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^\n'
> >>                   'tests/test_zstd.py:19: in <module>\n'
> >>                   '    from pyzstd import ZstdCompressor, '
> >>                   'RichMemZstdCompressor, \\\n'
> >>                   '../../python3.13/site-packages/pyzstd/__init__.py:1=
9: in '
> >>                   '<module>\n'
> >>                   '    from backports import zstd\n'
> >>                   "E   ModuleNotFoundError: No module named 'backports=
'\n"
> >>                   'ERROR: tests/test_zstd.py:tests/test_zstd.py\n'
> >>                   '=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D\n'
> >>                   'Testsuite summary\n'
> >>                   '# TOTAL: 2\n'
> >>                   '# PASS: 0\n'
> >>                   '# SKIP: 0\n'
> >>                   '# XFAIL: 0\n'
> >>                   '# FAIL: 0\n'
> >>                   '# XPASS: 0\n'
> >>                   '# ERROR: 2\n'
> >>                   '\n'
> >>                   'ERROR: Exit status is 2\n'
> >>                   'DURATION: 1\n'}
> >>
> >> ptests which had no test results:
> >> ['python3-pyzstd']
> >>
> >> Can you have a look at this issue?
> >>
> >> Thanks,
> >> Mathieu
> >
> > Sorry, I was too quick again... Here is the link to the failure:
> >
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/2881
>
> I suspect that will resolve itself when python 3.14.x gets merged, but it=
 would be good to see if it can be fixed to work with the current 3.13.x. A=
nd I really should enable ptests in my DISTROs....

Or you can import the backports recipe like meta-oe did to fix this as
mentioned in:
https://lists.openembedded.org/g/openembedded-core/message/228548

