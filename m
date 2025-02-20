Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C30FFC021B1
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 10:46:21 +0000 (UTC)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
 by mx.groups.io with SMTP id smtpd.web10.46473.1740048375001465970
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Feb 2025 02:46:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S9cLlkeg;
 spf=pass (domain: gmail.com, ip: 209.85.217.51, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4be74b9de53so254935137.3
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 02:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740048374; x=1740653174; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2Z2oatpLuVu2zkwbl66JZdzvhs7nFWZY1gNQNPF+KXg=;
        b=S9cLlkegYEIT0r6E48oIBc1o1MEy3qI2xUr2ce/6pTOCuSVAND5bOQ6dCpH/fkUZRx
         722cKGlHhutqaL7HNQfL5Rppsw65WWl8ja7XSp3nu8cWhnSap/ZDpyj9VSHKhhf8Ms33
         2hhq/fF46takdodx6DUa0Gzrr/oFGGajgHQrIcqoy+0nRlHlizihbwUxvsjAUiQL/s/+
         jFe99x1sP3FNUTXQwPHH/iDk0d1f1uXvAS/jYJtLOOgdNs+LXDKsXfZVkgwyqAHc9Fp5
         S32qUswvlmU+W1PLm+B1FYq3IIIfRN4Xg5h1kWcJa7l8a363DmUsJH7U4e0dmK1ZHobj
         JQUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740048374; x=1740653174;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Z2oatpLuVu2zkwbl66JZdzvhs7nFWZY1gNQNPF+KXg=;
        b=iNJEj7irHhqIxzaH9EjB4Dt4/9CmTjS5VATxg23eC/CgquBzPJHHC8Rl1qqVw8zKAN
         rbnf917ZpQIrGeMWGVpUskjyIO+M5gEeLy3DS3zxqm+o+aBBoDuemGSjmtq692OmHK9I
         w0gz2IxCV/wK6afWbKxHusodVtufafhnJxv59anM2Cd2ty7QGxN1s9IOAaqd9hzic6ST
         D9GTDU6fIyjMmkHciu2W4c2mkRyVel91fWjK/R2dc1ZELikWhgXaEHg2IfeBJo9B2CUB
         FV6K2viqBtEO3neoF4ZNCxKvEPaanlht8L1bGsf0hLw6qOdJs4jyU1Bw5E0OogFB8QUB
         EuDw==
X-Forwarded-Encrypted: i=1; AJvYcCVJ2kt+cJVlBeAUX6sBJX/6EzeOqpUpjoRLJbrBNHPKPRYdz6S7D/ZKqosljgwIzzavT+PEuFv9z77J8do1P6m+aw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw/gfyG4oE3bB1nSnS+Y1ItUL3vpoydY8QWYCvzcGs+590DXzWe
	9/XYHlKIOcMDsYWyXAAQ357oI63uJtWyLtlvXP7TQjDK/9InSu+qEhcc3mK6T4v5ySxWKBUTAD5
	GhjCIp/HDdNf5SgY9ksxHND5XR40=
X-Gm-Gg: ASbGncuzgcrkTQnx4YD7c736Izk0JF5WLuC6rvCpUAjkP4GY8qbsMhFaItvKkoe/0zh
	GMlQbnQ0lCVPHSm/TkNShw7noWSJpPkFcFONMZjgqa1VQkpRiqMJKCXgqTwnaDdQANSVEph97pt
	Y=
X-Google-Smtp-Source: AGHT+IGbSdQ02ec0obqKw5QDbRWmR3MM9MHyRELf/REf+mkOltDVD8arT8P+0XaWRAp5v3cFoL1YpAixtziG3mWLp+0=
X-Received: by 2002:a05:6102:2b8e:b0:4be:3320:aa08 with SMTP id
 ada2fe7eead31-4be3320aad2mr12116856137.11.1740048373796; Thu, 20 Feb 2025
 02:46:13 -0800 (PST)
MIME-Version: 1.0
References: <VcVL.1739730983448118565.i0SN@lists.openembedded.org>
 <e82e9be5-9a56-4c22-ba44-90c8e6690d99@cherry.de> <86f57755-bad6-49ad-a1b6-d0dceaf5344b@denx.de>
 <c1fdfe98-90cd-44e4-9c5a-fe5d73ac49b4@toradex.com>
In-Reply-To: <c1fdfe98-90cd-44e4-9c5a-fe5d73ac49b4@toradex.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 20 Feb 2025 10:46:03 +0000
X-Gm-Features: AWEUYZmb7sULO4wBHinuF3KCi3SvRn-dkizKmVKr-NY8SudvRHW9E-zJywAhf10
Message-ID: <CANPvuRnkwX3ptjj6W8kZMjkXbUz=2qa=3nJvzxcrY_CYkBQRYA@mail.gmail.com>
Subject: Re: [OE-core] Broken FIT image signing since "u-boot:
 kernel-fitimage: Fix dependency loop if UBOOT_SIGN_ENABLE and UBOOT_ENV enabled"
To: rogerio.borin@toradex.com
Cc: Marek Vasut <marex@denx.de>, Quentin Schulz <quentin.schulz@cherry.de>, 
	openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"Freihofer, Adrian" <adrian.freihofer@siemens.com>
Content-Type: multipart/alternative; boundary="00000000000036553f062e9095f9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 10:46:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211753

--00000000000036553f062e9095f9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Any news about this regression?
If we don't get a fix for this bug asap maybe we should revert and drop
this patch since it broke our scarthgap stable LTS

Jose


Rogerio Guerra Borin via lists.openembedded.org <rogerio.borin=3D
toradex.com@lists.openembedded.org> escreveu (ter=C3=A7a, 18/02/2025 =C3=A0=
(s) 03:49):

> > This message originated from outside your organization
> >
> > On 2/17/25 11:34 AM, Quentin Schulz wrote:
> >  > +Cc Marek
> >
> > Hi,
>
> Thanks for the quick answer!
>
> >
> >  > On 2/16/25 7:36 PM, Rogerio Guerra Borin via lists.openembedded.org
> > wrote:
> >  >> You don't often get email from
> >  >> rogerio.borin=3Dtoradex.com@lists.openembedded.org. Learn why this =
is
> >  >> important<https://aka.ms/LearnAboutSenderIdentification
> > <https://aka.ms/LearnAboutSenderIdentification>>
> >  >> Hello,
> >  >>
> >  >> At Toradex we're using class "kernel-fitimage" to produce our signe=
d
> >  >> kernel FIT images and we've found that the recent commit d7bd9c6276=
61
> >  >> ("u-boot: kernel-fitimage: Fix dependency loop if UBOOT_SIGN_ENABLE
> >  >> and UBOOT_ENV enabled") broke our builds. The logs of a failed buil=
d
> >  >> show the following message that I found noteworthy:
> >
> > Can you mail me the entire log file for completeness ?
>
> Sure.
>
> I've added it as attachment (log.do_uboot_assemble_fitimage.841485).
>
> >  >> log.do_uboot_assemble_fitimage.841485:
> >  >> ...
> >  >> Couldn't open RSA private key: '/secboot-data/fit-keys/dev2.key': N=
o
> >  >> such file or directory
> >  >>
> >  >> The odd thing was that the build was setting:
> >  >>
> >  >> UBOOT_SIGN_KEYNAME =3D "dev"
> >  >> UBOOT_SIGN_IMG_KEYNAME =3D "dev2"
> >  >> FIT_SIGN_INDIVIDUAL =3D "0"
> >  >> FIT_GENERATE_KEYS =3D "0"
> >
> > FIT_SIGN_INDIVIDUAL =3D "0" is correct, you do want to sign
> > configurations, not individual images in the fitImage, because signing
> > individual images is susceptible to mix-and-match attack.
> >
> >  >>  From the above we see the individual images signing is disabled bu=
t
> >  >> the system is trying to access the key file for the individual
> signing
> >  >> (dev2) regardless of that. Checking the code in uboot-sign.bbclass =
I
> >  >> found this line:
> >  >>
> >  >> https://git.openembedded.org/openembedded-core/tree/meta/classes-
> > <https://git.openembedded.org/openembedded-core/tree/meta/classes->
> >  >> recipe/uboot-sign.bbclass?h=3Dscarthgap#n116
> >  >>
> >  >> that is responsible for that access (inside function concat_dtb()).
> >  >> The code is always referencing variable UBOOT_SIGN_IMG_KEYNAME
> >  >> regardless of FIT_SIGN_INDIVIDUAL being set to "1" or "0" even thou=
gh
> >  >> there's a condition a couple lines above L116 where
> >  >> FIT_SIGN_INDIVIDUAL is tested to decide in which mode to run the
> >  >> signing tool.
> >
> > Uh, good find, does the following patch fix your problem ?
> >
> > """
> > diff --git a/meta/classes-recipe/uboot-sign.bbclass
> > b/meta/classes-recipe/uboot-sign.bbclass
> > index 96c47ab016..74ef5697ca 100644
> > --- a/meta/classes-recipe/uboot-sign.bbclass
> > +++ b/meta/classes-recipe/uboot-sign.bbclass
> > @@ -107,13 +107,16 @@ concat_dtb() {
> > # makes fitImage susceptible to mix-and-match attack.
> > if [ "${FIT_SIGN_INDIVIDUAL}" =3D "1" ] ; then
> > UBOOT_MKIMAGE_MODE=3D"auto"
> > + UBOOT_MKIMAGE_KEYNAME=3D${UBOOT_SIGN_IMG_KEYNAME}
> > + else
> > + UBOOT_MKIMAGE_KEYNAME=3D${UBOOT_SIGN_KEYNAME}
> > fi
> > ${UBOOT_MKIMAGE_SIGN} \
> > ${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if
> > len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
> > -f $UBOOT_MKIMAGE_MODE \
> > -k "${UBOOT_SIGN_KEYDIR}" \
> > -o "${FIT_HASH_ALG},${FIT_SIGN_ALG}" \
> > - -g "${UBOOT_SIGN_IMG_KEYNAME}" \
> > + -g "$UBOOT_MKIMAGE_KEYNAME" \
> > -K "${UBOOT_DTB_BINARY}" \
> > -d /dev/null \
> > -r ${B}/unused.itb \
> > """
>
> Looking at the patch I'm pretty sure it would solve my problem,
> particularly because we set FIT_SIGN_INDIVIDUAL=3D"0" in our builds.
> However, I see it keeps the concept of the signing being either on the
> config or on the individual images, which I wanted to further comment
> down below.
>
> >  >> To better understand the behavior I created dev2.
> >  >> {key,crt} files and retried a build which worked. However, checking
> >  >> the contents of the final u-boot.dtb file I found that the "dev2" k=
ey
> >  >> node was present but the "dev" key wasn't. Then, checking the
> contents
> >  >> of the final fitImage I noticed the configuration nodes were signed
> by
> >  >> the dev key while the individual images were not signed (as
> expected).
> >  >> But that means such a system wouldn't boot since the required "dev"
> >  >> key is not present in the U-Boot DTB, from what I conclude the FIT
> >  >> signing is broken at the moment.
> >  >>
> >  >> So, first of all I wanted to let you guys know about this issue
> >  >> (hoping we're not doing anything wrong with our builds).
> >
> > No, your builds are fine, this is a real bug.
>
> Thanks for the confirmation.
>
> >  >> As a second point, I wanted to confirm the expected behavior
> regarding
> >  >> variable FIT_SIGN_INDIVIDUAL. According to the documentation:
> >  >>
> >  >> https://docs.yoctoproject.org/5.0.6/ref-manual/variables.html#term-
> > <https://docs.yoctoproject.org/5.0.6/ref-manual/variables.html#term->
> >  >> FIT_SIGN_INDIVIDUAL
> >  >>
> >  >> when its value is "1" the individual images will be signed *in
> >  >> addition* to the FIT image being signed.
> >
> > That is a bit weird and no, I don't think that is how it is supposed to
> > work.
> >
> > FIT_SIGN_INDIVIDUAL=3D1 -> only image subnodes in fitImage /images node=
s
> > are signed AND fitImage is susceptible to mix-and-match attack
> > (basically attacker can replace individual signed images in fitImage
> > with different individual signed images, e.g. with older versions, to
> > achieve a combination of images which allows them to somehow break the
> > system).
> >
> > FIT_SIGN_INDIVIDUAL=3D0 (recommended) -> images are hashed, configurati=
ons
> > are hashed, hashes are combined and signed. Because images and
> > configurations (which images are to be used together) are signed,
> > attacker cannot mix-and-match images into an un-allowed configuration.
> >
> >  >> From that, I understand that
> >  >> the configurations will be always signed and the individual images
> may
> >  >> or may not be signed depending on FIT_SIGN_INDIVIDUAL.
> >
> > The other way around. The configurations are signed by default, which i=
s
> > good, but this can be disabled if needed (unlikely).
> >
> >  >> I kind of
> >  >> confirmed this behavior by checking our build artifacts on kirkston=
e:
> >  >> with FIT_SIGN_INDIVIDUAL=3D"0" the U-Boot DTB has only the "dev" ke=
y
> and
> >  >> the fit image is signed by that same key; with
> FIT_SIGN_INDIVIDUAL=3D"1"
> >  >> both keys are present in the DTB, the configurations are signed by
> the
> >  >> "dev" key and the images by the "dev2" key. I understand this is th=
e
> >  >> correct behavior, right?
> >
> > Images shouldn't be signed by different keys than configurations, that
> > is a bit odd.
> >
> >  >> I'm asking because looking at the comment at:
> >  >>
> >  >> https://git.openembedded.org/openembedded-core/tree/meta/classes-
> > <https://git.openembedded.org/openembedded-core/tree/meta/classes->
> >  >> recipe/uboot-sign.bbclass?h=3Dscarthgap#n106
> >  >>
> >  >> it gives me the impression that FIT_SIGN_INDIVIDUAL would select
> >  >> between either signing individual images
> >
> > Yes
> >
> >  >> or signing the
> >  >> configurations
> >
> > Signed configuration also includes hash of the images that the
> > configuration references in it, that's what prevents the mix-and-match
> > attack.
> >
> >  >> , which doesn't match the documented behavior. I believe
> >  >> the code in concat_dtb() also seems to assume only one of the keys
> >  >> (dev/dev2) would need be present in the DTB. So the fix would invol=
ve
> >  >> a review on this as well I imagine.
> > IIRC Adrian was looking into improving those docs.
>
> Regarding this second topic, let me show you some other information I
> gathered from a couple of builds that may help with your assessment:
>
> FSI :=3D FIT_SIGN_INDIVIDUAL
> CFG :=3D Whether or not the configurations inside the FIT image were sign=
ed
> IMG :=3D Whether or not the subimages inside the FIT image were signed
>
> | Branch    | Version       | FSI | Keys inside DTB  | CFG | IMG |
> |-----------+---------------+-----+------------------+-----+-----|
> | kirkstone | latest        | "0" | {dev}            | Y   | N   |
> | kirkstone | latest        | "1" | {dev,dev2}       | Y   | Y   |
> |-----------+---------------+-----+------------------+-----+-----|
> | scarthgap | latest        | "0" | Build failed (!) | n/a | n/a |
> |           | + dummy dev2  |     | {dev2}           | Y   | N   |
> | scarthgap | latest        | "1" | {dev2} (!)       | Y   | Y   |
> |-----------+---------------+-----+------------------+-----+-----|
> | scarthgap | w/o @d7bd9c62 | "0" | {dev}            | Y   | N   |
> | scarthgap | w/o @d7bd9c62 | "1" | {dev,dev2}       | Y   | Y   |
>
> The first two lines show that on kirkstone when FIT_SIGN_INDIVIDUAL=3D"0"
> only the configurations are signed and the DTB contains only the "dev"
> key. When FIT_SIGN_INDIVIDUAL=3D"1" both "dev" and "dev2" are present in
> the DTB and both the configurations and the images are signed. And
> that's the exact same behavior I got on scarthgap after reverting the
> commit d7bd9c62. And, as I said, this seems to match the documentation.
> I've attached snippets of the fdtdump for the FIT image and U-Boot DTB
> from my build on kirkstone to illustrate what I said.
>
> So, if the expected behavior is according to what you described then the
> behavior so far was wrong (for a long time) and the new behavior is
> introducing a breaking change for anyone relying on what's documented
> for the FIT_SIGN_INDIVIDUAL=3D"1" case, right? Btw, for us at Toradex thi=
s
> is not a big deal because we don't fall into that case but considering
> the general use of the layer the change in behavior could be an issue.
>
> Another piece of information that might be useful: I made a change to
> concat_dtb() to make it add both keys (dev/dev2) to the DTB (by invoking
> mkimage twice) and I found the invocation to "uboot-fit_check_sign"
> failed afterwards. I confirmed that the DTB had the two keys, but
> because the FIT image only had the configurations signed, the tool threw
> an error saying the signature of "require key dev2" could not be
> verified but the showed that the check of the "dev" key succeeded.
> Unfortunately I don't have the logs available for that case, but I could
> repeat the tests if needed. Anyway, my point is that the
> "uboot-fit_check_sign" tool seems capable of checking both keys as well.
>
> Interestingly, if I removed the verification step (performed on the
> "unused.itb" file), then the image generation succeeded and everything
> seemed to work as before both when FIT_SIGN_INDIVIDUAL is "0" or "1".
> So, it's not hard to get the old behavior, though we'd need to figure
> out how to properly do the verification when mkimage is invoked with -f
> "auto" or -f "auto-conf". I could post my unfinished patch if helpful.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#211561):
> https://lists.openembedded.org/g/openembedded-core/message/211561
> Mute This Topic: https://lists.openembedded.org/mt/111218371/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000036553f062e9095f9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>Any news about this regression?</di=
v><div>If we don&#39;t=C2=A0get a fix for this bug asap maybe we should=C2=
=A0revert and drop this patch since it broke our scarthgap stable=C2=A0LTS<=
/div><div><br></div><div>Jose=C2=A0<br><br></div></div><br><div class=3D"gm=
ail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Roge=
rio Guerra Borin via <a href=3D"http://lists.openembedded.org">lists.openem=
bedded.org</a> &lt;rogerio.borin=3D<a href=3D"mailto:toradex.com@lists.open=
embedded.org">toradex.com@lists.openembedded.org</a>&gt; escreveu (ter=C3=
=A7a, 18/02/2025 =C3=A0(s) 03:49):<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">&gt; This message originated from outside your organizat=
ion<br>
&gt; <br>
&gt; On 2/17/25 11:34 AM, Quentin Schulz wrote:<br>
&gt;=C2=A0 &gt; +Cc Marek<br>
&gt; <br>
&gt; Hi,<br>
<br>
Thanks for the quick answer!<br>
<br>
&gt; <br>
&gt;=C2=A0 &gt; On 2/16/25 7:36 PM, Rogerio Guerra Borin via <a href=3D"htt=
p://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.open=
embedded.org</a> <br>
&gt; wrote:<br>
&gt;=C2=A0 &gt;&gt; You don&#39;t often get email from<br>
&gt;=C2=A0 &gt;&gt; rogerio.borin=3D<a href=3D"mailto:toradex.com@lists.ope=
nembedded.org" target=3D"_blank">toradex.com@lists.openembedded.org</a>. Le=
arn why this is<br>
&gt;=C2=A0 &gt;&gt; important&lt;<a href=3D"https://aka.ms/LearnAboutSender=
Identification" rel=3D"noreferrer" target=3D"_blank">https://aka.ms/LearnAb=
outSenderIdentification</a> <br>
&gt; &lt;<a href=3D"https://aka.ms/LearnAboutSenderIdentification" rel=3D"n=
oreferrer" target=3D"_blank">https://aka.ms/LearnAboutSenderIdentification<=
/a>&gt;&gt;<br>
&gt;=C2=A0 &gt;&gt; Hello,<br>
&gt;=C2=A0 &gt;&gt;<br>
&gt;=C2=A0 &gt;&gt; At Toradex we&#39;re using class &quot;kernel-fitimage&=
quot; to produce our signed<br>
&gt;=C2=A0 &gt;&gt; kernel FIT images and we&#39;ve found that the recent c=
ommit d7bd9c627661<br>
&gt;=C2=A0 &gt;&gt; (&quot;u-boot: kernel-fitimage: Fix dependency loop if =
UBOOT_SIGN_ENABLE<br>
&gt;=C2=A0 &gt;&gt; and UBOOT_ENV enabled&quot;) broke our builds. The logs=
 of a failed build<br>
&gt;=C2=A0 &gt;&gt; show the following message that I found noteworthy:<br>
&gt; <br>
&gt; Can you mail me the entire log file for completeness ?<br>
<br>
Sure.<br>
<br>
I&#39;ve added it as attachment (log.do_uboot_assemble_fitimage.841485).<br=
>
<br>
&gt;=C2=A0 &gt;&gt; log.do_uboot_assemble_fitimage.841485:<br>
&gt;=C2=A0 &gt;&gt; ...<br>
&gt;=C2=A0 &gt;&gt; Couldn&#39;t open RSA private key: &#39;/secboot-data/f=
it-keys/dev2.key&#39;: No<br>
&gt;=C2=A0 &gt;&gt; such file or directory<br>
&gt;=C2=A0 &gt;&gt;<br>
&gt;=C2=A0 &gt;&gt; The odd thing was that the build was setting:<br>
&gt;=C2=A0 &gt;&gt;<br>
&gt;=C2=A0 &gt;&gt; UBOOT_SIGN_KEYNAME =3D &quot;dev&quot;<br>
&gt;=C2=A0 &gt;&gt; UBOOT_SIGN_IMG_KEYNAME =3D &quot;dev2&quot;<br>
&gt;=C2=A0 &gt;&gt; FIT_SIGN_INDIVIDUAL =3D &quot;0&quot;<br>
&gt;=C2=A0 &gt;&gt; FIT_GENERATE_KEYS =3D &quot;0&quot;<br>
&gt; <br>
&gt; FIT_SIGN_INDIVIDUAL =3D &quot;0&quot; is correct, you do want to sign<=
br>
&gt; configurations, not individual images in the fitImage, because signing=
<br>
&gt; individual images is susceptible to mix-and-match attack.<br>
&gt; <br>
&gt;=C2=A0 &gt;&gt; =C2=A0From the above we see the individual images signi=
ng is disabled but<br>
&gt;=C2=A0 &gt;&gt; the system is trying to access the key file for the ind=
ividual signing<br>
&gt;=C2=A0 &gt;&gt; (dev2) regardless of that. Checking the code in uboot-s=
ign.bbclass I<br>
&gt;=C2=A0 &gt;&gt; found this line:<br>
&gt;=C2=A0 &gt;&gt;<br>
&gt;=C2=A0 &gt;&gt; <a href=3D"https://git.openembedded.org/openembedded-co=
re/tree/meta/classes-" rel=3D"noreferrer" target=3D"_blank">https://git.ope=
nembedded.org/openembedded-core/tree/meta/classes-</a> <br>
&gt; &lt;<a href=3D"https://git.openembedded.org/openembedded-core/tree/met=
a/classes-" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.o=
rg/openembedded-core/tree/meta/classes-</a>&gt;<br>
&gt;=C2=A0 &gt;&gt; recipe/uboot-sign.bbclass?h=3Dscarthgap#n116<br>
&gt;=C2=A0 &gt;&gt;<br>
&gt;=C2=A0 &gt;&gt; that is responsible for that access (inside function co=
ncat_dtb()).<br>
&gt;=C2=A0 &gt;&gt; The code is always referencing variable UBOOT_SIGN_IMG_=
KEYNAME<br>
&gt;=C2=A0 &gt;&gt; regardless of FIT_SIGN_INDIVIDUAL being set to &quot;1&=
quot; or &quot;0&quot; even though<br>
&gt;=C2=A0 &gt;&gt; there&#39;s a condition a couple lines above L116 where=
<br>
&gt;=C2=A0 &gt;&gt; FIT_SIGN_INDIVIDUAL is tested to decide in which mode t=
o run the<br>
&gt;=C2=A0 &gt;&gt; signing tool.<br>
&gt; <br>
&gt; Uh, good find, does the following patch fix your problem ?<br>
&gt; <br>
&gt; &quot;&quot;&quot;<br>
&gt; diff --git a/meta/classes-recipe/uboot-sign.bbclass<br>
&gt; b/meta/classes-recipe/uboot-sign.bbclass<br>
&gt; index 96c47ab016..74ef5697ca 100644<br>
&gt; --- a/meta/classes-recipe/uboot-sign.bbclass<br>
&gt; +++ b/meta/classes-recipe/uboot-sign.bbclass<br>
&gt; @@ -107,13 +107,16 @@ concat_dtb() {<br>
&gt; # makes fitImage susceptible to mix-and-match attack.<br>
&gt; if [ &quot;${FIT_SIGN_INDIVIDUAL}&quot; =3D &quot;1&quot; ] ; then<br>
&gt; UBOOT_MKIMAGE_MODE=3D&quot;auto&quot;<br>
&gt; + UBOOT_MKIMAGE_KEYNAME=3D${UBOOT_SIGN_IMG_KEYNAME}<br>
&gt; + else<br>
&gt; + UBOOT_MKIMAGE_KEYNAME=3D${UBOOT_SIGN_KEYNAME}<br>
&gt; fi<br>
&gt; ${UBOOT_MKIMAGE_SIGN} \<br>
&gt; ${@&#39;-D &quot;${UBOOT_MKIMAGE_DTCOPTS}&quot;&#39; if<br>
&gt; len(&#39;${UBOOT_MKIMAGE_DTCOPTS}&#39;) else &#39;&#39;} \<br>
&gt; -f $UBOOT_MKIMAGE_MODE \<br>
&gt; -k &quot;${UBOOT_SIGN_KEYDIR}&quot; \<br>
&gt; -o &quot;${FIT_HASH_ALG},${FIT_SIGN_ALG}&quot; \<br>
&gt; - -g &quot;${UBOOT_SIGN_IMG_KEYNAME}&quot; \<br>
&gt; + -g &quot;$UBOOT_MKIMAGE_KEYNAME&quot; \<br>
&gt; -K &quot;${UBOOT_DTB_BINARY}&quot; \<br>
&gt; -d /dev/null \<br>
&gt; -r ${B}/unused.itb \<br>
&gt; &quot;&quot;&quot;<br>
<br>
Looking at the patch I&#39;m pretty sure it would solve my problem, <br>
particularly because we set FIT_SIGN_INDIVIDUAL=3D&quot;0&quot; in our buil=
ds. <br>
However, I see it keeps the concept of the signing being either on the <br>
config or on the individual images, which I wanted to further comment <br>
down below.<br>
<br>
&gt;=C2=A0 &gt;&gt; To better understand the behavior I created dev2.<br>
&gt;=C2=A0 &gt;&gt; {key,crt} files and retried a build which worked. Howev=
er, checking<br>
&gt;=C2=A0 &gt;&gt; the contents of the final u-boot.dtb file I found that =
the &quot;dev2&quot; key<br>
&gt;=C2=A0 &gt;&gt; node was present but the &quot;dev&quot; key wasn&#39;t=
. Then, checking the contents<br>
&gt;=C2=A0 &gt;&gt; of the final fitImage I noticed the configuration nodes=
 were signed by<br>
&gt;=C2=A0 &gt;&gt; the dev key while the individual images were not signed=
 (as expected).<br>
&gt;=C2=A0 &gt;&gt; But that means such a system wouldn&#39;t boot since th=
e required &quot;dev&quot;<br>
&gt;=C2=A0 &gt;&gt; key is not present in the U-Boot DTB, from what I concl=
ude the FIT<br>
&gt;=C2=A0 &gt;&gt; signing is broken at the moment.<br>
&gt;=C2=A0 &gt;&gt;<br>
&gt;=C2=A0 &gt;&gt; So, first of all I wanted to let you guys know about th=
is issue<br>
&gt;=C2=A0 &gt;&gt; (hoping we&#39;re not doing anything wrong with our bui=
lds).<br>
&gt; <br>
&gt; No, your builds are fine, this is a real bug.<br>
<br>
Thanks for the confirmation.<br>
<br>
&gt;=C2=A0 &gt;&gt; As a second point, I wanted to confirm the expected beh=
avior regarding<br>
&gt;=C2=A0 &gt;&gt; variable FIT_SIGN_INDIVIDUAL. According to the document=
ation:<br>
&gt;=C2=A0 &gt;&gt;<br>
&gt;=C2=A0 &gt;&gt; <a href=3D"https://docs.yoctoproject.org/5.0.6/ref-manu=
al/variables.html#term-" rel=3D"noreferrer" target=3D"_blank">https://docs.=
yoctoproject.org/5.0.6/ref-manual/variables.html#term-</a> <br>
&gt; &lt;<a href=3D"https://docs.yoctoproject.org/5.0.6/ref-manual/variable=
s.html#term-" rel=3D"noreferrer" target=3D"_blank">https://docs.yoctoprojec=
t.org/5.0.6/ref-manual/variables.html#term-</a>&gt;<br>
&gt;=C2=A0 &gt;&gt; FIT_SIGN_INDIVIDUAL<br>
&gt;=C2=A0 &gt;&gt;<br>
&gt;=C2=A0 &gt;&gt; when its value is &quot;1&quot; the individual images w=
ill be signed *in<br>
&gt;=C2=A0 &gt;&gt; addition* to the FIT image being signed.<br>
&gt; <br>
&gt; That is a bit weird and no, I don&#39;t think that is how it is suppos=
ed to<br>
&gt; work.<br>
&gt; <br>
&gt; FIT_SIGN_INDIVIDUAL=3D1 -&gt; only image subnodes in fitImage /images =
nodes<br>
&gt; are signed AND fitImage is susceptible to mix-and-match attack<br>
&gt; (basically attacker can replace individual signed images in fitImage<b=
r>
&gt; with different individual signed images, e.g. with older versions, to<=
br>
&gt; achieve a combination of images which allows them to somehow break the=
<br>
&gt; system).<br>
&gt; <br>
&gt; FIT_SIGN_INDIVIDUAL=3D0 (recommended) -&gt; images are hashed, configu=
rations<br>
&gt; are hashed, hashes are combined and signed. Because images and<br>
&gt; configurations (which images are to be used together) are signed,<br>
&gt; attacker cannot mix-and-match images into an un-allowed configuration.=
<br>
&gt; <br>
&gt;=C2=A0 &gt;&gt; From that, I understand that<br>
&gt;=C2=A0 &gt;&gt; the configurations will be always signed and the indivi=
dual images may<br>
&gt;=C2=A0 &gt;&gt; or may not be signed depending on FIT_SIGN_INDIVIDUAL.<=
br>
&gt; <br>
&gt; The other way around. The configurations are signed by default, which =
is<br>
&gt; good, but this can be disabled if needed (unlikely).<br>
&gt; <br>
&gt;=C2=A0 &gt;&gt; I kind of<br>
&gt;=C2=A0 &gt;&gt; confirmed this behavior by checking our build artifacts=
 on kirkstone:<br>
&gt;=C2=A0 &gt;&gt; with FIT_SIGN_INDIVIDUAL=3D&quot;0&quot; the U-Boot DTB=
 has only the &quot;dev&quot; key and<br>
&gt;=C2=A0 &gt;&gt; the fit image is signed by that same key; with FIT_SIGN=
_INDIVIDUAL=3D&quot;1&quot;<br>
&gt;=C2=A0 &gt;&gt; both keys are present in the DTB, the configurations ar=
e signed by the<br>
&gt;=C2=A0 &gt;&gt; &quot;dev&quot; key and the images by the &quot;dev2&qu=
ot; key. I understand this is the<br>
&gt;=C2=A0 &gt;&gt; correct behavior, right?<br>
&gt; <br>
&gt; Images shouldn&#39;t be signed by different keys than configurations, =
that<br>
&gt; is a bit odd.<br>
&gt; <br>
&gt;=C2=A0 &gt;&gt; I&#39;m asking because looking at the comment at:<br>
&gt;=C2=A0 &gt;&gt;<br>
&gt;=C2=A0 &gt;&gt; <a href=3D"https://git.openembedded.org/openembedded-co=
re/tree/meta/classes-" rel=3D"noreferrer" target=3D"_blank">https://git.ope=
nembedded.org/openembedded-core/tree/meta/classes-</a> <br>
&gt; &lt;<a href=3D"https://git.openembedded.org/openembedded-core/tree/met=
a/classes-" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.o=
rg/openembedded-core/tree/meta/classes-</a>&gt;<br>
&gt;=C2=A0 &gt;&gt; recipe/uboot-sign.bbclass?h=3Dscarthgap#n106<br>
&gt;=C2=A0 &gt;&gt;<br>
&gt;=C2=A0 &gt;&gt; it gives me the impression that FIT_SIGN_INDIVIDUAL wou=
ld select<br>
&gt;=C2=A0 &gt;&gt; between either signing individual images<br>
&gt; <br>
&gt; Yes<br>
&gt; <br>
&gt;=C2=A0 &gt;&gt; or signing the<br>
&gt;=C2=A0 &gt;&gt; configurations<br>
&gt; <br>
&gt; Signed configuration also includes hash of the images that the<br>
&gt; configuration references in it, that&#39;s what prevents the mix-and-m=
atch<br>
&gt; attack.<br>
&gt; <br>
&gt;=C2=A0 &gt;&gt; , which doesn&#39;t match the documented behavior. I be=
lieve<br>
&gt;=C2=A0 &gt;&gt; the code in concat_dtb() also seems to assume only one =
of the keys<br>
&gt;=C2=A0 &gt;&gt; (dev/dev2) would need be present in the DTB. So the fix=
 would involve<br>
&gt;=C2=A0 &gt;&gt; a review on this as well I imagine.<br>
&gt; IIRC Adrian was looking into improving those docs.<br>
<br>
Regarding this second topic, let me show you some other information I <br>
gathered from a couple of builds that may help with your assessment:<br>
<br>
FSI :=3D FIT_SIGN_INDIVIDUAL<br>
CFG :=3D Whether or not the configurations inside the FIT image were signed=
<br>
IMG :=3D Whether or not the subimages inside the FIT image were signed<br>
<br>
| Branch=C2=A0 =C2=A0 | Version=C2=A0 =C2=A0 =C2=A0 =C2=A0| FSI | Keys insi=
de DTB=C2=A0 | CFG | IMG |<br>
|-----------+---------------+-----+------------------+-----+-----|<br>
| kirkstone | latest=C2=A0 =C2=A0 =C2=A0 =C2=A0 | &quot;0&quot; | {dev}=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | Y=C2=A0 =C2=A0| N=C2=A0 =C2=A0|<br=
>
| kirkstone | latest=C2=A0 =C2=A0 =C2=A0 =C2=A0 | &quot;1&quot; | {dev,dev2=
}=C2=A0 =C2=A0 =C2=A0 =C2=A0| Y=C2=A0 =C2=A0| Y=C2=A0 =C2=A0|<br>
|-----------+---------------+-----+------------------+-----+-----|<br>
| scarthgap | latest=C2=A0 =C2=A0 =C2=A0 =C2=A0 | &quot;0&quot; | Build fai=
led (!) | n/a | n/a |<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| + dummy dev2=C2=A0 |=C2=A0 =C2=
=A0 =C2=A0| {dev2}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| Y=C2=A0 =C2=A0=
| N=C2=A0 =C2=A0|<br>
| scarthgap | latest=C2=A0 =C2=A0 =C2=A0 =C2=A0 | &quot;1&quot; | {dev2} (!=
)=C2=A0 =C2=A0 =C2=A0 =C2=A0| Y=C2=A0 =C2=A0| Y=C2=A0 =C2=A0|<br>
|-----------+---------------+-----+------------------+-----+-----|<br>
| scarthgap | w/o @d7bd9c62 | &quot;0&quot; | {dev}=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | Y=C2=A0 =C2=A0| N=C2=A0 =C2=A0|<br>
| scarthgap | w/o @d7bd9c62 | &quot;1&quot; | {dev,dev2}=C2=A0 =C2=A0 =C2=
=A0 =C2=A0| Y=C2=A0 =C2=A0| Y=C2=A0 =C2=A0|<br>
<br>
The first two lines show that on kirkstone when FIT_SIGN_INDIVIDUAL=3D&quot=
;0&quot; <br>
only the configurations are signed and the DTB contains only the &quot;dev&=
quot; <br>
key. When FIT_SIGN_INDIVIDUAL=3D&quot;1&quot; both &quot;dev&quot; and &quo=
t;dev2&quot; are present in <br>
the DTB and both the configurations and the images are signed. And <br>
that&#39;s the exact same behavior I got on scarthgap after reverting the <=
br>
commit d7bd9c62. And, as I said, this seems to match the documentation.<br>
I&#39;ve attached snippets of the fdtdump for the FIT image and U-Boot DTB =
<br>
from my build on kirkstone to illustrate what I said.<br>
<br>
So, if the expected behavior is according to what you described then the <b=
r>
behavior so far was wrong (for a long time) and the new behavior is <br>
introducing a breaking change for anyone relying on what&#39;s documented <=
br>
for the FIT_SIGN_INDIVIDUAL=3D&quot;1&quot; case, right? Btw, for us at Tor=
adex this <br>
is not a big deal because we don&#39;t fall into that case but considering =
<br>
the general use of the layer the change in behavior could be an issue.<br>
<br>
Another piece of information that might be useful: I made a change to <br>
concat_dtb() to make it add both keys (dev/dev2) to the DTB (by invoking <b=
r>
mkimage twice) and I found the invocation to &quot;uboot-fit_check_sign&quo=
t; <br>
failed afterwards. I confirmed that the DTB had the two keys, but <br>
because the FIT image only had the configurations signed, the tool threw <b=
r>
an error saying the signature of &quot;require key dev2&quot; could not be =
<br>
verified but the showed that the check of the &quot;dev&quot; key succeeded=
. <br>
Unfortunately I don&#39;t have the logs available for that case, but I coul=
d <br>
repeat the tests if needed. Anyway, my point is that the <br>
&quot;uboot-fit_check_sign&quot; tool seems capable of checking both keys a=
s well.<br>
<br>
Interestingly, if I removed the verification step (performed on the <br>
&quot;unused.itb&quot; file), then the image generation succeeded and every=
thing <br>
seemed to work as before both when FIT_SIGN_INDIVIDUAL is &quot;0&quot; or =
&quot;1&quot;.<br>
So, it&#39;s not hard to get the old behavior, though we&#39;d need to figu=
re <br>
out how to properly do the verification when mkimage is invoked with -f <br=
>
&quot;auto&quot; or -f &quot;auto-conf&quot;. I could post my unfinished pa=
tch if helpful.<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#211561): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/211561" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/211561</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/111218371/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/111218371/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></=
div></div>

--00000000000036553f062e9095f9--

