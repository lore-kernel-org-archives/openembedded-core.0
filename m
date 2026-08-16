Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0FB9C5DF6E
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 16:11:26 +0000 (UTC)
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12495.1786896681919415883
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 09:11:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=fZs3NfXI;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=QzRWj00P;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.158, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 2A441140010C;
	Sun, 16 Aug 2026 12:11:21 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sun, 16 Aug 2026 12:11:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786896681;
	 x=1786983081; bh=Tc4XEmaObL696x09/E2rYzq57bkVwND6OrswKwEkhPI=; b=
	fZs3NfXID4HOkJVeYQ+/4B6AXR+zgu1ilFLYuaS7KkHPGMxK+P41x9ktRWi/j5hv
	wmkf7XkPO45KegDg/csFZZ0QQBcD2MZZf+OxKb4uPzhyQwzIUIZ3oDvuMDjSXMDf
	Mb33u8rAmgk7IZV/+iU8tDOquwPOkYKuxANpbJedjApBPR3upzN5WN8Isdk+RSKn
	cihab9H57zizlhO9itgjIA6AVX0LZo2ptWEoMSKzUKGrQV4Tnl2+U88rge0QLVz+
	MMG3KB73Z3/+tVgDwKazQPHt+GAFxQ3BkqMOKbHlSPAg+OIM2+Av6dyinpLUyl6j
	vI7Vvby9ZlKwnlAFXka4DQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786896681; x=1786983081; bh=T
	c4XEmaObL696x09/E2rYzq57bkVwND6OrswKwEkhPI=; b=QzRWj00PYMkTvDjNy
	HVHZC5trGpiaeJ43w+eMi+xfAauuGz2lVDM9cYdLQqQdUbCoX4QRKQF/mlUC3ArQ
	kASn0yqC7ls2fc23krRmBZxmVdMEJ4/VC+0oU3R7o47TkursQGR3O4x8+StOGXfb
	bx/pacjezE1Dy7rz7/HIO3YY+M401asd5IyGqep1bWMw5oWPnCxz6VWlcMAwTPca
	g0sgz9L3c7qAXQlEmu/ZSTyFO8zdjJsFNFLVoQbPSaRSFPHUJzybrfl/9HuKZn9J
	+BQREDhKGhwwP481c2u7E07r42qFfBZN9hPXElTmeurUvaDIAV0ILG+tz8x2Cocx
	2d4HA==
X-ME-Sender: <xms:KeGBaseRJMW5ZJXdQdGFWzx7LGdELJNYe8z712d0tHI9FmrWAgplqQ>
    <xme:KeGBakN7kpm8k_Q4a98t9NSWBSepKQ25Pcbd1xgvvD8rjvt4HXy3tSy5ohlfKd-lY
    xma9vTw24p-tkS-d3VpHoVlwzqb5oeiIakjODFAesidZwZurqvl1dmq>
X-ME-Received: <xmr:KeGBarKjKe74btNIMHHSrhH7jhf6lGPeZHaSc9PzNO93qu3Nb15Wt9tpWGeLQ39sQrPbuhzEEPJ5vbAs_TiaeWVhXCepDnmbKdbk7qvOG4uG>
X-ME-Proxy-Cause: dmFkZTFiQfgmecP1gicb/EXlcDFDTjX45oPJIhahuvBN7FBrY3avveBNBtQYeX5M1OD7LD
    NJVKSdEDOs0oDLaGfQWjnKMg38re03F5bk05lK0W55xEirZ0u6fCkYJpBp6EhVfK9iOCHs
    6/Qih2YX2AxAkRUqwINHraTWCKSWY4xWMo0epy0hPNAGndbvxsChuHXpXjw38DglOk8JzU
    EDLhM4SYajveFCj0DmYXHMi+eGHrJhlOoDzkZk4vFGd2QmbfB/ruIVKNmSEV8CVRItNeH8
    CEWPlOa8tkTfDaV0Az0MVCMV1/5o4FizAQTGiyiNUujULf0C8Qyx8m2mvBb8uG9Ij3IPrS
    w5diUEisHPKMZeaqmskQi0IsgZ9Pn8OnZHs2nlepwXsdLiBI42xYPyAEvJqLZyjGOBJv9+
    AEE3a0T09l5QqCqMgR+xz7osom5gLuSTSUQR/xMHiUulHH3SabBI2aNudq3HegDzah9rnF
    2w6Y5Ql2nwDeqiey6pNjtOzumGDGkTS7jPTyZMutrMWWnpK4T5dH0FQ5n6bbOmZneRbuFo
    T3Zoi8/oBuzPuMCaEIIlWDvDi8TuYbTPpsTEWhDVoBUqWjQshNF9v2uY0NUE3BisUgTQc4
    Fn2G16efoOSrvz0gJEjrzmKJblK+fUCZ9qzihE55AA0veTX+978rQxUkM5hQ
X-ME-Proxy: <xmx:KeGBatHnvjxPXcYUbUyj7DQ3ZfmPoeM1SVBH3PhZ4phfMd7fY9FqWA>
    <xmx:KeGBarT3AD5hl4xvGaQYRt0zlAmsMZPhfeGXHOUyC0gCMaw4YSJFIQ>
    <xmx:KeGBahEbfVS8Lziu9kuGS3XLbwCSc3qqaM0g-EIcTiJaMwyrY2p_9w>
    <xmx:KeGBav9-1uwSOJGUJkbJuxh66cszqt0TjsRCdlgLmrXsItpBGb15yw>
    <xmx:KeGBagAqkcx4u2uDQpE31Ri0CYia_kptKVwJv4RvIbrqLDxGZB7hb1RK>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Aug 2026 12:11:20 -0400 (EDT)
Message-ID: <d4ac1aaa8a112f3c30c8be0ccddad6dc7f81f6e4.camel@pbarker.dev>
Subject: Re: [OE-core][PATCH v3 8/9] cve-exclusions: set status for
 CVE-2023-6238
From: Paul Barker <paul@pbarker.dev>
To: Junjie Cao <junjie.cao@linux.dev>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 16 Aug 2026 17:11:19 +0100
In-Reply-To: <20260812072842.1176341-9-junjie.cao@linux.dev>
References: <20260812072842.1176341-1-junjie.cao@linux.dev>
	 <20260812072842.1176341-9-junjie.cao@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 16:11:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243533

On Wed, 2026-08-12 at 02:28 -0500, Junjie Cao wrote:
> NVME_IOCTL_IO_CMD and the io_uring passthrough path accept a
> metadata length from userspace without checking it against the number of
> blocks and the namespace metadata size that the device uses to size the
> transfer, so the device can DMA past the end of the buffer.
>=20
> Kanchan Joshi posted a stopgap removing unprivileged passthrough,
> reviewed by Christoph Hellwig and applied for nvme-6.6:
>=20
>   https://lore.kernel.org/linux-nvme/20231016060519.231880-1-joshi.k@sams=
ung.com/
>=20
> It was then backed out. Keith Busch wrote "I believe this large change
> is a bit too late for 6.6 ... It's backed out now", to which Christoph
> Hellwig replied "We leave an exploitable hole in, so I don't think
> waiting any longer is an option". No replacement has been merged: the
> commits the patch would have reverted are all still present, and
> nvme_map_user_request() still passes the user-supplied metadata length
> straight to blk_rq_integrity_map_user() with no cross-check.
>=20
> The exposure was introduced by
> 855b7717f44b ("nvme: fine-granular CAP_SYS_ADMIN for nvme io commands")
> in v6.2, so branches carrying older kernels are not affected. Debian
> reached the same conclusion independently, marking the older suites
> "Vulnerable code not present":
>=20
>   https://security-tracker.debian.org/tracker/CVE-2023-6238
>=20
> Red Hat rates it Low because the device node is root-only by default:
>=20
>   https://access.redhat.com/security/cve/CVE-2023-6238

The explanation is confusing here as it misses what actually introduced
a vulnerability. NVME_IOCTL_IO_CMD has always passed through metadata
length without validation. Commit 855b7717f44b allowed less privileged
users to issue NVME_IOCTL_IO_CMD if they have write access to the nvme
device node.

We don't need to recount the story of the patch being applied to the
nvme tree then backed out. It never landed in mainline, that's what
matters.

>=20
> CC: Paul Barker <paul@pbarker.dev>
> AI-Generated: Uses Claude (claude-opus-5)
> Signed-off-by: Junjie Cao <junjie.cao@linux.dev>
> ---
> v3: no functional change since v2
>=20
> v2: https://lore.kernel.org/openembedded-core/20260803084827.1348810-1-ju=
njie.cao@linux.dev/
>=20
>  meta/recipes-kernel/linux/cve-exclusion.inc | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/meta/recipes-kernel/linux/cve-exclusion.inc b/meta/recipes-k=
ernel/linux/cve-exclusion.inc
> index c4a9dea..35e0a66 100644
> --- a/meta/recipes-kernel/linux/cve-exclusion.inc
> +++ b/meta/recipes-kernel/linux/cve-exclusion.inc
> @@ -244,3 +244,11 @@ treated as a defence against local attackers"
>  # https://syzkaller.appspot.com/bug?extid=3Dea7ed3bb2f444cb4dfeb
>  CVE_STATUS[CVE-2023-3397] =3D "unpatched: no upstream fix merged, the \
>  affected fs/jfs txEnd()/lmLogClose() unmount race is unchanged"
> +
> +# The user metadata length is not checked against the length the device
> +# derives from the command. The fix was applied to nvme-6.6 and then bac=
ked
> +# out; nothing has landed since. Kernels before v6.2 predate unprivilege=
d
> +# passthrough (855b7717f44b) and are not affected.
> +# https://lore.kernel.org/linux-nvme/20231016060519.231880-1-joshi.k@sam=
sung.com/
> +CVE_STATUS[CVE-2023-6238] =3D "unpatched: the proposed fix was applied t=
o \
> +nvme-6.6 and then reverted, no upstream fix has landed since"

Recommended wording, links and include triage date:

    # Triaged August 2026 - Issue was introducted by kernel commit 855b7717=
f44b
    # ("nvme: fine-granular CAP_SYS_ADMIN for nvme io commands") in Linux v=
6.2.
    # Linux 6.1 and earlier not affected. Unfixed in recent Debian/Ubuntu r=
eleases
    # which use affected kernels. There was a fix proposed, but it was not =
merged
    # to mainline.
    # https://security-tracker.debian.org/tracker/CVE-2023-6238
    # https://ubuntu.com/security/CVE-2023-6238
    # https://lore.kernel.org/linux-nvme/20231016060519.231880-1-joshi.k@sa=
msung.com/
    CVE_STATUS[CVE-2023-6238] =3D "unpatched: Proposed fix was withdrawn"

Best regards,

--=20
Paul Barker


