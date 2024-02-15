Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55F2CC4829E
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 22:14:45 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web11.4835.1708035279537450515
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 14:14:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Kv3cpx1I;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-607e705f745so7172617b3.2
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 14:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708035278; x=1708640078; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YXqCvToiynZuqcJgaK49rFvrCkTApBBxdnk5o1PH/bE=;
        b=Kv3cpx1Iml45vUSYxht+siBNQFm/v+YS9T91NyC4YGZ9iLzZrpAfitdAgunl7TTvrP
         w1z8K00GcanegRoKEm6GrZa1Ct9Cyq/PXcZsmJF+pJ0M09Ps6HruBooUgur02u2PX5ZH
         JzK8NRk1H9AjCNWgg/j5ETB2+wOi/82H6mzswcewat9NzZfjR7WIBRgEFbM/CjXnzdsU
         es0zBin8tlxYEcQU+po+hGOanmDQ8Ns+73Wd2NCxFqPwUKXcIEyWXY97gpykFyrSsLeF
         Zcq0TrR0tr2w1XVZoNWYT+epebZdDX28LgbTwm158IenzcIRwAPSbaXXKlSJnFDTDQMM
         JPnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708035278; x=1708640078;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YXqCvToiynZuqcJgaK49rFvrCkTApBBxdnk5o1PH/bE=;
        b=v8k0WzvvJHHBkSicBhtpuLvattV8m5+xc8246yDfBCukWjEaGb0jF8/EYUXg0sf5Ua
         UsEkdTOn8xiYRAO/HH5UhncRD+JbKMVCyM9P7C2WxP9xVmeRXtTGAJQujhtTKpn7uAr1
         i/yyp41rLsp0e6b9qrvPFb3BK0lfR5owifOP3pCawzjaxD69/2NbCy9PIbx8tmgrBRN4
         /ZZgnKNsvomwjxtnuHMQ0gjHxN1quMMOSKPt6/jm70EP5BXbSLdhV8hrT6RFdsU7tgsq
         hzQys4mn9x8a2QkrGphhH81yQJKfGE2oegCd8mPOOwrSTTTxbheEq0r514z7AuVuct8u
         gNdg==
X-Forwarded-Encrypted: i=1; AJvYcCX4MT1yczBxq4x2d7HYNhYMJ62kkjKjqw5c7YLWdnfCeXI552uJVmHXECfZP77QvEfMC0eXyjABnyKsv1NVAmiZZ9zaS8PEIjo9CCDcG+r+Z1BOqv7oJ6FB
X-Gm-Message-State: AOJu0Yw48RMyRk1nc3PfQUmjGSWhwh3BIA3Znf0rPVHXenAYU6NQv/k9
	HpohvBfIu99oLhDSwrK2aJkIMxibkecLvfmWTtGEaPA3VqHHXiwg1QTqYIAqy0HHHltn1zdX2fV
	QHil4HE2iT9ytpeahk++5Ok65q98=
X-Google-Smtp-Source: AGHT+IFiLW8q+pnN4kaNqXpEMBxIMv96RhKYII8a/ws8gcJpnd4uyixOn6UW/Vi2qmEnOzPhIEXvUbYRqa5yPO7gKjg=
X-Received: by 2002:a81:7bd5:0:b0:604:3e53:758f with SMTP id
 w204-20020a817bd5000000b006043e53758fmr3665801ywc.7.1708035278630; Thu, 15
 Feb 2024 14:14:38 -0800 (PST)
MIME-Version: 1.0
References: <0101018dadd3a2d9-02259879-e7fa-444b-90f0-4d4cc8b44526-000000@us-west-2.amazonses.com>
 <CANx9H-DqJNmmSmte9ZF+yYR8tEmw9WVgAk3aF3WWa8D8Hv8pDg@mail.gmail.com>
In-Reply-To: <CANx9H-DqJNmmSmte9ZF+yYR8tEmw9WVgAk3aF3WWa8D8Hv8pDg@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 15 Feb 2024 14:14:27 -0800
Message-ID: <CANx9H-DCc6ewJ=Shs2M=EY2Vg=M2AAv=YR4GUyFe_E+U=TByWA@mail.gmail.com>
Subject: Re: [OE-core] [AUH] python3-poetry-core: upgrading to 1.9.0 SUCCEEDED
To: Auto Upgrade Helper <auh@yoctoproject.org>
Cc: Tim Orling <tim.orling@konsulko.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000000bf2f9061172f45e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 22:14:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195710

--0000000000000bf2f9061172f45e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 15, 2024 at 11:43=E2=80=AFAM Tim Orling <ticotimo@gmail.com> wr=
ote:

> This version deprecates the very PEP-517 build backend we depend upon for
> the python_poetry_core bbclass.
> We do not want to take this so late in the release cycle, nor do we want
> to add all the dependencies required to build the full poetry.
>
> https://github.com/python-poetry/poetry-core/pull/692
>
> Nevermind. This was a nothing-burger. Build of python3-tomlkit was just
fine and so were its ptests (meta-python-image-ptest-python3-tomlkit).


> On Thu, Feb 15, 2024 at 9:33=E2=80=AFAM Auto Upgrade Helper <auh@yoctopro=
ject.org>
> wrote:
>
>> Hello,
>>
>> this email is a notification from the Auto Upgrade Helper
>> that the automatic attempt to upgrade the recipe *python3-poetry-core* t=
o
>> *1.9.0* has Succeeded.
>>
>> Next steps:
>>     - apply the patch: git am
>> 0001-python3-poetry-core-upgrade-1.8.1-1.9.0.patch
>>     - check the changes to upstream patches and summarize them in the
>> commit message,
>>     - compile an image that contains the package
>>     - perform some basic sanity tests
>>     - amend the patch and sign it off: git commit -s --reset-author
>> --amend
>>     - send it to the appropriate mailing list
>>
>> Alternatively, if you believe the recipe should not be upgraded at this
>> time,
>> you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
>> automatic upgrades would no longer be attempted.
>>
>> Please review the attached files for further information and build/updat=
e
>> failures.
>> Any problem please file a bug at
>> https://bugzilla.yoctoproject.org/enter_bug.cgi?product=3DAutomated%20Up=
date%20Handler
>>
>> Regards,
>> The Upgrade Helper
>>
>> -- >8 --
>> From 7441a91a0d58936eb42a90698ec8e8d80f4d72ad Mon Sep 17 00:00:00 2001
>> From: Upgrade Helper <auh@yoctoproject.org>
>> Date: Thu, 15 Feb 2024 08:16:50 +0000
>> Subject: [PATCH] python3-poetry-core: upgrade 1.8.1 -> 1.9.0
>>
>> ---
>>  ...ython3-poetry-core_1.8.1.bb =3D> python3-poetry-core_1.9.0.bb} | 2 +=
-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>  rename meta/recipes-devtools/python/{python3-poetry-core_1.8.1.bb =3D>
>> python3-poetry-core_1.9.0.bb} (94%)
>>
>> diff --git a/meta/recipes-devtools/python/python3-poetry-core_1.8.1.bb
>> b/meta/recipes-devtools/python/python3-poetry-core_1.9.0.bb
>> similarity index 94%
>> rename from meta/recipes-devtools/python/python3-poetry-core_1.8.1.bb
>> rename to meta/recipes-devtools/python/python3-poetry-core_1.9.0.bb
>> index fcb6d30ee0..dfb29c4b86 100644
>> --- a/meta/recipes-devtools/python/python3-poetry-core_1.8.1.bb
>> +++ b/meta/recipes-devtools/python/python3-poetry-core_1.9.0.bb
>> @@ -15,7 +15,7 @@ LIC_FILES_CHKSUM =3D "\
>>
>>  file://src/poetry/core/_vendor/tomli/LICENSE;md5=3Daaaaf0879d17df0110d1=
aa8c8c9f46f5
>> \
>>  "
>>
>> -SRC_URI[sha256sum] =3D
>> "67a76c671da2a70e55047cddda83566035b701f7e463b32a2abfeac6e2a16376"
>> +SRC_URI[sha256sum] =3D
>> "fa7a4001eae8aa572ee84f35feb510b321bd652e5cf9293249d62853e1f935a2"
>>
>>  inherit python_poetry_core pypi
>>  PYPI_ARCHIVE_NAME =3D "poetry_core-${PV}.${PYPI_PACKAGE_EXT}"
>> --
>> 2.42.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#195585):
>> https://lists.openembedded.org/g/openembedded-core/message/195585
>> Mute This Topic: https://lists.openembedded.org/mt/104377480/924729
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>> ticotimo@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--0000000000000bf2f9061172f45e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 15, 2024 at 11:43=E2=80=
=AFAM Tim Orling &lt;<a href=3D"mailto:ticotimo@gmail.com">ticotimo@gmail.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div dir=3D"ltr"><div>This version deprecates the very PEP-517 build back=
end we depend upon for the python_poetry_core bbclass.</div><div>We do not =
want to take this so late in the release cycle, nor do we want to add all t=
he dependencies required to build the full poetry.</div><div><br></div><div=
><a href=3D"https://github.com/python-poetry/poetry-core/pull/692" target=
=3D"_blank">https://github.com/python-poetry/poetry-core/pull/692</a><br></=
div><br></div></blockquote><div>Nevermind. This was a nothing-burger. Build=
 of python3-tomlkit=C2=A0was just fine and so were its ptests=C2=A0(meta-py=
thon-image-ptest-python3-tomlkit).</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 15, 2024 at 9:33=E2=80=
=AFAM Auto Upgrade Helper &lt;<a href=3D"mailto:auh@yoctoproject.org" targe=
t=3D"_blank">auh@yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hello,<br>
<br>
this email is a notification from the Auto Upgrade Helper<br>
that the automatic attempt to upgrade the recipe *python3-poetry-core* to *=
1.9.0* has Succeeded.<br>
<br>
Next steps:<br>
=C2=A0 =C2=A0 - apply the patch: git am 0001-python3-poetry-core-upgrade-1.=
8.1-1.9.0.patch<br>
=C2=A0 =C2=A0 - check the changes to upstream patches and summarize them in=
 the commit message,<br>
=C2=A0 =C2=A0 - compile an image that contains the package<br>
=C2=A0 =C2=A0 - perform some basic sanity tests<br>
=C2=A0 =C2=A0 - amend the patch and sign it off: git commit -s --reset-auth=
or --amend<br>
=C2=A0 =C2=A0 - send it to the appropriate mailing list<br>
<br>
Alternatively, if you believe the recipe should not be upgraded at this tim=
e,<br>
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that<br>
automatic upgrades would no longer be attempted.<br>
<br>
Please review the attached files for further information and build/update f=
ailures.<br>
Any problem please file a bug at <a href=3D"https://bugzilla.yoctoproject.o=
rg/enter_bug.cgi?product=3DAutomated%20Update%20Handler" rel=3D"noreferrer"=
 target=3D"_blank">https://bugzilla.yoctoproject.org/enter_bug.cgi?product=
=3DAutomated%20Update%20Handler</a><br>
<br>
Regards,<br>
The Upgrade Helper<br>
<br>
-- &gt;8 --<br>
From 7441a91a0d58936eb42a90698ec8e8d80f4d72ad Mon Sep 17 00:00:00 2001<br>
From: Upgrade Helper &lt;<a href=3D"mailto:auh@yoctoproject.org" target=3D"=
_blank">auh@yoctoproject.org</a>&gt;<br>
Date: Thu, 15 Feb 2024 08:16:50 +0000<br>
Subject: [PATCH] python3-poetry-core: upgrade 1.8.1 -&gt; 1.9.0<br>
<br>
---<br>
=C2=A0...<a href=3D"http://ython3-poetry-core_1.8.1.bb" rel=3D"noreferrer" =
target=3D"_blank">ython3-poetry-core_1.8.1.bb</a> =3D&gt; <a href=3D"http:/=
/python3-poetry-core_1.9.0.bb" rel=3D"noreferrer" target=3D"_blank">python3=
-poetry-core_1.9.0.bb</a>} | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta/recipes-devtools/python/{<a href=3D"http://python3-poetry=
-core_1.8.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-poetry-core_1.=
8.1.bb</a> =3D&gt; <a href=3D"http://python3-poetry-core_1.9.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">python3-poetry-core_1.9.0.bb</a>} (94%)<br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-poetry-=
core_1.8.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-poetry-core_1.8=
.1.bb</a> b/meta/recipes-devtools/python/<a href=3D"http://python3-poetry-c=
ore_1.9.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-poetry-core_1.9.=
0.bb</a><br>
similarity index 94%<br>
rename from meta/recipes-devtools/python/<a href=3D"http://python3-poetry-c=
ore_1.8.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-poetry-core_1.8.=
1.bb</a><br>
rename to meta/recipes-devtools/python/<a href=3D"http://python3-poetry-cor=
e_1.9.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-poetry-core_1.9.0.=
bb</a><br>
index fcb6d30ee0..dfb29c4b86 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-poetry-core_1.=
8.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-poetry-core_1.8.1.bb</=
a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-poetry-core_1.=
9.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-poetry-core_1.9.0.bb</=
a><br>
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0file://src/poetry/core/_vendor/tomli/LICENSE;md5=3Daaaa=
f0879d17df0110d1aa8c8c9f46f5 \<br>
=C2=A0&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;67a76c671da2a70e55047cddda83566035b701f7e463b=
32a2abfeac6e2a16376&quot;<br>
+SRC_URI[sha256sum] =3D &quot;fa7a4001eae8aa572ee84f35feb510b321bd652e5cf92=
93249d62853e1f935a2&quot;<br>
<br>
=C2=A0inherit python_poetry_core pypi<br>
=C2=A0PYPI_ARCHIVE_NAME =3D &quot;poetry_core-${PV}.${PYPI_PACKAGE_EXT}&quo=
t;<br>
-- <br>
2.42.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#195585): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/195585" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/195585</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104377480/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/104377480/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>
</blockquote></div></div>

--0000000000000bf2f9061172f45e--

