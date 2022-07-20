Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FCC0C433EF
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 19:13:44 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.1331.1658344415369246788
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 12:13:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20210112.gappssmtp.com header.s=20210112
 header.b=fYQb8KYU;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.181,
 mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qk1-f181.google.com with SMTP id k7so11488930qkj.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 12:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20210112.gappssmtp.com; s=20210112;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc;
        bh=vFEqQ7IQ8OJuH7+oGlW7Bo+IpR8cz1eGYnUGPWnzbAg=;
        b=fYQb8KYUSWiaQqfF6SFBWquWgH6sbVIO2kCRZ3R9ezf0R7iPVTOjyBs8Dw5AoILP+4
         nT3AFbTPEPap6rO6d0XFVy/2ynlh2SAxE313gNlfz9nQJ9f+DKfrx8iSPLUKqDg7MuGn
         CJyr9Hpsi8gaUqvJeD7REdqEURJPv7CqNFRtJvEbzFipZe8Me21f/YznPcV0qWgXRDzI
         ktzjJi6vehYJuUQpb1XPSs+l6Zus8aH+qD++AjooSInmnGCtdfm5q7RzDrMrRQpubhT8
         x6r/6PGQ/EGlmqQN6xvcIks5Oy8k0T2d0gToSPUPl0pKh4jUKdaThnlda2OvrKdaijHs
         XqEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc;
        bh=vFEqQ7IQ8OJuH7+oGlW7Bo+IpR8cz1eGYnUGPWnzbAg=;
        b=lC+pIa5RsqeMq7RgQoxWU++jtPfwrYcXQRDeMGM06REDwgG4tksVKfWMHuwseLGZiu
         RNWjk3j5WNbvQP+UxgWyS7/jDW/o+lX3HgOX3OwAJEjWfLCkvmNihtXmRonGRHjeavJW
         7SMxbGJohJxxRyIemCoDS9bP/FZ0wFUeAGPDRJfc5i7nRC3VUXTVcU0zOpRHdNZ6CikV
         0vzbqF9G1bxhK+1Kl6+mmtW9PuNzhn/z7OQ/itGH0M/oKrnpN8TsdsPz/5OCt3zmWDgF
         eSB5gFxdjATiO9abbfvY9rxu9WzMlF5V9O9U85N9STrZQbynFyNKNTkwsibcLyUZwqAA
         IxEA==
X-Gm-Message-State: AJIora+5gvZ0PEorSv1F7et79MAyZJ5i6h5cO3XHkwRi9Wk28McvPIT0
	mG4ACEDtJZ8Db6S/KCBjewETL3hIurxnCa2r
X-Google-Smtp-Source: 
 AGRyM1sbDGPxicGZytZDh9e71F42f3FkYUQoJof3PAFnF1AMtKg6KupPe+yAH9NqYhR4dtO+HmwsOg==
X-Received: by 2002:a05:620a:4611:b0:6b5:fefb:5fb5 with SMTP id
 br17-20020a05620a461100b006b5fefb5fb5mr6873533qkb.71.1658344414187;
        Wed, 20 Jul 2022 12:13:34 -0700 (PDT)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com.
 [209.85.219.53])
        by smtp.gmail.com with ESMTPSA id
 x16-20020ac87a90000000b0031ed2038c15sm12281672qtr.63.2022.07.20.12.13.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Jul 2022 12:13:33 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qv1-f53.google.com with SMTP id j11so500258qvt.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 12:13:33 -0700 (PDT)
X-Received: by 2002:a05:6214:2a86:b0:473:e193:7de3 with SMTP id
 jr6-20020a0562142a8600b00473e1937de3mr11003299qvb.105.1658344413273; Wed, 20
 Jul 2022 12:13:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220710164300.953098-1-otavio@ossystems.com.br>
 <20220710164300.953098-2-otavio@ossystems.com.br>
 <e642480e892b0b411acb509c0de11aa7e52d4412.camel@linuxfoundation.org>
 <CAP9ODKooHNY8GyNuY8hDHyscEAJJfCfTXdThVMQW5TOGnjOZxw@mail.gmail.com>
 <8e065ede6abdb6065c862bd8b25cdccf2b6828a8.camel@linuxfoundation.org>
 <CAP9ODKp1_CV4N-RB+NR4nTdvVgSR=pu6V7q2T2sQ8Pu8w=Ew2g@mail.gmail.com>
 <bba9495ce38c56f914c391f054ce2bd77f2bef55.camel@linuxfoundation.org>
 <CAP9ODKrTbdjMOK5scpWEeh2Fdk0gt4XTdsVR0MLTb7GKEfpKJw@mail.gmail.com>
 <06a78e1a344f8ee4dbf696b56756781a65463f1f.camel@linuxfoundation.org>
 <CAP9ODKp+WkU-+41q39_R6S8UsraOPn-0KbTuQjaHToqumwn-0g@mail.gmail.com>
 <5937fc9b1b2507727cc838a6ba3ad13a9bd47fe2.camel@linuxfoundation.org>
 <CAP9ODKpcXKzG_kw4OgdPnZx51eBDKqq45XuCQFXKfD839qpruw@mail.gmail.com>
In-Reply-To: 
 <CAP9ODKpcXKzG_kw4OgdPnZx51eBDKqq45XuCQFXKfD839qpruw@mail.gmail.com>
Date: Wed, 20 Jul 2022 16:13:21 -0300
X-Gmail-Original-Message-ID: 
 <CAP9ODKoBKJ8fWguny2WOzCAf+wnuvcX8Kymsa07HnKAN=JjUfA@mail.gmail.com>
Message-ID: 
 <CAP9ODKoBKJ8fWguny2WOzCAf+wnuvcX8Kymsa07HnKAN=JjUfA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/2] cargo-cross-canadian: Use SDK's flags
 during target linking
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Khem Raj <raj.khem@gmail.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="000000000000abbdd505e44165a7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 19:13:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168373

--000000000000abbdd505e44165a7
Content-Type: multipart/alternative; boundary="000000000000abbdd305e44165a5"

--000000000000abbdd305e44165a5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Richard,

Em qua., 20 de jul. de 2022 =C3=A0s 15:11, Otavio Salvador <
otavio@ossystems.com.br> escreveu:

> Em qua., 20 de jul. de 2022 =C3=A0s 14:21, Richard Purdie <
> richard.purdie@linuxfoundation.org> escreveu:
>
>> I've done a bit more work on this and the more I dig, the more I think
>> we have some issues we need to sort with taking a step back and
>> checking some assumptions.
>>
>> What I'm lacking is a good way to test the resulting rust toolchain.
>> Would someone with some rust knowledge be able to add something to
>> meta/lib/oeqa/sdk/cases/ which tested rust in the SDK?
>>
>> If someone can add some rust tests in the SDK, I think I might have an
>> idea of what the patches look like to properly fix the rust toolchain
>> there.
>>
>
> Ok, I will send you a test case shortly.
>

As promised. See attached.


--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

--000000000000abbdd305e44165a5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hello Richard,</div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">Em qua., 20 de jul. de 2022=
 =C3=A0s 15:11, Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.com.=
br">otavio@ossystems.com.br</a>&gt; escreveu:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">Em qua., 20=
 de jul. de 2022 =C3=A0s 14:21, Richard Purdie &lt;<a href=3D"mailto:richar=
d.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundat=
ion.org</a>&gt; escreveu:<br></div><div class=3D"gmail_quote"><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">I&#39;ve done a bit more work on this =
and the more I dig, the more I think<br>
we have some issues we need to sort with taking a step back and<br>
checking some assumptions.<br>
<br>
What I&#39;m lacking is a good way to test the resulting rust toolchain.<br=
>
Would someone with some rust knowledge be able to add something to<br>
meta/lib/oeqa/sdk/cases/ which tested rust in the SDK?<br>
<br>
If someone can add some rust tests in the SDK, I think I might have an<br>
idea of what the patches look like to properly fix the rust toolchain<br>
there.<br></blockquote><div><br></div><div>Ok, I will send you a test case =
shortly.=C2=A0</div></div></div></blockquote><div><br></div><div>As promise=
d. See attached.=C2=A0</div></div><br clear=3D"all"><div><br></div>-- <br><=
div dir=3D"ltr" class=3D"gmail_signature">Otavio Salvador =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 O.S. Systems<br><a href=3D"http://www.ossystems.com.br" target=3D"_b=
lank">http://www.ossystems.com.br</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D=
"http://code.ossystems.com.br" target=3D"_blank">http://code.ossystems.com.=
br</a><br>Mobile: +55 (53) 9 9981-7854 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mo=
bile: +1 (347) 903-9750</div></div>

--000000000000abbdd305e44165a5--

--000000000000abbdd505e44165a7
Content-Type: text/x-patch; charset="US-ASCII";
	name="0001-oeqa-sdk-rust-add-basic-cargo-test.patch"
Content-Disposition: attachment;
	filename="0001-oeqa-sdk-rust-add-basic-cargo-test.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_l5tzfgnd0>
X-Attachment-Id: f_l5tzfgnd0

RnJvbSBkNjIxMTJkYjNlNGJjOWVjOWUzYzdjYTQ4MGViZjJmM2EyMDdlNGE2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBPdGF2aW8gU2FsdmFkb3IgPG90YXZpb0Bvc3N5c3RlbXMuY29t
LmJyPgpEYXRlOiBXZWQsIDIwIEp1bCAyMDIyIDE2OjA2OjAxIC0wMzAwClN1YmplY3Q6IFtQQVRD
SF0gb2VxYTogc2RrOiBydXN0OiBhZGQgYmFzaWMgY2FyZ28gdGVzdAoKU2lnbmVkLW9mZi1ieTog
T3RhdmlvIFNhbHZhZG9yIDxvdGF2aW9Ab3NzeXN0ZW1zLmNvbS5icj4KLS0tCiBtZXRhL2xpYi9v
ZXFhL3Nkay9jYXNlcy9ydXN0LnB5ICAgICAgICAgICAgICAgfCAzMSArKysrKysrKysrKysrKysr
KysrCiBtZXRhL2xpYi9vZXFhL3Nkay9maWxlcy9ydXN0L2hlbGxvL0NhcmdvLnRvbWwgfCAgNiAr
KysrCiAuLi4vbGliL29lcWEvc2RrL2ZpbGVzL3J1c3QvaGVsbG8vc3JjL21haW4ucnMgfCAgMyAr
KwogMyBmaWxlcyBjaGFuZ2VkLCA0MCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQg
bWV0YS9saWIvb2VxYS9zZGsvY2FzZXMvcnVzdC5weQogY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEv
bGliL29lcWEvc2RrL2ZpbGVzL3J1c3QvaGVsbG8vQ2FyZ28udG9tbAogY3JlYXRlIG1vZGUgMTAw
NjQ0IG1ldGEvbGliL29lcWEvc2RrL2ZpbGVzL3J1c3QvaGVsbG8vc3JjL21haW4ucnMKCmRpZmYg
LS1naXQgYS9tZXRhL2xpYi9vZXFhL3Nkay9jYXNlcy9ydXN0LnB5IGIvbWV0YS9saWIvb2VxYS9z
ZGsvY2FzZXMvcnVzdC5weQpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5j
MjliMDYyMjNiCi0tLSAvZGV2L251bGwKKysrIGIvbWV0YS9saWIvb2VxYS9zZGsvY2FzZXMvcnVz
dC5weQpAQCAtMCwwICsxLDMxIEBACisjCisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBNSVQK
KyMKKworaW1wb3J0IG9zCitpbXBvcnQgc2h1dGlsCitpbXBvcnQgdW5pdHRlc3QKKworZnJvbSBv
ZXFhLmNvcmUudXRpbHMucGF0aCBpbXBvcnQgcmVtb3ZlX3NhZmUKK2Zyb20gb2VxYS5zZGsuY2Fz
ZSBpbXBvcnQgT0VTREtUZXN0Q2FzZQorCitmcm9tIG9lcWEudXRpbHMuc3VicHJvY2Vzc3R3ZWFr
IGltcG9ydCBlcnJvcnNfaGF2ZV9vdXRwdXQKK2Vycm9yc19oYXZlX291dHB1dCgpCisKK2NsYXNz
IFJ1c3RDb21waWxlVGVzdChPRVNES1Rlc3RDYXNlKToKKyAgICB0ZF92YXJzID0gWydNQUNISU5F
J10KKworICAgIEBjbGFzc21ldGhvZAorICAgIGRlZiBzZXRVcENsYXNzKHNlbGYpOgorICAgICAg
ICBzaHV0aWwuY29weXRyZWUob3MucGF0aC5qb2luKHNlbGYudGMuc2RrX2ZpbGVzX2RpciwgInJ1
c3QvaGVsbG8iKSwKKyAgICAgICAgICAgICAgICAgICAgICAgIG9zLnBhdGguam9pbihzZWxmLnRj
LnNka19kaXIsICJoZWxsbyIpKQorCisgICAgZGVmIHNldFVwKHNlbGYpOgorICAgICAgICBtYWNo
aW5lID0gc2VsZi50ZC5nZXQoIk1BQ0hJTkUiKQorICAgICAgICBpZiBub3QgKHNlbGYudGMuaGFz
SG9zdFBhY2thZ2UoInBhY2thZ2Vncm91cC1ydXN0LWNyb3NzLWNhbmFkaWFuLSVzIiAlIG1hY2hp
bmUpIG9yCisgICAgICAgICAgICAgICAgc2VsZi50Yy5oYXNIb3N0UGFja2FnZSgiXnJ1c3QtY3Jv
c3MtY2FuYWRpYW4tIiwgcmVnZXg9VHJ1ZSkgb3IKKyAgICAgICAgICAgICAgICBzZWxmLnRjLmhh
c0hvc3RQYWNrYWdlKCJeY2FyZ28tY3Jvc3MtY2FuYWRpYW4tIiwgcmVnZXg9VHJ1ZSkpOgorICAg
ICAgICAgICAgcmFpc2UgdW5pdHRlc3QuU2tpcFRlc3QoIlJ1c3RDb21waWxlVGVzdCBjbGFzczog
U0RLIGRvZXNuJ3QgY29udGFpbiBhIFJ1c3QgY3Jvc3MtY2FuYWRpYW4gdG9vbGNoYWluIikKKwor
ICAgIGRlZiB0ZXN0X2NhcmdvX2J1aWxkKHNlbGYpOgorICAgICAgICBzZWxmLl9ydW4oJ2NkICVz
L2hlbGxvOyBjYXJnbyBidWlsZCcgJSBzZWxmLnRjLnNka19kaXIpCmRpZmYgLS1naXQgYS9tZXRh
L2xpYi9vZXFhL3Nkay9maWxlcy9ydXN0L2hlbGxvL0NhcmdvLnRvbWwgYi9tZXRhL2xpYi9vZXFh
L3Nkay9maWxlcy9ydXN0L2hlbGxvL0NhcmdvLnRvbWwKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5k
ZXggMDAwMDAwMDAwMC4uZmU2MTk0NzhhNgotLS0gL2Rldi9udWxsCisrKyBiL21ldGEvbGliL29l
cWEvc2RrL2ZpbGVzL3J1c3QvaGVsbG8vQ2FyZ28udG9tbApAQCAtMCwwICsxLDYgQEAKK1twYWNr
YWdlXQorbmFtZSA9ICJoZWxsbyIKK3ZlcnNpb24gPSAiMC4xLjAiCitlZGl0aW9uID0gIjIwMjEi
CisKK1tkZXBlbmRlbmNpZXNdCmRpZmYgLS1naXQgYS9tZXRhL2xpYi9vZXFhL3Nkay9maWxlcy9y
dXN0L2hlbGxvL3NyYy9tYWluLnJzIGIvbWV0YS9saWIvb2VxYS9zZGsvZmlsZXMvcnVzdC9oZWxs
by9zcmMvbWFpbi5ycwpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5hMDZj
MDNmODJhCi0tLSAvZGV2L251bGwKKysrIGIvbWV0YS9saWIvb2VxYS9zZGsvZmlsZXMvcnVzdC9o
ZWxsby9zcmMvbWFpbi5ycwpAQCAtMCwwICsxLDMgQEAKK2ZuIG1haW4oKSB7CisgICAgcHJpbnRs
biEoIkhlbGxvLCBPcGVuRW1iZWRkZWQgd29ybGQhIik7Cit9Ci0tIAoyLjM2LjEKCg==
--000000000000abbdd505e44165a7--

