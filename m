Return-Path: <andreaskleist@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59696CAC587
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 13:28:20 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.46527.1757597295715486976
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Sep 2025 06:28:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LobIutdi;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: andreaskleist@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b042cc39551so115730266b.0
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 06:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757597294; x=1758202094; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1w6GOKLsFRZD17QMkzV+SIL8ZqpuO1tgq2Dfu4DPdaA=;
        b=LobIutdikodABwEg3rGplyjZWLE7UBT92cc48idKXYxB7CjvvedX/FgZ9atw13awGm
         qr0o1r0O1cvlemeA4HLbGsEUW3P65RELGuoEGl52/9wm8wD1W1C0s5LRQAoBEF5LlxNf
         IeYTgH/ljPzBtvs4AHNla04eYww7Zshpl7S0dg2Q8WqIGBLCXJVNfx/OvBKWcHExM6ag
         s1KOUPOVLVk2NGOLeuUjqmCfb8CEtHEft2j3Q9ifU34ekvvSLWcBnkrIajffU0PYq5xN
         fFR+pqxSQH9IqOTHnovmiL1CYyNQ7uEHlcQZw/JFPyhC+rCLAQLu+bC6QX36hgpte2ir
         05YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757597294; x=1758202094;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1w6GOKLsFRZD17QMkzV+SIL8ZqpuO1tgq2Dfu4DPdaA=;
        b=w8gvZ7FDeh/U6bOlgEdeeOt2k+y+GTkxQMV05ANl/itZc5Iro9rfKv2+pkiSB5f21N
         fbMgaqMNj3+pfpuzeqG4RlHrSte4V8vav2KT8kwdy3Vh9Yf1Jp5g+z+VBQSgWQ6Iqwv2
         BnzsIc7jG409MGX2oXej3iKuS1i99wEnvR3y31flMtJiTWdKxPmkt6wj7RdontHQCsqs
         Swfp7jsC0q3eAebpDrc43qt9Jh9R0GJ/4qvAcz4e5B/I2TV4IyP92u5EkCWtkoD3yV69
         Sr7p8uh9A6TuuB99z+ERrmYyzh8UO0LVszt7rnPvGlOoQTk/Q8UBRyiYZuMO+pPPsHyU
         ubag==
X-Forwarded-Encrypted: i=1; AJvYcCX2fIoxHp+d07B/vT03yeOmW3jR4cStcDy6fWyQXtG9Ls6uENHNZWC5MxrE8NpMwyu+0R4gRChiuuLRCzzdWjqKwg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzvWXYb4n/L3GRrrHBGTuHcGCXSzJGlNpS91dEz3aEAYWeJbQuR
	ShmQy6lxx6uJmOkcc5xM+YgUWqDgThnt9iWnB2I6O0Hi8iwT0yKjYMDI
X-Gm-Gg: ASbGncu0TRTp0jZDHRmw8dgHioOjJsRLI+Z8jxzbjTJx1kShTbEfa2U0Yii0MottHhN
	GRzRGThIOHZtsECVlxDWSaUurNBYqngYoRUHu2BqixVyd/vM2FYn05Soeo7+QgOMaJXiHszo7i9
	gcxnb4zNImnea+NG5slHgKja8qZqADwCPAg+Um8xrKJMAw6SzwhOqdU6RYyp7vMNH5hBsuyYR3H
	Q0fmVQwTI7bJmOZBIyrsd0vxfNiMa/MQBicTXKgHP82fk4+MAXlvpSu5aIf3bFANWiOxDZgAG+b
	y1kzOFwJLKqyAVrJ3LwS+BBRqNNiiEb9AOmP8M5F5YP2UYHF6N5+kghWBOmZyE036s8+ZHUwSKM
	JSZIxBJVycGydu+IciLT0+o2x
X-Google-Smtp-Source: AGHT+IEgVMXFTa3p8uY9h8urIztb4fDfSk/o+ONzxKrG63TWRlSqYObKbNSEavVua7cXvqF9sea2Cw==
X-Received: by 2002:a17:907:c10:b0:aff:2ed7:5f11 with SMTP id a640c23a62f3a-b04b1480ac1mr1874869066b.24.1757597293663;
        Thu, 11 Sep 2025 06:28:13 -0700 (PDT)
Received: from [10.9.136.51] ([87.62.83.1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b33478e4sm129172866b.96.2025.09.11.06.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 06:28:12 -0700 (PDT)
Message-ID: <328cdeca6f32532f49f8b1a704f60cb06f76eb97.camel@gmail.com>
Subject: Re: [OE-core][PATCH v2] environment.d-openssl.sh: fix unbound
 variable with 'set -u'
From: Andreas Helbech Kleist <andreaskleist@gmail.com>
To: Haixiao.Yan.CN@windriver.com, Mathieu Dubois-Briand
 <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org
Date: Thu, 11 Sep 2025 15:28:12 +0200
In-Reply-To: <c7039f90-656f-4076-a726-e931365091b9@windriver.com>
References: <20250905123421.3940634-1-haixiao.yan.cn@windriver.com>
	 <DCOC0GHAATJU.2COUF7546LC27@bootlin.com>
	 <c7039f90-656f-4076-a726-e931365091b9@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 13:28:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223278

Hi=C2=A0Haixiao,

On Wed, 2025-09-10 at 16:52 +0800, Yan, Haixiao (CN) via
lists.openembedded.org wrote:
>=20
> On 2025/9/9 22:16, Mathieu Dubois-Briand wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the
> > sender and know the content is safe.
> >=20
> > On Fri Sep 5, 2025 at 2:34 PM CEST, Haixiao (CN) via
> > lists.openembedded.org Yan wrote:
> > > From: Haixiao Yan <haixiao.yan.cn@windriver.com>
> > >=20
> > > When Bash runs with 'set -u' (nounset), accessing an unset
> > > variable
> > > directly (e.g. [ -z "$SSL_CERT_FILE" ]) causes a fatal "unbound
> > > variable"
> > > error. As a result, the fallback logic to set
> > > SSL_CERT_FILE/SSL_CERT_DIR
> > > is never triggered and the script aborts.
> > >=20
> > > The current code assumes these variables may be unset or empty,
> > > but does
> > > not guard against 'set -u'. This breaks builds in stricter shell
> > > environments or when users explicitly enable 'set -u'.

Thank you for working on this. We just ran into this issue after a
small upgrade in the scarthgap branch, so I'm hoping this will also be
backported to scarthgap.

> > >=20
> > > Fix this by using parameter expansion with a default value, e.g.
> > > "${SSL_CERT_FILE:-}", so that unset variables are treated as
> > > empty
> > > strings. This preserves the intended logic (respect host env
> > > first, then
> > > CAFILE/CAPATH, then buildtools defaults) and makes the script
> > > robust
> > > under 'set -u'.
> > >=20
> > > Note: environment.d-curl.sh, environment.d-python3-requests.sh,
> > > and environment.d-git.sh have the same issue and should be fixed
> > > similarly.

The patch title doesn't mention these changes.

I don't know if changing the title or splitting the patches would be
the preferred approach?


> > >=20
> > > Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
> > > ---
> > Hi Haixiao,
> >=20
> > Thanks for your patch.
> >=20
> > It looks like this is leading to failed SDK installations in some
> > cases,
> > as some other variables are undefined:
> >=20
> > ERROR: core-image-sato-1.0-r0 do_testsdkext: Couldn't install the
> > extensible SDK:
> > Poky (Yocto Project Reference Distro) Extensible SDK installer
> > version 5.2.99+snapshot
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > You are about to install the SDK to "/srv/pokybuild/yocto-
> > worker/qemuarm64-armhost/build/build/tmp/work/qemuarm64-poky-
> > linux/core-image-sato/1.0/testsdkext". Proceed [Y/n]? Y
> > Extracting SDK................................................done
> > Setting it up...
> > Extracting buildtools...
> > Preparing build system...
> >=20
> >=20
> > Contents of preparing_build_system.log:
> > sh: 17: /srv/pokybuild/yocto-worker/qemuarm64-
> > armhost/build/build/tmp/work/qemuarm64-poky-linux/core-image-
> > sato/1.0/testsdkext/layers/build/oe-init-build-env: BASH_SOURCE:
> > parameter not set
> >=20
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/8/builds/2375
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/36/builds/2346
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/80/builds/2197
> >=20
> >=20
> > SDK testing environment: x86_64-pokysdk-linux
> > Traceback (most recent call last):
> > =C2=A0=C2=A0 File "/srv/pokybuild/yocto-
> > worker/buildtools/build/meta/lib/oeqa/buildtools/cases/build.py",
> > line 21, in test_libc
> > =C2=A0=C2=A0=C2=A0=C2=A0 self._run('. %s/oe-init-build-env %s' % (coreb=
ase, testdir))
> > =C2=A0=C2=A0 File "/srv/pokybuild/yocto-
> > worker/buildtools/build/meta/lib/oeqa/sdk/case.py", line 17, in
> > _run
> > =C2=A0=C2=A0=C2=A0=C2=A0 return subprocess.check_output(". %s > /dev/nu=
ll; %s;" % \
> > =C2=A0=C2=A0 File "/usr/lib64/python3.9/subprocess.py", line 424, in
> > check_output
> > =C2=A0=C2=A0=C2=A0=C2=A0 return run(*popenargs, stdout=3DPIPE, timeout=
=3Dtimeout,
> > check=3DTrue,
> > =C2=A0=C2=A0 File "/usr/lib64/python3.9/subprocess.py", line 528, in ru=
n
> > =C2=A0=C2=A0=C2=A0=C2=A0 raise CalledProcessError(retcode, process.args=
,
> > oeqa.utils.subprocesstweak.OETestCalledProcessError: Command '.
> > /srv/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-
> > nativesdk-pokysdk-linux/buildtools-tarball/1.0/testimage-
> > sdk/environment-setup-x86_64-pokysdk-linux > /dev/null; .
> > /srv/pokybuild/yocto-worker/buildtools/build/oe-init-build-env
> > /srv/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-
> > nativesdk-pokysdk-linux/buildtools-tarball/1.0/testimage-
> > sdk/bitbake-build-vbmlrryg;' returned non-zero exit status 1.
> > Standard Output: /srv/pokybuild/yocto-worker/buildtools/build/oe-
> > init-build-env: line 29: BBSERVER: unbound variable
> >=20
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/43/builds/2371
> >=20
> >=20
> > Can you fix these failures please?
>=20
> Remove 'set -eu' to avoid propagating strict mode to other
> environment.d=20
> scripts.

Instead of using 'set -eu' in each script, which as can be seen above
doesn't work, I'd suggest adding a test case that sources the
environment-setup-* from a shell with 'set -eu' called.


>=20
> Sent v3.
>=20
> Thanks,
>=20
> Haixiao
>=20
> >=20
> > Thanks,
> > Mathieu
> >=20
> > --
> > Mathieu Dubois-Briand, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
> >=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#223151):
> https://lists.openembedded.org/g/openembedded-core/message/223151
> Mute This Topic: https://lists.openembedded.org/mt/115081014/7501392
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> andreaskleist@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


