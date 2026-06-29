Return-Path: <andreas.muetzel@emlix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 271F2C44500
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 08:04:42 +0000 (UTC)
Received: from mx1.emlix.com (mx1.emlix.com [178.63.209.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32873.1782720272821829868
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 01:04:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@emlix.com header.s=20250930 header.b=E5R5hvvx;
 dkim=pass header.i=@emlix.com header.s=20250930 header.b=E5R5hvvx;
 spf=pass (domain: emlix.com, ip: 178.63.209.131, mailfrom: andreas.muetzel@emlix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emlix.com;
	s=20250930; t=1782720270;
	bh=vUzjCu9FF48vv9QP8/Tf/lIglZ4flqSFamKdzyXAjKc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E5R5hvvxiRQ7J/1y2y1uUhA/qRX9eGgA6/LBlKUuezE+alzxoGW1stY18VvJWTgc4
	 3vvMaWyp0TKtDtOkPc91r1xC8tkgm8ICjt/sv78euXcQ/o7PQuuiNDoBs775zsup0l
	 9Idxq687QaY3KT3/zsWQB0mW+A9dWls6yVcE2HF+kQgBtsERusTcQUc5KzQVFZ0IiZ
	 Izfh4FftmMFGDvPAr2acjT2QpeKwSbWUtzCNc2gsqhbrXoF7JombTyixMEs9ojsz9z
	 pgiOw4WZZkX7vHaAWicjGnokYW/uiSSKUVb3jOZVEe8LcQ7/dCPboS+ybGa0n1BIv6
	 DwB/5igZpm5rA==
Received: from mx1.emlix.com (localhost [127.0.0.1])
	by mx1.emlix.com (Postfix) with ESMTP id 648F85F9AC;
	Mon, 29 Jun 2026 10:04:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emlix.com;
	s=20250930; t=1782720270;
	bh=vUzjCu9FF48vv9QP8/Tf/lIglZ4flqSFamKdzyXAjKc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E5R5hvvxiRQ7J/1y2y1uUhA/qRX9eGgA6/LBlKUuezE+alzxoGW1stY18VvJWTgc4
	 3vvMaWyp0TKtDtOkPc91r1xC8tkgm8ICjt/sv78euXcQ/o7PQuuiNDoBs775zsup0l
	 9Idxq687QaY3KT3/zsWQB0mW+A9dWls6yVcE2HF+kQgBtsERusTcQUc5KzQVFZ0IiZ
	 Izfh4FftmMFGDvPAr2acjT2QpeKwSbWUtzCNc2gsqhbrXoF7JombTyixMEs9ojsz9z
	 pgiOw4WZZkX7vHaAWicjGnokYW/uiSSKUVb3jOZVEe8LcQ7/dCPboS+ybGa0n1BIv6
	 DwB/5igZpm5rA==
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id 42C755F904;
	Mon, 29 Jun 2026 10:04:30 +0200 (CEST)
From: Andreas =?UTF-8?B?TcO8dHplbA==?= <andreas.muetzel@emlix.com>
To: Ross Burton <Ross.Burton@arm.com>
Cc: 
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/3] overlayfs: re-introduce helper unit
Date: Mon, 29 Jun 2026 10:04:29 +0200
Message-ID: <6-XLRYS_SBS0soQ94uQY2g@emlix.com>
In-Reply-To: <AB6072BD-1529-4080-B9E4-1FBA3774748E@arm.com>
References: 
 <20260616144043.3303124-1-andreas.muetzel@emlix.com>
 <AB6072BD-1529-4080-B9E4-1FBA3774748E@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 08:04:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239732

On Friday, 26 June 2026 16:48:46 CEST Ross Burton wrote:
> On 16 Jun 2026, at 15:40, Andreas M=C3=BCtzel via lists.openembedded.org =
<andreas.muetzel=3Demlix.com@lists.openembedded.org> wrote:
> >=20
> > systemd v256+ automatically creates the upperdir and workdir when
> > starting an overlayfs mount unit. The directories created this way are
> > owned by root:root; this behaviour differs from the previously used
> > helper unit, which explicitly applied the ownership of the lowerdir to
> > the upperdir.
>=20
> I=E2=80=99d prefer not to have to carry unit files that mostly duplicates=
 code that systemd has integrated.  Have you spoken to systemd upstream abo=
ut changing the behaviour there, or adding some options?

No, I haven't, sorry. In short: I suspected the original change to be a reg=
ression in oe-core, so my idea was to fix it here.

The long story:
When upgrading a BSP to wrynose, I noticed that services now failed to star=
t because they relied on the previous behaviour (upperdir inherits owner of=
 lowerdir).
See my original mail from Jun 11, "overlayfs.bbclass: upperdir ownership ch=
ange in wrynose"; Yoann's answer seemed to confirm my suspicion. So my idea=
 was to
restore the previous behaviour, but only for the cases where it is explicit=
ly needed.

In general, there are already some alternative approaches to configure the =
upperdir. Systemd already offers (at least):
 - DirectoryMode=3D<mode> in the mount unit can be used to control the mode=
 at directory creation time
 - StateDirectory=3D<path> in the unit of the service that uses the overlay=
: makes the directory owned by the service user when the service is started=
, optionally with a mode as given by StateDirectoryMode=3D
 - tmpfiles.d: can be used, but  states in the manpage that a StateDirector=
y=3D in the service unit is best used for service-local data

All those options have in common that the ownership and permissions are def=
ined by the unit/config, not by the actual properties of the lowerdir. (Whi=
ch may be
desired or not.)
DirectoryMode is closest to the previous behaviour for cases where these pr=
operties are static, but there is no corresponding DirectoryUser/DirectoryG=
roup property.
StateDirectory (and similar properties) get complicated for directories sha=
red between multiple services.
And the tmpfiles.d solution relies on the tmpfiles service instead of being=
 tied to the overlayfs unit itself.

I am not sure if inheriting the lowerdir permissions is always better or wo=
rse than using one of the systemd-provided options. In the BSP in question,
the systemd-provided options would actually work fine for most applications.
But is there already a "best-practice" way of configuring the overlayfs per=
missions?

BTW:  I tried to open an account on the bug tracker to discuss this, but ha=
ven't received any reaction to my request. So I implemented a minimal solut=
ion to start this conversation here.
I hope this is fine :-)

Andreas



