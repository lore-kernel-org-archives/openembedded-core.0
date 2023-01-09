Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B74D0C54EBD
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 10:29:47 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.68449.1673260181157198579
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jan 2023 02:29:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kouWZu8y;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id g13so12232252lfv.7
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 02:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vhpu7cXo7UEw8MSvTcO38NnZQKXcI+JaF0Nt1g4zqtg=;
        b=kouWZu8y0AhKhsbyHJ1w0wmiD+dhHQ+H80WDQXc7/rJzHRvAVRLhUBqtLkZ0//0stl
         nkN0KEPml6kCYNcsW1k7m5DZckXfT19nAqLnBvFCqsn/PbRiBnJfFtuzZ/yTIh4bXyV4
         P0Ex5WXV67vBmzm7PTeNhCyxMbx1icBC9/yyftHb4R3jOmxAcwTAi0YeCIGueCPukQNm
         9LxltBEoRv6+LZGYjZPQ26j+BHP3Z/JRc/zywQly2iq2vMJ0rmUa1Ch/GRve8+8W+xKk
         szkucMeZ39SYEXphVxALGxWQ6jjtaH6U0OMAUaoL1M7LnFOoTSd+lMlpK+fQVG31LEdu
         GAZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vhpu7cXo7UEw8MSvTcO38NnZQKXcI+JaF0Nt1g4zqtg=;
        b=n+SAzp8sUauZW044TryrkqwdVEAGZb+bcyHjt9rjrMPCatjERPvJX0WHSoY+RpKUkt
         1Q43kFkU+Tt5fShsQfqbdSULUAcwsz6IJFmkZSFd7mhGqfPFbJCNI/91RU893VgyWWfS
         YGseVdKLyw6mnwbnEgBEqs0XECpVWDqphiPg3tu15uts6jyv6oInSDo6SbtJEu4qCPna
         jzaiYU5BsNyJYEGDJK3AKu2Q4Al4HmzthV+t+4p1jehVuHTEU1V3nC1uZSLjxuAeyMQB
         kmDEbf7ApEAbW9XMBwJmloD/Gco3wrew0wnkpvCKchHTnreZ2b3e8ACgl/qFUpjke7j1
         MRRQ==
X-Gm-Message-State: AFqh2kohkjLXKwxH/VkC1KOdYp4Z3hAu9rhFO6TUYK945iHSkc8oWcDX
	ccyfU1IHAEfuupqUQw/LQZC8OIaEC4eMvUolpuo=
X-Google-Smtp-Source: AMrXdXs5IhrfyihSe5kLOdRa9Obb6VQalv7cQF02esTp0zKyjprySbXHjF+8fAyp54QPur3renMj7CUL2MJPCD/if5Y=
X-Received: by 2002:a05:6512:261f:b0:4ca:fd2a:d984 with SMTP id
 bt31-20020a056512261f00b004cafd2ad984mr2418670lfb.445.1673260179177; Mon, 09
 Jan 2023 02:29:39 -0800 (PST)
MIME-Version: 1.0
References: <20230109013924.22185-1-karn.jye.lau@intel.com>
 <CANNYZj9faTYL2btddhF0A-WFHJAwKu0nqf07GJcGL+bXdsftUA@mail.gmail.com> <DM6PR11MB2649115E6777A625893C00F5D7FE9@DM6PR11MB2649.namprd11.prod.outlook.com>
In-Reply-To: <DM6PR11MB2649115E6777A625893C00F5D7FE9@DM6PR11MB2649.namprd11.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 9 Jan 2023 11:29:27 +0100
Message-ID: <CANNYZj-8ugvQ92YEwxi=z9SCnLAM=eHVFSTc45Aad=HX3rd5QQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] freetype:update mirror site for package download.
To: "Lau, Karn Jye" <karn.jye.lau@intel.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 10:29:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175680

It seems that you have a corrupted file somewhere. In my setup, the
sha256sum matches what is in the recipe:

alex@Zen2:/srv/work/alex/poky/meta$ wget
https://download.savannah.nongnu.org/releases/freetype/freetype-2.12.1.tar.=
xz
--2023-01-09 11:28:30--
https://download.savannah.nongnu.org/releases/freetype/freetype-2.12.1.tar.=
xz
Resolving download.savannah.nongnu.org
(download.savannah.nongnu.org)... 209.51.188.200, 2001:470:142:5::200
Connecting to download.savannah.nongnu.org
(download.savannah.nongnu.org)|209.51.188.200|:443... connected.
HTTP request sent, awaiting response... 302 Moved Temporarily
Location: https://de.freedif.org/savannah/freetype/freetype-2.12.1.tar.xz
[following]
--2023-01-09 11:28:31--
https://de.freedif.org/savannah/freetype/freetype-2.12.1.tar.xz
Resolving de.freedif.org (de.freedif.org)... 116.202.241.226
Connecting to de.freedif.org (de.freedif.org)|116.202.241.226|:443... conne=
cted.
HTTP request sent, awaiting response... 200 OK
Length: 2471916 (2.4M) [application/x-xz]
Saving to: =E2=80=98freetype-2.12.1.tar.xz=E2=80=99

freetype-2.12.1.tar.xz
100%[=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>]
  2.36M  10.0MB/s    in 0.2s

2023-01-09 11:28:31 (10.0 MB/s) - =E2=80=98freetype-2.12.1.tar.xz=E2=80=99 =
saved
[2471916/2471916]

alex@Zen2:/srv/work/alex/poky/meta$ sha256sum freetype-2.12.1.tar.xz
4766f20157cc4cf0cd292f80bf917f92d1c439b243ac3018debf6b9140c41a7f
freetype-2.12.1.tar.xz


Can you try these commands and see what happens?

Alex


On Mon, 9 Jan 2023 at 10:43, Lau, Karn Jye <karn.jye.lau@intel.com> wrote:
>
> Hi Alex,pls have a glance on the log
>
> ilabuser@kjlau-iLBPG12:~/oe_core_yocto_build/build2/tmp-glibc/log/cooker/=
qemux86-64$ cat 20230109011215.log | grep freetype
> NOTE: Running task 255 of 669 (/home/ilabuser/oe_core_yocto_build/openemb=
edded-core/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_fetch)
> NOTE: recipe freetype-2.12.1-r0: task do_fetch: Started
> WARNING: freetype-2.12.1-r0 do_fetch: Failed to fetch URL https://downloa=
d.savannah.nongnu.org/releases/freetype/freetype-2.12.1.tar.xz, attempting =
MIRRORS if available
> WARNING: freetype-2.12.1-r0 do_fetch: Checksum mismatch for local file /h=
ome/ilabuser/oe_core_yocto_build/build2/downloads/freetype-2.12.1.tar.xz
> WARNING: freetype-2.12.1-r0 do_fetch: Renaming /home/ilabuser/oe_core_yoc=
to_build/build2/downloads/freetype-2.12.1.tar.xz to /home/ilabuser/oe_core_=
yocto_build/build2/downloads/freetype-2.12.1.tar.xz_bad-checksum_ed2530cbbc=
c700eca1d7e4b0d0a1fce6816205c70f587c8a12837a1f4e74104a
> ERROR: freetype-2.12.1-r0 do_fetch: Checksum failure fetching https://dow=
nload.savannah.nongnu.org/releases/freetype/freetype-2.12.1.tar.xz
> ERROR: freetype-2.12.1-r0 do_fetch: Bitbake Fetcher Error: ChecksumError(=
'Checksum mismatch!\nFile: \'/home/ilabuser/oe_core_yocto_build/build2/down=
loads/freetype-2.12.1.tar.xz\' has sha256 checksum \'ed2530cbbcc700eca1d7e4=
b0d0a1fce6816205c70f587c8a12837a1f4e74104a\' when \'4766f20157cc4cf0cd292f8=
0bf917f92d1c439b243ac3018debf6b9140c41a7f\' was expected\nIf this change is=
 expected (e.g. you have upgraded to a new version without updating the che=
cksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum]=
 =3D "ed2530cbbcc700eca1d7e4b0d0a1fce6816205c70f587c8a12837a1f4e74104a"\nOt=
herwise you should retry the download and/or check with upstream to determi=
ne if the file has become corrupted or otherwise unexpectedly modified.', '=
https://download.savannah.nongnu.org/releases/freetype/freetype-2.12.1.tar.=
xz')
> ERROR: Logfile of failure stored in: /home/ilabuser/oe_core_yocto_build/b=
uild2/tmp-glibc/work/x86-64-v3-oe-linux/freetype/2.12.1-r0/temp/log.do_fetc=
h.2933
> NOTE: recipe freetype-2.12.1-r0: task do_fetch: Failed
> ERROR: Task (/home/ilabuser/oe_core_yocto_build/openembedded-core/meta/re=
cipes-graphics/freetype/freetype_2.12.1.bb:do_fetch) failed with exit code =
'1'
>
> KJ
>
> -----Original Message-----
> From: Alexander Kanavin <alex.kanavin@gmail.com>
> Sent: Monday, 9 January, 2023 5:39 PM
> To: Lau, Karn Jye <karn.jye.lau@intel.com>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core][PATCH] freetype:update mirror site for package dow=
nload.
>
> Can you show the package fetching issues you are having please?
> Freetype is still where it was, as far as I see:
>
> https://download.savannah.nongnu.org/releases/freetype/
>
> Alex
>
> On Mon, 9 Jan 2023 at 02:40, <karn.jye.lau@intel.com> wrote:
> >
> > From: KARN JYE LAU <karn.jye.lau@intel.com>
> >
> > update SAVANNAH_NONGNU_MIRROR to SAVANNAH_GNU_MIRROR to resolve
> > package fetching issues.
> >
> > Signed-off-by: KARN JYE LAU <karn.jye.lau@intel.com>
> > ---
> >  meta/recipes-graphics/freetype/freetype_2.12.1.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-graphics/freetype/freetype_2.12.1.bb
> > b/meta/recipes-graphics/freetype/freetype_2.12.1.bb
> > index 46c6182630..5e7f916e21 100644
> > --- a/meta/recipes-graphics/freetype/freetype_2.12.1.bb
> > +++ b/meta/recipes-graphics/freetype/freetype_2.12.1.bb
> > @@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.TXT;md5=3Da59277=
84d823d443c6cae55701d01553 \
> >                      file://docs/FTL.TXT;md5=3D9f37b4e6afa3fef9dba8932b=
16bd3f97 \
> >                      file://docs/GPLv2.TXT;md5=3D8ef380476f642c20ebf40f=
ecb0add2ec"
> >
> > -SRC_URI =3D "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BP}.tar.xz"
> > +SRC_URI =3D "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.xz"
> >  SRC_URI[sha256sum] =3D "4766f20157cc4cf0cd292f80bf917f92d1c439b243ac30=
18debf6b9140c41a7f"
> >
> >  UPSTREAM_CHECK_REGEX =3D "freetype-(?P<pver>\d+(\.\d+)+)"
> > --
> > 2.17.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#175657):
> > https://lists.openembedded.org/g/openembedded-core/message/175657
> > Mute This Topic: https://lists.openembedded.org/mt/96144063/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
> > [alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

