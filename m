Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBFF0CD8CB2
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 08:25:16 +0000 (UTC)
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15253.1781079912013304592
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 01:25:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=G+Rh2gpG;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=aakruLKH;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.155, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 24D2C1400106;
	Wed, 10 Jun 2026 04:25:11 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 10 Jun 2026 04:25:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1781079911; x=1781166311; bh=3HdpJTk3Jp
	UaM7lS6NKN7iHu/lNc8Ng4M6QUPLu7IeQ=; b=G+Rh2gpGxboBm0T9QobWqGr71G
	xqLhB6jrEKClw8EH1+/g0nClngh4ouLj2ajRnO0wdkDtJeYi0yfvWuwN34/vt8yN
	zbmHVFZwrQTzR5kLCQC8teKYTWkjFjzjZetGdOKoiIhkzGWcY1ucmupYOIF2+9/b
	NFveC0bbx9RfR1KR1Zy84M8ZBfiWRbJeKFrnCeXGa6bS6m/eXBjJFP6X7qY7jDGA
	nYS3OCLwF9faP4O2WnkKBM0NXIkPSwqiSPM4xnjSUzzm7jv4eDZkzOrIe3Ctj1Uo
	L/d9E3WC6auSFyWnNp2q7d5qv89mtFwTuJBiSyn/JdwG+GzSkpurcVVSyFZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1781079911; x=1781166311; bh=3HdpJTk3JpUaM7lS6NKN7iHu/lNc8Ng4M6Q
	UPLu7IeQ=; b=aakruLKH/NS4z68ToX6Hdjm5C+OgF+KcohIvpUgTyrH2uM2Ah92
	uOyz9WXQ7LFHTR7KT/mG2onoXS8MwPkCjIWI5/isQOq0W99rWK3wCoyOyaqn2eU8
	0igmrsSk97IolfP5aQHUaQVXnyEGiGJolxoQQfpIl2JDuo57UUUk5v8u7xSTgpSl
	uik+kyjSUUt754NoQu7StnseUeAkOHSybk34N+9A9SbUGn+SCxKWppVgo8tQWwSD
	QL7LfrZFRaVd2XbtOn8kP+ZhBrWLzWkAJpzJ450lUJeV22MSi/oNRDJMMq8QuiTt
	t09l1VDywpvj3j0+uVQAh2PyEwBvF8VsqVg==
X-ME-Sender: <xms:Zh8paswQLPzMkjPcfG8Y-sxIMWTGFCq-yqFmdBA0k5yTgXwmPcYkEg>
    <xme:Zh8pahyZi9_WQQRTpFSHQCx6-KNzYlgos1FVJZkfXwxy33sa8mWNrYSQSWTme6PP_
    p5zRM5ZgyAFR8g2CQ7cph2pDsrWnpZfmMAVi7GstPpmD_Wy5PA56thG>
X-ME-Received: <xmr:Zh8pauYV5Ty-UCnCM-JxdZ49Rfvi58MEjO2SJ05Y9jETn-pJY7SkMUeKhj_eq5kVew_8Fbk5lMj9xRR81lE2Zbn4pIWDBkhLuEOnr2kETQHi83gYdNJidhCSYlUcOZTU>
X-ME-Proxy-Cause: dmFkZTG1DTvIOL1WVcxakiDgASIsCU4xPghd93wyai2nccIB9gRMu9GkYcbhFuDsjoak99
    fBqmdhjPF1uaK0Viwdqhd8UZ7kg9ZBCjtoiSAV5R1GPw2b7fQ+09V0jpH2G+UKT1g2grZq
    CgVxntUaVQKvYs+AzHsw8S7b5p1VykM43UD2/P59YscT72K/czltKnjK64mv00gjzNcOee
    sWQxpiS7D/peHLhMAi6mTEQgCUgMXigIr3pskvXv4T9MEoYU5XvYYMO4x5+TKCO1vzIoeG
    xVDKSeQnpw8Pp4UguIhKa2lay7kLLFtDUyaT8QJdXqCxmEkqI1ThG8sWIaj1IQiasJFNDM
    2sMPzR0lMUSeBnqHmkD03v90+D3ruvvzcT+j5g/Xw+xySXe+TN5MT3A95Sa+DZ7TRAp1r4
    t99tz3IJDHgnOGdns6A0BfNEr9qem8xshVu4HiIgvXV5T68QAE7pj2RuaDx2j6yUXtLuAH
    XnVn9tASQ0J6ppdQE9b5Nc2vrGFvCMG5GaCfKeJrJkN41ISOreGEXAgnViPzKehp3cs5Cs
    MEgsgDQ08ukAUydLq/SIDk9e1e/FnylYDL2LkgptyGERXHY7IMjryaRtahq9tjjBu5cgLR
    +M6KShl6BIb3XpvZjeiiuLASSLmbTkR8jE+0EuWyOfs0R1nU29IGhHjtUM/g
X-ME-Proxy: <xmx:Zh8paqVQO2cwQcPIwyhjkdX-tZjrkA-q_4qQlKX5yrZ3QCHb2ub2Ug>
    <xmx:Zh8pakjcCgOmEKghZ8cbG5YcrSpL8agIiE_zNPsWijd7GaU3Paf2ew>
    <xmx:Zh8pagu8WYdCtb0psCtc5gBNooxH2j1FhX9HdJu5MyiyFm1r80Engw>
    <xmx:Zh8pal5NDm23ASyEKU8iKWJBwz5zebIzMvY3ZbNgwKZUD8k6LWR4kA>
    <xmx:Zx8pam3mIPmK-T4MZOeHASoxbSzUBIElHNoZ07wbqzqoDV8YH4XIFr3v>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 10 Jun 2026 04:25:09 -0400 (EDT)
Message-ID: <d18556b239e66866bdf0ed7d71b1157dc6756930.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH v1] bluez5: add Channel Sounding ranging
 patches
From: Paul Barker <paul@pbarker.dev>
To: prathibha.madugonde@oss.qualcomm.com, 
	openembedded-core@lists.openembedded.org
Cc: quic_mohamull@quicinc.com, quic_hbandi@quicinc.com, 
	quic_anubhavg@quicinc.com
Date: Wed, 10 Jun 2026 09:25:04 +0100
In-Reply-To: <20260609095827.2041722-1-prathm@qti.qualcomm.com>
References: <20260609095827.2041722-1-prathm@qti.qualcomm.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-BnznMFJjMFqcQLqNHu3f"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 08:25:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238323


--=-BnznMFJjMFqcQLqNHu3f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-06-09 at 15:28 +0530, Prathibha Madugonde via
lists.openembedded.org wrote:
> From: Prathibha Madugonde <prathibha.madugonde@oss.qualcomm.com>
>=20
> Add 13 upstream patches enabling Channel Sounding (CS) ranging support:
> - Introduce HCI raw interface for CS in shared/rap
> - Add HCI LE event handling in ranging reflector
> - Add RAS packet format and notification support
> - Add BPF filter and bt_hci_register_subevent for LE Meta events
> - Add client ranging registration and notification
> - Various fixes and cleanup for CS/RAP code
>=20
> Signed-off-by: Prathibha Madugonde <prathibha.madugonde@oss.qualcomm.com>
> ---
>  meta/recipes-connectivity/bluez5/bluez5.inc   |   13 +
>  ...duce-Channel-Sounding-HCI-raw-interf.patch |  381 ++++
>  ...-Add-HCI-LE-Event-Handling-in-Reflec.patch | 1563 +++++++++++++++++
>  ...up-coding-style-and-unnecessary-code.patch |  261 +++
>  ...AS-packet-format-and-notification-su.patch | 1444 +++++++++++++++
>  ...t-rap-Add-PTS-tests-for-CS-reflector.patch |  408 +++++
>  ...anging-Read-cs_mode_one_data-members.patch |   54 +
>  ...Add-BPF-filter-for-registered-events.patch |  141 ++
>  ...t_hci_register_subevent-for-LE-Meta-.patch |  360 ++++
>  ...Use-bt_hci_register_subevent-for-LE-.patch |  309 ++++
>  ...p-Fix-gatt_ccc_read_cb-on-big-endian.patch |   56 +
>  ...d-rap-fix-use-of-uninitialized-value.patch |   46 +
>  ...lient-ranging-registration-and-notif.patch |  979 +++++++++++
>  ...les-ranging-Fix-measured_freq_offset.patch |   38 +
>  14 files changed, 6053 insertions(+)
>  create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-shared-r=
ap-Introduce-Channel-Sounding-HCI-raw-interf.patch
>  create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0002-profiles=
-ranging-Add-HCI-LE-Event-Handling-in-Reflec.patch
>  create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0003-rap-Clea=
nup-coding-style-and-unnecessary-code.patch
>  create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0004-src-shar=
ed-Add-RAS-packet-format-and-notification-su.patch
>  create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0005-unit-tes=
t-rap-Add-PTS-tests-for-CS-reflector.patch
>  create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0006-profiles=
-ranging-Read-cs_mode_one_data-members.patch
>  create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0007-shared-h=
ci-Add-BPF-filter-for-registered-events.patch
>  create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0008-shared-h=
ci-Add-bt_hci_register_subevent-for-LE-Meta-.patch
>  create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0009-ranging-=
rap_hci-Use-bt_hci_register_subevent-for-LE-.patch
>  create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0010-test-rap=
-Fix-gatt_ccc_read_cb-on-big-endian.patch
>  create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0011-shared-r=
ap-fix-use-of-uninitialized-value.patch
>  create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0012-shared-r=
ap-Add-client-ranging-registration-and-notif.patch
>  create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0013-profiles=
-ranging-Fix-measured_freq_offset.patch

Hi Prathibha,

This is a huge set of backported patches, we would prefer not to carry
this many feature changes in OE-Core. When is the next upstream release
expected? If there isn't a clear timeline, perhaps you can work with the
bluez5 maintainers and explain your need to get the new features into a
release.

Alternatively, it may be better to carry these patches in your BSP layer.

Thanks,

--=20
Paul Barker


--=-BnznMFJjMFqcQLqNHu3f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaikfYBEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0boLXAQCdUwwNfYwDgFfx0xZ1FivkoHkE7opX04/M
OX4AZIcHMAD/ffOgMksaU97NG/HL9nn9ZPCprTG7DAqk362iw8c3Ygw=
=92dw
-----END PGP SIGNATURE-----

--=-BnznMFJjMFqcQLqNHu3f--

