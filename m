Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5407EC55165
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 14:19:47 +0000 (UTC)
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12785.1785421184326404081
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 07:19:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=xnFKlta6;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=Fqlvfmtt;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.154, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 7B1B07A009B;
	Thu, 30 Jul 2026 10:19:43 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Thu, 30 Jul 2026 10:19:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1785421183; x=1785507583; bh=zL3MH4Xxke
	vOukeyF4u/LjgF5DudLlij63y9evvkjGQ=; b=xnFKlta6VTgTmLxjvEv/k/XE5S
	+eRM/zNyE/0Iixovv37g2aF75e82oSI12dHY7aM3MV8phtgN15Xbw7/gy9P9zghY
	4cFiEL0FhF/GzdLcMRXhlrkQxmHYlqvaHVuDbZfBnvi0vutcnuh1VkgqLmvugM8E
	YtIE7qna0mTM0T/oyZPRCEhL1K1DWNwqkcIJ7KQ+8S6lXFJBch5UXhfJSQJKLzK8
	kyyPRbLlvudkJQdqkNgJ34KSUBZcGqfFcLFX3yLRf0FjgMR2eeRgs+zG56av1fgy
	j9D3jHdQxgJ9t3jgip+i9melX6oscexoDBvueib98o/ocrLUkeX9j1YGCI9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1785421183; x=1785507583; bh=zL3MH4XxkevOukeyF4u/LjgF5DudLlij63y
	9evvkjGQ=; b=FqlvfmtthqJoSA1Glr8cn0q586Qk2ODLaEhy2uPib+eskIm7Cr1
	LqOmCgFsbmfwunZJDDKH1koSvbP5gU9joWUN33HGRciHR4fecOn44c5LGU7H6J0v
	mRU6uR5Eg/MpryxrfQhCuWMpA5OfU5kyuNnN0GDVtVfqTKx2RVMYTLq1xfYgWj5L
	iQ9PGa8zr/0PW5j4tljZH90oXAHW5ibPgSJKf6WJYUqioonQjJvO7N3XvCR2pol9
	Wd1gOSetN5nAywYlamQgoayBiVhVRPvnnxzIWt+xMPt+Kw+gZ0dB9AkWJPy1v8Ge
	MpaVNRdv2Z7OHYBdzH8NX72GMMAJaOzhGqg==
X-ME-Sender: <xms:fl1raufdwdvHeztzFQtOPP-fI8xKnznWDpYpxeqMkRxPGjkHtJLaZw>
    <xme:fl1ravPFCwXmvGEhVLOYXrKlkE-4Rq11yyUVO9KUWVTTF1CY4dguRicdDDCR0z7f7
    vl4erpCEnoxD5LeNJOc8mfmcQxjgTugDah_u6T1zQKgcM9bzu63kWCs>
X-ME-Received: <xmr:fl1rakioyV3ifAoA9kHQRF0VMoUAGc0dGdjv7tqpM7OauMu1tjqNTc5LbgDGYsDhxoNNzDyyszYf0btlxPgwfRiP1iFjn82HqY6Uv1ZhH0Kc>
X-ME-Proxy-Cause: dmFkZTEvzi5pp7azc1bba8goCj/UXWEWejc1/xxIIMNISEoSOOj8IuY6YowEY5KDxCEoOf
    Hj6qXeVMLBM8c3HurlGkGlg9M+LF+ZMmcNToFNuNbCKpi77fxjAp9zPoUXWpwpgN1vES0N
    q6zBtNmfyd2ixtFVfQRoUz2GxEzWCnXStrQrkTppFMXSzH/s9nrr4qYdWQLVkCIkcNu9hw
    Cn0bUrLeTdyz+k/8wXhfENyLk0gamW0gcb7uwajNwA69G2LplDCr/HvWyAciZSWRozfu9d
    eYyXBPkrlxggNVWDqC1fpjFsOKGZuxH7KKq1v9aKtC8KeeSORttJ0O4SeJID5Z4LpHQ0AA
    GdrZpNmIKSSuAZOd8e8I+iTg7gEv6pV/Lo8uDIIYzdX9J7L+/JF7xX6SvJ/6MhR7hq4mmt
    rfNrcgHXTRGlIb+PjpqTxzUXLSoTbZU5EDUrKFzwEEZiXgnxgN6CZpxESgGoiyZ9JsyWju
    MeeH2nBlGyq0nsVhtyTRfRjJ+oamrok9/xx39uni5a2sf9i/fdrlg9w2bRDxYpyTQKZcSR
    s6GKen0aLgbKQBEG23YtQRY9JrklpiAzhNGjaTVDCMj5PcId8KFjBIH241Xq1gYUdgzgcA
    zhmL8ke/4P6refnYE/03DDEi4d/ay9quVRUhk0giBKaHHYuxeFKaBEE+qOpg
X-ME-Proxy: <xmx:fl1raq1kjYdcTwbdRkiAa5lmLkT7q_jFjWfE0a1hTd5C2X_JV8hlPw>
    <xmx:fl1ramiBZEKv-lBD8SssRlURePrqFp2rvX9IYvrPyRwmKMJMU4mzcw>
    <xmx:fl1raifXhFue1zBa4ZSX3-eiYtHRQBAwRa9_1-WzdQOTm8FW2e8Wqg>
    <xmx:fl1rahm5uwKtvhaBEb9VWKNNvQf-3Z04zpAX9G96egKN5iDiGWziuQ>
    <xmx:f11rapePXLNfHw0JFkUZVZbrNvulnXcez2KOKC0aOCKeRLxN3YeRQLwS>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jul 2026 10:19:41 -0400 (EDT)
Message-ID: <52bcf8634847de61960bb1e33f613abf4d11576f.camel@pbarker.dev>
Subject: Re: [PATCH v3] systemd.bbclass: fix service enablement for
 cross-install scenarios
From: Paul Barker <paul@pbarker.dev>
To: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>, 
	openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Shiva.Komati@windriver.com
Date: Thu, 30 Jul 2026 15:19:38 +0100
In-Reply-To: <20260722101408.3225399-1-HimaniRamesh.Barde@windriver.com>
References: <20260716061519.765593-1-HimaniRamesh.Barde@windriver.com>
	 <20260722101408.3225399-1-HimaniRamesh.Barde@windriver.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=mQINBGC756sBEADXL6cawsZRrDvICz9Y1SG0/lW1me4xpq36obh7a0IGAzp3ywNRb/4MO
 DTqP4+DD0cIFuDY41/N17g0sNlp8z+/k/IIDmNPtYQOTVmAkrkdDU4BP8dD3Cp1PUw6nrbInfujAJ
 NrVM0IVDkwKTbL2Nu1P+xns4MIpF9Kj4XN5celYJ9vEJ2n0Bo0nO5T5vg46dihIaDl+24iNIHSsHq
 YyEdMBfY8kY2RulpaAyFOuaaHdIeDkejVvO5xLSiYLjB5qrRhgH134lJXsuLOsFQ64ybGECuOasnb
 auevsPBAaroQW0pqVb9FneGrWHxMCLlQHJRqQJRdVa6bsUdp6NWra8/0msPawSrFwGQdfJBTA3aXJ
 C2CG1JxEgj6QQjEQA49DSjgzdhInbiIK8Vbp/zedM4aVue7qJnwPMTFQM9lYx63b7wLN4Tu8B9YZ0
 UFdSwMCJuqmYGsYRUYdwM3ArjS0VO6WpU+HBKvzLK5GQfUTSM8KaZ5eA2Uo2ain8SSZb+WptUYKpx
 F9jbtCPbjpZKzGuX4iHFl9eT75TM9iXJNGAjB5xigkADLwVfPoJ5E53S+KdNVuOWHugyLMPNAQHOw
 pw5Rey+0zxyzPd4wphutc93UIU5g/029ngAc7DuKCq12jl7fhkjqFlFtYPIc1k7nd+RSezmH/qRes
 bMErHSX1MBSZQARAQABtB5QYXVsIEJhcmtlciA8cGF1bEBwYmFya2VyLmRldj6JAlcEEwEIAEECGw
 EFCwkIBwIGFQoJCAsCBBYCAwECHgECF4ACGQEWIQSYsqrBAKw/grtdVGd0l1yBt+ZrrAUCaWoNAgU
 JCxiQFgAKCRB0l1yBt+ZrrLhdD/sH+qTaxCDUg47eW329yJWCDZmO+iuYzNSyHMs1x0DHKNIQQ8zN
 pA2S/de4jElQuPHjw/IS8B3VmM62Wuq5vHuxNlFv9IMwrwqi6zhCDui8+nCN/AQGGXousJI/SeZjm
 Y5gS9cqh4vNY+huqEEfdTFXIfTBRkmnvYozSO2uDB3EMuiWgBlw2uLrtmkvPLn/m/GvEouLNox6wv
 tcJcIbL59a0+3jv/m7pnWoZXOkWmKQnfFWikqjuKCISNU0gzBSL4UOj8gtQ2z+vu7ffi29b6SV5IL
 m1yzdbkigEn4HL44lz3N+oHZ3wWsRqqeyGSX5fCfx3tGWg6scZQrpsjT5yq+LiffiXVNpjeJ9KzQw
 0cbAZ/9uhk1sWBroP+/gMhsWjlbFYXVlRvkNKGPI22eZtOEz4jF6OrOONyOoY3i26niJUyIgdBpca
 H0hKUSVQ8VnG7qVTNrQk9BbeoSszqRwViN7lfyVtK9b1TCFuGewOETGn0TPvSzruYCtD3CLm7mjuX
 AMBpIGoRUiCFVmF1hlOgqDyH4F6zRTHhKLpfmNzfQcg+Uo147Q2IHpoh0mJsL4FEZEI8hFyecX1Pq
 7HqnvxGD2OhCof1Z6LDxptX0wbgocnYFNxN5S1owcXZUQOFnzYLlLugrcEjlGCm4Gn7k4SiFERSBj
 UFsQgIhw/7lVVn4o4rQjUGF1bCBCYXJrZXIgPHBhdWxAcGF1bGJhcmtlci5tZS51az6JAlQEEwEIA
 D4CGwEFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AWIQSYsqrBAKw/grtdVGd0l1yBt+ZrrAUCaWoNAw
 UJCxiQFgAKCRB0l1yBt+ZrrHy+EADNMt+ewz8H7BUKpEMMhpaA1VxyXO5IqlKXS0gElMgHYXl7L7C
 0/qLfRH96vwVD33zM+f0Vl9aWWkom/k8s42tLyPvX7D5zTrj3r5muJ+d9dXWGwBFXxXlE9YjSP26K
 bYfRusmRHbbEPlLPSnrr9KYS2FGVD6ViRNhhVguflgPv2i18+fNBE3YyByfNCiQgO/SgaSdh172Ql
 tuYE1Chk6FD45tCUv3dI9lO2PlVwrciiVYvIv/jiTDEwZOISOClTE/Ha18pxDJfLhS8QQnLWuBNX6
 HUkLi78fVmVYbcWIkTuSHjfNoGTMaFijMg9Wl6poFrY++Pl0S40681zEIrwZhW5pKoqXoaElt29Yf
 OwVo6BIsSOLEqKiWsdP7PJTaJYU1ovnshBcOmuXMgc13AjQ4AhEGqI1TaEJ/E1jEDDyTQFeWgrfew
 YaWdqpgiDmRMTj/tIGVj9iy7qZQICUUtlfm0QK6w6M7qq0GdO2o+S3uVF6y2AxQo8l9LSHiW9O35I
 juR37zeqv72puYyOteVYJsJaw999HUmhXc/X/J9FQFw8twxPKDLLu+w8MqDo9bhllzR93Zy/OShuG
 yGybcX3DKO2R+AQ90tXLbxKmHLtrnG/zyDPhLv/LGD480v5hEoT+IS0u9wPD2vP5q36a5DtzqXA/7
 t9PCamLoCvZLleg7GY7QbUGF1bCBCYXJrZXIgPHBhdWxAcGJya3IudWs+iQJeBDABCgBIFiEEmLKq
 wQCsP4K7XVRndJdcgbfma6wFAmlqDRwqHSBwYnJrci51ayBkb21haW4gd2lsbCBiZSBhbGxvd2VkI
 HRvIGxhcHNlAAoJEHSXXIG35muspk0P/1G08N6zGSdw2p8+8f/1HhaYEb9KdQHT1JmQfZUrIHIpD2
 ELNb91Z6Pz197d/igGpox1dzYOwE0WolWo44ZHX2yw+p9V+HJAUKRe0SPc1iNLkTzaAZ7oYJ1DnFh
 aaqZi4VtKKabKeorJjcDvl2apMwT0agRuDklU97n++ZUuXIEo1Z9uRqEvXz0iTSY7wPxwfoVOQsgf
 dN1cBLd9OpoOtJRdDJzQUYqjNoQi+5M6KRfBxPLZkmYb4uCGlp1H4AV50eC61j84LBg1ItvU2u+Fx
 X2JB7lHTswubprD2ZsSwp1VziU6pUj3vtslMWKpBGslpLtnaO561dihGyElayMd4VFg7VR/TsglJv
 A10EDs2DMhoYPfRQWvwlr5+jPP6s9H8KSTCGFvQt438rP/gk0lcEZUJK0iE2/yq5gQfaCNI5FLN7C
 q8LVr00oS4doXfmFFxMq6z1rs5SXZorWssjG7v5DILnPxLqYloQK/ebM5Ixbzm0Lq/8vWL7sw7yOH
 JVYCHCApGzKNii6rYyHdi0K8UwvpD++GCWLyvbgP/H3l5FqL63gAN0Rw1CO5r22+SmG7aOmekJH3N
 ChZPI3NMLnKZPJC8ZQZ4S8yb5oA3rqTA2DMODvsrEVlaB2cQ6IWHSa/mvBwA8Ias3771cp4fZS7W7
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-SaQQv3B/lwS0+vt6LJsi"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 14:19:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242365


--=-SaQQv3B/lwS0+vt6LJsi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2026-07-22 at 10:14 +0000, Himani Ramesh Barde wrote:
> When packages are installed outside of Yocto's normal image creation
> (e.g., using multistrap, debootstrap, or dpkg directly on a host),
> the postinst script fails to enable systemd services.

Hi,

What's the use case for this? I'm not aware of a reason to install
packages generated via a Yocto Project build using
multistrap/debootstrap or via dpkg on the host.

> The issue is that the entire enable logic is gated behind
> "if type systemctl >/dev/null 2>/dev/null". In cross-install scenarios:
> - If systemctl is absent on the host: the check fails, script is skipped
> - If host systemctl is present: it cannot find target unit files

This is deliberate. On target, if systemd is in use then systemctl will
be available. At do_rootfs time, we depend on systemd-tools-native to
provide systemctl, the intention is that we're running the native
systemctl binary that we built, not the host's systemctl binary.

> Fix this by separating the image-build ($D set) and on-target ($D unset)
> code paths into distinct branches. The previous code used a single
> OPTS variable to switch between "--root=3D$D" (image-build) and ""
> (on-target) within one unified block. This variable is removed because
> the two scenarios now have dedicated branches with different logic:
>=20
> - Image-build ($D set): Uses "systemctl --root=3D$D preset" per service,
>   which reads preset files from the target rootfs and creates symlinks
>   without needing the host systemctl to understand the target's unit
>   files. Falls back to "systemctl --root=3D$D enable" per service.
>=20
> - On-target ($D unset): Same as before - enable, daemon-reload, preset,
>   restart. No behavioral change for on-target installs.
>=20
> The OPTS variable is no longer needed because each branch now directly
> uses the appropriate systemctl invocation for its context, making the
> intent clearer and the image-build path functional.
>=20
> Fixes [YOCTO #14118]
>=20
> Signed-off-by: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>

Best regards,

--=20
Paul Barker


--=-SaQQv3B/lwS0+vt6LJsi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCamtdehEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0but2AP9HBOZ39OfZngubUPVeiHkMWZXaEQAEgGoq
MDzK46/r2AEAhcvbl95cHja/0HTYIGl/DOyjt0Y2BreE38wi/MkRhAg=
=+znb
-----END PGP SIGNATURE-----

--=-SaQQv3B/lwS0+vt6LJsi--

