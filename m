Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF4CBC761A6
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 09:10:30 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.20691.1680167424141075987
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 02:10:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RHFw+LVb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id u11-20020a05600c19cb00b003edcc414997so11283206wmq.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 02:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680167422;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=24ZVbMKXETy3lNfNL7OeO4MIYanUz1xNoSM1uzqk1dc=;
        b=RHFw+LVbVcs+jCt0a7SGtA+lXjk0FvzOaOylqa3YDu1a3lF51RbnNRMj9+vl6XdymK
         QGGNtb1NCc9WLtZCeOmJXmBxtdBJRddjIDHLpBDxAgWXaJOaA93p8dYvsLzCnuYzbOjj
         LmGXxeJK9Av3pF3aw8sut58rTpHcrvcIfab0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680167422;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=24ZVbMKXETy3lNfNL7OeO4MIYanUz1xNoSM1uzqk1dc=;
        b=UnGLw+nSmurK9W/uDpRJoAwNob6aCC74ht/EMMGljlrBoyAuhZifeJLzdoGofAHMUu
         m9+Ty1UdIzy5CneLnWNSeN+fsdGiZ4US0hyeWyCWZkpsBlT8ciCXObrcgN8SW+g/y0Dx
         ZvnjXrVmA0PN+FjAkzA3KOKPReI5ngPsnhOwUD0BQEBfClTGXyyJSXCBYUEbAj876TV2
         IlG20gWsxkTUSHkuGGmXEgfnSTlJN2PqwEBzXRPbS+KI0XkbUmkEJdNY59XfqvunrvDM
         WAUYL0ktVBmmy5zTmOcX5Z738O+amaE22MrCgppd8pz5DmB3RtogEYC+QxAq3Yr+Ao4O
         oCjg==
X-Gm-Message-State: AO0yUKUeQPJCOeQ3bjIAJOsCU4zyqEAtFBrCXFaUTvYiYxM5ZyhMeKFx
	94HLEsZnIPMczO4eZjX650QqgA==
X-Google-Smtp-Source: AK7set8ap3saAvZYWt3uclIufVjAS5AIAOrB8AQmR4MwRKHrvR2ZIf63x7KsRkhKAoCxCnieVMBY1Q==
X-Received: by 2002:a1c:7c17:0:b0:3ed:2ae9:6c75 with SMTP id x23-20020a1c7c17000000b003ed2ae96c75mr16960488wmc.37.1680167422426;
        Thu, 30 Mar 2023 02:10:22 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:77e0:6cb9:7d92:358e? ([2001:8b0:aba:5f3c:77e0:6cb9:7d92:358e])
        by smtp.gmail.com with ESMTPSA id y5-20020a05600c364500b003eb5ce1b734sm5197011wmq.7.2023.03.30.02.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 02:10:22 -0700 (PDT)
Message-ID: <208af449dd70c4d88af9e9259413c823d83e0302.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] lib/oe/gpg_sign.py: Avoid race when creating
 .sig files in detach_sign
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tobias Hagelborn <tobias.hagelborn@axis.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 30 Mar 2023 10:10:21 +0100
In-Reply-To: <1751049D3A378E36.12651@lists.openembedded.org>
References: <20230323100847.3740485-1-tobiasha@axis.com>
	 <1751049D3A378E36.12651@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 09:10:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179308

On Wed, 2023-03-29 at 23:33 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Thu, 2023-03-23 at 11:08 +0100, Tobias Hagelborn wrote:
> > Move the signature file into place only after it is successfully signed=
.
> > This to avoid race and corrupted .sig files in cases multiple onging
> > builds write to a shared sstate-cache dir.
> >=20
> > Signed-off-by: Tobias Hagelborn <tobiasha@axis.com>
> > ---
> >  meta/lib/oe/gpg_sign.py | 25 +++++++++++++++----------
> >  1 file changed, 15 insertions(+), 10 deletions(-)
> >=20
> > diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
> > index 613dab8561..868846cdc5 100644
> > --- a/meta/lib/oe/gpg_sign.py
> > +++ b/meta/lib/oe/gpg_sign.py
> > @@ -5,11 +5,12 @@
> >  #
> > =20
> >  """Helper module for GPG signing"""
> > -import os
> > =20
> >  import bb
> > -import subprocess
> > +import os
> >  import shlex
> > +import subprocess
> > +import tempfile
> > =20
> >  class LocalSigner(object):
> >      """Class for handling local (on the build host) signing"""
> > @@ -73,8 +74,6 @@ class LocalSigner(object):
> >              cmd +=3D ['--homedir', self.gpg_path]
> >          if armor:
> >              cmd +=3D ['--armor']
> > -        if output_suffix:
> > -            cmd +=3D ['-o', input_file + "." + output_suffix]
> >          if use_sha256:
> >              cmd +=3D ['--digest-algo', "SHA256"]
> > =20
> > @@ -83,19 +82,25 @@ class LocalSigner(object):
> >          if self.gpg_version > (2,1,):
> >              cmd +=3D ['--pinentry-mode', 'loopback']
> > =20
> > -        cmd +=3D [input_file]
> > -
> >          try:
> >              if passphrase_file:
> >                  with open(passphrase_file) as fobj:
> >                      passphrase =3D fobj.readline();
> > =20
> > -            job =3D subprocess.Popen(cmd, stdin=3Dsubprocess.PIPE, std=
err=3Dsubprocess.PIPE)
> > -            (_, stderr) =3D job.communicate(passphrase.encode("utf-8")=
)
> > +            output_file =3D input_file + "." + (output_suffix or 'sig'=
)
>=20
> This doesn't match the behaviour of output_suffix as used above where
> it defaults to None. This forces it to a default of "sig" instead?
>=20
> If that intentional that should be in the commit message.
>=20
>=20
> > +            with tempfile.TemporaryDirectory(dir=3Dos.path.dirname(out=
put_file)) as tmp_dir:
> > +                tmp_file =3D os.path.join(tmp_dir, os.path.basename(ou=
tput_file))
> > +                cmd +=3D ['-o', tmp_file]
> > +
> > +                cmd +=3D [input_file]
> > +
> > +                job =3D subprocess.Popen(cmd, stdin=3Dsubprocess.PIPE,=
 stderr=3Dsubprocess.PIPE)
> > +                (_, stderr) =3D job.communicate(passphrase.encode("utf=
-8"))
> > =20
> > -            if job.returncode:
> > -                bb.fatal("GPG exited with code %d: %s" % (job.returnco=
de, stderr.decode("utf-8")))
> > +                if job.returncode:
> > +                    bb.fatal("GPG exited with code %d: %s" % (job.retu=
rncode, stderr.decode("utf-8")))
> > =20
> > +                os.rename(tmp_file, output_file)
> >          except IOError as e:
> >              bb.error("IO error (%s): %s" % (e.errno, e.strerror))
> >              raise Exception("Failed to sign '%s'" % input_file)

I've been struggling to confirm it but have now done so. This does
cause an oe-selftest failure as here:

https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/4950/step=
s/14/logs/stdio


i.e. from

oe-selftest -r runtime_test.TestImage.test_testimage_dnf

Cheers,

Richard



