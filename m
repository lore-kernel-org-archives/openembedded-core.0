Return-Path: <floss@jetm.me>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F1D9FF885A
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 21:20:59 +0000 (UTC)
Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.61.1777065650086979680
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 14:20:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@jetm.me header.s=fm1 header.b=smGGIE6q;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=L6C4TFcm;
 spf=pass (domain: jetm.me, ip: 202.12.124.157, mailfrom: floss@jetm.me)
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 2C7D27A0262;
	Fri, 24 Apr 2026 17:20:49 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Fri, 24 Apr 2026 17:20:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1777065648; x=1777152048; bh=imbJqJwhKu
	ByeEjON9RDp/XOh2nMHFTZJuYt2nFQTlM=; b=smGGIE6qO2eglKBo/ncsE46f/+
	/aVR1qIjkX39Eboj5xFvvJld+AwI/fiy6UipeeIp1g6jMHZqZl2GHShWiIzDNwtA
	sb9KnfoNoMourgPM5karbA8Rnp3FynH7xA80VzHQ7P1krZNE9NdVS4G/7pxKnEuc
	L+LzEtiJ6+e68dRrMnc+hcgrjVyrjTo7qIJjUn3y9d1xEU8TbRHoAMlMm2gYOBJY
	uiQjgiduN44sjGRzmndFFJm9nEq61BVExSJFKmxwXA7t+OvZh7iD/DqUnOZu6FI+
	aMeP6dTAFGwyXHE+Dz01zKY5r4Ycee9BcFOdlC2zgC76plPKjvn89iUCYG/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1777065648; x=1777152048; bh=imbJqJwhKuByeEjON9RDp/XOh2nM
	HFTZJuYt2nFQTlM=; b=L6C4TFcmLgKqG13AhTXFDv8FY1vXAAQYT73M5QIztkEe
	ELvrVVYU0mfW9poQvx8jRmhqKwocwK5ldL6DJOM4UpxbFO+LrEDeJSvV+gcZBVGQ
	iTjP6/oR3WKX63yz0OUa8TuSfEBb0LtlFhpjHKf3XrGHked6/ISzwOwWsRZ+oxmi
	mRAzag5zPT9gdxSnT4QkoPY+LIlkYSUSGJuNQygPcvlDluB4khc26c6sF8EszzoE
	FrbFxmeEZlCTz1Vak0V/Uir6RA1Y/RooB0iPxbDaPLsE5lbdv9zQIIVgnDDt1GgU
	VV5uD7uChxVP6SEGzObSQFGBm1d2gwq/rfh7caI23w==
X-ME-Sender: <xms:sN7radqfpAtVvBuUMZrs5M3GDC0ebjoYMLZ2CqiLK1m2zDx545FNKA>
    <xme:sN7radk0iG39e9votkkR_DgcmoZxHjuUc-LgIGUIBV56OzzyvEVu9CM11bPyTbAjY
    opV-CGu13F3NlwfUD4GWnBtDRscK0DpVkQ4MB319RM6DTmXLlHAB2Y>
X-ME-Received: <xmr:sN7raRz0S9JJch-dsECoHE3doEj2WemhjoLDyE6MgX_jzA2XonRHsRindHA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdejuddtlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecuogfuuhhsphgvtghtffhomhgrihhnucdlgeelmdenucfjug
    hrpeffkffhvfevufggtgfgsehtkehjtddttdejnecuhfhrohhmpeflrghvihgvrhcuvfhi
    rgcuoehflhhoshhssehjvghtmhdrmhgvqeenucggtffrrghtthgvrhhnpeeljeeivdfhfe
    eivdevheelvdfhleejtdegvdejudelveevveefudetvdevkedtffenucffohhmrghinhep
    ghhithhhuhgsrdhiohdpghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepfhhlohhsshesjhgvthhmrdhmvgdpnhgspghr
    tghpthhtohepvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohephihotghtoheslh
    hishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepohhpvghnvghm
    sggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-ME-Proxy: <xmx:sN7raVkDELcWQpNa90UykNKctL3POQ9K59ElJrGWJuqJZswHbn0ceQ>
    <xmx:sN7raacVdHRfxo_bgRak6WUlhtXxc6y2Emrare1OSvWSakw0v_T1JQ>
    <xmx:sN7rabo5p1rCX5mIW7GqG9i1m_YaCrdlWhJTrqK9jdDi2za36m35NQ>
    <xmx:sN7raY64Bo8phjHkbI60aRBUQNdrxiur0MS_9085M7IZmPcO2lnaJg>
    <xmx:sN7raQqmR65qnf8_iXWlGtUVnNNnitaPqMkLASybsPwB71C0NvPHSHBS>
Feedback-ID: i9dde48b3:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Apr 2026 17:20:48 -0400 (EDT)
Date: Fri, 24 Apr 2026 15:20:47 -0600
Message-ID: <d196fb98514a14652a8e6a6ed1b5fff0@jetm.me>
From: Javier Tia <floss@jetm.me>
To: yocto@lists.yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: ANNOUNCE: shipcheck - CRA compliance auditor for Yocto builds
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 21:20:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235942

Hi all,

(Cross-posted to yocto@lists.yoctoproject.org and
openembedded-core@lists.openembedded.org.)

I just published shipcheck, an open-source CLI that reads a Yocto build
directory and drafts the paperwork required by the EU Cyber Resilience
Act (Regulation 2024/2847) - the Annex VII technical file, the
Declaration of Conformity, and an evidence report pivoted by CRA Annex
item.

The short version: CRA is a paperwork regulation, not a
scanner-selection problem. Yocto already emits most of the technical
evidence - SPDX SBOMs via create-spdx, CVE scans via cve-check or
Bootlin's sbom-cve-check, license.manifest files, signing-class config.
What's missing is a tool that walks those artefacts, maps them onto the
CRA Annex structure, and renders the drafts a compliance officer can
review.

shipcheck does that piece, with seven registered checks:

  sbom-generation    SPDX 2.x validation against BSI TR-03183-2
  cve-tracking       consumes cve-check, vex.bbclass, and
                     sbom-cve-check JSON (the last is preferred)
  yocto-cve-check    reads tmp/log/cve/cve-summary.json directly
  license-audit      per-arch license.manifest walker
  secure-boot        detects signing class configuration and flags
                     known test keys
  image-signing      detects FIT signatures and dm-verity config
  vuln-reporting     validates the vendor-commitment half of the
                     dossier from a separate product.yaml manifest

It is deliberately narrow: Apache-2.0 Python, no runtime probes, no
shell-outs, no network calls at scan time, and no LLM or AI inference
anywhere in the pipeline - shipcheck is fully deterministic. An
auditor can read the check code and confirm exactly what each check
inspects.

Pilot 0001 (poky Scarthgap, core-image-minimal) is committed at
pilots/0001-poky-scarthgap-min/REPORT.md with the full kas-container
bootstrap. A worked example driven from a product-vendor.yaml (every
field set to the placeholder "VENDOR") is committed at
audits/0002-blog-demo/ if you want to read the generated Annex VII
and DoC drafts without running shipcheck locally.

Install:

  uv tool install shipcheck  # or: pipx install shipcheck
  cd path/to/yocto/build
  shipcheck init
  shipcheck check --build-dir . --format evidence --out dossier/

Blog post walks through the Annex structure, what Yocto gives you for
free, and where the paperwork gap lives:

  https://jetm.github.io/blog/posts/auditing-your-yocto-build-for-cra-compliance/

Repo:

  https://github.com/jetm/shipcheck

Feedback very welcome - especially from maintainers on the cve-check,
create-spdx, and vex side of things who have opinions on how the check
defaults should evolve. File an issue on GitHub, or reply here.

Best,
Javier

