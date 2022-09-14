Return-Path: <ecordonnier@snapchat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E7F2ECAAD8
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 10:09:03 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web12.4466.1663150138765157705
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 03:08:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snapchat.com header.s=google header.b=Ox2Xg8QU;
 spf=pass (domain: snapchat.com, ip: 209.85.128.47,
 mailfrom: ecordonnier@snapchat.com)
Received: by mail-wm1-f47.google.com with SMTP id
 n40-20020a05600c3ba800b003b49aefc35fso1920227wms.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 03:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snapchat.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=xVuMgiroZLHYa9qeY8hkTLhKePAkETotnln5WhO8Z88=;
        b=Ox2Xg8QUZfcrH3SDioZr2RD8sqLFj5tqIe6fpAop4bBQNammnDy+AgxW281xAWCIG7
         g1NeGpCHjOJBu5LUjfl1rXM2P6DPmjga73cZLCV/0sXKKGxJz2fNmqaA729PSoIesQJQ
         eQin012cZbZPYaTRErPQZQnNvgwnMo98Cr1VE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=xVuMgiroZLHYa9qeY8hkTLhKePAkETotnln5WhO8Z88=;
        b=wwQCdzHYWYGQau3pK5zE0u6EUG/dvDdoh6qrUAUlSvAC3kzX21ABGU2+bnP3sKWqs9
         o+Z8zDunJbXWx0hURkGvohN6ysoTwSagFh4t9uRkTMonngFsTK0EwZ8ddWsZUZEji32r
         mYWGOi37iHpnZQk+gcCoUK9yB+x/01EOLXduHmJNjBFRpTwsMEXslhPaUxgxqzMGrHaA
         ymg8ZJUgU0gHGkSI6CZOW0Gk3T9k5HWWdoX1SQjgrCHy8VmNe9n39GQdx7YLRwm7yQny
         iGJgUrh85kJFc5qkBuOZf/FHmeXpruWfBZV06paB1zCvCsaxdsU7iw3w6vXs+evBAwgB
         enqQ==
X-Gm-Message-State: ACgBeo3GLCDA2ekTGvFlU4XOQr1b065McIESf9tNkWx8XBUp7CQncTxv
	ZNv/ncOZKh1VIvG8K2W2b+yQxsVc8v2T8UzKLICGtA==
X-Google-Smtp-Source: 
 AA6agR5X1+KYxM/+JEFhooPYpZUn6DHg7haI0eKDeJj1raqQBqgvOuHcBKunBSVf9ATU11Uu6tBINmdl63Gqm0SUfY4=
X-Received: by 2002:a7b:c2a9:0:b0:3a6:2400:722c with SMTP id
 c9-20020a7bc2a9000000b003a62400722cmr2438000wmk.108.1663150137152; Wed, 14
 Sep 2022 03:08:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220913123741.3416807-1-ecordonnier@snap.com>
 <a29c5799-9964-526d-d9e3-6a4f28cb1bc3@ni.com>
 <CAMKF1srWRB4vLNjtS+aaY=w2wcx-Y+Gt7gMFPVhftWx84+J1RA@mail.gmail.com>
 <CANOoYsMVb9YpfwjTNHv4kSARM15_3T34CA-Ekr=t7P5F0XO4bA@mail.gmail.com>
 <24771ab1-ada9-fd2a-059f-4960b6b2e073@ni.com>
 <CAHUKmYa_CPg+2uX9Yz00ATDNfEJzvcc28eJVUNeBn1+=UY4dDA@mail.gmail.com>
In-Reply-To: 
 <CAHUKmYa_CPg+2uX9Yz00ATDNfEJzvcc28eJVUNeBn1+=UY4dDA@mail.gmail.com>
From: Etienne Cordonnier <ecordonnier@snapchat.com>
Date: Wed, 14 Sep 2022 12:08:45 +0200
Message-ID: 
 <CAHUKmYa-=GFHwZUEjTfDb5gyDf8KH8MFM6bm3GCU6xpA6ppVkw@mail.gmail.com>
Subject: Re: Re: [OE-core] [PATCH] opkg: enable zstd support
To: Alex Stewart <alex.stewart@ni.com>
Cc: Alex Feinman <afeinman@snap.com>, Khem Raj <raj.khem@gmail.com>,
	openembedded-core@lists.openembedded.org,
	Etienne Cordonnier <ecordonnier@snap.com>
Content-Type: multipart/alternative; boundary="00000000000022420905e8a0516d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 10:09:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170653

--00000000000022420905e8a0516d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Also note that zstd's default compression level is 3 per default (from a 1
to 19 scale). I did not test other compression levels.

On Wed, Sep 14, 2022 at 11:58 AM Etienne Cordonnier <
ecordonnier@snapchat.com> wrote:

> I ran a build of core-image-full-cmdline using xz and zstd, using
> pre-populated downloads and sstate-cache directories but with empty tmp
> directory. Here are the numbers:
> zstd:
> bitbake core-image-full-cmdline took 2m52.768s (real), the resulting
> directory tmp/deploy/ipk is 1.6GB big.
> xz:
> bitbake core-image-full-cmdline took 4m14.214s (real), the resulting
> directory tmp/deploy/ipk/ is 996M big
>
> So the build with xz is 47% slower (254/172) than with zstd for this
> "incremental build" use-case.
>
> See the 5 biggest packages, the difference in compression-ratio increases
> with big files:
> build$ ls -lh tmp-zstd/deploy/ipk/core2-64/ --sort=3Dsize | head -n5
> total 1.6G
> -rw-r--r-- 3 ecordonnier ecordonnier  331M Sep 14 10:39
> gcc-dbg_12.2.0-r0_core2-64.ipk
> -rw-r--r-- 3 ecordonnier ecordonnier  264M Sep 14 10:39
> openssl-dbg_3.0.5-r0_core2-64.ipk
> -rw-r--r-- 3 ecordonnier ecordonnier  113M Sep 14 10:39
> openssl-ptest_3.0.5-r0_core2-64.ipk
> -rw-r--r-- 3 ecordonnier ecordonnier   47M Sep 14 10:39
> binutils-dbg_2.39-r0_core2-64.ipk
> build$ ls -lh tmp-xz/deploy/ipk/core2-64/ --sort=3Dsize | head -n5
> total 963M
> -rw-r--r-- 3 ecordonnier ecordonnier  214M Sep 14 10:44
> gcc-dbg_12.2.0-r0_core2-64.ipk
> -rw-r--r-- 3 ecordonnier ecordonnier  193M Sep 14 10:44
> openssl-dbg_3.0.5-r0_core2-64.ipk
> -rw-r--r-- 3 ecordonnier ecordonnier   35M Sep 14 10:44
> openssl-ptest_3.0.5-r0_core2-64.ipk
> -rw-r--r-- 3 ecordonnier ecordonnier   32M Sep 14 10:44
> binutils-dbg_2.39-r0_core2-64.ipk
> ...
>
> I think for use-cases where the size of the ipk packages matters, xz is
> better. For use-cases where it does not matter (ipk packages not deployed=
),
> build-time matters more than compression-ratio and zstd is better.
>
> Regarding the enablement of zstd in opkg per default, I'll send a new
> version of the patch without this line.
> My thinking for enabling zstd per default in opkg was that zstd is alread=
y
> enabled per default in libarchive's PACKAGECONFIG, and disabling zstd in
> opkg's PACKAGECONFIG removes only a few lines of code from opkg (opkg use=
s
> libarchive for doing the actual compression/decompression).
>
> On Tue, Sep 13, 2022 at 11:57 PM Alex Stewart <alex.stewart@ni.com> wrote=
:
>
>>
>>
>> On 9/13/22 15:20, Alex Feinman wrote:
>> > I do have some numbers. When I was selling this change internally, I
>> > did a comparison on our internal build.
>> >            Combined write IPK times (=CE=A3 t do_package_write_ipk)
>> > xz         162m 35s
>> > gz         52m 13s
>> > zstd       33m 49s
>> > Compression rate for zstd was closer to xz than to gz but not as good
>> > as xz. For systems that have to cache packages on the device with
>> > limited storage xz might be a better option, but for the bulk of
>> > projects zstd is the best choice
>> > Additionally, zstd offers much faster decompression than xz so the
>> > rootfs build step that includes unpacking all of the ipks, takes 3m
>> > 58s with xz and 2m 44s with zstd.
>> > One other thing of note - if your build includes debug packages, some
>> > may be quite large. E.g. one of our components produces a 2.2 GB debug
>> > package (uncompressed). On large files xz requires a disproportionally
>> > large amount of time resulting in 15 minutes needed to simply write
>> > ipk for the abovementioned packages, whereas zstd took about 45 sec.
>> > For frequent tasks like bitbaking a single package this translates in
>> > a lot of saved time.
>>
>> Those are certainly compelling performance improvements. Assuming that
>> the final data-segment size is within 5%-ish of xz, then I would agree
>> with the rest of the thread that it should probably be the contemporary
>> default.
>>
>> And if we make it the default compressor for OE IPKs, then obviously my
>> criticism in the original PR is satisfied.
>>
>> > Bottom line - I think making xz a default package compressor was not
>> > entirely thought through. gzip or zstd is what the default should be.
>>
>> ZStandard support was only added to opkg last September [1]. Before
>> that, xz was the new hotness that replaced gzip. :)
>>
>> [1]
>>
>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.=
org_opkg_commit_-3Fid-3D5dead419e94bce2e6b743ad786c1daec0e1aa294&d=3DDwIDaQ=
&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9Ts=
yDLWdbBqarUzFxz3aALck&m=3DVG_fgpCGq8Zgu73KQP1wTtb1D1TZftNpXj8jGnouPtGIBYyLI=
ZbG8F-85POUcVN7&s=3DMwoq2kkjfZhto6J5OomduJ5Rhyg_oSe-dkjeltE4Ls8&e=3D
>>
>>
>> > One final note: I could not find a reasonable explanation for why
>> > opkg-tools require code changes to support a different compressor. BSD
>> > tar and GNU tar both can easily accept compressors that they have no
>> > idea about (via -I option) because all of them provide a unified
>> > command line interface for use in pipes. If this were done similar to
>> > tar, we could have used any compressor we wanted, including the
>> > multithreaded versions (zstdmt)
>>
>> Well, presumably IPK creation tools can only support the matrix of
>> compression algorithms which your opkg binary can decompress. I suppose
>> someone could try to implement a plugable compression module system for
>> opkg. But given that nearly everyone uses opkg in an embedded context,
>> I'm not sure it would get much use.
>>
>> >
>> > On Tue, Sep 13, 2022 at 12:43 PM Khem Raj <raj.khem@gmail.com> wrote:
>> >
>> >     On Tue, Sep 13, 2022 at 12:19 PM Alex Stewart
>> >     <alex.stewart@ni.com> wrote:
>> >     >
>> >     > ACK from me - apart from enabling zstd by default.
>> >     >
>> >     > On 9/13/22 07:37, Etienne Cordonnier via lists.openembedded.org
>> >     <
>> https://urldefense.com/v3/__http://lists.openembedded.org__;!!FbZ0ZwI3Qg=
!u0KgIth5yNSO1tok49C5_xo0QPHIFLa4kZBl3vVZwB-2Ui1uYBW7nt85fKXXM_VAHZ2LdFx_bx=
rNjvo$
>> >
>> >     wrote:
>> >     > > This allows the use of zstd for opkg packages by using
>> >     OPKGBUILDCMD:
>> >     > > OPKGBUILDCMD =3D "opkg-build -Z zstd"
>> >     > >
>> >     > > Signed-off-by: Alex Feinman <afeinman@snap.com>
>> >     > > Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
>> >     > > ---
>> >     > >   meta/recipes-devtools/opkg/opkg_0.6.0.bb
>> >     <
>> https://urldefense.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0ZwI3Qg!u0KgIth5=
yNSO1tok49C5_xo0QPHIFLa4kZBl3vVZwB-2Ui1uYBW7nt85fKXXM_VAHZ2LdFx_-65pBFo$
>> >
>> >     | 3 ++-
>> >     > >   1 file changed, 2 insertions(+), 1 deletion(-)
>> >     > >
>> >     > > diff --git a/meta/recipes-devtools/opkg/opkg_0.6.0.bb
>> >     <
>> https://urldefense.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0ZwI3Qg!u0KgIth5=
yNSO1tok49C5_xo0QPHIFLa4kZBl3vVZwB-2Ui1uYBW7nt85fKXXM_VAHZ2LdFx_-65pBFo$
>> >
>> >     b/meta/recipes-devtools/opkg/opkg_0.6.0.bb
>> >     <
>> https://urldefense.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0ZwI3Qg!u0KgIth5=
yNSO1tok49C5_xo0QPHIFLa4kZBl3vVZwB-2Ui1uYBW7nt85fKXXM_VAHZ2LdFx_-65pBFo$
>> >
>> >     > > index 7b351e8123..e38d9d6f3f 100644
>> >     > > --- a/meta/recipes-devtools/opkg/opkg_0.6.0.bb
>> >     <
>> https://urldefense.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0ZwI3Qg!u0KgIth5=
yNSO1tok49C5_xo0QPHIFLa4kZBl3vVZwB-2Ui1uYBW7nt85fKXXM_VAHZ2LdFx_-65pBFo$
>> >
>> >     > > +++ b/meta/recipes-devtools/opkg/opkg_0.6.0.bb
>> >     <
>> https://urldefense.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0ZwI3Qg!u0KgIth5=
yNSO1tok49C5_xo0QPHIFLa4kZBl3vVZwB-2Ui1uYBW7nt85fKXXM_VAHZ2LdFx_-65pBFo$
>> >
>> >     > > @@ -30,7 +30,7 @@ inherit autotools pkgconfig ptest
>> >     > >   target_localstatedir :=3D "${localstatedir}"
>> >     > >   OPKGLIBDIR ??=3D "${target_localstatedir}/lib"
>> >     > >
>> >     > > -PACKAGECONFIG ??=3D "libsolv"
>> >     > > +PACKAGECONFIG ??=3D "libsolv zstd"
>> >     >
>> >     > Building in zstd support by default is a little suspect to me.
>> >     >
>> >     > Unless I'm mistaken, OE-core will only build xz-compressed IPKs =
by
>> >     > default. So zstd support would be unnecessary for a distro
>> >     integrator
>> >     > who just uses upstream OE-core.
>> >     >
>> >     > For distros which use zstd compression in their packages, I thin=
k
>> it
>> >     > would be more appropriate to overwrite the opkg PACKAGECONFIG in=
 a
>> >     > .bbappend.
>> >     >
>> >
>> >     This is perhaps fine. I do wonder if there is some performance
>> >     comparison data between xz and zstd compressed ipks
>> >     with opkg, it might help users on making this choice and also if w=
e
>> >     should consider using
>> >     zstd by default at some point or not.
>> >
>> >     > Is there something I'm not considering here?
>> >     >
>> >     > >
>> >     > >   PACKAGECONFIG[gpg] =3D "--enable-gpg,--disable-gpg,\
>> >     > >       gnupg gpgme libgpg-error,\
>> >     > > @@ -39,6 +39,7 @@ PACKAGECONFIG[gpg] =3D
>> >     "--enable-gpg,--disable-gpg,\
>> >     > >   PACKAGECONFIG[curl] =3D "--enable-curl,--disable-curl,curl"
>> >     > >   PACKAGECONFIG[ssl-curl] =3D
>> >     "--enable-ssl-curl,--disable-ssl-curl,curl openssl"
>> >     > >   PACKAGECONFIG[sha256] =3D "--enable-sha256,--disable-sha256"
>> >     > > +PACKAGECONFIG[zstd] =3D "--enable-zstd,--disable-zstd,zstd"
>> >     > >   PACKAGECONFIG[libsolv] =3D
>> >     "--with-libsolv,--without-libsolv,libsolv"
>> >     > >
>> >     > >   EXTRA_OECONF:class-native =3D
>> >     "--localstatedir=3D/${@os.path.relpath('${localstatedir}',
>> >     '${STAGING_DIR_NATIVE}')}
>> >     --sysconfdir=3D/${@os.path.relpath('${sysconfdir}',
>> >     '${STAGING_DIR_NATIVE}')}"
>> >     > >
>> >     > >
>> >     > >
>> >     >
>> >     > --
>> >     > Alex Stewart
>> >     > Software Engineer - NI Real-Time OS
>> >     > NI (National Instruments)
>> >     >
>> >     > alex.stewart@ni.com
>> >     >
>> >     >
>> >     > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >     > Links: You receive all messages sent to this group.
>> >     > View/Reply Online (#170608):
>> >
>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedde=
d.org_g_openembedded-2Dcore_message_170608&d=3DDwIBaQ&c=3DncDTmphkJTvjIDPh0=
hpF_4vCHvabgGkICC2epckfdiw&r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0&=
m=3DKvCRyrKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&s=3D_V=
WADuvDS3QdSEYWTnh8wNH0lOxVHty18QZynvOtpcU&e=3D
>> >     <
>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedde=
d.org_g_openembedded-2Dcore_message_170608&d=3DDwIBaQ&c=3DncDTmphkJTvjIDPh0=
hpF_4vCHvabgGkICC2epckfdiw&r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0&=
m=3DKvCRyrKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&s=3D_V=
WADuvDS3QdSEYWTnh8wNH0lOxVHty18QZynvOtpcU&e=3D
>> >
>> >
>> >     > Mute This Topic:
>> >
>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedde=
d.org_mt_93654146_1997914&d=3DDwIBaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC=
2epckfdiw&r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0&m=3DKvCRyrKojziBs=
0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&s=3DQncdL2I_pCDsz7AMbsT=
gStzC7bt5V2x_E_gIblrtjZY&e=3D
>> >     <
>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedde=
d.org_mt_93654146_1997914&d=3DDwIBaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC=
2epckfdiw&r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0&m=3DKvCRyrKojziBs=
0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&s=3DQncdL2I_pCDsz7AMbsT=
gStzC7bt5V2x_E_gIblrtjZY&e=3D
>> >
>> >
>> >     > Group Owner: openembedded-core+owner@lists.openembedded.org
>> >     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>> >     > Unsubscribe:
>> >
>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedde=
d.org_g_openembedded-2Dcore_unsub&d=3DDwIBaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHv=
abgGkICC2epckfdiw&r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0&m=3DKvCRy=
rKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&s=3DPxAE_3yGzbS=
Z21-LHz_1r3gd2_STPoZcrYDeu9vd_GM&e=3D
>> >     <
>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedde=
d.org_g_openembedded-2Dcore_unsub&d=3DDwIBaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHv=
abgGkICC2epckfdiw&r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0&m=3DKvCRy=
rKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&s=3DPxAE_3yGzbS=
Z21-LHz_1r3gd2_STPoZcrYDeu9vd_GM&e=3D
>> >
>> >      [raj.khem@gmail.com]
>> >     > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >     >
>> >
>>
>> --
>> Alex Stewart
>> Software Engineer - NI Real-Time OS
>> NI (National Instruments)
>>
>> alex.stewart@ni.com
>>
>>

--00000000000022420905e8a0516d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Also note that zstd&#39;s default compression level is 3 p=
er default (from a 1 to 19 scale). I did not test other compression levels.=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Wed, Sep 14, 2022 at 11:58 AM Etienne Cordonnier &lt;<a href=3D"mailto:e=
cordonnier@snapchat.com">ecordonnier@snapchat.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">I ran a b=
uild of=C2=A0core-image-full-cmdline using xz and zstd, using pre-populated=
 downloads and sstate-cache directories but with empty tmp directory. Here =
are the numbers:<br>zstd:<br>bitbake core-image-full-cmdline took=C2=A02m52=
.768s (real), the resulting directory tmp/deploy/ipk is 1.6GB big.<br>xz:<b=
r>bitbake core-image-full-cmdline took=C2=A04m14.214s (real), the resulting=
 directory=C2=A0tmp/deploy/ipk/ is 996M	big<br><br>So the build with xz is =
47% slower (254/172) than with zstd for this &quot;incremental build&quot; =
use-case.<br><br>See the 5 biggest packages, the difference in compression-=
ratio increases with big files:<br>build$ ls -lh tmp-zstd/deploy/ipk/core2-=
64/ --sort=3Dsize | head -n5<br>total 1.6G<br>-rw-r--r-- 3 ecordonnier ecor=
donnier =C2=A0331M Sep 14 10:39 gcc-dbg_12.2.0-r0_core2-64.ipk<br>-rw-r--r-=
- 3 ecordonnier ecordonnier =C2=A0264M Sep 14 10:39 openssl-dbg_3.0.5-r0_co=
re2-64.ipk<br>-rw-r--r-- 3 ecordonnier ecordonnier =C2=A0113M Sep 14 10:39 =
openssl-ptest_3.0.5-r0_core2-64.ipk<br>-rw-r--r-- 3 ecordonnier ecordonnier=
 =C2=A0 47M Sep 14 10:39 binutils-dbg_2.39-r0_core2-64.ipk<br>build$ ls -lh=
 tmp-xz/deploy/ipk/core2-64/ --sort=3Dsize | head -n5<br>total 963M<br>-rw-=
r--r-- 3 ecordonnier ecordonnier =C2=A0214M Sep 14 10:44 gcc-dbg_12.2.0-r0_=
core2-64.ipk<br>-rw-r--r-- 3 ecordonnier ecordonnier =C2=A0193M Sep 14 10:4=
4 openssl-dbg_3.0.5-r0_core2-64.ipk<br>-rw-r--r-- 3 ecordonnier ecordonnier=
 =C2=A0 35M Sep 14 10:44 openssl-ptest_3.0.5-r0_core2-64.ipk<br>-rw-r--r-- =
3 ecordonnier ecordonnier =C2=A0 32M Sep 14 10:44 binutils-dbg_2.39-r0_core=
2-64.ipk<br>...<br><br>I think for use-cases where the size of the ipk pack=
ages matters, xz is better. For use-cases where it does not matter (ipk pac=
kages not deployed), build-time matters more than compression-ratio and zst=
d is better.<br><br>Regarding the enablement of zstd in opkg per default, I=
&#39;ll send a new version of the patch without this line.<br>My thinking f=
or enabling zstd per default in opkg was that zstd is already enabled per d=
efault in libarchive&#39;s PACKAGECONFIG, and disabling zstd in opkg&#39;s =
PACKAGECONFIG removes only a few lines of code from opkg (opkg uses libarch=
ive for doing the actual compression/decompression).</div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 13, 2022 at=
 11:57 PM Alex Stewart &lt;<a href=3D"mailto:alex.stewart@ni.com" target=3D=
"_blank">alex.stewart@ni.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex"><br>
<br>
On 9/13/22 15:20, Alex Feinman wrote:<br>
&gt; I do have some numbers. When I was selling this change internally, I <=
br>
&gt; did a comparison on our internal build.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Combined write IPK times (=CE=
=A3 t do_package_write_ipk)<br>
&gt; xz=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0162m 35s<br>
&gt; gz=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A052m 13s<br>
&gt; zstd=C2=A0 =C2=A0 =C2=A0 =C2=A033m 49s<br>
&gt; Compression rate for zstd was closer to xz than to gz but not as good =
<br>
&gt; as xz. For systems that have to cache packages=C2=A0on the device with=
 <br>
&gt; limited storage xz might be a better=C2=A0option, but for the bulk of =
<br>
&gt; projects zstd is the best choice<br>
&gt; Additionally, zstd offers much faster decompression than xz so the <br=
>
&gt; rootfs build step that includes unpacking all of the ipks, takes 3m <b=
r>
&gt; 58s with xz and 2m 44s with zstd.<br>
&gt; One other thing of note - if your build includes debug packages, some =
<br>
&gt; may be quite large. E.g. one of our components produces a 2.2 GB debug=
 <br>
&gt; package (uncompressed). On large files xz requires a disproportionally=
 <br>
&gt; large amount of time resulting in 15 minutes needed to simply write <b=
r>
&gt; ipk for the abovementioned packages, whereas zstd took about 45 sec. <=
br>
&gt; For frequent tasks like bitbaking a single package this translates in =
<br>
&gt; a lot of saved time.<br>
<br>
Those are certainly compelling performance improvements. Assuming that <br>
the final data-segment size is within 5%-ish of xz, then I would agree <br>
with the rest of the thread that it should probably be the contemporary <br=
>
default.<br>
<br>
And if we make it the default compressor for OE IPKs, then obviously my <br=
>
criticism in the original PR is satisfied.<br>
<br>
&gt; Bottom line - I think making xz a default package compressor was not <=
br>
&gt; entirely thought through. gzip or zstd is what the default should be.<=
br>
<br>
ZStandard support was only added to opkg last September [1]. Before <br>
that, xz was the new hotness that replaced gzip. :)<br>
<br>
[1] <br>
<a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yocto=
project.org_opkg_commit_-3Fid-3D5dead419e94bce2e6b743ad786c1daec0e1aa294&am=
p;d=3DDwIDaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAh=
kbNonVuMIGRfPx_Qj9TsyDLWdbBqarUzFxz3aALck&amp;m=3DVG_fgpCGq8Zgu73KQP1wTtb1D=
1TZftNpXj8jGnouPtGIBYyLIZbG8F-85POUcVN7&amp;s=3DMwoq2kkjfZhto6J5OomduJ5Rhyg=
_oSe-dkjeltE4Ls8&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://url=
defense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.org_opkg_commi=
t_-3Fid-3D5dead419e94bce2e6b743ad786c1daec0e1aa294&amp;d=3DDwIDaQ&amp;c=3Dn=
cDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsyD=
LWdbBqarUzFxz3aALck&amp;m=3DVG_fgpCGq8Zgu73KQP1wTtb1D1TZftNpXj8jGnouPtGIBYy=
LIZbG8F-85POUcVN7&amp;s=3DMwoq2kkjfZhto6J5OomduJ5Rhyg_oSe-dkjeltE4Ls8&amp;e=
=3D</a>=C2=A0 <br>
<br>
&gt; One final note: I could not find a reasonable explanation for why <br>
&gt; opkg-tools require code changes to support a different compressor. BSD=
 <br>
&gt; tar and GNU tar both can easily accept compressors that they have no <=
br>
&gt; idea about (via -I option) because all of them provide a unified <br>
&gt; command line interface for use in pipes. If this were done similar to =
<br>
&gt; tar, we could have used any compressor we wanted, including the <br>
&gt; multithreaded versions (zstdmt)<br>
<br>
Well, presumably IPK creation tools can only support the matrix of <br>
compression algorithms which your opkg binary can decompress. I suppose <br=
>
someone could try to implement a plugable compression module system for <br=
>
opkg. But given that nearly everyone uses opkg in an embedded context, <br>
I&#39;m not sure it would get much use.<br>
<br>
&gt;<br>
&gt; On Tue, Sep 13, 2022 at 12:43 PM Khem Raj &lt;<a href=3D"mailto:raj.kh=
em@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0On Tue, Sep 13, 2022 at 12:19 PM Alex Stewart<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:alex.stewart@ni.com" target=
=3D"_blank">alex.stewart@ni.com</a>&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; ACK from me - apart from enabling zstd by defa=
ult.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; On 9/13/22 07:37, Etienne Cordonnier via <a hr=
ef=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">l=
ists.openembedded.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefense.com/v3/__http://l=
ists.openembedded.org__;!!FbZ0ZwI3Qg!u0KgIth5yNSO1tok49C5_xo0QPHIFLa4kZBl3v=
VZwB-2Ui1uYBW7nt85fKXXM_VAHZ2LdFx_bxrNjvo$" rel=3D"noreferrer" target=3D"_b=
lank">https://urldefense.com/v3/__http://lists.openembedded.org__;!!FbZ0ZwI=
3Qg!u0KgIth5yNSO1tok49C5_xo0QPHIFLa4kZBl3vVZwB-2Ui1uYBW7nt85fKXXM_VAHZ2LdFx=
_bxrNjvo$</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; This allows the use of zstd for opkg pack=
ages by using<br>
&gt;=C2=A0 =C2=A0 =C2=A0OPKGBUILDCMD:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; OPKGBUILDCMD =3D &quot;opkg-build -Z zstd=
&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; Signed-off-by: Alex Feinman &lt;<a href=
=3D"mailto:afeinman@snap.com" target=3D"_blank">afeinman@snap.com</a>&gt;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; Signed-off-by: Etienne Cordonnier &lt;<a =
href=3D"mailto:ecordonnier@snap.com" target=3D"_blank">ecordonnier@snap.com=
</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;=C2=A0 =C2=A0meta/recipes-devtools/opkg/<a=
 href=3D"http://opkg_0.6.0.bb" rel=3D"noreferrer" target=3D"_blank">opkg_0.=
6.0.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefense.com/v3/__http://o=
pkg_0.6.0.bb__;!!FbZ0ZwI3Qg!u0KgIth5yNSO1tok49C5_xo0QPHIFLa4kZBl3vVZwB-2Ui1=
uYBW7nt85fKXXM_VAHZ2LdFx_-65pBFo$" rel=3D"noreferrer" target=3D"_blank">htt=
ps://urldefense.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0ZwI3Qg!u0KgIth5yNSO1t=
ok49C5_xo0QPHIFLa4kZBl3vVZwB-2Ui1uYBW7nt85fKXXM_VAHZ2LdFx_-65pBFo$</a>&gt;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0| 3 ++-<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;=C2=A0 =C2=A01 file changed, 2 insertions(=
+), 1 deletion(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; diff --git a/meta/recipes-devtools/opkg/<=
a href=3D"http://opkg_0.6.0.bb" rel=3D"noreferrer" target=3D"_blank">opkg_0=
.6.0.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefense.com/v3/__http://o=
pkg_0.6.0.bb__;!!FbZ0ZwI3Qg!u0KgIth5yNSO1tok49C5_xo0QPHIFLa4kZBl3vVZwB-2Ui1=
uYBW7nt85fKXXM_VAHZ2LdFx_-65pBFo$" rel=3D"noreferrer" target=3D"_blank">htt=
ps://urldefense.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0ZwI3Qg!u0KgIth5yNSO1t=
ok49C5_xo0QPHIFLa4kZBl3vVZwB-2Ui1uYBW7nt85fKXXM_VAHZ2LdFx_-65pBFo$</a>&gt;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools/opkg/<a href=3D"http://opkg=
_0.6.0.bb" rel=3D"noreferrer" target=3D"_blank">opkg_0.6.0.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefense.com/v3/__http://o=
pkg_0.6.0.bb__;!!FbZ0ZwI3Qg!u0KgIth5yNSO1tok49C5_xo0QPHIFLa4kZBl3vVZwB-2Ui1=
uYBW7nt85fKXXM_VAHZ2LdFx_-65pBFo$" rel=3D"noreferrer" target=3D"_blank">htt=
ps://urldefense.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0ZwI3Qg!u0KgIth5yNSO1t=
ok49C5_xo0QPHIFLa4kZBl3vVZwB-2Ui1uYBW7nt85fKXXM_VAHZ2LdFx_-65pBFo$</a>&gt;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; index 7b351e8123..e38d9d6f3f 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; --- a/meta/recipes-devtools/opkg/<a href=
=3D"http://opkg_0.6.0.bb" rel=3D"noreferrer" target=3D"_blank">opkg_0.6.0.b=
b</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefense.com/v3/__http://o=
pkg_0.6.0.bb__;!!FbZ0ZwI3Qg!u0KgIth5yNSO1tok49C5_xo0QPHIFLa4kZBl3vVZwB-2Ui1=
uYBW7nt85fKXXM_VAHZ2LdFx_-65pBFo$" rel=3D"noreferrer" target=3D"_blank">htt=
ps://urldefense.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0ZwI3Qg!u0KgIth5yNSO1t=
ok49C5_xo0QPHIFLa4kZBl3vVZwB-2Ui1uYBW7nt85fKXXM_VAHZ2LdFx_-65pBFo$</a>&gt;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; +++ b/meta/recipes-devtools/opkg/<a href=
=3D"http://opkg_0.6.0.bb" rel=3D"noreferrer" target=3D"_blank">opkg_0.6.0.b=
b</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefense.com/v3/__http://o=
pkg_0.6.0.bb__;!!FbZ0ZwI3Qg!u0KgIth5yNSO1tok49C5_xo0QPHIFLa4kZBl3vVZwB-2Ui1=
uYBW7nt85fKXXM_VAHZ2LdFx_-65pBFo$" rel=3D"noreferrer" target=3D"_blank">htt=
ps://urldefense.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0ZwI3Qg!u0KgIth5yNSO1t=
ok49C5_xo0QPHIFLa4kZBl3vVZwB-2Ui1uYBW7nt85fKXXM_VAHZ2LdFx_-65pBFo$</a>&gt;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; @@ -30,7 +30,7 @@ inherit autotools pkgco=
nfig ptest<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;=C2=A0 =C2=A0target_localstatedir :=3D &qu=
ot;${localstatedir}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;=C2=A0 =C2=A0OPKGLIBDIR ??=3D &quot;${targ=
et_localstatedir}/lib&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; -PACKAGECONFIG ??=3D &quot;libsolv&quot;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; +PACKAGECONFIG ??=3D &quot;libsolv zstd&q=
uot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Building in zstd support by default is a littl=
e suspect to me.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Unless I&#39;m mistaken, OE-core will only bui=
ld xz-compressed IPKs by<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; default. So zstd support would be unnecessary =
for a distro<br>
&gt;=C2=A0 =C2=A0 =C2=A0integrator<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; who just uses upstream OE-core.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; For distros which use zstd compression in thei=
r packages, I think it<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; would be more appropriate to overwrite the opk=
g PACKAGECONFIG in a<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; .bbappend.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0This is perhaps fine. I do wonder if there is some =
performance<br>
&gt;=C2=A0 =C2=A0 =C2=A0comparison data between xz and zstd compressed ipks=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0with opkg, it might help users on making this choic=
e and also if we<br>
&gt;=C2=A0 =C2=A0 =C2=A0should consider using<br>
&gt;=C2=A0 =C2=A0 =C2=A0zstd by default at some point or not.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Is there something I&#39;m not considering her=
e?<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;=C2=A0 =C2=A0PACKAGECONFIG[gpg] =3D &quot;=
--enable-gpg,--disable-gpg,\<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0gnupg gpgme lib=
gpg-error,\<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; @@ -39,6 +39,7 @@ PACKAGECONFIG[gpg] =3D<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;--enable-gpg,--disable-gpg,\<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;=C2=A0 =C2=A0PACKAGECONFIG[curl] =3D &quot=
;--enable-curl,--disable-curl,curl&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;=C2=A0 =C2=A0PACKAGECONFIG[ssl-curl] =3D<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;--enable-ssl-curl,--disable-ssl-curl,curl ope=
nssl&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;=C2=A0 =C2=A0PACKAGECONFIG[sha256] =3D &qu=
ot;--enable-sha256,--disable-sha256&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; +PACKAGECONFIG[zstd] =3D &quot;--enable-z=
std,--disable-zstd,zstd&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;=C2=A0 =C2=A0PACKAGECONFIG[libsolv] =3D<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;--with-libsolv,--without-libsolv,libsolv&quot=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;=C2=A0 =C2=A0EXTRA_OECONF:class-native =3D=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;--localstatedir=3D/${@os.path.relpath(&#39;${=
localstatedir}&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;${STAGING_DIR_NATIVE}&#39;)}<br>
&gt;=C2=A0 =C2=A0 =C2=A0--sysconfdir=3D/${@os.path.relpath(&#39;${sysconfdi=
r}&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;${STAGING_DIR_NATIVE}&#39;)}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; --<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Alex Stewart<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Software Engineer - NI Real-Time OS<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; NI (National Instruments)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; <a href=3D"mailto:alex.stewart@ni.com" target=
=3D"_blank">alex.stewart@ni.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Links: You receive all messages sent to this g=
roup.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; View/Reply Online (#170608):<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://urldefense.proofpoint.com/v2/url=
?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_message_170608&=
amp;d=3DDwIBaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3D=
ixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0&amp;m=3DKvCRyrKojziBs0h9aEjEfI4=
R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&amp;s=3D_VWADuvDS3QdSEYWTnh8wNH0l=
OxVHty18QZynvOtpcU&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://u=
rldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_open=
embedded-2Dcore_message_170608&amp;d=3DDwIBaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_=
4vCHvabgGkICC2epckfdiw&amp;r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0&=
amp;m=3DKvCRyrKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&am=
p;s=3D_VWADuvDS3QdSEYWTnh8wNH0lOxVHty18QZynvOtpcU&amp;e=3D</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefense.proofpoint.com/v2=
/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_message_170=
608&amp;d=3DDwIBaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;=
r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0&amp;m=3DKvCRyrKojziBs0h9aEj=
EfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&amp;s=3D_VWADuvDS3QdSEYWTnh8w=
NH0lOxVHty18QZynvOtpcU&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https=
://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_=
openembedded-2Dcore_message_170608&amp;d=3DDwIBaQ&amp;c=3DncDTmphkJTvjIDPh0=
hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-=
1j0&amp;m=3DKvCRyrKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwy=
h&amp;s=3D_VWADuvDS3QdSEYWTnh8wNH0lOxVHty18QZynvOtpcU&amp;e=3D</a>&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Mute This Topic:<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://urldefense.proofpoint.com/v2/url=
?u=3Dhttps-3A__lists.openembedded.org_mt_93654146_1997914&amp;d=3DDwIBaQ&am=
p;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DixV5wgZimxpcSCog3=
5wonZKeFaeEVKUbESWNj_K-1j0&amp;m=3DKvCRyrKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_=
I1CpnrIJ78DBxgMrvY25Gwyh&amp;s=3DQncdL2I_pCDsz7AMbsTgStzC7bt5V2x_E_gIblrtjZ=
Y&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpo=
int.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_mt_93654146_1997914&amp=
;d=3DDwIBaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DixV=
5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0&amp;m=3DKvCRyrKojziBs0h9aEjEfI4R_J=
4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&amp;s=3DQncdL2I_pCDsz7AMbsTgStzC7bt5=
V2x_E_gIblrtjZY&amp;e=3D</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefense.proofpoint.com/v2=
/url?u=3Dhttps-3A__lists.openembedded.org_mt_93654146_1997914&amp;d=3DDwIBa=
Q&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DixV5wgZimxpcS=
Cog35wonZKeFaeEVKUbESWNj_K-1j0&amp;m=3DKvCRyrKojziBs0h9aEjEfI4R_J4FnZIK8nDB=
qKo_I1CpnrIJ78DBxgMrvY25Gwyh&amp;s=3DQncdL2I_pCDsz7AMbsTgStzC7bt5V2x_E_gIbl=
rtjZY&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.pro=
ofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_mt_93654146_1997914=
&amp;d=3DDwIBaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=
=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0&amp;m=3DKvCRyrKojziBs0h9aEjE=
fI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&amp;s=3DQncdL2I_pCDsz7AMbsTgSt=
zC7bt5V2x_E_gIblrtjZY&amp;e=3D</a>&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Group Owner: <a href=3D"mailto:openembedded-co=
re%2Bowner@lists.openembedded.org" target=3D"_blank">openembedded-core+owne=
r@lists.openembedded.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:openembedded-core%252B=
owner@lists.openembedded.org" target=3D"_blank">openembedded-core%2Bowner@l=
ists.openembedded.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Unsubscribe:<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://urldefense.proofpoint.com/v2/url=
?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_unsub&amp;d=3DD=
wIBaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DixV5wgZim=
xpcSCog35wonZKeFaeEVKUbESWNj_K-1j0&amp;m=3DKvCRyrKojziBs0h9aEjEfI4R_J4FnZIK=
8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&amp;s=3DPxAE_3yGzbSZ21-LHz_1r3gd2_STPoZcrY=
Deu9vd_GM&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense=
.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-=
2Dcore_unsub&amp;d=3DDwIBaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epck=
fdiw&amp;r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0&amp;m=3DKvCRyrKojz=
iBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&amp;s=3DPxAE_3yGzbSZ=
21-LHz_1r3gd2_STPoZcrYDeu9vd_GM&amp;e=3D</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefense.proofpoint.com/v2=
/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_unsub&amp;d=
=3DDwIBaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DixV5w=
gZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0&amp;m=3DKvCRyrKojziBs0h9aEjEfI4R_J4F=
nZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&amp;s=3DPxAE_3yGzbSZ21-LHz_1r3gd2_STPo=
ZcrYDeu9vd_GM&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldef=
ense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembed=
ded-2Dcore_unsub&amp;d=3DDwIBaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2=
epckfdiw&amp;r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0&amp;m=3DKvCRyr=
KojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&amp;s=3DPxAE_3yG=
zbSZ21-LHz_1r3gd2_STPoZcrYDeu9vd_GM&amp;e=3D</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0[<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;<br>
<br>
-- <br>
Alex Stewart<br>
Software Engineer - NI Real-Time OS<br>
NI (National Instruments)<br>
<br>
<a href=3D"mailto:alex.stewart@ni.com" target=3D"_blank">alex.stewart@ni.co=
m</a><br>
<br>
</blockquote></div>
</blockquote></div>

--00000000000022420905e8a0516d--

