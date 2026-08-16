Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21251C5B572
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 09:35:15 +0000 (UTC)
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7257.1786872907865466331
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 02:35:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=NpeVYhfO;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=C6np9U0s;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.155, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 5675D7A00B4;
	Sun, 16 Aug 2026 05:35:07 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Sun, 16 Aug 2026 05:35:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786872907;
	 x=1786959307; bh=zH9fGVXu3UoFoty0FzjtDGe+YXJujYOtpLXIaWMZj7U=; b=
	NpeVYhfOS6SmDZD+iiY8inE6SLuxBgfwIrwTu8byAz/W7qed8/RYCoMPjLqCk9E8
	GIdApAqSslVgf3RxYiZEj4uCMmmgFE6IW7R+t/Lv5tE2va8O6BwS0ydidlMmxODR
	UI2trf48Ti7DQ6EZhx+nv4Alk6Ambfw/N1Gu0xSw/Q4386Y/jXrC9G+eG9yCDp6g
	r7ixqNrAjIHUSQZIsQh61EGzYmVWAs1e1u9QYHErj4URtF1ZyuE/1+OnxR7xIUv5
	ms/ifHuQxkcDDsNxI7+78iGoJpycwAoGqDojMC1bJVinqOV8piMiUpO3QkGxFUug
	6yvIiwihkWzXGmyUwaV+GA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786872907; x=1786959307; bh=z
	H9fGVXu3UoFoty0FzjtDGe+YXJujYOtpLXIaWMZj7U=; b=C6np9U0shrqxUEYXH
	vSZK4/7XplBhCKVS5WhPi0VaOYl4UcEfaXNv5kuag9k2ib5EQIPBQPJDBAFyc7Oi
	g+oqREFBUqYCLEnVXSN7bCyxjkDbbNGRcaeGmFek59TW1bW7f1V9lO7rgSBZ7Gq1
	FvIQVQbVhkxU8U1IiAoRdDonaUV88KY9Habmg3OwiuERdTN0SwmJcdcCMIlTNzSV
	ow5SBtdxLmeZ8uhzWuY1HoA66WzMIWbPWDBpG7xyzBUG9TM1V0gAdcgSGVVWxBKo
	+4b6YyLRwQFzpwTHEBtHDSXX9oYu0YwCQaYzJVNDaAIedb+d9DZqeXIICO283IUC
	QLbLQ==
X-ME-Sender: <xms:S4SBanFHqxKbia_zMSSiEnWJxXiptKud16QCD-BbMH95aj3ALMDL5w>
    <xme:S4SBaqWQ3If-XSvi-yv8Of-L3X2yFlWbPbt0JIvI6AIODcLTUos5zKjf1f5ukGI0e
    LTkCVS5c-CVnEK-UkrJHOL3jyBen8DXSgRJ3Na67JZTOjTNOGbBLgvd>
X-ME-Received: <xmr:S4SBamzKQqUSBcpuccfU23MXRI0Qw_K0ERo9gkKfXk_Gpmw4VUcKbjlw0DnnhKdEPgbE1wivfB1Jli4roj5XjEI3zvH6GT1J0iDHnRGFfdbt>
X-ME-Proxy-Cause: dmFkZTE2XA6qc7GC3IqaTcS952GvXSLnoGuTxrcwSnPVo9/hBsa2qrHEwl07SNd43GGnMH
    ei0D4xyQfYY8wKHO/FX2VKK/zpBjFGXci5LJVKOz8PV+ADsrV+YPDJq8SEfx3JW3VNhfeJ
    Dgnmy8s10U3fZppTXM1KJiFqIEGTMkj8VRhByKhzaF36zxmlPE92m3SYTJFLQgOG7OuvrD
    cgtfl2tn6BD6RFiMPvEiQsF9MQnpPXFwNCGc44AmIF126fKFyY0M255OwicG2QOEjmOoLM
    BVsqFN6PEkHKuAdUa36MPnOEWEBQhTUIlGwECK3OLaoX2OjSSKHDeW7RgP7/U5CTisJPSM
    xsyLo8fGmrxChAvBwdLYnQ64KBYnK28R9cetVp3YhyARVBwVaDZ6aF/ZiXPSejRtlPoFMh
    vcg+qeYp1W63IuROdFKdhBfMhWp6AupgO/jltedOrAZG4vVjqseRaikoZk8yItMuXFtQo1
    6+v2HNE2kuxAhTngQP2KVMuvShoTDYRQrkcYmGpRWCiAePZHte8evu6S2h70PMHKTYMV0B
    +oN7qf0at1y05eCsb9i/PQ4D4bJ7dZ99PWcocsm7robwJ4r7mQ34J1fdvIaXD31KJ4oc2A
    B6+TYjpal7CMKJIyDMkJ9H6Hs/QGbamLOByLemKsj2Mlr3+rSFiQ4rr5GIgQ
X-ME-Proxy: <xmx:S4SBagOBt8pBtRAEqMSqL_UCfP0yZQUM9roRZnCJlflUlz5TFVP9Pg>
    <xmx:S4SBav4dlaAHWWugUNZ7t_dsX5FSCTeD67lLRlucCdbDJUbqT09CBg>
    <xmx:S4SBapPkL-BPNbXmbSkCYpg2eJ8GruG_yj9XEJGm9M2xcq3Kvq-kaA>
    <xmx:S4SBalkX2YjXtuaLAAebshRvmrRFogjHZoGiTVFSGCHUMwRw2PBnQQ>
    <xmx:S4SBahvam-jtiYhDMvQmLKO3G5suPy-smf-MrjtNetlJz-dSL5gln4ES>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Aug 2026 05:35:06 -0400 (EDT)
Message-ID: <1ae24cc1f9ab292cbc5bc02068feee6cb7a5d77f.camel@pbarker.dev>
Subject: Re: [scarthgap][PATCH] libarchive: fix CVE-2026-14164
From: Paul Barker <paul@pbarker.dev>
To: daniel.turull@ericsson.com, openembedded-core@lists.openembedded.org
Date: Sun, 16 Aug 2026 10:35:05 +0100
In-Reply-To: <20260727073454.2019759-1-daniel.turull@ericsson.com>
References: <20260727073454.2019759-1-daniel.turull@ericsson.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 09:35:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243508

On Mon, 2026-07-27 at 09:34 +0200, daniel.turull@ericsson.com wrote:
> From: Daniel Turull <daniel.turull@ericsson.com>
>=20
> Backport patch to fix CVE-2026-14164.
>=20
> References:
>   https://nvd.nist.gov/vuln/detail/CVE-2026-14164
>=20
> Upstream fix:
>   https://github.com/libarchive/libarchive/commit/f774f03b40cb109348e5c6d=
52b59c864e3cfa8e8
>=20
> Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
> ---
>  .../libarchive/CVE-2026-14164.patch           | 52 +++++++++++++++++++
>  .../libarchive/libarchive_3.7.9.bb            |  1 +
>  2 files changed, 53 insertions(+)
>  create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2026-=
14164.patch
>=20
> diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2026-14164.p=
atch b/meta/recipes-extended/libarchive/libarchive/CVE-2026-14164.patch
> new file mode 100644
> index 00000000000..c94764acf29
> --- /dev/null
> +++ b/meta/recipes-extended/libarchive/libarchive/CVE-2026-14164.patch
> @@ -0,0 +1,52 @@
> +From 5efdd23ea2569314d62492bdc0b078f4dad1f75a Mon Sep 17 00:00:00 2001
> +From: "Dustin L. Howett" <dustin@howett.net>
> +Date: Sun, 24 May 2026 12:43:00 -0500
> +Subject: [PATCH] Merge pull request #3071 from stoeckmann/rar5_doublefre=
e
> +
> +rar5: Avoid dangling pointers in init_unpack
> +(cherry picked from commit 42453cf16255800726b4efedab25138639ceef20)
> +
> +Conflicts Resolved:
> +
> +libarchive/archive_read_support_format_rar5.c (1 conflict):
> +- Stable's init_unpack() is a void function without the calloc failure
> +  checks (`if(...=3D=3D NULL) return ARCHIVE_FATAL;`) that exist upstrea=
m,
> +  since it predates that hardening. Kept the CVE fix logic (unconditiona=
lly
> +  setting rar->cstate.window_buf and rar->cstate.filtered_buf to NULL ri=
ght
> +  after free(), and removing the redundant else-branch that only NULLed
> +  them when window_size <=3D 0) and omitted the ARCHIVE_FATAL return che=
cks,
> +  which don't apply to this void-returning stable version.
> +
> +Assisted-by: kiro:claude-sonnet-5
> +
> +Changes from upstream commit f774f03b40cb:
> +  - libarchive/archive_read_support_format_rar5.c: adapted from upstream
> +
> +CVE: CVE-2026-14164
> +Upstream-Status: Backport [https://github.com/libarchive/libarchive/comm=
it/f774f03b40cb109348e5c6d52b59c864e3cfa8e8]
> +
> +Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
> +---
> + libarchive/archive_read_support_format_rar5.c | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/libarchive/archive_read_support_format_rar5.c b/libarchive/=
archive_read_support_format_rar5.c
> +index 736c95a6..098cd6f7 100644
> +--- a/libarchive/archive_read_support_format_rar5.c
> ++++ b/libarchive/archive_read_support_format_rar5.c
> +@@ -2489,12 +2489,12 @@ static void init_unpack(struct rar5* rar) {
> + 	free(rar->cstate.window_buf);
> + 	free(rar->cstate.filtered_buf);
> +=20
> ++	rar->cstate.window_buf =3D NULL;
> ++	rar->cstate.filtered_buf =3D NULL;
> ++
> + 	if(rar->cstate.window_size > 0) {
> + 		rar->cstate.window_buf =3D calloc(1, rar->cstate.window_size);
> + 		rar->cstate.filtered_buf =3D calloc(1, rar->cstate.window_size);
> +-	} else {
> +-		rar->cstate.window_buf =3D NULL;
> +-		rar->cstate.filtered_buf =3D NULL;
> + 	}
> +=20
> + 	clear_data_ready_stack(rar);

Same comment here as I made on the wrynose patch [1].

[1]: https://lore.kernel.org/openembedded-core/0447ebc9d29b0736de8ba0c75f15=
5ed4f880d072.camel@pbarker.dev/

The `return ARCHIVE_FATAL` paths are not present in libarchive 3.7.9, so
the function can't return between while rar->cstate.filtered_buf is
still a dangling pointer.

Best regards,

--=20
Paul Barker


