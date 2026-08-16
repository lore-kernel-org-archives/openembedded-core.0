Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E79CCC5B572
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 16:00:46 +0000 (UTC)
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12318.1786896040708557051
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 09:00:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=QSLqsCc3;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=UIxHrdop;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.157, mailfrom: paul@pbarker.dev)
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B35911400101;
	Sun, 16 Aug 2026 12:00:39 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Sun, 16 Aug 2026 12:00:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786896039;
	 x=1786982439; bh=ldqRA7WoMP1o+tVfOu6ONjVNDTgMfCa3jwL5DfxxQ2w=; b=
	QSLqsCc3YLt9yO7Esmdg+1pgp5x6g/U6waQ+idyJzX4PxCgaAaLcyra2F9nrc21E
	Sx+Fr/edHj+rE9BXBuQ2ilkAz/n3/IhQnRFW/8tKwx8R/aZoo39RXqO/cOpSKU+y
	gkVXvslP4VDowL2XnX4C5/XBZghLSieq8mYPx8zNDC8ebJAo7TeFDEjCTWSb2MTq
	EB229SxRLWE7GjilNtWEADIbp0eEivcGsfpGFuGBbgrOJ9bim1odk0e6LfcRF7KJ
	i0ahGIaMi1LilnCSSDjo4SuZpA/Xpbfjc5Ihy5gWih7b54wGoD29HlhISOZrPHeq
	2CK+82tDBkbNWsgzbAXyoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786896039; x=1786982439; bh=l
	dqRA7WoMP1o+tVfOu6ONjVNDTgMfCa3jwL5DfxxQ2w=; b=UIxHrdopz5mrnJWdp
	1zP4zHXlYwhuB0q2ns76SIj+TCBdEDBt3NCP8S8zW7GNwloqL0P5VghLl668Z+pL
	rGplocde4LO1sTIEZUhi0poOPZEzrK3kdhwBqI5DBVUDjoEbFr1bW8MXp43eDFUX
	5HpRNcF0hks/R/gvbkKq8bVe5Gsx5PbTXoxTWxZXJcX5x+dHYrEMuOJSFYM6Jbd8
	Z34KJyR+J38xR9ehy7UrIbKu7kje9ohGtFHK0+z8OEoaE080rKf+L6rVsAunDDCu
	ThwH0ioDe0qP3/b3i4E76zVn/LGCq0EJEnvZFogQzLuktVoDcrEMffprO9z+224/
	vXZqg==
X-ME-Sender: <xms:p96Baqu11cPOmWCyko_zXO0bADMymSmbkqOu-JLCJmrknJBC42UaxA>
    <xme:p96Balebbf-b13ezdMdCdCumr9xwhveAOqKdTX6q9MNqgwG-ZHVXJWe7akExmI93R
    U-hCsNBX3ug7w8oLSgrzySw8TKEwEwU9vIOQkroTEsR2XcXBbuyDbCT>
X-ME-Received: <xmr:p96BajZEuBXeRsGEPz-l-0NgI4nBU7-kugXWIO-KqFLPBHYUAhbSEgWeAP07JRXUJ0TKw5rMd4S1t04MGDmfsSGpJpR3aXRV41Qi09rJ89HJ>
X-ME-Proxy-Cause: dmFkZTFt/pq2bHW9iLbFesE4uaRaPH+js19Ka7FklL05ULOuFxe2p1LDMJ337n/W1yMIN+
    lEoXPRt+Kv2hFkmND2uSOaH8/KBvSMy+tq4Z43FhKDSCcUE3aFvN/TXhK/5kpZkQrnh7DI
    phO4exuy0JxkmLMeVgJpklG/ec3eEQbOGvRQ45Zy3Zehw9EDcMJs0NfVHaMz6YwIA7tBLt
    pjK1N6Xww9pdkEGzZd/gsbzpGOwiGOkJfZgT0RfezC/JthM1J9UxJa7m0A7uREXH0HJyBA
    3ql3STuscbr8R8LZQAQ3YEjEqSts0etbeLDvSCLkzRFf2sPu4SpV7ShtwZb3F5sqVM/rUL
    iQ9+9EFQofQZjCCuV7JMYhp+7Dofd2hzh2Ux9Rtc2nnVjbJXx6ms4D5+eI9OZRJ33l3qJA
    jO+hj/F1Z1ZVknrY+RQAY3Ue+KKyKbFCjOGpu5Wtrp/NWVcveiVP5OVsxvHzYBW3OG/vqC
    kVVp/nSPsiIUUVdXwSr66xEgv5KU5l2A+APHZSVAvNlW84t2aPaPgVij4qJzpmbXVovG9S
    4kMeCDfdHqzXhK7vow0GsLif5fyT0AezgyQ4Z8Ggui3Exjtgib1tsBaUdnZA8Zkp8IH870
    dPtSUxV9cIy6zXjo9MSTltppmojGnWLTbuGdxRSwljRZ8eX/iDvmkAAhFLAg
X-ME-Proxy: <xmx:p96BagXYX6qAwLEqkOl1wus89ydQceBgmtd3oyxj7zrjO7eJ61Htbg>
    <xmx:p96Batj1RQslcYDZQVbH1JdKiuP41I9fAzo23wgYJb1UyIVM7V20LQ>
    <xmx:p96BamWoYTheffDtti5Ho01crNKHxU7WXDUawQ05i3NkxQhygeKB2A>
    <xmx:p96BasMjkG1LBDeDOmdLfDUA3VkIS6RVVCWrA-f_5lVu6uHhgOZ2JQ>
    <xmx:p96BaiQKhE_cX65-5kJYVCjnWhIOg6nvHrTEOlmuxFRGemwj9jeZVgN8>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Aug 2026 12:00:38 -0400 (EDT)
Message-ID: <4f7e2108248055e7ff9d8eb82086d745ee20fdea.camel@pbarker.dev>
Subject: Re: [OE-core][PATCH v3 6/9] cve-exclusions: set status for
 CVE-2022-4543
From: Paul Barker <paul@pbarker.dev>
To: Junjie Cao <junjie.cao@linux.dev>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 16 Aug 2026 17:00:38 +0100
In-Reply-To: <20260812072842.1176341-7-junjie.cao@linux.dev>
References: <20260812072842.1176341-1-junjie.cao@linux.dev>
	 <20260812072842.1176341-7-junjie.cao@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 16:00:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243531

On Wed, 2026-08-12 at 02:28 -0500, Junjie Cao wrote:
> KPTI clones the kernel entry text into the user page tables at its
> KASLR-slid address and, on CPUs with PGE, sets the global bit on those
> PTEs. The mapping survives the CR3 write on kernel exit, and a local
> attacker can time prefetch instructions across the kernel range to
> recover the KASLR base in well under a second.
>=20
> Disclosure and write-up:
>=20
>   https://www.openwall.com/lists/oss-security/2022/12/16/3
>   https://www.willsroot.io/2022/12/entrybleed.html
>=20
> The disclosure states that after discussion with security@kernel.org and
> linux-distros "a fix for this is currently not available", and none has
> appeared since; arch/x86/mm/pti.c still clones the entry text and sets
> _PAGE_GLOBAL on the cloned PTEs. This is an unfixed issue, not a stated
> wontfix - Debian notes "Ignored upstream and KASLR is not expected to be
> resistant to local attacks", Ubuntu has it deferred since 2023-01-10:
>=20
>   https://security-tracker.debian.org/tracker/CVE-2022-4543
>   https://ubuntu.com/security/CVE-2022-4543
>=20
> 97e3d26b5e5f ("x86/mm: Randomize per-cpu entry area", v6.2) randomizes
> the separate cpu_entry_area; it predates this disclosure and does not
> change the offset of entry_SYSCALL_64 from the KASLR base.

There's too much unnecessary detail here. Drop the mention of a commit
that doesn't fix the issue, you don't need to say "not a stated
wontfix", etc.

>=20
> CC: Paul Barker <paul@pbarker.dev>
> AI-Generated: Uses Claude (claude-opus-5)
> Signed-off-by: Junjie Cao <junjie.cao@linux.dev>
> ---
> v3:
> - use "unpatched" instead of "upstream-wontfix": the security-team
>   discussion produced no clear wontfix decision
>=20
> v2: https://lore.kernel.org/openembedded-core/20260803084827.1348810-1-ju=
njie.cao@linux.dev/
>=20
>  meta/recipes-kernel/linux/cve-exclusion.inc | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/meta/recipes-kernel/linux/cve-exclusion.inc b/meta/recipes-k=
ernel/linux/cve-exclusion.inc
> index b08eaa1..a909aef 100644
> --- a/meta/recipes-kernel/linux/cve-exclusion.inc
> +++ b/meta/recipes-kernel/linux/cve-exclusion.inc
> @@ -229,3 +229,11 @@ was never substantiated and was closed as not-a-bug =
by Red Hat, SUSE and Debian"
>  # Fix https://git.kernel.org/linus/d860d1faa6b2ce3becfdb8b0c2b048ad31800=
061
>  # Fix https://git.kernel.org/linus/da9c9c877597170b929a6121a68dcd3dd9a80=
f45
>  CVE_STATUS[CVE-2022-1247] =3D "fixed-version: Fixed from version 6.17"
> +
> +# "EntryBleed": KPTI maps the entry text into the user page tables with
> +# the global bit set, leaking the KASLR base by prefetch timing. Discuss=
ed
> +# with the kernel security team; no fix, KASLR is not treated as a bound=
ary
> +# against local attackers. Distinct from CVE-2023-3640 (cpu_entry_area).
> +# https://www.willsroot.io/2022/12/entrybleed.html
> +CVE_STATUS[CVE-2022-4543] =3D "unpatched: no upstream fix, KASLR is not =
\
> +treated as a defence against local attackers"

Suggested wording, links and include triage date:

    # Triaged August 2026 - "EntryBleed", discussed with the kernel securit=
y team
    # but no fix appears to have been published since then. Debian says "Ig=
nored
    # upstream and KASLR is not expected to be resistant to local attacks",=
 fix
    # deferred in Ubuntu.
    # https://www.openwall.com/lists/oss-security/2022/12/16/3
    # https://security-tracker.debian.org/tracker/CVE-2022-4543
    # https://ubuntu.com/security/CVE-2022-4543
    CVE_STATUS[CVE-2022-4543] =3D "unpatched: No fix has been proposed"

Best regards,

--=20
Paul Barker


