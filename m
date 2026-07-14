Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B308CC44508
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 16:11:17 +0000 (UTC)
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.367.1784045468926350181
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2026 09:11:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=Hv6mqcJI;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=BuXGIb8U;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.149, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id DE050EC017B;
	Tue, 14 Jul 2026 12:11:07 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Tue, 14 Jul 2026 12:11:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1784045467; x=1784131867; bh=vd4Cq5rBMu
	XHVPQC4gA3mYoPSd481hYDksiiU06D1Aw=; b=Hv6mqcJI2XaE7xOiJmYWH7GRQ4
	tkQpMZlVonb8Rcn6TIsqB8u96/S+OZq3EwkHBBWRgLSBiSdJwDZp89rYac5SGyY6
	oZLqkoMH3GryPnrA6wCMEii08YW775X4/D43khGOEQNLcbDPGtW0VoH3m5hdEMgH
	EUmEoq8t1jNhle1XFE6KbJO8TfSOb1CSlPoZTCl7+eDFloT+eGqlVGSHMX1KEWU2
	x9R23r9XVtO2cdGu9BcofTE93SnZNEuDfuc+qke4Jbyj/KQnKbo0rXzFwdOlLZzF
	xsxonZc+pacc/WWWGCX1tKryuWverthZ7Pvda6y3MkMmbWvWSmRQ+dwJdYxA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1784045467; x=1784131867; bh=vd4Cq5rBMuXHVPQC4gA3mYoPSd481hYDksi
	iU06D1Aw=; b=BuXGIb8U9eBduHyfVkWCQhHvPv/w5Xix530imtvvE1ECca74toV
	zR6k0wmeZN72AVGQ0ql773Lgz+V0OZwDHPJsKSnBU8yAa7JFL4/LfHV24XYJpGZt
	Ny4t78cVPn3QVAUK16ldBK9qFyIZmd+YDSfu0g82rPzf9O/SiP1khJQxiZjy1Tle
	ScIBgtD235fagJbV6S7w5lPQPtbeH0Ilsh7Jd4lW6s4RParxayz208ngMEmVJhMh
	4X791evVTWlVo5JtgCgoegPSBt5LFaeGIh5oizRhXlYszCBG9GoeOpVF0d+Tv453
	hKRzmb/O+Erz68SREm7NF0J58EUuAXnqVNQ==
X-ME-Sender: <xms:m19WaidC9s0na8IwtsUIXtD577nGBPOE8NZEnbO7IgpB7ZDwGQZSiw>
    <xme:m19WaiPU0Jf5e058eV3DkmVMGJp45gqT1pCi3z5TGO5wjCzm9lEBtArCNQpiJbOqD
    vXjwIWZrRltM_T7AFoARRWGAxeGXaFsNMLtRPQ0wa9-ylKwe36hnMc>
X-ME-Received: <xmr:m19WahK7DmFnvwL-KsrgI0tChdFwIFnwFoe-dPFexYGLueE6AutBBgcfOa9pc8f34iVWpDpNqvKcUZP04ilpdLLmt0_mmak5uhGD0Nk>
X-ME-Proxy-Cause: dmFkZTFXxXMIfrbxLLqO23dxU6yzxUQSL33/PnrECEip7P8XsDgw7Pm0hb9SIQ4HqFfjs5
    p9PkRQPO2NOpAOhilkh7n0cXX+etDRS/H5ZrmjOXjHw+nm2AWyNxvLVcgdyDgSuxtssIDV
    c64a5LsNrK1QdlFF3/x0eEKVBcz8gYI1+3vvatcDbXF7ANZRa53Vi7nWqEo/N7L6DBqp9s
    IGNlY0igdk1J3km8OV1xPe4qsr+0YWBy1IJxwcNheMx0YH6+RyAsxSJbVUP1kCM30PKwWr
    isHxi9FS104N4euc668BK4QJGjyKVSFs/O9GygD9WdZpzhPhiZW/5zg7k3O0pzQYukmIhN
    6CqBEiPDZePvtJ8uaVw/9laBrGcnOOUGklNOSaWKy6Mj5V2sx9EzVHyi7SlNjVjAcWKAgK
    vn5GRKdxDLt3YY/flW6IX0Y8ViKWOEoOoVnuNLLmkhIv2RBfIMrTwsNDuaJyfqg6+Ru68O
    GvctMFI/mOSgyBzPOTRDBHGPfuPTWNi3UMQkrnMD/h/3Yy2iYY7XiOPmVHnK2YSHcg5WAX
    WWf2LffQ2HWbjY+FZKysyEKqccluWzixAamcyu6LlppV+RvgUBPoBk6+jT2T8StQVT+z87
    5SvNsMzmcRsHHayfHbFvuHxK2ZmT9Segj42ZDvPQ/7gknkqqVx7KT98J53bQ
X-ME-Proxy: <xmx:m19WarEbysfnSYYIHG3zw-aTnHmoPObPbnv3iJ0ld62wY6D6m6Keew>
    <xmx:m19WahRO4ZS0He0OlI6GdZ6YlfXenzQRrrq1GYCVYu28R-mRZnHZHA>
    <xmx:m19WavEhHMDiNU0idYlDet5Dv-JBFIJ9tYUI8wJOHlT26CDElR2iJA>
    <xmx:m19Wal-sOTbfh_GSLhnJqgdmUCjAKivHMlbIVz6fNt7d2inJgea7Rg>
    <xmx:m19WamAwPNHvXWOJFd6HtFq6PB8W7m8xHSozYsE-FQ7PME6kJ58PE0vD>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Jul 2026 12:11:07 -0400 (EDT)
Message-ID: <cdbffad91a78bae213734628ef57315779609b21.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH v3] memory-control: add recipe and bbclass for
 cgroup v2 memory limiting
From: Paul Barker <paul@pbarker.dev>
To: Ishaan.Desai@ibm.com, openembedded-core@lists.openembedded.org
Date: Tue, 14 Jul 2026 17:11:03 +0100
In-Reply-To: <20260714154545.4037040-1-Ishaan.Desai@ibm.com>
References: <20260714154545.4037040-1-Ishaan.Desai@ibm.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-6gxxzZWZKe9QfJd++bFR"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 16:11:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240898


--=-6gxxzZWZKe9QfJd++bFR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-07-14 at 10:45 -0500, Ishaan Desai via
lists.openembedded.org wrote:
> Adds a CLI tool and bbclass for applying per-service memory limits via
> systemd resource control and Linux cgroups v2.
>=20
> The memory-control command inspects MemoryMax and MemoryHigh settings
> for any running systemd service and lists all services with a drop-in
> applied.
>=20
> memory-control.bbclass allows any recipe to set a memory limit at build
> time by inheriting the class and setting MEMORY_LIMIT. Two OOM policies
> are available via MEMORY_OOM_POLICY: "reboot" (default) reboots on OOM,
> and "kill" terminates only the offending process.
>=20
> The recipe requires the systemd DISTRO_FEATURE via features_check so it
> is cleanly skipped on non-systemd distros. The bbclass guards its
> RDEPENDS injection with bb.utils.contains for the same reason.
> S is set to ${UNPACKDIR} since all sources are local file:// URIs with
> no upstream tarball to unpack into a versioned subdirectory.
>=20
> AI-Generated: Uses IBM Bob
>=20
> Signed-off-by: Ishaan Desai <Ishaan.Desai@ibm.com>

Hi Ishaan,

The previous versions of this patch which you have sent have had
questions. Please engage with the discussion instead of just spinning a
new version of the patch without clarifying anything.

Please also include a patch change log to document the differences
between each version of the series.

You can find more information in our contributor guide:

  https://docs.yoctoproject.org/contributor-guide/submit-changes.html#takin=
g-patch-review-into-account

Best regards,

--=20
Paul Barker


--=-6gxxzZWZKe9QfJd++bFR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCalZflxEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bhf+AP41RW5bmEPJyeO4hnTfc5VoVkLNOUGXok3M
L8tayoIsrgEAl7RBr1q9SrIrw/rMPr8fwPnRj51QBj8YlKmMM/+/Qw4=
=SVR4
-----END PGP SIGNATURE-----

--=-6gxxzZWZKe9QfJd++bFR--

