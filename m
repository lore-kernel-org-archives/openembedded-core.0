Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF4B3C48BEB
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 09:02:00 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.37940.1707901313472417280
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Feb 2024 01:01:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NW/22c+a;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-411ea1ccb6fso2433135e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 01:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707901312; x=1708506112; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Muh+hs/TTt54HkLOorkuhHQvVGG+ryiI4XmlV94H730=;
        b=NW/22c+aMZOziQIk362FU27r86j0tgEMj3ppuptk9NmRNBtUZHl2JKuN/Ae/T0SHST
         M5shy4/Vd25bJSCrT7g0zt6wdXrB70kmZev5CSMXwWqhTAqfk5JJ3K+MgY9BJmwvu2uj
         VWvzX4qBQjoZBKr34MX8p3snLMuI01SUXSoaM/j6dIpt58skY/1QBpUXEI5vl/Zt0xmF
         7oekF4e8lOGsmlK9vxkYtNC7OyqiYHBMCnrEqC/huHVSHXO75k6ZdrOcZJpiO0KQAdX8
         bHrxDeIzlB3GZvVz5MjTja8mEaXIwoYkWx48m+cy7Tl9dGMDh4ice4P2TlpXT2+r/xlE
         uuxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707901312; x=1708506112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Muh+hs/TTt54HkLOorkuhHQvVGG+ryiI4XmlV94H730=;
        b=MElcVfjLGvYTUusafJf/60eac3ctYXtkIXdg8+3mf1kO4/1O0vpBI1ThXtf/c5F0GQ
         67Vpy/pHiF0fQjH+7kyaurxsJhzcVXKvHOIzfQ2SJYJR1duBS5omuX3pyjtFIVPVGoJz
         nDr16ofyI58ayuXF9lQ6hM66IWfv3d0wHyNlXY1/+hpOkKkAcrqTFWYU04z9a88BgGii
         H8LQKOXsl23uithVJMqk1sMHBfgTEND/09u9ELJTeXK+VkSKv00gq5ayxheb9dmtGfxQ
         I28WA8zrPS4BniahcptGn9BbcPOOsfyfFefcoLnfTYBqU/6tma/oyPnF6gtx3hNf8jNc
         r7Yg==
X-Gm-Message-State: AOJu0Yyu1YVpDA6FZcjIvLocjoKanVnuJkNyVlisXd8Ri2tqLWu2Ypfv
	JqLkbljk2XIQDLcHSiej5YFBgcsrzXkh/NJCegD8MgToeXAKJH/+
X-Google-Smtp-Source: AGHT+IHPW9GFq6QHGJ6PbQP3f58S0feD98OS52/I6oddTPFzwieDDh3hFTadcGJl53h24j2T+pHrzQ==
X-Received: by 2002:a05:600c:510f:b0:411:c329:6515 with SMTP id o15-20020a05600c510f00b00411c3296515mr1731511wms.24.1707901311670;
        Wed, 14 Feb 2024 01:01:51 -0800 (PST)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id p15-20020a05600c1d8f00b0040ecdd672fasm1314998wms.13.2024.02.14.01.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 01:01:51 -0800 (PST)
Message-ID: <7d610cea521ca639e50f3a7a3f49be91587c3368.camel@gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/4] oe-init-build-env: add OEINIT variable
From: adrian.freihofer@gmail.com
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 14 Feb 2024 10:01:50 +0100
In-Reply-To: <CANNYZj-mMv2miTA8fMBU9fJydCupT2eg8Y+thFVjfzfQW40TZQ@mail.gmail.com>
References: <20240213221846.109260-1-adrian.freihofer@siemens.com>
	 <20240213221846.109260-3-adrian.freihofer@siemens.com>
	 <CANNYZj-mMv2miTA8fMBU9fJydCupT2eg8Y+thFVjfzfQW40TZQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.module_f38+17164+63eeee4a) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 09:02:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195455

On Wed, 2024-02-14 at 07:37 +0100, Alexander Kanavin wrote:
> On Tue, 13 Feb 2024 at 23:19, Adrian Freihofer
> <adrian.freihofer@gmail.com> wrote:
> > If more layers are used or a different folder structure is used the
> > build folder and the .vscode folder should probably be at a
> > different
> > location, where the OEINIT variable is required.
> > One use case is a layer structure like this:
> >=20
> > my-top-dir=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <-- OEINIT
> > =C2=A0 build=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <-- BUILDDIR (=3DBBPATH=
)
> > =C2=A0 .vscode
> > =C2=A0=C2=A0=C2=A0 settings.json
> > =C2=A0 oe-init-build-env
> > =C2=A0 my-layer
> > =C2=A0 meta-oe
> > =C2=A0 poky=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <-- OEROOT
> > =C2=A0=C2=A0=C2=A0 oe-buildenv-internal
> > =C2=A0=C2=A0=C2=A0 oe-setup-builddir
>=20
> I don't understand. When and how this situation would occur? Why
> would
> it be set this way?

Probably always when working for a project which uses more than only
poky itself. It's just one example for a directory structure where the
build folder is not inside of the poky directory.

The purpose of the OEINIT variable is to support templates which need
to know where the folder with the oe-init-build-env script is. This
folder is considered as the current working directory of the user's
editor, IDE, terminal or what ever is used to work on the layers.

Do you have a better proposal how I could generate a config file which
is located in the directory where the user's editor is running?

>=20
> I really don't want to add more variables into core scripts for
> something that looks marginal at best.

I'm not sure if this patch here is more marginal than adding a conf-
description.txt. The conf-description.txt could almost be considered a
copy of the conf-notes.txt. I am not against the conf-description.txt.
But to call my patch marginal in comparison seems a bit extreme to me.

Adrian


> Alex


