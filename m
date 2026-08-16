Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0E3FC5B572
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 15:56:06 +0000 (UTC)
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12054.1786895760776744243
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 08:56:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=o6iGHr2U;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=VaVxxpr+;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.149, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id C6864EC01E2;
	Sun, 16 Aug 2026 11:55:59 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sun, 16 Aug 2026 11:55:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786895759;
	 x=1786982159; bh=z9dtxD6/QuIECPAN/wdfs3zynC8UqcmETPeLrnoPG1g=; b=
	o6iGHr2UK3plkuRBiyVeqoSvUKtbzcNh79l/f7L9IV7r3kdW/PkUWX90ngoiGb5t
	btxYvQVYjyhBTXcziMbWhYkDvOUSH8JqSjVORjLL5EM9F+GlJMARlORhF7iQTDnj
	d+q5raeQrP20hwNB408lFFrF8zip9+P6r+vMYQYjB/2IhKZLAAh50romXZxcz+Au
	tOmtiZ4czhwq/EkO0jTynRqLlm/pbHgeVZRMSagEJDhVTvAHiz2912LygUBK2kB5
	lhD1J8i7wfLrAOjb2tIV93K3utFiaGfP4fMz3nRIUbpD9U8AmanPNCTk0O9ljjF+
	7e1QCCIrgxUi4R1Z5QaqfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786895759; x=1786982159; bh=z
	9dtxD6/QuIECPAN/wdfs3zynC8UqcmETPeLrnoPG1g=; b=VaVxxpr+D/xBN0Wtc
	w//FhD8k/g1FNok6SyneBZsi4QHsUQnaoqJa/GVwuzC4okX+7i16CPEtrhEX0/br
	y6qlVq87z/EV3vTIuFRpiHAJIXLxE27w7KTcskcYMFIXGZW62vZdOm3AAu/Hghiw
	8iXvJl+G1D/VsN+5K/C35gZ/toYIFXvtu1HJPh1rbfPQik1+MlrcL3xAy7xgNPUV
	j6Q5TgPtq15BoqxlWdWdzEGipbT+CazD7TI5ga7lkqodx1D79VPZ5dQo25y1w2/V
	QJXm7wXxfABUjEdH21DYDe2VVKYQJ8JyEeW8Cthp/R7ZyryFDNDrI5RK0ukLDv0T
	vILbQ==
X-ME-Sender: <xms:j92BamdV2zx0y9o02q0wMtMbkwyn7Ob5xx1gyPjxPYENlHfw5_2pVQ>
    <xme:j92BagbdWjnB47rRSYgHnk0qNoB9ETQi7QBskFPiNEJfN_FC5DcjfkwsKijwzFUjw
    MBwi9as_hjDCzIeqjb4iwQYd6GksxuIFCH0VdpsEE6xqr0Mwgb6VJlk>
X-ME-Received: <xmr:j92BapXIpSvgWZfiWV-rtNu4OXZ_houhGgov91SCLbMteJyI3LWTL-Ygk3cNiwkwExQSmJi5Gv6-mqMX1dyiRsNf_k4tXdpevym6lx8Psj-H>
X-ME-Proxy-Cause: dmFkZTE1tLnYMtIMvZYD3AnqUV5s3peNCojvuwWxSwmwqQh7hC6zXkt+E1K7HWijSueGoU
    ns+dobxDjYmx9NT0nRPed+6fjwrEo9afcVzb8jnCvO0joK1hHjUxa7InTKPt+OdKEhiGKu
    B59LouOuPcWpZzklMyo05/cUnGYMBpoa5cvzgQIfOMlY9C33ekpp4vWLNNRPJZ9X+S/yxm
    ZAnNfM3cq7ZsuRbeuJKSh4oQilGZtjuMv+uqZVFVkttOzucMcy+2IacrgiD5qkzF9i3R7n
    NFZrKWlk//mDnaG378fF8daRAn1tbTizzRwyl4OBeLzrx40cyztvRHGahHb6ge+MGkSOmh
    2BLwgIvCsqIwb1T7jHs5oNv6q02b71fmIskpNQj3JD0zw0yTXwihxyNKHH4gDKR3SziB1a
    gjgkf/J3WPC/sSN01AjvbxjNU75bno6RI/icUzpB0zohtKZn1pfMcmerqm+u2AIPWvGYcT
    k8Gn7iGAL7JMoTUSgOXg45Gg9+dvfkJnfulMLJOMIvLcA4+2B5SWI9CYBiajO/BJL7b3lM
    H2eIieNt73Q8LKRzK8ub5Hw2s7XWI4+V6DEdbgZuO6ZyvnCxDTalHog5EvTcEh2X6+EG9t
    3HfXQ++XWWElUXDjHNbP2nVy74KhhfNMjRRkt4z0hpFLqPwGVrbfoUEc48AQ
X-ME-Proxy: <xmx:j92BaijD7pDLiB0zg5ebhtbyz-fSz2HOriGU95ZccBu26Wk29TBNcA>
    <xmx:j92BanXzdm8a8fGTYgt2aDBEXWh6ATD6kTivhS2YmUuKVWIG_x7Vsg>
    <xmx:j92BapN50RXAau6MWP1sO9rr2ZAyi6BD9Cn7rCK7zI2M1Ra7NMhhrA>
    <xmx:j92BajbNwLzDI6f6YD63Mo-rzq5xGDLQqfxWHXpdzCJzwgH5j0DYtw>
    <xmx:j92Ban23VSWAHy-dUFBu6sQjtFlSBjjBJZJFiCU7JjcirzJMfcIsQltj>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Aug 2026 11:55:59 -0400 (EDT)
Message-ID: <5f87ea3cdd1451d6e2bd0757d13fe1be39ae7658.camel@pbarker.dev>
Subject: Re: [OE-core][PATCH v3 3/9] cve-exclusions: set status for
 CVE-2021-3864
From: Paul Barker <paul@pbarker.dev>
To: Junjie Cao <junjie.cao@linux.dev>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 16 Aug 2026 16:55:58 +0100
In-Reply-To: <20260812072842.1176341-4-junjie.cao@linux.dev>
References: <20260812072842.1176341-1-junjie.cao@linux.dev>
	 <20260812072842.1176341-4-junjie.cao@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 15:56:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243530

On Wed, 2026-08-12 at 02:28 -0500, Junjie Cao wrote:
> begin_new_exec() resets dumpability to owner-dumpable whenever the real
> and effective ids match at exec time. A binary exec'd by a setuid
> program that has already called setuid(0) therefore becomes dumpable as
> root, and with a relative core_pattern plus an attacker-controlled
> working directory the resulting core file can be dropped into a
> privileged directory such as /etc/logrotate.d.
>=20
> Full report with proof of concept:
>=20
>   https://www.openwall.com/lists/oss-security/2021/10/20/2
>=20
> Two fixes were proposed and neither was merged. Waiman Long's patch was
> judged an ineffective mitigation by Eric W. Biederman and the discussion
> went quiet in early 2022; Wander Lairson Costa's RFC v2 received design
> feedback and no v3 followed:
>=20
>   https://lore.kernel.org/all/20211221021744.864115-1-longman@redhat.com/
>   https://lore.kernel.org/all/20211228170910.623156-1-wander@redhat.com/
>=20
> The flagged logic is unchanged: fs/exec.c still selects
> TASK_DUMPABLE_OWNER in that case, and fs/coredump.c only applies the
> suid-safe restriction when dumpable is TASK_DUMPABLE_ROOT, so the
> dumpable=3D=3D1 case this CVE describes is not covered. Images that set a=
n
> absolute path, a pipe or a socket core_pattern are not exploitable.

This third paragraph is unnecessary detail.

>=20
> CC: Paul Barker <paul@pbarker.dev>
> AI-Generated: Uses Claude (claude-opus-5)
> Signed-off-by: Junjie Cao <junjie.cao@linux.dev>
> ---
> v3:
> - use "unpatched" instead of "upstream-wontfix"; a NAK of one
>   mitigation is not an upstream wontfix of the issue
> - drop the "NAKed" wording: the discussion went quiet, it was not
>   formally rejected
>=20
> v2: https://lore.kernel.org/openembedded-core/20260803084827.1348810-1-ju=
njie.cao@linux.dev/
>=20
>  meta/recipes-kernel/linux/cve-exclusion.inc | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/meta/recipes-kernel/linux/cve-exclusion.inc b/meta/recipes-k=
ernel/linux/cve-exclusion.inc
> index af3576d..ba8e467 100644
> --- a/meta/recipes-kernel/linux/cve-exclusion.inc
> +++ b/meta/recipes-kernel/linux/cve-exclusion.inc
> @@ -206,3 +206,11 @@ host model, no upstream kernel fix, mitigated by fir=
ewall configuration"
>  # https://security-tracker.debian.org/tracker/CVE-2021-3714
>  CVE_STATUS[CVE-2021-3714] =3D "unpatched: timing side channel inherent t=
o \
>  KSM page deduplication, only reachable when KSM is enabled and opted int=
o"
> +
> +# Two mitigation attempts, neither merged; the fs/exec.c logic is
> +# unchanged. An absolute, piped or socket kernel.core_pattern (for
> +# example systemd-coredump) prevents exploitation.
> +# https://www.openwall.com/lists/oss-security/2021/10/20/2
> +# https://ubuntu.com/security/CVE-2021-3864
> +CVE_STATUS[CVE-2021-3864] =3D "unpatched: no accepted mainline fix, \
> +exploitation requires a relative kernel.core_pattern"

Suggested wording, links, and include triage date:

    # Triaged August 2026 - Two fixes proposed upstream but neither was mer=
ged,
    # attempts to fix seem to have petered out. Unfixed in Debian/Ubuntu.
    # https://lore.kernel.org/all/20211221021744.864115-1-longman@redhat.co=
m/
    # https://lore.kernel.org/all/20211228170910.623156-1-wander@redhat.com=
/
    # https://security-tracker.debian.org/tracker/CVE-2021-3864
    # https://ubuntu.com/security/CVE-2021-3864
    CVE_STATUS[CVE-2021-3864] =3D "unpatched: Proposed fixes were not merge=
d upstream"

Best regards,

--=20
Paul Barker


