Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25FD9C28B2E
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 08:53:28 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web11.4179.1741683199189202024
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Mar 2025 01:53:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B7aQy/X4;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-475a77bbd8cso50339961cf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 01:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741683198; x=1742287998; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sHpeyTtXs1RM6iOVUtcL0u/ysqSMufn8tgHFLoti2d8=;
        b=B7aQy/X4UJ067jJkQPDBhRrM+UYmYTMb2sQBQ7wfKHWvG+5jCyqvvIWGznnd2cFkqg
         VVYjZCBDEIIcDp2f3uQEHmfIm0iuGFiHHdu8EQgewSD/ahUro3LtdN+ft0H5f8SvkzYw
         NnSg901rf+egZ7jqRVLQWqUG+V2fWF3iYAjwsLIBdUCGEKXv77I4uAmB+4Cb0gT7B8mH
         zmwrMv+fbfu0knM022lRKNcig9Weq+KneNGga66fNuohD2hA4a89sEYhh2arG5CIFbKg
         Xf69svdBszQ8ppX9EtG8il6gPIKeLlU7e+Rx/PW0OmRgrDeJ8YM2wBgQeO8Yb+mjZ4Ih
         Njhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741683198; x=1742287998;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sHpeyTtXs1RM6iOVUtcL0u/ysqSMufn8tgHFLoti2d8=;
        b=UWsnWw5oDLS0t3+nxYba5ZjaFfltVTkjtAFGpjibf/5yqcdBntNFWHwWuWGULediuj
         DsBWws0bnAMs908IqaMbWBd/AZgeIlTAUlBNiA2cHFCu3dxKTieU0ltsa37j90chtYhB
         u8KrubdhKvSZC1CeLrXIF62aYSY6xT54o/i3Akm3sdqfBXZFOWgSylfL3PmkAAL7UPuV
         jbNYGWD9TTZ6/7E+Lc1Vmtb5EkZYHKuqrNX4Gh3FZYkLtvKyGw9p2tFCkUOoGrQ19yBI
         RjIjOvdgsVVrC2P1eAT254VoufkiDKuxhLf0KGTQyk1SbIzOTulE8UqMCSEIlyzXDNN/
         QHYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuYCzgR/I5GSVYjWYBhe4kdYDwEelw1XJFm83dOYEPFQ95jq7ceL9bGDB0+8w1Td86lp7X6qpYCrj9X6DjuLzgwQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxIHZqx6cihmFDAuY8V06w8+gC44Gm1QnnPZn6LV5h2iZgW2/nM
	2dnChXfhjxIra13ShQkSIBiu95atA7o6OenU2Atwdhk1+U3dmBnFcGu/BHKIQsSu0dAqHqF649N
	jeBzjJ+6gJPA/jFpj1ny5gH1SX1Q=
X-Gm-Gg: ASbGncvH/Kmvo3lPF8stthh4HnMfdUp4L7hZDB68TzKyY90bTZYUDnbnnf9ZsX8Ngot
	XLb8204i+wT2+JAzbUNGMLPr11k9aL0o5MMPzJIFDhEZIp+EGsu3jqRKbDmnVMuvOSRozE+PCwq
	KpUpK+lc5OtMce0yqEPQBdaAjIYIfOPAqodmhkSlzf0+zPYkuWXMdK1I2yUm4CFvUy2XddDk4=
X-Google-Smtp-Source: AGHT+IH1TXxayergNut3MjdTuCdNI0462x4yVIpMJgwxL+O/vffEQJ1s8PLmV7/ykQYqd5D7gvPvKMcomVFh+pKv/Hc=
X-Received: by 2002:a05:6214:f61:b0:6e8:f905:aff0 with SMTP id
 6a1803df08f44-6e900677479mr207726906d6.35.1741683198103; Tue, 11 Mar 2025
 01:53:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250311045911.3023271-1-hongxu.jia@windriver.com> <CAApg2=Sh+nbwEdX0B19GqFwzfYP=6LHqPRdrvmhvxfnbSyE35g@mail.gmail.com>
In-Reply-To: <CAApg2=Sh+nbwEdX0B19GqFwzfYP=6LHqPRdrvmhvxfnbSyE35g@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 11 Mar 2025 09:53:07 +0100
X-Gm-Features: AQ5f1Jpk_iHzhYpJpvrsxejkdFFxEIdYHNGl_ehwz4m_aEtbsJdZ2XmXsVUQO9U
Message-ID: <CANNYZj_uBe3wZ8gOqU1QRkbacBeF68TiJ1nrE0vFcCkx_namEA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] gnupg: 2.5.4 -> 2.5.5
To: rybczynska@gmail.com
Cc: hongxu.jia@eng.windriver.com, openembedded-core@lists.openembedded.org, 
	Steve Sakoman <steve@sakoman.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 08:53:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212547

We erroneously updated gnupg from stable (2.4.x) to development series
(2.5.x) in master and styhead, as it actually follows the odd-even
version scheme. So for styhead it's not that straightforward.

Scarthgap is on 2.4.x (which is fine and supported, but needs to be
updated to latest 2.4.x), kirkstone is on 2.3.x, sadly, which has the
same issue as styhead.

Alex

On Tue, 11 Mar 2025 at 06:32, Marta Rybczynska via
lists.openembedded.org <rybczynska=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Thanks for the update patch. First two items from the changelog looks lik=
e CVE material (haven't been released as CVEs as of today).
> I vote for a backport to stable branches (with Steve in copy).
>
> Kind regards,
> Marta
>
> On Tue, Mar 11, 2025 at 5:59=E2=80=AFAM hongxu via lists.openembedded.org=
 <hongxu.jia=3Deng.windriver.com@lists.openembedded.org> wrote:
>>
>> Noteworthy changes in version 2.5.5 (2025-03-07)
>> ------------------------------------------------
>>
>>   * gpg: Fix a verification DoS due to a malicious subkey in the
>>     keyring.  [T7527]
>>
>>   * dirmngr: Fix possible hangs due to blocking connection requests.
>>     [T6606, T7434]
>>
>>   * w32: On socket nonce mismatch close the socket.  [T7434]
>>
>>   * w32: Print more detailed diagnostics for IPC errors.
>>
>>   * GPGME is not any more distributed with the Windows installer.
>>     Please install gpg4win to get gpgme version.
>>
>>   See-also: gnupg-announce/2025q1/000491.html
>>   Release-info: https://dev.gnupg.org/T7530
>>
>> https://dev.gnupg.org/source/gnupg/browse/master/NEWS
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>  meta/recipes-support/gnupg/{gnupg_2.5.4.bb =3D> gnupg_2.5.5.bb} | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>  rename meta/recipes-support/gnupg/{gnupg_2.5.4.bb =3D> gnupg_2.5.5.bb} =
(97%)
>>
>> diff --git a/meta/recipes-support/gnupg/gnupg_2.5.4.bb b/meta/recipes-su=
pport/gnupg/gnupg_2.5.5.bb
>> similarity index 97%
>> rename from meta/recipes-support/gnupg/gnupg_2.5.4.bb
>> rename to meta/recipes-support/gnupg/gnupg_2.5.5.bb
>> index e6a7e3fb407..a9ab486f6bf 100644
>> --- a/meta/recipes-support/gnupg/gnupg_2.5.4.bb
>> +++ b/meta/recipes-support/gnupg/gnupg_2.5.5.bb
>> @@ -23,7 +23,7 @@ SRC_URI:append:class-native =3D " file://0001-configur=
e.ac-use-a-custom-value-for-
>>                                  file://relocate.patch"
>>  SRC_URI:append:class-nativesdk =3D " file://relocate.patch"
>>
>> -SRC_URI[sha256sum] =3D "f8cb2ac6c9f17f81e3541c62158764910fad5c3a0765e00=
b398c41a32bc4e0ea"
>> +SRC_URI[sha256sum] =3D "7afa71d72ff9aaff75a6810b87b486bc492fd752e4f77b0=
7c41759ce4ef36b31"
>>
>>  EXTRA_OECONF =3D "--disable-ldap \
>>                 --disable-ccid-driver \
>> --
>> 2.34.1
>>
>>
>>
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#212542): https://lists.openembedded.org/g/openembedde=
d-core/message/212542
> Mute This Topic: https://lists.openembedded.org/mt/111634573/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

