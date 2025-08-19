Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73768CA0EED
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 08:53:22 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web10.9104.1755593595338344238
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 01:53:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MYuvIylL;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-70a9282141fso56305736d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 01:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755593594; x=1756198394; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tVOl8qTuhCl8ao8H60pQIgmSmTooLhfe6cJjGQ2MRp8=;
        b=MYuvIylLCWdj2TYf9DAZm81AMmWa0ccFAbm3a5u9mWK8jyBvK3hjs7XYeToL5+csuN
         USzUziccFFzeuFQHmxICqn2xGLxiRByAIHk1ed+8HxICk2aSRKTG3+FpxoHPlHFXJRsT
         9t4xRpPltBUP1u62XwROejAQ26n766vtTFzz/zKRPooEtbFKrhIheCWcXzJ+ytI5wXRH
         l/wTRIB3jhJiOSoiiOWydMmcw7wHvGzNts6znPNaW60Gw5ZLOwOHPNawB4vQ9rMKmwbI
         DRRbga8JBIzGSymDvKilkOdAn1k3upPcqmbWr5BFUv9uMytQLvBgKaOXKUvyHDHVdkoA
         6xvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755593594; x=1756198394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tVOl8qTuhCl8ao8H60pQIgmSmTooLhfe6cJjGQ2MRp8=;
        b=s+ULMO2V0kfz72ApSogahMSCjxiSwQa5/EZfvL6bYaXLpjrKjWaTNbgkdhuc9KT2CX
         TCIR2C6IiLFiraMcNHnXlV4r9kuw1LAhk5OHt71CUfT70ivoz4011WRWZtxj3MoANZJP
         LVL/s+aHzLr5B9sdGBLn2NzQvDMlxvdhLHf8z7c65vrNM3hoH6hREa17+nBSbbZc+V3Z
         OipZ/4U4vvx34xB5OnU6utlJCcroXA0654+tXCZ7KoCOkk1gfsNISYWVXcQasGsgm8D1
         y9+wnpxX13igjj9ptl/wzZOoIx3ubZwIHUI0xq0YWIXsOssufFNr+xq8xVriq17V7hfx
         zWiQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0a2mmTaeuY4eSwxShzy2viJPKZcK91XdMVRwaZUzTNdqD5aIEFxRPruDNrZrOaeYxdnpzPT4reo4Ye3laCwwsuQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzT1T3i9k62xDn5ng9B6Cd8GAxJiWS03PFf+ocaV9LxxqeLnxwP
	VJcLyowKmQMj8NAVA9vzk0aIblYI9Q3YYArsbloA2yVRlTvj8pXqeiOdeR8VqFt7hLHZh+AIX+M
	h/GuQK1bdU+2c8n7B9NMaacfeWpSqw+k=
X-Gm-Gg: ASbGncvtVGmNV3XFk3/2dYt789aBO+72Wx1TMpMbJXrPXa8FPMSn3H534Dx0e5LD/wX
	q/SMGrgIqHH7QulhnXi/GWGRZtjyj75yQ7hIcMFAcv1lLzsA/tntIbH8IHBv076EZb/cXxbjRaz
	So2zsHsXWR0xmgw6l576dtf0OL5IRPmFMffV0ZDlW86VLkvBR5MA3v2mSv3mSjdjwdmXbTHx0dR
	t4d1M9IurHpy7V1RhksnGSDj/s9oEMVtHY7DW71QhbSlqs1YU51
X-Google-Smtp-Source: AGHT+IEuiv6DOCI+OTz3mjVJ5ogpcPHkBi623h0wDgQnOwG6Lm9AOAA5Hp1sHIl4UPYMzY+s06bgP+pO7I1c/WfNMpk=
X-Received: by 2002:ad4:5bca:0:b0:70b:b292:b395 with SMTP id
 6a1803df08f44-70c2b6f4f72mr19307056d6.25.1755593594156; Tue, 19 Aug 2025
 01:53:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250814172348.3882586-1-tony.rex@ericsson.com>
 <DC2W6ED7YCUS.1V4VLCIHMFF17@bootlin.com> <PAXPR07MB8470CECE924BE2127902BAF3E434A@PAXPR07MB8470.eurprd07.prod.outlook.com>
In-Reply-To: <PAXPR07MB8470CECE924BE2127902BAF3E434A@PAXPR07MB8470.eurprd07.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 19 Aug 2025 10:53:02 +0200
X-Gm-Features: Ac12FXy0nSKqUeZ7xANivveD3aMK4FkxyYVIxSo2_1GAhO2uZg3QN9Zv85nehTs
Message-ID: <CANNYZj_DaekmJt8W1g-nc+QsB7TnY-yyWwmGSR_GOYRORLhRCw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/1] base.bbclass: Fix the recipe parsing race issue
To: tony.rex@ericsson.com
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 08:53:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222088

You need to make things a little bit easier for maintainers and try to
save their time.

I would suggest that you provide clear steps to observe the issue.
Attach the recipe file that would demonstrate the issue, and provide
clear steps to trigger it. What is confusing right now is that you say
here's a recipe that builds ok, but then you 'apply the patch' and
then there's some kind of failure. So which patch needs to be applied?

Alex

On Fri, 15 Aug 2025 at 17:29, Tony Rex via lists.openembedded.org
<tony.rex=3Dericsson.com@lists.openembedded.org> wrote:
>
> Hi Mathieu!
>
> I think that this is how it is intended to work, bitbake does not allow f=
loating tag/branch anymore.
> Please correct me if I'm wrong @Richard Purdie (who implemented this for =
security reasons I think.)
>
> The patch that I have makes sure that the parsing and setting of the vari=
ables in the recipe are done before executing the do_fetch command,
> and as a side effect the floating tag/branch protection is working as int=
ended again.
>
> How does the recipe look like?
> devtool add kernel-module-hello-world https://git.yoctoproject.org/git/ke=
rnel-module-hello-world
> The one I get looks like this:
>
> cat build/workspace/recipes/kernel-module-hello-world/kernel-module-hello=
-world_git.bb
> # Recipe created by recipetool
> # This is the basis of a recipe and may need further editing in order to =
be fully functional.
> # (Feel free to remove these comments when editing.)
>
> # WARNING: the following LICENSE and LIC_FILES_CHKSUM values are best gue=
sses - it is
> # your responsibility to verify that the values are complete and correct.
> #
> # The following license files were not able to be identified and are
> # represented as "Unknown" below, you will need to check them yourself:
> #   LICENSE
> LICENSE =3D "Unknown"
> LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7b785be6433a2e4af6a641cc7f0330=
d1"
>
> SRC_URI =3D "git://git.yoctoproject.org/git/kernel-module-hello-world;pro=
tocol=3Dhttps;branch=3Dmaster"
>
> # Modify these as desired
> PV =3D "1.0+git"
> SRCREV =3D "b66f0f2bd559a1df81fc1bda240eba07a2ecdd2b"
>
> S =3D "${WORKDIR}/git"
>
> inherit module
>
> EXTRA_OEMAKE:append:task-install =3D " -C ${STAGING_KERNEL_DIR} M=3D${S}"
> EXTRA_OEMAKE +=3D "KERNEL_DIR=3D${STAGING_KERNEL_DIR}"
>
> And it contains SRCREV =3D "b66f0f2bd559a1df81fc1bda240eba07a2ecdd2b"
>
> Tony
>
> -----Original Message-----
> From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> Sent: Friday, 15 August 2025 11:26
> To: Tony Rex <tony.rex@ericsson.com>; openembedded-core@lists.openembedde=
d.org
> Subject: Re: [OE-core] [PATCH 0/1] base.bbclass: Fix the recipe parsing r=
ace issue
>
> [You don't often get email from mathieu.dubois-briand@bootlin.com. Learn =
why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> On Thu Aug 14, 2025 at 7:23 PM CEST, Tony Rex via lists.openembedded.org =
wrote:
> > It seems that the race condition happens when doing do_fetch on really
> > small repos and it can be difficult to reproduce so below the other
> > case with floating tag/branch that is easier to verify.
> >
> > To verify the floating tag/branch issue have s simple recipe
> > hello_1.0.bb and set the SRC_URI to SRC_URI =3D "git://<repository>;pro=
tocol=3Dhttps;user=3D${USER};branch=3Dmaster;tag=3Dv1.0"
> >
> > run command bitbake hello everything builds.
> >
> > Apply the patch
> >
> > run command bitbake hello
> > ERROR: hello-1.0-r1 do_fetch: Bitbake Fetcher Error:
> > FetchError("Recipe uses a floating tag/branch 'v1.0' for repo
> > '<repository>' without a fixed SRCREV yet doesn't call
> > bb.fetch2.get_srcrev() (use SRCPV in PV for OE).", None)
> > ERROR: Logfile of failure stored in:
> > hello/1.0/temp/log.do_fetch.3289932
> > ERROR: Task (hello/hello_1.0.bb:do_fetch) failed with exit code '1'
> >
> > Tony Rex (1):
> >   base.bbclass: Fix the recipe parsing race issue
> >
> >  meta/classes-global/base.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Hi Tony,
>
> Thanks for your patch.
>
> It looks like this is breaking some builds with the following error:
>
> oeqa.utils.subprocesstweak.OETestCalledProcessError: Command '. /srv/poky=
build/yocto-worker/qemux86-64/build/build/tmp/work/qemux86_64-poky-linux/co=
re-image-sato/1.0/testsdkext/environment-setup-core2-64-poky-linux > /dev/n=
ull; devtool add kernel-module-hello-world https://git.yoctoproject.org/git=
/kernel-module-hello-world;' returned non-zero exit status 1.
> ...
> ERROR: Bitbake Fetcher Error: FetchError("Recipe uses a floating tag/bran=
ch 'master' for repo 'git.yoctoproject.org/git/kernel-module-hello-world' w=
ithout a fixed SRCREV yet doesn't call bb.fetch2.get_srcrev() (use SRCPV in=
 PV for OE).", None)
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/68/builds/2284
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/30/builds/2199
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/16/builds/2247
>
> Can you have a look at this error please?
>
> Best regards,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com/
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#221976): https://lists.openembedded.org/g/openembedde=
d-core/message/221976
> Mute This Topic: https://lists.openembedded.org/mt/114706197/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

