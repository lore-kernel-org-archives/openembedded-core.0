Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A30B0CF45C2
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 18:21:45 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39685.1768242096276169465
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jan 2026 10:21:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=v5LiFueN;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42fb6ce71c7so5703341f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 10:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768242095; x=1768846895; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=17B5SKT2jTdLinirjnZN+aWjWlp6/PjXBSsBBr0Gzfo=;
        b=v5LiFueNQX+fN28yovLWklTLL9JWUdQUNQs7BdRSdV+Ut1FSuAPR3scfPqtmoQ2lGZ
         +4Yq7h2L9BxzmxhicZfA9TwUIQbLme0TC+IFRwhU8xVQPfg/WBBuKY7JkpwEmUxHvQLX
         Gc0qS6HNXuvhQwKn3j6WYzT+smNlIm/MYjcKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768242095; x=1768846895;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=17B5SKT2jTdLinirjnZN+aWjWlp6/PjXBSsBBr0Gzfo=;
        b=kwMFdge6ocRF992k3TCsqNsfy8ve/gSbPC6lA29b/6rYtObJDhUthnlY47VlV2NuS2
         /IkpJBjIi8YRxmJLj+gkQAPLQT6c+npb56b44o0sbneKfMAeJFYi10buDzqSZZWXLKb7
         YKFjGXiGMgDEIqjb2Inp+zDEfMCeJ/BGXYt/nbSyQi/7tYkiqIpqKWNh8NUe07SX/Zfi
         f1LYYVfa9dcR2opvmb7bYOiBCskTKGK13jEiWGqoSGfmktlXJtJMq22bZQ1sxo3B3mNc
         /bbHX4QcjEFf3FZhU51Mh0LjXtFgzkP16ePTwgzWOuzI69xqqf57VNmYwZizduAVEPXZ
         3NOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGZjXf14PRktmOiMaxJFdvDUsXRZVJav/5UYbD+L7w5gZcpOk17/a6Py//vz3nfpH1FX3Xr9majuxYpO0xwRxz2g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyB6rKh1+6ZFXYpDyUWAoNUN5AG0iZZvk6fTxw7KWLGAWHKe/fn
	y6KB/KZxbLI918ZLO+jkv9dgHFt2AT8iMrFTWKBda/A/ks+c5ppzF8LZZr7hwBcC5GMqg1CYasG
	XEMdubKubHFxqXn32ch1GG65IvB8G845kdUt3lGH4Gg==
X-Gm-Gg: AY/fxX6jYQBc8csEpGb50rvp3J4dprWctSAscLLVwuyShMVQgyGGSbVm++xIi0eKyA+
	oCZCru+T+0W8W68eb75qNCZV6TjXQukrSXNrizOoj5i4GWnpiqMuak124pZ+jSQHqM0CD/epvxZ
	INngjWSArIWRY1HKhlNECl/opxU3Ok0q7zSg7pTWSxVwj/Zhx+sxH2BJE6kYe8MlLDpiAV8x6HS
	G9vpOMK4qIfFGkuHFQdqt/78qIpaCwhAdaMdMMMx5Zk1j4JBww2r3LLM//VpYtUSE1YGymUnHed
	vR6ORP0aM1j+d7CIqyHFfYUFXZoscA==
X-Google-Smtp-Source: AGHT+IGpjI990GeVU1ru30F23EtfU1ZncH8NBotKFLKV23E2EkYj04qor7iCEIIs3fWXm4O7DT/knJJW7oYXDP6lXhk=
X-Received: by 2002:a5d:64e7:0:b0:432:86f5:18a1 with SMTP id
 ffacd0b85a97d-432c363510fmr19977722f8f.0.1768242094513; Mon, 12 Jan 2026
 10:21:34 -0800 (PST)
MIME-Version: 1.0
References: <20260112071440.2411292-1-vanusuri@mvista.com> <AS1PR10MB56973C8003890BF9FDACAF5AFD81A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <CANQUz18VXhLFmi0qaTfjjpkXE7+DkoBdVrr33GaxqdAq6fct2Q@mail.gmail.com>
In-Reply-To: <CANQUz18VXhLFmi0qaTfjjpkXE7+DkoBdVrr33GaxqdAq6fct2Q@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Mon, 12 Jan 2026 19:21:07 +0100
X-Gm-Features: AZwV_QiZwyWRSKEeVl3txkRWNBjHy6ppL1SnGWlAvFjYM8Iu0kaXAEzUa885yLk
Message-ID: <CAMSfU+6TepG_G1QFpVtJQeoK3GUb=ZSqPc0_CUP0_-ouc00Uow@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][patch] gnupg: upgrade 2.4.8 -> 2.4.9
To: vanusuri@mvista.com
Cc: "Marko, Peter" <Peter.Marko@siemens.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ebae6a064834f189"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 18:21:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229218

--000000000000ebae6a064834f189
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lun. 12 janv. 2026 =C3=A0 08:30, Vijay Anusuri via lists.openembedded.or=
g
<vanusuri=3Dmvista.com@lists.openembedded.org> a =C3=A9crit :

> Hi Peter,
>
> Thanks for letting me know. Sorry, I missed your earlier patch =E2=80=94 =
I see it
> now.
>
> Steve,
>

FYI, I took over Steve's role as Stable/LTS maintainer


> Please ignore my patch.
>

Will do! :-)

Thanks!


> Thanks & Regards,
> Vijay
>
> On Mon, Jan 12, 2026 at 12:47=E2=80=AFPM Marko, Peter <Peter.Marko@siemen=
s.com>
> wrote:
>
>> Sent already 2 days ago...
>> https://lists.openembedded.org/g/openembedded-core/message/229168
>>
>> Peter
>>
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <
>> openembedded-core@lists.openembedded.org> On Behalf Of Vijay Anusuri via
>> lists.openembedded.org
>> Sent: Monday, January 12, 2026 8:15
>> To: openembedded-core@lists.openembedded.org
>> Cc: Vijay Anusuri <vanusuri@mvista.com>
>> Subject: [OE-core][scarthgap][patch] gnupg: upgrade 2.4.8 -> 2.4.9
>>
>> This release includes fix for CVE-2025-68973
>>
>> Changelog:
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> * gpg: Fix possible memory corruption in the armor parser.  [T7906]
>>
>> * gpg: Avoid potential downgrade to SHA1 in 3rd party key
>>   signatures.  [rGddb012be7f]
>>
>> * gpg: Error out on unverified output for non-detached signatures.
>>   [rG9d302f978b]
>>
>> * gpg: Do not allow compressed key packets on import.  [T7014]
>>
>> * scd: Fix a harmless read buffer over-read in a function used by
>>   PKCS#15 cards.  [T7662]
>>
>> * dirmngr: Do not require a keyserver for "gpg --fetch-key".
>>   [T7693]
>>
>> * agent: Fix ssh-agent's request_identities for skipped Brainpool
>>   keys.  [rG6bf5696c85]
>>
>> Release-info: https://dev.gnupg.org/T8001
>>
>> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> ---
>>  meta/recipes-support/gnupg/{gnupg_2.4.8.bb =3D> gnupg_2.4.9.bb} | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>  rename meta/recipes-support/gnupg/{gnupg_2.4.8.bb =3D> gnupg_2.4.9.bb}
>> (97%)
>>
>> diff --git a/meta/recipes-support/gnupg/gnupg_2.4.8.bb
>> b/meta/recipes-support/gnupg/gnupg_2.4.9.bb
>> similarity index 97%
>> rename from meta/recipes-support/gnupg/gnupg_2.4.8.bb
>> rename to meta/recipes-support/gnupg/gnupg_2.4.9.bb
>> index a6e777abf8..4f60a4e7b2 100644
>> --- a/meta/recipes-support/gnupg/gnupg_2.4.8.bb
>> +++ b/meta/recipes-support/gnupg/gnupg_2.4.9.bb
>> @@ -23,7 +23,7 @@ SRC_URI:append:class-native =3D "
>> file://0001-configure.ac-use-a-custom-value-for-
>>                                  file://relocate.patch"
>>  SRC_URI:append:class-nativesdk =3D " file://relocate.patch"
>>
>> -SRC_URI[sha256sum] =3D
>> "b58c80d79b04d3243ff49c1c3fc6b5f83138eb3784689563bcdd060595318616"
>> +SRC_URI[sha256sum] =3D
>> "dd17ab2e9a04fd79d39d853f599cbc852062ddb9ab52a4ddeb4176fd8b302964"
>>
>>  EXTRA_OECONF =3D "--disable-ldap \
>>                 --disable-ccid-driver \
>> --
>> 2.43.0
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#229186):
> https://lists.openembedded.org/g/openembedded-core/message/229186
> Mute This Topic: https://lists.openembedded.org/mt/117220079/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--000000000000ebae6a064834f189
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><br><div class=3D"gmail_quote gmail_quote_co=
ntainer"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 12 janv. 2026 =
=C3=A0=C2=A008:30, Vijay Anusuri via <a href=3D"http://lists.openembedded.o=
rg">lists.openembedded.org</a> &lt;vanusuri=3D<a href=3D"mailto:mvista.com@=
lists.openembedded.org">mvista.com@lists.openembedded.org</a>&gt; a =C3=A9c=
rit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div =
dir=3D"ltr"><div>Hi Peter,<br><br>Thanks for letting me know. Sorry, I miss=
ed your earlier patch =E2=80=94 I see it now.<br><br></div><div>Steve, <br>=
</div></div></blockquote><div><br></div><div>FYI, I took over Steve&#39;s r=
ole as Stable/LTS maintainer</div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div dir=3D"ltr"><div></div><div>Please ignore my=
 patch.</div></div></blockquote><div><br></div><div>Will do! :-)</div><div>=
<br></div><div>Thanks!</div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex"><div dir=3D"ltr"><div>Thanks &amp; Regards,<br></div><d=
iv>Vijay</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Jan 12, 2026 at 12:47=E2=80=AFPM Marko, Peter &lt;<=
a href=3D"mailto:Peter.Marko@siemens.com" target=3D"_blank">Peter.Marko@sie=
mens.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">Sent already 2 days ago...<br>
<a href=3D"https://lists.openembedded.org/g/openembedded-core/message/22916=
8" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/g/op=
enembedded-core/message/229168</a><br>
<br>
Peter<br>
<br>
-----Original Message-----<br>
From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=3D=
"_blank">openembedded-core@lists.openembedded.org</a> &lt;<a href=3D"mailto=
:openembedded-core@lists.openembedded.org" target=3D"_blank">openembedded-c=
ore@lists.openembedded.org</a>&gt; On Behalf Of Vijay Anusuri via <a href=
=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lis=
ts.openembedded.org</a><br>
Sent: Monday, January 12, 2026 8:15<br>
To: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=3D"_=
blank">openembedded-core@lists.openembedded.org</a><br>
Cc: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" target=3D"_bla=
nk">vanusuri@mvista.com</a>&gt;<br>
Subject: [OE-core][scarthgap][patch] gnupg: upgrade 2.4.8 -&gt; 2.4.9<br>
<br>
This release includes fix for CVE-2025-68973<br>
<br>
Changelog:<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
* gpg: Fix possible memory corruption in the armor parser.=C2=A0 [T7906]<br=
>
<br>
* gpg: Avoid potential downgrade to SHA1 in 3rd party key<br>
=C2=A0 signatures.=C2=A0 [rGddb012be7f]<br>
<br>
* gpg: Error out on unverified output for non-detached signatures.<br>
=C2=A0 [rG9d302f978b]<br>
<br>
* gpg: Do not allow compressed key packets on import.=C2=A0 [T7014]<br>
<br>
* scd: Fix a harmless read buffer over-read in a function used by<br>
=C2=A0 PKCS#15 cards.=C2=A0 [T7662]<br>
<br>
* dirmngr: Do not require a keyserver for &quot;gpg --fetch-key&quot;.<br>
=C2=A0 [T7693]<br>
<br>
* agent: Fix ssh-agent&#39;s request_identities for skipped Brainpool<br>
=C2=A0 keys.=C2=A0 [rG6bf5696c85]<br>
<br>
Release-info: <a href=3D"https://dev.gnupg.org/T8001" rel=3D"noreferrer" ta=
rget=3D"_blank">https://dev.gnupg.org/T8001</a><br>
<br>
Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" tar=
get=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-support/gnupg/{<a href=3D"http://gnupg_2.4.8.bb" rel=3D"=
noreferrer" target=3D"_blank">gnupg_2.4.8.bb</a> =3D&gt; <a href=3D"http://=
gnupg_2.4.9.bb" rel=3D"noreferrer" target=3D"_blank">gnupg_2.4.9.bb</a>} | =
2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta/recipes-support/gnupg/{<a href=3D"http://gnupg_2.4.8.bb" =
rel=3D"noreferrer" target=3D"_blank">gnupg_2.4.8.bb</a> =3D&gt; <a href=3D"=
http://gnupg_2.4.9.bb" rel=3D"noreferrer" target=3D"_blank">gnupg_2.4.9.bb<=
/a>} (97%)<br>
<br>
diff --git a/meta/recipes-support/gnupg/<a href=3D"http://gnupg_2.4.8.bb" r=
el=3D"noreferrer" target=3D"_blank">gnupg_2.4.8.bb</a> b/meta/recipes-suppo=
rt/gnupg/<a href=3D"http://gnupg_2.4.9.bb" rel=3D"noreferrer" target=3D"_bl=
ank">gnupg_2.4.9.bb</a><br>
similarity index 97%<br>
rename from meta/recipes-support/gnupg/<a href=3D"http://gnupg_2.4.8.bb" re=
l=3D"noreferrer" target=3D"_blank">gnupg_2.4.8.bb</a><br>
rename to meta/recipes-support/gnupg/<a href=3D"http://gnupg_2.4.9.bb" rel=
=3D"noreferrer" target=3D"_blank">gnupg_2.4.9.bb</a><br>
index a6e777abf8..4f60a4e7b2 100644<br>
--- a/meta/recipes-support/gnupg/<a href=3D"http://gnupg_2.4.8.bb" rel=3D"n=
oreferrer" target=3D"_blank">gnupg_2.4.8.bb</a><br>
+++ b/meta/recipes-support/gnupg/<a href=3D"http://gnupg_2.4.9.bb" rel=3D"n=
oreferrer" target=3D"_blank">gnupg_2.4.9.bb</a><br>
@@ -23,7 +23,7 @@ SRC_URI:append:class-native =3D &quot; file://0001-config=
ure.ac-use-a-custom-value-for-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://relocate.patch&quot;<br=
>
=C2=A0SRC_URI:append:class-nativesdk =3D &quot; file://relocate.patch&quot;=
<br>
<br>
-SRC_URI[sha256sum] =3D &quot;b58c80d79b04d3243ff49c1c3fc6b5f83138eb3784689=
563bcdd060595318616&quot;<br>
+SRC_URI[sha256sum] =3D &quot;dd17ab2e9a04fd79d39d853f599cbc852062ddb9ab52a=
4ddeb4176fd8b302964&quot;<br>
<br>
=C2=A0EXTRA_OECONF =3D &quot;--disable-ldap \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-ccid-driv=
er \<br>
-- <br>
2.43.0<br>
<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#229186): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/229186" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/229186</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117220079/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117220079/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" tar=
get=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--000000000000ebae6a064834f189--

