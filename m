Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57ECFC021B2
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 16:26:17 +0000 (UTC)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
 by mx.groups.io with SMTP id smtpd.web11.972.1740068775997887075
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Feb 2025 08:26:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NJpyBCpJ;
 spf=pass (domain: gmail.com, ip: 209.85.217.49, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4be60963da5so769435137.2
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 08:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740068775; x=1740673575; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JXe3MUuhh9bcRM1a2+OWPlQrxVF7EqcJoaeY6m/9pDI=;
        b=NJpyBCpJ/4yBQx3TScWR3oi0Z3pdV3ahhCXHZ9sYCDGoYtsyzfg0hR/OjfRJuvm73n
         3M9PSmbfg0MDn90ZEP/s8hm/tCswmyRm2c1dowqs/0CuWAGMlW77H8j8wkJy/gNpmzgl
         lRdld9z2qP2qC9o7wdynMmdSmDDaLE7IXroRS58SLIuGrVxbwv4dFhwkO3XR/zz3M8ZV
         BGuYEE/hlpzB9RLcOgEXyC2+5/bsAlWDWThjwHGfZbdcSqKiztG/kuUTgdnHD3tKo+4N
         tGW7sbPUkLBZ3dmcd75yPdo/SLRNwnH3pqO4EaRxtjGMlD6oPsTXBWS1c+2y9TEXc1ON
         7wVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740068775; x=1740673575;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JXe3MUuhh9bcRM1a2+OWPlQrxVF7EqcJoaeY6m/9pDI=;
        b=ZdKi/zDQbiE9MiG/qWfaITE+y426U0MGzOn5mKO3DOrtdsk/IKyU9Kj2S2FKA28vZ6
         cG3Y0domtKMrByRqXi7OqfZD2VzMOSDnby1Xkv+VB4HTOrnwecuRU1DsVyjz3GXFZro3
         aWrTovWX10TIRTmQ3rShThM4GzTo5UYY9mOGQZGBzBiYbjAJ++edgnJywmsERyQotRXu
         Yn2eCfLerCUB3nPut/UWse5+KP2sEQfrFYfBEJkJothik07PkLALU+VPr9o1SUEG1EMm
         h27A8aHitXAPw7/TdAzYkuqmAD+HVQRKkPPMYJE7QeJFhHmoY6sOsydYHP+dhd+Ee7aO
         zGzg==
X-Forwarded-Encrypted: i=1; AJvYcCVEZHpFVLxu0bwzBugyTqsVA6m1BL9qQA0y4EacAKSiz6tpp1Rh2um8JTuYgGYVBPD1mJ64vNAgYnQDACb/Ds4vbA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyE24oVJiZphbtiyFtWjs5hUDVk44Y0stbFAZbd5w8TUAlE73W1
	H8QAUMwDteDbGopZu+XiNMzmml+5oPw/Y4yVq1x8/hpDYw0QXv+ZIxPOFps6GD7UPPz9OU/Ynkv
	/8DfUF/3x5DGsH7amY8Os3XAkccw=
X-Gm-Gg: ASbGnct3ZOlgvVfpaglnS9+LMROD/9F36UYDHdQYXGJhRvDJckpCkQ3DpdYmvtTnvn4
	ORmAI8OVrG7E7ChogDYVVAMDXqt26xJsPkZm2i3O/ywvkSRPZxIpaGPT//Z0l6hMu7TBH2KJzar
	k=
X-Google-Smtp-Source: AGHT+IFh/9mBVUmekhDJHbklEmta9Ztwlp3L04CFCQNAc7B/kQBGArKfJ6GeRU0l31aGbX3fHP94bQUR+0velt4jP+M=
X-Received: by 2002:a05:6102:419e:b0:4ba:99b5:60f5 with SMTP id
 ada2fe7eead31-4bd3fe8ce26mr13849852137.23.1740068774842; Thu, 20 Feb 2025
 08:26:14 -0800 (PST)
MIME-Version: 1.0
References: <VcVL.1739730983448118565.i0SN@lists.openembedded.org>
 <e82e9be5-9a56-4c22-ba44-90c8e6690d99@cherry.de> <86f57755-bad6-49ad-a1b6-d0dceaf5344b@denx.de>
 <c1fdfe98-90cd-44e4-9c5a-fe5d73ac49b4@toradex.com> <CANPvuRnkwX3ptjj6W8kZMjkXbUz=2qa=3nJvzxcrY_CYkBQRYA@mail.gmail.com>
 <91fdc65ed3eff19e0f02c3a3b6c4f5001380769b.camel@phytec.de>
In-Reply-To: <91fdc65ed3eff19e0f02c3a3b6c4f5001380769b.camel@phytec.de>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 20 Feb 2025 16:26:01 +0000
X-Gm-Features: AWEUYZmO63kzzLhYfLGphoA0297MmLAHtoHpX8xHuqWGqf5bVXbMy4EdNTL8dD4
Message-ID: <CANPvuRkNmht8HBfB8AC7cBf3WHuLxav4Q8GPrFw5M+SU3Vk4Uw@mail.gmail.com>
Subject: Re: [OE-core] Broken FIT image signing since "u-boot:
 kernel-fitimage: Fix dependency loop if UBOOT_SIGN_ENABLE and UBOOT_ENV enabled"
To: Leonard Anderweit <L.Anderweit@phytec.de>
Cc: "rogerio.borin@toradex.com" <rogerio.borin@toradex.com>, 
	"quentin.schulz@cherry.de" <quentin.schulz@cherry.de>, "marex@denx.de" <marex@denx.de>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"adrian.freihofer@siemens.com" <adrian.freihofer@siemens.com>, 
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="0000000000003599a9062e955518"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 16:26:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211771

--0000000000003599a9062e955518
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Leonard,

I will test on my side and then I'll come back with the results.

Thanks

Jose

Leonard Anderweit <L.Anderweit@phytec.de> escreveu (quinta, 20/02/2025 =C3=
=A0(s)
14:42):

> Hi,
>
> I've also noticed this bug and sent patch [1] to fix it.
>
> [1] https://lists.openembedded.org/g/openembedded-core/message/211761
>
> Leonard
>
> Am Donnerstag, dem 20.02.2025 um 10:46 +0000 schrieb Jose Quaresma via
> lists.openembedded.org:
> > Hi,
> >
> > Any news about this regression?
> > If we don't get a fix for this bug asap maybe we should revert and
> > drop this patch since it broke our scarthgap stable LTS
> >
> > Jose
> >
> >
> > Rogerio Guerra Borin via lists.openembedded.org
> > <rogerio.borin=3Dtoradex.com@lists.openembedded.org> escreveu (ter=C3=
=A7a,
> > 18/02/2025 =C3=A0(s) 03:49):
> > > > This message originated from outside your organization
> > > >
> > > > On 2/17/25 11:34 AM, Quentin Schulz wrote:
> > > >   > +Cc Marek
> > > >
> > > > Hi,
> > >
> > > Thanks for the quick answer!
> > >
> > > >
> > > >   > On 2/16/25 7:36 PM, Rogerio Guerra Borin via
> > > > lists.openembedded.org
> > > > wrote:
> > > >   >> You don't often get email from
> > > >   >> rogerio.borin=3Dtoradex.com@lists.openembedded.org. Learn why
> > > > this is
> > > >   >> important<https://aka.ms/LearnAboutSenderIdentification
> > > > <https://aka.ms/LearnAboutSenderIdentification>>
> > > >   >> Hello,
> > > >   >>
> > > >   >> At Toradex we're using class "kernel-fitimage" to produce
> > > > our signed
> > > >   >> kernel FIT images and we've found that the recent commit
> > > > d7bd9c627661
> > > >   >> ("u-boot: kernel-fitimage: Fix dependency loop if
> > > > UBOOT_SIGN_ENABLE
> > > >   >> and UBOOT_ENV enabled") broke our builds. The logs of a
> > > > failed build
> > > >   >> show the following message that I found noteworthy:
> > > >
> > > > Can you mail me the entire log file for completeness ?
> > >
> > > Sure.
> > >
> > > I've added it as attachment
> > > (log.do_uboot_assemble_fitimage.841485).
> > >
> > > >   >> log.do_uboot_assemble_fitimage.841485:
> > > >   >> ...
> > > >   >> Couldn't open RSA private key: '/secboot-data/fit-
> > > > keys/dev2.key': No
> > > >   >> such file or directory
> > > >   >>
> > > >   >> The odd thing was that the build was setting:
> > > >   >>
> > > >   >> UBOOT_SIGN_KEYNAME =3D "dev"
> > > >   >> UBOOT_SIGN_IMG_KEYNAME =3D "dev2"
> > > >   >> FIT_SIGN_INDIVIDUAL =3D "0"
> > > >   >> FIT_GENERATE_KEYS =3D "0"
> > > >
> > > > FIT_SIGN_INDIVIDUAL =3D "0" is correct, you do want to sign
> > > > configurations, not individual images in the fitImage, because
> > > > signing
> > > > individual images is susceptible to mix-and-match attack.
> > > >
> > > >   >>  From the above we see the individual images signing is
> > > > disabled but
> > > >   >> the system is trying to access the key file for the
> > > > individual signing
> > > >   >> (dev2) regardless of that. Checking the code in uboot-
> > > > sign.bbclass I
> > > >   >> found this line:
> > > >   >>
> > > >   >>
> > > > https://git.openembedded.org/openembedded-core/tree/meta/classes-
> > > > <
> > > > https://git.openembedded.org/openembedded-core/tree/meta/classes-
> > > > >
> > > >   >> recipe/uboot-sign.bbclass?h=3Dscarthgap#n116
> > > >   >>
> > > >   >> that is responsible for that access (inside function
> > > > concat_dtb()).
> > > >   >> The code is always referencing variable
> > > > UBOOT_SIGN_IMG_KEYNAME
> > > >   >> regardless of FIT_SIGN_INDIVIDUAL being set to "1" or "0"
> > > > even though
> > > >   >> there's a condition a couple lines above L116 where
> > > >   >> FIT_SIGN_INDIVIDUAL is tested to decide in which mode to run
> > > > the
> > > >   >> signing tool.
> > > >
> > > > Uh, good find, does the following patch fix your problem ?
> > > >
> > > > """
> > > > diff --git a/meta/classes-recipe/uboot-sign.bbclass
> > > > b/meta/classes-recipe/uboot-sign.bbclass
> > > > index 96c47ab016..74ef5697ca 100644
> > > > --- a/meta/classes-recipe/uboot-sign.bbclass
> > > > +++ b/meta/classes-recipe/uboot-sign.bbclass
> > > > @@ -107,13 +107,16 @@ concat_dtb() {
> > > > # makes fitImage susceptible to mix-and-match attack.
> > > > if [ "${FIT_SIGN_INDIVIDUAL}" =3D "1" ] ; then
> > > > UBOOT_MKIMAGE_MODE=3D"auto"
> > > > + UBOOT_MKIMAGE_KEYNAME=3D${UBOOT_SIGN_IMG_KEYNAME}
> > > > + else
> > > > + UBOOT_MKIMAGE_KEYNAME=3D${UBOOT_SIGN_KEYNAME}
> > > > fi
> > > > ${UBOOT_MKIMAGE_SIGN} \
> > > > ${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if
> > > > len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
> > > > -f $UBOOT_MKIMAGE_MODE \
> > > > -k "${UBOOT_SIGN_KEYDIR}" \
> > > > -o "${FIT_HASH_ALG},${FIT_SIGN_ALG}" \
> > > > - -g "${UBOOT_SIGN_IMG_KEYNAME}" \
> > > > + -g "$UBOOT_MKIMAGE_KEYNAME" \
> > > > -K "${UBOOT_DTB_BINARY}" \
> > > > -d /dev/null \
> > > > -r ${B}/unused.itb \
> > > > """
> > >
> > > Looking at the patch I'm pretty sure it would solve my problem,
> > > particularly because we set FIT_SIGN_INDIVIDUAL=3D"0" in our builds.
> > > However, I see it keeps the concept of the signing being either on
> > > the
> > > config or on the individual images, which I wanted to further
> > > comment
> > > down below.
> > >
> > > >   >> To better understand the behavior I created dev2.
> > > >   >> {key,crt} files and retried a build which worked. However,
> > > > checking
> > > >   >> the contents of the final u-boot.dtb file I found that the
> > > > "dev2" key
> > > >   >> node was present but the "dev" key wasn't. Then, checking
> > > > the contents
> > > >   >> of the final fitImage I noticed the configuration nodes were
> > > > signed by
> > > >   >> the dev key while the individual images were not signed (as
> > > > expected).
> > > >   >> But that means such a system wouldn't boot since the
> > > > required "dev"
> > > >   >> key is not present in the U-Boot DTB, from what I conclude
> > > > the FIT
> > > >   >> signing is broken at the moment.
> > > >   >>
> > > >   >> So, first of all I wanted to let you guys know about this
> > > > issue
> > > >   >> (hoping we're not doing anything wrong with our builds).
> > > >
> > > > No, your builds are fine, this is a real bug.
> > >
> > > Thanks for the confirmation.
> > >
> > > >   >> As a second point, I wanted to confirm the expected behavior
> > > > regarding
> > > >   >> variable FIT_SIGN_INDIVIDUAL. According to the
> > > > documentation:
> > > >   >>
> > > >   >>
> > > > https://docs.yoctoproject.org/5.0.6/ref-manual/variables.html#term
> > > > -
> > > > <
> > > > https://docs.yoctoproject.org/5.0.6/ref-manual/variables.html#term
> > > > ->
> > > >   >> FIT_SIGN_INDIVIDUAL
> > > >   >>
> > > >   >> when its value is "1" the individual images will be signed
> > > > *in
> > > >   >> addition* to the FIT image being signed.
> > > >
> > > > That is a bit weird and no, I don't think that is how it is
> > > > supposed to
> > > > work.
> > > >
> > > > FIT_SIGN_INDIVIDUAL=3D1 -> only image subnodes in fitImage /images
> > > > nodes
> > > > are signed AND fitImage is susceptible to mix-and-match attack
> > > > (basically attacker can replace individual signed images in
> > > > fitImage
> > > > with different individual signed images, e.g. with older
> > > > versions, to
> > > > achieve a combination of images which allows them to somehow
> > > > break the
> > > > system).
> > > >
> > > > FIT_SIGN_INDIVIDUAL=3D0 (recommended) -> images are hashed,
> > > > configurations
> > > > are hashed, hashes are combined and signed. Because images and
> > > > configurations (which images are to be used together) are signed,
> > > > attacker cannot mix-and-match images into an un-allowed
> > > > configuration.
> > > >
> > > >   >> From that, I understand that
> > > >   >> the configurations will be always signed and the individual
> > > > images may
> > > >   >> or may not be signed depending on FIT_SIGN_INDIVIDUAL.
> > > >
> > > > The other way around. The configurations are signed by default,
> > > > which is
> > > > good, but this can be disabled if needed (unlikely).
> > > >
> > > >   >> I kind of
> > > >   >> confirmed this behavior by checking our build artifacts on
> > > > kirkstone:
> > > >   >> with FIT_SIGN_INDIVIDUAL=3D"0" the U-Boot DTB has only the
> > > > "dev" key and
> > > >   >> the fit image is signed by that same key; with
> > > > FIT_SIGN_INDIVIDUAL=3D"1"
> > > >   >> both keys are present in the DTB, the configurations are
> > > > signed by the
> > > >   >> "dev" key and the images by the "dev2" key. I understand
> > > > this is the
> > > >   >> correct behavior, right?
> > > >
> > > > Images shouldn't be signed by different keys than configurations,
> > > > that
> > > > is a bit odd.
> > > >
> > > >   >> I'm asking because looking at the comment at:
> > > >   >>
> > > >   >>
> > > > https://git.openembedded.org/openembedded-core/tree/meta/classes-
> > > > <
> > > > https://git.openembedded.org/openembedded-core/tree/meta/classes-
> > > > >
> > > >   >> recipe/uboot-sign.bbclass?h=3Dscarthgap#n106
> > > >   >>
> > > >   >> it gives me the impression that FIT_SIGN_INDIVIDUAL would
> > > > select
> > > >   >> between either signing individual images
> > > >
> > > > Yes
> > > >
> > > >   >> or signing the
> > > >   >> configurations
> > > >
> > > > Signed configuration also includes hash of the images that the
> > > > configuration references in it, that's what prevents the mix-and-
> > > > match
> > > > attack.
> > > >
> > > >   >> , which doesn't match the documented behavior. I believe
> > > >   >> the code in concat_dtb() also seems to assume only one of
> > > > the keys
> > > >   >> (dev/dev2) would need be present in the DTB. So the fix
> > > > would involve
> > > >   >> a review on this as well I imagine.
> > > > IIRC Adrian was looking into improving those docs.
> > >
> > > Regarding this second topic, let me show you some other information
> > > I
> > > gathered from a couple of builds that may help with your
> > > assessment:
> > >
> > > FSI :=3D FIT_SIGN_INDIVIDUAL
> > > CFG :=3D Whether or not the configurations inside the FIT image were
> > > signed
> > > IMG :=3D Whether or not the subimages inside the FIT image were
> > > signed
> > >
> > > | Branch    | Version       | FSI | Keys inside DTB  | CFG | IMG |
> > > |-----------+---------------+-----+------------------+-----+-----|
> > > | kirkstone | latest        | "0" | {dev}            | Y   | N   |
> > > | kirkstone | latest        | "1" | {dev,dev2}       | Y   | Y   |
> > > |-----------+---------------+-----+------------------+-----+-----|
> > > | scarthgap | latest        | "0" | Build failed (!) | n/a | n/a |
> > > |           | + dummy dev2  |     | {dev2}           | Y   | N   |
> > > | scarthgap | latest        | "1" | {dev2} (!)       | Y   | Y   |
> > > |-----------+---------------+-----+------------------+-----+-----|
> > > | scarthgap | w/o @d7bd9c62 | "0" | {dev}            | Y   | N   |
> > > | scarthgap | w/o @d7bd9c62 | "1" | {dev,dev2}       | Y   | Y   |
> > >
> > > The first two lines show that on kirkstone when
> > > FIT_SIGN_INDIVIDUAL=3D"0"
> > > only the configurations are signed and the DTB contains only the
> > > "dev"
> > > key. When FIT_SIGN_INDIVIDUAL=3D"1" both "dev" and "dev2" are present
> > > in
> > > the DTB and both the configurations and the images are signed. And
> > > that's the exact same behavior I got on scarthgap after reverting
> > > the
> > > commit d7bd9c62. And, as I said, this seems to match the
> > > documentation.
> > > I've attached snippets of the fdtdump for the FIT image and U-Boot
> > > DTB
> > > from my build on kirkstone to illustrate what I said.
> > >
> > > So, if the expected behavior is according to what you described
> > > then the
> > > behavior so far was wrong (for a long time) and the new behavior is
> > > introducing a breaking change for anyone relying on what's
> > > documented
> > > for the FIT_SIGN_INDIVIDUAL=3D"1" case, right? Btw, for us at Toradex
> > > this
> > > is not a big deal because we don't fall into that case but
> > > considering
> > > the general use of the layer the change in behavior could be an
> > > issue.
> > >
> > > Another piece of information that might be useful: I made a change
> > > to
> > > concat_dtb() to make it add both keys (dev/dev2) to the DTB (by
> > > invoking
> > > mkimage twice) and I found the invocation to "uboot-fit_check_sign"
> > > failed afterwards. I confirmed that the DTB had the two keys, but
> > > because the FIT image only had the configurations signed, the tool
> > > threw
> > > an error saying the signature of "require key dev2" could not be
> > > verified but the showed that the check of the "dev" key succeeded.
> > > Unfortunately I don't have the logs available for that case, but I
> > > could
> > > repeat the tests if needed. Anyway, my point is that the
> > > "uboot-fit_check_sign" tool seems capable of checking both keys as
> > > well.
> > >
> > > Interestingly, if I removed the verification step (performed on the
> > > "unused.itb" file), then the image generation succeeded and
> > > everything
> > > seemed to work as before both when FIT_SIGN_INDIVIDUAL is "0" or
> > > "1".
> > > So, it's not hard to get the old behavior, though we'd need to
> > > figure
> > > out how to properly do the verification when mkimage is invoked
> > > with -f
> > > "auto" or -f "auto-conf". I could post my unfinished patch if
> > > helpful.
> > >
> > >
> > >
> >
> >
> > --
> > Best regards,
> >
> > Jos=C3=A9 Quaresma
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#211753):
> > https://lists.openembedded.org/g/openembedded-core/message/211753
> > Mute This Topic: https://lists.openembedded.org/mt/111218371/7270266
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe:
> > https://lists.openembedded.org/g/openembedded-core/unsub [
> > L.Anderweit@phytec.de]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000003599a9062e955518
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Leonard,<br><br>I will test on my side=C2=A0and th=
en I&#39;ll come back with the results.<br><br>Thanks<br><br>Jose</div><br>=
<div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"=
gmail_attr">Leonard Anderweit &lt;<a href=3D"mailto:L.Anderweit@phytec.de">=
L.Anderweit@phytec.de</a>&gt; escreveu (quinta, 20/02/2025 =C3=A0(s) 14:42)=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
I&#39;ve also noticed this bug and sent patch [1] to fix it.<br>
<br>
[1] <a href=3D"https://lists.openembedded.org/g/openembedded-core/message/2=
11761" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/message/211761</a><br>
<br>
Leonard<br>
<br>
Am Donnerstag, dem 20.02.2025 um 10:46 +0000 schrieb Jose Quaresma via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a>:<br>
&gt; Hi,<br>
&gt; <br>
&gt; Any news about this regression?<br>
&gt; If we don&#39;t=C2=A0get a fix for this bug asap maybe we should=C2=A0=
revert and<br>
&gt; drop this patch since it broke our scarthgap stable=C2=A0LTS<br>
&gt; <br>
&gt; Jose=C2=A0<br>
&gt; <br>
&gt; <br>
&gt; Rogerio Guerra Borin via <a href=3D"http://lists.openembedded.org" rel=
=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a><br>
&gt; &lt;rogerio.borin=3D<a href=3D"mailto:toradex.com@lists.openembedded.o=
rg" target=3D"_blank">toradex.com@lists.openembedded.org</a>&gt; escreveu (=
ter=C3=A7a,<br>
&gt; 18/02/2025 =C3=A0(s) 03:49):<br>
&gt; &gt; &gt; This message originated from outside your organization<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; On 2/17/25 11:34 AM, Quentin Schulz wrote:<br>
&gt; &gt; &gt; =C2=A0 &gt; +Cc Marek<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Hi,<br>
&gt; &gt; <br>
&gt; &gt; Thanks for the quick answer!<br>
&gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; =C2=A0 &gt; On 2/16/25 7:36 PM, Rogerio Guerra Borin via<br>
&gt; &gt; &gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer"=
 target=3D"_blank">lists.openembedded.org</a> <br>
&gt; &gt; &gt; wrote:<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; You don&#39;t often get email from<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; rogerio.borin=3D<a href=3D"mailto:toradex.co=
m@lists.openembedded.org" target=3D"_blank">toradex.com@lists.openembedded.=
org</a>. Learn why<br>
&gt; &gt; &gt; this is<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; important&lt;<a href=3D"https://aka.ms/Learn=
AboutSenderIdentification" rel=3D"noreferrer" target=3D"_blank">https://aka=
.ms/LearnAboutSenderIdentification</a> <br>
&gt; &gt; &gt; &lt;<a href=3D"https://aka.ms/LearnAboutSenderIdentification=
" rel=3D"noreferrer" target=3D"_blank">https://aka.ms/LearnAboutSenderIdent=
ification</a>&gt;&gt;<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; Hello,<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt;<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; At Toradex we&#39;re using class &quot;kerne=
l-fitimage&quot; to produce<br>
&gt; &gt; &gt; our signed<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; kernel FIT images and we&#39;ve found that t=
he recent commit<br>
&gt; &gt; &gt; d7bd9c627661<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; (&quot;u-boot: kernel-fitimage: Fix dependen=
cy loop if<br>
&gt; &gt; &gt; UBOOT_SIGN_ENABLE<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; and UBOOT_ENV enabled&quot;) broke our build=
s. The logs of a<br>
&gt; &gt; &gt; failed build<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; show the following message that I found note=
worthy:<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Can you mail me the entire log file for completeness ?<br>
&gt; &gt; <br>
&gt; &gt; Sure.<br>
&gt; &gt; <br>
&gt; &gt; I&#39;ve added it as attachment<br>
&gt; &gt; (log.do_uboot_assemble_fitimage.841485).<br>
&gt; &gt; <br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; log.do_uboot_assemble_fitimage.841485:<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; ...<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; Couldn&#39;t open RSA private key: &#39;/sec=
boot-data/fit-<br>
&gt; &gt; &gt; keys/dev2.key&#39;: No<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; such file or directory<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt;<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; The odd thing was that the build was setting=
:<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt;<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; UBOOT_SIGN_KEYNAME =3D &quot;dev&quot;<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; UBOOT_SIGN_IMG_KEYNAME =3D &quot;dev2&quot;<=
br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; FIT_SIGN_INDIVIDUAL =3D &quot;0&quot;<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; FIT_GENERATE_KEYS =3D &quot;0&quot;<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; FIT_SIGN_INDIVIDUAL =3D &quot;0&quot; is correct, you do wan=
t to sign<br>
&gt; &gt; &gt; configurations, not individual images in the fitImage, becau=
se<br>
&gt; &gt; &gt; signing<br>
&gt; &gt; &gt; individual images is susceptible to mix-and-match attack.<br=
>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; =C2=A0From the above we see the individual i=
mages signing is<br>
&gt; &gt; &gt; disabled but<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; the system is trying to access the key file =
for the<br>
&gt; &gt; &gt; individual signing<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; (dev2) regardless of that. Checking the code=
 in uboot-<br>
&gt; &gt; &gt; sign.bbclass I<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; found this line:<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt;<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt;<br>
&gt; &gt; &gt; <a href=3D"https://git.openembedded.org/openembedded-core/tr=
ee/meta/classes-" rel=3D"noreferrer" target=3D"_blank">https://git.openembe=
dded.org/openembedded-core/tree/meta/classes-</a><br>
&gt; &gt; &gt; &lt;<br>
&gt; &gt; &gt; <a href=3D"https://git.openembedded.org/openembedded-core/tr=
ee/meta/classes-" rel=3D"noreferrer" target=3D"_blank">https://git.openembe=
dded.org/openembedded-core/tree/meta/classes-</a><br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; recipe/uboot-sign.bbclass?h=3Dscarthgap#n116=
<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt;<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; that is responsible for that access (inside =
function<br>
&gt; &gt; &gt; concat_dtb()).<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; The code is always referencing variable<br>
&gt; &gt; &gt; UBOOT_SIGN_IMG_KEYNAME<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; regardless of FIT_SIGN_INDIVIDUAL being set =
to &quot;1&quot; or &quot;0&quot;<br>
&gt; &gt; &gt; even though<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; there&#39;s a condition a couple lines above=
 L116 where<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; FIT_SIGN_INDIVIDUAL is tested to decide in w=
hich mode to run<br>
&gt; &gt; &gt; the<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; signing tool.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Uh, good find, does the following patch fix your problem ?<b=
r>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; &quot;&quot;&quot;<br>
&gt; &gt; &gt; diff --git a/meta/classes-recipe/uboot-sign.bbclass<br>
&gt; &gt; &gt; b/meta/classes-recipe/uboot-sign.bbclass<br>
&gt; &gt; &gt; index 96c47ab016..74ef5697ca 100644<br>
&gt; &gt; &gt; --- a/meta/classes-recipe/uboot-sign.bbclass<br>
&gt; &gt; &gt; +++ b/meta/classes-recipe/uboot-sign.bbclass<br>
&gt; &gt; &gt; @@ -107,13 +107,16 @@ concat_dtb() {<br>
&gt; &gt; &gt; # makes fitImage susceptible to mix-and-match attack.<br>
&gt; &gt; &gt; if [ &quot;${FIT_SIGN_INDIVIDUAL}&quot; =3D &quot;1&quot; ] =
; then<br>
&gt; &gt; &gt; UBOOT_MKIMAGE_MODE=3D&quot;auto&quot;<br>
&gt; &gt; &gt; + UBOOT_MKIMAGE_KEYNAME=3D${UBOOT_SIGN_IMG_KEYNAME}<br>
&gt; &gt; &gt; + else<br>
&gt; &gt; &gt; + UBOOT_MKIMAGE_KEYNAME=3D${UBOOT_SIGN_KEYNAME}<br>
&gt; &gt; &gt; fi<br>
&gt; &gt; &gt; ${UBOOT_MKIMAGE_SIGN} \<br>
&gt; &gt; &gt; ${@&#39;-D &quot;${UBOOT_MKIMAGE_DTCOPTS}&quot;&#39; if<br>
&gt; &gt; &gt; len(&#39;${UBOOT_MKIMAGE_DTCOPTS}&#39;) else &#39;&#39;} \<b=
r>
&gt; &gt; &gt; -f $UBOOT_MKIMAGE_MODE \<br>
&gt; &gt; &gt; -k &quot;${UBOOT_SIGN_KEYDIR}&quot; \<br>
&gt; &gt; &gt; -o &quot;${FIT_HASH_ALG},${FIT_SIGN_ALG}&quot; \<br>
&gt; &gt; &gt; - -g &quot;${UBOOT_SIGN_IMG_KEYNAME}&quot; \<br>
&gt; &gt; &gt; + -g &quot;$UBOOT_MKIMAGE_KEYNAME&quot; \<br>
&gt; &gt; &gt; -K &quot;${UBOOT_DTB_BINARY}&quot; \<br>
&gt; &gt; &gt; -d /dev/null \<br>
&gt; &gt; &gt; -r ${B}/unused.itb \<br>
&gt; &gt; &gt; &quot;&quot;&quot;<br>
&gt; &gt; <br>
&gt; &gt; Looking at the patch I&#39;m pretty sure it would solve my proble=
m, <br>
&gt; &gt; particularly because we set FIT_SIGN_INDIVIDUAL=3D&quot;0&quot; i=
n our builds. <br>
&gt; &gt; However, I see it keeps the concept of the signing being either o=
n<br>
&gt; &gt; the <br>
&gt; &gt; config or on the individual images, which I wanted to further<br>
&gt; &gt; comment <br>
&gt; &gt; down below.<br>
&gt; &gt; <br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; To better understand the behavior I created =
dev2.<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; {key,crt} files and retried a build which wo=
rked. However,<br>
&gt; &gt; &gt; checking<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; the contents of the final u-boot.dtb file I =
found that the<br>
&gt; &gt; &gt; &quot;dev2&quot; key<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; node was present but the &quot;dev&quot; key=
 wasn&#39;t. Then, checking<br>
&gt; &gt; &gt; the contents<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; of the final fitImage I noticed the configur=
ation nodes were<br>
&gt; &gt; &gt; signed by<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; the dev key while the individual images were=
 not signed (as<br>
&gt; &gt; &gt; expected).<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; But that means such a system wouldn&#39;t bo=
ot since the<br>
&gt; &gt; &gt; required &quot;dev&quot;<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; key is not present in the U-Boot DTB, from w=
hat I conclude<br>
&gt; &gt; &gt; the FIT<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; signing is broken at the moment.<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt;<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; So, first of all I wanted to let you guys kn=
ow about this<br>
&gt; &gt; &gt; issue<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; (hoping we&#39;re not doing anything wrong w=
ith our builds).<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; No, your builds are fine, this is a real bug.<br>
&gt; &gt; <br>
&gt; &gt; Thanks for the confirmation.<br>
&gt; &gt; <br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; As a second point, I wanted to confirm the e=
xpected behavior<br>
&gt; &gt; &gt; regarding<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; variable FIT_SIGN_INDIVIDUAL. According to t=
he<br>
&gt; &gt; &gt; documentation:<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt;<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt;<br>
&gt; &gt; &gt; <a href=3D"https://docs.yoctoproject.org/5.0.6/ref-manual/va=
riables.html#term" rel=3D"noreferrer" target=3D"_blank">https://docs.yoctop=
roject.org/5.0.6/ref-manual/variables.html#term</a><br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; &lt;<br>
&gt; &gt; &gt; <a href=3D"https://docs.yoctoproject.org/5.0.6/ref-manual/va=
riables.html#term" rel=3D"noreferrer" target=3D"_blank">https://docs.yoctop=
roject.org/5.0.6/ref-manual/variables.html#term</a><br>
&gt; &gt; &gt; -&gt;<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; FIT_SIGN_INDIVIDUAL<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt;<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; when its value is &quot;1&quot; the individu=
al images will be signed<br>
&gt; &gt; &gt; *in<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; addition* to the FIT image being signed.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; That is a bit weird and no, I don&#39;t think that is how it=
 is<br>
&gt; &gt; &gt; supposed to<br>
&gt; &gt; &gt; work.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; FIT_SIGN_INDIVIDUAL=3D1 -&gt; only image subnodes in fitImag=
e /images<br>
&gt; &gt; &gt; nodes<br>
&gt; &gt; &gt; are signed AND fitImage is susceptible to mix-and-match atta=
ck<br>
&gt; &gt; &gt; (basically attacker can replace individual signed images in<=
br>
&gt; &gt; &gt; fitImage<br>
&gt; &gt; &gt; with different individual signed images, e.g. with older<br>
&gt; &gt; &gt; versions, to<br>
&gt; &gt; &gt; achieve a combination of images which allows them to somehow=
<br>
&gt; &gt; &gt; break the<br>
&gt; &gt; &gt; system).<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; FIT_SIGN_INDIVIDUAL=3D0 (recommended) -&gt; images are hashe=
d,<br>
&gt; &gt; &gt; configurations<br>
&gt; &gt; &gt; are hashed, hashes are combined and signed. Because images a=
nd<br>
&gt; &gt; &gt; configurations (which images are to be used together) are si=
gned,<br>
&gt; &gt; &gt; attacker cannot mix-and-match images into an un-allowed<br>
&gt; &gt; &gt; configuration.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; From that, I understand that<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; the configurations will be always signed and=
 the individual<br>
&gt; &gt; &gt; images may<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; or may not be signed depending on FIT_SIGN_I=
NDIVIDUAL.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; The other way around. The configurations are signed by defau=
lt,<br>
&gt; &gt; &gt; which is<br>
&gt; &gt; &gt; good, but this can be disabled if needed (unlikely).<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; I kind of<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; confirmed this behavior by checking our buil=
d artifacts on<br>
&gt; &gt; &gt; kirkstone:<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; with FIT_SIGN_INDIVIDUAL=3D&quot;0&quot; the=
 U-Boot DTB has only the<br>
&gt; &gt; &gt; &quot;dev&quot; key and<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; the fit image is signed by that same key; wi=
th<br>
&gt; &gt; &gt; FIT_SIGN_INDIVIDUAL=3D&quot;1&quot;<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; both keys are present in the DTB, the config=
urations are<br>
&gt; &gt; &gt; signed by the<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; &quot;dev&quot; key and the images by the &q=
uot;dev2&quot; key. I understand<br>
&gt; &gt; &gt; this is the<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; correct behavior, right?<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Images shouldn&#39;t be signed by different keys than config=
urations,<br>
&gt; &gt; &gt; that<br>
&gt; &gt; &gt; is a bit odd.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; I&#39;m asking because looking at the commen=
t at:<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt;<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt;<br>
&gt; &gt; &gt; <a href=3D"https://git.openembedded.org/openembedded-core/tr=
ee/meta/classes-" rel=3D"noreferrer" target=3D"_blank">https://git.openembe=
dded.org/openembedded-core/tree/meta/classes-</a><br>
&gt; &gt; &gt; &lt;<br>
&gt; &gt; &gt; <a href=3D"https://git.openembedded.org/openembedded-core/tr=
ee/meta/classes-" rel=3D"noreferrer" target=3D"_blank">https://git.openembe=
dded.org/openembedded-core/tree/meta/classes-</a><br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; recipe/uboot-sign.bbclass?h=3Dscarthgap#n106=
<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt;<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; it gives me the impression that FIT_SIGN_IND=
IVIDUAL would<br>
&gt; &gt; &gt; select<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; between either signing individual images<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Yes<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; or signing the<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; configurations<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Signed configuration also includes hash of the images that t=
he<br>
&gt; &gt; &gt; configuration references in it, that&#39;s what prevents the=
 mix-and-<br>
&gt; &gt; &gt; match<br>
&gt; &gt; &gt; attack.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; , which doesn&#39;t match the documented beh=
avior. I believe<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; the code in concat_dtb() also seems to assum=
e only one of<br>
&gt; &gt; &gt; the keys<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; (dev/dev2) would need be present in the DTB.=
 So the fix<br>
&gt; &gt; &gt; would involve<br>
&gt; &gt; &gt; =C2=A0 &gt;&gt; a review on this as well I imagine.<br>
&gt; &gt; &gt; IIRC Adrian was looking into improving those docs.<br>
&gt; &gt; <br>
&gt; &gt; Regarding this second topic, let me show you some other informati=
on<br>
&gt; &gt; I <br>
&gt; &gt; gathered from a couple of builds that may help with your<br>
&gt; &gt; assessment:<br>
&gt; &gt; <br>
&gt; &gt; FSI :=3D FIT_SIGN_INDIVIDUAL<br>
&gt; &gt; CFG :=3D Whether or not the configurations inside the FIT image w=
ere<br>
&gt; &gt; signed<br>
&gt; &gt; IMG :=3D Whether or not the subimages inside the FIT image were<b=
r>
&gt; &gt; signed<br>
&gt; &gt; <br>
&gt; &gt; | Branch=C2=A0 =C2=A0 | Version=C2=A0 =C2=A0 =C2=A0 =C2=A0| FSI |=
 Keys inside DTB=C2=A0 | CFG | IMG |<br>
&gt; &gt; |-----------+---------------+-----+------------------+-----+-----=
|<br>
&gt; &gt; | kirkstone | latest=C2=A0 =C2=A0 =C2=A0 =C2=A0 | &quot;0&quot; |=
 {dev}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | Y=C2=A0 =C2=A0| N=C2=A0 =
=C2=A0|<br>
&gt; &gt; | kirkstone | latest=C2=A0 =C2=A0 =C2=A0 =C2=A0 | &quot;1&quot; |=
 {dev,dev2}=C2=A0 =C2=A0 =C2=A0 =C2=A0| Y=C2=A0 =C2=A0| Y=C2=A0 =C2=A0|<br>
&gt; &gt; |-----------+---------------+-----+------------------+-----+-----=
|<br>
&gt; &gt; | scarthgap | latest=C2=A0 =C2=A0 =C2=A0 =C2=A0 | &quot;0&quot; |=
 Build failed (!) | n/a | n/a |<br>
&gt; &gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| + dummy dev2=C2=A0 |=
=C2=A0 =C2=A0 =C2=A0| {dev2}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| Y=C2=
=A0 =C2=A0| N=C2=A0 =C2=A0|<br>
&gt; &gt; | scarthgap | latest=C2=A0 =C2=A0 =C2=A0 =C2=A0 | &quot;1&quot; |=
 {dev2} (!)=C2=A0 =C2=A0 =C2=A0 =C2=A0| Y=C2=A0 =C2=A0| Y=C2=A0 =C2=A0|<br>
&gt; &gt; |-----------+---------------+-----+------------------+-----+-----=
|<br>
&gt; &gt; | scarthgap | w/o @d7bd9c62 | &quot;0&quot; | {dev}=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | Y=C2=A0 =C2=A0| N=C2=A0 =C2=A0|<br>
&gt; &gt; | scarthgap | w/o @d7bd9c62 | &quot;1&quot; | {dev,dev2}=C2=A0 =
=C2=A0 =C2=A0 =C2=A0| Y=C2=A0 =C2=A0| Y=C2=A0 =C2=A0|<br>
&gt; &gt; <br>
&gt; &gt; The first two lines show that on kirkstone when<br>
&gt; &gt; FIT_SIGN_INDIVIDUAL=3D&quot;0&quot; <br>
&gt; &gt; only the configurations are signed and the DTB contains only the<=
br>
&gt; &gt; &quot;dev&quot; <br>
&gt; &gt; key. When FIT_SIGN_INDIVIDUAL=3D&quot;1&quot; both &quot;dev&quot=
; and &quot;dev2&quot; are present<br>
&gt; &gt; in <br>
&gt; &gt; the DTB and both the configurations and the images are signed. An=
d <br>
&gt; &gt; that&#39;s the exact same behavior I got on scarthgap after rever=
ting<br>
&gt; &gt; the <br>
&gt; &gt; commit d7bd9c62. And, as I said, this seems to match the<br>
&gt; &gt; documentation.<br>
&gt; &gt; I&#39;ve attached snippets of the fdtdump for the FIT image and U=
-Boot<br>
&gt; &gt; DTB <br>
&gt; &gt; from my build on kirkstone to illustrate what I said.<br>
&gt; &gt; <br>
&gt; &gt; So, if the expected behavior is according to what you described<b=
r>
&gt; &gt; then the <br>
&gt; &gt; behavior so far was wrong (for a long time) and the new behavior =
is<br>
&gt; &gt; introducing a breaking change for anyone relying on what&#39;s<br=
>
&gt; &gt; documented <br>
&gt; &gt; for the FIT_SIGN_INDIVIDUAL=3D&quot;1&quot; case, right? Btw, for=
 us at Toradex<br>
&gt; &gt; this <br>
&gt; &gt; is not a big deal because we don&#39;t fall into that case but<br=
>
&gt; &gt; considering <br>
&gt; &gt; the general use of the layer the change in behavior could be an<b=
r>
&gt; &gt; issue.<br>
&gt; &gt; <br>
&gt; &gt; Another piece of information that might be useful: I made a chang=
e<br>
&gt; &gt; to <br>
&gt; &gt; concat_dtb() to make it add both keys (dev/dev2) to the DTB (by<b=
r>
&gt; &gt; invoking <br>
&gt; &gt; mkimage twice) and I found the invocation to &quot;uboot-fit_chec=
k_sign&quot;<br>
&gt; &gt; failed afterwards. I confirmed that the DTB had the two keys, but=
 <br>
&gt; &gt; because the FIT image only had the configurations signed, the too=
l<br>
&gt; &gt; threw <br>
&gt; &gt; an error saying the signature of &quot;require key dev2&quot; cou=
ld not be <br>
&gt; &gt; verified but the showed that the check of the &quot;dev&quot; key=
 succeeded. <br>
&gt; &gt; Unfortunately I don&#39;t have the logs available for that case, =
but I<br>
&gt; &gt; could <br>
&gt; &gt; repeat the tests if needed. Anyway, my point is that the <br>
&gt; &gt; &quot;uboot-fit_check_sign&quot; tool seems capable of checking b=
oth keys as<br>
&gt; &gt; well.<br>
&gt; &gt; <br>
&gt; &gt; Interestingly, if I removed the verification step (performed on t=
he<br>
&gt; &gt; &quot;unused.itb&quot; file), then the image generation succeeded=
 and<br>
&gt; &gt; everything <br>
&gt; &gt; seemed to work as before both when FIT_SIGN_INDIVIDUAL is &quot;0=
&quot; or<br>
&gt; &gt; &quot;1&quot;.<br>
&gt; &gt; So, it&#39;s not hard to get the old behavior, though we&#39;d ne=
ed to<br>
&gt; &gt; figure <br>
&gt; &gt; out how to properly do the verification when mkimage is invoked<b=
r>
&gt; &gt; with -f <br>
&gt; &gt; &quot;auto&quot; or -f &quot;auto-conf&quot;. I could post my unf=
inished patch if<br>
&gt; &gt; helpful.<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; -- <br>
&gt; Best regards,<br>
&gt; <br>
&gt; Jos=C3=A9 Quaresma<br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#211753):<br>
&gt; <a href=3D"https://lists.openembedded.org/g/openembedded-core/message/=
211753" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-core/message/211753</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11121837=
1/7270266" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/111218371/7270266</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe:<br>
&gt; <a href=3D"https://lists.openembedded.org/g/openembedded-core/unsub" r=
el=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/g/openem=
bedded-core/unsub</a>=C2=A0[<br>
&gt; <a href=3D"mailto:L.Anderweit@phytec.de" target=3D"_blank">L.Anderweit=
@phytec.de</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></=
div></div></div>

--0000000000003599a9062e955518--

