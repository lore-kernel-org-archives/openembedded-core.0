Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C19AC88E64
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 02:19:12 +0000 (UTC)
Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11464.1789352343725752155
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Sep 2026 19:19:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=tLgsoT1V;
 spf=pass (domain: gmail.com, ip: 74.125.231.205, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c54eed93e4so344310b6e.3
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2026 19:19:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789352343; cv=none;
        d=google.com; s=arc-20260327;
        b=an4FZqnuhyEwApRO2H5Q1RGDT0j6EA4c7ZsQRx64d8UzQhiGMDNNEuOvhk7oZCMb4t
         q2m7PcrmrBaQGQPHvA0cvey9mJwKU0L6+cPvRl2fcLHc3WfiX9YzPFHbdiVAhnNlzDOM
         Z+F2DOBjWh2zFtQzG4lxHPDvniaUbchm2urrJsXDIlkJxhITEt7xvf0dFP4jkZgWS185
         YCGn8jqpSmWUsImoZksh603g8qwC7yZybeH/sjThNs71qDoqsJu8LQCOQS3mdXemNMc3
         oI+pqDUYsi6aQiDN7L2ra6nE4L1mRO1ZFBncf+38Qg6QiBQIH74VRJprLAtuswot+/S7
         cAzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kqUOqJ61BxNFExzhKb+ei2+5+m5Nt9HbBhjuytlLN3Q=;
        fh=asqV5XwkQ3j1DNjI0AxRPYfk3NtHNhY/iAvm1HVGsgw=;
        b=JAvdofqd4Iq6+vVoZAsx5uAfArMgreT1N96TazLSsZfDHyMKZaAhULOzoZWTc3hCvp
         qOV5wQQT9j2jjZz9rwo9BwQXi78TwIHk8GZjoMGlUwowGnCoH2Z/JzqA0ZjmOi66j/cX
         kiYNzN9vZA8SXWlmRD/CgEvi1dqdm6IduvCpfgKRpvjWKf2vyXpgptZ+zORoFAQc/A2m
         wGhymPXiU1cmnMsQXCZBe32hjhsRi3Q4cB0eh4DLH73Fo8rn2Ff5/FQCRxSYx+HvieJl
         HJmXpOLuvV5/q+RUdcPoNJxTgkFpsxTmf2+qJmjlz9ufqDarOrK5iW/fRiawlxbYHYR5
         /Oag==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789352343; x=1789957143; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kqUOqJ61BxNFExzhKb+ei2+5+m5Nt9HbBhjuytlLN3Q=;
        b=tLgsoT1Vhh7DJXr3mG1j1rODoVaX/k9s8bDe7EFHSnS/eNOgrv8p/AkCA7frtt4VK6
         RH+twuKk66MMp20v/KX8R1xFCtBgpWfQ3zUUejbH91xQzaITTlQrW9OqxYppeY096rNr
         0Zm4G63U7ja5b1ZtjDxlMwF9xRxoYCnnU4lsgI8wnGaanJk606+q9MXoZ0M2ZRNc3RwR
         X7s+gXATL0S5s/uClZ7fKal0LmnoHLHvbq8+kb+zEyyjhc9Hu/suNtr91iJ2jrad26Yx
         3P1eJr5MrjoiwCSpskLMrEicxfyTnr7739WHW8lU7HzEHcYjKoBV+hFK6pGr7Cw76gqy
         1UjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789352343; x=1789957143;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kqUOqJ61BxNFExzhKb+ei2+5+m5Nt9HbBhjuytlLN3Q=;
        b=AqEt4D9IMG1hQ01dOkpMeR0BQr/z6fFftaE+RfczCteBc0o3XKiGgE68Q9PHGA7xaP
         5Sg/nYsIIqKQ/qoSKq/qTLGcK+EtchaYXf/3tyioDmW+YmysmOPE48rF/qtuobiBSc0S
         b/i9uKeVuVYXaQmd3JKH0el2dr7fWStX9qlL4O7L7bnQYY5gBMDTBe4HpUspyq4H8inK
         STO0pU13whsAeFUbwBYWS4jcQzVlGHElS53LuBu24ue62xUqZoMQ/hqy8ryjycH0d8+k
         WEWoBlE9E3hObfPryuk3mBpeGH7Pgg1X2yvSH3gOSisVFjKefx1uvDZNAsnmDxEj5m4M
         p8Ag==
X-Gm-Message-State: AFuF++n/8jxv889hepXFUuYbwOwSOMGdsSadMIYfa+9kMDoBvESpj9WW
	BD+/pYa8DZp3opddKG07WqdNByGSZ66NB08mYxAEIAjaxOW9Spl8x2ZDsyKr814WvTMzAy2SshC
	8HuGjMMD0/MOb9IX+Hzp/p9o3f84KZfk=
X-Gm-Gg: AYBFou0EH0rckzaG3hoxalb4drb5O0TCPNsPWU+8hPc2uXAnkhapHxvzhBegg7OqVbK
	On0xq0x3/aKpjDMffZrI7xri0DNVyoxtmE1jbwbihZ3WkHzye/kLdinSolbg4jlUVXzbGW4GSAT
	EL0eyph4ViFICWc3giBER1wEL/HlcHaXPYz4zCBfnugNcjiCsZD/zgIAlrarQez4k0w6eDMV+UJ
	3RBJyYXutTIZfRc0mKYv1M7HtqBDJPxShPQqSWELaQsvgr02GqVmXXrH69I4v4UK4M0iov+3UdE
	0pzfKaxhoXJFJQpbVyd0o2ygPkUvn28ieYZmgx0nmQBGwdN7OGZWAfXQoLEUN7oYh2o=
X-Received: by 2002:a05:6820:4cc1:b0:6b1:42ab:d040 with SMTP id
 006d021491bc7-6c53f5548a6mr245173eaf.28.1789352342750; Sun, 13 Sep 2026
 19:19:02 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1789163914.git.yoann.congal@smile.fr> <CADySD0GdXN1DPdYv0oy-rZ0r-EB7RoU8waJOAD4jrG-t1tEgmg@mail.gmail.com>
 <CAMSfU+4k9CX9QfCFWrRegM8Hn9GdFWyiMNSCw2AMnnUryts5Ow@mail.gmail.com>
In-Reply-To: <CAMSfU+4k9CX9QfCFWrRegM8Hn9GdFWyiMNSCw2AMnnUryts5Ow@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Mon, 14 Sep 2026 14:18:50 +1200
X-Gm-Features: AcwNN1WzsNwnsZbbAayBau387NTre2tEm9H38snT2KWCRs7_UJ-tIaMAtubOP6M
Message-ID: <CADySD0F1er3YJeuhfgoc+VDUf_9bceXmKTX+n21XUEiWeYZNSQ@mail.gmail.com>
Subject: Re: [OE-core][scarthgap 00/13] Patch review
To: Yoann Congal <yoann.congal@smile.fr>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 02:19:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245744

On Mon, Sep 14, 2026 at 2:23=E2=80=AFAM Yoann Congal <yoann.congal@smile.fr=
> wrote:
>
> Le dim. 13 sept. 2026, 02:12, Ankur Tyagi <ankur.tyagi85@gmail.com> a =C3=
=A9crit :
>>
>> Hello Yoann,
>>
>> Any reason why the following were not included?
>>
>> https://lists.openembedded.org/g/openembedded-core/message/245310
>> https://lists.openembedded.org/g/openembedded-core/message/245311
>
>
> Hello,
>
> Yes, the reason being that I need to merge those to wrynose first.
>
> These should go in the next review cycle (this week).

Understood, thanks.

>
> Thanks!

