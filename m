Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69FEDCFC293
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 11:37:10 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.11133.1728992224676761207
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 04:37:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nPuJKrRk;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb5a9c7420so8865441fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 04:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728992223; x=1729597023; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SLEsYABd+BwK/OwaFNYoNFjVzhVMLgDFA1SAy2gUGAU=;
        b=nPuJKrRkb67V0gSZo6gC50oyLJ8v9fVDESZ4lxslk4IkliW+Gktzvbj2tmiyJY/p4x
         6CIBTCbmem9hWA44BlaFl6rmcVCHX/rt9tq6qGSkbLxGZMtt7Tni9YJBVEGi5CLyEr7s
         PIUzcJVAQ1VodzsTCcoDDwGNTPd9L3qscyWHWJorWMa+5VLvp2109WOb8WOlKeKtdufL
         NFbOjKnB7ST5/+Nk+/jDgfaqCifHlL0QUqiQ4p9FM/bLxF7BGt8u8ZViAtU8/4BenirZ
         jWH2l9wbihMC1a6poOeRn/+CckSUWMJzLkzAtVA9T5frCCg9+zAiLlZdw586DnzzxHAc
         F9Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728992223; x=1729597023;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SLEsYABd+BwK/OwaFNYoNFjVzhVMLgDFA1SAy2gUGAU=;
        b=Z2DapYE+vWSdEFh9WaDkkOmI8RbgKWCJOM8ZqsWBnRMzPTSSuiCwNPKo1DxmMfWy+h
         oEd2YBe0N/gBJBfKB530hg6YfzZ7/OedHQPMZ8TXlAkXdsT5iSvGVUO4sq+sTOqkn8Gj
         2aimebaef4SSqQhkjZXqprMtSBh6aMY/xIJCnXF6Ru9Ua0Nn65coU4TaoBArNGPLEbKq
         euDuEpyjSmsr6HdScTvO/LEFwcUYv4G26IX1C+SuLl157yfkPbrSwK3V7JMMX7IwzLJy
         t7fxTjK2ST1NsjoxPKWFJC45p+GMcs4wc7KqNoaPlOfjPmWx85tcehVSJD/+fl9JIIyi
         MVTg==
X-Forwarded-Encrypted: i=1; AJvYcCWEvahAzla10igLXNVnuHe36MzMguEK/IeBQWKpXEXJHAJInTkCFILp7jEVamTgn37oA0ZIqUe2btzE1bfnLMyzHw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw7BXtL5Va87eDmZWr22YhI33Tz3x1DPq8aBvVUrVZKzBFeTrp7
	I53dONTz6b74WzPjy4/MYDI4Wc2RBCT7DtDOd5HRmtqEUM0Xg1vXM/PSs+4ZJD8fnIEAvyRSZx7
	T8Nd5EXeVMTC/HqzEhRUGuQmYg+g=
X-Google-Smtp-Source: AGHT+IFSTR5jNMmmJt4rI+Oln8v1GneSzMIQ4mMHJ4SZOBy/imXyrON6OgqiroVsBhHIyqVOBB7rNLK6sjqBFy2f7JI=
X-Received: by 2002:a05:6512:2202:b0:536:55a8:6f78 with SMTP id
 2adb3069b0e04-539e54e8532mr4700577e87.17.1728992221101; Tue, 15 Oct 2024
 04:37:01 -0700 (PDT)
MIME-Version: 1.0
References: <20241011122044.12222-1-mikko.rapeli@linaro.org>
 <ebd022b240f4bb6b8e2e2fb8d93a4c9f2ba9492f.camel@linuxfoundation.org>
 <17FE4B15CF045259.4702@lists.openembedded.org> <Zw4PXRX28-qB8FjT@nuoska>
 <874585dde5c3fe6685e9c8b250cd02dc2404f26c.camel@linuxfoundation.org>
 <Zw5Qm1ZEScA196fh@nuoska> <17FE9D06966A2DE5.32376@lists.openembedded.org>
In-Reply-To: <17FE9D06966A2DE5.32376@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 15 Oct 2024 13:36:50 +0200
Message-ID: <CANNYZj_nWSs=_vrRW+hNXGp2ouC5tPASDbgn__Rmbjtd-JFH8Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v8 0/8] systemd uki support
To: alex.kanavin@gmail.com
Cc: mikko.rapeli@linaro.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000028852a0624825f36"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 11:37:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205808

--00000000000028852a0624825f36
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Alternatively just mark the test as specific to x86-64 host, there are
several self tests that do this.

Alex

On Tue 15. Oct 2024 at 13.32, Alexander Kanavin via lists.openembedded.org
<alex.kanavin=3Dgmail.com@lists.openembedded.org> wrote:

> Don=E2=80=99t remove the tests please. Without them things tend to regres=
s. I
> understand it=E2=80=99s frustrating, but we do have arm people here that =
had pushed
> hard for testing in arm hosts, (without really thinking through how
> contributors are supposed to deal with such failures) and I think it=E2=
=80=99s now
> on them to help you out.
>
> Alex
>
> On Tue 15. Oct 2024 at 13.23, Mikko Rapeli via lists.openembedded.org
> <mikko.rapeli=3Dlinaro.org@lists.openembedded.org> wrote:
>
>> Hi,
>>
>> On Tue, Oct 15, 2024 at 11:43:33AM +0100, Richard Purdie wrote:
>> > The arm test still fails:
>> >
>> >
>> https://valkyrie.yoctoproject.org/#/builders/23/builds/267/steps/14/logs=
/stdio
>> >
>> > The traceback is at least cleaner now I fixed the lock error. I did
>> > test with KVM disabled.
>>
>> Bugger. I had tested this on qemuarm64 and genericarm64 on an x86_64
>> build host with Ubuntu 22.04. Is this an arm64 build host with Ubuntu
>> 20.04?
>>
>> I will remove the tests as it is clearly too hard to get these running.
>>
>> It is a bit hard to figure out in which environments selftests are
>> running.
>>
>> Cheers,
>>
>> -Mikko
>>
>>
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#205807):
> https://lists.openembedded.org/g/openembedded-core/message/205807
> Mute This Topic: https://lists.openembedded.org/mt/108947467/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000028852a0624825f36
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Alternatively just mark the test as specific to x86-64 ho=
st, there are several self tests that do this.</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Tue 15. Oct 2024 at 13.32, Alexander Kan=
avin via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</=
a> &lt;alex.kanavin=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">g=
mail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">=
<div dir=3D"auto">Don=E2=80=99t remove the tests please. Without them thing=
s tend to regress. I understand it=E2=80=99s frustrating, but we do have ar=
m people here that had pushed hard for testing in arm hosts, (without reall=
y thinking through how contributors are supposed to deal with such failures=
) and I think it=E2=80=99s now on them to help you out.</div><div dir=3D"au=
to"><br></div><div dir=3D"auto">Alex=C2=A0</div><div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue 15. Oct 2024 at 13.23=
, Mikko Rapeli via <a href=3D"http://lists.openembedded.org" target=3D"_bla=
nk">lists.openembedded.org</a> &lt;mikko.rapeli=3D<a href=3D"mailto:linaro.=
org@lists.openembedded.org" target=3D"_blank">linaro.org@lists.openembedded=
.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding=
-left:1ex;border-left-color:rgb(204,204,204)">Hi,<br>
<br>
On Tue, Oct 15, 2024 at 11:43:33AM +0100, Richard Purdie wrote:<br>
&gt; The arm test still fails:<br>
&gt; <br>
&gt; <a href=3D"https://valkyrie.yoctoproject.org/#/builders/23/builds/267/=
steps/14/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://valkyrie.=
yoctoproject.org/#/builders/23/builds/267/steps/14/logs/stdio</a><br>
&gt; <br>
&gt; The traceback is at least cleaner now I fixed the lock error. I did<br=
>
&gt; test with KVM disabled.<br>
<br>
Bugger. I had tested this on qemuarm64 and genericarm64 on an x86_64<br>
build host with Ubuntu 22.04. Is this an arm64 build host with Ubuntu 20.04=
?<br>
<br>
I will remove the tests as it is clearly too hard to get these running.<br>
<br>
It is a bit hard to figure out in which environments selftests are running.=
<br>
<br>
Cheers,<br>
<br>
-Mikko<br>
<br>
<br>
<br>
</blockquote></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#205807): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/205807" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/205807</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/108947467/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/108947467/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000028852a0624825f36--

