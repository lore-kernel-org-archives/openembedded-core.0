Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F785C10F1A
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 20:25:34 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.77.1715113531698426843
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 May 2024 13:25:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mAyJOTsf;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2e0a0cc5e83so42229841fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 13:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715113530; x=1715718330; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J6yr4YYCDFO9tvUz4+DsP53zPOp28zuGyIZvvZCPAd0=;
        b=mAyJOTsfX1AKXgv+sgIfZMTx9/8u90RdWQsnNI2etpg8XnpcK48ZVSd6+HL/Ns5i41
         hCsM8oBS87Deli7/oi8jvfbRPmM/nWAPRZd9Ru4tKvjl/aIU1dPYnc8yQp7Fe82F/6xW
         mR2sTB67pnNA4HTZNXeYMwz9C11ckSBKbNMTD3Id32ggj4rfGC4QVC8+rDQ0dItAcMUf
         UvrQj5rnWZ74dE+sWn6ffwv/3yLY9MxR2J6K/arceDmefA1EifmGfCmDTB6sWKtfv7nv
         +cNw7GDZzIGmsF/4nl39k7m8WbgbE2LAhIx0LW8SkDAnLLzgH7qvO3jyA10s4TqKehwx
         YdIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715113530; x=1715718330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J6yr4YYCDFO9tvUz4+DsP53zPOp28zuGyIZvvZCPAd0=;
        b=BTd0LSgIG4Y4Dok1JtfJ7XJw4+3Mj9rgYhTW92nqXJUqSiXUOc7V/Unw+S4w+DXqWf
         IAPpqITXKjR2OKkdzdwHuFhCKZ2rIzCB0rB4M9H0mKgKTQ+XIb3xRZRo2hJJPFcmFUKg
         F/ToYx3na5wO0AppHqVn6TFn7ggUOa/Knr5NZlX4S/Z1vzIVZ951o3bZCSHKz5+oW34e
         azQHloxRv0A1xvtOY6tIdk1LTcWxCU+zK9k8Cvw82waHCViW2WqC/ULo3acZfphict0/
         S7XiRlB8Q8kQUStHKZadXXaniGjS1rfxZ+ZLWfCs+RUzf/TKOUdgty/V1UeTsq+5Ri7T
         8tQA==
X-Gm-Message-State: AOJu0Yx2YeoG/0JxO3bBhLWt6R8lsUpiIQV1Eq5HTQtKiVGVLCA+3dkd
	A9q6SgIu0lkqjtm/2W7hA63qdqZX0JI9tvCxSsGi3qf2fYEW/zm0r5xK6DS29RPcIvqKnk/spJK
	Ai6vg8TF5PAbDTFsGPANwo+C40os=
X-Google-Smtp-Source: AGHT+IFVTrO7yMOBlK46MqQ76tG+8krnQxe9ob5KMZmCmFmvqROZKsP/BzOAUN+O22G52QDVPxYjHuwG2A8rnER8yKU=
X-Received: by 2002:a2e:8798:0:b0:2e0:2ef4:a985 with SMTP id
 38308e7fff4ca-2e447baa429mr3925051fa.35.1715113529770; Tue, 07 May 2024
 13:25:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240502103252.1102710-1-alex.kanavin@gmail.com> <8272EB4D-B779-468B-9A14-1F7415301046@arm.com>
In-Reply-To: <8272EB4D-B779-468B-9A14-1F7415301046@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 7 May 2024 22:25:17 +0200
Message-ID: <CANNYZj9tTyO-t2=ytBGT8j8J92v7_w7B-drTnEkBQq1m+G_CHg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] glib/gobject-introspection: update 2.78.4 ->
 2.80.0, 1.78.1 -> 1.80.0
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex@linutronix.de>, Anuj Mittal <anuj.mittal@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 20:25:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199105

On Tue, 7 May 2024 at 17:52, Ross Burton <Ross.Burton@arm.com> wrote:
> If you send a v3, this can be Backport. :)

I'm leaning towards addressing the review comments with followup
patches. None is a critical fix needed for update itself. You ok with
that?

> > +EXTRA_OEMESON:append:class-target =3D " ${@'-Dgir_dir_prefix=3D${libdi=
r}' if d.getVar('MULTILIBS') else ''}"
>
> Why does this need to be conditional?

This is a direct copy-paste from g-i recipe. g-i (before) and glib
(now) install gir files into /usr/share by default which doesn't work
for multilib because they differ between 32 and 64 bit targets, and
package manager errors out.

> > # setuptools can be removed when upstream removes all uses of distutils
> > -RDEPENDS:${PN} =3D "python3-pickle python3-xml python3-setuptools"
> > +RDEPENDS:${PN} =3D "python3-pickle python3-xml python3-setuptools glib=
-2.0=E2=80=9D
>
> Is setuptools still needed?  If so, might be worth calling out what the e=
xact user is because a simple grep doesn=E2=80=99t find any users.

Indeed, neither distutils nor setuptools are anywhere in 2.80.0 tree.

Alex

