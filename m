Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57130C3DA61
	for <webhook@archiver.kernel.org>; Wed, 24 Jul 2024 20:30:02 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.20548.1721852996863258888
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jul 2024 13:29:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mhzdCB0c;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52f024f468bso129111e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 13:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721852995; x=1722457795; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3lVXeVmgcG2qX3DL/dncPRtZFqYsXyWaZzDhqEQhxSQ=;
        b=mhzdCB0cVrzIS4f9iwvI02e4hauH3qecLQ0JmJB7ardDLGd3QD+BkBwn2twWmew7rl
         NouH1KJVP/waSEcHx60eRFD0LLsT91fCFC+QuDv49jGeFTI3XKcpteQxX3xb4n3gHEoq
         Wr0kVNQzuMqQF3vR2vV2nDpUe9SsPQMSzqy6lzGjnCv7FwWWDxd6WOP/Xr0rpHgtoKtT
         eGnEUCu3NtXsAZDza3PB7F19HghR1PT06Z7KUqQn44qCZS4J8BZRyE6NK0QfLZCcXQDK
         wYX+x4df89VdmWhrbAqu0csvhJfI3nquc5iBVCaESVXjBjXbVEINwqR9IYcbIOfUfuIm
         +LAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721852995; x=1722457795;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3lVXeVmgcG2qX3DL/dncPRtZFqYsXyWaZzDhqEQhxSQ=;
        b=IG3ase2XLv1Axi1phBCmKOc+SNaKwvPzAvK8LJZl2MjJCVIybYh2BYGMVT1Xc2FbQG
         1fgTJ7Hd1iNrEbnsIcjqEenA3ULEWmYwga3nx8Vb4AdHQXvKkaJTOeHASNh11bcxd7Iu
         CIimsktZvY3SKvhGQxkolpMncTEqDSbF3i/tl8G9puKouNzLR+qnjislF4MXpBDDnWsX
         ZIzDh5be4175CUsAz5LayMS83HUQaU1BAA8bqJXP4sJBnyyjTeuyt2l/drgaSKoZBlym
         P4E0UNH8zgLNP7T8Ojh9s238XDFeHdu/FPx/BfgUwsxuD9zfcY+tww8UsuseW7/JObm0
         pZ2g==
X-Gm-Message-State: AOJu0Yxj5qCrbeNjQgQ/lxnbxUbW9t8I2tfQv31/ec/K4Jnmwzcr1RiK
	OG2PvmDbPeGofqjgHX9IGNYHr77UOuWlM1RHXk1RGp9ksGbA7uU6Dj6L4jseG09OvXVXTQpK6on
	CzXptzKAQ90zZPsGiwmEgzGv4nXY=
X-Google-Smtp-Source: AGHT+IFHuuxG2fIxVz6AnkUkSv+0vIvx+UP7qxcdT9Awgxhi5q7lR3n5v/IfbyXJALwN+BLyaIyhxDLZ/HKZNUwX3po=
X-Received: by 2002:a05:6512:304b:b0:52e:9b92:49ad with SMTP id
 2adb3069b0e04-52fd3e5c265mr584022e87.0.1721852994737; Wed, 24 Jul 2024
 13:29:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240724170829.3456577-1-tom.hochstein@oss.nxp.com>
 <CANNYZj_GkEBefDmtp_ANbdZEv2r+i_RfTAYd0TpEbYD1kUZ+3g@mail.gmail.com> <fae511ee-87e4-45be-ae8a-88b11d20badf@oss.nxp.com>
In-Reply-To: <fae511ee-87e4-45be-ae8a-88b11d20badf@oss.nxp.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 24 Jul 2024 22:29:45 +0200
Message-ID: <CANNYZj8s+PmYjrAEr=4gM1ZqO1enJ6t5eOdosCONKL175buSuA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] time64.inc: Simplify GLIBC_64BIT_TIME_FLAGS usage
To: Tom Hochstein <tom.hochstein@oss.nxp.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 20:30:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202483

On Wed, 24 Jul 2024 at 21:33, Tom Hochstein <tom.hochstein@oss.nxp.com> wro=
te:

> Thanks, Alex.
>
> We are working to configure the builds of certain recipes so the non-Y203=
8-compliant code is avoided, e.g, by disabling oss-output in pulseaudio. Th=
at leads to needing to restore GLIBC_64BIT_TIME_FLAGS, which for pulseaudio=
 is cleared in this file (on scarthgap, not on master):
>
> GLIBC_64BIT_TIME_FLAGS:pn-pulseaudio =3D ""
>
> When you do that override as one would normally expect, i.e., without the=
 leading space, you get the error:
>
> cc1: error: '-Werror=3Dformat-security-D_TIME_BITS=3D64': no option '-Wfo=
rmat-security-D_TIME_BITS=3D64'
>
> The problem is the design in time64.inc does impose an extra requirement =
for an external assignment to include a leading space. The redesign is mean=
t to remove that requirement on the leading space, i.e., to simplify the us=
age of the variable by external users.

Thanks for the background. I guess the only real objection I have is
about repeating the flags multiple times. They should be defined once,
so we probably need an extra intermediate variable that would be set
with target overrides.

Alex

