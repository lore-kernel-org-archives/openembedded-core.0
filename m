Return-Path: <saisneha196@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 691FACD98C6
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 05:41:28 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39082.1781156483681941863
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 22:41:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gcZ8GIPk;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: saisneha196@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-bec449cf976so1039646066b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 22:41:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781156482; cv=none;
        d=google.com; s=arc-20240605;
        b=SRRD1pOTR2n4EYl1FQT8e2c+/TWcNRN2R3cQFHZcrkQwFDLcslCC4s7LCAR9ATGlBA
         svIh2fJRi+MFHAL2XRqzD+5+3zhw+ou/CZaF0G5Rng3aIkC7l38mY9sy8n891aIBz+U8
         gupVSs38Qo1AFYm9g+p+0dvjJtmz+uCU6gr/Y4WR+bDOKsBJAEdQP7ed2YyKkWXyr46H
         0WLKadx4SqEocULDGQcjzVouQNZK2dnXxVh4EPEsuwHyx0VkIqpTMzhcaMiaMxCU02DW
         iu5E2ydNBRsmxAGf0HAChlyFlaIJa19VtnPUtLdJp2k3TnPVzrjRDY5fx49hyY+78DW6
         kawA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AJgSYJB9aehOOP4WAWkF3uLbci4eVkL4gWhcEcIelxI=;
        fh=pcYHIF76PvKqDxEqj/8/yT1n6HjPwjRLAawjTbDsu14=;
        b=lavs1qK7ZauCHiXPOkeDipCTmlVOpflc3rXwlU5zkNDUrqIJ1Gz5jxfVspX625z5eC
         imoHDwFs9Z4u+Y8Hyv60Vpz3O/SEaPV05q2OhSq5U3bu0izNFdEdoGDQRLGkeM8e/Oei
         Cj2Z2GJPLMVYOeBrNGLt15G9mBp9rp4u1FAzidiL2uyeOa2JYVEJ2vI78m/4DRK1DKiP
         8+FZAm1AmDb9XElAfYbEibQF29uFObZpShV/gIqJ2eRXb/EEXhxnPmgBOHxzxA3RJ1PI
         M+qlL4tvRY5qiXCYPBvcbP4D7+yUGlZiN/0f5anqfNr+8F2aPZH3tkX9Do5xrPDVpGcP
         fWyw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781156482; x=1781761282; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AJgSYJB9aehOOP4WAWkF3uLbci4eVkL4gWhcEcIelxI=;
        b=gcZ8GIPk3Y0K9BsMjxiIkCEu/Xo43Ea6vNF5p993fDcmuIse7GY6SGestBWzm1aoLg
         UGGqSv0FtZMeqBPFUy1D3Em7G/z6lDPdM/m+cnx0il+j3blwqopZo0hhbcLMSd3E+yGd
         Fq6G321w3BV3ZWOHyKiSxaAqbupIp/ShnvV6Nmb0fZY3Wcx3YoOm3EHkapIiCNI5ZTFX
         5VAY0+hHUQOzPFyEJjOVQkA9GrmpIaQQEpmr1Ml7Wo5BxSprsN9ZaZaWac/2LUA3DQlK
         6bu2EQuzOu3ObdpECFy4V1oHTyk4LuCd0n07opCADSghO5nLkZzOjPTJe0Ffrccq/E6u
         Nzfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781156482; x=1781761282;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJgSYJB9aehOOP4WAWkF3uLbci4eVkL4gWhcEcIelxI=;
        b=C/DbusQj4QvIlEPlpkFCTe50BpBh2DPZHBkTJ64WC1dwtZ2s+kbr6jCjx9kufGrOBw
         2v4HBEmYVrFSbYEyuEf+j6H0A9aUkh1v787BT8g4AYtBQ2daH8xG9rnrWyu915t2pXDQ
         h2gpnLWa/zjowiUn6W6gbNas6xJRff4+m6LR8luK9eeciOB38Vp70x3+mczMBiCob7U3
         PB5zbjtn8Sm9ifg9zkwWOhhDl3+KrG7+sXaMYZeVPVUA1qBssR6SG9NEfLS0xMYF9OE8
         MZMgq++Ghp5S3jipUU3TEX+bVoT8VayOyfyiqgWS47TpcqI8EVSBSqXOYkKsXMoq/j+Q
         2SKA==
X-Forwarded-Encrypted: i=1; AFNElJ+VLv+FQX3vli4QpXm8rI6zQRfj9mo0Gi9kSUXd3vvztj7cYGfFA+vceYmdDS8p0OcrkF8tz6Ygy864g929vFaHRw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz/ZZ02Kvf7ZdF9AmKnqyNdfOoESOLy8k2PXvKKEpvnvfdbwMLq
	fpWKWXNPNWYpFI+4q3nmtZ018qpqV9b2CCh4YUSYLI06L/X5chBNRBorDQGZ7gtkxyvBRzpTtMl
	Crr2A+U/V9Y7UU3e8Lq2ILSegt/GrkJc=
X-Gm-Gg: Acq92OHO3wp3ut0hTPzw47YYAcA62xNl2qjfyx4NNsV8jmn6fGZTZ/l0cbNOQOihq/7
	mYBRlWE0yFUUD9ux2LSgMp3PDrU8cfeQTBgIfCG7iZdDWjmSKcNp8dY7b/PW/yvMCHmvyE+2VTE
	5oklQ0u4wZvIpKxSvxndgguLi0O4f+Thmi9mpFDyRMdN0cz59+I4Kzjdum24c0ISRmEMhnhGEH4
	Vi9AC0lMlBIM4WNFpYADfclr/OWw71bUI0y6xVxzR2YOis0wPt3mCAxHxvxBFXfqkukLb/TXC0g
	StFqlyQTtJlIW5rQNz0GodNlekMbx9AGYXlm97aD7KuW4/FRzUu0
X-Received: by 2002:a17:906:8a44:b0:bf0:3fd1:d180 with SMTP id
 a640c23a62f3a-bfc8552ea18mr28566366b.8.1781156481299; Wed, 10 Jun 2026
 22:41:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260602062940.3107241-1-saisneha196@gmail.com>
 <20260602062940.3107241-4-saisneha196@gmail.com> <DIYF5VYJ6KMJ.3EBC3FMJXOLPL@smile.fr>
 <18B61AC5A22983D6.29982@lists.openembedded.org> <CANcU11dYfjDYfDq152H-Yanv3gJ__b=dUewq+sKL=hHKrisQvw@mail.gmail.com>
 <80ef3660a609e1f080a6ec80872674cbcadb87c0.camel@linuxfoundation.org>
 <CANcU11fqh7bRUo=h9C3woRYnpmwnbUjBkGwpbhs1QV4rhnm4Cw@mail.gmail.com>
 <a5e0dca3e1eba8b86203fa63ba0c6bc7ce228a21.camel@linuxfoundation.org>
 <CANcU11cf4sH1racrRawKMQ8+622W_1qT33ou=Z06YG=38FJJcA@mail.gmail.com>
 <ad7d4fdddcf28b3e7daba91cb0e7d100e9bb5f4b.camel@linuxfoundation.org>
 <18B7A1AFC3F003C5.267903@lists.openembedded.org> <CANcU11dmkfUA7E8=Qm8O1J8VZLHEv=FW3Gjm2bVpHqvsi7AvUg@mail.gmail.com>
 <954159bfc9f674bde4da8e0133143589e4945e65.camel@linuxfoundation.org> <18B7AC064DEA1221.267903@lists.openembedded.org>
In-Reply-To: <18B7AC064DEA1221.267903@lists.openembedded.org>
From: Sai Sneha <saisneha196@gmail.com>
Date: Thu, 11 Jun 2026 11:11:08 +0530
X-Gm-Features: AVVi8Ce69RcNAWnb4rJf-J052lbBXt73wKgayevHsb_R2Ru0PZat1ZJT7ID08E0
Message-ID: <CANcU11dmCyk=jyg+E_KhZwG7JYBdo8Fv9iHwDMggWsARpjS34Q@mail.gmail.com>
Subject: Re: [OE-core] insane.bbclass: add missing-srcrev QA check for SCM URIs
To: saisneha196@gmail.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Yoann Congal <yoann.congal@smile.fr>, openembedded-core@lists.openembedded.org, 
	corentin.guillevic@smile.fr, martin@geanix.com, paul@pbarker.dev, 
	mathieu.dubois-briand@bootlin.com
Content-Type: multipart/alternative; boundary="0000000000005b7aa10653f3cf69"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 05:41:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238421

--0000000000005b7aa10653f3cf69
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

While testing I have also noticed something in the error message
when no name=3D parameter is set in the URI, the candidates list
includes SRCREV_default and SRCREV_default:pn-X even though no
name was explicitly specified.looking at the code, self.name
defaults to 'default' when no name=3D param exists (line 1353 of
__init__.py) which is what causes this.

Is this intentional behavior or is the candidates list supposed
to only include SRCREV:pn-X and SRCREV when no name=3D is set?

Best regards,
Sai Sneha


On Wed, 10 Jun 2026 at 2:18=E2=80=AFPM, Sai Sneha via lists.openembedded.or=
g
<saisneha196=3Dgmail.com@lists.openembedded.org> wrote:

> Hi Richard,
>
> I tested this locally. You are right that the error message is
> already clear:
>
> "Please set a valid SRCREV for url..."
>
> However parsing halts for ALL recipes with:
>
> "ERROR: Parsing halted due to errors"
>
> Not just the offending recipe. Is that acceptable behavior or
> does it need fixing?
>
> Best regards,
> Sai Sneha
>
>
> On Wed, 10 Jun 2026 at 12:03=E2=80=AFPM, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
>
>> On Wed, 2026-06-10 at 11:47 +0530, Sai Sneha wrote:
>> >
>> > I tested BB_NO_NETWORK:layer-core =3D "1" and found that it does
>> > not prevent the parse crash for the case where SRCREV is
>> > completely missing.
>> >
>> > The crash happens in srcrev_internal_helper() which raises
>> > FetchError before any network access is attempted =E2=80=94 so
>> > BB_NO_NETWORK never gets checked. The BB_NO_NETWORK flag would
>> > only help for the case where SRCREV is set to a floating
>> > branch/tag and latest_revision() is called, since _lsremote()
>> > calls check_network_access() there.
>>
>> FetchError isn't a crash, the code is finding there is a problem and
>> raising an exception. The exception should say what the issue is.
>>
>> Doesn't that mean that case is already covered and we don't need to do
>> anything further?
>>
>> > So it seems like two separate fixes are needed:
>> >
>> > 1. For missing SRCREV =E2=80=94 something needs to prevent the parse
>> >    crash in srcrev_internal_helper(). Would it be appropriate
>> >    to check BB_NO_NETWORK in srcrev_internal_helper() itself
>> >    before raising FetchError?
>>
>> I don't understand why we need to trap this, then handle it again
>> later?
>>
>> Cheers,
>>
>> Richard
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#238324):
> https://lists.openembedded.org/g/openembedded-core/message/238324
> Mute This Topic: https://lists.openembedded.org/mt/119719972/10302268
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> saisneha196@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000005b7aa10653f3cf69
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div style=3D"font-size:inherit" dir=3D"auto">While testing I have als=
o noticed something in the error message =C2=A0<br style=3D"font-size:inher=
it">when no name=3D parameter is set in the URI, the candidates list <br st=
yle=3D"font-size:inherit">includes SRCREV_default and SRCREV_default:pn-X e=
ven though no <br style=3D"font-size:inherit">name was explicitly specified=
.looking at the code, <a href=3D"http://self.name">self.name</a> <br style=
=3D"font-size:inherit">defaults to &#39;default&#39; when no name=3D param =
exists (line 1353 of <br style=3D"font-size:inherit">__init__.py) which is =
what causes this.<br style=3D"font-size:inherit"><br style=3D"font-size:inh=
erit">Is this intentional behavior or is the candidates list supposed <br s=
tyle=3D"font-size:inherit">to only include SRCREV:pn-X and SRCREV when no n=
ame=3D is set?<br style=3D"font-size:inherit"><br style=3D"font-size:inheri=
t">Best regards,<br style=3D"font-size:inherit">Sai Sneha</div><br></div><d=
iv><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Wed, 10 Jun 2026 at 2:18=E2=80=AFPM, Sai Sneha via <a=
 href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;sais=
neha196=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lis=
ts.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div><div style=3D"font-size:inherit">Hi Richard,<br sty=
le=3D"font-size:inherit"><br style=3D"font-size:inherit">I tested this loca=
lly. You are right that the error message is <br style=3D"font-size:inherit=
">already clear:<br style=3D"font-size:inherit"><br style=3D"font-size:inhe=
rit">  &quot;Please set a valid SRCREV for url...&quot;<br style=3D"font-si=
ze:inherit"><br style=3D"font-size:inherit">However parsing halts for ALL r=
ecipes with:<br style=3D"font-size:inherit"><br style=3D"font-size:inherit"=
>  &quot;ERROR: Parsing halted due to errors&quot;<br style=3D"font-size:in=
herit"><br style=3D"font-size:inherit">Not just the offending recipe. Is th=
at acceptable behavior or <br style=3D"font-size:inherit">does it need fixi=
ng?<br style=3D"font-size:inherit"><br style=3D"font-size:inherit">Best reg=
ards,<br style=3D"font-size:inherit">Sai Sneha<br style=3D"font-size:inheri=
t"></div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Wed, 10 Jun 2026 at 12:03=E2=80=AFPM, Richard Purdie &=
lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">=
richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">On Wed, 2026-06-10 at 11:47 +0530, Sai Sn=
eha wrote:<br>
&gt; <br>
&gt; I tested BB_NO_NETWORK:layer-core =3D &quot;1&quot; and found that it =
does <br>
&gt; not prevent the parse crash for the case where SRCREV is <br>
&gt; completely missing.<br>
&gt; <br>
&gt; The crash happens in srcrev_internal_helper() which raises <br>
&gt; FetchError before any network access is attempted =E2=80=94 so <br>
&gt; BB_NO_NETWORK never gets checked. The BB_NO_NETWORK flag would <br>
&gt; only help for the case where SRCREV is set to a floating <br>
&gt; branch/tag and latest_revision() is called, since _lsremote() <br>
&gt; calls check_network_access() there.<br>
<br>
FetchError isn&#39;t a crash, the code is finding there is a problem and<br=
>
raising an exception. The exception should say what the issue is.<br>
<br>
Doesn&#39;t that mean that case is already covered and we don&#39;t need to=
 do<br>
anything further?<br>
<br>
&gt; So it seems like two separate fixes are needed:<br>
&gt; <br>
&gt; 1. For missing SRCREV =E2=80=94 something needs to prevent the parse <=
br>
&gt; =C2=A0=C2=A0=C2=A0crash in srcrev_internal_helper(). Would it be appro=
priate <br>
&gt; =C2=A0=C2=A0=C2=A0to check BB_NO_NETWORK in srcrev_internal_helper() i=
tself <br>
&gt; =C2=A0=C2=A0=C2=A0before raising FetchError?<br>
<br>
I don&#39;t understand why we need to trap this, then handle it again<br>
later?<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#238324): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/238324" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/238324</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119719972/103=
02268" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
mt/119719972/10302268</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:saisneha196@gmail.com" tar=
get=3D"_blank">saisneha196@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000005b7aa10653f3cf69--

