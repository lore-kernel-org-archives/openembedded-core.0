Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DB52CAC587
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 13:31:30 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.46751.1757597481829290617
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Sep 2025 06:31:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cCnFBhw7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3df2f4aedc7so549315f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 06:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1757597480; x=1758202280; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KmdnhGSSHYImdbNxWknM6OF320XyBEpX2qoCQ1f5A1s=;
        b=cCnFBhw75A0gK3EcjE5YD9xY0lRi9A+UwGJ4a/Lsfl+i+rvshK1MZBP2l2ahrjc9pb
         RqSmdROp91HQbmCuzJfjg0mBZWj4zQsmdvkn1mrsZ4p7VqV5bgPnbSHwRz0WPc0wZZC1
         vXM3/FZcbcKmMOwbfMlT9vFt6P2CzAR1wprsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757597480; x=1758202280;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KmdnhGSSHYImdbNxWknM6OF320XyBEpX2qoCQ1f5A1s=;
        b=mfxQOGeziOys6h4Fa3W7OtcGlN56jw6cP62t3ELFuyFuy1NHOOTdn/XPi22Fr553VL
         ADfwRLGZvv1l0L4/wcqapBNa4c88ZiU8ml5vj5T9pTZ/lLxjX9nj005vgn10KDPwEUDj
         /DS2Ee94dOgJh6juSPGWOYHsfn4kaLi3yF674z8rGzOkP58aR7EpLEhsd/PdFr9IvwN1
         OUOIU2vCtpxOyMjUF/v3rK7MNMy1Bztp8hqp1iU4eqEFApbIwxYzaZOKg4kmzYHPmPRL
         1kka1qupBPMOWByPvM+0LZLCCHfj/h4kwPHv4zFzxpcBwG5aJlEOUiHUcPoByN3w5m0n
         6WCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJ7bx0rqqLX/LzYru3m5Wh43HX8gLR82/4kHNN2nwNvs7ZxMZUF/Dg+d5J+7+OK87/Xrzk4uBXWdYPPpmSg/jnXg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YweePupvgQCBYbnJrIqTG+d/aY00vE03/92QCmY2x2Vnq3/5+eX
	3waEJE5o24/b3L8UlBHdV1lGhjBr0+HeKDDCruefrrhBqYXbAaYGrIy2dOKp4Oe7Wb4=
X-Gm-Gg: ASbGnctXuCKE/D8r0+WbSJACgRRDImgpCCibNmDOsYes4wFdYv8WZ3e3fiJ108Yk5YF
	u218VM+Jza+c0+y9aZRUSlP1yzj9O93nnfA8dD1WhyC+qMiGferHOumjj6xXYorf0bFg6wYGTnh
	P19mWjP+lmYpXVgK+e8IgyryUcq9BOZXdE8u0H4M/kq2RwTFZuY8tU4Crg93Kqh/vnCFWCab3sk
	oC5np3o67cwlwfwKoUIZVKFfVK3UcVFxpYnVc2UmGIkF6iT2zZKn0qaSC0NU+cYfsbwQd6IAQz0
	i/GUmxc8Cq7ql8rQmVGh6zcbQAhgdt+EIVNeV1x8RHy7H/8aeXmiz0xqj/9+MHkq2pjXWpHQ4Ab
	RZ6RAQL/PBnhBV+BDSDF7JAZLfSCciq5pJMXn2bYYIwURH8m+q++9e1vuzUZc6kEuIUh35mdKzS
	eWAb1cTH4v9JHDCg6B/cJUxM+ja2oFgmiT
X-Google-Smtp-Source: AGHT+IHG7kAChEcbGn6MU7ToG/IueQtV0GUK868ThRxFe7fIg5JMSvKL9K90QrSqsvW07ycHMcA1tw==
X-Received: by 2002:a05:6000:40dd:b0:3d4:a64:6725 with SMTP id ffacd0b85a97d-3e636d901d5mr11548198f8f.10.1757597480134;
        Thu, 11 Sep 2025 06:31:20 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7316:f64c:1097:5ef5? ([2001:8b0:aba:5f3c:7316:f64c:1097:5ef5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607ccf9esm2453802f8f.40.2025.09.11.06.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 06:31:19 -0700 (PDT)
Message-ID: <ea6b3f3beb56b2cb5d2eb92562b6dc9990d94b1f.camel@linuxfoundation.org>
Subject: Re: [PATCH v4] scripts/runqemu: raise an error when bitbake was not
 found
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Richard =?ISO-8859-1?Q?Gr=FCnert?= <r.gruenert@pironex.com>, 
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 11 Sep 2025 14:31:18 +0100
In-Reply-To: <20250827064940.16074-1-r.gruenert@pironex.com>
References: <20250827064940.16074-1-r.gruenert@pironex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 13:31:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223279

On Wed, 2025-08-27 at 08:49 +0200, Richard Gr=C3=BCnert wrote:
> Running 'scrupts/runqemu' without bitbake in PATH causes the
> following error:
>=20
> ```
> Traceback (most recent call last):
> =C2=A0 File "/home/rg/temp_stuff/oe_2/./scripts/runqemu", line 1807, in m=
ain
> =C2=A0=C2=A0=C2=A0 config.check_args()
> =C2=A0=C2=A0=C2=A0 ~~~~~~~~~~~~~~~~~^^
> =C2=A0 File "/home/rg/temp_stuff/oe_2/./scripts/runqemu", line 624, in ch=
eck_args
> =C2=A0=C2=A0=C2=A0 s =3D re.search('^DEPLOY_DIR_IMAGE=3D"(.*)"', self.bit=
bake_e, re.M)
> =C2=A0 File "/usr/lib/python3.13/re/__init__.py", line 177, in search
> =C2=A0=C2=A0=C2=A0 return _compile(pattern, flags).search(string)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~^^^^^^^^
> TypeError: expected string or bytes-like object, got 'NoneType'
> ```
>=20
> This patch adds a more helpful error message to inform the user that
> bitbake was not found, e.g. because oe-init-build-env was not sourced.
>=20
> This is an example of the new error message after the patch:
>=20
> ```
> runqemu - ERROR - In order for this script to dynamically infer paths
> =C2=A0kernels or filesystem images, you either need bitbake in your PATH
> =C2=A0or to source oe-init-build-env before running this script.
>=20
> =C2=A0Dynamic path inference can be avoided by passing a *.qemuboot.conf =
to
> =C2=A0runqemu, i.e. `runqemu /path/to/my-image-name.qemuboot.conf`
>=20
> =C2=A0Bitbake is needed to run 'bitbake -e', but it is not found in PATH.=
 Please source the bitbake build environment.
> ```
>=20
> CC: Richard Purdie <richard.purdie@linuxfoundation.org>
> CC: Alexander Kanavin <alex.kanavin@gmail.com>
>=20
> Signed-off-by: Richard Gr=C3=BCnert <r.gruenert@pironex.com>
> ---
> changes in v4:
> Changed commit message and error message string according
> to suggestions by Alexander Kanavin.
>=20
> changes in v3:
> Messed up the CC tag :)
>=20
> changes in v2:
> Changed the position according to suggestion by Alexander Kanavin.
> I also changed the error to OEPathError as this seems to be made for
> this exact situation.
> ---
> =C2=A0scripts/runqemu | 7 ++++---
> =C2=A01 file changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/scripts/runqemu b/scripts/runqemu
> index c24528eac8..69872f6de8 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -1713,9 +1713,6 @@ to your build configuration.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.cleaned =3D True
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 def run_bitbake_env(self, mach=3DNone, target=3D=
''):
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bitbake =3D shutil.which('bit=
bake')
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if not bitbake:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retur=
n
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if not mach:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
mach =3D self.get('MACHINE')
> @@ -1732,6 +1729,10 @@ to your build configuration.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
cmd =3D 'bitbake -e %s %s' % (multiconfig, target)
> =C2=A0
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bitbake =3D shutil.which('bit=
bake')
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if not bitbake:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 raise=
 OEPathError("Bitbake is needed to run '%s', but it is not found in PATH. P=
lease source the bitbake build environment." % cmd.strip())
> +
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 logger.info('Running %s.=
..' % cmd)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 try:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
return subprocess.check_output(cmd, shell=3DTrue).decode('utf-8')


Sorry this has sat in review for a while, I needed to check into
something as I had a feeling there was once a codepath this would
break.

In runqemu there are these comments:

        # if we're running under testimage, or similarly as a child
        # of an existing bitbake invocation, we can't invoke bitbake
        # to validate the MACHINE setting and must assume it's correct...

and more specifically this code:

            if not self.bitbake_e:
                self.load_bitbake_env()
            if self.bitbake_e:
                [...]
            else:
                # when we're invoked from a running bitbake instance we won=
't
                # be able to call `bitbake -e`, then try:
                # - get OE_TMPDIR from environment and guess paths based on=
 it
                # - get OECORE_NATIVE_SYSROOT from environment (for sdk)
                tmpdir =3D self.get('OE_TMPDIR')


i.e. there is a case where we do run the bitbake -e command, bitbake
isn't found and we don't expect the issue to be fatal.

OE_TMPDIR is only set by our internal qemu runners:

meta/lib/oeqa/utils/qemurunner.py:            env["OE_TMPDIR"] =3D self.tmp=
dir
meta/lib/oeqa/utils/qemutinyrunner.py:            os.environ["OE_TMPDIR"] =
=3D self.tmpdir

i.e. in our automated testing, but that is a key workflow we need to suppor=
t.

What is interesting is that your patches do pass testing. It is
therefore possible we've changed things and this codepath isn't
actually needed any more. That may be due to the qemuboot config files,
which we probably didn't have when OE_TMPDIR was added.

Either way, we probably do need to try and clean up this codepath
before this change can merge.

Cheers,

Richard



