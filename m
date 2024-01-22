Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E571DC4725D
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 10:40:29 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.70676.1705920029171544925
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 02:40:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dqgoP4tp;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3392b15ca41so879171f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 02:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705920027; x=1706524827; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3cKxf8X6bW/YWNL7M1gCRK2yQr+jjhOtrKzGuZrRhfA=;
        b=dqgoP4tpH1ZBL6vxmV6s+hbIYcSw0r7xu4UDLWMEMSQbbxOo2QdYc49xxejjNc5Tkb
         G5wBsIsyUgCPucSokDeZ/j99oD6FClmG1FtZamqzKbKLtDftOVJoIDnj/EQMWFnDH/0H
         6D8peJn2J182T6SV1O9MjBeO28RnEscVjH9TcYXUAnief7GtfJqmL1mybvUsUJ+4oWd5
         2A6kp68beK8FINvkgQQ5TBxPYmIr6vSy3FaS6W7IrqfnHXc3Rli11AvRst/hoBvp1ZOe
         KlHxplJ6AedXQ3b7l6XE+XBvx6X49U7cn5SiZGR0+Pf0H0gF9sG/cyvC/AD+o/mu3tU1
         yLEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705920027; x=1706524827;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3cKxf8X6bW/YWNL7M1gCRK2yQr+jjhOtrKzGuZrRhfA=;
        b=F0DDW82n7N0majwEINHsBHY0dUImlo0KU51KyG6cLyf+j99FVxL8r3z8LALpQ0pym4
         VB0vYgmcMGwkGt0on4z9sL2p1D3Aba1IJXyan7+6zXytnXhvt9apnseVfdpFYqwOGY7C
         CXbS5KEu+QXl0PLITDQvJRV8ur9lczufE5uYUbS3k6bkpUDhcWAiSdednGVdArB5a1C8
         Mk86wzZLCXsj2fel5sfWJR+MrEdoGT1GFdObEJvhhv7LAeQ+Qo/RF5SgZ5/FnKrXhlKH
         Vz4E8msVt0FbXi7LeimSXUGMUe8rRTs24CX5U5opJq/ybSsq8d0IPOytyNLrwT+M7xhf
         vm/Q==
X-Gm-Message-State: AOJu0YznRt7qPo/M3aZdihMCA69rj2PdcaZ75QSPLhNNY3FFU0I4yakn
	Q4jTbx0y6rV6+HkIlco1nvslLfef8qCUyTzWdRFoJlZ1W1JlfULht4JbHDpTEQaTEqVFpiN2ibs
	RofgIgEtjt8eVZi+uxVyNXlq2+DdGpkFg17g=
X-Google-Smtp-Source: AGHT+IGBajr1wf7Z8nLxRVKWQi6HbHicLsqwZ7v92dAiOZyCaB1T3FVDt5NpSElUpvtkXZDOSl5D54PD4XgLKGNp8rQ=
X-Received: by 2002:adf:f203:0:b0:337:d856:a558 with SMTP id
 p3-20020adff203000000b00337d856a558mr1914538wro.71.1705920027093; Mon, 22 Jan
 2024 02:40:27 -0800 (PST)
MIME-Version: 1.0
References: <20240119073509.934362-1-changqing.li@windriver.com>
 <CA+chaQdSeJ7jG4Q23RRxyOOS3g4NRieeGOkNJbmJiAs7NAWFfQ@mail.gmail.com> <44133af7-6afb-459e-bc29-8c3d1419e9a9@windriver.com>
In-Reply-To: <44133af7-6afb-459e-bc29-8c3d1419e9a9@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 22 Jan 2024 11:40:15 +0100
Message-ID: <CA+chaQexRZushXHywUAWWSA2SS6gSpog4d=icfSRSD3Z9kTDMA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] tcmode-default.inc: use ?= to set PREFERRED_VERSION_llvm/llvm-native/nativesdk-llvm
To: Changqing Li <changqing.li@windriver.com>
Cc: Changqing Li <changqing.li@eng.windriver.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003aee74060f8675b8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 10:40:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194139

--0000000000003aee74060f8675b8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

So please suggest a variable name which Richard will accept as I think it's
easier to use separate variable than overriding all 3
PREFERRED_VERSION_llvm* to version currently in oe-core whenever someone
wants to use meta-clang.

On Mon, Jan 22, 2024 at 1:58=E2=80=AFAM Changqing Li <changqing.li@windrive=
r.com>
wrote:

> Yes
> On 1/19/24 19:57, Martin Jansa wrote:
>
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender an=
d
> know the content is safe.
> Do you need to override the  PREFERRED_VERSION_? instead of overriding
> LLVMVERSION?
>
> Aren't you trying to fix what was fixed in proposed change a while ago:
>
> https://patchwork.yoctoproject.org/project/oe-core/patch/20230401163241.3=
54257-1-Martin.Jansa@gmail.com/
> <https://urldefense.com/v3/__https://patchwork.yoctoproject.org/project/o=
e-core/patch/20230401163241.354257-1-Martin.Jansa@gmail.com/__;!!AjveYdw8Ev=
Q!fHtiSeYD8TPEVNtjfDtPZrodZY3GykPPupY5y-fmJHKZ6GInFWbYKkRN5UpNDB4pdgdmAzzT-=
aah4fEExz_0nBedyN8m3FE$>
>
> On Fri, Jan 19, 2024 at 8:35=E2=80=AFAM Changqing Li <
> changqing.li@eng.windriver.com> wrote:
>
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> use ?=3D to set following configs in order to allow user
>> to override the default settings:
>> PREFERRED_VERSION_llvm
>> PREFERRED_VERSION_llvm-native
>> PREFERRED_VERSION_nativesdk-llvm
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>  meta/conf/distro/include/tcmode-default.inc
>> <https://urldefense.com/v3/__http://tcmode-default.inc__;!!AjveYdw8EvQ!f=
HtiSeYD8TPEVNtjfDtPZrodZY3GykPPupY5y-fmJHKZ6GInFWbYKkRN5UpNDB4pdgdmAzzT-aah=
4fEExz_0nBedwNSyZRE$>
>> | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/conf/distro/include/tcmode-default.inc
>> <https://urldefense.com/v3/__http://tcmode-default.inc__;!!AjveYdw8EvQ!f=
HtiSeYD8TPEVNtjfDtPZrodZY3GykPPupY5y-fmJHKZ6GInFWbYKkRN5UpNDB4pdgdmAzzT-aah=
4fEExz_0nBedwNSyZRE$>
>> b/meta/conf/distro/include/tcmode-default.inc
>> <https://urldefense.com/v3/__http://tcmode-default.inc__;!!AjveYdw8EvQ!f=
HtiSeYD8TPEVNtjfDtPZrodZY3GykPPupY5y-fmJHKZ6GInFWbYKkRN5UpNDB4pdgdmAzzT-aah=
4fEExz_0nBedwNSyZRE$>
>> index 3720a4c5b8..0de858d3af 100644
>> --- a/meta/conf/distro/include/tcmode-default.inc
>> <https://urldefense.com/v3/__http://tcmode-default.inc__;!!AjveYdw8EvQ!f=
HtiSeYD8TPEVNtjfDtPZrodZY3GykPPupY5y-fmJHKZ6GInFWbYKkRN5UpNDB4pdgdmAzzT-aah=
4fEExz_0nBedwNSyZRE$>
>> +++ b/meta/conf/distro/include/tcmode-default.inc
>> <https://urldefense.com/v3/__http://tcmode-default.inc__;!!AjveYdw8EvQ!f=
HtiSeYD8TPEVNtjfDtPZrodZY3GykPPupY5y-fmJHKZ6GInFWbYKkRN5UpNDB4pdgdmAzzT-aah=
4fEExz_0nBedwNSyZRE$>
>> @@ -77,9 +77,9 @@ PREFERRED_VERSION_go-runtime ?=3D "${GOVERSION}"
>>  PREFERRED_VERSION_nativesdk-go ?=3D "${GOVERSION}"
>>  PREFERRED_VERSION_nativesdk-go-runtime ?=3D "${GOVERSION}"
>>
>> -PREFERRED_VERSION_llvm =3D "${LLVMVERSION}"
>> -PREFERRED_VERSION_llvm-native =3D "${LLVMVERSION}"
>> -PREFERRED_VERSION_nativesdk-llvm =3D "${LLVMVERSION}"
>> +PREFERRED_VERSION_llvm ?=3D "${LLVMVERSION}"
>> +PREFERRED_VERSION_llvm-native ?=3D "${LLVMVERSION}"
>> +PREFERRED_VERSION_nativesdk-llvm ?=3D "${LLVMVERSION}"
>>
>>  # Rust toolchain preferred versions:
>>
>> --
>> 2.25.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#194017):
>> https://lists.openembedded.org/g/openembedded-core/message/194017
>> <https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedd=
ed-core/message/194017__;!!AjveYdw8EvQ!fHtiSeYD8TPEVNtjfDtPZrodZY3GykPPupY5=
y-fmJHKZ6GInFWbYKkRN5UpNDB4pdgdmAzzT-aah4fEExz_0nBednypl0Xw$>
>> Mute This Topic: https://lists.openembedded.org/mt/103826050/3617156
>> <https://urldefense.com/v3/__https://lists.openembedded.org/mt/103826050=
/3617156__;!!AjveYdw8EvQ!fHtiSeYD8TPEVNtjfDtPZrodZY3GykPPupY5y-fmJHKZ6GInFW=
bYKkRN5UpNDB4pdgdmAzzT-aah4fEExz_0nBed8jl75qI$>
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
>> <https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedd=
ed-core/unsub__;!!AjveYdw8EvQ!fHtiSeYD8TPEVNtjfDtPZrodZY3GykPPupY5y-fmJHKZ6=
GInFWbYKkRN5UpNDB4pdgdmAzzT-aah4fEExz_0nBed3Rcbu4Y$>
>> [martin.jansa@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--0000000000003aee74060f8675b8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">So please suggest a variable name which Richard will accep=
t as I think it&#39;s easier to use separate variable than overriding all 3=
 PREFERRED_VERSION_llvm* to version currently in oe-core whenever someone w=
ants to use meta-clang.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Mon, Jan 22, 2024 at 1:58=E2=80=AFAM Changqing Li=
 &lt;<a href=3D"mailto:changqing.li@windriver.com">changqing.li@windriver.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><u></u>

 =20
  <div>
    <p>Yes<br>
    </p>
    <div>On 1/19/24 19:57, Martin Jansa wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <strong>
      </strong>
      <div style=3D"border:1pt solid rgb(156,101,0);padding:2pt;background:=
rgb(252,252,3)"><strong><u></u><span style=3D"font-size:11pt;color:rgb(0,0,=
0)">CAUTION: This email
              comes from a non Wind River email account!</span><u></u></str=
ong><br>
        <u></u><span style=3D"font-size:10pt;color:rgb(0,0,0)">Do not click=
 links or open
            attachments unless you recognize the sender and know the
            content is safe.</span><br>
        <u></u></div>
      <div>
        <div dir=3D"ltr">Do you need to override the=C2=A0 PREFERRED_VERSIO=
N_?
          instead of overriding LLVMVERSION?
          <div><br>
          </div>
          <div>Aren&#39;t you trying to fix what was fixed in proposed
            change a while ago:<br>
            <div><a href=3D"https://urldefense.com/v3/__https://patchwork.y=
octoproject.org/project/oe-core/patch/20230401163241.354257-1-Martin.Jansa@=
gmail.com/__;!!AjveYdw8EvQ!fHtiSeYD8TPEVNtjfDtPZrodZY3GykPPupY5y-fmJHKZ6GIn=
FWbYKkRN5UpNDB4pdgdmAzzT-aah4fEExz_0nBedyN8m3FE$" target=3D"_blank">https:/=
/patchwork.yoctoproject.org/project/oe-core/patch/20230401163241.354257-1-M=
artin.Jansa@gmail.com/</a></div>
          </div>
        </div>
        <br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 19, 2024 at
            8:35=E2=80=AFAM Changqing Li &lt;<a href=3D"mailto:changqing.li=
@eng.windriver.com" target=3D"_blank">changqing.li@eng.windriver.com</a>&gt=
;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver=
.com" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
            <br>
            use ?=3D to set following configs in order to allow user<br>
            to override the default settings:<br>
            PREFERRED_VERSION_llvm<br>
            PREFERRED_VERSION_llvm-native<br>
            PREFERRED_VERSION_nativesdk-llvm<br>
            <br>
            Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@=
windriver.com" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
            ---<br>
            =C2=A0meta/conf/distro/include/<a href=3D"https://urldefense.co=
m/v3/__http://tcmode-default.inc__;!!AjveYdw8EvQ!fHtiSeYD8TPEVNtjfDtPZrodZY=
3GykPPupY5y-fmJHKZ6GInFWbYKkRN5UpNDB4pdgdmAzzT-aah4fEExz_0nBedwNSyZRE$" tar=
get=3D"_blank">tcmode-default.inc</a> | 6 +++---<br>
            =C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
            <br>
            diff --git a/meta/conf/distro/include/<a href=3D"https://urldef=
ense.com/v3/__http://tcmode-default.inc__;!!AjveYdw8EvQ!fHtiSeYD8TPEVNtjfDt=
PZrodZY3GykPPupY5y-fmJHKZ6GInFWbYKkRN5UpNDB4pdgdmAzzT-aah4fEExz_0nBedwNSyZR=
E$" target=3D"_blank">tcmode-default.inc</a>
            b/meta/conf/distro/include/<a href=3D"https://urldefense.com/v3=
/__http://tcmode-default.inc__;!!AjveYdw8EvQ!fHtiSeYD8TPEVNtjfDtPZrodZY3Gyk=
PPupY5y-fmJHKZ6GInFWbYKkRN5UpNDB4pdgdmAzzT-aah4fEExz_0nBedwNSyZRE$" target=
=3D"_blank">tcmode-default.inc</a><br>
            index 3720a4c5b8..0de858d3af 100644<br>
            --- a/meta/conf/distro/include/<a href=3D"https://urldefense.co=
m/v3/__http://tcmode-default.inc__;!!AjveYdw8EvQ!fHtiSeYD8TPEVNtjfDtPZrodZY=
3GykPPupY5y-fmJHKZ6GInFWbYKkRN5UpNDB4pdgdmAzzT-aah4fEExz_0nBedwNSyZRE$" tar=
get=3D"_blank">tcmode-default.inc</a><br>
            +++ b/meta/conf/distro/include/<a href=3D"https://urldefense.co=
m/v3/__http://tcmode-default.inc__;!!AjveYdw8EvQ!fHtiSeYD8TPEVNtjfDtPZrodZY=
3GykPPupY5y-fmJHKZ6GInFWbYKkRN5UpNDB4pdgdmAzzT-aah4fEExz_0nBedwNSyZRE$" tar=
get=3D"_blank">tcmode-default.inc</a><br>
            @@ -77,9 +77,9 @@ PREFERRED_VERSION_go-runtime ?=3D
            &quot;${GOVERSION}&quot;<br>
            =C2=A0PREFERRED_VERSION_nativesdk-go ?=3D &quot;${GOVERSION}&qu=
ot;<br>
            =C2=A0PREFERRED_VERSION_nativesdk-go-runtime ?=3D &quot;${GOVER=
SION}&quot;<br>
            <br>
            -PREFERRED_VERSION_llvm =3D &quot;${LLVMVERSION}&quot;<br>
            -PREFERRED_VERSION_llvm-native =3D &quot;${LLVMVERSION}&quot;<b=
r>
            -PREFERRED_VERSION_nativesdk-llvm =3D &quot;${LLVMVERSION}&quot=
;<br>
            +PREFERRED_VERSION_llvm ?=3D &quot;${LLVMVERSION}&quot;<br>
            +PREFERRED_VERSION_llvm-native ?=3D &quot;${LLVMVERSION}&quot;<=
br>
            +PREFERRED_VERSION_nativesdk-llvm ?=3D &quot;${LLVMVERSION}&quo=
t;<br>
            <br>
            =C2=A0# Rust toolchain preferred versions:<br>
            <br>
            -- <br>
            2.25.1<br>
            <br>
            <br>
            -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
            Links: You receive all messages sent to this group.<br>
            View/Reply Online (#194017): <a href=3D"https://urldefense.com/=
v3/__https://lists.openembedded.org/g/openembedded-core/message/194017__;!!=
AjveYdw8EvQ!fHtiSeYD8TPEVNtjfDtPZrodZY3GykPPupY5y-fmJHKZ6GInFWbYKkRN5UpNDB4=
pdgdmAzzT-aah4fEExz_0nBednypl0Xw$" rel=3D"noreferrer" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-core/message/194017</a><br>
            Mute This Topic: <a href=3D"https://urldefense.com/v3/__https:/=
/lists.openembedded.org/mt/103826050/3617156__;!!AjveYdw8EvQ!fHtiSeYD8TPEVN=
tjfDtPZrodZY3GykPPupY5y-fmJHKZ6GInFWbYKkRN5UpNDB4pdgdmAzzT-aah4fEExz_0nBed8=
jl75qI$" rel=3D"noreferrer" target=3D"_blank">
              https://lists.openembedded.org/mt/103826050/3617156</a><br>
            Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.=
openembedded.org" target=3D"_blank">
              openembedded-core+owner@lists.openembedded.org</a><br>
            Unsubscribe: <a href=3D"https://urldefense.com/v3/__https://lis=
ts.openembedded.org/g/openembedded-core/unsub__;!!AjveYdw8EvQ!fHtiSeYD8TPEV=
NtjfDtPZrodZY3GykPPupY5y-fmJHKZ6GInFWbYKkRN5UpNDB4pdgdmAzzT-aah4fEExz_0nBed=
3Rcbu4Y$" rel=3D"noreferrer" target=3D"_blank">
              https://lists.openembedded.org/g/openembedded-core/unsub</a>
            [<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">ma=
rtin.jansa@gmail.com</a>]<br>
            -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
  </div>

</blockquote></div>

--0000000000003aee74060f8675b8--

