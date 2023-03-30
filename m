Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6C71C761A6
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 09:14:10 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.20730.1680167644679619284
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 02:14:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Dq2PMc5K;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id j18-20020a05600c1c1200b003ee5157346cso13010643wms.1
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 02:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680167643;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bVPHLegUmtYuBjQHUz1E9RgbUEB0FVCssbk7UVgnthU=;
        b=Dq2PMc5Ki4NQfoibF3wj8rhTUWQLkpDUGydwvhRLK/FRtMMNdH0zMq4XC0GVwQGoox
         YOhzxtlz7/ib9pzMHC15eawTlKvvyE7NPVSc9tjQBhA/+RfT832JlpbJZZXv6A5wwvS1
         Mt1CMCZ/jQA6UBHbdcI3whGrKFfC8UttJqU3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680167643;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bVPHLegUmtYuBjQHUz1E9RgbUEB0FVCssbk7UVgnthU=;
        b=h72lXx2cmVodbfsaothHO0oWzWe0NcjZyku42ZPlLdU2kBAPMK3/rt5K+6wKKNCfgq
         kTu2Tz5yLjLEdF2Vjc229v4rMatEigxx4t8PzRWWMZ8iRET2S52qkB2Gd2988eRpwqZt
         PpUUNLOCOPiHWCBrBO7fg79r4pZUEj+tmRwRDtO+MKEEwZ3TR7rjMefGHcKuLDchn95O
         8SjsSVLZC9lZ4HLTH3rvMI3TJa1jHZBljrWviv5QRZFMrwld4ON46PL9UaUUc73KSeu0
         Cr4DxjYMvfscNJGWSCIor5y3oOzoxAhSmJEivc3VVsJVz2qgq3xdp1+AFVYpvs4+RQnj
         qQUA==
X-Gm-Message-State: AAQBX9dNzswynJL8G6xpP9joRQ14L28rS2G3nU1pXix0Ov2mA3Wmnf5A
	pV1TsEuKLgQ5ur8NStzYad0Gpw==
X-Google-Smtp-Source: AKy350Z/YRrsdv/s0MDTbdRDp6BtNfHpqHnuH59FeyZspkiC6uBADxUpWBUHubUOPF17p78io2v37w==
X-Received: by 2002:a1c:7918:0:b0:3ef:67fc:ff02 with SMTP id l24-20020a1c7918000000b003ef67fcff02mr13058638wme.7.1680167642766;
        Thu, 30 Mar 2023 02:14:02 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:77e0:6cb9:7d92:358e? ([2001:8b0:aba:5f3c:77e0:6cb9:7d92:358e])
        by smtp.gmail.com with ESMTPSA id m21-20020a05600c161500b003ef4cd057f5sm5017098wmn.4.2023.03.30.02.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 02:14:02 -0700 (PDT)
Message-ID: <a6be40ba69460437318ff03da03fa2ef1ce1c2b1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] lib/oe/gpg_sign.py: Avoid race when creating
 .sig files in detach_sign
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tobias Hagelborn <tobias.hagelborn@axis.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 30 Mar 2023 10:14:01 +0100
In-Reply-To: <1751275EEB419793.12651@lists.openembedded.org>
References: <20230323100847.3740485-1-tobiasha@axis.com>
	 <1751049D3A378E36.12651@lists.openembedded.org>
	 <1751275EEB419793.12651@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 09:14:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179309

On Thu, 2023-03-30 at 10:10 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Wed, 2023-03-29 at 23:33 +0100, Richard Purdie via
> lists.openembedded.org wrote:
> > On Thu, 2023-03-23 at 11:08 +0100, Tobias Hagelborn wrote:
> > > Move the signature file into place only after it is successfully sign=
ed.
> > > This to avoid race and corrupted .sig files in cases multiple onging
> > > builds write to a shared sstate-cache dir.
> > >=20
> > > Signed-off-by: Tobias Hagelborn <tobiasha@axis.com>
> > > ---
> > >  meta/lib/oe/gpg_sign.py | 25 +++++++++++++++----------
> > >  1 file changed, 15 insertions(+), 10 deletions(-)
> > >=20
> > > diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
> > > index 613dab8561..868846cdc5 100644
> > > --- a/meta/lib/oe/gpg_sign.py
> > > +++ b/meta/lib/oe/gpg_sign.py
> > > @@ -5,11 +5,12 @@
> > >  #
> > > =20
> > >  """Helper module for GPG signing"""
> > > -import os
> > > =20
> > >  import bb
> > > -import subprocess
> > > +import os
> > >  import shlex
> > > +import subprocess
> > > +import tempfile
> > > =20
> > >  class LocalSigner(object):
> > >      """Class for handling local (on the build host) signing"""
> > > @@ -73,8 +74,6 @@ class LocalSigner(object):
> > >              cmd +=3D ['--homedir', self.gpg_path]
> > >          if armor:
> > >              cmd +=3D ['--armor']
> > > -        if output_suffix:
> > > -            cmd +=3D ['-o', input_file + "." + output_suffix]
> > >          if use_sha256:
> > >              cmd +=3D ['--digest-algo', "SHA256"]
> > > =20
> > > @@ -83,19 +82,25 @@ class LocalSigner(object):
> > >          if self.gpg_version > (2,1,):
> > >              cmd +=3D ['--pinentry-mode', 'loopback']
> > > =20
> > > -        cmd +=3D [input_file]
> > > -
> > >          try:
> > >              if passphrase_file:
> > >                  with open(passphrase_file) as fobj:
> > >                      passphrase =3D fobj.readline();
> > > =20
> > > -            job =3D subprocess.Popen(cmd, stdin=3Dsubprocess.PIPE, s=
tderr=3Dsubprocess.PIPE)
> > > -            (_, stderr) =3D job.communicate(passphrase.encode("utf-8=
"))
> > > +            output_file =3D input_file + "." + (output_suffix or 'si=
g')
> >=20
> > This doesn't match the behaviour of output_suffix as used above where
> > it defaults to None. This forces it to a default of "sig" instead?
> >=20
> > If that intentional that should be in the commit message.
> >=20
> >=20
> > > +            with tempfile.TemporaryDirectory(dir=3Dos.path.dirname(o=
utput_file)) as tmp_dir:
> > > +                tmp_file =3D os.path.join(tmp_dir, os.path.basename(=
output_file))
> > > +                cmd +=3D ['-o', tmp_file]
> > > +
> > > +                cmd +=3D [input_file]
> > > +
> > > +                job =3D subprocess.Popen(cmd, stdin=3Dsubprocess.PIP=
E, stderr=3Dsubprocess.PIPE)
> > > +                (_, stderr) =3D job.communicate(passphrase.encode("u=
tf-8"))
> > > =20
> > > -            if job.returncode:
> > > -                bb.fatal("GPG exited with code %d: %s" % (job.return=
code, stderr.decode("utf-8")))
> > > +                if job.returncode:
> > > +                    bb.fatal("GPG exited with code %d: %s" % (job.re=
turncode, stderr.decode("utf-8")))
> > > =20
> > > +                os.rename(tmp_file, output_file)
> > >          except IOError as e:
> > >              bb.error("IO error (%s): %s" % (e.errno, e.strerror))
> > >              raise Exception("Failed to sign '%s'" % input_file)
>=20
> I've been struggling to confirm it but have now done so. This does
> cause an oe-selftest failure as here:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/4950/st=
eps/14/logs/stdio
>=20
>=20
> i.e. from
>=20
> oe-selftest -r runtime_test.TestImage.test_testimage_dnf

I should also mention, this test fails with oe-core's nodistro for
other reasons but does work ok with poky. I filed a bug for that:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15086

since it was confusing my debugging! You'd therefore need to use poky
for testing your change until we fix that.

Cheers,

Richard


