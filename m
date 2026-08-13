Return-Path: <anis.bougrine10@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90D1CC5B572
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 19:11:46 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26613.1786648299426676490
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 12:11:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AqG7NxVN;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: anis.bougrine10@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c15d47266baso30906266b.3
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 12:11:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786648297; cv=none;
        d=google.com; s=arc-20260327;
        b=ZQpZn7Ep99EtviooT+2356xaCxmZX7+ZbZgGrIQswhe/B+cas4RHprHYwcV6KaECaX
         Mpuyaqj544CugObmFY16m2YzQj1l9x0zUBtNxJNduxTvnnYLjIGD7DxsznZNnOILgKQf
         4Fy4EMIQRXi/AUx4SKZDLVKy6OyAaBppKdc0FTZBVsYtFHd8TudrrGuuwYcbAoAEi6q8
         aHf5yRrYRfqZOQZ83AhuEg6lQKhQcCTdY9MlO6n+dgLOBFYNQWj/C48EqAFc9s2TpHLQ
         m5a+lfizlM1PoVW84s1FrkqJDQeuSC176d3BtfOD8MjLBbJ/vTAgZA/BlGWmj6zCtWlo
         DVew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=p8myjrwUSytMewJVefmyv6ezORJy1K1eZ/cN4k0PhiM=;
        fh=w5+IFFRrl7grbE/PEIEl+x2WbZtGy9KZKqrV2NvVqvI=;
        b=iUfj7vToap7RTd+HQRIa1vbcckidKbqdFt83dLKFreKvG5a+2szdlo5w14U+l0GgvH
         gVOPidkZmLa5Nj90kcdcGWv+1jUC7fqYIl06h4Jvi99JTgzKJoqlLiwckRkDDc4Nzz6o
         sdF6Nj9hZKejPXhPL2WHaiXYhaLgOYkNAzhvroX3gAIzzqXOMphE2WeG/ysrWm3Crpr9
         taiRc69B6UdGQhTaFbP6e1lspafHEqCXUwTrVtf0INwhWck/9+1+H9C4vlNHIm6RIIgs
         E+GXf+6oaMKUFnWPGojBMkXi6e2GCt3qoBxMRj2kOfJEAiKMB56BD065Cu7iZwvib2Jy
         JxNA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786648297; x=1787253097; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p8myjrwUSytMewJVefmyv6ezORJy1K1eZ/cN4k0PhiM=;
        b=AqG7NxVNL7l0nSJ7Iqxmm/Vb6Lw1sC+GSoeyIr9JFomwhEFsB0E4oD8UpRCDmXGBnV
         kFFcPYpCtL5GlZmIGwfGbN1jOhaGKxeRhbdhmNRYme5sq8HoIh10OvZnxfRhaMATWv6S
         IizpynRBvw9iqHoOnuqdzriD4yZpBHoSFlnSZLPfllF70u84Eq7B2JwY0nvBhvykZu1I
         PfVfIALNoSGaMO9VAQn/33uIq8t3sKVXxgofUafF/vtipqYYd2cyO1PKZW/yQNcJLFow
         Y8kcLRttIEcFjYAKWML7gtmIJiXHJAyte9QsauwDkqq197XlQAOZQZScU9ZrWJeLS5P3
         c7uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786648297; x=1787253097;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=p8myjrwUSytMewJVefmyv6ezORJy1K1eZ/cN4k0PhiM=;
        b=GMLdtLC1BJflVqNeucozCXXMhjALARubLSKQjK3t2UTsHHqxkfE0sv+anwi62OXoeL
         F0vN0BOcFmIWf3szVvibX9KLVXXoJ6TsRTWM/oo/j+GMKeVBpDs1i63Hssvb8qmUziQz
         dIPLuC1//4QQ+IdOtSuP+qCvghbSWauOjxT6XmVHCTMP8JJhAmxfhbCYoZ6pJp+dWDR7
         CxxYmgHj78ey810LlGoeT6GuhU0mhQpSicw1k6/0QEup3M8hZoqBFkOpeQSSOd4/kATr
         0YhD7mkELnNJdYmf089cyRqvK9hD36rjNuKH4fapSb8a9oRm40AoGO0WJTQlHrixQthy
         KY1w==
X-Gm-Message-State: AOJu0YyY5/DMUpzVqT0Ag4TbvhxgI4GtbEYRU2JtDNIXga6LPPCYmAdT
	GWkktYZCLve3x9SdSW9vY0bz7Q0rRFCDBmWH0CsQcpWRjCIzKbTGUBGVVjlrTiHP+IaubK3AEmZ
	PGHOEtGwoCoPHbo4gGWleBJOtywqHmmo=
X-Gm-Gg: AR+sD11q+nqprad1BQZLgipT5QqvdvWfYtu9+yLMaeoUM+zB/3TjmBhMlwlCaWUD3mA
	TFSb2Vm5iQ800x03eYXV0gbCVQs3l+wDlu9YVXqZfo+mv+lEBINpEr8lZwEOphV1gJ3oGuinaNH
	wVeDXnko/W6tq9RG3sVklx+KeNcOtNdQipqfotJsQ0XhEaQuIGxFLTyYufhZAPVn4VfDNDtKyd3
	bOfhNBJjvzZxRyy0hlsE8UYgb8OWxo7hkqfIad2ujHZwjYJToHpM6BWgYnZnjo5hg+CTlmhjuHk
	UCOPtjHrUB2CvJv4SvJrDRe7l6MzWQQ++lI2H6y0A14dttZzt0jDjqJn5aqSmPDWcyzGT4Blwka
	kSvKyEsQx26dLqvBZcHtRsY6n0z8ewQdowd7RN0gfjR/62xrfxk33QJ1DKs/UlNE=
X-Received: by 2002:a17:907:928b:b0:c16:4e5:944a with SMTP id
 a640c23a62f3a-c212a1d6bf2mr21202566b.21.1786648297411; Thu, 13 Aug 2026
 12:11:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260813181719.44168-1-anis.bougrine10@gmail.com> <CADWMC-b1Q7USpOSxnwSbR_xhzdh4P0JgrH4SntkuqB-bkqT0tQ@mail.gmail.com>
In-Reply-To: <CADWMC-b1Q7USpOSxnwSbR_xhzdh4P0JgrH4SntkuqB-bkqT0tQ@mail.gmail.com>
From: Bougrine Anis <anis.bougrine10@gmail.com>
Date: Thu, 13 Aug 2026 21:11:26 +0200
X-Gm-Features: AUfX_my0QSkIprEydcT-MUVxpupC_SK6Ekv57ccNhNRTaFVG7HgbgTJr01slOuU
Message-ID: <CAGgtUzaR6JW0Uwgwxn28qS8bX7K0-W34+xSPKPVzEoVcYJgyfQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] kernel.bbclass: add strip process for signed
 kernel modules
To: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org, ross.burton@arm.com, 
	Antonin Godard <antonin.godard@bootlin.com>, Bruce Ashfield <bruce.ashfield@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000001b17070658f2794a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 19:11:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243380

--0000000000001b17070658f2794a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jose,

Sorry, that was due to a rebase issue.
I'll submit v3 shortly.

BR,
Anis

On Thu, Aug 13, 2026 at 8:46=E2=80=AFPM Jose Quaresma <
jose.quaresma@oss.qualcomm.com> wrote:

>
>
> On Thu, Aug 13, 2026 at 7:18=E2=80=AFPM Anis Bougrine via lists.openembed=
ded.org
> <anis.bougrine10=3Dgmail.com@lists.openembedded.org> wrote:
>
>> Currently, signed kernel modules skip the stripping process in order
>> to preserve the file contents after signing. See commit:
>> 4c47e5f171fa2603355e2f9183065ce8137a18c7
>>
>> However, the kernel install Makefile supports stripping modules before
>> signing them. This allows signed modules to be stripped while preserving
>> a valid signature.
>>
>> Make non-signed kernel modules follow the standard Yocto stripping flow,
>> while signed kernel modules use the kernel Makefile stripping flow.
>>
>> Fixes [YOCTO #12927]
>>
>> Reported-by: ross.burton@arm.com
>> Signed-off-by: Anis Bougrine <anis.bougrine10@gmail.com>
>> Cc: Antonin Godard <antonin.godard@bootlin.com>
>> Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
>> ---
>> changes in v2:
>>
>> - Use the conditional INSTALL_MOD_STRIP environment variable to avoid
>>   duplicating the oe_runmake call.
>> - Use `scripts/config` script instead of grepping .config file.
>> ---
>>  meta/classes-recipe/kernel.bbclass | 8 ++++++--
>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes-recipe/kernel.bbclass
>> b/meta/classes-recipe/kernel.bbclass
>> index a82bdf7ecb..dd6e203701 100644
>> --- a/meta/classes-recipe/kernel.bbclass
>> +++ b/meta/classes-recipe/kernel.bbclass
>> @@ -451,9 +451,13 @@ kernel_do_install() {
>>         #
>>         # First install the modules
>>         #
>> -       unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
>> +       unset CFLAGS CPPFLAGS CXXFLAGS INSTALL_MOD_STRIP LDFLAGS MACHINE
>>         if (grep -q -i -e '^CONFIG_MODULES=3Dy$' .config); then
>> -               oe_runmake DEPMOD=3Decho
>> MODLIB=3D${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}
>> INSTALL_FW_PATH=3D${D}${firmwaredir} modules_install
>>
>
> You didn't test it on the master? What is the reason to drop firmwaredir?
>
> Jose
>
>
>> +               # If the module will be auto-signed, perform stripping
>> before signing.
>> +               if [ "$(${S}/scripts/config --state MODULE_SIG)" =3D "y"=
 ]
>> && [ "$(${S}/scripts/config --state MODULE_SIG_ALL)" =3D "y" ]; then
>> +                       export INSTALL_MOD_STRIP=3D"--strip-debug
>> --remove-section=3D.comment --remove-section=3D.note --preserve-dates"
>> +               fi
>> +               oe_runmake DEPMOD=3Decho
>> MODLIB=3D${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}
>> INSTALL_FW_PATH=3D${D}${nonarch_base_libdir}/firmware modules_install
>>                 rm -f
>> "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
>>                 rm -f
>> "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source"
>>                 # Remove empty module directories to prevent QA issues
>> --
>> 2.50.1 (Apple Git-155)
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#243378):
>> https://lists.openembedded.org/g/openembedded-core/message/243378
>> Mute This Topic: https://lists.openembedded.org/mt/120738257/10043485
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>> jose.quaresma@oss.qualcomm.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--0000000000001b17070658f2794a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Jose,<br><br>Sorry, that was due to a rebase issue.<br>=
I&#39;ll submit v3 shortly.<br><br>BR,<br>Anis</div><br><div class=3D"gmail=
_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu,=
 Aug 13, 2026 at 8:46=E2=80=AFPM Jose Quaresma &lt;<a href=3D"mailto:jose.q=
uaresma@oss.qualcomm.com">jose.quaresma@oss.qualcomm.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><d=
iv dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Thu, Aug 13, 2026 at 7:18=E2=80=AFPM Anis Bougrine vi=
a <a href=3D"http://lists.openembedded.org" target=3D"_blank">lists.openemb=
edded.org</a> &lt;anis.bougrine10=3D<a href=3D"mailto:gmail.com@lists.opene=
mbedded.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Currently, s=
igned kernel modules skip the stripping process in order<br>
to preserve the file contents after signing. See commit:<br>
4c47e5f171fa2603355e2f9183065ce8137a18c7<br>
<br>
However, the kernel install Makefile supports stripping modules before<br>
signing them. This allows signed modules to be stripped while preserving<br=
>
a valid signature.<br>
<br>
Make non-signed kernel modules follow the standard Yocto stripping flow,<br=
>
while signed kernel modules use the kernel Makefile stripping flow.<br>
<br>
Fixes [YOCTO #12927]<br>
<br>
Reported-by: <a href=3D"mailto:ross.burton@arm.com" target=3D"_blank">ross.=
burton@arm.com</a><br>
Signed-off-by: Anis Bougrine &lt;<a href=3D"mailto:anis.bougrine10@gmail.co=
m" target=3D"_blank">anis.bougrine10@gmail.com</a>&gt;<br>
Cc: Antonin Godard &lt;<a href=3D"mailto:antonin.godard@bootlin.com" target=
=3D"_blank">antonin.godard@bootlin.com</a>&gt;<br>
Cc: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=
=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
---<br>
changes in v2:<br>
<br>
- Use the conditional INSTALL_MOD_STRIP environment variable to avoid<br>
=C2=A0 duplicating the oe_runmake call.<br>
- Use `scripts/config` script instead of grepping .config file.<br>
---<br>
=C2=A0meta/classes-recipe/kernel.bbclass | 8 ++++++--<br>
=C2=A01 file changed, 6 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kerne=
l.bbclass<br>
index a82bdf7ecb..dd6e203701 100644<br>
--- a/meta/classes-recipe/kernel.bbclass<br>
+++ b/meta/classes-recipe/kernel.bbclass<br>
@@ -451,9 +451,13 @@ kernel_do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # First install the modules<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unset CFLAGS CPPFLAGS CXXFLAGS INSTALL_MOD_STRI=
P LDFLAGS MACHINE<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (grep -q -i -e &#39;^CONFIG_MODULES=3Dy$&#39=
; .config); then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake DEPMOD=
=3Decho MODLIB=3D${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION} INSTA=
LL_FW_PATH=3D${D}${firmwaredir} modules_install<br></blockquote><div><br></=
div><div>You didn&#39;t test it on the master? What is the reason to drop=
=C2=A0<span style=3D"background-color:transparent">firmware</span><span sty=
le=3D"background-color:transparent">dir?=C2=A0</span></div><div><span style=
=3D"background-color:transparent"><br></span></div><div><span style=3D"back=
ground-color:transparent">Jose</span></div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# If the module wil=
l be auto-signed, perform stripping before signing.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;$(${S}/s=
cripts/config --state MODULE_SIG)&quot; =3D &quot;y&quot; ] &amp;&amp; [ &q=
uot;$(${S}/scripts/config --state MODULE_SIG_ALL)&quot; =3D &quot;y&quot; ]=
; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0export INSTALL_MOD_STRIP=3D&quot;--strip-debug --remove-section=
=3D.comment --remove-section=3D.note --preserve-dates&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake DEPMOD=
=3Decho MODLIB=3D${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION} INSTA=
LL_FW_PATH=3D${D}${nonarch_base_libdir}/firmware modules_install<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f &quot;${D}${n=
onarch_base_libdir}/modules/${KERNEL_VERSION}/build&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f &quot;${D}${n=
onarch_base_libdir}/modules/${KERNEL_VERSION}/source&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Remove empty modu=
le directories to prevent QA issues<br>
-- <br>
2.50.1 (Apple Git-155)<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#243378): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/243378" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/243378</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120738257/100=
43485" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
mt/120738257/10043485</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:jose.quaresma@oss.qualcomm=
.com" target=3D"_blank">jose.quaresma@oss.qualcomm.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>
</blockquote></div>

--0000000000001b17070658f2794a--

