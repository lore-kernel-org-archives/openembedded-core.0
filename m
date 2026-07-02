Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB7C5C43327
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 13:34:53 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69787.1782999289150714132
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2026 06:34:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eLOXI8wY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493c00f74baso10311975e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 06:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1782999287; x=1783604087; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RWMHbGesOP5+G5i/mqmjugcpNVAC8zEthCe/KYUsIBQ=;
        b=eLOXI8wYT9Lj0sc+QEy+5wjmd8Qr9TxNFsj+LZckNeepyevbADm/us8I0tMp4Qe2uX
         qg+U44nZ+vv5l4iA2nsgG2zSH4208CtCncKyNN9YGz4t4pezls1rGMEMJGB/5DGEMnI2
         zA5goBvfo05iPMO2Z1ysVVKF2iriaVun9Vv3A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782999287; x=1783604087;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RWMHbGesOP5+G5i/mqmjugcpNVAC8zEthCe/KYUsIBQ=;
        b=O/Z3SllbC505IhwMqjsgKXoL7VW836J3P2MNDdmDq/cPhb2/oE/rHuNApH3AEGunZX
         A/Ui3mXX+paXnCihRcG8U4h/m60g5+Nhson95ihiCePhSUV9GiuPIt/zLpijhAv7374w
         0Nu3ayIgE4iMvnGeLm0A8UAUFylO/biuLstNaRi/GFZHfl8b6bEYBLg5nkj3NjFBcIml
         jbGzxO+FBGqFnGNGY7+njOQ2aMVIbY8zNb1U4z5CFdf+jyDpjEFysijZKHwkfS8XdJyh
         WFWFEVVgWIXdE2nun9L67DQhDZva00yj/YOhJ7zzm4W79b/FGr7lAKH6TEo9QHYMsVsj
         DLaQ==
X-Forwarded-Encrypted: i=1; AFNElJ+f6FC8lj014MrSpYeLZbytdvD2G8kn/JLHwMoJ0LC5PoyRvr2OAKR6clGwQ9wnMFVHRfONxLD6z5FrO7BzvtoMzw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwhSWP0lEVwQJhGCIxFmYOzPPx9c8nayeVsUrHE0FlVjH4/wMvI
	prfH557KbakkslNltIWbQQWXyurOJggScBUqAvfwpofEQwY/2Mgn8/iG8SBdVc7ytcg=
X-Gm-Gg: AfdE7ck8quMg/GKCNKXCcTpkLCNanBU+8vMuExxX2wwmGnQTQ/6Mo0CEBpXiiZ7w1et
	e12wRs/fLLa+YIk9JZ+3O5Vg1DRQm/Zm9L5UmsVhbVSD7mDBsCwC7ELfCJo+oB3lIyUPN00ecIH
	mVS7QtlvLQKDQfwmdrrk3D0EtWHXC0d6NZDeKYhteGCXKeJsvUg5z6U2LMP+E9h/XV/jbMchpYR
	e0VwDcitdXJ/5/EJHml153iti/6wcaanj8z+dg9RKq6UmIzrRJSJukJYxjXv7UtNQSslNDb1MOA
	s7cB8vYFofsFRuWhrESUMht+/4h4KHl1pu0zsZ/QGkpEL3ptwNaBJ4l38RJhzGZbXgIPnYYop5B
	GnhAxA/zkSeVG3GsiZw5Ur0bdSbnbDWajiT2DEmsX+W6QAnEO6EzzrLwcX0akUCFeHhNjnI593y
	Y4nCuLCN8P1BO/admf4FvOBM7PEXhE/hlZTlu3YZFDoM3mHr57WjtagQIG6D9R96PRVY7RzXQQR
	tE=
X-Received: by 2002:a05:600c:1554:b0:493:a435:d870 with SMTP id 5b1f17b1804b1-493c2b902bdmr89628505e9.27.1782999284844;
        Thu, 02 Jul 2026 06:34:44 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:144:7f9c:c394:defe? ([2001:8b0:aba:5f3c:144:7f9c:c394:defe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db3dba0esm8687828f8f.7.2026.07.02.06.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 06:34:44 -0700 (PDT)
Message-ID: <abbb21f83c63fecd56c11da7ba4442094e96ccda.camel@linuxfoundation.org>
Subject: Re: [PATCH v3 0/3] systemd: update to 261 and be compatible with
 rhel8
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Daniel Turull <daniel.turull@ericsson.com>, "alex.kanavin@gmail.com"
	 <alex.kanavin@gmail.com>, "mathieu.dubois-briand@bootlin.com"
	 <mathieu.dubois-briand@bootlin.com>
Cc: "qi.chen@windriver.com" <qi.chen@windriver.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, "Ross.Burton@arm.com"
	 <Ross.Burton@arm.com>
Date: Thu, 02 Jul 2026 14:34:43 +0100
In-Reply-To: <7ad0d4852da4b1f13d6637f1e6e7dc6c674e2731.camel@ericsson.com>
References: <20260630115028.4001775-1-daniel.turull@ericsson.com>
		 <DJNY5PFZT70X.2O5P68RPD0PJU@bootlin.com>
		 <afbb3cf90ff55c3b4e693b8a28a6903b7f34f946.camel@ericsson.com>
		 <DJNZTL96C89O.1S6YFZXO1KCJI@bootlin.com>
		 <CANNYZj-duZWDtw2XP8SYg8gqhEbVDhnATLByJw+kAN2EjY0ZNg@mail.gmail.com>
	 <7ad0d4852da4b1f13d6637f1e6e7dc6c674e2731.camel@ericsson.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 13:34:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240051

On Thu, 2026-07-02 at 13:19 +0000, Daniel Turull wrote:
> On Thu, 2026-07-02 at 13:03 +0200, Alexander Kanavin wrote:
> > On Thu, 2 Jul 2026 at 11:55, Mathieu Dubois-Briand
> > <mathieu.dubois-briand@bootlin.com> wrote:
> >=20
> > > I suspect we had the same issue with v2, we just have been a bit
> > > (un)lucky as it never ran on a Debian 11 worker.
> >=20
> > Debian 11 has host glibc that is too old for systemd. There are
> > other
> > distros that use an even older glibc, and they do not fail because
> > they use buildtools. So we need to adjust the autobuilder to start
> > using buildtools on debian 11 as well.
> >=20
> > Alex
>=20
> Yes, I can reproduce th problems with glibc on debian 11.
>=20
> I have tested inside a debian 11 container and using buildtools-
> extendend-tarball should fix the issue.

If we start putting buildtools everywhere, we may as well just stop
testing on most of the distros :(.

I'm already worried about the implications of buildtools on RHEL9
derivatives :(.

Cheers,

Richard




