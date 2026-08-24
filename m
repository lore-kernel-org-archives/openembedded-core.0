Return-Path: <a.fatoum@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2D35C5DF81
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 14:16:37 +0000 (UTC)
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17615.1787580994537634254
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 07:16:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.200.13, mailfrom: a.fatoum@pengutronix.de)
Received: from [0.0.0.0] (ptz.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::77])
	(Authenticated sender: afa@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 871EA200444;
	Mon, 24 Aug 2026 16:16:27 +0200 (CEST)
Message-ID: <1ab3fd79-62c2-4697-abdd-5691fa8b9e7b@pengutronix.de>
Date: Mon, 24 Aug 2026 16:16:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC v4 0/6] openssl: upgrade 3.5.7 -> 4.0.1
To: richard.purdie@linuxfoundation.org, jaipaul.cheernam@est.tech,
 openembedded-core@lists.openembedded.org
References: <20260814051829.35088-1-jaipaul.cheernam@est.tech>
 <20260822175200.57534-1-jaipaul.cheernam@est.tech>
 <7a100e486f8bcc7f48ec0073ccaa95fabeb8b59f.camel@linuxfoundation.org>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Language: en-US, de-DE, de-BE
Cc: "yocto@pengutronix.de" <yocto@pengutronix.de>
In-Reply-To: <7a100e486f8bcc7f48ec0073ccaa95fabeb8b59f.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 14:16:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244123

Hi Richard,
Hi Jaipaul,

On 8/23/26 9:02 AM, Richard Purdie via lists.openembedded.org wrote:
> On Sat, 2026-08-22 at 19:51 +0200, Jaipaul Cheernam via lists.openembed=
ded.org wrote:
>> Upgrade OpenSSL from 3.5.7 to 4.0.1 and fix all dependent recipe
>> breakages in oe-core.
>>
>> OpenSSL 4.0 is a major version bump that removes the ENGINE API,
>> removes the c_rehash script, makes ASN1_STRING fully opaque, adds
>> const qualifiers to X509 accessor return types, and removes
>> per-version TLS method functions.
>>
>> This series fixes python3, socat, serf, u-boot, and kea to build
>> against OpenSSL 4.0.
>>
>> Changes since v3:
>> =C2=A0 - u-boot: fix malformed patch (hunk line count mismatch from pk=
cs11
>> =C2=A0=C2=A0=C2=A0 modification). Regenerated patch properly.
>>
>> Changes since v2:
>> =C2=A0 - openssl: remove c_rehash from MULTILIB_SCRIPTS and FILES (fix=
es
>> =C2=A0=C2=A0=C2=A0 multilib do_package failure)
>> =C2=A0 - python3: add backports from CPython PR #149783 for the
>> =C2=A0=C2=A0=C2=A0 got_eof_error fix (fixes test_https/test_https_sni =
ptest failures
>> =C2=A0=C2=A0=C2=A0 caused by OpenSSL 4.0 changing EOF signaling behavi=
or)
>> =C2=A0 - u-boot: update Upstream-Status to lore link per reviewer feed=
back,
>> =C2=A0=C2=A0=C2=A0 include doc/Dockerfile hunks from upstream v4, make=
 pkcs11
>> =C2=A0=C2=A0=C2=A0 provider loading optional (fixes fitimage signing f=
ailure when
>> =C2=A0=C2=A0=C2=A0 pkcs11-provider is not installed)
>>
>> Changes since v1:
>> =C2=A0 - u-boot: move patch from u-boot-tools to u-boot-common.inc (fi=
xes
>> =C2=A0=C2=A0=C2=A0 riscv64 build failure)
>> =C2=A0 - serf/socat: fix Upstream-Status tags
>=20
> Thanks, definitely getting better!
>=20
> There was one failure in core I spotted in barebox:
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/4689
>=20
> I think that is openssl related but it is hard to be 100% sure.

barebox v2026.08.0 was released today and it includes following fix,
which should make barebox compile against OpenSSL v4.x:

https://github.com/barebox/barebox/commit/7152488b95484e8fc4a427471dab0aa=
4fa5e0aad

Thanks,
Ahmad

>=20
> Cheers,
>=20
> Richard
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#244011): https://lists.openembedded.org/g/openembed=
ded-core/message/244011
> Mute This Topic: https://lists.openembedded.org/mt/120878891/4830399
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
a.fatoum@pengutronix.de]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |


