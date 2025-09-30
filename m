Return-Path: <william@wkennington.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91A97CAC5B8
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 07:50:08 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.19859.1759218605372759656
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Sep 2025 00:50:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@wkennington-com.20230601.gappssmtp.com header.s=20230601 header.b=w4f6Ck4/;
 spf=none, err=permanent DNS error (domain: wkennington.com, ip: 209.85.210.173, mailfrom: william@wkennington.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7811fa91774so3124898b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Sep 2025 00:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20230601.gappssmtp.com; s=20230601; t=1759218605; x=1759823405; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WpdjENoWcDAr8UnxICBDkLoJMPmydAd1X7STAXRDymo=;
        b=w4f6Ck4/6HGjOfufyfetkitPnpzAT8a/IzTaeyCKhexUVEZMRvfgK3W0q00aP7aaDx
         6DgC1lMjGh+/NA3ygbmytInNVglqst4eDVl/OOzfI1pNZ/O621NWxFPnvT3QdPE85iZp
         xQeB5BDekuzPReLSl9V7ivlfCTQVPnfcwbt4/3V05OalHTS/nfqpI+gdq0lbOqqjI1Dv
         WfbHToc+D6lRsd4DX0Kq+tpach7oWpxinOlTcNVZgLtyoSgrjQAqZIXRM/HsXXUAolp3
         cxkdgPueFC/4qkYyRkDo1uMQdzqIevpx0bYEl5JYD/f6JdV2QBq8ZJs0k23OIvoTJTXj
         ZfLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759218605; x=1759823405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WpdjENoWcDAr8UnxICBDkLoJMPmydAd1X7STAXRDymo=;
        b=LLRxxDVYyhaDqPf2coK0ZEPXcFfNQA/q8a/bBHfOMtxtYabJhL8QI2Qn7tWHDH2UoQ
         4jorE3NGTgStvPZ+ZtzCDvs/EcEhPDo+gMW+vhIeAj+rYaTwwy6UinbtCwqK9xL3jpv3
         UfSPgn0PatZo0zZTBDwU8+XkDcQL3z8Z8xQKvaaxwP3eTZVPY7Wwk6lbhQn01yQkbPFf
         W2PgYaV+Zmwqidyzn8IakfspytR2mYuyUJbjicE7J56Si5CTDJn0XbGmkBa3afSIBbhO
         WzAAEB9JdGBuKnJO0cjXxA651VlrcMC8gBD6nbBICymI/y8oIW+mkSJ+AYzpwv4Gbu+L
         dDSg==
X-Gm-Message-State: AOJu0Yz4QxMVIwxF0hpAjCdGk67OVVcqCFztOLfQyfyvxPUd6OXkhckB
	X1Q1OJ5c8r/4/TXyNVU43sCOAzTLrHgoS9fboLpT4X4ZnTYm9WaF4ySrpOvFXJNw8SngONVH5+F
	A3t6V5oazFgp9IvWKb2FFYYwu/zdzqn5/MYd8Alsi6tgcus03fjGNb2o5sQ==
X-Gm-Gg: ASbGnctGzAuDmCVE2kR+naUxYItkdmpfQY/XaDsblKuJ/KnIg2D+0/PJDhKujU4+ksW
	2SR0+JP54OxiQ1X7FL0TX8rQewCaAfUIBF2PCK+OpIx9ex990jRfxKMunode5kfICL8v5FB1tKb
	2042v1XIUG+ERdPtNb14k6TcqZist/QPUAi/JqtDu8XLGwDjgSiQ66oE/fzrvdnTkm4cEN4j7pE
	TX51vGb7K1uP5LGpfN3kUDd9P1tZUHVYKysVrrcQmFoZ1Bq7K4Kb7ig5paSeqv1mg==
X-Google-Smtp-Source: AGHT+IHu+9YoAtOfSRtuzrpaF7LGmwmQT5fAH7Si6P4JvDmwMnUD6cRBSYyzDcdWuGRVrPDVutQRRMZVUw5cVthZsJM=
X-Received: by 2002:a05:6a20:3d1f:b0:2e3:a914:aab7 with SMTP id
 adf61e73a8af0-2e7d21db77amr22215811637.47.1759218604647; Tue, 30 Sep 2025
 00:50:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAD_4BXiwzc0VBdNjptP3N2Hj2=czhEEbLw4GOphNNnwnj9uTPQ@mail.gmail.com>
 <CAMKF1soVEKaJcH=J99=eUKor+1gzE3RAB0cHaTnET68f4DnAeQ@mail.gmail.com>
 <CAD_4BXiRTKx5HPNqmroz1fO3T8ggmQUVXa+=HJT=saLtg5PJzw@mail.gmail.com> <CAMKF1sqwuC=AGzEa7W+EtfZM4fKvdXv-BP7YYhvhX5RD68owJw@mail.gmail.com>
In-Reply-To: <CAMKF1sqwuC=AGzEa7W+EtfZM4fKvdXv-BP7YYhvhX5RD68owJw@mail.gmail.com>
From: William Kennington <william@wkennington.com>
Date: Tue, 30 Sep 2025 00:49:53 -0700
X-Gm-Features: AS18NWDNY82ufmIfesJRTGF3gEBg7KJ1dEzW48SZaDicjevj_16Mn9LLfeK3GwI
Message-ID: <CAD_4BXi_7XRk9KGvwvfoea6_uZQ2bgtpqqP51ht1JU4nC6D1-Q@mail.gmail.com>
Subject: Re: [OE-core] Distro wide LTO broken?
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Sep 2025 07:50:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224176

On Mon, Sep 29, 2025 at 7:58=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> On Mon, Sep 29, 2025 at 5:19=E2=80=AFPM William Kennington
> <william@wkennington.com> wrote:
> >
> > On Mon, Sep 29, 2025 at 11:43=E2=80=AFAM Khem Raj <raj.khem@gmail.com> =
wrote:
> > >
> > > On Mon, Sep 29, 2025 at 3:51=E2=80=AFAM William Kennington via
> > > lists.openembedded.org
> > > <william=3Dwkennington.com@lists.openembedded.org> wrote:
> > > >
> > > > If I add the following to my distro, the build breaks for the opens=
sl
> > > > and other core packages due to having build path impurities in the
> > > > static libraries created.
> > > >
> > > > ```
> > > > require conf/distro/include/lto.inc
> > > > DISTRO_FEATURES +=3D "lto"
> > > > ```
> > > >
> > > > The errors I get are all like
> > > > ```
> > > > ERROR: openssl-3.5.2-r0 do_package_qa: QA Issue: File
> > > > /usr/lib/libssl.a in package openssl-staticdev contains reference t=
o
> > > > TMPDIR [buildpaths]
> > > > ERROR: openssl-3.5.2-r0 do_package_qa: QA Issue: File
> > > > /usr/lib/libcrypto.a in package openssl-staticdev contains referenc=
e
> > > > to TMPDIR [buildpaths]
> > > > ERROR: openssl-3.5.2-r0 do_package_qa: Fatal QA errors were found, =
failing task.
> > > > ERROR: Logfile of failure stored in:
> > > > /home/builder/yocto/build/tmp/work/cortexa76-cortexa55-crypto-oe-li=
nux/openssl/3.5.2/temp/log.do_package_qa.118335
> > > > ERROR: Task (/srv/yocto/poky/meta/recipes-connectivity/openssl/open=
ssl_3.5.2.bb:do_package_qa)
> > > > failed with exit code '1'
> > > > ```
> > > >
> > > > Probably there is just some kind of flag missing in the LTO build
> > > > options to filter out the build directory, as -ffile-prefix-map and
> > > > whatnot are already present in the builds. I haven't yet figured ou=
t
> > > > exactly what is contributing to this impurity.
> > > >
> > >
> > > Inspect the .a files ( maybe using strings or binary viewing tools
> > > like xxd ), with LTO they are flat objects with additional informatio=
n
> > > for
> > > LTO to work and I think it will give more information.
> >
> > Yeah, I believe it's just a single remapping we are missing somewhere
> > that is allowing the extra string to be added into the binary. It's
> > been a while since I've worked on this kind of impurity stripping, so
> > it will probably take a bit to get used to the tooling again.
> > Hopefully I find the root cause and we can strip it out
> >
> > An example invocation looks like the following. All other object files
> > I looked at share the same impurity which ends up in the static
> > library later
> > ```
> > aarch64-oe-linux-gcc  -mcpu=3Dcortex-a76.cortex-a55+crypto
> > -mbranch-protection=3Dstandard -fstack-protector-strong  -O2
> > -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-secur=
ity
> > --sysroot=3D/home/builder/yocto/build/tmp/work/cortexa76-cortexa55-cryp=
to-oe-linux/openssl/3.5.2/recipe-sysroot
> >  -I. -Iinclude -Iapps/include -I../sources/openssl-3.5.2
> > -I../sources/openssl-3.5.2/include
> > -I../sources/openssl-3.5.2/apps/include  -fPIC -pthread
> > -Wa,--noexecstack -O2 -g -flto -ffat-lto-objects -fuse-linker-plugin
> > -ffile-prefix-map=3D/home/builder/yocto/build/tmp/work/cortexa76-cortex=
a55-crypto-oe-linux/openssl/3.5.2/s
> > ources/openssl-3.5.2=3D/usr/src/debug/openssl/3.5.2
> > -ffile-prefix-map=3D/home/builder/yocto/build/tmp/work/cortexa76-cortex=
a55-
> > crypto-oe-linux/openssl/3.5.2/build=3D/usr/src/debug/openssl/3.5.2
> > -ffile-prefix-map=3D/home/builder/yocto/build/tmp/work/cortexa76-cortex=
a55-crypto-oe-linux/openssl/3.5.2/recipe-sysroot=3D
> >  -ffile-prefix-map=3D/home/builder/yocto/build/tmp/work/cortexa76-corte=
xa55-crypto-oe-linux/openssl/3.5.2/recipe-sysroot-native=3D
> >  -pipe -DOPENSSL_USE_NODELETE -DOPENSSL_PIC
> > -DOPENSSLDIR=3D"\"/usr/lib/ssl-3\""
> > -DENGINESDIR=3D"\"/usr/lib/engines-3\""
> > -DMODULESDIR=3D"\"/usr/lib/ossl-modules\"" -DOPENSSL_BUILDING_OPENSSL
> > -DNDEBUG  -MMD -MF apps/lib/libapps-lib-app_x509.d.tmp -c -o
> > apps/lib/libapps-lib-app_x509.o ../sources/openssl-3.5.2/apps/l
> > ib/app_x509.c
> > ```
> > and the partial strings dump with the impurity looks like
> > ```
> > vtmp
> > unsigned int
> > /usr/src/debug/openssl/3.5.2
> > ../sources/openssl-3.5.2/apps/lib/app_x509.c
> > /home/builder/yocto/build/tmp/work/cortexa76-cortexa55-crypto-oe-linux/=
openssl/3.5.2/build
> > include/openssl
> > /usr/lib/aarch64-oe-linux/gcc/aarch64-oe-linux/15.2.0/include
> > ../sources/openssl-3.5.2/include/openssl
> > /usr/include
> > ../sources/openssl-3.5.2/apps/lib
> > ../sources/openssl-3.5.2/apps/include
> > app_x509.c
> > ```
>
> If you already know its coming from  app_x509.c, then you have
> narrowed it down a step. Next, would be
To be fair, it's basically every invocation of `gcc ... -c` that
produces it. I just picked an arbitrary file that was easy to find
that happens to carry the issue.

> to build just this file with -dD -E option and inspect if it contains
> any live string containing
> "/home/builder/yocto/build/tmp/work/cortexa76-cortexa55-crypto-oe-linux/o=
penssl/3.5.2/build"
> if it does not find it. then perhaps build the assembly output with
> -fverbose-asm -S
> option and look for this string in the generated asm file.

I ran this, and didn't see anything containing the path. I think it's
just a bug with the handling of `-ffile-prefix-map` because it looks
like the PWD being used is exactly listed

Tried the latest snapshot of gcc 15 too just to see if they fixed
anything. Nothing in the git log looks relevant and it doesn't fix the
issue.

Did some more digging and found out that if i remove
`-ffat-lto-objects` I don't have the issue anymore.
Seems like maybe this is related to
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D109805

>
> > >
> > > > Prior to rebasing on the latest master, LTO was working fine global=
ly.
> > >
> > > what is the delta we are talking about here ?
> >
> > Sadly this was long ago `25d60ac6f61cc186b4c5a961554bee583736fd17`
> > from early 2024. Doing any kind of bisection is probably pointless so
> > I just need to figure out this new impurity (or maybe just the check
> > got added since then)
>
> Yeah that will take too long to bisect so leave that aside.
>
> >
> > >
> > > >
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > Links: You receive all messages sent to this group.
> > > > View/Reply Online (#224137): https://lists.openembedded.org/g/opene=
mbedded-core/message/224137
> > > > Mute This Topic: https://lists.openembedded.org/mt/115492623/199791=
4
> > > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/uns=
ub [raj.khem@gmail.com]
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > >

