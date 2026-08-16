Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CD4EC5DF66
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 09:33:05 +0000 (UTC)
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7144.1786872776449243775
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 02:32:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=n20wAQLf;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=kNIUuXtn;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.155, mailfrom: paul@pbarker.dev)
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 808797A00CE;
	Sun, 16 Aug 2026 05:32:55 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Sun, 16 Aug 2026 05:32:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786872775;
	 x=1786959175; bh=BUYJY3eCkpAiZOVFNRgScaHr4xjXlEjcK21wKFkYniA=; b=
	n20wAQLfRMTFHthcZ96N9mqmWgBebw6zWs3N0EDnooMHQBMWYTtal8GhG0fJkkJw
	dA2xb3CniW01Uwb0ZdA1ZK5du7XlqobfdpE15H9gCU4/7mQlImP98nmgSSGYjMNh
	MFRSPZoLNCBL+uqDwIApzGpG3efCjD1+jBF9y5aNAnG/W1Bkd0nO5Fja+uIqzn39
	CfpGwAN1y61oJSlt3+MIW9k8Pa4dt1TWnfr5A9SVfqACwnYxB/Os9Jwh5wva5hTx
	JHzYbdT/JspzJ+kygqKf27vJZvVsXrQNhKrul7smNn8rVf17RKgsrsKvcViQ8MTi
	Y5jrObIzKYPW1PBRqi8O+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786872775; x=1786959175; bh=B
	UYJY3eCkpAiZOVFNRgScaHr4xjXlEjcK21wKFkYniA=; b=kNIUuXtnwK/mlmXVw
	vZ8NVkfmwOD5arIby/Q8fZLzIQQdiNnzpEgm09vw+uxdHchj7lmS2w1fDPBX/krq
	69jlrQ05SAU2AJ6RxYMLv3iAJLqjKWG7S1r8W1oKLMihTPLBwCKs83znkeTY4e1T
	brpHabO7CwVMNJTGS5Y7Y5LImks37llVvBDc0rqI7LZukbs6Z8GhpvWn72dqhDuR
	+aMfXtNiqfk/Ndeh34iJlreJ0ifZOfmyUDB4T0f3HMtSVTX+rXd1O22ahFfhXANr
	nLgWfzPPNpdxdKC9CIUjCzIy8m7fXEsUQpALn5UsnhAJW3tE6sONXf6okJKeaqPP
	CN4xg==
X-ME-Sender: <xms:x4OBalmCYJc5cgO0526PRAKUWeStuTOmch2t-WZWzgpZYK7H9NHM6A>
    <xme:x4OBam0V01lyrJ1kr8jcdLQ8UmDcKmtzW5F6cLBZG7MY4AJIRTYPDxV8dgKsg6QTy
    bRV7rii20LMkgMMmQaucvizQK8tlE_asOc8rEBdGv4VCtOo_DY9fIh2>
X-ME-Received: <xmr:x4OBapQD5V4415Z03MEIfqG_vkDqKFwEH_IxDrx4pheu3t0svAhN65HxK501BNsFVhUGNmKo5Pv7Q0y1RoeRqQWHg-ER_MdLNhaAz4jCKK9_>
X-ME-Proxy-Cause: dmFkZTExL0CXrQpK3cXnHD0smzG4VnHrMESs1ch2QF3GdQMRkxCHyBWpnpnuji/Xi4rbkZ
    uuyA1a/NtwEf8bL8UOI869QXxs7z4Hn0Hkm/nlSRT/fdeRTW5uhCjKDu3FuWVYnMlGPKAG
    bBWX653Js8PmAWYElof4ZDlXDRw2IlMkASyXg0GOAIaXtJJbmV5aap4b8PCMqGmOTPIBsp
    Sf+0LzfDZcHHA3oP8ssqLvOeKldirP7G0H11CuPVrboQPoPHm0K7ByRgYAbuWzs48A/Zc4
    JiVw76LFNgHHV1w0xhsrDiaIjW7cRCdHwRVT6x3uCv8VFlvF/6EtL7UQP1I0qs8BZ5Rqd8
    0mVaTg8xy5+dcZ/T5xsvW3dOee/cAx46HrF0l0Qetzhb2NQ3iBQuGZg+xTLL5NIXVey60Q
    HcNfT6T2KiF75A4zKgpZ+uvX9455WF5AGBYgju2AwKAAOkRbKZFV8qI37X3pxpTb3Z7/Z/
    MCC/mlrgwHP7olgEBQkE35BqrwBZrG/cD8QxzMqGhWnpHJZcj2lC13PWHu1UPZzR0zkeFg
    h+QotEamaSWtIdSasL+i44hiP4wnlWwmrn1khm1OVWR/6vZ4a5rUNKpkxW5N4XjqoB43WE
    LpysDLnfg5Ei94vfzYEt8gK6gX9glOnUVDVbY5ng/ExaWm4XVDCCHcHCIyRQ
X-ME-Proxy: <xmx:x4OBagvHA_VOoTyioryipaTnZxOaWHTtqLpUrw61vjg75PMCsQxDvQ>
    <xmx:x4OBamYfWqmFHC4eTWJ3dD18tDBXmxDrkMs96dQznsfX9J4WcSbL2w>
    <xmx:x4OBatvtNBf5fUek6ZF3n6XlnpFLz2UO2TAFhjqcowc-tmxeclxsOw>
    <xmx:x4OBagG7tHr6HvyzQt1e3mRGNM99J0GkQQEWem7tAziIGkTQtdE2CQ>
    <xmx:x4OBakPH2ZnL1ByGrQ6XaMkBmKNs3FkRubFAC7-uXVogkBkhq_9lxGp3>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Aug 2026 05:32:54 -0400 (EDT)
Message-ID: <0447ebc9d29b0736de8ba0c75f155ed4f880d072.camel@pbarker.dev>
Subject: Re: [wrynose][PATCH] libarchive: fix CVE-2026-14164
From: Paul Barker <paul@pbarker.dev>
To: daniel.turull@ericsson.com, openembedded-core@lists.openembedded.org
Date: Sun, 16 Aug 2026 10:32:52 +0100
In-Reply-To: <20260727073431.2019724-1-daniel.turull@ericsson.com>
References: <20260727073431.2019724-1-daniel.turull@ericsson.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 09:33:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243507

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
> Tested with ptest:
> Before: PASSED: 5, FAILED: 0, SKIPPED: 0
> After: PASSED: 5, FAILED: 0, SKIPPED: 0
>=20
> Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
> ---
>  .../libarchive/CVE-2026-14164.patch           | 53 +++++++++++++++++++
>  .../libarchive/libarchive_3.8.7.bb            |  1 +
>  2 files changed, 54 insertions(+)
>  create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2026-=
14164.patch
>=20
> diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2026-14164.p=
atch b/meta/recipes-extended/libarchive/libarchive/CVE-2026-14164.patch
> new file mode 100644
> index 0000000000..b734fc448f
> --- /dev/null
> +++ b/meta/recipes-extended/libarchive/libarchive/CVE-2026-14164.patch
> @@ -0,0 +1,53 @@
> +From edbac77e8e544286fe7581bc398781c949ee5a22 Mon Sep 17 00:00:00 2001
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
> +- The stable branch's init_unpack() already unconditionally NULLs
> +  rar->cstate.window_buf and rar->cstate.filtered_buf right after free()
> +  (the core CVE fix), but still retained the redundant else-branch that
> +  re-NULLed them when window_size <=3D 0. Removed that dead else-branch =
to
> +  match the upstream fix, and omitted upstream's added
> +  `if(...=3D=3D NULL) return ARCHIVE_FATAL;` calloc failure checks, sinc=
e
> +  init_unpack() is void-returning in this stable version and predates
> +  that hardening.
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
> +index 63dd97b3..271aa0cb 100644
> +--- a/libarchive/archive_read_support_format_rar5.c
> ++++ b/libarchive/archive_read_support_format_rar5.c
> +@@ -2568,12 +2568,12 @@ static void init_unpack(struct rar5* rar) {
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

Hi Daniel,

The above fix didn't make sense to me, so I looked in to the CVE. The
initial report [1] says:

    The issue occurs when parsing a valid RAR5 archive that exercises
    the filter path. During decompression, rar->cstate.filtered_buf can
    be assigned to a filter output buffer. Later, when libarchive
    processes a subsequent file and reinitializes the unpacking state,
    init_unpack() frees the existing filtered_buf but does not clear the
    pointer.

    If the following allocation fails, init_unpack() returns
    ARCHIVE_FATAL while rar->cstate.filtered_buf still contains a
    dangling pointer. When the caller later releases the archive object,
    rar5_cleanup() frees the same pointer again, resulting in a
    double-free.

[1]: https://github.com/libarchive/libarchive/issues/3069

The `return ARCHIVE_FATAL` paths are not present in libarchive 3.8.7, so
the function can't return between while rar->cstate.filtered_buf is
still a dangling pointer.

Let me know if you agree with that analysis, if so then perhaps we can
handle this via CVE_STATUS.

Best regards,

--=20
Paul Barker


