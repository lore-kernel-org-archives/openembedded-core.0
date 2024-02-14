Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85894C48BC1
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 14:43:32 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.43028.1707921807035419538
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Feb 2024 06:43:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HArdW3sn;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-51183b02564so2768470e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 06:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707921805; x=1708526605; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uqJvhIs54iho9BxLjieDMCWhjjpZKwwnofNywR4FEWU=;
        b=HArdW3sngJwQntavWaSpSEr9RsousuY9wL+QfSXQRDGZ6v2XN4jek2Q+tUWMChYUBb
         Z7WFe8QsaKqOfsUkT4iuDXxtKh0xJ5PW0oAergEV7PoB+uSXxFJvR3y+tTaZm28s2HB3
         nQlv4WB+X+stNoSebYIgqzaWgQ0/TyVSpNcPzPRdFfE/kDl8axC88R4k78jqn5n2vI30
         WmfPEtYc972hD/i4ewoQaht4mUkXv/cxBKNurnSKXMroDJ9AnAOHRY6qPQnVEBPBdHQv
         +jTChnRP9+TGOFUSXLeYj0vyrPoOmHuNJXsDtg/b8cqYKDDzrHqhUQyun02O2F73gBk1
         1ZMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707921805; x=1708526605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uqJvhIs54iho9BxLjieDMCWhjjpZKwwnofNywR4FEWU=;
        b=XxxfgWu6Txotcl6tWGddos8bBgKtppMcwSrteysGc61htJOFO4ID7KM1vroE8j5vj1
         lR4N7IH1deJeAsmFmnGjkCE3ngptCJgXA3pYL1IMYsfR8VRJF6yRr2mAjWx87bEu0bBG
         D+AGrkksJsT+gqUk7FcjzQU12MTp4lZV7Aqq8MSOMJAMij7QzQzJ7PBQpxCOJIIjB3uz
         QnHSu8tcHljB0CLoHJrxrl58r3l/b1zXZueURB4lXNRWR7hc0KZH4YayhvUF1XcXRFQ1
         4e+WgLau551oJRlGWp0ze2T0DEQ8Jx1AQ7amFzdzNHx7QzPdgay091rQKiYUlaFG34wh
         9Grg==
X-Forwarded-Encrypted: i=1; AJvYcCWcpVOLbWvA2vNK4PtCypKWyLUhSCzDgm2VWH82S38k31fc9+MOV6JpEUjK4Bw0FJj4TaBrbO/XBl40Qk6VhiJXRUKpUl8pYhkHVsAKdRnrQnI/gqq1HLcy
X-Gm-Message-State: AOJu0Yyy3YlhVxI0ZUa7kh46UpmwaRql9EcAmcDCr57wmJIqq6ViUzK4
	BOGIQOM9AhC7azgpnG7ITWwktFveTX/gkDTxB32RyUqBeOrBicG17Og0mphxQzIV3JvtLMR2fYk
	+lN3vbeBpQAXov2pU+U3+g6n9V2Q=
X-Google-Smtp-Source: AGHT+IEV/U+1H6qgpc4eTx/MmwQQX2D9telbHDmt9iCA3OPprRlU3desXLx/nZpR+c/ZhvRcklV0IoLRqU4vWHMiNyM=
X-Received: by 2002:ac2:483c:0:b0:511:8b33:6c72 with SMTP id
 28-20020ac2483c000000b005118b336c72mr1963776lft.47.1707921805000; Wed, 14 Feb
 2024 06:43:25 -0800 (PST)
MIME-Version: 1.0
References: <DB5PR02MB10213FA30B1A62CEA61B98E02EF4F2@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <3a0bb821-e692-4256-ab7b-95716f2e5896@savoirfairelinux.com>
 <3c844a195548fa8d0352bfc469996f3077eb5a0a.camel@gmail.com>
 <33e57963-8887-4c95-ad8f-654afcea5e74@savoirfairelinux.com>
 <14a1b53384f2901878d7b4ed225edf8254af07f9.camel@gmail.com>
 <CANNYZj9UxD9-Owt6H1OouZXu4WYWOoUnh77g10Cihj5nLjoAPw@mail.gmail.com>
 <4582012f-7518-462b-bee4-5777f28cb28d@savoirfairelinux.com> <2ec56f88fc1b7afd00d1dabcf818b56d92f9cffb.camel@gmail.com>
In-Reply-To: <2ec56f88fc1b7afd00d1dabcf818b56d92f9cffb.camel@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 14 Feb 2024 15:43:13 +0100
Message-ID: <CANNYZj_wbPa9UEKPXmhcg_QZ2tfvYDOcf-jT_+L=EC5eZqHxpg@mail.gmail.com>
Subject: Re: [OE-core] VS Code plugin and multiple build directories
To: adrian.freihofer@gmail.com
Cc: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Ross Burton <Ross.Burton@arm.com>, Mohammed Raza <mohammed.raza@savoirfairelinux.com>, 
	peter.kjellerstedt@axis.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 14:43:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195480

On Wed, 14 Feb 2024 at 14:59, <adrian.freihofer@gmail.com> wrote:
> What will be the default for bitbake.pathToEnvScript?
> The old VSCode plugin was defaulting to:
> "${workspaceFolder}/oe-init-build-env"
> which still makes a lot of sense to me.
>  * This works out of the box for the minimal setup with only poky.
>  * This also allows to override the oe-init-build-env script with a
>    custom one in a different top level directory.
>  * It also allows to keep the standard setup procedure as described by
>    the Yocto quick setup guide.

I'd suggest setting the directory where the script is, something like
bitbake.pathToOeRoot, which would point to either poky/ or
openembedded-core/. The script would be just under that.

While we're at it, I still strongly disagree with the idea that
oe-init-build-env needs any kind of overriding with a custom one from
non-standard locations. Just use the standard one please. We're trying
to move away from setting up builds with custom shell scripts.

Alex

