Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2756AC2BB3F
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 18:41:54 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.9312.1700505705938253603
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 10:41:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LtLb2llk;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2c8769edd9fso26929661fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 10:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700505704; x=1701110504; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uE1pHRsYVFJ5M2ubGnpq1H1FMCd5m5WiTOvCkYtR44E=;
        b=LtLb2llkv5fuxrVdg9PLXwUjM84/fOUlC/2g4QTgZHF5gnGpxz/8oPy9ad8gCROsCB
         XMLdN7BMCLQngxhoTTwqOIKrTQip68armMzs2UPLpP+7iY6wk6Oc8VahDY0Nc2P6KzH6
         lzdpsp/DiA6TrIbgUlX/hWHNIgCF7lTYmwYQw+XrixobZvXfD+IzWwOIx5Rg7q0r/Eel
         0qv5ZKDRcEuYpPuVXj8LJW0e85h0tU9zTkEJZHSjnqcT3OTpWOWntPLla+da8AmcpxxO
         iEMn6K9c91pz40Y0GDa8RbrzpXxw81Rw8uwzeFFv2zpwrvstVHlk6hgMsPWfBk4DFy3n
         HPIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700505704; x=1701110504;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uE1pHRsYVFJ5M2ubGnpq1H1FMCd5m5WiTOvCkYtR44E=;
        b=XFrT28cODt0SKXxm8kI3s9RYpysWPlyFqOiPs6+zyYo48p5TIw5Q+uvpMnHXgjECHg
         TEXZ+WH0X3dxMvl5XVVloBoGlzVVshL6wDXihDeiQPttRg9c3D6sY2zRBXfAflfk2aK/
         f41K0gZ0vTurwU1YnLgqazySUhHx3qw6XtSF2NaSY2wTRzJPCTOWWlL/tyUnyx29vNwZ
         fva7Apzc84f9QD0Mg6ISJ5nmkJyrVPWP2+2se6AHMA+Tqx2oMmuDf48/I2GEREtOEwmY
         XVBvUJiPZXEo55a5BZHxTUWKY05VDH+am+KdvhBE47VElJF3zi+vD2qBiZjAY6SwpgqN
         cqug==
X-Gm-Message-State: AOJu0YwptOPUM/Z4eQ9RFcVkLZYOTUozy0302oBhPpyTOmJzA/b7A2Zy
	MhZK6grCEHQEEElDpjVBBt8=
X-Google-Smtp-Source: AGHT+IHzYyWZ1YY4aaRejQwPqVSInoJZRXPeaIIiy00VgY7ThNOXoO+N1fcMsk7HDp7hRZspDMe0Bw==
X-Received: by 2002:a05:651c:198a:b0:2c5:994:ed72 with SMTP id bx10-20020a05651c198a00b002c50994ed72mr6792892ljb.21.1700505703818;
        Mon, 20 Nov 2023 10:41:43 -0800 (PST)
Received: from ?IPv6:2a02:169:59a6:0:5488:f785:9061:cf6c? ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id q11-20020a05600c46cb00b00403b63e87f2sm14521727wmo.32.2023.11.20.10.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 10:41:43 -0800 (PST)
Message-ID: <d9c8d5ec4c8ae98f8b065501292fbe2d32fbbfe6.camel@gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] cmake.bbclass: optionally support qemu
From: adrian.freihofer@gmail.com
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 20 Nov 2023 19:41:42 +0100
In-Reply-To: <CANPvuRkN=exsjS1EUiM-MKDc+HN_LT2vNrsOSYuBsnP4jmzZFw@mail.gmail.com>
References: <20231120144628.52664-1-adrian.freihofer@siemens.com>
	 <20231120144628.52664-3-adrian.freihofer@siemens.com>
	 <17996456E4E8A103.7061@lists.openembedded.org>
	 <CANPvuRkN=exsjS1EUiM-MKDc+HN_LT2vNrsOSYuBsnP4jmzZFw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 18:41:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190928

> >=20
> > Are you sure this works in the majority of scenarios?
> > Last time I worked on this qemu user mode failed to run
> > multithreading=C2=A0applications.
> >=20
>=20
>=20
> Sorry, I was wrong above.
> The issue was not multithreading but with the fork system call.
> =C2=A0

Hi Jose

I was using it for running Unit Tests on the host before I deployed
them to the target device as ptest. This worked well. It is well
integrated with cmake and therefore also with IDEs. So I thought that
there are certain use cases where it would be nice to have it opt-in.

meson offers qemu-user as well (because of gobject). So if qemu-user is
not usable there will be other challenges as well.

There is also a MACHINE_FEATURE which allows to support it for ARCHs
where it works well but not for ARCHs where qemu-user is known to be
broken.

I think it would be a nice optional feature.

Regards,
Adrian

