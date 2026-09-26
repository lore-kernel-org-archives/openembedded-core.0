Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E18E1C98332
	for <webhook@archiver.kernel.org>; Sat, 26 Sep 2026 14:42:59 +0000 (UTC)
Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20613.1790433770248428929
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Sep 2026 07:42:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=Ke+2uyqI;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=qVYhAFuf;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.157, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 3EB1A7A0073;
	Sat, 26 Sep 2026 10:42:49 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sat, 26 Sep 2026 10:42:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1790433769;
	 x=1790520169; bh=7/RXDppv3CkDZ+nxnQ3IpZ5Bw8cFGQji4CwWZAAWuvY=; b=
	Ke+2uyqINZbxClgP1CmpemoNf7FKCycRzgcpNGIqfCGE4Is/m5EdzCS7SzIgMJpr
	Urr4QtVf5S9ZrwxnN8OYRycMkiZ+QIzWL7Ahg6fCPZom1DblHaQQpQ+vNlBRznpO
	hrNQpB4TyF3Q/TG0msrXzZ/wKfmt5+Zb/8Xa+2ZZWkN40omsTcsINV/UTprpBRks
	ONR7mwJ28sStT8L6SGHPEljfxvE8qlxMbJytMa+bH72jsya6WaeZ4YuFmhEnYl5I
	8r+PKIfcJG/KccjHSznkqVVjuFY6PwQzuIbE6LtX/dS9tOebmxSnwhoh92tklqwt
	My1R+0IoRRxb3HV5f/NJvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1790433769; x=1790520169; bh=7
	/RXDppv3CkDZ+nxnQ3IpZ5Bw8cFGQji4CwWZAAWuvY=; b=qVYhAFuftedoGWpr8
	pdUF3RlQwOIAONUdk1rOC186gGWHFuey5H5hNAjv0rRKg70qYqiJ/QMeTGcIAa1U
	VQq/tgWYqkr/Lt3WlnJZk754XNpN+5dnxyg//5ydTW/edphM5rnUtHtPQ9hrlhBj
	45ChjbAju8c/A/qv/CkaklmkKf0FI6nNrJjFSHQd875v7SbWkAvFcvR0w3hbQvDc
	uG458j4E011yihXh93LkhkDW/L+4fU72OMxVpAmSU3IZQUtvYpu7j92XZm4g88Rg
	wDM0RXXt6kZOn2ZgGll6NlXQPT+8V/LY7Thtv1PIkkgHLghO+FzseoDlZDwTUkoV
	/mx4A==
X-ME-Sender: <xms:6Nm3arj27f6MrQw6orxJMmTnllFtBa1aiIfBY8Oh7bCt4b77G1NyiQ>
    <xme:6Nm3al-ldYD8mtWDiU2B3IFYpobiZpsqbvZI4vtXynFOIMZL3Wi94_7N2Om6LkT9H
    FIQ_F-PXuQV2uUvkSVpQauqGkgggnS9CiDFSKbRuy7gX82625L6SQky>
X-ME-Received: <xmr:6Nm3aipBBSS6T_n1iXbGyPftMKww0-Ft8uSB9ss9Wxyy_UtgzQeD25MXCscEy8tJ2-Yu_tMk_VMyY1nfUArcmhpKmSygNsSj-5O-oR8>
X-ME-Proxy-Cause: dmFkZTEjX8VSJdL5EXr7DO454Sa3My8SqKRu7pddbkhbhrKG16TxU73PPRSPcZb5tVFzSa
    AKkXivXRE8OzVv1EWv+Aw34TS8dguMO2BiCYtQiRQTpsAAP1dTgRkVMI/8/aX89+vEuILS
    cL5BliuM35xkEb7tksxu1+oTmiJCmvtFad670YAUEFzO8Y2aZeDnAMLRnTwb4Bjhn7N0Sf
    Spy9ifukHiJ0xP9mTEPJ/37EmSA0a/Vj86c4Grqj1kpDUocQO9wW7FwOdnzjR6ZZbMNXXJ
    Kotw6c3FyL5OudPJEhvhvkLGYH5IMDXBax4cr/Y4gRyUlWC4eGYIojf4NTWWhEvu0R/8Kr
    +OoHgKjVyJNzp6AYiYXcbg0FKcXC8fnUDZBm4yPTxgzfzvdxtTGwVQ/93vha5BFbmBrBL5
    tTl1bc+4NFGzAYMng2Shmar6ckXzTW+GEixDXzS276X28k6I9BycVo+Sd8DqaOIIItm4+Y
    DzCIsPWFvx4sORl0TwDyWsc0rbNRmDxtkg+KQ+ltP1gYVv2XvxLCN/HEaOicC/FnDgxOW2
    ztX+WKUx57MWAC8iMxuC52tEh2/h6WTitIWAdpHRFWgZdfzFI/xqGN//y3eQjYIz3gYn0I
    lpWQiMUVQSW57jSRNZcrnoHVUPiHBwgewH+pOVPmioI7KqJTKAHNqB4FdH+Q
X-ME-Proxy: <xmx:6Nm3ak9mGCtltq2msdZYa_8ryPu-6io00HJRkW10jlHZK9nCJtIerw>
    <xmx:6Nm3amU8t_MmImEBj3Mog_Df0GNEPGTKIlc57CMVhriOy3tXtl8y-g>
    <xmx:6Nm3aqBsNVr5gyeV6BbrCOQw3dMN6p83YqTiMiSgPLMJ_YKSyG-hcQ>
    <xmx:6Nm3anwIVYDbvZLwVOGu35VrbRDzCRijMGc_QKLR1xI09Ejv_caOWA>
    <xmx:6dm3alnHwRSSRAQMhPP2BFF2KImzSoBH1W21l5a-UMN6jAI-apg1RKsA>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 26 Sep 2026 10:42:48 -0400 (EDT)
Message-ID: <97a1e21f11d1da169b33b5b64f8e18e06eaf67a2.camel@pbarker.dev>
Subject: Re: [PATCH] initramfs-framework: retry LABEL lookup before coldplug
 fallback
From: Paul Barker <paul@pbarker.dev>
To: Wenwen Fu <wenwfu@qti.qualcomm.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 26 Sep 2026 15:42:46 +0100
In-Reply-To: <20260923062512.333252-1-wenwfu@qti.qualcomm.com>
References: <20260923062512.333252-1-wenwfu@qti.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Sep 2026 14:42:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246638

On Wed, 2026-09-23 at 14:25 +0800, Wenwen Fu wrote:
> The root-only udev path can resolve root=3DLABEL=3D before the storage
> device has registered. This makes the lookup fail and causes an
> unnecessary full udev coldplug.

Hi,

This suggests that using a root device only udev trigger is not as
robust a method of ensuring that the device is ready to be used as we
thought it was. Adding a retry loop with a roughly 50ms timeout may be
sufficient for the boards you have tested, but it isn't a generic
solution.

If we're carrying support for this in OE-core then we do need to make
sure that it is generic enough to work across a range of hardware.

>=20
> Retry the lookup five times with a 10 ms delay before falling back to
> the existing full coldplug path.
>=20
> Fixes: fda394c2b91b ("initramfs-framework: support LABEL with root-only u=
dev trigger")
> Signed-off-by: Wenwen Fu <wenwfu@qti.qualcomm.com>
> ---
>  .../initrdscripts/initramfs-framework/udev    | 33 +++++++++++++++----
>  1 file changed, 26 insertions(+), 7 deletions(-)
>=20
> diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/udev b/m=
eta/recipes-core/initrdscripts/initramfs-framework/udev
> index 85c5ba1178..fbf1b98d56 100644
> --- a/meta/recipes-core/initrdscripts/initramfs-framework/udev
> +++ b/meta/recipes-core/initrdscripts/initramfs-framework/udev
> @@ -35,6 +35,31 @@ udev_enabled() {
>  	return 0
>  }
> =20
> +udev_resolve_root_label() {
> +	udev_root_label=3D$1
> +	udev_root_label_retries_left=3D5
> +	udev_root_partuuid=3D
> +
> +	# The block device may still be registering when initramfs starts.
> +	# Retry up to five times after the initial lookup, with a 10 ms delay,
> +	# before falling back to a full udev coldplug.
> +	while :; do
> +		udev_root_dev=3D$(findfs "LABEL=3D$udev_root_label" 2>/dev/null)
> +		if [ -n "$udev_root_dev" ]; then
> +			udev_root_partuuid=3D$(sed -n 's/^PARTUUID=3D//p' \
> +				"/sys/class/block/${udev_root_dev#/dev/}/uevent" 2>/dev/null)
> +			[ -n "$udev_root_partuuid" ] && break
> +		fi
> +		[ "$udev_root_label_retries_left" -eq 0 ] && break
> +		udev_root_label_retries_left=3D$((udev_root_label_retries_left - 1))
> +		sleep 0.01
> +	done

It's unclear here which step actually needs to be retried. Is it the
findfs call or the search for PARTUUID in the uevent file?

> +
> +	[ -n "$udev_root_partuuid" ] || return 1
> +	root_match=3D"PARTUUID=3D$udev_root_partuuid"
> +	return 0
> +}
> +
>  udev_trigger_root_device() {
>  	case "${bootparam_root:-}" in
>  		PARTLABEL=3D?*)
> @@ -47,13 +72,7 @@ udev_trigger_root_device() {
>  			# The kernel does not export the filesystem LABEL in the
>  			# uevent, so resolve it to a device node with findfs and
>  			# match on that device's kernel-provided PARTUUID.
> -			root_label=3D"${bootparam_root#LABEL=3D}"
> -			root_dev=3D$(findfs "LABEL=3D$root_label" 2>/dev/null) || return 1
> -			[ -n "$root_dev" ] || return 1
> -			root_partuuid=3D$(sed -n 's/^PARTUUID=3D//p' \
> -				"/sys/class/block/${root_dev#/dev/}/uevent" 2>/dev/null)
> -			[ -n "$root_partuuid" ] || return 1
> -			root_match=3D"PARTUUID=3D$root_partuuid"
> +			udev_resolve_root_label "${bootparam_root#LABEL=3D}" || return 1
>  			;;
>  		*)
>  			return 1

Best regards,

--=20
Paul Barker


