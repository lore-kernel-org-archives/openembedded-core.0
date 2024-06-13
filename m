Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECE64C27C4F
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 06:45:10 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.2199.1718261102881390389
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jun 2024 23:45:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=C/BHjFYi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-35f1e35156cso702650f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Jun 2024 23:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1718261101; x=1718865901; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0P3cGxCmfKLgSYWhxgPPjsEqQmaCf88V6PU+VWXoKbc=;
        b=C/BHjFYi8NoAi/2pK23JZ1jaRAGM3WJkQo9vf2HQRSZeXLVxYJRDgaxaRSshzx5mFV
         56Q2qcQLfXRqRQPirlbRQ2cxl8LEQPusNbFL681EZHNpK/FIQ8gPmYuXUOdQLeAWIOgt
         nEX1z0TLSq5V8HyozpFm/LdWW8bzNrtMZiYWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718261101; x=1718865901;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0P3cGxCmfKLgSYWhxgPPjsEqQmaCf88V6PU+VWXoKbc=;
        b=WJhrNVSB0BMwegbfXugih5cqbGtROW0YVi/nnde9jnXzbmJ2uHT4dHxl4QIleQUlU2
         YpAwT3ayuu/R4nrdC4LiqHVj5EPy0Kd4QALjkZbOUEdN/UWLUjrXj4IbedBje+CFaH7m
         FhV9w8Q8C20C3kvnw/7jAUyqV6+eEnYY7mcJyPRYyvZNw27mFlYlPqwlxQWH6wKMjYfd
         OI7gEdoYPk9qs/IEP5aQ1c9FFqIN7MeP91hcvDmlPUP+oVcXor1FBGMXSSIgHWUCAW1r
         PWfhMvwAfl8fDp5V11pqqNfOkH2SEeTU4C++3j20GRBpTQHrwy+ibnYWoXG1JHyHa3Wb
         eXYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIoX2Rt/qT4zHV4yF2q1Ag3fZRyW7M1YO/wpQNmdG8P9il8xmakBaePdSPoInkbG1eNMXu+GgHTcGwPcvJkr3St1pRoakx0kaDCWv30TfwqcneYcwVHpCa
X-Gm-Message-State: AOJu0YxuykABBm58ZGtqmM0lP3ts3mNdzJhOjehp+7+FjBHQRl9H0/MG
	evCAbwwAYTMXvMxzrnTJ7qJyEnMW2PAe3kM6t0SPqzNSkeHKq9s6aWBh0C51xV0=
X-Google-Smtp-Source: AGHT+IGw0TVYDlmujXo3CyrXGifAL4UlxnV4/OR5WPiIRHasO/ajMaOxUayPRmcZTBoiLEVN4j7kiQ==
X-Received: by 2002:a5d:400a:0:b0:35f:caa:1ebd with SMTP id ffacd0b85a97d-35fdf786e80mr2699180f8f.8.1718261101063;
        Wed, 12 Jun 2024 23:45:01 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:fbe4:47b4:75ac:5e6d? ([2001:8b0:aba:5f3c:fbe4:47b4:75ac:5e6d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3607509c883sm756798f8f.29.2024.06.12.23.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 23:45:00 -0700 (PDT)
Message-ID: <4a6b60ec8200956e25e031cd28bf1023cf02df3f.camel@linuxfoundation.org>
Subject: Re: [PATCH v11 0/3] pkg-database and systemd-sysext image
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Johannes Schneider <johannes.schneider@leica-geosystems.com>, 
	openembedded-core@lists.openembedded.org, alex.kanavin@gmail.com, 
	alexandre.belloni@bootlin.com
Date: Thu, 13 Jun 2024 07:44:59 +0100
In-Reply-To: <20240604065040.2771-1-johannes.schneider@leica-geosystems.com>
References: <20240604065040.2771-1-johannes.schneider@leica-geosystems.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 06:45:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200592

On Tue, 2024-06-04 at 08:50 +0200, Johannes Schneider wrote:
> systemd-sysext allows to overlay another image (or multiple) ontop of
> a "base-image" =3D the current rootfs, via the use of overlayfs; to add
> tools and features meant for development purposes.
>=20
> To quote the documentation on systemd-sysext:
> " ...addition in order to make debugging/development easier). System
> extension images should not be misunderstood as a generic software
> packaging framework, ..."
>=20
> To build a lean image, that only holds packages that are not already
> part of the base-image, a snapshot of the package-database is taken
> after the installation of the base-rootfs is done, and picked up
> again
> when collecting the rootfs of such a extension image.
>=20
> with all this in place an example usage could look like this:
> some-core-image.bb
> =C2=A0 inherit core-image
> =C2=A0 IMAGE_GEN_PKGDBFS =3D "1"
>=20
> extending-image.bb
> =C2=A0 inherit image-sysext
> =C2=A0 IMAGE_FSTYPES =3D "squashfs"
> =C2=A0 IMAGE_BASE_PKGDB =3D "some-core-image"
> =C2=A0 # the above pointing at a package-db similar to:
> =C2=A0 # build/deploy/images/$MACHINE/some-core-image-$MACHINE-
> 20240210172305-pkgdb.rootfs.tar.gz
>=20
> then on the device, running some-core-image, with the extension image
> placed at FN:
> $> ln -s "$FN" /run/extensions/$(basename $FN).raw
> $> systemd-sysext list
> $> SYSTEMD_LOG_LEVEL=3Ddebug systemd-sysext merge
>=20
> As long as the VERSION_ID of the extension image matches the os-
> release
> in the base image, the above commands return sucessfully;
> for details on the compativility check see the docs for systemd-
> sysext.

I'm unsure what to so with this series/change.=C2=A0I'm a bit worried that
it is copy and pasting the debugfs image code to another form and once
we have this form, I suspect others will then also want things to be
added for other image update use cases or similar. That code is already
hard to read and this is not going to improve that. I can understand
the use case for the code though and I can certainly see why you'd want
this code upstream as it would be hard to maintain standalone. Having
the tests do help but the also illustrate this all feels a bit fragile.

I've just seen further failures in testing:

https://valkyrie.yoctoproject.org/#/builders/76/builds/55/steps/14/logs/std=
io
https://valkyrie.yoctoproject.org/#/builders/35/builds/47
https://valkyrie.yoctoproject.org/#/builders/48/builds/16
https://valkyrie.yoctoproject.org/#/builders/54/builds/57

and https://valkyrie.yoctoproject.org/#/builders/23/builds/58 will
probably fail too but is currently still building.

What really worries me about these failures is that there isn't a good
error message, so if this happens some time in the future we're going
to be scratching our heads wondering what is wrong. I'm worrying this
is going to be particularly hard to maintain and keep working in the
future.

In many ways I'm wishing there was an API you could hook into so that
the core project didn't need to take on the responsibility for this
complexity.

Regardless, unfortunately we're still not to the bottom of the failures
as evidenced above :(

Cheers,

Richard


