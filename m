Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7873C54E67
	for <webhook@archiver.kernel.org>; Thu, 14 Mar 2024 11:00:35 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.9809.1710414033092706064
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Mar 2024 04:00:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AbxPa0ZP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-33e285a33bdso483833f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Mar 2024 04:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1710414031; x=1711018831; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T155l12m12ZKXx6kmtRmJgfcmxNCS6FRSjpDUMKA7qY=;
        b=AbxPa0ZPCHmndqGxAFjf4NweGMNENZER3xHoHxs8cZFYpyaWgvoVDS352kyQ7yJiYM
         oxOxQxadlOSTr0TJOWs4+Xwmi2K4Y7MU3EWjR+k4iOBYSoqBn3aa9J1HH0z4Y+FMcTPE
         eTghn8PxjaPj2QOWPp2wgt0jAZ4BitDIACbMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710414031; x=1711018831;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T155l12m12ZKXx6kmtRmJgfcmxNCS6FRSjpDUMKA7qY=;
        b=S2I+YHlCE57wzlu8YKobm39wZC5IRLXvVnd6qgmBzrP3bWhVcmc5uQozxMxZfilhnB
         JB1vDT7nHLvAOPhACtL5RDJi33MrbrBBoZKLJlEclmR2+n8dpAbfYFM20m/tGYLl1pbN
         BHhfQuGPe9r60qnBZ/ArqVK0olbWRcYcWK/Fv+CgY5fhkau/Xj2k+ZesV7KQmXBO0smo
         qnbzGeHx75q/9DVSxSMW31kqR8LA83XSdmqig1FC4E3q/8QfnHLyeDtmixlXfnK+hp/8
         FCe1Xo/m/y7IBrSoIzhDowYbEzPTNKRytbcYPjmQbxElfcre4nuh3lzuJvNcoQBEIzVi
         vXaA==
X-Forwarded-Encrypted: i=1; AJvYcCX5es6Stg3ZMdEyb3DkdP/7ipLotrmliVmOUGDgf2S4Na2+hRF/QNJmO2T073EfRwhfH7fVl8cj/xETs9h9mfSUFGAXHe0wBULPWe+ROZgurmXSjb0z6FoS
X-Gm-Message-State: AOJu0YxQITLUtX0iCgWCfr6YLx1ATgNFn9EKmnVeXlGsxDtnniY3Yxjz
	ehN/Y+avNsa5C0fqeAa9ne5rWB4JhzcPepzLDXfkCxwKqGs7uPR8w4zLW83Ka/Y=
X-Google-Smtp-Source: AGHT+IGS43zMoUhiLWGxjvXzbeM6NwW+0du64YcIUAVICfm05OkA6cDnKDP0qv/3rMcJTitcjEy9dw==
X-Received: by 2002:a5d:55d0:0:b0:33e:1f6f:6faa with SMTP id i16-20020a5d55d0000000b0033e1f6f6faamr858971wrw.28.1710414031292;
        Thu, 14 Mar 2024 04:00:31 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:aea1:3182:3ce3:f323? ([2001:8b0:aba:5f3c:aea1:3182:3ce3:f323])
        by smtp.gmail.com with ESMTPSA id co17-20020a0560000a1100b0033e1be7f3d8sm549182wrb.70.2024.03.14.04.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 04:00:30 -0700 (PDT)
Message-ID: <6bc904eee800c940fb0390bb917846bba58baf39.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/7] Replace sshd_config patching by snippets
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: enrico.scholz@sigma-chemnitz.de, openembedded-core@lists.openembedded.org
Date: Thu, 14 Mar 2024 11:00:29 +0000
In-Reply-To: <cover.1710177387.git.enrico.scholz@sigma-chemnitz.de>
References: <cover.1710177387.git.enrico.scholz@sigma-chemnitz.de>
Autocrypt: addr=richard.purdie@linuxfoundation.org; prefer-encrypt=mutual; keydata=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
 YNvg==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Mar 2024 11:00:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197103

On Mon, 2024-03-11 at 10:19 -0700, Enrico Scholz via lists.openembedded.org=
 wrote:
> To deal with system setups, sshd was configured in the following way:
>=20
> =C2=A0- sshd_config is shipped completely by OE and DISTRO_FEATURES (pam,
> =C2=A0=C2=A0 x11) are patched in during do_install
>=20
> =C2=A0=C2=A0 --> this is difficulty to maintain; e.g. sshd_config must be
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 synchronized between OpenSSH release=
s and OE adaptations
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 manually inserted
>=20
> =C2=A0- two different configuration files (sshd_config + sshd_config_read=
only)
> =C2=A0=C2=A0 are created; IMAGE_FEATURES decides which one is used and it=
 is patched
> =C2=A0=C2=A0 in a ROOTFS_COMMAND in the system
>=20
> =C2=A0=C2=A0 --> this make it difficult for third party recipes to incorp=
orate
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 their changes (they have to go over =
both files)
>=20
> =C2=A0=C2=A0 --> the readonly HostKey locations and algorithms are hardco=
ded
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 which makes it difficult to place th=
em e.g. on a persistent
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /opt partition and disable e.g. ecds=
a
>=20
> =C2=A0- depending on IMAGE_FEATURES (empty passwords, root login), both
> =C2=A0=C2=A0 files are patched by a ROOTFS_POSTCOMMAND
>=20
> =C2=A0=C2=A0 --> these changes are lost when pkgmgmt is used for the imag=
e and
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 openssh being updated
>=20
>=20
> The patchset:
>=20
> =C2=A0- reduces changes to sshd_config to
>=20
> =C2=A0=C2=A0 | Include /etc/ssh/sshd_config.d/*.conf
>=20
> =C2=A0=C2=A0 --> This is already the done in current recipe and most main=
line
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Linux distributions are doing it
>=20
> =C2=A0- moves configuration in new openssh-config recipe which is a weak
> =C2=A0=C2=A0 dependency of openssh (and can be replaced by another IMAGE_=
INSTALL)
>=20
> =C2=A0=C2=A0 Recipe ships configuration as small snippets which might con=
tain
> =C2=A0=C2=A0 dynamically created content (e.g. 'UsePAM yes')
>=20
> =C2=A0- IMAGE_FEATURE based setup is done by creating subpackages with
> =C2=A0=C2=A0 the corresponding options.=C2=A0 These subpackages are added=
 to
> =C2=A0=C2=A0 FEATURE_PACKAGES_ssh-server-openssh
>=20
> =C2=A0- readonly rootfs setup has been enhanced by
>=20
> =C2=A0=C2=A0 | RO_KEYDIR ??=3D "/var/run/ssh"
> =C2=A0=C2=A0 | KEY_ALGORITHMS ??=3D "rsa ecdsa ed25519"
>=20
> =C2=A0=C2=A0 parameters which can be overridden.


Thanks for sending this. I suspect something like this might be
desirable however unfortunately the timing is a little tricky as we're
just past the feature freeze point for 5.0.

I know people often want to push for the inclusion of things into
something like the LTS so I did put this through the automated testing,
just to get an idea of the potential issues.

The first run had lots of these warnings:

https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/8649/step=
s/14/logs/warnings

so I squashed a fix in for that. The second run had this:

https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6390/step=
s/12/logs/stdio

which suggests ssh connections into our image testing doesn't work. It
is unclear why that is failing there but there were indications in the
previous build that other ssh connections were working ok. It could be
dropbear vs openssh at a guess. That build is still ongoing too so
there may be other issues.

Anyway I just wanted to highlight the testing results and to say that
this is something we should think about but it will have to wait until
after 5.0 releases.

I haven't reviewed the patches in much detail, I mainly wanted to get
the automated testing results shared.

Cheers,

Richard

