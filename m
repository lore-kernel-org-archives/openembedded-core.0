Return-Path: <ecordonnier@snapchat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16558C32771
	for <webhook@archiver.kernel.org>; Wed, 28 Sep 2022 16:50:50 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web09.121.1664383839514437271
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Sep 2022 09:50:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snapchat.com header.s=google header.b=bVGdwowy;
 spf=pass (domain: snapchat.com, ip: 209.85.167.176,
 mailfrom: ecordonnier@snapchat.com)
Received: by mail-oi1-f176.google.com with SMTP id n83so16002057oif.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Sep 2022 09:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snapchat.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=W1ok0uYaYxx6/c90Bc3Ek9JR0zI8IcyhI+oKef/g+4s=;
        b=bVGdwowyKQkvwQy2nF1f+Me/e1sFLZ7F0oa1esMznjk65iwsVTmHXHIBQvRd3oNX/v
         fza8wEcD2Bpic4eoYI/hDfNlSOXM0/WnDV8MjBw49HCauqFSkr7u4o26gMHnnQ8HHmFF
         S4qFBv1kTLBsCF5XAaah0NjRFifP0DV9CXY1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=W1ok0uYaYxx6/c90Bc3Ek9JR0zI8IcyhI+oKef/g+4s=;
        b=J89Pk1HkslFSQv1uNjacHPbVmr5XeaOv0p/naY0E0XWT5IqpiP7sqVBObBA5kHr/4o
         1kgMREPtT6PXVYf0Nh6NRG3pCkRj5YnLRPXNi1g0iAZvxwpnkwNp/y2esvsQvHoP27LK
         j5B/tJ6vvQCs7OnUvszhFLIPet6rdbeG7XYY/G7RbODuj1KiU9fNAQGNXZYSwtaIy2QG
         vWXQws951bnKM6qigWGGE1+i4LBZWFh4sYoaoH+Eqqond+F9eo7BylAsi1JxYOvLUELu
         Ocn2xLKBtktIWyOlhyXMYzO98Yb/ADHXBNMG4IV3uI3WCFCrIAP6b9JssIbsOVLK3JOj
         JA4g==
X-Gm-Message-State: ACrzQf0HWy4FHUmsL4LQw3wScRfs2BewmEdf+o0Ja7hKIAyt7xxhAiQa
	+sY3unZxcrokkeHhq1gUIaQGuyoo3RnaCWWLrQ5Y2Q==
X-Google-Smtp-Source: 
 AMsMyM6PJqyxbYTsaX9qWbEgvnfS9tPJrUkO4u+mXOneKAoagiM4hfhw1LI2c6fCDNfaY4hnhc7BWxaQTmCnCYodthw=
X-Received: by 2002:a05:6808:1888:b0:351:515b:1c03 with SMTP id
 bi8-20020a056808188800b00351515b1c03mr4813421oib.111.1664383838340; Wed, 28
 Sep 2022 09:50:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220913123741.3416807-1-ecordonnier@snap.com>
 <a29c5799-9964-526d-d9e3-6a4f28cb1bc3@ni.com>
 <CAMKF1srWRB4vLNjtS+aaY=w2wcx-Y+Gt7gMFPVhftWx84+J1RA@mail.gmail.com>
 <CANOoYsMVb9YpfwjTNHv4kSARM15_3T34CA-Ekr=t7P5F0XO4bA@mail.gmail.com>
 <24771ab1-ada9-fd2a-059f-4960b6b2e073@ni.com>
 <CAHUKmYa_CPg+2uX9Yz00ATDNfEJzvcc28eJVUNeBn1+=UY4dDA@mail.gmail.com>
 <CAHUKmYa-=GFHwZUEjTfDb5gyDf8KH8MFM6bm3GCU6xpA6ppVkw@mail.gmail.com>
 <7c864dd1-27cc-ff28-dccd-8370ed5fc61f@ni.com>
 <CAMKF1spi2YGcR-COXFfChZp8hgPhhSKNqxrr4waY8_RyxdvM6w@mail.gmail.com>
In-Reply-To: 
 <CAMKF1spi2YGcR-COXFfChZp8hgPhhSKNqxrr4waY8_RyxdvM6w@mail.gmail.com>
From: Etienne Cordonnier <ecordonnier@snapchat.com>
Date: Wed, 28 Sep 2022 18:50:27 +0200
Message-ID: 
 <CAHUKmYYsZDyEJ4OqP+CNVKt7_nkgFLYhfiXcGG8r6hgaGL_Uug@mail.gmail.com>
Subject: Re: Re: Re: [OE-core] [PATCH] opkg: enable zstd support
To: Khem Raj <raj.khem@gmail.com>
Cc: Alex Stewart <alex.stewart@ni.com>, Alex Feinman <afeinman@snap.com>,
	openembedded-core@lists.openembedded.org,
	Etienne Cordonnier <ecordonnier@snap.com>
Content-Type: multipart/alternative; boundary="000000000000746a4805e9bf8f77"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Sep 2022 16:50:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171151

--000000000000746a4805e9bf8f77
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I tested it a bit more today. I used the standard poky's local.conf and
added those lines. You can see that at zstd level 9 there is still a
significant difference in the compression ratio with xz for gcc-dbg which
is a big file. At zstd level 19, gcc-dbg is 241MB big instead of 214MB with
xz (12.6% more).

PACKAGE_CLASSES =3D "package_ipk"
ZSTD_DEFAULTS =3D "-T0 -19"
PACKAGECONFIG:append:pn-opkg-native =3D " zstd"
OPKGBUILDCMD =3D "opkg-build -Z zstd -a ${ZSTD_DEFAULTS}"

Zstd at level 9:

build$ ls -lh tmp-zstd-level9/deploy/ipk/core2-64/  --sort=3Dsize | head -n=
10
total 1.5G
-rw-r--r-- 3 ecordonnier ecordonnier  302M Sep 28 18:33
gcc-dbg_12.2.0-r0_core2-64.ipk
-rw-r--r-- 3 ecordonnier ecordonnier  249M Sep 28 18:33
openssl-dbg_3.0.5-r0_core2-64.ipk
-rw-r--r-- 3 ecordonnier ecordonnier  106M Sep 28 18:33
openssl-ptest_3.0.5-r0_core2-64.ipk
-rw-r--r-- 3 ecordonnier ecordonnier   44M Sep 28 18:33
binutils-dbg_2.39-r0_core2-64.ipk
-rw-r--r-- 3 ecordonnier ecordonnier   26M Sep 28 18:33
perl-ptest_5.36.0-r0_core2-64.ipk
-rw-r--r-- 3 ecordonnier ecordonnier   23M Sep 28 18:33
gcc_12.2.0-r0_core2-64.ipk
-rw-r--r-- 3 ecordonnier ecordonnier   15M Sep 28 18:32
elfutils-ptest_0.187-r0_core2-64.ipk
-rw-r--r-- 3 ecordonnier ecordonnier   15M Sep 28 18:33
gcc-src_12.2.0-r0_core2-64.ipk
-rw-r--r-- 3 ecordonnier ecordonnier   13M Sep 28 18:33
coreutils-dbg_9.1-r0_core2-64.ipk

zstd at level 19:

build$ ls -lh tmp-zstd-level19/deploy/ipk/core2-64/  --sort=3Dsize | head -=
n10
total 1.1G
-rw-r--r-- 3 ecordonnier ecordonnier  241M Sep 28 18:04
gcc-dbg_12.2.0-r0_core2-64.ipk
-rw-r--r-- 3 ecordonnier ecordonnier  213M Sep 28 18:03
openssl-dbg_3.0.5-r0_core2-64.ipk
-rw-r--r-- 3 ecordonnier ecordonnier   36M Sep 28 17:58
binutils-dbg_2.39-r0_core2-64.ipk
-rw-r--r-- 3 ecordonnier ecordonnier   30M Sep 28 18:00
openssl-ptest_3.0.5-r0_core2-64.ipk
-rw-r--r-- 3 ecordonnier ecordonnier   22M Sep 28 17:59
perl-ptest_5.36.0-r0_core2-64.ipk
-rw-r--r-- 3 ecordonnier ecordonnier   20M Sep 28 17:58
gcc_12.2.0-r0_core2-64.ipk
-rw-r--r-- 3 ecordonnier ecordonnier   14M Sep 28 17:57
elfutils-ptest_0.187-r0_core2-64.ipk
-rw-r--r-- 3 ecordonnier ecordonnier   12M Sep 28 17:58
gcc-src_12.2.0-r0_core2-64.ipk
-rw-r--r-- 3 ecordonnier ecordonnier   12M Sep 28 17:57
g++_12.2.0-r0_core2-64.ipk

xz at level 9 (the default):

build$ ls -lh tmp-xz/deploy/ipk/core2-64/  --sort=3Dsize | head -n10
total 963M
-rw-r--r-- 3 ecordonnier ecordonnier  214M Sep 14 10:44
gcc-dbg_12.2.0-r0_core2-64.ipk
-rw-r--r-- 3 ecordonnier ecordonnier  193M Sep 14 10:44
openssl-dbg_3.0.5-r0_core2-64.ipk
-rw-r--r-- 3 ecordonnier ecordonnier   35M Sep 14 10:44
openssl-ptest_3.0.5-r0_core2-64.ipk
-rw-r--r-- 3 ecordonnier ecordonnier   32M Sep 14 10:44
binutils-dbg_2.39-r0_core2-64.ipk
-rw-r--r-- 3 ecordonnier ecordonnier   20M Sep 14 10:44
perl-ptest_5.36.0-r0_core2-64.ipk
-rw-r--r-- 3 ecordonnier ecordonnier   19M Sep 14 10:44
gcc_12.2.0-r0_core2-64.ipk
-rw-r--r-- 3 ecordonnier ecordonnier   13M Sep 14 10:44
elfutils-ptest_0.187-r0_core2-64.ipk
-rw-r--r-- 3 ecordonnier ecordonnier   12M Sep 14 10:44
gcc-src_12.2.0-r0_core2-64.ipk
-rw-r--r-- 3 ecordonnier ecordonnier   11M Sep 14 10:44
g++_12.2.0-r0_core2-64.ipk

On Wed, Sep 14, 2022 at 5:42 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Wed, Sep 14, 2022 at 8:37 AM Alex Stewart <alex.stewart@ni.com> wrote:
> >
> > Thanks for checking.
> >
> > I'd be interested to know if setting a higher compression level for zst=
d
> > can get us to a similar compression ratio to xz. If so, then I think it
> > could be some real value to distro maintainers to be able to *tune*
> > their compression.
>
> yeah it will be interesting to say try something like level 9 but I think
> times
> might regress with that but it might be good to know the balance and
> perhaps
> suggest size mode and performance mode of zstd instead of xz
>
> >
> > That's not blocking for your new PR though.
> >
> >
> > On 9/14/22 05:08, Etienne Cordonnier wrote:
> > > Also note that zstd's default compression level is 3 per default (fro=
m
> > > a 1 to 19 scale). I did not test other compression levels.
> > >
> > > On Wed, Sep 14, 2022 at 11:58 AM Etienne Cordonnier
> > > <ecordonnier@snapchat.com> wrote:
> > >
> > >     I ran a build of core-image-full-cmdline using xz and zstd, using
> > >     pre-populated downloads and sstate-cache directories but with
> > >     empty tmp directory. Here are the numbers:
> > >     zstd:
> > >     bitbake core-image-full-cmdline took 2m52.768s (real), the
> > >     resulting directory tmp/deploy/ipk is 1.6GB big.
> > >     xz:
> > >     bitbake core-image-full-cmdline took 4m14.214s (real), the
> > >     resulting directory tmp/deploy/ipk/ is 996M big
> > >
> > >     So the build with xz is 47% slower (254/172) than with zstd for
> > >     this "incremental build" use-case.
> > >
> > >     See the 5 biggest packages, the difference in compression-ratio
> > >     increases with big files:
> > >     build$ ls -lh tmp-zstd/deploy/ipk/core2-64/ --sort=3Dsize | head =
-n5
> > >     total 1.6G
> > >     -rw-r--r-- 3 ecordonnier ecordonnier  331M Sep 14 10:39
> > >     gcc-dbg_12.2.0-r0_core2-64.ipk
> > >     -rw-r--r-- 3 ecordonnier ecordonnier  264M Sep 14 10:39
> > >     openssl-dbg_3.0.5-r0_core2-64.ipk
> > >     -rw-r--r-- 3 ecordonnier ecordonnier  113M Sep 14 10:39
> > >     openssl-ptest_3.0.5-r0_core2-64.ipk
> > >     -rw-r--r-- 3 ecordonnier ecordonnier   47M Sep 14 10:39
> > >     binutils-dbg_2.39-r0_core2-64.ipk
> > >     build$ ls -lh tmp-xz/deploy/ipk/core2-64/ --sort=3Dsize | head -n=
5
> > >     total 963M
> > >     -rw-r--r-- 3 ecordonnier ecordonnier  214M Sep 14 10:44
> > >     gcc-dbg_12.2.0-r0_core2-64.ipk
> > >     -rw-r--r-- 3 ecordonnier ecordonnier  193M Sep 14 10:44
> > >     openssl-dbg_3.0.5-r0_core2-64.ipk
> > >     -rw-r--r-- 3 ecordonnier ecordonnier   35M Sep 14 10:44
> > >     openssl-ptest_3.0.5-r0_core2-64.ipk
> > >     -rw-r--r-- 3 ecordonnier ecordonnier   32M Sep 14 10:44
> > >     binutils-dbg_2.39-r0_core2-64.ipk
> > >     ...
> > >
> > >     I think for use-cases where the size of the ipk packages matters,
> > >     xz is better. For use-cases where it does not matter (ipk package=
s
> > >     not deployed), build-time matters more than compression-ratio and
> > >     zstd is better.
> > >
> > >     Regarding the enablement of zstd in opkg per default, I'll send a
> > >     new version of the patch without this line.
> > >     My thinking for enabling zstd per default in opkg was that zstd i=
s
> > >     already enabled per default in libarchive's PACKAGECONFIG, and
> > >     disabling zstd in opkg's PACKAGECONFIG removes only a few lines o=
f
> > >     code from opkg (opkg uses libarchive for doing the actual
> > >     compression/decompression).
> > >
> > >     On Tue, Sep 13, 2022 at 11:57 PM Alex Stewart
> > >     <alex.stewart@ni.com> wrote:
> > >
> > >
> > >
> > >         On 9/13/22 15:20, Alex Feinman wrote:
> > >         > I do have some numbers. When I was selling this change
> > >         internally, I
> > >         > did a comparison on our internal build.
> > >         >            Combined write IPK times (=CE=A3 t
> do_package_write_ipk)
> > >         > xz         162m 35s
> > >         > gz         52m 13s
> > >         > zstd       33m 49s
> > >         > Compression rate for zstd was closer to xz than to gz but
> > >         not as good
> > >         > as xz. For systems that have to cache packages on the devic=
e
> > >         with
> > >         > limited storage xz might be a better option, but for the
> > >         bulk of
> > >         > projects zstd is the best choice
> > >         > Additionally, zstd offers much faster decompression than xz
> > >         so the
> > >         > rootfs build step that includes unpacking all of the ipks,
> > >         takes 3m
> > >         > 58s with xz and 2m 44s with zstd.
> > >         > One other thing of note - if your build includes debug
> > >         packages, some
> > >         > may be quite large. E.g. one of our components produces a
> > >         2.2 GB debug
> > >         > package (uncompressed). On large files xz requires a
> > >         disproportionally
> > >         > large amount of time resulting in 15 minutes needed to
> > >         simply write
> > >         > ipk for the abovementioned packages, whereas zstd took abou=
t
> > >         45 sec.
> > >         > For frequent tasks like bitbaking a single package this
> > >         translates in
> > >         > a lot of saved time.
> > >
> > >         Those are certainly compelling performance improvements.
> > >         Assuming that
> > >         the final data-segment size is within 5%-ish of xz, then I
> > >         would agree
> > >         with the rest of the thread that it should probably be the
> > >         contemporary
> > >         default.
> > >
> > >         And if we make it the default compressor for OE IPKs, then
> > >         obviously my
> > >         criticism in the original PR is satisfied.
> > >
> > >         > Bottom line - I think making xz a default package compresso=
r
> > >         was not
> > >         > entirely thought through. gzip or zstd is what the default
> > >         should be.
> > >
> > >         ZStandard support was only added to opkg last September [1].
> > >         Before
> > >         that, xz was the new hotness that replaced gzip. :)
> > >
> > >         [1]
> > >
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.o=
rg_opkg_commit_-3Fid-3D5dead419e94bce2e6b743ad786c1daec0e1aa294&d=3DDwIDaQ&=
c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9Tsy=
DLWdbBqarUzFxz3aALck&m=3DVG_fgpCGq8Zgu73KQP1wTtb1D1TZftNpXj8jGnouPtGIBYyLIZ=
bG8F-85POUcVN7&s=3DMwoq2kkjfZhto6J5OomduJ5Rhyg_oSe-dkjeltE4Ls8&e=3D
> > >         <
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.o=
rg_opkg_commit_-3Fid-3D5dead419e94bce2e6b743ad786c1daec0e1aa294&d=3DDwIDaQ&=
c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9Tsy=
DLWdbBqarUzFxz3aALck&m=3DVG_fgpCGq8Zgu73KQP1wTtb1D1TZftNpXj8jGnouPtGIBYyLIZ=
bG8F-85POUcVN7&s=3DMwoq2kkjfZhto6J5OomduJ5Rhyg_oSe-dkjeltE4Ls8&e=3D
> >
> > >
> > >
> > >         > One final note: I could not find a reasonable explanation
> > >         for why
> > >         > opkg-tools require code changes to support a different
> > >         compressor. BSD
> > >         > tar and GNU tar both can easily accept compressors that the=
y
> > >         have no
> > >         > idea about (via -I option) because all of them provide a
> > >         unified
> > >         > command line interface for use in pipes. If this were done
> > >         similar to
> > >         > tar, we could have used any compressor we wanted, including
> the
> > >         > multithreaded versions (zstdmt)
> > >
> > >         Well, presumably IPK creation tools can only support the
> > >         matrix of
> > >         compression algorithms which your opkg binary can decompress.
> > >         I suppose
> > >         someone could try to implement a plugable compression module
> > >         system for
> > >         opkg. But given that nearly everyone uses opkg in an embedded
> > >         context,
> > >         I'm not sure it would get much use.
> > >
> > >         >
> > >         > On Tue, Sep 13, 2022 at 12:43 PM Khem Raj
> > >         <raj.khem@gmail.com> wrote:
> > >         >
> > >         >     On Tue, Sep 13, 2022 at 12:19 PM Alex Stewart
> > >         >     <alex.stewart@ni.com> wrote:
> > >         >     >
> > >         >     > ACK from me - apart from enabling zstd by default.
> > >         >     >
> > >         >     > On 9/13/22 07:37, Etienne Cordonnier via
> > >         lists.openembedded.org
> > >         <
> https://urldefense.com/v3/__http://lists.openembedded.org__;!!FbZ0ZwI3Qg!=
t0JG8eQqpsPs8clofb2phwJc6ONCKBjy-iQukKenLRVzBQvJrKTp8VsgKBI7cR8KlV3N64C3fKR=
HIcFhOF1_vg$
> >
> > >         >
> > >          <
> https://urldefense.com/v3/__http://lists.openembedded.org__;!!FbZ0ZwI3Qg!=
u0KgIth5yNSO1tok49C5_xo0QPHIFLa4kZBl3vVZwB-2Ui1uYBW7nt85fKXXM_VAHZ2LdFx_bxr=
Njvo$
> >
> > >         >     wrote:
> > >         >     > > This allows the use of zstd for opkg packages by
> using
> > >         >     OPKGBUILDCMD:
> > >         >     > > OPKGBUILDCMD =3D "opkg-build -Z zstd"
> > >         >     > >
> > >         >     > > Signed-off-by: Alex Feinman <afeinman@snap.com>
> > >         >     > > Signed-off-by: Etienne Cordonnier <
> ecordonnier@snap.com>
> > >         >     > > ---
> > >         >     > >   meta/recipes-devtools/opkg/opkg_0.6.0.bb
> > >         <
> https://urldefense.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0ZwI3Qg!t0JG8eQqp=
sPs8clofb2phwJc6ONCKBjy-iQukKenLRVzBQvJrKTp8VsgKBI7cR8KlV3N64C3fKRHIcFFmbls=
2A$
> >
> > >         >
> > >          <
> https://urldefense.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0ZwI3Qg!u0KgIth5y=
NSO1tok49C5_xo0QPHIFLa4kZBl3vVZwB-2Ui1uYBW7nt85fKXXM_VAHZ2LdFx_-65pBFo$
> >
> > >         >     | 3 ++-
> > >         >     > >   1 file changed, 2 insertions(+), 1 deletion(-)
> > >         >     > >
> > >         >     > > diff --git
> > >         a/meta/recipes-devtools/opkg/opkg_0.6.0.bb
> > >         <
> https://urldefense.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0ZwI3Qg!t0JG8eQqp=
sPs8clofb2phwJc6ONCKBjy-iQukKenLRVzBQvJrKTp8VsgKBI7cR8KlV3N64C3fKRHIcFFmbls=
2A$
> >
> > >         >
> > >          <
> https://urldefense.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0ZwI3Qg!u0KgIth5y=
NSO1tok49C5_xo0QPHIFLa4kZBl3vVZwB-2Ui1uYBW7nt85fKXXM_VAHZ2LdFx_-65pBFo$
> >
> > >         >     b/meta/recipes-devtools/opkg/opkg_0.6.0.bb
> > >         <
> https://urldefense.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0ZwI3Qg!t0JG8eQqp=
sPs8clofb2phwJc6ONCKBjy-iQukKenLRVzBQvJrKTp8VsgKBI7cR8KlV3N64C3fKRHIcFFmbls=
2A$
> >
> > >         >
> > >          <
> https://urldefense.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0ZwI3Qg!u0KgIth5y=
NSO1tok49C5_xo0QPHIFLa4kZBl3vVZwB-2Ui1uYBW7nt85fKXXM_VAHZ2LdFx_-65pBFo$
> >
> > >         >     > > index 7b351e8123..e38d9d6f3f 100644
> > >         >     > > --- a/meta/recipes-devtools/opkg/opkg_0.6.0.bb
> > >         <
> https://urldefense.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0ZwI3Qg!t0JG8eQqp=
sPs8clofb2phwJc6ONCKBjy-iQukKenLRVzBQvJrKTp8VsgKBI7cR8KlV3N64C3fKRHIcFFmbls=
2A$
> >
> > >         >
> > >          <
> https://urldefense.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0ZwI3Qg!u0KgIth5y=
NSO1tok49C5_xo0QPHIFLa4kZBl3vVZwB-2Ui1uYBW7nt85fKXXM_VAHZ2LdFx_-65pBFo$
> >
> > >         >     > > +++ b/meta/recipes-devtools/opkg/opkg_0.6.0.bb
> > >         <
> https://urldefense.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0ZwI3Qg!t0JG8eQqp=
sPs8clofb2phwJc6ONCKBjy-iQukKenLRVzBQvJrKTp8VsgKBI7cR8KlV3N64C3fKRHIcFFmbls=
2A$
> >
> > >         >
> > >          <
> https://urldefense.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0ZwI3Qg!u0KgIth5y=
NSO1tok49C5_xo0QPHIFLa4kZBl3vVZwB-2Ui1uYBW7nt85fKXXM_VAHZ2LdFx_-65pBFo$
> >
> > >         >     > > @@ -30,7 +30,7 @@ inherit autotools pkgconfig ptest
> > >         >     > >   target_localstatedir :=3D "${localstatedir}"
> > >         >     > >   OPKGLIBDIR ??=3D "${target_localstatedir}/lib"
> > >         >     > >
> > >         >     > > -PACKAGECONFIG ??=3D "libsolv"
> > >         >     > > +PACKAGECONFIG ??=3D "libsolv zstd"
> > >         >     >
> > >         >     > Building in zstd support by default is a little
> > >         suspect to me.
> > >         >     >
> > >         >     > Unless I'm mistaken, OE-core will only build
> > >         xz-compressed IPKs by
> > >         >     > default. So zstd support would be unnecessary for a
> distro
> > >         >     integrator
> > >         >     > who just uses upstream OE-core.
> > >         >     >
> > >         >     > For distros which use zstd compression in their
> > >         packages, I think it
> > >         >     > would be more appropriate to overwrite the opkg
> > >         PACKAGECONFIG in a
> > >         >     > .bbappend.
> > >         >     >
> > >         >
> > >         >     This is perhaps fine. I do wonder if there is some
> > >         performance
> > >         >     comparison data between xz and zstd compressed ipks
> > >         >     with opkg, it might help users on making this choice an=
d
> > >         also if we
> > >         >     should consider using
> > >         >     zstd by default at some point or not.
> > >         >
> > >         >     > Is there something I'm not considering here?
> > >         >     >
> > >         >     > >
> > >         >     > >   PACKAGECONFIG[gpg] =3D "--enable-gpg,--disable-gp=
g,\
> > >         >     > >       gnupg gpgme libgpg-error,\
> > >         >     > > @@ -39,6 +39,7 @@ PACKAGECONFIG[gpg] =3D
> > >         >     "--enable-gpg,--disable-gpg,\
> > >         >     > >   PACKAGECONFIG[curl] =3D
> > >         "--enable-curl,--disable-curl,curl"
> > >         >     > >   PACKAGECONFIG[ssl-curl] =3D
> > >         >     "--enable-ssl-curl,--disable-ssl-curl,curl openssl"
> > >         >     > >   PACKAGECONFIG[sha256] =3D
> > >         "--enable-sha256,--disable-sha256"
> > >         >     > > +PACKAGECONFIG[zstd] =3D
> > >         "--enable-zstd,--disable-zstd,zstd"
> > >         >     > >   PACKAGECONFIG[libsolv] =3D
> > >         >     "--with-libsolv,--without-libsolv,libsolv"
> > >         >     > >
> > >         >     > >   EXTRA_OECONF:class-native =3D
> > >         >  "--localstatedir=3D/${@os.path.relpath('${localstatedir}',
> > >         >     '${STAGING_DIR_NATIVE}')}
> > >         >     --sysconfdir=3D/${@os.path.relpath('${sysconfdir}',
> > >         >     '${STAGING_DIR_NATIVE}')}"
> > >         >     > >
> > >         >     > >
> > >         >     > >
> > >         >     >
> > >         >     > --
> > >         >     > Alex Stewart
> > >         >     > Software Engineer - NI Real-Time OS
> > >         >     > NI (National Instruments)
> > >         >     >
> > >         >     > alex.stewart@ni.com
> > >         >     >
> > >         >     >
> > >         >     > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >         >     > Links: You receive all messages sent to this group.
> > >         >     > View/Reply Online (#170608):
> > >         >
> > >
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_message_170608&d=3DDwIBaQ&c=3DncDTmphkJTvjIDPh0h=
pF_4vCHvabgGkICC2epckfdiw&r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0&m=
=3DKvCRyrKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&s=3D_VW=
ADuvDS3QdSEYWTnh8wNH0lOxVHty18QZynvOtpcU&e=3D
> > >         <
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_message_170608&d=3DDwIBaQ&c=3DncDTmphkJTvjIDPh0h=
pF_4vCHvabgGkICC2epckfdiw&r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0&m=
=3DKvCRyrKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&s=3D_VW=
ADuvDS3QdSEYWTnh8wNH0lOxVHty18QZynvOtpcU&e=3D
> >
> > >         >
> > >          <
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_message_170608&d=3DDwIBaQ&c=3DncDTmphkJTvjIDPh0h=
pF_4vCHvabgGkICC2epckfdiw&r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0&m=
=3DKvCRyrKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&s=3D_VW=
ADuvDS3QdSEYWTnh8wNH0lOxVHty18QZynvOtpcU&e=3D
> > >         <
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_message_170608&d=3DDwIBaQ&c=3DncDTmphkJTvjIDPh0h=
pF_4vCHvabgGkICC2epckfdiw&r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0&m=
=3DKvCRyrKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&s=3D_VW=
ADuvDS3QdSEYWTnh8wNH0lOxVHty18QZynvOtpcU&e=3D
> >>
> > >         >
> > >         >     > Mute This Topic:
> > >         >
> > >
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_mt_93654146_1997914&d=3DDwIBaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2=
epckfdiw&r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0&m=3DKvCRyrKojziBs0=
h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&s=3DQncdL2I_pCDsz7AMbsTg=
StzC7bt5V2x_E_gIblrtjZY&e=3D
> > >         <
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_mt_93654146_1997914&d=3DDwIBaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2=
epckfdiw&r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0&m=3DKvCRyrKojziBs0=
h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&s=3DQncdL2I_pCDsz7AMbsTg=
StzC7bt5V2x_E_gIblrtjZY&e=3D
> >
> > >         >
> > >          <
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_mt_93654146_1997914&d=3DDwIBaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2=
epckfdiw&r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0&m=3DKvCRyrKojziBs0=
h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&s=3DQncdL2I_pCDsz7AMbsTg=
StzC7bt5V2x_E_gIblrtjZY&e=3D
> > >         <
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_mt_93654146_1997914&d=3DDwIBaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2=
epckfdiw&r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0&m=3DKvCRyrKojziBs0=
h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&s=3DQncdL2I_pCDsz7AMbsTg=
StzC7bt5V2x_E_gIblrtjZY&e=3D
> >>
> > >         >
> > >         >     > Group Owner:
> > >         openembedded-core+owner@lists.openembedded.org
> > >         <mailto:openembedded-core%2Bowner@lists.openembedded.org>
> > >         >     <mailto:openembedded-core%2Bowner@lists.openembedded.or=
g
> > >         <mailto:openembedded-core%252Bowner@lists.openembedded.org>>
> > >         >     > Unsubscribe:
> > >         >
> > >
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_unsub&d=3DDwIBaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHva=
bgGkICC2epckfdiw&r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0&m=3DKvCRyr=
KojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&s=3DPxAE_3yGzbSZ=
21-LHz_1r3gd2_STPoZcrYDeu9vd_GM&e=3D
> > >         <
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_unsub&d=3DDwIBaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHva=
bgGkICC2epckfdiw&r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0&m=3DKvCRyr=
KojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&s=3DPxAE_3yGzbSZ=
21-LHz_1r3gd2_STPoZcrYDeu9vd_GM&e=3D
> >
> > >         >
> > >          <
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_unsub&d=3DDwIBaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHva=
bgGkICC2epckfdiw&r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0&m=3DKvCRyr=
KojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&s=3DPxAE_3yGzbSZ=
21-LHz_1r3gd2_STPoZcrYDeu9vd_GM&e=3D
> > >         <
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_unsub&d=3DDwIBaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHva=
bgGkICC2epckfdiw&r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0&m=3DKvCRyr=
KojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&s=3DPxAE_3yGzbSZ=
21-LHz_1r3gd2_STPoZcrYDeu9vd_GM&e=3D
> >>
> > >         >      [raj.khem@gmail.com]
> > >         >     > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >         >     >
> > >         >
> > >
> > >         --
> > >         Alex Stewart
> > >         Software Engineer - NI Real-Time OS
> > >         NI (National Instruments)
> > >
> > >         alex.stewart@ni.com
> > >
> >
> > --
> > Alex Stewart
> > Software Engineer - NI Real-Time OS
> > NI (National Instruments)
> >
> > alex.stewart@ni.com
> >
>

--000000000000746a4805e9bf8f77
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I tested it a bit more today. I used the standard poky&#39=
;s local.conf and added those lines. You can see that at zstd level 9 there=
 is still a significant difference in the compression ratio with xz for gcc=
-dbg which is a big file. At zstd level 19, gcc-dbg is 241MB big instead of=
 214MB with xz (12.6% more).<br><br>PACKAGE_CLASSES =3D &quot;package_ipk&q=
uot;<br>ZSTD_DEFAULTS =3D &quot;-T0 -19&quot;<br>PACKAGECONFIG:append:pn-op=
kg-native =3D &quot; zstd&quot;<br>OPKGBUILDCMD =3D &quot;opkg-build -Z zst=
d -a ${ZSTD_DEFAULTS}&quot;<br><br>Zstd at level 9:<br><br>build$ ls -lh tm=
p-zstd-level9/deploy/ipk/core2-64/ =C2=A0--sort=3Dsize | head -n10<br>total=
 1.5G<br>-rw-r--r-- 3 ecordonnier ecordonnier =C2=A0302M Sep 28 18:33 gcc-d=
bg_12.2.0-r0_core2-64.ipk<br>-rw-r--r-- 3 ecordonnier ecordonnier =C2=A0249=
M Sep 28 18:33 openssl-dbg_3.0.5-r0_core2-64.ipk<br>-rw-r--r-- 3 ecordonnie=
r ecordonnier =C2=A0106M Sep 28 18:33 openssl-ptest_3.0.5-r0_core2-64.ipk<b=
r>-rw-r--r-- 3 ecordonnier ecordonnier =C2=A0 44M Sep 28 18:33 binutils-dbg=
_2.39-r0_core2-64.ipk<br>-rw-r--r-- 3 ecordonnier ecordonnier =C2=A0 26M Se=
p 28 18:33 perl-ptest_5.36.0-r0_core2-64.ipk<br>-rw-r--r-- 3 ecordonnier ec=
ordonnier =C2=A0 23M Sep 28 18:33 gcc_12.2.0-r0_core2-64.ipk<br>-rw-r--r-- =
3 ecordonnier ecordonnier =C2=A0 15M Sep 28 18:32 elfutils-ptest_0.187-r0_c=
ore2-64.ipk<br>-rw-r--r-- 3 ecordonnier ecordonnier =C2=A0 15M Sep 28 18:33=
 gcc-src_12.2.0-r0_core2-64.ipk<br>-rw-r--r-- 3 ecordonnier ecordonnier =C2=
=A0 13M Sep 28 18:33 coreutils-dbg_9.1-r0_core2-64.ipk<br><br>zstd at level=
 19:<br><br>build$ ls -lh tmp-zstd-level19/deploy/ipk/core2-64/ =C2=A0--sor=
t=3Dsize | head -n10<br>total 1.1G<br>-rw-r--r-- 3 ecordonnier ecordonnier =
=C2=A0241M Sep 28 18:04 gcc-dbg_12.2.0-r0_core2-64.ipk<br>-rw-r--r-- 3 ecor=
donnier ecordonnier =C2=A0213M Sep 28 18:03 openssl-dbg_3.0.5-r0_core2-64.i=
pk<br>-rw-r--r-- 3 ecordonnier ecordonnier =C2=A0 36M Sep 28 17:58 binutils=
-dbg_2.39-r0_core2-64.ipk<br>-rw-r--r-- 3 ecordonnier ecordonnier =C2=A0 30=
M Sep 28 18:00 openssl-ptest_3.0.5-r0_core2-64.ipk<br>-rw-r--r-- 3 ecordonn=
ier ecordonnier =C2=A0 22M Sep 28 17:59 perl-ptest_5.36.0-r0_core2-64.ipk<b=
r>-rw-r--r-- 3 ecordonnier ecordonnier =C2=A0 20M Sep 28 17:58 gcc_12.2.0-r=
0_core2-64.ipk<br>-rw-r--r-- 3 ecordonnier ecordonnier =C2=A0 14M Sep 28 17=
:57 elfutils-ptest_0.187-r0_core2-64.ipk<br>-rw-r--r-- 3 ecordonnier ecordo=
nnier =C2=A0 12M Sep 28 17:58 gcc-src_12.2.0-r0_core2-64.ipk<br>-rw-r--r-- =
3 ecordonnier ecordonnier =C2=A0 12M Sep 28 17:57 g++_12.2.0-r0_core2-64.ip=
k<br><br>xz at level 9 (the default):<br><br>build$ ls -lh tmp-xz/deploy/ip=
k/core2-64/ =C2=A0--sort=3Dsize | head -n10<br>total 963M<br>-rw-r--r-- 3 e=
cordonnier ecordonnier =C2=A0214M Sep 14 10:44 gcc-dbg_12.2.0-r0_core2-64.i=
pk<br>-rw-r--r-- 3 ecordonnier ecordonnier =C2=A0193M Sep 14 10:44 openssl-=
dbg_3.0.5-r0_core2-64.ipk<br>-rw-r--r-- 3 ecordonnier ecordonnier =C2=A0 35=
M Sep 14 10:44 openssl-ptest_3.0.5-r0_core2-64.ipk<br>-rw-r--r-- 3 ecordonn=
ier ecordonnier =C2=A0 32M Sep 14 10:44 binutils-dbg_2.39-r0_core2-64.ipk<b=
r>-rw-r--r-- 3 ecordonnier ecordonnier =C2=A0 20M Sep 14 10:44 perl-ptest_5=
.36.0-r0_core2-64.ipk<br>-rw-r--r-- 3 ecordonnier ecordonnier =C2=A0 19M Se=
p 14 10:44 gcc_12.2.0-r0_core2-64.ipk<br>-rw-r--r-- 3 ecordonnier ecordonni=
er =C2=A0 13M Sep 14 10:44 elfutils-ptest_0.187-r0_core2-64.ipk<br>-rw-r--r=
-- 3 ecordonnier ecordonnier =C2=A0 12M Sep 14 10:44 gcc-src_12.2.0-r0_core=
2-64.ipk<br>-rw-r--r-- 3 ecordonnier ecordonnier =C2=A0 11M Sep 14 10:44 g+=
+_12.2.0-r0_core2-64.ipk<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Sep 14, 2022 at 5:42 PM Khem Raj &lt;=
<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Sep 14, 202=
2 at 8:37 AM Alex Stewart &lt;<a href=3D"mailto:alex.stewart@ni.com" target=
=3D"_blank">alex.stewart@ni.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Thanks for checking.<br>
&gt;<br>
&gt; I&#39;d be interested to know if setting a higher compression level fo=
r zstd<br>
&gt; can get us to a similar compression ratio to xz. If so, then I think i=
t<br>
&gt; could be some real value to distro maintainers to be able to *tune*<br=
>
&gt; their compression.<br>
<br>
yeah it will be interesting to say try something like level 9 but I think t=
imes<br>
might regress with that but it might be good to know the balance and perhap=
s<br>
suggest size mode and performance mode of zstd instead of xz<br>
<br>
&gt;<br>
&gt; That&#39;s not blocking for your new PR though.<br>
&gt;<br>
&gt;<br>
&gt; On 9/14/22 05:08, Etienne Cordonnier wrote:<br>
&gt; &gt; Also note that zstd&#39;s default compression level is 3 per defa=
ult (from<br>
&gt; &gt; a 1 to 19 scale). I did not test other compression levels.<br>
&gt; &gt;<br>
&gt; &gt; On Wed, Sep 14, 2022 at 11:58 AM Etienne Cordonnier<br>
&gt; &gt; &lt;<a href=3D"mailto:ecordonnier@snapchat.com" target=3D"_blank"=
>ecordonnier@snapchat.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0I ran a build of core-image-full-cmdline using=
 xz and zstd, using<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0pre-populated downloads and sstate-cache direc=
tories but with<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0empty tmp directory. Here are the numbers:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0zstd:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0bitbake core-image-full-cmdline took 2m52.768s=
 (real), the<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0resulting directory tmp/deploy/ipk is 1.6GB bi=
g.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0xz:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0bitbake core-image-full-cmdline took 4m14.214s=
 (real), the<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0resulting directory tmp/deploy/ipk/ is 996M bi=
g<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0So the build with xz is 47% slower (254/172) t=
han with zstd for<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0this &quot;incremental build&quot; use-case.<b=
r>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0See the 5 biggest packages, the difference in =
compression-ratio<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0increases with big files:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0build$ ls -lh tmp-zstd/deploy/ipk/core2-64/ --=
sort=3Dsize | head -n5<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0total 1.6G<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0-rw-r--r-- 3 ecordonnier ecordonnier=C2=A0 331=
M Sep 14 10:39<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0gcc-dbg_12.2.0-r0_core2-64.ipk<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0-rw-r--r-- 3 ecordonnier ecordonnier=C2=A0 264=
M Sep 14 10:39<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0openssl-dbg_3.0.5-r0_core2-64.ipk<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0-rw-r--r-- 3 ecordonnier ecordonnier=C2=A0 113=
M Sep 14 10:39<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0openssl-ptest_3.0.5-r0_core2-64.ipk<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0-rw-r--r-- 3 ecordonnier ecordonnier=C2=A0 =C2=
=A047M Sep 14 10:39<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0binutils-dbg_2.39-r0_core2-64.ipk<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0build$ ls -lh tmp-xz/deploy/ipk/core2-64/ --so=
rt=3Dsize | head -n5<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0total 963M<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0-rw-r--r-- 3 ecordonnier ecordonnier=C2=A0 214=
M Sep 14 10:44<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0gcc-dbg_12.2.0-r0_core2-64.ipk<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0-rw-r--r-- 3 ecordonnier ecordonnier=C2=A0 193=
M Sep 14 10:44<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0openssl-dbg_3.0.5-r0_core2-64.ipk<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0-rw-r--r-- 3 ecordonnier ecordonnier=C2=A0 =C2=
=A035M Sep 14 10:44<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0openssl-ptest_3.0.5-r0_core2-64.ipk<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0-rw-r--r-- 3 ecordonnier ecordonnier=C2=A0 =C2=
=A032M Sep 14 10:44<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0binutils-dbg_2.39-r0_core2-64.ipk<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0...<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0I think for use-cases where the size of the ip=
k packages matters,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0xz is better. For use-cases where it does not =
matter (ipk packages<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0not deployed), build-time matters more than co=
mpression-ratio and<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0zstd is better.<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Regarding the enablement of zstd in opkg per d=
efault, I&#39;ll send a<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0new version of the patch without this line.<br=
>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0My thinking for enabling zstd per default in o=
pkg was that zstd is<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0already enabled per default in libarchive&#39;=
s PACKAGECONFIG, and<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0disabling zstd in opkg&#39;s PACKAGECONFIG rem=
oves only a few lines of<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0code from opkg (opkg uses libarchive for doing=
 the actual<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0compression/decompression).<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0On Tue, Sep 13, 2022 at 11:57 PM Alex Stewart<=
br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:alex.stewart@ni.com" tar=
get=3D"_blank">alex.stewart@ni.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0On 9/13/22 15:20, Alex Feinman w=
rote:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I do have some numbers. Whe=
n I was selling this change<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0internally, I<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; did a comparison on our int=
ernal build.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 Combined write IPK times (=CE=A3 t do_package_write_ipk)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; xz=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0162m 35s<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; gz=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A052m 13s<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; zstd=C2=A0 =C2=A0 =C2=A0 =
=C2=A033m 49s<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Compression rate for zstd w=
as closer to xz than to gz but<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0not as good<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; as xz. For systems that hav=
e to cache packages on the device<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; limited storage xz might be=
 a better option, but for the<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bulk of<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; projects zstd is the best c=
hoice<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Additionally, zstd offers m=
uch faster decompression than xz<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0so the<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; rootfs build step that incl=
udes unpacking all of the ipks,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0takes 3m<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; 58s with xz and 2m 44s with=
 zstd.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; One other thing of note - i=
f your build includes debug<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0packages, some<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; may be quite large. E.g. on=
e of our components produces a<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02.2 GB debug<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; package (uncompressed). On =
large files xz requires a<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0disproportionally<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; large amount of time result=
ing in 15 minutes needed to<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0simply write<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; ipk for the abovementioned =
packages, whereas zstd took about<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A045 sec.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; For frequent tasks like bit=
baking a single package this<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0translates in<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; a lot of saved time.<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Those are certainly compelling p=
erformance improvements.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Assuming that<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the final data-segment size is w=
ithin 5%-ish of xz, then I<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0would agree<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with the rest of the thread that=
 it should probably be the<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0contemporary<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default.<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0And if we make it the default co=
mpressor for OE IPKs, then<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0obviously my<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0criticism in the original PR is =
satisfied.<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Bottom line - I think makin=
g xz a default package compressor<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0was not<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; entirely thought through. g=
zip or zstd is what the default<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0should be.<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ZStandard support was only added=
 to opkg last September [1].<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Before<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0that, xz was the new hotness tha=
t replaced gzip. :)<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[1]<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://urldefense.pr=
oofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.org_opkg_commit_-3Fid-3D=
5dead419e94bce2e6b743ad786c1daec0e1aa294&amp;d=3DDwIDaQ&amp;c=3DncDTmphkJTv=
jIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsyDLWdbBqarUz=
Fxz3aALck&amp;m=3DVG_fgpCGq8Zgu73KQP1wTtb1D1TZftNpXj8jGnouPtGIBYyLIZbG8F-85=
POUcVN7&amp;s=3DMwoq2kkjfZhto6J5OomduJ5Rhyg_oSe-dkjeltE4Ls8&amp;e=3D" rel=
=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint.com/v2/url?=
u=3Dhttps-3A__git.yoctoproject.org_opkg_commit_-3Fid-3D5dead419e94bce2e6b74=
3ad786c1daec0e1aa294&amp;d=3DDwIDaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGk=
ICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsyDLWdbBqarUzFxz3aALck&amp;m=3DVG=
_fgpCGq8Zgu73KQP1wTtb1D1TZftNpXj8jGnouPtGIBYyLIZbG8F-85POUcVN7&amp;s=3DMwoq=
2kkjfZhto6J5OomduJ5Rhyg_oSe-dkjeltE4Ls8&amp;e=3D</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefens=
e.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.org_opkg_commit_-3Fi=
d-3D5dead419e94bce2e6b743ad786c1daec0e1aa294&amp;d=3DDwIDaQ&amp;c=3DncDTmph=
kJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsyDLWdbBq=
arUzFxz3aALck&amp;m=3DVG_fgpCGq8Zgu73KQP1wTtb1D1TZftNpXj8jGnouPtGIBYyLIZbG8=
F-85POUcVN7&amp;s=3DMwoq2kkjfZhto6J5OomduJ5Rhyg_oSe-dkjeltE4Ls8&amp;e=3D" r=
el=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint.com/v2/ur=
l?u=3Dhttps-3A__git.yoctoproject.org_opkg_commit_-3Fid-3D5dead419e94bce2e6b=
743ad786c1daec0e1aa294&amp;d=3DDwIDaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabg=
GkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsyDLWdbBqarUzFxz3aALck&amp;m=3D=
VG_fgpCGq8Zgu73KQP1wTtb1D1TZftNpXj8jGnouPtGIBYyLIZbG8F-85POUcVN7&amp;s=3DMw=
oq2kkjfZhto6J5OomduJ5Rhyg_oSe-dkjeltE4Ls8&amp;e=3D</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; One final note: I could not=
 find a reasonable explanation<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for why<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; opkg-tools require code cha=
nges to support a different<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compressor. BSD<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; tar and GNU tar both can ea=
sily accept compressors that they<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0have no<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; idea about (via -I option) =
because all of them provide a<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unified<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; command line interface for =
use in pipes. If this were done<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similar to<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; tar, we could have used any=
 compressor we wanted, including the<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; multithreaded versions (zst=
dmt)<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Well, presumably IPK creation to=
ols can only support the<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0matrix of<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compression algorithms which you=
r opkg binary can decompress.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0I suppose<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0someone could try to implement a=
 plugable compression module<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0system for<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0opkg. But given that nearly ever=
yone uses opkg in an embedded<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0context,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0I&#39;m not sure it would get mu=
ch use.<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; On Tue, Sep 13, 2022 at 12:=
43 PM Khem Raj<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:raj.khem@g=
mail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0On Tue, =
Sep 13, 2022 at 12:19 PM Alex Stewart<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a h=
ref=3D"mailto:alex.stewart@ni.com" target=3D"_blank">alex.stewart@ni.com</a=
>&gt; wrote:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; ACK=
 from me - apart from enabling zstd by default.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; On =
9/13/22 07:37, Etienne Cordonnier via<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://lists.openembe=
dded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a><b=
r>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefens=
e.com/v3/__http://lists.openembedded.org__;!!FbZ0ZwI3Qg!t0JG8eQqpsPs8clofb2=
phwJc6ONCKBjy-iQukKenLRVzBQvJrKTp8VsgKBI7cR8KlV3N64C3fKRHIcFhOF1_vg$" rel=
=3D"noreferrer" target=3D"_blank">https://urldefense.com/v3/__http://lists.=
openembedded.org__;!!FbZ0ZwI3Qg!t0JG8eQqpsPs8clofb2phwJc6ONCKBjy-iQukKenLRV=
zBQvJrKTp8VsgKBI7cR8KlV3N64C3fKRHIcFhOF1_vg$</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"https://urldefen=
se.com/v3/__http://lists.openembedded.org__;!!FbZ0ZwI3Qg!u0KgIth5yNSO1tok49=
C5_xo0QPHIFLa4kZBl3vVZwB-2Ui1uYBW7nt85fKXXM_VAHZ2LdFx_bxrNjvo$" rel=3D"nore=
ferrer" target=3D"_blank">https://urldefense.com/v3/__http://lists.openembe=
dded.org__;!!FbZ0ZwI3Qg!u0KgIth5yNSO1tok49C5_xo0QPHIFLa4kZBl3vVZwB-2Ui1uYBW=
7nt85fKXXM_VAHZ2LdFx_bxrNjvo$</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0wrote:<b=
r>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt=
; This allows the use of zstd for opkg packages by using<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0OPKGBUIL=
DCMD:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt=
; OPKGBUILDCMD =3D &quot;opkg-build -Z zstd&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt=
;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt=
; Signed-off-by: Alex Feinman &lt;<a href=3D"mailto:afeinman@snap.com" targ=
et=3D"_blank">afeinman@snap.com</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt=
; Signed-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.=
com" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt=
; ---<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt=
;=C2=A0 =C2=A0meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.6.0.bb" r=
el=3D"noreferrer" target=3D"_blank">opkg_0.6.0.bb</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefens=
e.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0ZwI3Qg!t0JG8eQqpsPs8clofb2phwJc6ONC=
KBjy-iQukKenLRVzBQvJrKTp8VsgKBI7cR8KlV3N64C3fKRHIcFFmbls2A$" rel=3D"norefer=
rer" target=3D"_blank">https://urldefense.com/v3/__http://opkg_0.6.0.bb__;!=
!FbZ0ZwI3Qg!t0JG8eQqpsPs8clofb2phwJc6ONCKBjy-iQukKenLRVzBQvJrKTp8VsgKBI7cR8=
KlV3N64C3fKRHIcFFmbls2A$</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"https://urldefen=
se.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0ZwI3Qg!u0KgIth5yNSO1tok49C5_xo0QPH=
IFLa4kZBl3vVZwB-2Ui1uYBW7nt85fKXXM_VAHZ2LdFx_-65pBFo$" rel=3D"noreferrer" t=
arget=3D"_blank">https://urldefense.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0Z=
wI3Qg!u0KgIth5yNSO1tok49C5_xo0QPHIFLa4kZBl3vVZwB-2Ui1uYBW7nt85fKXXM_VAHZ2Ld=
Fx_-65pBFo$</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0| 3 ++-<=
br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt=
;=C2=A0 =C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt=
;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt=
; diff --git<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a/meta/recipes-devtools/opkg/<a =
href=3D"http://opkg_0.6.0.bb" rel=3D"noreferrer" target=3D"_blank">opkg_0.6=
.0.bb</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefens=
e.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0ZwI3Qg!t0JG8eQqpsPs8clofb2phwJc6ONC=
KBjy-iQukKenLRVzBQvJrKTp8VsgKBI7cR8KlV3N64C3fKRHIcFFmbls2A$" rel=3D"norefer=
rer" target=3D"_blank">https://urldefense.com/v3/__http://opkg_0.6.0.bb__;!=
!FbZ0ZwI3Qg!t0JG8eQqpsPs8clofb2phwJc6ONCKBjy-iQukKenLRVzBQvJrKTp8VsgKBI7cR8=
KlV3N64C3fKRHIcFFmbls2A$</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"https://urldefen=
se.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0ZwI3Qg!u0KgIth5yNSO1tok49C5_xo0QPH=
IFLa4kZBl3vVZwB-2Ui1uYBW7nt85fKXXM_VAHZ2LdFx_-65pBFo$" rel=3D"noreferrer" t=
arget=3D"_blank">https://urldefense.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0Z=
wI3Qg!u0KgIth5yNSO1tok49C5_xo0QPHIFLa4kZBl3vVZwB-2Ui1uYBW7nt85fKXXM_VAHZ2Ld=
Fx_-65pBFo$</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0b/meta/r=
ecipes-devtools/opkg/<a href=3D"http://opkg_0.6.0.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">opkg_0.6.0.bb</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefens=
e.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0ZwI3Qg!t0JG8eQqpsPs8clofb2phwJc6ONC=
KBjy-iQukKenLRVzBQvJrKTp8VsgKBI7cR8KlV3N64C3fKRHIcFFmbls2A$" rel=3D"norefer=
rer" target=3D"_blank">https://urldefense.com/v3/__http://opkg_0.6.0.bb__;!=
!FbZ0ZwI3Qg!t0JG8eQqpsPs8clofb2phwJc6ONCKBjy-iQukKenLRVzBQvJrKTp8VsgKBI7cR8=
KlV3N64C3fKRHIcFFmbls2A$</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"https://urldefen=
se.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0ZwI3Qg!u0KgIth5yNSO1tok49C5_xo0QPH=
IFLa4kZBl3vVZwB-2Ui1uYBW7nt85fKXXM_VAHZ2LdFx_-65pBFo$" rel=3D"noreferrer" t=
arget=3D"_blank">https://urldefense.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0Z=
wI3Qg!u0KgIth5yNSO1tok49C5_xo0QPHIFLa4kZBl3vVZwB-2Ui1uYBW7nt85fKXXM_VAHZ2Ld=
Fx_-65pBFo$</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt=
; index 7b351e8123..e38d9d6f3f 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt=
; --- a/meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.6.0.bb" rel=3D"=
noreferrer" target=3D"_blank">opkg_0.6.0.bb</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefens=
e.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0ZwI3Qg!t0JG8eQqpsPs8clofb2phwJc6ONC=
KBjy-iQukKenLRVzBQvJrKTp8VsgKBI7cR8KlV3N64C3fKRHIcFFmbls2A$" rel=3D"norefer=
rer" target=3D"_blank">https://urldefense.com/v3/__http://opkg_0.6.0.bb__;!=
!FbZ0ZwI3Qg!t0JG8eQqpsPs8clofb2phwJc6ONCKBjy-iQukKenLRVzBQvJrKTp8VsgKBI7cR8=
KlV3N64C3fKRHIcFFmbls2A$</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"https://urldefen=
se.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0ZwI3Qg!u0KgIth5yNSO1tok49C5_xo0QPH=
IFLa4kZBl3vVZwB-2Ui1uYBW7nt85fKXXM_VAHZ2LdFx_-65pBFo$" rel=3D"noreferrer" t=
arget=3D"_blank">https://urldefense.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0Z=
wI3Qg!u0KgIth5yNSO1tok49C5_xo0QPHIFLa4kZBl3vVZwB-2Ui1uYBW7nt85fKXXM_VAHZ2Ld=
Fx_-65pBFo$</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt=
; +++ b/meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.6.0.bb" rel=3D"=
noreferrer" target=3D"_blank">opkg_0.6.0.bb</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefens=
e.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0ZwI3Qg!t0JG8eQqpsPs8clofb2phwJc6ONC=
KBjy-iQukKenLRVzBQvJrKTp8VsgKBI7cR8KlV3N64C3fKRHIcFFmbls2A$" rel=3D"norefer=
rer" target=3D"_blank">https://urldefense.com/v3/__http://opkg_0.6.0.bb__;!=
!FbZ0ZwI3Qg!t0JG8eQqpsPs8clofb2phwJc6ONCKBjy-iQukKenLRVzBQvJrKTp8VsgKBI7cR8=
KlV3N64C3fKRHIcFFmbls2A$</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"https://urldefen=
se.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0ZwI3Qg!u0KgIth5yNSO1tok49C5_xo0QPH=
IFLa4kZBl3vVZwB-2Ui1uYBW7nt85fKXXM_VAHZ2LdFx_-65pBFo$" rel=3D"noreferrer" t=
arget=3D"_blank">https://urldefense.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0Z=
wI3Qg!u0KgIth5yNSO1tok49C5_xo0QPHIFLa4kZBl3vVZwB-2Ui1uYBW7nt85fKXXM_VAHZ2Ld=
Fx_-65pBFo$</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt=
; @@ -30,7 +30,7 @@ inherit autotools pkgconfig ptest<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt=
;=C2=A0 =C2=A0target_localstatedir :=3D &quot;${localstatedir}&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt=
;=C2=A0 =C2=A0OPKGLIBDIR ??=3D &quot;${target_localstatedir}/lib&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt=
;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt=
; -PACKAGECONFIG ??=3D &quot;libsolv&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt=
; +PACKAGECONFIG ??=3D &quot;libsolv zstd&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Bui=
lding in zstd support by default is a little<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0suspect to me.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Unl=
ess I&#39;m mistaken, OE-core will only build<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xz-compressed IPKs by<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; def=
ault. So zstd support would be unnecessary for a distro<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0integrat=
or<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; who=
 just uses upstream OE-core.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; For=
 distros which use zstd compression in their<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0packages, I think it<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; wou=
ld be more appropriate to overwrite the opkg<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PACKAGECONFIG in a<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; .bb=
append.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0This is =
perhaps fine. I do wonder if there is some<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0performance<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0comparis=
on data between xz and zstd compressed ipks<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0with opk=
g, it might help users on making this choice and<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0also if we<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0should c=
onsider using<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0zstd by =
default at some point or not.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Is =
there something I&#39;m not considering here?<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt=
;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt=
;=C2=A0 =C2=A0PACKAGECONFIG[gpg] =3D &quot;--enable-gpg,--disable-gpg,\<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt=
;=C2=A0 =C2=A0 =C2=A0 =C2=A0gnupg gpgme libgpg-error,\<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt=
; @@ -39,6 +39,7 @@ PACKAGECONFIG[gpg] =3D<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&quot;--=
enable-gpg,--disable-gpg,\<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt=
;=C2=A0 =C2=A0PACKAGECONFIG[curl] =3D<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;--enable-curl,--disable-cu=
rl,curl&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt=
;=C2=A0 =C2=A0PACKAGECONFIG[ssl-curl] =3D<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&quot;--=
enable-ssl-curl,--disable-ssl-curl,curl openssl&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt=
;=C2=A0 =C2=A0PACKAGECONFIG[sha256] =3D<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;--enable-sha256,--disable-=
sha256&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt=
; +PACKAGECONFIG[zstd] =3D<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;--enable-zstd,--disable-zs=
td,zstd&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt=
;=C2=A0 =C2=A0PACKAGECONFIG[libsolv] =3D<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&quot;--=
with-libsolv,--without-libsolv,libsolv&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt=
;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt=
;=C2=A0 =C2=A0EXTRA_OECONF:class-native =3D<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 &quot;--localstatedir=
=3D/${@os.path.relpath(&#39;${localstatedir}&#39;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&#39;${S=
TAGING_DIR_NATIVE}&#39;)}<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0--syscon=
fdir=3D/${@os.path.relpath(&#39;${sysconfdir}&#39;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&#39;${S=
TAGING_DIR_NATIVE}&#39;)}&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt=
;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt=
;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt=
;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; --<=
br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Ale=
x Stewart<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Sof=
tware Engineer - NI Real-Time OS<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; NI =
(National Instruments)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; <a =
href=3D"mailto:alex.stewart@ni.com" target=3D"_blank">alex.stewart@ni.com</=
a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; -=
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Lin=
ks: You receive all messages sent to this group.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Vie=
w/Reply Online (#170608):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://urldefense.pr=
oofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dc=
ore_message_170608&amp;d=3DDwIBaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkIC=
C2epckfdiw&amp;r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0&amp;m=3DKvCR=
yrKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&amp;s=3D_VWADu=
vDS3QdSEYWTnh8wNH0lOxVHty18QZynvOtpcU&amp;e=3D" rel=3D"noreferrer" target=
=3D"_blank">https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.op=
enembedded.org_g_openembedded-2Dcore_message_170608&amp;d=3DDwIBaQ&amp;c=3D=
ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DixV5wgZimxpcSCog35wonZK=
eFaeEVKUbESWNj_K-1j0&amp;m=3DKvCRyrKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1Cpnr=
IJ78DBxgMrvY25Gwyh&amp;s=3D_VWADuvDS3QdSEYWTnh8wNH0lOxVHty18QZynvOtpcU&amp;=
e=3D</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefens=
e.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded=
-2Dcore_message_170608&amp;d=3DDwIBaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabg=
GkICC2epckfdiw&amp;r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0&amp;m=3D=
KvCRyrKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&amp;s=3D_V=
WADuvDS3QdSEYWTnh8wNH0lOxVHty18QZynvOtpcU&amp;e=3D" rel=3D"noreferrer" targ=
et=3D"_blank">https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.=
openembedded.org_g_openembedded-2Dcore_message_170608&amp;d=3DDwIBaQ&amp;c=
=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DixV5wgZimxpcSCog35wo=
nZKeFaeEVKUbESWNj_K-1j0&amp;m=3DKvCRyrKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1C=
pnrIJ78DBxgMrvY25Gwyh&amp;s=3D_VWADuvDS3QdSEYWTnh8wNH0lOxVHty18QZynvOtpcU&a=
mp;e=3D</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"https://urldefen=
se.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedde=
d-2Dcore_message_170608&amp;d=3DDwIBaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvab=
gGkICC2epckfdiw&amp;r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0&amp;m=
=3DKvCRyrKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&amp;s=
=3D_VWADuvDS3QdSEYWTnh8wNH0lOxVHty18QZynvOtpcU&amp;e=3D" rel=3D"noreferrer"=
 target=3D"_blank">https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__l=
ists.openembedded.org_g_openembedded-2Dcore_message_170608&amp;d=3DDwIBaQ&a=
mp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DixV5wgZimxpcSCog=
35wonZKeFaeEVKUbESWNj_K-1j0&amp;m=3DKvCRyrKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo=
_I1CpnrIJ78DBxgMrvY25Gwyh&amp;s=3D_VWADuvDS3QdSEYWTnh8wNH0lOxVHty18QZynvOtp=
cU&amp;e=3D</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefens=
e.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded=
-2Dcore_message_170608&amp;d=3DDwIBaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabg=
GkICC2epckfdiw&amp;r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0&amp;m=3D=
KvCRyrKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&amp;s=3D_V=
WADuvDS3QdSEYWTnh8wNH0lOxVHty18QZynvOtpcU&amp;e=3D" rel=3D"noreferrer" targ=
et=3D"_blank">https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.=
openembedded.org_g_openembedded-2Dcore_message_170608&amp;d=3DDwIBaQ&amp;c=
=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DixV5wgZimxpcSCog35wo=
nZKeFaeEVKUbESWNj_K-1j0&amp;m=3DKvCRyrKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1C=
pnrIJ78DBxgMrvY25Gwyh&amp;s=3D_VWADuvDS3QdSEYWTnh8wNH0lOxVHty18QZynvOtpcU&a=
mp;e=3D</a>&gt;&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Mut=
e This Topic:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://urldefense.pr=
oofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_mt_93654146_199791=
4&amp;d=3DDwIBaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=
=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0&amp;m=3DKvCRyrKojziBs0h9aEjE=
fI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&amp;s=3DQncdL2I_pCDsz7AMbsTgSt=
zC7bt5V2x_E_gIblrtjZY&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https:=
//urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_mt_=
93654146_1997914&amp;d=3DDwIBaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2=
epckfdiw&amp;r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0&amp;m=3DKvCRyr=
KojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&amp;s=3DQncdL2I_=
pCDsz7AMbsTgStzC7bt5V2x_E_gIblrtjZY&amp;e=3D</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefens=
e.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_mt_93654146_19=
97914&amp;d=3DDwIBaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&am=
p;r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0&amp;m=3DKvCRyrKojziBs0h9a=
EjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&amp;s=3DQncdL2I_pCDsz7AMbsT=
gStzC7bt5V2x_E_gIblrtjZY&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">htt=
ps://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_=
mt_93654146_1997914&amp;d=3DDwIBaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkI=
CC2epckfdiw&amp;r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0&amp;m=3DKvC=
RyrKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&amp;s=3DQncdL=
2I_pCDsz7AMbsTgStzC7bt5V2x_E_gIblrtjZY&amp;e=3D</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"https://urldefen=
se.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_mt_93654146_1=
997914&amp;d=3DDwIBaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&a=
mp;r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0&amp;m=3DKvCRyrKojziBs0h9=
aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&amp;s=3DQncdL2I_pCDsz7AMbs=
TgStzC7bt5V2x_E_gIblrtjZY&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">ht=
tps://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org=
_mt_93654146_1997914&amp;d=3DDwIBaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGk=
ICC2epckfdiw&amp;r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0&amp;m=3DKv=
CRyrKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&amp;s=3DQncd=
L2I_pCDsz7AMbsTgStzC7bt5V2x_E_gIblrtjZY&amp;e=3D</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefens=
e.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_mt_93654146_19=
97914&amp;d=3DDwIBaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&am=
p;r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0&amp;m=3DKvCRyrKojziBs0h9a=
EjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&amp;s=3DQncdL2I_pCDsz7AMbsT=
gStzC7bt5V2x_E_gIblrtjZY&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">htt=
ps://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_=
mt_93654146_1997914&amp;d=3DDwIBaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkI=
CC2epckfdiw&amp;r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0&amp;m=3DKvC=
RyrKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&amp;s=3DQncdL=
2I_pCDsz7AMbsTgStzC7bt5V2x_E_gIblrtjZY&amp;e=3D</a>&gt;&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Gro=
up Owner:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:openembedded-c=
ore%2Bowner@lists.openembedded.org" target=3D"_blank">openembedded-core+own=
er@lists.openembedded.org</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:ope=
nembedded-core%252Bowner@lists.openembedded.org" target=3D"_blank">openembe=
dded-core%2Bowner@lists.openembedded.org</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&lt;mail=
to:<a href=3D"mailto:openembedded-core%252Bowner@lists.openembedded.org" ta=
rget=3D"_blank">openembedded-core%2Bowner@lists.openembedded.org</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:ope=
nembedded-core%25252Bowner@lists.openembedded.org" target=3D"_blank">openem=
bedded-core%252Bowner@lists.openembedded.org</a>&gt;&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Uns=
ubscribe:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://urldefense.pr=
oofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dc=
ore_unsub&amp;d=3DDwIBaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdi=
w&amp;r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0&amp;m=3DKvCRyrKojziBs=
0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&amp;s=3DPxAE_3yGzbSZ21-=
LHz_1r3gd2_STPoZcrYDeu9vd_GM&amp;e=3D" rel=3D"noreferrer" target=3D"_blank"=
>https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.=
org_g_openembedded-2Dcore_unsub&amp;d=3DDwIBaQ&amp;c=3DncDTmphkJTvjIDPh0hpF=
_4vCHvabgGkICC2epckfdiw&amp;r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0=
&amp;m=3DKvCRyrKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&a=
mp;s=3DPxAE_3yGzbSZ21-LHz_1r3gd2_STPoZcrYDeu9vd_GM&amp;e=3D</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefens=
e.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded=
-2Dcore_unsub&amp;d=3DDwIBaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epc=
kfdiw&amp;r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0&amp;m=3DKvCRyrKoj=
ziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&amp;s=3DPxAE_3yGzbS=
Z21-LHz_1r3gd2_STPoZcrYDeu9vd_GM&amp;e=3D" rel=3D"noreferrer" target=3D"_bl=
ank">https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembed=
ded.org_g_openembedded-2Dcore_unsub&amp;d=3DDwIBaQ&amp;c=3DncDTmphkJTvjIDPh=
0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K=
-1j0&amp;m=3DKvCRyrKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gw=
yh&amp;s=3DPxAE_3yGzbSZ21-LHz_1r3gd2_STPoZcrYDeu9vd_GM&amp;e=3D</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"https://urldefen=
se.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedde=
d-2Dcore_unsub&amp;d=3DDwIBaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2ep=
ckfdiw&amp;r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0&amp;m=3DKvCRyrKo=
jziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&amp;s=3DPxAE_3yGzb=
SZ21-LHz_1r3gd2_STPoZcrYDeu9vd_GM&amp;e=3D" rel=3D"noreferrer" target=3D"_b=
lank">https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembe=
dded.org_g_openembedded-2Dcore_unsub&amp;d=3DDwIBaQ&amp;c=3DncDTmphkJTvjIDP=
h0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_=
K-1j0&amp;m=3DKvCRyrKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25G=
wyh&amp;s=3DPxAE_3yGzbSZ21-LHz_1r3gd2_STPoZcrYDeu9vd_GM&amp;e=3D</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefens=
e.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded=
-2Dcore_unsub&amp;d=3DDwIBaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epc=
kfdiw&amp;r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0&amp;m=3DKvCRyrKoj=
ziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&amp;s=3DPxAE_3yGzbS=
Z21-LHz_1r3gd2_STPoZcrYDeu9vd_GM&amp;e=3D" rel=3D"noreferrer" target=3D"_bl=
ank">https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembed=
ded.org_g_openembedded-2Dcore_unsub&amp;d=3DDwIBaQ&amp;c=3DncDTmphkJTvjIDPh=
0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K=
-1j0&amp;m=3DKvCRyrKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gw=
yh&amp;s=3DPxAE_3yGzbSZ21-LHz_1r3gd2_STPoZcrYDeu9vd_GM&amp;e=3D</a>&gt;&gt;=
<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 [<a hre=
f=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>]<b=
r>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; -=
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Alex Stewart<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Software Engineer - NI Real-Time=
 OS<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NI (National Instruments)<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:alex.stewart@n=
i.com" target=3D"_blank">alex.stewart@ni.com</a><br>
&gt; &gt;<br>
&gt;<br>
&gt; --<br>
&gt; Alex Stewart<br>
&gt; Software Engineer - NI Real-Time OS<br>
&gt; NI (National Instruments)<br>
&gt;<br>
&gt; <a href=3D"mailto:alex.stewart@ni.com" target=3D"_blank">alex.stewart@=
ni.com</a><br>
&gt;<br>
</blockquote></div>

--000000000000746a4805e9bf8f77--

