Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F57EC3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 19:39:13 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web11.92634.1705347543469221851
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 11:39:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f/xtqOuW;
 spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6dc83674972so4970463a34.1
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 11:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705347542; x=1705952342; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GGAUJ+dosAB40FOtHulP+TQlxemGn5+iye4tKh3kdKo=;
        b=f/xtqOuWujYimxvveVqNw9eyOLFDE71cWIhMuy4jlzb5eb377u9d3HK7l/BxuVAlv8
         eOzq5U0/4Oe0QP9mr7A7wIZkeCQD96UcsdMPUCDSbjGb1A8Va3PEXZ2jdO6xT+uq/Rcf
         /lxFU7wvOrale5CPbFSLjDzCYpHteVXICCFOhNmuANFyri4OQ1mzZ+qkXMdwjOyeBc2x
         aUl1HbqdllYs401tos4Npzze0LNhZt/iMsB03wCTCSVO/Tl/d3QJJL9QUJe95iRCG+SW
         RFzpT+c1QgPiuetIY+5A2WjKm3YDwCFqvq6u0yQdLVJLZBm/Og2VuaDQgoeib3lFKu7a
         wMfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705347542; x=1705952342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GGAUJ+dosAB40FOtHulP+TQlxemGn5+iye4tKh3kdKo=;
        b=DqT6wSyEuCWoV3Bg9bZOU/TIditrAP0VIHcPv/kLASFQXamhbiExYwufJ1W5I01stm
         AU+MlThN3g1w2NlksSgwvV12cijq/AMdmk4wYvNQ+X49/yiOuBD71ChmK2fCaPyh8nys
         z9XXlUQg2IjwlUBN2LoiifdBJFMwattzLerqNujeD1HnsQ1QqI8APiEFN4BRK8jl/4/W
         dyrHh7jsNxBZOWEV0RFavakJUnDHfaJKAh5SKJuJ4PTCvd9Z7czu25jIBQeahwgBYe6u
         0gXRDgteT08mdsJEFjzucxC8gNIW58WVKIe7C8ZPiYC4Z/SHDPTFpglSl0o7zre5AH5A
         SMDg==
X-Gm-Message-State: AOJu0Yw+BOz4Djc5K1FuKozjF+xCsoL/DacxB++IpHWaBJAaGnMQPXWw
	Y8wsDBnU0VLhHsPP/RnIRiafrAySf5LmjNGgfXA=
X-Google-Smtp-Source: AGHT+IFCyaIqzoD4bMQ2ro08Xec4zVLhk33iHVJHyna4LefaAw9eZx3mncZ0XvPT7LgAJ3YyQxRDrNQ8wU/pKY4xrGA=
X-Received: by 2002:a05:6871:289:b0:206:bcbd:30f9 with SMTP id
 i9-20020a056871028900b00206bcbd30f9mr4977919oae.34.1705347542602; Mon, 15 Jan
 2024 11:39:02 -0800 (PST)
MIME-Version: 1.0
References: <20240109192923.3183219-1-raj.khem@gmail.com> <3B3DBDDB-9E17-431A-B3E8-DC8E072066FC@arm.com>
 <CANNYZj_oydN+0ODz_kCjus74uzF-wUhcZ1nfmYqrRo+BoupB4A@mail.gmail.com>
 <3642B18A-B5F2-40EF-B1A9-303923477117@arm.com> <CAMKF1soNT6kc-jCNsop1qaQVxDphZEO3DNa5AB4jwP=2Rd729w@mail.gmail.com>
 <D8380C51-6614-4A8A-AC51-E702FC039561@arm.com>
In-Reply-To: <D8380C51-6614-4A8A-AC51-E702FC039561@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 15 Jan 2024 11:38:36 -0800
Message-ID: <CAMKF1sp9qs6Ue2n1S6cJbWu4wJ6MPb-WgnpBaqq-MMYwU9hrDw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] glib-networking: Fix ptest failures with
 openssl backend
To: Ross Burton <Ross.Burton@arm.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 19:39:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193797

On Mon, Jan 15, 2024 at 9:06=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> w=
rote:
>
>
>
> > On 15 Jan 2024, at 16:53, Khem Raj <raj.khem@gmail.com> wrote:
> > Where does it say it does not support? On the contrary there are patche=
s in this area sent recently
>
> https://gitlab.gnome.org/GNOME/glib-networking/-/commit/8e1d80c1e0fc52d17=
d08a21946fa4a86ec30e1db
>

Right, it was 3 years ago and note the mention kind of systems where
it maybe in use :) and OE is used for such
distros so it might be useful. The fixes to get openssl support
improved have happened after this commit.
Its fine if we do not want to accept patches here and wait upstream to
support it fully. Because than it's easier to direct
upstream work correctly. We just have to be clear with these criterias
in general.

> Ross

