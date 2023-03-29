Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCF8DC74A5B
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 22:33:37 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.11433.1680129208842663040
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Mar 2023 15:33:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OhZap6la;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id i5-20020a05600c354500b003edd24054e0so12340841wmq.4
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 15:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680129207;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJum+0W6A04DpVNSsefy7DlJ6gZR6kzd9b4cnyAHQwc=;
        b=OhZap6laraV8ZNEe5Iic5EUNZ681urC2h+DFpjJqwJsESqktKFGbAIJbJFANsvMb8M
         TSXXc52pQ+Lewnpr4sOsM+rQq2QgfD4sR6VYWTS7VPdWNPvNVNftsRtdD+XIb1hIVoX3
         zOqdUB1u8ZFAnuR17+V58/JKnmGg8emcw/tRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680129207;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YJum+0W6A04DpVNSsefy7DlJ6gZR6kzd9b4cnyAHQwc=;
        b=IelIDSQrKWA/c2ae+EjuPCnhbQfXOTrm7KnaH+VFeXPgiRieUKiY5bX0RKoizjRk9e
         RkHICiL3Fsyo4dZaElRQH7fTSFM/rLAKxELTqhz7PomMxAjXcrcHyfPeUSkP26xsiWwp
         2YZJCl+X3wN1tWMI9EnFwD9y7wIbEPiKF/synrbo5BvCZiX7yi06NneXQoKu+b/JCYl9
         ffy41MuSsno78u6MRLmJXPusCTBY0A1Wf13CPegrjoHxHVQg+OlwwPf/WFxucnM3KomL
         UX90QIL8QrQKfoPMt0hNW1DEkVX6P6e6XZ5p4lf7jpZZxBtx8Kdjy+7KqK8mLFWG2Sbp
         JLzg==
X-Gm-Message-State: AAQBX9eX3nXrvdBsbbNPejMeQv9Eq7bP11c8gWqjTNrfpvWsINei8Lg/
	/DXMMw7fxC5CRVTS1Xc5IR7Bkg==
X-Google-Smtp-Source: AKy350Z8Oso+j58E5eNRqzwGdCD6qYKOYfmTM8rCjBf+j+jOD3tMSGBKr8Sx/4Kb1JHnK63RQnT6Fg==
X-Received: by 2002:a05:600c:ac7:b0:3f0:3377:c15f with SMTP id c7-20020a05600c0ac700b003f03377c15fmr600008wmr.12.1680129206957;
        Wed, 29 Mar 2023 15:33:26 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:baab:1fff:1fab:55d8? ([2001:8b0:aba:5f3c:baab:1fff:1fab:55d8])
        by smtp.gmail.com with ESMTPSA id g19-20020a05600c311300b003ee74c25f12sm3728359wmo.35.2023.03.29.15.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 15:33:26 -0700 (PDT)
Message-ID: <d7fad7b0cea99470a35d5c3c0f057d6e4f70f758.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] lib/oe/gpg_sign.py: Avoid race when creating
 .sig files in detach_sign
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tobias Hagelborn <tobias.hagelborn@axis.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 29 Mar 2023 23:33:25 +0100
In-Reply-To: <20230323100847.3740485-1-tobiasha@axis.com>
References: <20230323100847.3740485-1-tobiasha@axis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 22:33:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179298

On Thu, 2023-03-23 at 11:08 +0100, Tobias Hagelborn wrote:
> Move the signature file into place only after it is successfully signed.
> This to avoid race and corrupted .sig files in cases multiple onging
> builds write to a shared sstate-cache dir.
>=20
> Signed-off-by: Tobias Hagelborn <tobiasha@axis.com>
> ---
>  meta/lib/oe/gpg_sign.py | 25 +++++++++++++++----------
>  1 file changed, 15 insertions(+), 10 deletions(-)
>=20
> diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
> index 613dab8561..868846cdc5 100644
> --- a/meta/lib/oe/gpg_sign.py
> +++ b/meta/lib/oe/gpg_sign.py
> @@ -5,11 +5,12 @@
>  #
> =20
>  """Helper module for GPG signing"""
> -import os
> =20
>  import bb
> -import subprocess
> +import os
>  import shlex
> +import subprocess
> +import tempfile
> =20
>  class LocalSigner(object):
>      """Class for handling local (on the build host) signing"""
> @@ -73,8 +74,6 @@ class LocalSigner(object):
>              cmd +=3D ['--homedir', self.gpg_path]
>          if armor:
>              cmd +=3D ['--armor']
> -        if output_suffix:
> -            cmd +=3D ['-o', input_file + "." + output_suffix]
>          if use_sha256:
>              cmd +=3D ['--digest-algo', "SHA256"]
> =20
> @@ -83,19 +82,25 @@ class LocalSigner(object):
>          if self.gpg_version > (2,1,):
>              cmd +=3D ['--pinentry-mode', 'loopback']
> =20
> -        cmd +=3D [input_file]
> -
>          try:
>              if passphrase_file:
>                  with open(passphrase_file) as fobj:
>                      passphrase =3D fobj.readline();
> =20
> -            job =3D subprocess.Popen(cmd, stdin=3Dsubprocess.PIPE, stder=
r=3Dsubprocess.PIPE)
> -            (_, stderr) =3D job.communicate(passphrase.encode("utf-8"))
> +            output_file =3D input_file + "." + (output_suffix or 'sig')

This doesn't match the behaviour of output_suffix as used above where
it defaults to None. This forces it to a default of "sig" instead?

If that intentional that should be in the commit message.


> +            with tempfile.TemporaryDirectory(dir=3Dos.path.dirname(outpu=
t_file)) as tmp_dir:
> +                tmp_file =3D os.path.join(tmp_dir, os.path.basename(outp=
ut_file))
> +                cmd +=3D ['-o', tmp_file]
> +
> +                cmd +=3D [input_file]
> +
> +                job =3D subprocess.Popen(cmd, stdin=3Dsubprocess.PIPE, s=
tderr=3Dsubprocess.PIPE)
> +                (_, stderr) =3D job.communicate(passphrase.encode("utf-8=
"))
> =20
> -            if job.returncode:
> -                bb.fatal("GPG exited with code %d: %s" % (job.returncode=
, stderr.decode("utf-8")))
> +                if job.returncode:
> +                    bb.fatal("GPG exited with code %d: %s" % (job.return=
code, stderr.decode("utf-8")))
> =20
> +                os.rename(tmp_file, output_file)
>          except IOError as e:
>              bb.error("IO error (%s): %s" % (e.errno, e.strerror))
>              raise Exception("Failed to sign '%s'" % input_file)

Cheers,

Richard

