Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 150C2C44533
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 14:40:33 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24472.1784644823705203684
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 07:40:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IIz3WFat;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39c86ce9e29so74163931fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 07:40:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784644821; cv=none;
        d=google.com; s=arc-20260327;
        b=mre8twO0+QrgGdUi6z/23GgCvpeeDCkw5sxFEF4L97BqLUygzdNT0fDLYjmIuUq2ID
         NLUcMExma6rDv3E0DunylWeDz3BqM4kqgDMwBYNyw/rATr1aA4ldsOfcfjZwD+0CtX9A
         ju9mPtpJ87vfik59/WrQXwxa0r0QGzGt3JCF+/2mtYi8rX9kwlp0XCBCHUH3YgVG8Pz2
         qIU1yomNkcDksGK3XEG5HgxidM0Nwj8NfHRgleiJzIarYhbA2TE3YgR3OPW7VEhSLn59
         vK/CYL7WMptGwzbbUeyOs/gDIQUM5S1cVyWxCf2T3+xwO5DDCW/j4ii/lGCzjdVEEIcb
         NwYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jY6LDkHUovtdgxGWzud9FJ1WqhTYJXs1D7FX+wAuBZk=;
        fh=hTuh1V3D5ifNvuuqz6DmyP4CV9JLoYwkbMZnLhwFrZQ=;
        b=nRBJO0SUKexg2dZ/W6zMkEeGTyPJXQSXuxyDLzq7UYu/YKTSoQzLyisb9RCwB1XD9S
         drZbyezABLEkxN/EmZkaMUeQrG82sbrhVU36JaoiTNFHh6g3/y4AXoJi4Gn/JjMPUSK5
         XLLm0DOYyhyEjuu8xgHtDXXACfw8dJpTN1YgXDMIAJ1PXdSlihd92WlUsFJJ19tGC6Qs
         2IkC/ZX0PRukso0xtEJ8qKESiKNFJa+WUODwd9VEw7taazqlJ71IPh7heunVGQzCodKr
         TdIw64bqWA/upTEIFzVBj9Rotxya7vtXXZhGQGwPP2NSmgCq5LbQmOHa8R0ozs8xcbFY
         Tzag==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784644821; x=1785249621; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jY6LDkHUovtdgxGWzud9FJ1WqhTYJXs1D7FX+wAuBZk=;
        b=IIz3WFatwFcEjxl48zyEnxCteAt5dcXV73TGK7F7glq70hru0ntjaeLyguSwjJ/mL4
         q0Hjddr7kYQix7UACPNscAuHpuM9gYhOA7gQAfJg7ZbWD6OkF/dLDsYCg+lGyJtE3njW
         70r7y3mqOUnE9Qo+uCJcyARmwc/gTTX6HdqtExNIlPy/guGU2YrAcabZguM56rB5nqMZ
         h3CHbL5HZ6+pHVNo4S41vrjJle8QEatDjTcZOcjWO08YJbN9cNavnGSP/zDgR8aq6LCv
         F/cFbpdUPIiawwlmwLHqUMbgZTI18eLtYe9MkTGk6etWRCootJ1D2Noqk/3VYQ6knCx5
         PwsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784644821; x=1785249621;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jY6LDkHUovtdgxGWzud9FJ1WqhTYJXs1D7FX+wAuBZk=;
        b=lVXaifZEDIAJkSIGodZrHEgXf7cILbqQqFRZ+gQCCgDPTq1ietV6ZbjGzPfBYwPF+f
         D74ueniGyY9Cwc7iA6nveMHB43D64ozEhwf0xB7XhfQYkvAzOIJPuxJGHNlCeEuh1JoM
         seIg0rF6MIIcX6pwuR9S8Tf7BcwA0y3qqKQ4ZSlfKGxTsh8SOpLOVruk07eWf1klYGwD
         c+Gg/vBPA7vnVMSdx7lXzMoHxX3zxNazds34cj7RDPxr5syXOEidvFEVSg/+6ROMkBbd
         KqK61p9nmqX/SUlMuBbpNzH/dP50vtjI1Ft2w3xy250INkb4U/8cLfmb37Rx0Y1mlpAJ
         biUA==
X-Gm-Message-State: AOJu0YwT/IZ7GGQZ4ndHXhcAcc+/uAzpRxb0HBt+fmm7j9PPIqp6tAxY
	4Wai2uwEFl08cQJiOkXlSM701Qpj63ieaHPtLDJ/YDmsYHRRhv5IesUtNVhIdr7HG/lTiy30QYw
	QmaVqLvA/LJfRYMErh8hXi+fcS78Em7I=
X-Gm-Gg: AR+sD10mG5QGY4JqGRtjBn7t1dZiVsBE3yePFsTfT165eTzHoufGgpGitGyeR7wB7q8
	/8H8mTdTnpYNYRNvtg9yehLTRCaNpH8A50WmNkAWhHxfM80cc/rE8f8+yeP5eTbfRuhMyN84ngy
	PwCP/3ZdJANV8upt/X9529rm26PuCRaVE3Rrwd162COmQphavf9d/X9qhNHUPTJ3fLdacl9FHOK
	fWO0ov/Kk2o1XjtCqH63lPfcZPMp6B17ZfoH3CZZc/w4+pCQ0Zhd3xMTVVHq37hoLaNGy87J3TE
	G3RjRAyBGDqZTSwS5zqGRDEoMX/zjhkGa0CFiOiH3T70pYp3MiNLdwI=
X-Received: by 2002:a05:6512:6d0:b0:5ae:bd27:a13 with SMTP id
 2adb3069b0e04-5b28fabfad4mr4693942e87.54.1784644821222; Tue, 21 Jul 2026
 07:40:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260721093251.2697077-1-martin.jansa@gmail.com> <CAJdd5Ga3cryEZHK_gL_d1Si3-RJYsRQL7Hmuv0PaGPJr3SULHw@mail.gmail.com>
In-Reply-To: <CAJdd5Ga3cryEZHK_gL_d1Si3-RJYsRQL7Hmuv0PaGPJr3SULHw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 21 Jul 2026 16:40:05 +0200
X-Gm-Features: AUfX_mzePFhfeGHoAZen8mB8-FA5oGyI7ezfYPMNVuvp8tS0adUAV_WpBWWJ1OA
Message-ID: <CA+chaQeNGJmRUC+ZuHCHY2Odiv8YPYLuJjVz2ockmFUjsoFgkQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] glib-networking: update LICENSE for openssl PACKAGECONFIG
To: Joshua Watt <jpewhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 14:40:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241543

On Tue, Jul 21, 2026 at 4:35=E2=80=AFPM Joshua Watt <jpewhacker@gmail.com> =
wrote:
>
>
>
> On Tue, Jul 21, 2026 at 3:32=E2=80=AFAM <martin.jansa@gmail.com> wrote:
>>
>> From: Martin Jansa <martin.jansa@gmail.com>
>>
>> Fixes:
>> glib-networking: LICENSE is using an old syntax and should be upgraded t=
o: "LGPL-2.1-or-later AND LicenseRef-Glib-Networking-OpenSSL-Exception"
>>
>> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
>> ---
>>  meta/recipes-core/glib-networking/glib-networking_2.80.1.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/glib-networking/glib-networking_2.80.1.bb=
 b/meta/recipes-core/glib-networking/glib-networking_2.80.1.bb
>> index 3d47e354e2..d81d7d75e9 100644
>> --- a/meta/recipes-core/glib-networking/glib-networking_2.80.1.bb
>> +++ b/meta/recipes-core/glib-networking/glib-networking_2.80.1.bb
>> @@ -4,7 +4,7 @@ HOMEPAGE =3D "https://gitlab.gnome.org/GNOME/glib-networ=
king/"
>>  BUGTRACKER =3D "http://bugzilla.gnome.org"
>>
>>  LICENSE =3D "LGPL-2.1-or-later"
>> -LICENSE:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'openssl', ' =
& Glib-Networking-OpenSSL-Exception', '', d)}"
>> +LICENSE:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'openssl', ' =
AND LicenseRef-Glib-Networking-OpenSSL-Exception', '', d)}"
>
>
> I believe this could be "AND LGPL-2.1-or-later WITH openvpn-openssl-excep=
tion", since the text of the license matches https://spdx.org/licenses/open=
vpn-openssl-exception.html (with replacements), but please double check my =
work.

Thank you, will double check and send follow-up as RP already merged this o=
ne.

