Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web10.29898.1598563913416375906
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2020 14:31:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NxuyZ5Ry;
 spf=pass (domain: gmail.com, ip: 209.85.219.68, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f68.google.com with SMTP id x6so3417513qvr.8
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2020 14:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i5gX3psr5mBCCP3Ek8qjDM5VfvLz1Jfe9Tw1YQ7RW7o=;
        b=NxuyZ5Ry83xqeUXNK+xeMkHRy/b7Dj2EwSZ7nBQeQdl46KEKH3hQ1zREg4HnEGYBkq
         Fuij6zyNRujogWeBwN6u2HTWyIRmjHCN1AJEw30D3bEdRdFme5ufM4IlUjueBinAoPqT
         7Dkaw7g97D4xul7gMakazK165SD6NAXFx8Lx4t8BHYG/2lPeTp87ankDB22nPt8HY4X/
         KbNM4H5593pgHqbNKxiOyAj01xJWoI5kdjPM31z/PTyaLyOADfWoL+2MOpH2wh3QaTfQ
         7o3nG3his5mdH+y3SwIFSNZ1Akm2gSS8aZHOf0toSXUjYhTy25CC5CUGNyEBDRjnx1lf
         hmKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i5gX3psr5mBCCP3Ek8qjDM5VfvLz1Jfe9Tw1YQ7RW7o=;
        b=MO/egw2pKsXccTf2IFWblOcfDSZuM2Q9WighBNfdR1QtpYT0Mn6R1YW3edeJTdq34/
         N8sJ307uoYeGvIR9irlsVDUMpemwybInCl6/bEMB7dKfa0Kn0L+SnJ5fjr7M6kwJ1jno
         A4v5sm2VOTVi0dUPT5ua52kgoAmS0dHajCb/UDDOH7uEP/6GerNW3nrUmFGCHJJn1uR8
         oqvMZhVCawJW9Cmm0961gxWedKiDTiuGCTBzPfOPUEjPZpCpDw6NzhTqQEmscyVz38fr
         JeW5dHBs3pE0rmamvXC3hIdPXbQQqy07dHIK8qT6ca8jpk0uHJSILjv+gpr5ukjDE6oi
         ydgQ==
X-Gm-Message-State: AOAM533/vpniNfBZoKGnNmTR5uswuKm4LLTz/MD+kuu4ti4eus6Zsl7X
	Q6qmjDjeY6gYxzkaarwr8Alkdyh6LF+5Dc433RM=
X-Google-Smtp-Source: ABdhPJxnmctaXnCDtduHDWsetPs8ZIUbvQoCWrYEYJ1FcS/2cPc7ablNq8xnL2uhQffcNVCuxHOddoJUA7phkQ4Ys7A=
X-Received: by 2002:ad4:51d1:: with SMTP id p17mr20712097qvq.14.1598563912493;
 Thu, 27 Aug 2020 14:31:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200827105933.3575-1-alex.kanavin@gmail.com> <20200827105933.3575-4-alex.kanavin@gmail.com>
In-Reply-To: <20200827105933.3575-4-alex.kanavin@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 27 Aug 2020 14:31:26 -0700
Message-ID: <CAMKF1sp8-t1KascRyh9KF3zYM5-3BDWcPHB-hQJ5bVZDCyaBuw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/6] oeqa/x32lib: rework to use readelf from the host
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 27, 2020 at 4:00 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> It is difficult and error-prone to ensure binutils gets
> installed into target images where this test may run;
> on the other hand readelf is always present on the
> host, as it is a part of HOSTTOOLS.
>

this would mean that we are relying on build host provided binutils to
be compiled with all bfd support
since now we also have aarch64 build hosts it spreads he risk a bit
more. maybe we can
ignore this test if target does not have binutils installed or depend
on binutils-native for providing readelf


> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/lib/oeqa/runtime/cases/x32lib.py | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
>
> diff --git a/meta/lib/oeqa/runtime/cases/x32lib.py b/meta/lib/oeqa/runtime/cases/x32lib.py
> index ddf220140e..f419c8f181 100644
> --- a/meta/lib/oeqa/runtime/cases/x32lib.py
> +++ b/meta/lib/oeqa/runtime/cases/x32lib.py
> @@ -6,16 +6,21 @@ from oeqa.runtime.case import OERuntimeTestCase
>  from oeqa.core.decorator.depends import OETestDepends
>  from oeqa.core.decorator.data import skipIfNotInDataVar
>
> +import subprocess
> +
>  class X32libTest(OERuntimeTestCase):
>
>      @skipIfNotInDataVar('DEFAULTTUNE', 'x86-64-x32',
>                          'DEFAULTTUNE is not set to x86-64-x32')
>      @OETestDepends(['ssh.SSHTest.test_ssh'])
>      def test_x32_file(self):
> -        cmd = 'readelf -h /bin/ls | grep Class | grep ELF32'
> -        status1 = self.target.run(cmd)[0]
> -        cmd = 'readelf -h /bin/ls | grep Machine | grep X86-64'
> -        status2 = self.target.run(cmd)[0]
> -        msg = ("/bin/ls isn't an X86-64 ELF32 binary. readelf says: %s" %
> -                self.target.run("readelf -h /bin/ls")[1])
> +        dest = self.td.get('T', '') + "/ls.x32test"
> +        self.target.copyFrom("/bin/ls", dest)
> +        cmd = 'readelf -h {} | grep Class | grep ELF32'.format(dest)
> +        status1 = subprocess.call(cmd, shell=True)
> +        cmd = 'readelf -h {} | grep Machine | grep X86-64'.format(dest)
> +        status2 = subprocess.call(cmd, shell=True)
> +        msg = ("/bin/ls isn't an X86-64 ELF32 binary. readelf says:\n{}".format(
> +                subprocess.check_output("readelf -h {}".format(dest), shell=True).decode()))
> +        os.remove(dest)
>          self.assertTrue(status1 == 0 and status2 == 0, msg=msg)
> --
> 2.28.0
>
> 
