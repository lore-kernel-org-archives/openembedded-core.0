Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09CD0C54ED1
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 14:23:51 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web10.49239.1748010229615882468
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 May 2025 07:23:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Qd1jU0TP;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-2e3e58edab5so2639391fac.3
        for <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 07:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748010229; x=1748615029; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TIxkIo55lc2iYivC/Q2I3cLo3egBTATVS8A+FZP6dIk=;
        b=Qd1jU0TP2DY/0zgzyCU+/1UZLzPiaqzrLfMzapN+xAF5yTk1RwFYmaWjMP3rb8pC7Y
         vurzLfMix4Zuz3Jt3BJH0Dh2y1xYSbgLwEmLX9MMgVqLPiSb8Rw0UmQmbwLqpsqSKZm8
         UsChBJ+pU7MC4Izo0zHErREs1x8rTO/URafED9gpN1hA1qkFc+HHLAms2jxfS8GGGlTb
         pa5ONqoWgYiVX0xLj7vbsifGyZgaXZmgz1ps6Nhin0LZVi0PCgj9LowxXlIivr9Y9LTK
         A7jyUuNpdpL3og+7V09OwxKVh6cHjIy3FDWXNVogirKG0iRIrXxKlg7+Cjq5IJr1SwXM
         0Ofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748010229; x=1748615029;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TIxkIo55lc2iYivC/Q2I3cLo3egBTATVS8A+FZP6dIk=;
        b=N1eAWyd6eRGRcO5k8PO5qntiP3D2KzzJRvcnos3U30w155lBkqwyzu1rB6Mjw2EHtb
         19v+BiBXTqR3nPYUFdxHdAZdbm415tq9VAG9ecy3wmzQBHzlgTV5/EqtJFV1LH6qa4vd
         y/X7ZE2mPlqW1J+QKpqHQKuWWhNIUyA14hgoBo6bbEkaSbPkEa9hRsAYkHt50gNiQpwz
         FVCP1HVe9cDQ6WoXFnQvKkeij3atFvZOikrpGx5chwD/TH0IktA6mSoX+VompNfAUO1a
         BzsvjTSgUX3wc1E0HSysG3y9zYdP8OzRj9ywF/wNHmIlKCF+nSrnR8DQj4JrHjzjyJbp
         ftIA==
X-Gm-Message-State: AOJu0Yz1AxAMSsS7S8DttTAzOY1pqSfih/JtIiO+ipTiQaxpjrFJfCQt
	DVeEWJXIWVTWtLoLqLsOGgmJ5R4LrSaIlEue7GcxWwpVWd30Hnw0Sma3LAx1LZdihX18CyFA9hs
	016djYIAoov3p6U9O0WSmjk4uZu00CsZHQPvK
X-Gm-Gg: ASbGncutAWr3lRgFKpM7tAH3vLNrpkqH5cYwhi0bVl4HIzObHoS8+hC6NRbdkgdEGy7
	t8wWwIOMg4/fGPVnd4BeKzMXYnMjvasam2wg9nosnUVOUBkmnnw1gYYN/SeBiT2y0IZ23/IMe6m
	6reKplE6AjmHSwwQqJsmYdOClaCCj6oiMW5ChqxfpsstHyhB3TeXBsvzvf606RcQSYcQ==
X-Google-Smtp-Source: AGHT+IHjj91OZMskXDHnVZDQaOKkbsqVGhdBW+VBOsIpGK6eWkaEOHYogk4uaClnAbehrEPXY/K9iJx68tNmkgLfEn8=
X-Received: by 2002:a05:6870:4f0e:b0:2cc:3530:d313 with SMTP id
 586e51a60fabf-2e3c84d597bmr15515921fac.25.1748010228633; Fri, 23 May 2025
 07:23:48 -0700 (PDT)
MIME-Version: 1.0
References: <c8872756-9150-410b-9dee-01a0248ceeb3@gmail.com> <26223.1747984985015269889@lists.openembedded.org>
In-Reply-To: <26223.1747984985015269889@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 23 May 2025 07:23:37 -0700
X-Gm-Features: AX0GCFvJDwd1auXB8_LzgUJ_eJs39A8aDmBRIDww9cyku6ISuTDJ-jrAkpNZe8M
Message-ID: <CAMKF1sp+uqRyf7+_7Gp-7pz0hmWv3_Zw-t6cMCDjEY1Huvwo1w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] binutils: Fix CVE-2025-1180
To: Harish.Sadineni@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000bdd7a20635ce58d1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 14:23:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217213

--000000000000bdd7a20635ce58d1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the update

On Fri, May 23, 2025 at 12:23=E2=80=AFAM Sadineni, Harish via lists.openemb=
edded.org
<Harish.Sadineni=3Dwindriver.com@lists.openembedded.org> wrote:

> Test result summary for binutils with before and after applying the patch=
:
>
> Component Metric Without Patch With Patch Change
> *binutils* Expected passes 310 310 =E2=80=94
>   Unexpected failures 1 1 =E2=80=94
>   Untested testcases 1 1 =E2=80=94
>   Unsupported tests 9 9 =E2=80=94
> *gas* Expected passes 2017 2017 =E2=80=94
>   Unexpected failures 4 4 =E2=80=94
>   Unsupported tests 1 1 =E2=80=94
> *ld* Expected passes 1787 1787 =E2=80=94
>   Expected failures 7 7 =E2=80=94
>   Unresolved testcases 1 1 =E2=80=94
>   Untested testcases 20 20 =E2=80=94
>   Unsupported tests 99 99 =E2=80=94
>
> There is no regressions in test results.
>
> Thanks,
> Harish
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#217178):
> https://lists.openembedded.org/g/openembedded-core/message/217178
> Mute This Topic: https://lists.openembedded.org/mt/113245812/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000bdd7a20635ce58d1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks for the update=C2=A0</div><div><br><div class=3D"g=
mail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On =
Fri, May 23, 2025 at 12:23=E2=80=AFAM Sadineni, Harish via <a href=3D"http:=
//lists.openembedded.org">lists.openembedded.org</a> &lt;Harish.Sadineni=3D=
<a href=3D"mailto:windriver.com@lists.openembedded.org">windriver.com@lists=
.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><d=
iv>Test result summary for binutils with before and after applying the patc=
h:<br><br>
<table>
<thead>
<tr>
<th>Component</th>
<th>Metric</th>
<th>Without Patch</th>
<th>With Patch</th>
<th>Change</th>
</tr>
</thead>
<tbody>
<tr>
<td><strong>binutils</strong></td>
<td>Expected passes</td>
<td>310</td>
<td>310</td>
<td>=E2=80=94</td>
</tr>
<tr>
<td>=C2=A0</td>
<td>Unexpected failures</td>
<td>1</td>
<td>1</td>
<td>=E2=80=94</td>
</tr>
<tr>
<td>=C2=A0</td>
<td>Untested testcases</td>
<td>1</td>
<td>1</td>
<td>=E2=80=94</td>
</tr>
<tr>
<td>=C2=A0</td>
<td>Unsupported tests</td>
<td>9</td>
<td>9</td>
<td>=E2=80=94</td>
</tr>
<tr>
<td><strong>gas</strong></td>
<td>Expected passes</td>
<td>2017</td>
<td>2017</td>
<td>=E2=80=94</td>
</tr>
<tr>
<td>=C2=A0</td>
<td>Unexpected failures</td>
<td>4</td>
<td>4</td>
<td>=E2=80=94</td>
</tr>
<tr>
<td>=C2=A0</td>
<td>Unsupported tests</td>
<td>1</td>
<td>1</td>
<td>=E2=80=94</td>
</tr>
<tr>
<td><strong>ld</strong></td>
<td>Expected passes</td>
<td>1787</td>
<td>1787</td>
<td>=E2=80=94</td>
</tr>
<tr>
<td>=C2=A0</td>
<td>Expected failures</td>
<td>7</td>
<td>7</td>
<td>=E2=80=94</td>
</tr>
<tr>
<td>=C2=A0</td>
<td>Unresolved testcases</td>
<td>1</td>
<td>1</td>
<td>=E2=80=94</td>
</tr>
<tr>
<td>=C2=A0</td>
<td>Untested testcases</td>
<td>20</td>
<td>20</td>
<td>=E2=80=94</td>
</tr>
<tr>
<td>=C2=A0</td>
<td>Unsupported tests</td>
<td>99</td>
<td>99</td>
<td>=E2=80=94</td>
</tr>
</tbody>
</table>
</div>
<div><br>There is no regressions in test results.<br><br>Thanks,<br>Harish<=
/div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#217178): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/217178" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/217178</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/113245812/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/113245812/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000bdd7a20635ce58d1--

