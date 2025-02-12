Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BD6DC021A0
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 17:48:48 +0000 (UTC)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
 by mx.groups.io with SMTP id smtpd.web11.22514.1739382527271572233
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 09:48:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A6NP1vZy;
 spf=pass (domain: gmail.com, ip: 209.85.221.181, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-52054c55991so670406e0c.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 09:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739382526; x=1739987326; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=W6H4m1mWEf2sVTBQWrlCoJkXEkmiLBp3Ek1TjaibZ1Q=;
        b=A6NP1vZyVF5bpxFm7R6/hC/vDZUlTUeR+9j8YD9I4kit1C0nIyeZtN+GxuiPyeksrm
         LL+fF6zPKJFyVm9XIAzLKgf7djYq+S86fKTF7oM0WnPJiNdnvVJ9plWi/LgHUtS1Zvwu
         0GeX3j9RdHxQcf/iaQiSADSbCsfYByHp6kZeOUUgrRgcLYyFr9+xRHy5gTCOugBIQ4oz
         8MhZ5W9dFxvD3KBrliX/pBhoWC/KaMui6pEbaD6L+a73VGR05cxxlV6R+crDws0gwKHV
         dggywMn0QAvph89uV6verpfJOtTsZHwsuLBEKQS1EgVPWgej+zC7ZroPIPUhEicLsjsh
         acfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739382526; x=1739987326;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W6H4m1mWEf2sVTBQWrlCoJkXEkmiLBp3Ek1TjaibZ1Q=;
        b=GERz4DSYsV64TuNdOLWpMfrqaCdxieKEZvz7I70Te61P2MJPqpi44kLkDyphXQnMWu
         Qb5lWY8UnXHKT5O8pifMRJQu93Z6+FxSRNL2vCL3Z37sytOM+7oH4XXlFVqU4i/vR/UQ
         Ii4JwpxJzYLtT5Bp+ZQgqtVJUNyUpZ/KyXXQgPJqXOpFeDDoUhoMHk2bJYscClUXvL93
         LePZgD0hxN1S9c2ArRUxF1xhm6bSzUTTmO2RfPidW/cycnvBNmKDbVwwiH6M2iwxy7BH
         nzVm3SiOFG9NYmMAFK3r/WItjeXZqOGvikEwl/GSR9TMa/w/0aV+NNZhqSOuBcJ8FfhG
         vZIw==
X-Gm-Message-State: AOJu0YzpB8Xmp7oeoQ55ejK9IYm8V84AAHVXhovpAVe+c0W5BegsWZel
	35YlzlB1AOYQIweRVbpjoDBQVr/U7m5xCowGRKy/VgS91DLL4OLl52hq0Hd0VdT1EQYPFm6UnNc
	I6D+3XSJfps5xOQaAIkBFjk0W8gusWg==
X-Gm-Gg: ASbGncu4xxIbQvMuUvZy5kSJPBfYt3+1efuRz/V7B3AiYGq6d9FiJNIL4iK3IVXAbAp
	YEef9TEvGZb2PugKVBEf2/emw8vhBrMwfX2hop5vwTlmccYQKTaOHI85aYDH91RSRdFNqTXc4zf
	1HYKRmvuQqhHda6xma9AF8OvpxCrxe
X-Google-Smtp-Source: AGHT+IGXEXK+e5ZN4oc7Ms6M2RZ5wcB1FgcEj1GEQD8skjmTHWwDbGGqnQfC9czJNKGXUvwpjYp95HvyoyD7A76u750=
X-Received: by 2002:a05:6122:2c34:b0:515:25f5:46f6 with SMTP id
 71dfb90a1353d-52077a9315amr263102e0c.4.1739382526208; Wed, 12 Feb 2025
 09:48:46 -0800 (PST)
MIME-Version: 1.0
References: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20250211150034.18696-7-stefan.herbrechtsmeier-oss@weidmueller.com>
 <CA+cAkep+TSaFr5pqKDjxRh07ApMTwtnspTvYAMVOU_ax3kP3Ug@mail.gmail.com> <ed0bd088-529c-4e37-81b5-2749b0da3934@weidmueller.com>
In-Reply-To: <ed0bd088-529c-4e37-81b5-2749b0da3934@weidmueller.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Wed, 12 Feb 2025 18:48:34 +0100
X-Gm-Features: AWEUYZlxQnDyY1IXP4NmZ-fc6Yas_FP9aJor6HXnVcR7XGuuOO1Zqgm7YaZMNAQ
Message-ID: <CA+cAkercP7YUsVTXLWDEV+oya9NNf4Uj_ge4xg0KtYLcXERciQ@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 06/30] lib: oe: vendor: add cargo support
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, 
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Content-Type: multipart/alternative; boundary="0000000000009a731d062df58dae"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 17:48:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211268

--0000000000009a731d062df58dae
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 12 f=C3=A9vr. 2025, 17:29, Stefan Herbrechtsmeier <
stefan.herbrechtsmeier-oss@weidmueller.com> a =C3=A9crit :

> Am 12.02.2025 um 13:45 schrieb Fr=C3=A9d=C3=A9ric Martinsons:
>
>
> On Tue, 11 Feb 2025 at 16:01, Stefan Herbrechtsmeier via
> lists.openembedded.org <stefan.herbrechtsmeier-oss=3D
> weidmueller.com@lists.openembedded.org> wrote:
>
>> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>>
>> Add a vendor module for cargo to resolve dependencies and populate
>> vendor directories from a Cargo.lock file.
>>
>>
>>
> Hello,
>
> Have you looked at vendor subcommand of cargo :
> https://doc.rust-lang.org/cargo/commands/cargo-vendor.html ?
> I didn't read the series but the commit message makes me think that "carg=
o
> vendor" already exists for resolving dependencies
> and populating a vendor directory.
>
> The class uses the bitbake fetcher (wget / git) to create a vendor
> directory and emulate the cargo vendor command.
>

Yes, I understood that. Let me rephrase my question.
Is it desirable/needed to mimick an existing (upstream and maintained)
command, considering that we already use native cargo to build rust
binaries?

Is the new flow you suggest can use the "cargo vendor" call?

Maybe there is room for less custom code here. Sorry if I missed something
obvious, I just react to some keywords in area that I contributed 2 years
ago.

--0000000000009a731d062df58dae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">Le mer. 12 f=C3=A9vr. 2025, 17:2=
9, Stefan Herbrechtsmeier &lt;<a href=3D"mailto:stefan.herbrechtsmeier-oss@=
weidmueller.com">stefan.herbrechtsmeier-oss@weidmueller.com</a>&gt; a =C3=
=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
u></u>

 =20
  <div>
    <div>Am 12.02.2025 um 13:45 schrieb Fr=C3=A9d=C3=A9ric
      Martinsons:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div dir=3D"ltr"><br>
        </div>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Tue, 11 Feb 2025 at
            16:01, Stefan Herbrechtsmeier via <a href=3D"http://lists.opene=
mbedded.org" target=3D"_blank" rel=3D"noreferrer">lists.openembedded.org</a=
>
            &lt;stefan.herbrechtsmeier-oss=3D<a href=3D"mailto:weidmueller.=
com@lists.openembedded.org" target=3D"_blank" rel=3D"noreferrer">weidmuelle=
r.com@lists.openembedded.org</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From:
            Stefan Herbrechtsmeier &lt;<a href=3D"mailto:stefan.herbrechtsm=
eier@weidmueller.com" target=3D"_blank" rel=3D"noreferrer">stefan.herbrecht=
smeier@weidmueller.com</a>&gt;<br>
            <br>
            Add a vendor module for cargo to resolve dependencies and
            populate<br>
            vendor directories from a Cargo.lock file.<br>
            <br>
            <br>
          </blockquote>
          <div><br>
          </div>
          <div>Hello,=C2=A0</div>
          <div><br>
          </div>
          <div>Have you looked at vendor subcommand of cargo :=C2=A0<a href=
=3D"https://doc.rust-lang.org/cargo/commands/cargo-vendor.html" target=3D"_=
blank" rel=3D"noreferrer">https://doc.rust-lang.org/cargo/commands/cargo-ve=
ndor.html</a>
            ?</div>
          <div>I didn&#39;t read the series but the commit message makes me
            think that &quot;cargo vendor&quot; already exists for resolvin=
g
            dependencies</div>
          <div>and populating a vendor directory.<br>
            <br>
          </div>
        </div>
      </div>
    </blockquote>
    <p>The class uses the bitbake fetcher (wget / git) to create a
      vendor directory and emulate the cargo vendor command.<br>
      </p></div></blockquote></div></div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">Yes, I understood that. Let me rephrase my question.=C2=A0</div=
><div dir=3D"auto">Is it desirable/needed to mimick an existing (upstream a=
nd maintained) command, considering that we already use native cargo to bui=
ld rust binaries?=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
Is the new flow you suggest can use the &quot;cargo vendor&quot; call?=C2=
=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">Maybe there is room =
for less custom code here. Sorry if I missed something obvious, I just reac=
t to some keywords in area that I contributed 2 years ago.</div></div>

--0000000000009a731d062df58dae--

