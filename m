Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BECE5C47DD9
	for <webhook@archiver.kernel.org>; Sun, 24 Mar 2024 14:17:55 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web11.30079.1711289870994960534
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Mar 2024 07:17:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=hcYwUvHK;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.180, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-609ed7ca444so33938577b3.1
        for <openembedded-core@lists.openembedded.org>; Sun, 24 Mar 2024 07:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1711289870; x=1711894670; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X8q+Qak0Zm3ASOV3Q2b2UebtcNMDa2/paVYCNJPkQDc=;
        b=hcYwUvHKQPfowSPs8niTvJKpY6GxgmzAe0W+61IX9jAEfIfnvt/BAWiBFU+6sRCTrw
         teYYeeOFkH7aWLJo+n/bdGicUGwz2KoqPshEGtZKwsd2puDxq/X3YwRAzzTJy18Vl1Vc
         wm1atdWBhVnsGnABJY/pVBMUTk7uP8O1FY4pWbU4eJi0ws9z0lPMR24OcWeV3s1AuQsW
         7AE3x316spqa6wetVNonfViisWAnye5A+X9G1Sb43LJDyJYLgiqFoHVU7UGXiM0SsKaS
         FKmohL2XbWvd+qq34x6pctGgVipHOtngwJmAayijrlk0A1s7Gdk84Rf7LovNuO4wfPFC
         rCZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711289870; x=1711894670;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X8q+Qak0Zm3ASOV3Q2b2UebtcNMDa2/paVYCNJPkQDc=;
        b=VYsjxHgkb38MgIf2dTaXKTSNJ1b3nSZ+J+Bls0I3Ovtr4bquHPdZybQFU7D10H4rnR
         3/9YjRH0ZhOBsbqsLJDLEdCHVwJsNPyehz2yowd0co2y8rJ/Moi5cB+1ahVdYqM/DenK
         XC1qlcshFBIytpmkJkrVkkw3oaog/sMTQpZ3odEb3GldQjm6fJDkE2rKmajF2s5n34PG
         bH4+W+LIjgUC5ZTrMMxRRRTBRvcbn8Sy7GWMUCjFExLfVtdfmwcvKkDpL19x14D61Ttg
         6Umu3eJz2i4tweHdmgrvWlzMClvspWhJzIS4jwMiqSjuxtY2Kd0KtowiNDJeWeA1NLUx
         948w==
X-Gm-Message-State: AOJu0YxC7bFYqPg6qQ4Ee4PpS17YeSNoiYSOA9xw+962NDBLz16OEF78
	Dk6IH4GaLjucYrkrO1YuaPmV9Bk4NJw544yB0z95K2wUFwukmTFsVvM1Ab7y/egMwBdsYCtz3MZ
	AG5tGU/TfVvCaQ+ehlM6FJJ348MLjYFb7HuXYqg==
X-Google-Smtp-Source: AGHT+IGM69NW243qEmZx/slOIbTOC+LCwUHI1SmVUOpMjJAvVgJzSnq+BftixStGxSlOav3CgbmvI8bAChKR2ItvYak=
X-Received: by 2002:a0d:d981:0:b0:609:6eb0:4714 with SMTP id
 b123-20020a0dd981000000b006096eb04714mr3361596ywe.34.1711289869609; Sun, 24
 Mar 2024 07:17:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240324111853.237AD1068FC@builder.sakoman.com> <CANNYZj_4S4KWy0YMdQuvnjEX5rMXO+rGyUemMDWQgw1z4+1OyA@mail.gmail.com>
In-Reply-To: <CANNYZj_4S4KWy0YMdQuvnjEX5rMXO+rGyUemMDWQgw1z4+1OyA@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Sun, 24 Mar 2024 04:17:40 -1000
Message-ID: <CAOSpxdZ61RdORZc_9nN4RAAUbL9igYAqqiGSgoPrKf-fp_N_5A@mail.gmail.com>
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 24 Mar
 2024 01:00:01 AM HST
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	yocto-security@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000c95498061468b804"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Mar 2024 14:17:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197477

--000000000000c95498061468b804
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://www.scmagazine.com/news/update-delays-to-nist-vulnerability-databas=
e-alarms-researchers

On Sun, Mar 24, 2024, 4:11=E2=80=AFAM Alexander Kanavin <alex.kanavin@gmail=
.com>
wrote:

> I=E2=80=99m getting slightly concerned, no new CVEs second week in a row?=
 Did the
> checker break?
>
> Alex
>
> On Sun 24. Mar 2024 at 12.18, Steve Sakoman <steve@sakoman.com> wrote:
>
>> Branch: master
>>
>> New this week: 0 CVEs
>>
>> Removed this week: 0 CVEs
>>
>> Full list:  Found 37 unpatched CVEs
>> CVE-2019-14899 (CVSS3: 7.4 HIGH): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2019-14899 *
>> CVE-2021-3714 (CVSS3: 5.9 MEDIUM): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-3714 *
>> CVE-2021-3864 (CVSS3: 7.0 HIGH): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-3864 *
>> CVE-2022-0400 (CVSS3: 7.5 HIGH): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-0400 *
>> CVE-2022-1247 (CVSS3: 7.0 HIGH): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-1247 *
>> CVE-2022-3219 (CVSS3: 3.3 LOW): gnupg:gnupg-native
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-3219 *
>> CVE-2022-38096 (CVSS3: 5.5 MEDIUM): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-38096 *
>> CVE-2022-4543 (CVSS3: 5.5 MEDIUM): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-4543 *
>> CVE-2022-46456 (CVSS3: 6.1 MEDIUM): nasm:nasm-native
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-46456 *
>> CVE-2023-1386 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-1386 *
>> CVE-2023-3397 (CVSS3: 6.3 MEDIUM): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-3397 *
>> CVE-2023-3640 (CVSS3: 7.8 HIGH): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-3640 *
>> CVE-2023-4010 (CVSS3: 4.6 MEDIUM): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-4010 *
>> CVE-2023-42363 (CVSS3: 5.5 MEDIUM): busybox
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-42363 *
>> CVE-2023-42364 (CVSS3: 5.5 MEDIUM): busybox
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-42364 *
>> CVE-2023-42365 (CVSS3: 5.5 MEDIUM): busybox
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-42365 *
>> CVE-2023-42366 (CVSS3: 5.5 MEDIUM): busybox
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-42366 *
>> CVE-2023-51767 (CVSS3: 7.0 HIGH): openssh
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-51767 *
>> CVE-2023-6238 (CVSS3: 6.7 MEDIUM): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-6238 *
>> CVE-2023-6240 (CVSS3: 6.5 MEDIUM): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-6240 *
>> CVE-2023-6270 (CVSS3: 7.0 HIGH): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-6270 *
>> CVE-2023-6356 (CVSS3: 7.5 HIGH): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-6356 *
>> CVE-2023-6535 (CVSS3: 7.5 HIGH): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-6535 *
>> CVE-2023-6536 (CVSS3: 7.5 HIGH): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-6536 *
>> CVE-2023-7042 (CVSS3: 5.5 MEDIUM): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-7042 *
>> CVE-2023-7216 (CVSS3: 5.3 MEDIUM): cpio
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-7216 *
>> CVE-2024-0841 (CVSS3: 7.8 HIGH): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-0841 *
>> CVE-2024-21803 (CVSS3: 7.8 HIGH): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-21803 *
>> CVE-2024-23307 (CVSS3: 7.8 HIGH): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-23307 *
>> CVE-2024-23848 (CVSS3: 5.5 MEDIUM): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-23848 *
>> CVE-2024-24857 (CVSS3: 6.8 MEDIUM): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-24857 *
>> CVE-2024-24858 (CVSS3: 5.3 MEDIUM): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-24858 *
>> CVE-2024-24859 (CVSS3: 4.8 MEDIUM): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-24859 *
>> CVE-2024-24861 (CVSS3: 6.3 MEDIUM): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-24861 *
>> CVE-2024-24864 (CVSS3: 4.7 MEDIUM): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-24864 *
>> CVE-2024-25739 (CVSS3: 5.5 MEDIUM): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-25739 *
>> CVE-2024-25740 (CVSS3: 5.5 MEDIUM): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-25740 *
>>
>> Summary of CVE counts by recipe:
>>   linux-yocto: 28
>>   busybox: 4
>>   cpio: 1
>>   gnupg:gnupg-native: 1
>>   nasm:nasm-native: 1
>>   openssh: 1
>>   qemu:qemu-native:qemu-system-native: 1
>>
>> For further information see:
>> https://autobuilder.yocto.io/pub/non-release/patchmetrics/
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#1109):
>> https://lists.yoctoproject.org/g/yocto-security/message/1109
>> Mute This Topic: https://lists.yoctoproject.org/mt/105117571/1686489
>> Group Owner: yocto-security+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/yocto-security/unsub [
>> alex.kanavin@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--000000000000c95498061468b804
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><a href=3D"https://www.scmagazine.com/news/update-delays-=
to-nist-vulnerability-database-alarms-researchers">https://www.scmagazine.c=
om/news/update-delays-to-nist-vulnerability-database-alarms-researchers</a>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Sun, Mar 24, 2024, 4:11=E2=80=AFAM Alexander Kanavin &lt;<a href=3D"mail=
to:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex"><div dir=3D"auto">I=E2=80=99m getting slightl=
y concerned, no new CVEs second week in a row? Did the checker break?</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun 24. Mar 2024 =
at 12.18, Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com" target=3D"=
_blank" rel=3D"noreferrer">steve@sakoman.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-w=
idth:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204=
,204,204)">Branch: master<br>
<br>
New this week: 0 CVEs<br>
<br>
Removed this week: 0 CVEs<br>
<br>
Full list:=C2=A0 Found 37 unpatched CVEs<br>
CVE-2019-14899 (CVSS3: 7.4 HIGH): linux-yocto <a href=3D"https://web.nvd.ni=
st.gov/view/vuln/detail?vulnId=3DCVE-2019-14899" rel=3D"noreferrer noreferr=
er" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCV=
E-2019-14899</a> *<br>
CVE-2021-3714 (CVSS3: 5.9 MEDIUM): linux-yocto <a href=3D"https://web.nvd.n=
ist.gov/view/vuln/detail?vulnId=3DCVE-2021-3714" rel=3D"noreferrer noreferr=
er" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCV=
E-2021-3714</a> *<br>
CVE-2021-3864 (CVSS3: 7.0 HIGH): linux-yocto <a href=3D"https://web.nvd.nis=
t.gov/view/vuln/detail?vulnId=3DCVE-2021-3864" rel=3D"noreferrer noreferrer=
" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-=
2021-3864</a> *<br>
CVE-2022-0400 (CVSS3: 7.5 HIGH): linux-yocto <a href=3D"https://web.nvd.nis=
t.gov/view/vuln/detail?vulnId=3DCVE-2022-0400" rel=3D"noreferrer noreferrer=
" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-=
2022-0400</a> *<br>
CVE-2022-1247 (CVSS3: 7.0 HIGH): linux-yocto <a href=3D"https://web.nvd.nis=
t.gov/view/vuln/detail?vulnId=3DCVE-2022-1247" rel=3D"noreferrer noreferrer=
" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-=
2022-1247</a> *<br>
CVE-2022-3219 (CVSS3: 3.3 LOW): gnupg:gnupg-native <a href=3D"https://web.n=
vd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-3219" rel=3D"noreferrer nore=
ferrer" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=
=3DCVE-2022-3219</a> *<br>
CVE-2022-38096 (CVSS3: 5.5 MEDIUM): linux-yocto <a href=3D"https://web.nvd.=
nist.gov/view/vuln/detail?vulnId=3DCVE-2022-38096" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3D=
CVE-2022-38096</a> *<br>
CVE-2022-4543 (CVSS3: 5.5 MEDIUM): linux-yocto <a href=3D"https://web.nvd.n=
ist.gov/view/vuln/detail?vulnId=3DCVE-2022-4543" rel=3D"noreferrer noreferr=
er" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCV=
E-2022-4543</a> *<br>
CVE-2022-46456 (CVSS3: 6.1 MEDIUM): nasm:nasm-native <a href=3D"https://web=
.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-46456" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vuln=
Id=3DCVE-2022-46456</a> *<br>
CVE-2023-1386 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native <a hre=
f=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-1386" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/=
vuln/detail?vulnId=3DCVE-2023-1386</a> *<br>
CVE-2023-3397 (CVSS3: 6.3 MEDIUM): linux-yocto <a href=3D"https://web.nvd.n=
ist.gov/view/vuln/detail?vulnId=3DCVE-2023-3397" rel=3D"noreferrer noreferr=
er" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCV=
E-2023-3397</a> *<br>
CVE-2023-3640 (CVSS3: 7.8 HIGH): linux-yocto <a href=3D"https://web.nvd.nis=
t.gov/view/vuln/detail?vulnId=3DCVE-2023-3640" rel=3D"noreferrer noreferrer=
" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-=
2023-3640</a> *<br>
CVE-2023-4010 (CVSS3: 4.6 MEDIUM): linux-yocto <a href=3D"https://web.nvd.n=
ist.gov/view/vuln/detail?vulnId=3DCVE-2023-4010" rel=3D"noreferrer noreferr=
er" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCV=
E-2023-4010</a> *<br>
CVE-2023-42363 (CVSS3: 5.5 MEDIUM): busybox <a href=3D"https://web.nvd.nist=
.gov/view/vuln/detail?vulnId=3DCVE-2023-42363" rel=3D"noreferrer noreferrer=
" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-=
2023-42363</a> *<br>
CVE-2023-42364 (CVSS3: 5.5 MEDIUM): busybox <a href=3D"https://web.nvd.nist=
.gov/view/vuln/detail?vulnId=3DCVE-2023-42364" rel=3D"noreferrer noreferrer=
" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-=
2023-42364</a> *<br>
CVE-2023-42365 (CVSS3: 5.5 MEDIUM): busybox <a href=3D"https://web.nvd.nist=
.gov/view/vuln/detail?vulnId=3DCVE-2023-42365" rel=3D"noreferrer noreferrer=
" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-=
2023-42365</a> *<br>
CVE-2023-42366 (CVSS3: 5.5 MEDIUM): busybox <a href=3D"https://web.nvd.nist=
.gov/view/vuln/detail?vulnId=3DCVE-2023-42366" rel=3D"noreferrer noreferrer=
" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-=
2023-42366</a> *<br>
CVE-2023-51767 (CVSS3: 7.0 HIGH): openssh <a href=3D"https://web.nvd.nist.g=
ov/view/vuln/detail?vulnId=3DCVE-2023-51767" rel=3D"noreferrer noreferrer" =
target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-20=
23-51767</a> *<br>
CVE-2023-6238 (CVSS3: 6.7 MEDIUM): linux-yocto <a href=3D"https://web.nvd.n=
ist.gov/view/vuln/detail?vulnId=3DCVE-2023-6238" rel=3D"noreferrer noreferr=
er" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCV=
E-2023-6238</a> *<br>
CVE-2023-6240 (CVSS3: 6.5 MEDIUM): linux-yocto <a href=3D"https://web.nvd.n=
ist.gov/view/vuln/detail?vulnId=3DCVE-2023-6240" rel=3D"noreferrer noreferr=
er" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCV=
E-2023-6240</a> *<br>
CVE-2023-6270 (CVSS3: 7.0 HIGH): linux-yocto <a href=3D"https://web.nvd.nis=
t.gov/view/vuln/detail?vulnId=3DCVE-2023-6270" rel=3D"noreferrer noreferrer=
" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-=
2023-6270</a> *<br>
CVE-2023-6356 (CVSS3: 7.5 HIGH): linux-yocto <a href=3D"https://web.nvd.nis=
t.gov/view/vuln/detail?vulnId=3DCVE-2023-6356" rel=3D"noreferrer noreferrer=
" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-=
2023-6356</a> *<br>
CVE-2023-6535 (CVSS3: 7.5 HIGH): linux-yocto <a href=3D"https://web.nvd.nis=
t.gov/view/vuln/detail?vulnId=3DCVE-2023-6535" rel=3D"noreferrer noreferrer=
" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-=
2023-6535</a> *<br>
CVE-2023-6536 (CVSS3: 7.5 HIGH): linux-yocto <a href=3D"https://web.nvd.nis=
t.gov/view/vuln/detail?vulnId=3DCVE-2023-6536" rel=3D"noreferrer noreferrer=
" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-=
2023-6536</a> *<br>
CVE-2023-7042 (CVSS3: 5.5 MEDIUM): linux-yocto <a href=3D"https://web.nvd.n=
ist.gov/view/vuln/detail?vulnId=3DCVE-2023-7042" rel=3D"noreferrer noreferr=
er" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCV=
E-2023-7042</a> *<br>
CVE-2023-7216 (CVSS3: 5.3 MEDIUM): cpio <a href=3D"https://web.nvd.nist.gov=
/view/vuln/detail?vulnId=3DCVE-2023-7216" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-=
7216</a> *<br>
CVE-2024-0841 (CVSS3: 7.8 HIGH): linux-yocto <a href=3D"https://web.nvd.nis=
t.gov/view/vuln/detail?vulnId=3DCVE-2024-0841" rel=3D"noreferrer noreferrer=
" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-=
2024-0841</a> *<br>
CVE-2024-21803 (CVSS3: 7.8 HIGH): linux-yocto <a href=3D"https://web.nvd.ni=
st.gov/view/vuln/detail?vulnId=3DCVE-2024-21803" rel=3D"noreferrer noreferr=
er" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCV=
E-2024-21803</a> *<br>
CVE-2024-23307 (CVSS3: 7.8 HIGH): linux-yocto <a href=3D"https://web.nvd.ni=
st.gov/view/vuln/detail?vulnId=3DCVE-2024-23307" rel=3D"noreferrer noreferr=
er" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCV=
E-2024-23307</a> *<br>
CVE-2024-23848 (CVSS3: 5.5 MEDIUM): linux-yocto <a href=3D"https://web.nvd.=
nist.gov/view/vuln/detail?vulnId=3DCVE-2024-23848" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3D=
CVE-2024-23848</a> *<br>
CVE-2024-24857 (CVSS3: 6.8 MEDIUM): linux-yocto <a href=3D"https://web.nvd.=
nist.gov/view/vuln/detail?vulnId=3DCVE-2024-24857" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3D=
CVE-2024-24857</a> *<br>
CVE-2024-24858 (CVSS3: 5.3 MEDIUM): linux-yocto <a href=3D"https://web.nvd.=
nist.gov/view/vuln/detail?vulnId=3DCVE-2024-24858" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3D=
CVE-2024-24858</a> *<br>
CVE-2024-24859 (CVSS3: 4.8 MEDIUM): linux-yocto <a href=3D"https://web.nvd.=
nist.gov/view/vuln/detail?vulnId=3DCVE-2024-24859" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3D=
CVE-2024-24859</a> *<br>
CVE-2024-24861 (CVSS3: 6.3 MEDIUM): linux-yocto <a href=3D"https://web.nvd.=
nist.gov/view/vuln/detail?vulnId=3DCVE-2024-24861" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3D=
CVE-2024-24861</a> *<br>
CVE-2024-24864 (CVSS3: 4.7 MEDIUM): linux-yocto <a href=3D"https://web.nvd.=
nist.gov/view/vuln/detail?vulnId=3DCVE-2024-24864" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3D=
CVE-2024-24864</a> *<br>
CVE-2024-25739 (CVSS3: 5.5 MEDIUM): linux-yocto <a href=3D"https://web.nvd.=
nist.gov/view/vuln/detail?vulnId=3DCVE-2024-25739" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3D=
CVE-2024-25739</a> *<br>
CVE-2024-25740 (CVSS3: 5.5 MEDIUM): linux-yocto <a href=3D"https://web.nvd.=
nist.gov/view/vuln/detail?vulnId=3DCVE-2024-25740" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3D=
CVE-2024-25740</a> *<br>
<br>
Summary of CVE counts by recipe:<br>
=C2=A0 linux-yocto: 28<br>
=C2=A0 busybox: 4<br>
=C2=A0 cpio: 1<br>
=C2=A0 gnupg:gnupg-native: 1<br>
=C2=A0 nasm:nasm-native: 1<br>
=C2=A0 openssh: 1<br>
=C2=A0 qemu:qemu-native:qemu-system-native: 1<br>
<br>
For further information see: <a href=3D"https://autobuilder.yocto.io/pub/no=
n-release/patchmetrics/" rel=3D"noreferrer noreferrer" target=3D"_blank">ht=
tps://autobuilder.yocto.io/pub/non-release/patchmetrics/</a><br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#1109): <a href=3D"https://lists.yoctoproject.org/g/yoct=
o-security/message/1109" rel=3D"noreferrer noreferrer" target=3D"_blank">ht=
tps://lists.yoctoproject.org/g/yocto-security/message/1109</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/105117571/168=
6489" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.yoctopr=
oject.org/mt/105117571/1686489</a><br>
Group Owner: <a href=3D"mailto:yocto-security%2Bowner@lists.yoctoproject.or=
g" target=3D"_blank" rel=3D"noreferrer">yocto-security+owner@lists.yoctopro=
ject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/yocto-security/uns=
ub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.yoctoproj=
ect.org/g/yocto-security/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.co=
m" target=3D"_blank" rel=3D"noreferrer">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>
</blockquote></div>

--000000000000c95498061468b804--

