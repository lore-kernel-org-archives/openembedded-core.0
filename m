Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46808C48BC3
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 13:59:52 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.41553.1707919188688104986
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Feb 2024 05:59:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l0FtrA1l;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-51167e470f7so6759114e87.2
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 05:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707919187; x=1708523987; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=M+zCbnCxmVlvnJqKq0Lml4WiRHNlgwcDPmP4hcVne4I=;
        b=l0FtrA1lcJKcZddvqC1Vu0q8xJ5+MJWsjjzaGwQLVsq0KYSgxcd8yBaWy+/klrxvQ8
         UELx+vmOZlEhLs6+KQc8Yww/UV0t02VaeyV9V/1sS1PS8fhCzL9n9cf43zsXi2PpR7UL
         2UYl0scEJ60WYlecbvrPMH1XsPjfP3n+DDmr9gca7qwEwDWySq2EOdCHPL217lxPxwHP
         8P9DE7qo8cttGjG5hwcYntJnIPw7K18x2puTmYm5JyFiu+2LfOzv8RUMCEGW4gBgvXpn
         5jvDsz6C1iYAqNYmtE10WiIRPciYMherrawot9FUGP3SaZC3aTDstmhLCTnedJuW75Ds
         P6Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707919187; x=1708523987;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M+zCbnCxmVlvnJqKq0Lml4WiRHNlgwcDPmP4hcVne4I=;
        b=k+ywSdlzn2dy9ftV29MlpZACVFsTZxYa5Q4SWtbSoiu38EJ8z9TMfz9OWrX1CwDfT8
         3+t47ePGoo61VZYNi+LMhcdvA36ar7Eb2kxWAwDiAQLsuYwdpy+WrN8YyVfs+cCPHNXb
         70YY9ZzMt58PLtxr6yKssIYy8wHQ+YzE4kJTHs2YDFY8GDju7beSzvk6czSvQ+9Ar2IW
         FSYOvAoyR83ajMU10ENep+Kkp9lQPkyS4WbiWCkwKV7B2AmY2QD/H9yq6tqllAVhUFGE
         R8hfRafmxcJ4qWTx1wy9v7vz0rU6Lg+fH6ZEvCrAaoVqZMJ1aQ18K27TjhftRsuNSE2V
         uSEQ==
X-Gm-Message-State: AOJu0Yyfv1WiVkhL2gG2mZ0G8OWwHyOPH8EWggww6M4cKjjmhfSVDGpS
	ryNkjh8ic9+2TSXShLx8WZKQsbgAeOOidSSQIt+lcSlH9PUxmXDB
X-Google-Smtp-Source: AGHT+IGx0mFHiXyjMh4rTHFwbatr3N7Y2Qf7zp2hElU1Jv0EHORpGqNFKujwc6iA5s3L7xFr1OMSug==
X-Received: by 2002:a05:6512:3d29:b0:511:ae96:be88 with SMTP id d41-20020a0565123d2900b00511ae96be88mr271244lfv.65.1707919186683;
        Wed, 14 Feb 2024 05:59:46 -0800 (PST)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id t9-20020a7bc3c9000000b004107dfa6aebsm1992024wmj.28.2024.02.14.05.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 05:59:46 -0800 (PST)
Message-ID: <2ec56f88fc1b7afd00d1dabcf818b56d92f9cffb.camel@gmail.com>
Subject: Re: [OE-core] VS Code plugin and multiple build directories
From: adrian.freihofer@gmail.com
To: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, Ross Burton
 <Ross.Burton@arm.com>,  Mohammed Raza <mohammed.raza@savoirfairelinux.com>,
 peter.kjellerstedt@axis.com, Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 14 Feb 2024 14:59:45 +0100
In-Reply-To: <4582012f-7518-462b-bee4-5777f28cb28d@savoirfairelinux.com>
References: 
	<DB5PR02MB10213FA30B1A62CEA61B98E02EF4F2@DB5PR02MB10213.eurprd02.prod.outlook.com>
	 <3a0bb821-e692-4256-ab7b-95716f2e5896@savoirfairelinux.com>
	 <3c844a195548fa8d0352bfc469996f3077eb5a0a.camel@gmail.com>
	 <33e57963-8887-4c95-ad8f-654afcea5e74@savoirfairelinux.com>
	 <14a1b53384f2901878d7b4ed225edf8254af07f9.camel@gmail.com>
	 <CANNYZj9UxD9-Owt6H1OouZXu4WYWOoUnh77g10Cihj5nLjoAPw@mail.gmail.com>
	 <4582012f-7518-462b-bee4-5777f28cb28d@savoirfairelinux.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.module_f38+17164+63eeee4a) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 13:59:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195477

On Wed, 2024-02-14 at 11:56 +0100, Enguerrand de Ribaucourt wrote:
> Thank you both for your feedback and clarifying the role of
> multiconfig!
>=20
> I'll go with build/env settings dictionaries then. I think it's not
> much=20
> more complex, but a lot more versatile to also allow editing the=20
> environment under which bitbake is called. It will allow users to
> host=20
> several init-env scripts, or kas configurations, ...
>=20
> ```json
> =C2=A0=C2=A0=C2=A0=C2=A0 "bitbake.workingDirectory": "${workspaceFolder}"=
,
> =C2=A0=C2=A0=C2=A0=C2=A0 "bitbake.pathToBitbakeFolder":
> "${workspaceFolder}/poky/bitbake",
> =C2=A0=C2=A0=C2=A0=C2=A0 "bitbake.environments": [
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
"name": "product1",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
"pathToBuildFolder":
> "${workspaceFolder}/build_product1",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
"sshTarget": "root@192.168.7.2",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
"name": "product2",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
"pathToBuildFolder":
> "${workspaceFolder}/build_product2",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
"bitbake.shellEnv": {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 "BB_ENV_PASSTHROUGH": "MACHINE",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 "MACHINE": "product2"
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
},
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
"sshTarget": "root@192.168.7.3",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0=C2=A0=C2=A0=C2=A0 ]
> ```
>=20
LGTM.

What will be the default for bitbake.pathToEnvScript?
The old VSCode plugin was defaulting to:
"${workspaceFolder}/oe-init-build-env"
which still makes a lot of sense to me.
 * This works out of the box for the minimal setup with only poky.
 * This also allows to override the oe-init-build-env script with a
   custom one in a different top level directory.
 * It also allows to keep the standard setup procedure as described by
   the Yocto quick setup guide.

And I agree with Peter, that the default value of the new plugin looks
really odd: "${workspaceFolder}/sources/poky/oe-init-build-env"

Based on this configuration also multiconfig builds should be possible.
The plugin can get the BBMULTICONFIG variable from bitbake and generate
UI sub entries per multiconfig on the fly.

Thank you and regards,
Adrian


> The configuration will be selectable in the bottom right status bar.
> It=20
> will use the specific configurations if specified, otherwise, the=20
> workspace configuration. This schema follows c_cpp_properties.json
> which=20
> is a widely used example on VSCode.
>=20
> Let me know if you have more remarks,
>=20
> Enguerrand de Ribaucourt
>=20


