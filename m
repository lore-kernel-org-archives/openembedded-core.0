Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87939C021B0
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 12:49:33 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web11.21129.1739969368841507796
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Feb 2025 04:49:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kJT79s9Z;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6e44fda56e3so7837416d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 04:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739969368; x=1740574168; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xL6LeCjxmQDbpRSrdGZVRwAetIVpVaZiOKg/SF0uEM0=;
        b=kJT79s9ZpjBNQ01IirDaOcs/Qyz6G6s1wK1FeGTim1dUHnk72iljDqScckHGMFD4L/
         A7PM2VgUBOnaYX7Y4pzH03DYRkOvvJWq4v34i4eIq6hDiLpTujjqdSOAixYl/xzD0aVg
         7WEGpPkT53UUiDvtsafI2O7CG3IhRb1EyRfkhV7MKhz2EGd/UnGMWj+V/SGhLqhLhwUe
         xyJPKac1kSQVeznLAdbnLnPOYqmSiy0EK3wV1IvgZYFrOMMtCRzg2x/LT4+AUuMUwBAl
         pEG198MpZT0nSurOUnWhLI1s9Ak7n3XgwbWh7ddxGDXZrBhT+P58IrLWiMkpGCEcO5r0
         9cmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739969368; x=1740574168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xL6LeCjxmQDbpRSrdGZVRwAetIVpVaZiOKg/SF0uEM0=;
        b=MZeGmlewBhUweBrmt0RRmXmwVLLTgr26EYn6qQOgvZP7of+4is7fxANDj4RQvSMFMm
         swJutL7LS7RWjCCqe0uJGWvVzeQPrGcDr/bSmsKNWs1fDHBQvE16KnETBPZjZjKfGYzy
         Y6FWLqJtWhKzONmmCaMVKbTVkOwyDNL9vc8wuRp/64jZbbs+Ds0AYEZZwnhivAV5+dXz
         OE5gFweCxUZ1j2R0BLJo+LrHGMG6GXMbNgu7lnmQaWzsRthB1k5jGsRUsRtJRGQJLpGs
         5xDAWJP3AIzhKJb9XkNAUspBQWUSjDHoOkBehGgbbn1xtfHJsgCe1ThSUU66JRyqYioN
         Sw2g==
X-Gm-Message-State: AOJu0YzWMK79HveZOs7dF9Mxz0Zpa055HZ+tF1eHuh07A5k4MDFB5/hU
	jEvNlZjKwqOnkQb1B/giy9FjNf/rseQm1NusGcrgGc+5cjnYdh6c8HARVcoqT0TBfLUMzME5g8K
	H3klLsmH/bQJkhRUU35oykxoeEbk=
X-Gm-Gg: ASbGncsACPzIBqFgAhqQQ4KkmVPol3LVi54+L2Pkc60Uu8BAu6hK+JJK+CgtxeYDe8E
	Ypf6+MuNsrnPoCCnfIJX3GOjxjaK3/kHKX4R6+0ReV+LpRwONoy7qSN8bM2qm4YRBEcrAeqhx4m
	PJMqG142FH+WB05XLSi/abo0eq4NTQ9L8=
X-Google-Smtp-Source: AGHT+IGDry3r9XjUTHSdEM5AvSC7ojuB/q87BO52gLOhmiHN9ZfiBWs5+NDJXMOE9uvh2kBioAccN1oKTsX8qG6Zxfk=
X-Received: by 2002:a05:6214:224c:b0:6e4:6a67:2d12 with SMTP id
 6a1803df08f44-6e696bfab6cmr51444136d6.0.1739969366350; Wed, 19 Feb 2025
 04:49:26 -0800 (PST)
MIME-Version: 1.0
References: <20250218134336.1976728-1-festevam@gmail.com> <CANNYZj9QEnkPDekf9Nf5Wo2zJsSfT28C9hJkj5_PqB0oDgs9qA@mail.gmail.com>
 <CAOMZO5BSugZdDcPxwbZj_H6ik7bR4P1Vj+QVVa0YxCBkfUbEJA@mail.gmail.com>
In-Reply-To: <CAOMZO5BSugZdDcPxwbZj_H6ik7bR4P1Vj+QVVa0YxCBkfUbEJA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 19 Feb 2025 13:49:14 +0100
X-Gm-Features: AWEUYZkoolImznwUdAkS7cYYuHGdy0ciyxDdSbc2rcphiR3MAln8RBKDjfVn0KE
Message-ID: <CANNYZj-QunGv+7K64=Z0xzOH=Pv9XsfKd6qK7J7B9dLUMDmRyQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/2] libexecinfo: Move it to the core
To: Fabio Estevam <festevam@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	mathieu.dubois-briand@bootlin.com, raj.khem@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 12:49:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211706

We have an Upstream-Status for that too :) Please change 'Pending' to
'Inactive-Upstream [link to evidence of that]'

Alex

On Wed, 19 Feb 2025 at 13:35, Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Alexander,
>
> On Tue, Feb 18, 2025 at 10:50=E2=80=AFAM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
>
> > Can you submit these upstream please?
>
> Unfortunately, libexecinfo upstream is inactive.
>
> The https://www.freshports.org/devel/libexecinfo page says: "There is
> no maintainer for this port."

