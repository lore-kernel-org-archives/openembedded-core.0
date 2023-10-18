Return-Path: <sean@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EDEBCDB47E
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 13:55:57 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web11.281807.1697637352557665988
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Oct 2023 06:55:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=i1I+49KE;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=To:References:Message-Id:Content-Transfer-Encoding:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Content-Type:Sender:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=HeF0W1ggPUYvnGeKUDo1T6JxV0+syUmKQgIDmygHUIA=;
	b=i1I+49KEKh4VYXFiCgHr5H9AcC8NrTVbyO8D5cNODWub0kmLbFszeBLtuXsuln1mhpx45JSqzyL
	KIj5zJdwXdt2xsK9lWCoGp1hqWVHFq8rN5u3NoK4MRT25euONfNbjTa0PklK1YZPGXXImOybx6LeA
	Holvde9lNbPIi6GxDsqFWdDSJYpndACbm9maLLhDb+kZLrpPPv6o3eliQGg18m+BDcysPOMIHrg+B
	PcbkW8hYGJ9ruVNL0iUHn2nFwBdMt7gapZkUTkk+fxi0PVWQlqvGtW+cPKmg9Dgr8wXzm4Sg3grJ+
	giQ5f62VynPL0K4JuAoXMcAWXdIcUhvPqyjw==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <sean@geanix.com>)
	id 1qt71Z-000FLs-Nm; Wed, 18 Oct 2023 15:55:49 +0200
Received: from [2a06:4004:10df:0:d45c:2788:9ba7:bf05] (helo=smtpclient.apple)
	by sslproxy05.your-server.de with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
	(Exim 4.92)
	(envelope-from <sean@geanix.com>)
	id 1qt71Z-000GJz-FU; Wed, 18 Oct 2023 15:55:49 +0200
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.100.2.1.4\))
Subject: Re: weston-init: how to debug with systemd
From: Sean Nyekjaer <sean@geanix.com>
In-Reply-To: <CAMKF1sog+WKmSSu-vXcVnrkqYmu-Myt44uRTiyXahDsjXf07zA@mail.gmail.com>
Date: Wed, 18 Oct 2023 15:55:38 +0200
Cc: denis@denix.org,
 alex.kanavin@gmail.com,
 openembedded-core@lists.openembedded.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <FE4FB725-C27B-49BA-B067-3248B0804632@geanix.com>
References: <A3F3DAF2-8744-47F1-A9B3-EF93448DD30E@geanix.com>
 <CAMKF1sog+WKmSSu-vXcVnrkqYmu-Myt44uRTiyXahDsjXf07zA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Mailer: Apple Mail (2.3774.100.2.1.4)
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27065/Wed Oct 18 09:49:14 2023)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 13:55:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189392



> On 17 Oct 2023, at 20.29, Khem Raj <raj.khem@gmail.com> wrote:
>=20
> I have systemd based system and I can see it in journal e.g. see
>=20
> https://snips.sh/f/jleAzcqMVd

Fortunately it=E2=80=99s very easy to reproduce the no log scenario. :)

Build a default core-image-minimal with the following added to =
local.conf:
INIT_MANAGER =3D "systemd"
DISTRO_FEATURES +=3D "pam wayland opengl"
CORE_IMAGE_EXTRA_INSTALL +=3D "wayland weston"

Run the image with qemu:
root@qemux86-64:~# journalctl -fu weston
Oct 18 13:43:21 qemux86-64 systemd[1]: Starting Weston, a Wayland =
compositor, as a system service...
Oct 18 13:43:21 qemux86-64 systemd[1]: weston.service: Main process =
exited, code=3Dexited, status=3D1/FAILURE
Oct 18 13:43:21 qemux86-64 systemd[1]: weston.service: Failed with =
result 'exit-code'.
Oct 18 13:43:21 qemux86-64 systemd[1]: Failed to start Weston, a Wayland =
compositor, as a system service.

/Sean

>=20
> On Tue, Oct 17, 2023 at 6:05=E2=80=AFAM Sean Nyekjaer =
<sean@geanix.com> wrote:
>>=20
>> Hi,
>>=20
>> To my understanding the weston.service doesn=E2=80=99t log to =
journal. If I'm is running the weston binary there is fine output on =
stdout.
>>=20
>> Looks like TTYPath is eating the logs, but I could be wrong.
>>=20
>> Adding:
>> ExecStart=3D/usr/bin/weston --modules=3Dsystemd-notify.so =
--log=3D/tmp/weston.log
>>=20
>> Will of course give logs in that file
>>=20
>> /Sean



