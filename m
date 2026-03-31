Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C480109B489
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 15:14:03 +0000 (UTC)
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22625.1774970034136723559
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2026 08:13:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=eFrXKynq;
 spf=pass (domain: gmail.com, ip: 74.125.82.54, mailfrom: rybczynska@gmail.com)
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1273349c56bso7231507c88.0
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 08:13:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774970033; cv=none;
        d=google.com; s=arc-20240605;
        b=Yxn0B8lMAk3DO7Lt/dVrd3v+jP9vU/2CP+2dTbsdMsdOQR18atTZ9DLvbIcD/8iQN2
         lyPG1DNtic8eFXv4wcCNwMrYuZ9ged3gWDsMs/8chk3FdZW3ChEuNwMj3KmMfLBgXqG9
         ViuJP1WlDe+UT9wjvMXE+iICuqAjDUaLO5yR/nzW59t2Q6AWL45LATcP4FOFMfRk+6M3
         h5avem64HmiQdUdUgXm7s2A+DFeGrAAjdNyIlAzCMWOfqKsk5agNzVQx57kGAD+24DoW
         22ZzrlR8ReidFnOoLL3BjS26wbsmesiH1Cryx2KvyLtUCrP386p2+WDkQbyJQ0B1E409
         YMXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YmbvgXe8r32jAH5ZNgn3BjPW3DClB5w0ep5uJHOw+7k=;
        fh=VOVZu8FjXojtP/2iv884q8pvwCQeeuFgwI9OY1sYm5U=;
        b=N16xT5NhnIjw7IUsGlzeYNkCvJjp1npkMAe9tLK2Hvt+th7Iee1oMXancpUCmNsGs6
         0G4czb5U/95SAztk2USfgQWvpe5+F5K3NBSzOQm356scJ9LO8dfUtz8qQ9XD/9GOLNcb
         UwAQrwfrgP/S85vxZLO/zkgd29hwJC6YQEHFJqW20MQ5EyeFppENDLvH4AzzHsrlNJbO
         3L5VjEi5Wll0l5jslmEPF55njY5o7Zf8A3dlcaDXwMkpokAAtJtroENnOuFMFdmgTQsS
         dfwwq+C3KRV1w6VeAFOv0+EQ9JFpRO3v8v3P+LlvLZ5xEqghWaHm7bYAYjqAc2pnQPZB
         Xjtw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774970033; x=1775574833; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YmbvgXe8r32jAH5ZNgn3BjPW3DClB5w0ep5uJHOw+7k=;
        b=eFrXKynqb1a0fi9KDRTz+7gVP7NLAmYc5TFkGGBreKbJUSmK9oDKJyv0i98hahE7zq
         FSqlHG/5GXWqP47V6MO8O983s1NO2kmHWJCIz7xgC7xXTnIAjamqcNxW9pU+o2paqUJ/
         ax7cI+FKqqo7PgkEOidbq/NABryfDjY8EYiEmPWLVdqZAltOYrXDNwLpnPYc86g7szVo
         oOByrqDrw9Dj3AFbR6tnEgWSPjOEb+D1ajtxjI7ck5d4Eb+HilpBZBu4dQPQGdLR2RTA
         5qBKB5cSqfKK1DiydcOGwvxP5exhMGrQWYrnz7dJvrI5OozRnYFWRRfEBC+WW5gbp0CI
         XXSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774970033; x=1775574833;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YmbvgXe8r32jAH5ZNgn3BjPW3DClB5w0ep5uJHOw+7k=;
        b=lOEZdqJ8C2VGGUpUjH4joOxwFXf+NY4b/ya84RAvOv/RwwBl6lqggB/++xxRf73ZaS
         YACGFGZDKmhSMMngu9XOscje89jyczun987/yQPeaTbVPfaJKQJLdwZLr6wV5deANWVN
         fhZZPQWI5Ck4Pi47vxFnTeZe+iAL+3Go9zr4F0SkHnyLiwMT7jDBzBkVz/hIoFt4CCjL
         4LcHaraiqu7Kh7uWgaa1NH5WLmoy8x5JZhoD60UK1GZ+MYGyJ4TmE1b31mLOJZ6H1ury
         QZBoxOGusuwqFPC9OY1Wn5UiAFKuNWPPbg0z055YU+DNAcFQC5CVNSLysKHeyKehO3d7
         /g4w==
X-Gm-Message-State: AOJu0YzSnU51TNkxz3KXLTCAu1hpJKEVSDyqkSCT2boJVQGC0hPmAZOR
	dUZAm14ZrGNhZbubjgax4JI4MzEsQBQ+GGjV8orasdW1w0g8PtCU8aS85TMInOYeS5Lp8YaMJlE
	HNbaOoGX7lfsRwD80BkWfgRCNJTRyxRFMm620
X-Gm-Gg: ATEYQzxkbMbbhos0tAIqkJs1rKjyAggQB0siPAmrrDgpnpDyz0Gn5XneLGDJ3DEO0QU
	GKTIOt5qEMi8ia2urv/GFZs9xetTmEDiBqaKcqtr0rMYOVjuWl3+YUpr27S/M94BlrGkpwzH4nf
	a98Vc+iDsXRTcr4LWjBym2a1oA+G9bDYaKdeOOipLdRorRUeveC6G6IbWYOlcYsEIXjp3XkDAMG
	1mpbJxhIcWYcDF8otPg/rfbadEN5jqMVqZBsvmWdxRHOFNU79flqoJXuRvAtlGgvmeDmT221PYu
	4yblq/wDKoY4IWBfVpfhk4qBHxKCazY0vczv0YgY
X-Received: by 2002:a05:7023:b88:b0:128:bae0:e043 with SMTP id
 a92af1059eb24-12ab28ff31bmr8158532c88.31.1774970033432; Tue, 31 Mar 2026
 08:13:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260331132430.781647-1-ross.burton@arm.com> <CAApg2=Rnrr_ZijiZ4cxKvkwmeCOssHXVfNHi2hZAywuhNe+F-Q@mail.gmail.com>
 <38C0C321-1456-4C35-9AA1-8B4CB8BEF6B1@arm.com>
In-Reply-To: <38C0C321-1456-4C35-9AA1-8B4CB8BEF6B1@arm.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 31 Mar 2026 17:13:41 +0200
X-Gm-Features: AQROBzA0dgqBf9M1Ru1tQD_0fgVYJmLqRj4FhbBO8_qtnoAvOZUh83f-R6j2F10
Message-ID: <CAApg2=TtBWXYMy=2Lh8UYia_Td+ibPBCwh57By5STzPhdfbH-Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] classes/vex: remove
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000546d2e064e536acf"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 15:14:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234300

--000000000000546d2e064e536acf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 5:05=E2=80=AFPM Ross Burton <Ross.Burton@arm.com> w=
rote:

> On 31 Mar 2026, at 15:43, Marta Rybczynska via lists.openembedded.org
> <rybczynska=3Dgmail.com@lists.openembedded.org> wrote:
> > For the record, I do not agree with this removal. SPDX3 has still not
> reached mature usage outside of the LF ecosystem.
>
> Is there an ecosystem of tooling that uses the Yocto-specific JSON format
> that vex.bbclass generates?


Yes there are tools that support YP cve-check JSON format as input and, by
extension, they can use the vex.bbclass too.

Not sure how many of them want to manifest, this is usually internal
tooling.

Kind regards,
Marta

--000000000000546d2e064e536acf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 31, 2026=
 at 5:05=E2=80=AFPM Ross Burton &lt;<a href=3D"mailto:Ross.Burton@arm.com" =
target=3D"_blank">Ross.Burton@arm.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">On 31 Mar 2026, at 15:43, Marta Rybczy=
nska via <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" targe=
t=3D"_blank">lists.openembedded.org</a> &lt;rybczynska=3D<a href=3D"mailto:=
gmail.com@lists.openembedded.org" target=3D"_blank">gmail.com@lists.openemb=
edded.org</a>&gt; wrote:<br>
&gt; For the record, I do not agree with this removal. SPDX3 has still not =
reached mature usage outside of the LF ecosystem.<br>
<br>
Is there an ecosystem of tooling that uses the Yocto-specific JSON format t=
hat vex.bbclass generates?</blockquote><div><br></div><div>Yes there are to=
ols that support YP cve-check JSON format as input and, by extension, they =
can use the vex.bbclass too.</div><div><br></div><div>Not sure how many of =
them want to manifest, this is usually internal tooling.</div><div><br></di=
v><div>Kind regards,</div><div>Marta</div></div></div>
</div>

--000000000000546d2e064e536acf--

