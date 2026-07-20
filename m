Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1952CC4451B
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 08:03:12 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4208.1784534586799548403
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 01:03:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fXvth/rz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-69e2266b07fso7138362a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 01:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1784534585; x=1785139385; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rxVXnlGwsgQ6Gwe1+oxFrat8Gg1sUOI3a+czkjtZotg=;
        b=fXvth/rzBe0xkS1BO3KgGW8gHr169o575ElxqfJW+z3FCCxlG+49phNNH5EhvUXW9I
         EQN4PWrYkBPUSWXTLtYnkKRxu01+BnkRM65XXV5Lm6Ur1S5H6kxri3MGdffJ9QYvt0iW
         qyD6PPhuHiiskWCqrzuYH7hy6O3X4+HYXCvWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784534585; x=1785139385;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rxVXnlGwsgQ6Gwe1+oxFrat8Gg1sUOI3a+czkjtZotg=;
        b=qtw7pHTosw2fXB/0XinVYdPkTsRE5QJTg9Dp17l+kOfnnkmDhsDqA1vLLm1guqgiX6
         ByCCDGyUonlx+opXgpzRhdZ7e7lCIhluhuZGAWL1eTZMFIBz/L+0qBB5lwuMJQow5sr2
         /V/EI6VpgZ7WwDRx0A4iY4u5WDt2ubM4z0zYxdBTQTmqki5Ket35UXWCogdWwOaBs3CQ
         QFbg5L2fFFp3eoXPTNLgAX19RJQX54+Q2R0fmAQLnA4q0swkkYOmCIfwSUvG2MK//5CV
         I+/FdGXZGAO8KAIU8+346OUn5Q17cmu+Hix15mjYeqxlg/uOCAhdkghf3QAG+VPuRxyk
         SOGA==
X-Gm-Message-State: AOJu0Yz5ZDKztHvYa6goRPEBB2RQXhi72ISj0/a+2JbpT3kJa4rnGHU3
	ePrSUpdeifKFIlyWKV1An4CD7vqn2XiQR9iLsfjXkss74DGOZGmRolHiUuXYr/A4wjI=
X-Gm-Gg: AfdE7cm0UnMn6NXlQtKC2iDaovpt2q9AenvD18ElIWgDDDMqRzs01o3VKLMyiYnMdmw
	mMXCyJxI9l24wWxwHBb8yJ6x1TW1xtLuuTYNFkNngpUs4nM0VWd1oS1grWc+bVNzI4CneUg4JBW
	mEW3ehI8mu/39ltJKX30xUQnqRi4PGZ6xN8Kgnok29st3IxMMY2BC4i2CMKAfCLkuNwxzKZKIN+
	u005t+OaoDk/IJefBmTxzUBB0hgPX6NSa+x7yEwmheh6pOGAoQvamnvtDJYtKlIpTSMP9ji/u5X
	LU80kmpCXp3LLRR+cDhLUGfgu3XXRv9fe3Y+yP1YFruT55l2zccnFCCl5jbJPKGoZ9+UUVwA4v4
	UkaPOd83/0bwm5j9y8txQY47FYCR4PnIKgctgOis7EgtthyfIPzftzylNxypinwwtt/q3ZOXzHO
	qZFiyRDY2n9R+QkxGyxWnQP3r+k10kOnBT8vqAFTEShWRUukvn8ewzQEqofVs+CdFP1Kc=
X-Received: by 2002:a05:6402:40cf:b0:69e:383b:c4b with SMTP id 4fb4d7f45d1cf-69e65273c42mr4448609a12.16.1784534584832;
        Mon, 20 Jul 2026 01:03:04 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f231:f082:3d95:2084? ([2001:8b0:aba:5f3c:f231:f082:3d95:2084])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6ffed537sm4266673a12.24.2026.07.20.01.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 01:03:02 -0700 (PDT)
Message-ID: <7782792b05b85562b28f1c6ce9a2319c8269fae4.camel@linuxfoundation.org>
Subject: Re: [PATCH v4 2/2] systemd: add native hwdb generator via merged
 systemd-tools-native
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Daniel Turull <daniel.turull@ericsson.com>, "Ross.Burton@arm.com"
	 <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Jul 2026 09:03:01 +0100
In-Reply-To: <0b406994f714c1d3659dd054ceea97e95b7f8090.camel@ericsson.com>
References: <20260703072948.2939128-1-daniel.turull@ericsson.com>
		 <20260703072948.2939128-3-daniel.turull@ericsson.com>
		 <791CE8D7-F761-490C-9922-4A71F96614DC@arm.com>
	 <0b406994f714c1d3659dd054ceea97e95b7f8090.camel@ericsson.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 08:03:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241338

On Mon, 2026-07-20 at 07:26 +0000, Daniel Turull wrote:
> On Fri, 2026-07-17 at 17:59 +0000, Ross Burton wrote:
> > Hi Daniel,
> >=20
> > > On 3 Jul 2026, at 08:29, daniel.turull@ericsson.com=C2=A0wrote:
> > >=20
> > > Build systemd-hwdb natively so image construction no longer
> > > depends
> > > on
> > > QEMU-emulated udevadm on such hosts, with:
> > > - A patch restoring /proc/self/fdinfo mount-ID fallback for
> > > kernels
> > > =C2=A0 lacking STATX_MNT_ID (applied only to the native tools recipe)
> > > - A patch forcing compat mode in hwdb generation to avoid
> > > embedding
> > > =C2=A0 build-host paths in hwdb.bin (reproducibility)
> > >=20
> > > Update the update_udev_hwdb intercept to prefer the native
> > > systemd-hwdb over QEMU emulation, with a test -s check to catch
> > > silent failures from either path.
> >=20
> > Staring at these patches made me have thoughts and ideas, I=E2=80=99ve =
just
> > sent some patches that do some cleanups to the systemctl code (and
> > conflict with your series) that also then renames systemd-
> > systemctl-
> > native to -tools-, so that the upgrade work is tidier as it doesn=E2=80=
=99t
> > also need to rename lots of things.=C2=A0 This makes patches easier to
> > review/revert/backport/etc.
> >=20
> > Then some research revealed that we don=E2=80=99t need to run update-hw=
db
> > in
> > a qemu at all, we were likely doing that originally because we
> > didn=E2=80=99t
> > have a native recipe and the generated file has explicit
> > bytesize/word order: the files generated by ppc32 vs aarch64 in
> > qemu
> > are identical, so we can just delete the qemu codepaths entirely.
> >=20
> > This did involve discovering that there=E2=80=99s a bug in pseudo and
> > writing
> > an upstreamable patch for systemd-hwdb to strip build paths, but I
> > think we=E2=80=99re getting there.=C2=A0 The last bit of the series nee=
ds a bit
> > more love, but I=E2=80=99ll be sending that on Monday.
> >=20
> > Then we can rebase the 261 upgrade, which should be a lot smaller!
> >=20
>=20
> Thanks Ross, then I'll rebase the upgrade on top of you new patches.
> I
> will also take the latest systemd version
>=20
> what about the debian 11 compatibility, has been settle to use
> buildtools within debian 11 since it is old and reaching EOL or
> should I put effort to make it build natively?

We switched debian11 to use buildtools so we're ok there.

I have some of Ross' patches ready for merging in master-next. I'd also
written this patch myself:

https://git.openembedded.org/openembedded-core/commit/?h=3Dmaster-next&id=
=3D87c788c4f1f99425c6716d0337ec153719bcca4a

which applied on top of yours, basically dropping the systemd intercept
as I don't think it is needed any more if we're not using qemu.

Cheers,

Richard

