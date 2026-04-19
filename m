Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0BC4EA71AD
	for <webhook@archiver.kernel.org>; Sun, 19 Apr 2026 21:25:20 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7288.1776633919236322070
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Apr 2026 14:25:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZnPxcN95;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: twoerner@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-38e800deae4so19243991fa.0
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Apr 2026 14:25:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776633917; cv=none;
        d=google.com; s=arc-20240605;
        b=UbhC1SIlc60IxYE8DspwLP+PdTe3TolEpX1XEDEumknmoVYfUD3Y4VwPpOLWIhCjrz
         Mw8A6vTqziDbHPNwM5jTZiGmpsEDhYn34GhIQc/Ku/7LLLK6npMDQBl6pMC0S/H1CSj7
         uVRZQBz5GX7tgyaPmpROp8W02f7A0bkHoR7YW0wAVwooblkdoqRm9+3TIKaf+TlTDDov
         MrchenHx9yw3PIuM7CdTQ+YknrsVDpwoA7B5L2CjBMIWA7LDBzxuVkhK5L/XLoBu+R3N
         6TP+zN8RO3ZtyZa1kq4dSSHx1l4i3MAjykHD9agIIFlZfPfBzL8bJfIMUfBiv3QM5F1C
         NYew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8LgcMNOiY4ng9YsYcwkMkJeYJoll5ilIIq09qnutQlk=;
        fh=SrdVmXV3Gv+oXMI0jnDvLEYyknNQCmG10Cxh/inks0w=;
        b=FzjqR2sWUjLIvtYdxMcIR0zuroos1Aa9O9m4pC+buG3BMkbM1T4rLbHw7V0SerTLj6
         CAHG2wnRGzrQuD8tl+8zKZfD/vFkH5Zrz5tjfvygebyz6eLTY9mFrGC8YEjLyDFAxDDk
         UwX1xx9fdKucaayLyDQVrEs+lplOFHVQy63ha6xGfeo9eCOFVFSBFgejHPwF4/5z/PWw
         ltHBGKrZX8ZMb7zzmOABzIfTkwOgJea6aZH30HRVQ/SvAVwxJdtjs7BJUArRMKlQbYoF
         5lj93tV1r3IZY9HSXtjd8r0R0GcyH/SfHiuyECpXGUCig6Oyh6X6p67SEZIwNxCafeh2
         o5kg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776633917; x=1777238717; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8LgcMNOiY4ng9YsYcwkMkJeYJoll5ilIIq09qnutQlk=;
        b=ZnPxcN95PpRbY/Jvisg9jVkwV4AVRGpQJWU30Y/58hn+8sXr2WXcEXXWfBdpIaswXj
         mH/IMGp4mzEj5pUVmXm8FCvsNGLl88RmhyoT69gw0EGasGLvAEhgPPICUZZqRrlO0RJx
         0/jMAnJ6zn5D+aBhzyZyh+8BfbfPbyYll0CiqfvhFE1p0ejPGUB3VzXpiQLiTg781FVO
         DkwbVgoBg/T+D8oXG9dHj7SXFotl1kIKqcGwON5D1EaelD1ptYlvthfHCNWkAatBvNqV
         hlfgIYyCorsGFkrb3JCIRctOaPntMoEPIJjf1h8nwT+ieqfo4P9o0QXRziVPQ5f0Ko2z
         njDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776633917; x=1777238717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8LgcMNOiY4ng9YsYcwkMkJeYJoll5ilIIq09qnutQlk=;
        b=W0CRlqdH/ArWTSGmCr1jgyI+t4VpIxGXMCvqXdFfFM9MFWX7PEPoIE7jTieaGHxHX0
         lm1UjNO4G81siBijugtf201EpSxSGPLffSc8dI8g2pjSy5HBh69ITiyvUNI2NWfmKv0L
         mMrO4uKoE9qp26yhdK+hGi7aeiirTmhyHxbWZdPswrdmpYHoz+k7FD5t4q2kmkfNATi5
         cecY/6sTPFNZxAtCzYJ+bNPP2UcOExWdX6IxQfAC/CtV0bqKX2DuZbvD5VNPXHb1+Knk
         vVgERg4gNIuUXgw3pC8Q7MGzf5tsYZD+dJK5kmIlSTUmfTSXqgaI4weqbuvi/7UFHfO5
         3GMQ==
X-Gm-Message-State: AOJu0YxZ6rylE6h79qj0fF+m4pOi9pehvLLKMAQC9I4lXJo9snsYzmPa
	/MPKMSyk9RoeGT8KnL21leFSwO58WG/vi5RftdjhUzxmuNAYF5wlpWcIaIzBju9+5IXjr1txaFa
	XAwz8nJWURer6RbklUNnHfbUy8rgmk1s=
X-Gm-Gg: AeBDietiDwu9tYSQbLw/CuFiswqxcm3VaS6akMU2XMEFlXuWjLhMnfmwwcmj7C9S6Xh
	Y43e58DvxB8z2ITApVmqOKVHtHe4sRC8n8OIlIjsQnJrcYw3l3GmpwGu8XHjYvUdWLgfINVvosm
	31MEbDUhNrSIFVlGleoLor67tulbA70j8RMfFCDFVchOaQ7EX/MlAWXsWz3yTT2L8IVaS2J7tAa
	rEqrA2Kg6oYN7uN8JBEGI0tatLCCM++59NmaeS+jb7QNu9a/mZ8ebxEbKCtapHR5E8ZK25J7FKY
	I9ex8XFkFfZ/CV9VH0lxF+ASyJl71Q==
X-Received: by 2002:a05:651c:1113:b0:38e:2f60:acf6 with SMTP id
 38308e7fff4ca-38ec7827f5cmr26943121fa.11.1776633916590; Sun, 19 Apr 2026
 14:25:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260403183541.2631883-1-twoerner@gmail.com> <20260403183541.2631883-6-twoerner@gmail.com>
 <899824.1776549381025573302@lists.openembedded.org>
In-Reply-To: <899824.1776549381025573302@lists.openembedded.org>
From: Trevor Woerner <twoerner@gmail.com>
Date: Sun, 19 Apr 2026 17:25:05 -0400
X-Gm-Features: AQROBzB_tjxfNjrTCwb1-hsu9RWtYP-U5DjPhhx89i54B8ZFOOWipXt-dCFHL-8
Message-ID: <CAHUNapT7dfL3xd+Bd4V8avPyL02uV0KiucY3VHULQdsfbpbt+Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v9 5/5] wic: remove to standalone repository
To: vince@underview.tech
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Apr 2026 21:25:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235527

Hi Vincent,

I am in the process of adding an extensive test suite to independent
wic based on pytest. It will include lots of unit tests as well as a
number of integration tests. The tests are mostly written at this
point, I'm just going over everything in detail before submitting.

I don't know if oe-core will continue to have its own wic tests. I
guess that's something we can discuss once I get wic's tests in.
oe-core might always want to keep some sanity tests around, just to
make sure wic is doing the basics of what it expects, especially the
qemu-based ones to verify the images actually work for oe-core's
purposes.

Best regards,
    Trevor

On Sat, Apr 18, 2026 at 5:56=E2=80=AFPM Vincent Davis Jr via
lists.openembedded.org <vince=3Dunderview.tech@lists.openembedded.org>
wrote:
>
> Hello,
>
> Trevor and all.
>
> Are there any plans to add a similar oe-core style
> testing infrastructure in the new wic standalone
> repository? Or is the plan to just store the wic
> command and plugins in the standalone repo,
> but add all test cases to OE core?
>
> Awesome thinking and work Trevor!
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#235523): https://lists.openembedded.org/g/openembedde=
d-core/message/235523
> Mute This Topic: https://lists.openembedded.org/mt/118654172/900817
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tw=
oerner@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

