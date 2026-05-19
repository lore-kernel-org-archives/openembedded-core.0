Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A0BECD4851
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 10:04:59 +0000 (UTC)
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18030.1779185089201014476
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 03:04:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=rEJkdGUl;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=s5ecLDth;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.154, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 37499140006D;
	Tue, 19 May 2026 06:04:48 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Tue, 19 May 2026 06:04:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1779185088; x=1779271488; bh=RDKYi74Hfy
	1vQNw3pp4C0JJKfr9NM4IXhocdRWa1Qhk=; b=rEJkdGUlavprrmw4OVlP/jnqd9
	I/woyU/uc0zKHV0CLb4KERk/14rTrbNO4ix1tZwzdjfArdJuvsApJ93vZ8Pg4gbH
	da/N6NvSTgXPN+v1YO8//j5Xmm+rNCuB67PgMCYFC4ApAUUQyORhHedUwlWRRYiE
	ACPBBRLmbEm6unJyx6UxKQrJ632AJ8UIASaR8HCrLaLUEN+jwyyo9yJIR3TgKpDc
	0kxrAGpWB5IGlnUZLti81MmfhFBXxvR/l1kPpaW+KmnPhLrzg3BROH/1SaOmf+3o
	wBBvlvCamsVLaV7ImD3FKEsXuthfV/xxOJJ2MEECx0dokckwqldbTHLz6uJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1779185088; x=1779271488; bh=RDKYi74Hfy1vQNw3pp4C0JJKfr9NM4IXhoc
	dRWa1Qhk=; b=s5ecLDthg+WF+czhFdB6flLlvCgycY+D6RYVMf4X39ryCtWjgEq
	fMBt39aGBWB4s/O5jnYW0VlKjTpkIDMbjoaN3gX8yTFpVDZbUbUN5ZVZyNYGLB9A
	LqBQAv4wLu1XgCKSYM4fXxIE8Hncenr0OfLRch/YfwbL1+OwxmlUB0Z+4rWO9Vr8
	q34/LosxBLHP9BWC2QdZPoIYHKAPYQYIhUCn3soOv/RCj/Z+Xn1njC5ADXSPHIV6
	zo8d3DYIwwakiShAe/72gt+e6UrFJRSQQIOJtSGy8hjvVrn65W2HTcC0o+/jNRHp
	IogQI22M0owcPaMKih+4VLfsXVfJ+OUth8Q==
X-ME-Sender: <xms:vzUMaiOfgREPNCP0tVVNuEmxDWfXso2PNwm7M24GZukc4hcEoc7L0A>
    <xme:vzUMan_0nFpJJPPxEbAPYa9l198VL2RsbsJkczwIFpwxkSpO5ee2XBl1whpF-kdgi
    DmEObpj24FCr6jlB-5d98bRWXxJpLsvLmbNM9TC9hM3u_1EbfmiZbE>
X-ME-Received: <xmr:vzUMauRBfI24gcPh4QEh6a1VSU1K4t1ylQpEkUcOBQBfK0IAkE0lUO0FmqGy15iRr1HLJ_NwsAB-WR3cH4C3fvvpDh8WdWr13WShb9iZq5hX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddugedugeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkffuhffvveffjghftggfggesghdtreertderjeenucfhrhhomheprfgruhhluceu
    rghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnh
    epffeiudegffegkeduveegvdefgeevhefhteeuleevkedttddvueeufeefheeivdejnecu
    ffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdphihotghtohhprhhojhgvtg
    htrdhorhhgpdhgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgr
    rhgrmhepmhgrihhlfhhrohhmpehprghulhesphgsrghrkhgvrhdruggvvhdpnhgspghrtg
    hpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhgrmhhinhgplhhi
    nhesrghsphgvvgguthgvtghhrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvg
    guqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthht
    ohepthhrohihpghlvggvsegrshhpvggvughtvggthhdrtghomhdprhgtphhtthhopehvih
    hntggvpggthhgrnhhgsegrshhpvggvughtvggthhdrtghomh
X-ME-Proxy: <xmx:vzUMahn0ajDnC9OPr2aioCAR0QkpK_9hvtuvaXShW6ZNrBt5wQiqlg>
    <xmx:vzUMamSaJRdozJYG2TrMqRN9p-4gqG7S1AOOKJJ8VuwLjitp2dSXfw>
    <xmx:vzUManPifv7YDFXibmTAN4kLZcxb6y7lKwwPPQRlFC3VQ0pqAOs1og>
    <xmx:vzUManXQaF9DPRc5kRuArKOWTKFaTKxviGrS3gzvJIUmQ9sVVsmTFQ>
    <xmx:wDUMakIs3Iu5RpEKzD2o4mNl5kFUVJ8JRt_a9D1yhOVBVnRVuQODkDBe>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 19 May 2026 06:04:47 -0400 (EDT)
Message-ID: <1b23a714bd45226cba3644356fb60dc861723ab1.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH v1 1/2] externalsrc: Handle nested git repos
 from multiple SRC_URI entries
From: Paul Barker <paul@pbarker.dev>
To: jamin_lin@aspeedtech.com, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>, Vince Chang
 <vince_chang@aspeedtech.com>
Date: Tue, 19 May 2026 11:04:44 +0100
In-Reply-To: <TYPPR06MB8206BFFB5A9D2CB2989F16F1FC002@TYPPR06MB8206.apcprd06.prod.outlook.com>
References: <20260515093615.126849-1-jamin_lin@aspeedtech.com>
	 <20260515093615.126849-2-jamin_lin@aspeedtech.com>
	 <ea944ab1b8149e83b522e0c315b6436f6142da5c.camel@pbarker.dev>
	 <TYPPR06MB8206BFFB5A9D2CB2989F16F1FC002@TYPPR06MB8206.apcprd06.prod.outlook.com>
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
	protocol="application/pgp-signature"; boundary="=-G/U7UjlDNkkIpM/988Ap"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 10:04:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237299


--=-G/U7UjlDNkkIpM/988Ap
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-05-19 at 06:28 +0000, Jamin Lin via lists.openembedded.org
wrote:
> Hi Paul,
>=20
> > Subject: Re: [PATCH v1 1/2] externalsrc: Handle nested git repos from m=
ultiple
> > SRC_URI entries
> >=20
> > On Fri, 2026-05-15 at 09:36 +0000, Jamin Lin wrote:
> > > When a recipe uses multiple git SRC_URI entries with different
> > > destsuffix values (e.g. Zephyr-based recipes with separate repos for
> > > the kernel, modules, and application), each source is unpacked into a
> > > subdirectory of EXTERNALSRC that retains its own .git directory.
> > >=20
> > > srctree_hash_files() calls 'git add -A .' at the EXTERNALSRC root,
> > > which fails with exit code 128 when git encounters these unregistered
> > > nested git repositories, halting the bitbake parse phase.
> >=20
> > Is this true? The documentation for `git add` [1] talks about issuing a=
 warning
> > when this occurs, not an error, and in some quick local testing I get a=
 successful
> > exit (exit code 0) when I try this.
> >=20
>=20
> Please try the "zephyr-helloworld" package.
>=20
> This recipe uses multiple Git repositories in "SRC_URI", and I can reprod=
uce the issue with this package:
>=20
> https://git.yoctoproject.org/meta-zephyr/tree/meta-zephyr-core/recipes-ke=
rnel/zephyr-kernel/zephyr-kernel-src-4.3.0.inc=20
>=20
> Steps to reproduce:
>=20
> 1. git clone https://github.com/openembedded/bitbake.git
> 2. git clone https://github.com/openembedded/openembedded-core.git
> 3. git clone https://git.yoctoproject.org/meta-zephyr
> 4. git clone https://github.com/openembedded/meta-openembedded.git
> 5. source openembedded-core/oe-init-build-env build
> 6. Edit build/conf/bblayers.conf and add the following layers:
>=20
>    * meta-openembedded/meta-python
>    * meta-zephyr/meta-zephyr-core
>    * meta-openembedded/meta-oe
> 7. devtool modify zephyr-helloworld
> 8. bitbake -c cleanall zephyr-helloworld
> 9. bitbake zephyr-helloworld
>=20
> After that, the following parser error occurs, and the package can no lon=
ger be built:
>=20
> ```text
> jamin_lin@aspeed-fw02:~/oe-review/build$ bitbake zephyr-helloworld
> Loading cache: 100% |####################################################=
###########################################################################=
##########################################################################|=
 Time: 0:00:01
> Loaded 4949 entries from dependency cache.
> ERROR: ExpansionError during parsing /home/jamin_lin/oe-review/meta-zephy=
r/meta-zephyr-core/recipes-kernel/zephyr-kernel/zephyr-helloworld.bb
> bb.data_smart.ExpansionError: Failure expanding variable do_compile[file-=
checksums], expression was ${@srctree_hash_files(d)} which triggered except=
ion CalledProcessError: Command '['git', 'add', '-A', '.']' returned non-ze=
ro exit status 128.
> The variable dependency chain for the failure is: do_compile[file-checksu=
ms]
>=20
> ERROR: Parsing halted due to errors, see error messages above
> Parsing recipes:   0% |                                                  =
                                                                           =
                                                                         | =
ETA:  --:--:--
> Summary: There were 2 ERROR messages, returning a non-zero exit code.
> ```

Following these steps I see the same error. But the cause is not the
nested git repositories. `bitbake -c cleanall ...` has deleted the
sources from the downloads directory, but the devtool workspace is still
referencing the deleted sources. Even a `git status` command in the
zephyr-helloworld sources directory fails:

  $ git -C workspace/sources/zephyr-helloworld status
  error: unable to normalize alternate object path: /home/pbarker/bitbake-b=
uilds/.bitbake-setup-downloads/git2/github.com.zephyrproject-rtos.mcuboot//=
objects
  error: unable to normalize alternate object path: /home/pbarker/bitbake-b=
uilds/.bitbake-setup-downloads/git2/github.com.zephyrproject-rtos.mcuboot//=
objects
  error: unable to normalize alternate object path: /home/pbarker/bitbake-b=
uilds/.bitbake-setup-downloads/git2/github.com.zephyrproject-rtos.mcuboot//=
objects
  error: unable to normalize alternate object path: /home/pbarker/bitbake-b=
uilds/.bitbake-setup-downloads/git2/github.com.zephyrproject-rtos.mcuboot//=
objects
  fatal: bad object HEAD
  fatal: 'git status --porcelain=3D2' failed in submodule bootloader/mcuboo=
t

If I replace step 8 with `bitbake -c cleansstate ...` then there is no
parse error.

What we need to fix is the interaction between `devtool modify` and
`bitbake -c cleanall`. Perhaps devtool needs to detect this broken state
and tell the user how to fix it - simply running `bitbake -c fetch
zephyr-helloworld` isn't possible as the metadata can't be parsed.

Best regards,

--=20
Paul Barker


--=-G/U7UjlDNkkIpM/988Ap
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCagw1vBEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bhRzAQDciw6ub88+Ar6oQRmCUeyU5id6BXlauUsl
gvVoQCIXagEAiAhrlThYLrGAx6qB4AX2Uen49ROxzJvNTMwWNwiP4QQ=
=ydwM
-----END PGP SIGNATURE-----

--=-G/U7UjlDNkkIpM/988Ap--

