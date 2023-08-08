Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 321D3C04A6A
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 17:02:31 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.67310.1691514149870777564
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Aug 2023 10:02:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NSrLePhh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-3fe5eb84d8bso16852835e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 10:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1691514148; x=1692118948;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=slU3iK0/794nLAYI7s3fOsORPvKcLOM6XnlmL70pwvc=;
        b=NSrLePhhN0Uw862k0yA1mMJpWQKLlg9Dtrj3dAVl8BqvY5QwQHjigCXdmsZvuGC86f
         o/zYSJ+zGvkV7QB4jLZqfsCKWUQZf4IqvXhjAd6tzhkpQFk8H0591s0E4ZfeKsjECjF5
         jc0cqDEhMLTREgI2ZuSkPMfQ036BgK9muel9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691514148; x=1692118948;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=slU3iK0/794nLAYI7s3fOsORPvKcLOM6XnlmL70pwvc=;
        b=fQk1sKJYq2sWFWT+SYXmPfOG+hpiUs3r/lIE2dnCSO00qnAvFFPi9ysbKwTAveVmdx
         VWvLI2+Q/rRANtNe+Z8YsI7Eh8+LQ38zCH80zP1dNNM6GmD4tCT3VI97tIZVRQ+KMXcb
         d2uqWtZrwXNo93QiZXjNXA3U/9SjSRxf09cY7+DNLN2vZFClQiAjc24dQ8ndZCBZx4rl
         ma50R4mMyiIsuDLwFeeNFHPOUObI56ZHS1P8QzaSIuzS9PswFD37CdbIaT2jBkRU1dRZ
         Ktk5xeVBx2OovRb0JiTFZq1B7eKDEIF+pHAyesM6EKyWI0evQ+WmrHiGyGgGSQAfFx74
         E4VQ==
X-Gm-Message-State: AOJu0YyVQf2QtSNN+DfQQa63xDXq6GdtPJzNpn1oBhqW+UZZ5yR6NoQQ
	BRk71yWcnN+yeUgZ4ZPwUh9EOg==
X-Google-Smtp-Source: AGHT+IE8fdBlizujSDaBZAQpUx3/kJ5LzPf5AkmVyEnQ1QSE/i+YOLeW3fvEtSDduCQxNpzo/8yiew==
X-Received: by 2002:a7b:c859:0:b0:3fe:25b3:951d with SMTP id c25-20020a7bc859000000b003fe25b3951dmr322002wml.5.1691514148046;
        Tue, 08 Aug 2023 10:02:28 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1229:bf53:df4f:c7be? ([2001:8b0:aba:5f3c:1229:bf53:df4f:c7be])
        by smtp.gmail.com with ESMTPSA id 9-20020a05600c228900b003fe13c3ece7sm18866731wmf.10.2023.08.08.10.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 10:02:27 -0700 (PDT)
Message-ID: <ad8b2ea6ec1568cac0b66b5739f7880c8d632adc.camel@linuxfoundation.org>
Subject: Re: [OE-core] systemd issue with network commandline config and 6.4
 kernel
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Qi.Chen@windriver.com
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, Luca
 Boccassi <bluca@debian.org>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>
Date: Tue, 08 Aug 2023 18:02:26 +0100
In-Reply-To: <CADkTA4OkyF7WvGTQW5zdz7o9b+pxWhmY_Z+YjkP7Ec1jShK6QA@mail.gmail.com>
References: 
	<000572c1ba81252efa552b812b0dc0838772c2f1.camel@linuxfoundation.org>
	 <CO6PR11MB56028B6144B7556C8610CED3ED0DA@CO6PR11MB5602.namprd11.prod.outlook.com>
	 <CADkTA4OkyF7WvGTQW5zdz7o9b+pxWhmY_Z+YjkP7Ec1jShK6QA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 17:02:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185674

On Tue, 2023-08-08 at 12:13 -0400, Bruce Ashfield wrote:
> On Tue, Aug 8, 2023 at 11:35=E2=80=AFAM Chen Qi via lists.openembedded.or=
g
> <Qi.Chen=3Dwindriver.com@lists.openembedded.org> wrote:
> >=20
> > I found some clue, but not the root cause yet.
> > The eth0 is renamed to enp0s2 by 80-net-setup-link.rules udev rule in s=
ystemd. And the connman.conf only blacklists eth0.
> >=20
> > The related log is:
> > Aug 08 15:18:16 qemux86-64 kernel[213]: [    1.727332] virtio_net virti=
o0 enp0s2: renamed from eth0 (while UP)
> >=20
> > The systemd udev configuration file is:
> > root@qemux86-64:~# cat /lib/udev/rules.d/80-net-setup-link.rules
> > # do not edit this file, it will be overwritten on update
> > SUBSYSTEM!=3D"net", GOTO=3D"net_setup_link_end"
> > IMPORT{builtin}=3D"path_id"
> > ACTION=3D=3D"remove", GOTO=3D"net_setup_link_end"
> > IMPORT{builtin}=3D"net_setup_link"
> > NAME=3D=3D"", ENV{ID_NET_NAME}!=3D"", NAME=3D"$env{ID_NET_NAME}"
> > LABEL=3D"net_setup_link_end"
> >=20
> > And the connman configuration file is:
> > root@qemux86-64:~# cat /etc/connman/main.conf
> > [General]
> > NetworkInterfaceBlacklist =3D eth0
> >=20
> > In contrary, with 6.1 kernel, the renaming failed with the following me=
ssage:
> > Aug 08 15:29:58 qemux86-64 (udev-worker)[206]: enp0s2: Network interfac=
e 'eth0' is already up, cannot rename to 'enp0s2'.
> >=20
> > Maybe some changes in new kernel allows renaming network interface whil=
e it's up?
>=20
> This brings back a memory of something I ran into on a build server
> when upgrading to a "newer" 6.2 kernel,
>=20
> I had to disable interface renaming in order to get a consistent
> network configuration, and did that via "net.ifnames=3D0" on the kernel
> command line.

Thanks, Qi and Bruce, this all starts to make more sense now.

I've sent a patch adding "net.ifnames=3D0" to the two places we need it
to fix runqemu usage which fixed the issue in my local testing.

Cheers,

Richard



