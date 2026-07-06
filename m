Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34689C43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 14:28:50 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.151359.1783348123431220738
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 07:28:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QMcp401c;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-69a50189d25so2114460a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 07:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1783348121; x=1783952921; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UZHcTaRUBYI0nI713TrgzfXkffIN5lpfDuOIL76vZzs=;
        b=QMcp401cyXqIWaRRDjVDDRTywHLdwUs2EV+VsI5IL3b2Vuk7FjUMmeuHTF2rYDUTp7
         DhBR/UCWoEUgVnHzs30bwHRWxoofpx8xeuSuJfDU4yGtCqjEXhqIBFaTr8Y+i9EUYDer
         6rES/cZM9IYGPVHcftaXZ/Yo0aby1OcoBZqsw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783348121; x=1783952921;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UZHcTaRUBYI0nI713TrgzfXkffIN5lpfDuOIL76vZzs=;
        b=CgeH+CCo1EgNGFthhO63tC3Rn4pJbO5mqYjhPvo1pTMduYWNmytKNp7KNCdqga+xY/
         07UEUb6q1g3Aiu1oRgBnVJXcEo3f7IzB2x66d4kv5owEs5EFX/dWi9MwUH8gbq/RfXoo
         OmjbVpiqgygNZDpXOrblaXKE13CFmUMMHu5o4HAMUyB1/xZ+QPKswJ86j9BD0KXAQeYv
         6FslD8+xt9axnoTr20B+3ixrZ3swDhQDfMWD4du8geHtu416GARB4izlupKpmDbDlqYg
         SrwcNjDvecsF3vGxQbZ7UWm5S/DO21Zpc1vNTVW+iLAteW79LXfsUNWTknfezemryus2
         c2mQ==
X-Forwarded-Encrypted: i=1; AHgh+RpeWOCByYt4MVK4X+GcnHRb7T/Mvl81lgW6gIKz/91DhwwDMW9W7aHtODfMriaRI1kXeeX+u4pjMiQZFgrlSfSG0Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwLoKxR7UOwtkBPcQR9IN33x0XAmeJ/SApMqPJx2IdSZfGKYaFC
	jpcKHWzTl8/ACD4YchppO3oKb49iH5dTmYytzACWzSoQB+6MvPrlaC0h+m/82LuPi3o=
X-Gm-Gg: AfdE7ckVE9tTt6esqojkLOaht8+g6Gyz+GZ+27Xf8DgXA3ZCBrckVXPqSKinakp35J7
	fa/wNvbiCEH9dMOtsw4iCaOnpl7T+gyLHyOG2tqQfxBvIxefvWs/urpubHt6WVslcB3Z/DigEPl
	Fx1Wd7fsTISSJRv7RW2raPSlvFdaqmTEHqbKuoBMuvn2qjtsBwHKRvfufxbMlcCHSCczWsDw/Ha
	GSBER7leD88f4EJBQXmDZVUrc5N8eOZc+bHW8iZC79jGSG7zKnWRevu5/4RYpFVzHkOcY3W5fxh
	dVjC00J5RLuCg0H//rHB08zy1WpShXklm5TeOJMxN77X65bf+HVrs1TlU04Xgd9RJbTOa47qPsi
	Os09sVeRUPBf2ghJkpT6Mc78PhxDc78lHeebcHDdL661Vmg/oim1Oa1R+7sZIGnMXrgtlVn+R2H
	ed/AUQWzDh/KYa/7L6S6HcwwJIuOLhP4DiGQCuBywDZ3MLwRWuO/t5KCGSCpSRQgY/omZmPOaAN
	fG0Eb9e+ZJd4Vv8
X-Received: by 2002:a05:6402:535b:20b0:69a:4598:9d9a with SMTP id 4fb4d7f45d1cf-69a85c3080dmr416047a12.36.1783348121453;
        Mon, 06 Jul 2026 07:28:41 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3cdb:498e:44d8:3112? ([2001:8b0:aba:5f3c:3cdb:498e:44d8:3112])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19db05ecsm4065030a12.28.2026.07.06.07.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:28:40 -0700 (PDT)
Message-ID: <ef85753579692537a45f24ff7352661ec7c7c1be.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v4 00/10] Implement SPDX for deploy tasks
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: JPEWhacker@gmail.com, openembedded-core@lists.openembedded.org
Date: Mon, 06 Jul 2026 15:28:40 +0100
In-Reply-To: <18BF5783F1D47BA6.1336494@lists.openembedded.org>
References: <20260624141706.2164567-1-JPEWhacker@gmail.com>
		 <20260630210422.1903245-1-JPEWhacker@gmail.com>
	 <18BF5783F1D47BA6.1336494@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 14:28:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240276

On Sun, 2026-07-05 at 09:29 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Tue, 2026-06-30 at 15:01 -0600, Joshua Watt via
> lists.openembedded.org wrote:
> > The SPDX use case for file system image has been well defined since
> > SPDX
> > was first implemented, however there has always been a desire to
> > also
> > express SPDX output for other non-image deliverables (primarily,
> > those
> > that have a do_deploy task or similar). These types of tasks cannot
> > easily use the traditional method of having a separate SPDX task
> > that
> > runs to create their SPDX output as this causes lots of problems
> > with
> > the way dependencies are specified. Instead, it is desirable for
> > these
> > tasks to directly produce SPDX output that can be consumed by other
> > tasks that depend on them.
> >=20
> > This patch series adds support for this. Any sstate task that
> > starts
> > with "do_deploy" can now be added to the SPDX_DEPLOY_TASKS list and
> > it
> > will run a postfunc to generate SPDX output that describes what is
> > being
> > deployed. For classical do_deploy tasks, this is setup to be easy
> > by
> > automatically capturing all the deployed output files in the SPDX
> > data,
> > but other tasks can be added as well.
> >=20
> > Finally, the do_create_image_spdx task is removed and replaced with
> > a
> > SPDX deploy postfunc using this new system. This means that any
> > task
> > that depends on do_image_complete will automatically also get the
> > SPDX
> > output for the image, simplifying the dependency handling.
> >=20
> > V2: Fixed SPDX documents missing at SBoM creation time when the
> > documents were not a direct dependency of the SBoM, and were
> > present in
> > a sstate object. Previously, these sstate objects were not restored
> > because they were "covered" by the later sstate tasks, but now they
> > are
> > restored if they are depended on by a task that creates SPDX
> > output.
> >=20
> > V3: Fixed a bug where dependencies that are not in the taskhash
> > could be
> > missing when the final SBoM is created and added tests.
> >=20
> > V4: Fixed some testing errors that revealed that EFI providers have
> > to
> > be MACHINE_ARCH (and consequently, wic-tools)
> >=20
> > Joshua Watt (10):
> > =C2=A0 spdx: Skip dependencies that are not in the taskhash
> > =C2=A0 spdx: Add ability for deploy tasks to create SPDX
> > =C2=A0 oeqa: Add SPDX deploy SBoM test
> > =C2=A0 classes-global/sstate: Keep SPDX generating setscene dependencie=
s
> > =C2=A0 Add SPDX deploy tasks to various recipes
> > =C2=A0 spdx: Replace do_create_image_spdx with deploy task
> > =C2=A0 grub-efi: Change to MACHINE_ARCH
> > =C2=A0 systemd-boot: Change to MACHINE_ARCH
> > =C2=A0 multilib: Add systemd-boot to NON_MULTILIB_RECIPES
> > =C2=A0 wic-tools: Change to MACHINE_ARCH
>=20
> There is something not quite right in here which I suspect, but
> havve't
> currently conclusively prove caused:
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/4276
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/4216

Those failures were not related to this series...

Cheers,

Richard

