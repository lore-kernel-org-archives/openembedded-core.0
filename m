Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E08D3C6FA82
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 15:42:09 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web08.960.1663170123777431724
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 08:42:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bwcefOmH;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id
 br15-20020a056830390f00b0061c9d73b8bdso10595625otb.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 08:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=6p8oZ+om8TS5I/0P7IkVH+M+FR73JmuIGUOUEI+3Fhg=;
        b=bwcefOmHcDA27WRd2SoazeXD9gfyusXWYYBtozFXNfRVlnZmyOqLvru5rpxpf/EQpC
         ldG9QrFJRYzzLeKx2l/dREqlQFgOt4TDv8LagTLyCZWaOLPKrSYAY0opMDRXGMeUA7vf
         nYIoks8ggKzuQ/ERylwOBjweXLUdb7ggMoPXCUWZvVIcEtt2pVeANz5lL258hbErJ5x/
         whbNEEwS7EbhLHR9TzupyyvbZ0QVLEyH05z8GdxLLDjaaUcbpKh9ILoNj+jxVEEZ0GYa
         frW7Z1uzrPbu3heHOZ+L9CBaPCU2n87f0BeBg/YB+nsZPY/wTfcsDqnPVgs5Vah0fnlp
         bLBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=6p8oZ+om8TS5I/0P7IkVH+M+FR73JmuIGUOUEI+3Fhg=;
        b=kJLlFQmBWKpixFcHVQ1wvA1mGDU6FlpEq5gVs//1vdrhbxN08j6sC7ys04CyDDRNd0
         tAjYDmC8pAcuK9n5GqFJpPZOR9TY9spUBl5hIN9m6OUEl4SNFxzaze111b1VBMv7HgPL
         RgyGvhrYZDgztlJoOpcDe1I5kyPBanctO67cnnCzqN3qFXaDlqDCo7Baq9c1C/o5Pri0
         YD2vammEfbB/YNRsqinNuQvrjl+gbXlA479RD6HSzPmSIIMYsMrWEJtfLdSYup4Ce5mL
         Owbf2LxCCArzhvv0uiOsrQfCtOkLNVVZIR1FUE0TUmO12O7hhL/KQBtotKMll9BgKWyJ
         qO5w==
X-Gm-Message-State: ACgBeo0auJGeGxXNHmHB2nHAplJY6hR/1a+FNhZCW70flGZnPpCuG8s0
	FZnYPcNJhdr2uoHhf9BbbFbZvCEoIK4UjQvp85M=
X-Google-Smtp-Source: 
 AA6agR5yg/z4n7yZJGYf38O7VkUKrIJ2hqfXZNruA2xO0wh3aG/91zwCucXUuvV3VvjYFMNWZKjG7LSF1JV5Sr6Uh5o=
X-Received: by 2002:a9d:6c0c:0:b0:655:f641:2824 with SMTP id
 f12-20020a9d6c0c000000b00655f6412824mr5118125otq.55.1663170122863; Wed, 14
 Sep 2022 08:42:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220913123741.3416807-1-ecordonnier@snap.com>
 <a29c5799-9964-526d-d9e3-6a4f28cb1bc3@ni.com>
 <CAMKF1srWRB4vLNjtS+aaY=w2wcx-Y+Gt7gMFPVhftWx84+J1RA@mail.gmail.com>
 <CANOoYsMVb9YpfwjTNHv4kSARM15_3T34CA-Ekr=t7P5F0XO4bA@mail.gmail.com>
 <24771ab1-ada9-fd2a-059f-4960b6b2e073@ni.com>
 <CAHUKmYa_CPg+2uX9Yz00ATDNfEJzvcc28eJVUNeBn1+=UY4dDA@mail.gmail.com>
 <CAHUKmYa-=GFHwZUEjTfDb5gyDf8KH8MFM6bm3GCU6xpA6ppVkw@mail.gmail.com>
 <7c864dd1-27cc-ff28-dccd-8370ed5fc61f@ni.com>
In-Reply-To: <7c864dd1-27cc-ff28-dccd-8370ed5fc61f@ni.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 14 Sep 2022 08:41:36 -0700
Message-ID: 
 <CAMKF1spi2YGcR-COXFfChZp8hgPhhSKNqxrr4waY8_RyxdvM6w@mail.gmail.com>
Subject: Re: Re: Re: [OE-core] [PATCH] opkg: enable zstd support
To: Alex Stewart <alex.stewart@ni.com>
Cc: Etienne Cordonnier <ecordonnier@snapchat.com>,
 Alex Feinman <afeinman@snap.com>,
	openembedded-core@lists.openembedded.org,
	Etienne Cordonnier <ecordonnier@snap.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 15:42:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170665

On Wed, Sep 14, 2022 at 8:37 AM Alex Stewart <alex.stewart@ni.com> wrote:
>
> Thanks for checking.
>
> I'd be interested to know if setting a higher compression level for zstd
> can get us to a similar compression ratio to xz. If so, then I think it
> could be some real value to distro maintainers to be able to *tune*
> their compression.

yeah it will be interesting to say try something like level 9 but I think t=
imes
might regress with that but it might be good to know the balance and perhap=
s
suggest size mode and performance mode of zstd instead of xz

>
> That's not blocking for your new PR though.
>
>
> On 9/14/22 05:08, Etienne Cordonnier wrote:
> > Also note that zstd's default compression level is 3 per default (from
> > a 1 to 19 scale). I did not test other compression levels.
> >
> > On Wed, Sep 14, 2022 at 11:58 AM Etienne Cordonnier
> > <ecordonnier@snapchat.com> wrote:
> >
> >     I ran a build of core-image-full-cmdline using xz and zstd, using
> >     pre-populated downloads and sstate-cache directories but with
> >     empty tmp directory. Here are the numbers:
> >     zstd:
> >     bitbake core-image-full-cmdline took 2m52.768s (real), the
> >     resulting directory tmp/deploy/ipk is 1.6GB big.
> >     xz:
> >     bitbake core-image-full-cmdline took 4m14.214s (real), the
> >     resulting directory tmp/deploy/ipk/ is 996M big
> >
> >     So the build with xz is 47% slower (254/172) than with zstd for
> >     this "incremental build" use-case.
> >
> >     See the 5 biggest packages, the difference in compression-ratio
> >     increases with big files:
> >     build$ ls -lh tmp-zstd/deploy/ipk/core2-64/ --sort=3Dsize | head -n=
5
> >     total 1.6G
> >     -rw-r--r-- 3 ecordonnier ecordonnier  331M Sep 14 10:39
> >     gcc-dbg_12.2.0-r0_core2-64.ipk
> >     -rw-r--r-- 3 ecordonnier ecordonnier  264M Sep 14 10:39
> >     openssl-dbg_3.0.5-r0_core2-64.ipk
> >     -rw-r--r-- 3 ecordonnier ecordonnier  113M Sep 14 10:39
> >     openssl-ptest_3.0.5-r0_core2-64.ipk
> >     -rw-r--r-- 3 ecordonnier ecordonnier   47M Sep 14 10:39
> >     binutils-dbg_2.39-r0_core2-64.ipk
> >     build$ ls -lh tmp-xz/deploy/ipk/core2-64/ --sort=3Dsize | head -n5
> >     total 963M
> >     -rw-r--r-- 3 ecordonnier ecordonnier  214M Sep 14 10:44
> >     gcc-dbg_12.2.0-r0_core2-64.ipk
> >     -rw-r--r-- 3 ecordonnier ecordonnier  193M Sep 14 10:44
> >     openssl-dbg_3.0.5-r0_core2-64.ipk
> >     -rw-r--r-- 3 ecordonnier ecordonnier   35M Sep 14 10:44
> >     openssl-ptest_3.0.5-r0_core2-64.ipk
> >     -rw-r--r-- 3 ecordonnier ecordonnier   32M Sep 14 10:44
> >     binutils-dbg_2.39-r0_core2-64.ipk
> >     ...
> >
> >     I think for use-cases where the size of the ipk packages matters,
> >     xz is better. For use-cases where it does not matter (ipk packages
> >     not deployed), build-time matters more than compression-ratio and
> >     zstd is better.
> >
> >     Regarding the enablement of zstd in opkg per default, I'll send a
> >     new version of the patch without this line.
> >     My thinking for enabling zstd per default in opkg was that zstd is
> >     already enabled per default in libarchive's PACKAGECONFIG, and
> >     disabling zstd in opkg's PACKAGECONFIG removes only a few lines of
> >     code from opkg (opkg uses libarchive for doing the actual
> >     compression/decompression).
> >
> >     On Tue, Sep 13, 2022 at 11:57 PM Alex Stewart
> >     <alex.stewart@ni.com> wrote:
> >
> >
> >
> >         On 9/13/22 15:20, Alex Feinman wrote:
> >         > I do have some numbers. When I was selling this change
> >         internally, I
> >         > did a comparison on our internal build.
> >         >            Combined write IPK times (=CE=A3 t do_package_writ=
e_ipk)
> >         > xz         162m 35s
> >         > gz         52m 13s
> >         > zstd       33m 49s
> >         > Compression rate for zstd was closer to xz than to gz but
> >         not as good
> >         > as xz. For systems that have to cache packages on the device
> >         with
> >         > limited storage xz might be a better option, but for the
> >         bulk of
> >         > projects zstd is the best choice
> >         > Additionally, zstd offers much faster decompression than xz
> >         so the
> >         > rootfs build step that includes unpacking all of the ipks,
> >         takes 3m
> >         > 58s with xz and 2m 44s with zstd.
> >         > One other thing of note - if your build includes debug
> >         packages, some
> >         > may be quite large. E.g. one of our components produces a
> >         2.2 GB debug
> >         > package (uncompressed). On large files xz requires a
> >         disproportionally
> >         > large amount of time resulting in 15 minutes needed to
> >         simply write
> >         > ipk for the abovementioned packages, whereas zstd took about
> >         45 sec.
> >         > For frequent tasks like bitbaking a single package this
> >         translates in
> >         > a lot of saved time.
> >
> >         Those are certainly compelling performance improvements.
> >         Assuming that
> >         the final data-segment size is within 5%-ish of xz, then I
> >         would agree
> >         with the rest of the thread that it should probably be the
> >         contemporary
> >         default.
> >
> >         And if we make it the default compressor for OE IPKs, then
> >         obviously my
> >         criticism in the original PR is satisfied.
> >
> >         > Bottom line - I think making xz a default package compressor
> >         was not
> >         > entirely thought through. gzip or zstd is what the default
> >         should be.
> >
> >         ZStandard support was only added to opkg last September [1].
> >         Before
> >         that, xz was the new hotness that replaced gzip. :)
> >
> >         [1]
> >         https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoct=
oproject.org_opkg_commit_-3Fid-3D5dead419e94bce2e6b743ad786c1daec0e1aa294&d=
=3DDwIDaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGR=
fPx_Qj9TsyDLWdbBqarUzFxz3aALck&m=3DVG_fgpCGq8Zgu73KQP1wTtb1D1TZftNpXj8jGnou=
PtGIBYyLIZbG8F-85POUcVN7&s=3DMwoq2kkjfZhto6J5OomduJ5Rhyg_oSe-dkjeltE4Ls8&e=
=3D
> >         <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoc=
toproject.org_opkg_commit_-3Fid-3D5dead419e94bce2e6b743ad786c1daec0e1aa294&=
d=3DDwIDaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIG=
RfPx_Qj9TsyDLWdbBqarUzFxz3aALck&m=3DVG_fgpCGq8Zgu73KQP1wTtb1D1TZftNpXj8jGno=
uPtGIBYyLIZbG8F-85POUcVN7&s=3DMwoq2kkjfZhto6J5OomduJ5Rhyg_oSe-dkjeltE4Ls8&e=
=3D>
> >
> >
> >         > One final note: I could not find a reasonable explanation
> >         for why
> >         > opkg-tools require code changes to support a different
> >         compressor. BSD
> >         > tar and GNU tar both can easily accept compressors that they
> >         have no
> >         > idea about (via -I option) because all of them provide a
> >         unified
> >         > command line interface for use in pipes. If this were done
> >         similar to
> >         > tar, we could have used any compressor we wanted, including t=
he
> >         > multithreaded versions (zstdmt)
> >
> >         Well, presumably IPK creation tools can only support the
> >         matrix of
> >         compression algorithms which your opkg binary can decompress.
> >         I suppose
> >         someone could try to implement a plugable compression module
> >         system for
> >         opkg. But given that nearly everyone uses opkg in an embedded
> >         context,
> >         I'm not sure it would get much use.
> >
> >         >
> >         > On Tue, Sep 13, 2022 at 12:43 PM Khem Raj
> >         <raj.khem@gmail.com> wrote:
> >         >
> >         >     On Tue, Sep 13, 2022 at 12:19 PM Alex Stewart
> >         >     <alex.stewart@ni.com> wrote:
> >         >     >
> >         >     > ACK from me - apart from enabling zstd by default.
> >         >     >
> >         >     > On 9/13/22 07:37, Etienne Cordonnier via
> >         lists.openembedded.org
> >         <https://urldefense.com/v3/__http://lists.openembedded.org__;!!=
FbZ0ZwI3Qg!t0JG8eQqpsPs8clofb2phwJc6ONCKBjy-iQukKenLRVzBQvJrKTp8VsgKBI7cR8K=
lV3N64C3fKRHIcFhOF1_vg$>
> >         >
> >          <https://urldefense.com/v3/__http://lists.openembedded.org__;!=
!FbZ0ZwI3Qg!u0KgIth5yNSO1tok49C5_xo0QPHIFLa4kZBl3vVZwB-2Ui1uYBW7nt85fKXXM_V=
AHZ2LdFx_bxrNjvo$>
> >         >     wrote:
> >         >     > > This allows the use of zstd for opkg packages by usin=
g
> >         >     OPKGBUILDCMD:
> >         >     > > OPKGBUILDCMD =3D "opkg-build -Z zstd"
> >         >     > >
> >         >     > > Signed-off-by: Alex Feinman <afeinman@snap.com>
> >         >     > > Signed-off-by: Etienne Cordonnier <ecordonnier@snap.c=
om>
> >         >     > > ---
> >         >     > >   meta/recipes-devtools/opkg/opkg_0.6.0.bb
> >         <https://urldefense.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0ZwI3Q=
g!t0JG8eQqpsPs8clofb2phwJc6ONCKBjy-iQukKenLRVzBQvJrKTp8VsgKBI7cR8KlV3N64C3f=
KRHIcFFmbls2A$>
> >         >
> >          <https://urldefense.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0ZwI3=
Qg!u0KgIth5yNSO1tok49C5_xo0QPHIFLa4kZBl3vVZwB-2Ui1uYBW7nt85fKXXM_VAHZ2LdFx_=
-65pBFo$>
> >         >     | 3 ++-
> >         >     > >   1 file changed, 2 insertions(+), 1 deletion(-)
> >         >     > >
> >         >     > > diff --git
> >         a/meta/recipes-devtools/opkg/opkg_0.6.0.bb
> >         <https://urldefense.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0ZwI3Q=
g!t0JG8eQqpsPs8clofb2phwJc6ONCKBjy-iQukKenLRVzBQvJrKTp8VsgKBI7cR8KlV3N64C3f=
KRHIcFFmbls2A$>
> >         >
> >          <https://urldefense.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0ZwI3=
Qg!u0KgIth5yNSO1tok49C5_xo0QPHIFLa4kZBl3vVZwB-2Ui1uYBW7nt85fKXXM_VAHZ2LdFx_=
-65pBFo$>
> >         >     b/meta/recipes-devtools/opkg/opkg_0.6.0.bb
> >         <https://urldefense.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0ZwI3Q=
g!t0JG8eQqpsPs8clofb2phwJc6ONCKBjy-iQukKenLRVzBQvJrKTp8VsgKBI7cR8KlV3N64C3f=
KRHIcFFmbls2A$>
> >         >
> >          <https://urldefense.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0ZwI3=
Qg!u0KgIth5yNSO1tok49C5_xo0QPHIFLa4kZBl3vVZwB-2Ui1uYBW7nt85fKXXM_VAHZ2LdFx_=
-65pBFo$>
> >         >     > > index 7b351e8123..e38d9d6f3f 100644
> >         >     > > --- a/meta/recipes-devtools/opkg/opkg_0.6.0.bb
> >         <https://urldefense.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0ZwI3Q=
g!t0JG8eQqpsPs8clofb2phwJc6ONCKBjy-iQukKenLRVzBQvJrKTp8VsgKBI7cR8KlV3N64C3f=
KRHIcFFmbls2A$>
> >         >
> >          <https://urldefense.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0ZwI3=
Qg!u0KgIth5yNSO1tok49C5_xo0QPHIFLa4kZBl3vVZwB-2Ui1uYBW7nt85fKXXM_VAHZ2LdFx_=
-65pBFo$>
> >         >     > > +++ b/meta/recipes-devtools/opkg/opkg_0.6.0.bb
> >         <https://urldefense.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0ZwI3Q=
g!t0JG8eQqpsPs8clofb2phwJc6ONCKBjy-iQukKenLRVzBQvJrKTp8VsgKBI7cR8KlV3N64C3f=
KRHIcFFmbls2A$>
> >         >
> >          <https://urldefense.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0ZwI3=
Qg!u0KgIth5yNSO1tok49C5_xo0QPHIFLa4kZBl3vVZwB-2Ui1uYBW7nt85fKXXM_VAHZ2LdFx_=
-65pBFo$>
> >         >     > > @@ -30,7 +30,7 @@ inherit autotools pkgconfig ptest
> >         >     > >   target_localstatedir :=3D "${localstatedir}"
> >         >     > >   OPKGLIBDIR ??=3D "${target_localstatedir}/lib"
> >         >     > >
> >         >     > > -PACKAGECONFIG ??=3D "libsolv"
> >         >     > > +PACKAGECONFIG ??=3D "libsolv zstd"
> >         >     >
> >         >     > Building in zstd support by default is a little
> >         suspect to me.
> >         >     >
> >         >     > Unless I'm mistaken, OE-core will only build
> >         xz-compressed IPKs by
> >         >     > default. So zstd support would be unnecessary for a dis=
tro
> >         >     integrator
> >         >     > who just uses upstream OE-core.
> >         >     >
> >         >     > For distros which use zstd compression in their
> >         packages, I think it
> >         >     > would be more appropriate to overwrite the opkg
> >         PACKAGECONFIG in a
> >         >     > .bbappend.
> >         >     >
> >         >
> >         >     This is perhaps fine. I do wonder if there is some
> >         performance
> >         >     comparison data between xz and zstd compressed ipks
> >         >     with opkg, it might help users on making this choice and
> >         also if we
> >         >     should consider using
> >         >     zstd by default at some point or not.
> >         >
> >         >     > Is there something I'm not considering here?
> >         >     >
> >         >     > >
> >         >     > >   PACKAGECONFIG[gpg] =3D "--enable-gpg,--disable-gpg,=
\
> >         >     > >       gnupg gpgme libgpg-error,\
> >         >     > > @@ -39,6 +39,7 @@ PACKAGECONFIG[gpg] =3D
> >         >     "--enable-gpg,--disable-gpg,\
> >         >     > >   PACKAGECONFIG[curl] =3D
> >         "--enable-curl,--disable-curl,curl"
> >         >     > >   PACKAGECONFIG[ssl-curl] =3D
> >         >     "--enable-ssl-curl,--disable-ssl-curl,curl openssl"
> >         >     > >   PACKAGECONFIG[sha256] =3D
> >         "--enable-sha256,--disable-sha256"
> >         >     > > +PACKAGECONFIG[zstd] =3D
> >         "--enable-zstd,--disable-zstd,zstd"
> >         >     > >   PACKAGECONFIG[libsolv] =3D
> >         >     "--with-libsolv,--without-libsolv,libsolv"
> >         >     > >
> >         >     > >   EXTRA_OECONF:class-native =3D
> >         >  "--localstatedir=3D/${@os.path.relpath('${localstatedir}',
> >         >     '${STAGING_DIR_NATIVE}')}
> >         >     --sysconfdir=3D/${@os.path.relpath('${sysconfdir}',
> >         >     '${STAGING_DIR_NATIVE}')}"
> >         >     > >
> >         >     > >
> >         >     > >
> >         >     >
> >         >     > --
> >         >     > Alex Stewart
> >         >     > Software Engineer - NI Real-Time OS
> >         >     > NI (National Instruments)
> >         >     >
> >         >     > alex.stewart@ni.com
> >         >     >
> >         >     >
> >         >     > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >         >     > Links: You receive all messages sent to this group.
> >         >     > View/Reply Online (#170608):
> >         >
> >         https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.op=
enembedded.org_g_openembedded-2Dcore_message_170608&d=3DDwIBaQ&c=3DncDTmphk=
JTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESW=
Nj_K-1j0&m=3DKvCRyrKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gw=
yh&s=3D_VWADuvDS3QdSEYWTnh8wNH0lOxVHty18QZynvOtpcU&e=3D
> >         <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.o=
penembedded.org_g_openembedded-2Dcore_message_170608&d=3DDwIBaQ&c=3DncDTmph=
kJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbES=
WNj_K-1j0&m=3DKvCRyrKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25G=
wyh&s=3D_VWADuvDS3QdSEYWTnh8wNH0lOxVHty18QZynvOtpcU&e=3D>
> >         >
> >          <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.=
openembedded.org_g_openembedded-2Dcore_message_170608&d=3DDwIBaQ&c=3DncDTmp=
hkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbE=
SWNj_K-1j0&m=3DKvCRyrKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25=
Gwyh&s=3D_VWADuvDS3QdSEYWTnh8wNH0lOxVHty18QZynvOtpcU&e=3D
> >         <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.o=
penembedded.org_g_openembedded-2Dcore_message_170608&d=3DDwIBaQ&c=3DncDTmph=
kJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbES=
WNj_K-1j0&m=3DKvCRyrKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25G=
wyh&s=3D_VWADuvDS3QdSEYWTnh8wNH0lOxVHty18QZynvOtpcU&e=3D>>
> >         >
> >         >     > Mute This Topic:
> >         >
> >         https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.op=
enembedded.org_mt_93654146_1997914&d=3DDwIBaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCH=
vabgGkICC2epckfdiw&r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0&m=3DKvCR=
yrKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&s=3DQncdL2I_pC=
Dsz7AMbsTgStzC7bt5V2x_E_gIblrtjZY&e=3D
> >         <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.o=
penembedded.org_mt_93654146_1997914&d=3DDwIBaQ&c=3DncDTmphkJTvjIDPh0hpF_4vC=
HvabgGkICC2epckfdiw&r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0&m=3DKvC=
RyrKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&s=3DQncdL2I_p=
CDsz7AMbsTgStzC7bt5V2x_E_gIblrtjZY&e=3D>
> >         >
> >          <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.=
openembedded.org_mt_93654146_1997914&d=3DDwIBaQ&c=3DncDTmphkJTvjIDPh0hpF_4v=
CHvabgGkICC2epckfdiw&r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0&m=3DKv=
CRyrKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&s=3DQncdL2I_=
pCDsz7AMbsTgStzC7bt5V2x_E_gIblrtjZY&e=3D
> >         <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.o=
penembedded.org_mt_93654146_1997914&d=3DDwIBaQ&c=3DncDTmphkJTvjIDPh0hpF_4vC=
HvabgGkICC2epckfdiw&r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0&m=3DKvC=
RyrKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&s=3DQncdL2I_p=
CDsz7AMbsTgStzC7bt5V2x_E_gIblrtjZY&e=3D>>
> >         >
> >         >     > Group Owner:
> >         openembedded-core+owner@lists.openembedded.org
> >         <mailto:openembedded-core%2Bowner@lists.openembedded.org>
> >         >     <mailto:openembedded-core%2Bowner@lists.openembedded.org
> >         <mailto:openembedded-core%252Bowner@lists.openembedded.org>>
> >         >     > Unsubscribe:
> >         >
> >         https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.op=
enembedded.org_g_openembedded-2Dcore_unsub&d=3DDwIBaQ&c=3DncDTmphkJTvjIDPh0=
hpF_4vCHvabgGkICC2epckfdiw&r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0&=
m=3DKvCRyrKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&s=3DPx=
AE_3yGzbSZ21-LHz_1r3gd2_STPoZcrYDeu9vd_GM&e=3D
> >         <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.o=
penembedded.org_g_openembedded-2Dcore_unsub&d=3DDwIBaQ&c=3DncDTmphkJTvjIDPh=
0hpF_4vCHvabgGkICC2epckfdiw&r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0=
&m=3DKvCRyrKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&s=3DP=
xAE_3yGzbSZ21-LHz_1r3gd2_STPoZcrYDeu9vd_GM&e=3D>
> >         >
> >          <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.=
openembedded.org_g_openembedded-2Dcore_unsub&d=3DDwIBaQ&c=3DncDTmphkJTvjIDP=
h0hpF_4vCHvabgGkICC2epckfdiw&r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j=
0&m=3DKvCRyrKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&s=3D=
PxAE_3yGzbSZ21-LHz_1r3gd2_STPoZcrYDeu9vd_GM&e=3D
> >         <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.o=
penembedded.org_g_openembedded-2Dcore_unsub&d=3DDwIBaQ&c=3DncDTmphkJTvjIDPh=
0hpF_4vCHvabgGkICC2epckfdiw&r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0=
&m=3DKvCRyrKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&s=3DP=
xAE_3yGzbSZ21-LHz_1r3gd2_STPoZcrYDeu9vd_GM&e=3D>>
> >         >      [raj.khem@gmail.com]
> >         >     > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >         >     >
> >         >
> >
> >         --
> >         Alex Stewart
> >         Software Engineer - NI Real-Time OS
> >         NI (National Instruments)
> >
> >         alex.stewart@ni.com
> >
>
> --
> Alex Stewart
> Software Engineer - NI Real-Time OS
> NI (National Instruments)
>
> alex.stewart@ni.com
>

