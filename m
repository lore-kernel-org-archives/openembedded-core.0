Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DCBDC021B6
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 11:32:31 +0000 (UTC)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
 by mx.groups.io with SMTP id smtpd.web10.5999.1740483147397007839
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 03:32:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FP8T9js3;
 spf=pass (domain: gmail.com, ip: 209.85.217.50, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4b68cb2abacso1751497137.3
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 03:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740483146; x=1741087946; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=15cxDmlA8lF3k4wvntvoWQsb+kKhTTnqglZINoxMiAo=;
        b=FP8T9js3SwcJKflZ/rvcOeVGS6sl8KX2hI+m0rU5C3S3W71/WfZfDK8MRxCWmdycU6
         aO3pPqLIunM3BDBiK7EN7QK7CogBrI70Aipk/WREqcvVjBk5gdLBkO2ym5t3tm1BOjKT
         hCGFXwAZ5vlEgv3wLQDVwauhmT32Xgl7ahF2iX8tMGSxPusShaIGtPXA5wF9O7hCYouT
         CB+AV96KKUGk4iBMYe1oJ9abx9Q4+CfcBhwflXUdx5D5UhBL5waO/6opPCJ7hbriFZg3
         5GAKJNLypyoWpxC/ODV3Ax/2hy5WWuHleS/Am5tRplURxPltFul4LkIOA+eN80OBjCTY
         ADqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740483146; x=1741087946;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=15cxDmlA8lF3k4wvntvoWQsb+kKhTTnqglZINoxMiAo=;
        b=GGqZlNzAz9CUAYk4qppfp14CqingmmwYkrdh83UtChV/kfmmxA8rvjzjov4SLK7qzF
         9CaSfJzOYEFsCWyI3Xjfzg1GL1jSNQEibMOlAFN4+z/n7O7s4O32zI5nWRbc/WBJI4/c
         1WeFW8JR4UN2zG3Lnd7Lx9aZPn7P7+ufDJzhUwkC/aELVK6BkREESb0IEFsXNIR8HPJS
         y2Jh9B0AWwaMkZAvLCXJ31Jjz2HxfIhE4F3JpmdT08Ixe4y1YAaDJcI2cE5FLcmPSGdS
         IP8m3Ek/g+/yUBHba3BJofJ+FK9ZY9hGCH9/F5MhKMsrDNLiYoSS52LXioLNjZKhgm5K
         ye0g==
X-Forwarded-Encrypted: i=1; AJvYcCVK9TsvlxBJkW6VQsi6PtisutBkg9JMcvB1IZnjT8qGF8D3lqQHLkFrFsvowtPAfODM0w/X9aYwwUA8On25GPyoWQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw3ZSjWUBTb+1TskebkoGojrV4kr2YLjvL8l1cLu/FShAowxBj6
	JWIrl/S+Um+g90F71ivBtP5lHUd4YvVSf64HFUXk5sU78TU0IcPTVF0JyUMfq0lURbG/+FtdBNV
	R8UfKxvQ8h99Vjf3UhMEv6OaFYQE=
X-Gm-Gg: ASbGncsmqC3iSHwZO8LokUIf92RheA/miW9ymRvpr36Yp32Er8d3JxmuWScy5dWr9Jb
	I3ZHmE7LyKXvAZB2Ij8O0lBDpgNoXyfw72/euMnIDH91aQFGOiu2Klp6OdIKmUOKYLxDza4aiNT
	wG308lALI/yg==
X-Google-Smtp-Source: AGHT+IHMOCWRkPFR8hvgEWnDBfjD5ztmeOUbZ7DiXIeScgMsMC361ZjUY813pXAMyicVikim/HViglWmbt13Er9U4xc=
X-Received: by 2002:a05:6102:41a7:b0:4bb:ecb9:b34f with SMTP id
 ada2fe7eead31-4c00ad4636bmr1284186137.14.1740483146321; Tue, 25 Feb 2025
 03:32:26 -0800 (PST)
MIME-Version: 1.0
References: <20250222002047.319479-1-marex@denx.de> <0665a8da-cab0-4d66-89b8-cb9649918365@toradex.com>
 <5f338f80-79a8-4174-8c30-454242a86565@denx.de>
In-Reply-To: <5f338f80-79a8-4174-8c30-454242a86565@denx.de>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 25 Feb 2025 11:32:15 +0000
X-Gm-Features: AQ5f1JpSjNhY4UAHV7HTg5cXufxJlirb-Fo6cAGplb4goFMtmwlAyAKKHe2C7P4
Message-ID: <CANPvuRksJR2eDRLQhCw17HxUzYR35nb9OZStXQZ1b4gnUCJb2w@mail.gmail.com>
Subject: Re: [PATCH] u-boot: kernel-fitimage: Restore FIT_SIGN_INDIVIDUAL="1" behavior
To: Marek Vasut <marex@denx.de>
Cc: Rogerio Guerra Borin <rogerio.borin@toradex.com>, openembedded-core@lists.openembedded.org, 
	Adrian Freihofer <adrian.freihofer@siemens.com>, Leonard Anderweit <L.Anderweit@phytec.de>, 
	Quentin Schulz <quentin.schulz@cherry.de>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Sean Anderson <seanga2@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000ac9620062ef5cf06"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 11:32:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211872

--000000000000ac9620062ef5cf06
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Marek Vasut <marex@denx.de> escreveu (domingo, 23/02/2025 =C3=A0(s) 23:23):

> On 2/23/25 11:13 PM, Rogerio Guerra Borin wrote:
> > On 2/21/25 21:20, Marek Vasut wrote:
> >> This message originated from outside your organization
> >>
> >> OE FIT_SIGN_INDIVIDUAL is implemented in an unusual manner,
> >> where the resulting signed fitImage contains both signed
> >> images and signed configurations, possibly using different
> >> keys. This kind of signing of images is redundant, but so is
> >> the behavior of FIT_SIGN_INDIVIDUAL=3D"1" and that is here to
> >> stay.
> >>
> >> Adjust the process of public key insertion into u-boot.dtb
> >> such that if FIT_SIGN_INDIVIDUAL=3D=3D1, the image signing key
> >> is inserted into u-boot.dtb first, and in any case the
> >> configuration signing key is inserted into u-boot.dtb last.
> >>
> >> The verification of the keys inserted into u-boot.dtb against
> >> unused.itb is performed only for FIT_SIGN_INDIVIDUAL!=3D1 due to
> >> mkimage limitation, which does not allow mkimage -f auto-conf
> >> to update the generated unused.itb, and instead rewrites it.
> >>
> >> Fixes: 259bfa86f384 ("u-boot: kernel-fitimage: Fix dependency loop if
> >> UBOOT_SIGN_ENABLE and UBOOT_ENV enabled")
> >> Signed-off-by: Marek Vasut <marex@denx.de>
> >> ---
> >> Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
> >> Cc: Jose Quaresma <quaresma.jose@gmail.com>
> >> Cc: Leonard Anderweit <L.Anderweit@phytec.de>
> >> Cc: Quentin Schulz <quentin.schulz@cherry.de>
> >> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> >> Cc: Rogerio Guerra Borin <rogerio.borin@toradex.com>
> >> Cc: Sean Anderson <seanga2@gmail.com>
> >> ---
> >>   meta/classes-recipe/uboot-sign.bbclass | 60 ++++++++++++++++++++++--=
--
> >>   1 file changed, 51 insertions(+), 9 deletions(-)
> >>
> >> diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-
> >> recipe/uboot-sign.bbclass
> >> index 96c47ab0165..5c579a9fb0e 100644
> >> --- a/meta/classes-recipe/uboot-sign.bbclass
> >> +++ b/meta/classes-recipe/uboot-sign.bbclass
> >> @@ -101,27 +101,69 @@ concat_dtb() {
> >>       binary=3D"$2"
> >>       if [ -e "${UBOOT_DTB_BINARY}" ]; then
> >> -        # Re-sign the kernel in order to add the keys to our dtb
> >> -        UBOOT_MKIMAGE_MODE=3D"auto-conf"
> >>           # Signing individual images is not recommended as that
> >>           # makes fitImage susceptible to mix-and-match attack.
> >> +        #
> >> +        # OE FIT_SIGN_INDIVIDUAL is implemented in an unusual manner,
> >> +        # where the resulting signed fitImage contains both signed
> >> +        # images and signed configurations. This is redundant. In
> >> +        # order to prevent mix-and-match attack, it is sufficient
> >> +        # to sign configurations. The FIT_SIGN_INDIVIDUAL =3D "1"
> >> +        # support is kept to avoid breakage of existing layers, but
> >> +        # it is highly recommended to avoid FIT_SIGN_INDIVIDUAL =3D "=
1",
> >> +        # i.e. set FIT_SIGN_INDIVIDUAL =3D "0" .
> >>           if [ "${FIT_SIGN_INDIVIDUAL}" =3D "1" ] ; then
> >> -            UBOOT_MKIMAGE_MODE=3D"auto"
> >> +            # Sign dummy image images in order to
> >> +            # add the image signing keys to our dtb
> >> +            ${UBOOT_MKIMAGE_SIGN} \
> >> +                ${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if
> >> len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
> >> +                -f auto \
> >> +                -k "${UBOOT_SIGN_KEYDIR}" \
> >> +                -o "${FIT_HASH_ALG},${FIT_SIGN_ALG}" \
> >> +                -g "${UBOOT_SIGN_IMG_KEYNAME}" \
> >> +                -K "${UBOOT_DTB_BINARY}" \
> >> +                -d /dev/null \
> >> +                -r ${B}/unused.itb \
> >> +                ${UBOOT_MKIMAGE_SIGN_ARGS}
> >>           fi
> >> +
> >> +        # Sign dummy image configurations in order to
> >> +        # add the configuration signing keys to our dtb
> >>           ${UBOOT_MKIMAGE_SIGN} \
> >>               ${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if
> >> len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
> >> -            -f $UBOOT_MKIMAGE_MODE \
> >> +            -f auto-conf \
> >>               -k "${UBOOT_SIGN_KEYDIR}" \
> >>               -o "${FIT_HASH_ALG},${FIT_SIGN_ALG}" \
> >> -            -g "${UBOOT_SIGN_IMG_KEYNAME}" \
> >> +            -g "${UBOOT_SIGN_KEYNAME}" \
> >>               -K "${UBOOT_DTB_BINARY}" \
> >>               -d /dev/null \
> >>               -r ${B}/unused.itb \
> >>               ${UBOOT_MKIMAGE_SIGN_ARGS}
> >> -        # Verify the kernel image and u-boot dtb
> >> -        ${UBOOT_FIT_CHECK_SIGN} \
> >> -            -k "${UBOOT_DTB_BINARY}" \
> >> -            -f ${B}/unused.itb
> >> +
> >> +        # Verify the dummy fitImage signature against u-boot.dtb
> >> +        # augmented using public key material.
> >> +        #
> >> +        # This only works for FIT_SIGN_INDIVIDUAL =3D "0", because
> >> +        # mkimage -f auto-conf does not support -F to extend the
> >> +        # existing unused.itb , and instead rewrites unused.itb
> >> +        # from scratch.
> >> +        #
> >> +        # Using two separate unused.itb for mkimage -f auto and
> >> +        # mkimage -f auto-conf invocation above would not help, as
> >> +        # the signature verification process below checks whether
> >> +        # all keys inserted into u-boot.dtb /signature node pass
> >> +        # the verification. Separate unused.itb would each miss one
> >> +        # of the signatures.
> >> +        #
> >> +        # The FIT_SIGN_INDIVIDUAL =3D "1" support is kept to avoid
> >> +        # breakage of existing layers, but it is highly recommended
> >> +        # to not use FIT_SIGN_INDIVIDUAL =3D "1", i.e. set
> >> +        # FIT_SIGN_INDIVIDUAL =3D "0" .
> >> +        if [ "${FIT_SIGN_INDIVIDUAL}" !=3D "1" ] ; then
> >> +            ${UBOOT_FIT_CHECK_SIGN} \
> >> +                -k "${UBOOT_DTB_BINARY}" \
> >> +                -f ${B}/unused.itb
> >> +        fi
> >>           cp ${UBOOT_DTB_BINARY} ${UBOOT_DTB_SIGNED}
> >>       fi
> >
> > Hey Marek,
>
> Hi,
>
> > I've built images with both FIT_SIGN_INDIVIDUAL set to "0" and "1' and
> > checked the resulting artifacts for the presence of keys and signatures=
.
> > Everything looks fine, as far as I can tell.
> Thank you for testing.
>
> Could you also provide Tested-by tag ?
>

Tested-by: Jose Quaresma <jose.quaresma@foundries.io>

Hi Marek,

I tested it on a couple of machines on my side and it fixes the regression.
My tests were only on the scarthgap branch.

Thanks for working on the solution.

Jose

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000ac9620062ef5cf06
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Marek Vasut &lt=
;<a href=3D"mailto:marex@denx.de">marex@denx.de</a>&gt; escreveu (domingo, =
23/02/2025 =C3=A0(s) 23:23):<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">On 2/23/25 11:13 PM, Rogerio Guerra Borin wrote:<br>
&gt; On 2/21/25 21:20, Marek Vasut wrote:<br>
&gt;&gt; This message originated from outside your organization<br>
&gt;&gt;<br>
&gt;&gt; OE FIT_SIGN_INDIVIDUAL is implemented in an unusual manner,<br>
&gt;&gt; where the resulting signed fitImage contains both signed<br>
&gt;&gt; images and signed configurations, possibly using different<br>
&gt;&gt; keys. This kind of signing of images is redundant, but so is<br>
&gt;&gt; the behavior of FIT_SIGN_INDIVIDUAL=3D&quot;1&quot; and that is he=
re to<br>
&gt;&gt; stay.<br>
&gt;&gt;<br>
&gt;&gt; Adjust the process of public key insertion into u-boot.dtb<br>
&gt;&gt; such that if FIT_SIGN_INDIVIDUAL=3D=3D1, the image signing key<br>
&gt;&gt; is inserted into u-boot.dtb first, and in any case the<br>
&gt;&gt; configuration signing key is inserted into u-boot.dtb last.<br>
&gt;&gt;<br>
&gt;&gt; The verification of the keys inserted into u-boot.dtb against<br>
&gt;&gt; unused.itb is performed only for FIT_SIGN_INDIVIDUAL!=3D1 due to<b=
r>
&gt;&gt; mkimage limitation, which does not allow mkimage -f auto-conf<br>
&gt;&gt; to update the generated unused.itb, and instead rewrites it.<br>
&gt;&gt;<br>
&gt;&gt; Fixes: 259bfa86f384 (&quot;u-boot: kernel-fitimage: Fix dependency=
 loop if <br>
&gt;&gt; UBOOT_SIGN_ENABLE and UBOOT_ENV enabled&quot;)<br>
&gt;&gt; Signed-off-by: Marek Vasut &lt;<a href=3D"mailto:marex@denx.de" ta=
rget=3D"_blank">marex@denx.de</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; Cc: Adrian Freihofer &lt;<a href=3D"mailto:adrian.freihofer@siemen=
s.com" target=3D"_blank">adrian.freihofer@siemens.com</a>&gt;<br>
&gt;&gt; Cc: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
&gt;&gt; Cc: Leonard Anderweit &lt;<a href=3D"mailto:L.Anderweit@phytec.de"=
 target=3D"_blank">L.Anderweit@phytec.de</a>&gt;<br>
&gt;&gt; Cc: Quentin Schulz &lt;<a href=3D"mailto:quentin.schulz@cherry.de"=
 target=3D"_blank">quentin.schulz@cherry.de</a>&gt;<br>
&gt;&gt; Cc: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfound=
ation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<br>
&gt;&gt; Cc: Rogerio Guerra Borin &lt;<a href=3D"mailto:rogerio.borin@torad=
ex.com" target=3D"_blank">rogerio.borin@toradex.com</a>&gt;<br>
&gt;&gt; Cc: Sean Anderson &lt;<a href=3D"mailto:seanga2@gmail.com" target=
=3D"_blank">seanga2@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; =C2=A0 meta/classes-recipe/uboot-sign.bbclass | 60 +++++++++++++++=
+++++++----<br>
&gt;&gt; =C2=A0 1 file changed, 51 insertions(+), 9 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes=
- <br>
&gt;&gt; recipe/uboot-sign.bbclass<br>
&gt;&gt; index 96c47ab0165..5c579a9fb0e 100644<br>
&gt;&gt; --- a/meta/classes-recipe/uboot-sign.bbclass<br>
&gt;&gt; +++ b/meta/classes-recipe/uboot-sign.bbclass<br>
&gt;&gt; @@ -101,27 +101,69 @@ concat_dtb() {<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 binary=3D&quot;$2&quot;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ -e &quot;${UBOOT_DTB_BINARY}&q=
uot; ]; then<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Re-sign the kernel i=
n order to add the keys to our dtb<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UBOOT_MKIMAGE_MODE=3D&=
quot;auto-conf&quot;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Signing i=
ndividual images is not recommended as that<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # makes fit=
Image susceptible to mix-and-match attack.<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # OE FIT_SIGN_INDIVIDU=
AL is implemented in an unusual manner,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # where the resulting =
signed fitImage contains both signed<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # images and signed co=
nfigurations. This is redundant. In<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # order to prevent mix=
-and-match attack, it is sufficient<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # to sign configuratio=
ns. The FIT_SIGN_INDIVIDUAL =3D &quot;1&quot;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # support is kept to a=
void breakage of existing layers, but<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # it is highly recomme=
nded to avoid FIT_SIGN_INDIVIDUAL =3D &quot;1&quot;,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # i.e. set FIT_SIGN_IN=
DIVIDUAL =3D &quot;0&quot; .<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ &quot;=
${FIT_SIGN_INDIVIDUAL}&quot; =3D &quot;1&quot; ] ; then<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 UBOOT_MKIMAGE_MODE=3D&quot;auto&quot;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 # Sign dummy image images in order to<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 # add the image signing keys to our dtb<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ${UBOOT_MKIMAGE_SIGN} \<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@&#39;-D &quot;${UBOOT_MKIMAGE_DTCOPTS}&quot;=
&#39; if <br>
&gt;&gt; len(&#39;${UBOOT_MKIMAGE_DTCOPTS}&#39;) else &#39;&#39;} \<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 -f auto \<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 -k &quot;${UBOOT_SIGN_KEYDIR}&quot; \<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 -o &quot;${FIT_HASH_ALG},${FIT_SIGN_ALG}&quot; =
\<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 -g &quot;${UBOOT_SIGN_IMG_KEYNAME}&quot; \<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 -K &quot;${UBOOT_DTB_BINARY}&quot; \<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 -d /dev/null \<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 -r ${B}/unused.itb \<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${UBOOT_MKIMAGE_SIGN_ARGS}<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Sign dummy image con=
figurations in order to<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # add the configuratio=
n signing keys to our dtb<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${UBOOT_MKI=
MAGE_SIGN} \<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ${@&#39;-D &quot;${UBOOT_MKIMAGE_DTCOPTS}&quot;&#39; if <br>
&gt;&gt; len(&#39;${UBOOT_MKIMAGE_DTCOPTS}&#39;) else &#39;&#39;} \<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -f $UBOOT_MKIMAGE_MODE \<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -f auto-conf \<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -k &quot;${UBOOT_SIGN_KEYDIR}&quot; \<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -o &quot;${FIT_HASH_ALG},${FIT_SIGN_ALG}&quot; \<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -g &quot;${UBOOT_SIGN_IMG_KEYNAME}&quot; \<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -g &quot;${UBOOT_SIGN_KEYNAME}&quot; \<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -K &quot;${UBOOT_DTB_BINARY}&quot; \<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -d /dev/null \<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -r ${B}/unused.itb \<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ${UBOOT_MKIMAGE_SIGN_ARGS}<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Verify the kernel im=
age and u-boot dtb<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${UBOOT_FIT_CHECK_SIGN=
} \<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -k &quot;${UBOOT_DTB_BINARY}&quot; \<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -f ${B}/unused.itb<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Verify the dummy fit=
Image signature against u-boot.dtb<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # augmented using publ=
ic key material.<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # This only works for =
FIT_SIGN_INDIVIDUAL =3D &quot;0&quot;, because<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # mkimage -f auto-conf=
 does not support -F to extend the<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # existing unused.itb =
, and instead rewrites unused.itb<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # from scratch.<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Using two separate u=
nused.itb for mkimage -f auto and<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # mkimage -f auto-conf=
 invocation above would not help, as<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # the signature verifi=
cation process below checks whether<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # all keys inserted in=
to u-boot.dtb /signature node pass<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # the verification. Se=
parate unused.itb would each miss one<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # of the signatures.<b=
r>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # The FIT_SIGN_INDIVID=
UAL =3D &quot;1&quot; support is kept to avoid<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # breakage of existing=
 layers, but it is highly recommended<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # to not use FIT_SIGN_=
INDIVIDUAL =3D &quot;1&quot;, i.e. set<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # FIT_SIGN_INDIVIDUAL =
=3D &quot;0&quot; .<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ &quot;${FIT_SIGN_=
INDIVIDUAL}&quot; !=3D &quot;1&quot; ] ; then<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ${UBOOT_FIT_CHECK_SIGN} \<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 -k &quot;${UBOOT_DTB_BINARY}&quot; \<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 -f ${B}/unused.itb<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cp ${UBOOT_=
DTB_BINARY} ${UBOOT_DTB_SIGNED}<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi<br>
&gt; <br>
&gt; Hey Marek,<br>
<br>
Hi,<br>
<br>
&gt; I&#39;ve built images with both FIT_SIGN_INDIVIDUAL set to &quot;0&quo=
t; and &quot;1&#39; and <br>
&gt; checked the resulting artifacts for the presence of keys and signature=
s. <br>
&gt; Everything looks fine, as far as I can tell.<br>
Thank you for testing.<br>
<br>
Could you also provide Tested-by tag ?<br>
</blockquote></div><div><br>Tested-by: Jose Quaresma &lt;<a href=3D"mailto:=
jose.quaresma@foundries.io">jose.quaresma@foundries.io</a>&gt;<br><br></div=
><div>Hi Marek,<br><br>I tested it on a couple of machines on my side and i=
t fixes the regression.<br>My tests were only on the=C2=A0scarthgap=C2=A0br=
anch.<br><br>Thanks for working on the solution.<br><br>Jose<br><br></div><=
span class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=
=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quare=
sma</div></div></div></div>

--000000000000ac9620062ef5cf06--

