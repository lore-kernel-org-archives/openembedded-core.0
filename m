Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35001CF886D
	for <webhook@archiver.kernel.org>; Mon,  7 Oct 2024 20:38:29 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.2429.1728333506958965326
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Oct 2024 13:38:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RgXdtR0k;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2facf40737eso53259741fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Oct 2024 13:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728333505; x=1728938305; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4PvWPm+uX7G05k7BXLTBuUnKNt2wzbjEGQu1kHX1y8I=;
        b=RgXdtR0kARzNTE2PMl89N2Uf8Vs8lopwvU5cPb+o5jTis79xZytWeUZLBpMhbeiAzN
         9W13sb8Eg6h6ugzvED26PHWGQa7M/bOsKtC8ftqS+3WBbqq0rKLs1L6lWuv/wQ5AtkC7
         vGBOCgoKCFL6vEcWlGHLtmKARNXtcsvMSEQhfahPyYUiMqMQDxJel6WOTQkK7HGeL0+d
         mH9weD2qXmyha6gy2zUtpYzpyfd5iSWbE51gLcsAlOLLtgJO6DupGDJbFpbZK09MyEzm
         Z7SCFest81ciDTVS6Nokhz4IL+GM7l3qWEpEgsNgOEfaQw92h3ASQpn4ChqoDfpIkAAN
         pDPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728333505; x=1728938305;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4PvWPm+uX7G05k7BXLTBuUnKNt2wzbjEGQu1kHX1y8I=;
        b=SaD0TlPUsC76pceGI1rTZJxlpv+wsF6EQFiKkreJc7z2aIV40lzU3cuZEJ1P/BCc/3
         +FiXcrxhqkZ1D/LSy91csIbCxPcecUue1fDce7BFaeDKdOZz76Sa+VkJJ9PD32vQcJ5U
         NgPX7S2lfQ+52NunzUz0x2qjjCOqiKPscfhwQcxOBjsWveL99lGjeEpfnn4ad0+v9tVZ
         u1bdK96jb6FuWCOexJu8EI1chR078eMPdAB5qDlcL2KHHEun+sX1y3eIaEQJ+WfIWfZw
         K6LqVYBJk3rWFvDd9xDBZ9fZNdRVv0sBoj70valJcNHxA3uWmWdo2EoL+wRcpggNMOqP
         dR3A==
X-Gm-Message-State: AOJu0Yzs8cKZlQfncJnbq5gh/xmnrWJoZly7Mj64Y9MNoZRppRHi+k3J
	40mU/lj0lydkElX6MwrNGBIA2bqKh054agSatkZMxjKT4sOURnM3X4eAsG7wRSrKbyz1UecotSJ
	rN93DY5GtyY2ULvV2bSfKoD4kOuU=
X-Google-Smtp-Source: AGHT+IFfVF0YyzHKJGiArJ/yWhAdZz2+IA9o6l8IyvZ62WNYe73SdQdM+4z1qKfSUMKIyYzhxo7ni5hIkQjCi+ZNI/4=
X-Received: by 2002:a2e:be28:0:b0:2fa:f5f1:2539 with SMTP id
 38308e7fff4ca-2faf5f126bbmr58025031fa.24.1728333504510; Mon, 07 Oct 2024
 13:38:24 -0700 (PDT)
MIME-Version: 1.0
References: <20241005004451.79575-1-yumx@amazon.com> <CANNYZj_Z87h02RJuzXVTgpb0eLsJRapWQo4sXySp45uL0B+dkw@mail.gmail.com>
 <D3848342-F053-41A2-8334-0B22901E9E23@amazon.com>
In-Reply-To: <D3848342-F053-41A2-8334-0B22901E9E23@amazon.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 7 Oct 2024 22:38:12 +0200
Message-ID: <CANNYZj8T-mNG8ca1iV_Htn12SPVaYt7H8ogCxvkkSGe1yFmAvQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sstate: remove corrupted artifacts from local mirror
To: "Yu, Max" <yumx@amazon.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Sobon, Przemyslaw" <psobon@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Oct 2024 20:38:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205278

On Mon, 7 Oct 2024 at 22:09, Yu, Max <yumx@amazon.com> wrote:
> Corruptions are unavoidable part of our life, disks and network can injec=
t failures due to unpredictable and unknown reasons like https://www.scienc=
edirect.com/science/article/abs/pii/S0026271421003723. Even multi-layer pro=
tection is not perfect as it depends on where the error is injected.
>
> We proposed this patch as it is aligned with how we currently handle inco=
rrect checksums: https://github.com/yoctoproject/poky/commit/672c07de4a96eb=
67eaafba0873eced44ec9ae1a6.
>
> For context, we have builds running at a large scale, almost 24/7. This s=
cale contributes to the following challenges:
> 1. sstate corruption for us happens ~1/10000 of builds. These are extreme=
ly hard to reproduce and debug...
> 2. with current behavior of reuploading the corrupted sstate object, we e=
nd up in an endless loop of rebuilding that we cannot break.
> We considered this yocto behavior as a bug, specifically because of #2.
>
> I hear your point, even though following your reasoning we should fail th=
e entire build rather than rebuilding the packages. We can explore other op=
tions like parameterizing the behavior, but it will be very useful to be ab=
le to break the bad loop of rebuilding somehow.

Perhaps you can describe how the issue can be reproduced and observed
in a local build? (e.g. build something, corrupt sstate for it,
observe the endless rebuild problem)
I'd like to understand particularly where in existing code the endless
cycle would be triggered.

Alex

