Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59AA7C5DF87
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 10:28:47 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4050.1787221719639329154
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 03:28:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rSOkA6b8;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8f23e851626so13965926d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 03:28:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787221718; cv=none;
        d=google.com; s=arc-20260327;
        b=IPzQgBNEHEJFxfA30HJBdSxmZUOlRsB3rcOnAw9zKLV5FnxpP2+TfP5LX5y4UNnfun
         LwCJL1ES62PijINKaqkM45SEgPobdMHLqfgRvz1iNOCfIvtJPzGRs54LfKSiAgMT65st
         TdPpvd4SCQp+ksyo3WkNiywuThzmRnKWHYsd7nqGKPjdNhePYy57iVIzYco5CGRVDJw/
         9g7EG/cPWlxxsJBn2ZWxwwCN4882rVrcRnFoM4kED+KhMBy66lT46MEMbVIzDsSCbcYz
         t/vNal9OVmQl91QuvgNdaHok4dAQIv3q6b6YFtDag7uczSW42cE0SNxiNZ7kZqNplMAj
         2sDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mKtBTRPgVEiGt1ELFlOQujQD9vLjPkvpnEmNeXaOPA4=;
        fh=hrLIMLnLgn9lA4UjcABRY9PW9LZQM2JxdaLMYkWr4sM=;
        b=G12fCP1MUdNNK0iTmtxV5G7ZqyPXDIm/kP3igC7n6rhtxKBUR9+d7IlRweT/oVUkHJ
         +fXJshU3fcEecyEPbJFv1CkRWEzjipAOIc+V2wSRnMYKeIjEYY1SlwoR3B71Asvs6l5O
         3WvxaGT1jSrnqb0ktvdiFwRUVJHG/UhNW9RVip/9NnM4LnMD44DCA7GxvkX0/wSJCS5D
         c/tVeATpGcyMFsa3qkRbwuStur8bJ8yPgcSzzgzo9KpmxLbpW32WOKydrDNnVQnIKa1m
         RIJBxdwouFkAJ07RF2t/rD9EtfUXBbo/eriQXXE2m5ouADPPwt/85MRmsi0PGLlKUl1Y
         2Xzw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787221718; x=1787826518; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mKtBTRPgVEiGt1ELFlOQujQD9vLjPkvpnEmNeXaOPA4=;
        b=rSOkA6b86tpk/Vlbc+56R598K+QJNoxw1pIEKH01y4vEmJH47sUmVh/wncGh5pYrrC
         0NVuN6xvw0EmkvFbW2jkPeNFis4ilvq9owSpUBOqjWRjso2adS3h4s2uocjJXrGJ8f0s
         EJeri/T4YlStyWEI4X7DtHDc1+q8b7rxqrNNnVqqX4ndxwfpIcv12D8sf7r9R5/k83cX
         wzzdI0ltoP58e1NcmDa5XIZp7Mfm7MUEvk4KQf30mOsMLVmhcSGNfnQVxlMzDSZLRN8e
         eIhNc4ljRXAa5k6T+DPWhXbXAtJpQ35dKG71Nwpbq98QaKMMV89vMBV8MHWs52jDZFx1
         A4LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787221718; x=1787826518;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mKtBTRPgVEiGt1ELFlOQujQD9vLjPkvpnEmNeXaOPA4=;
        b=i9bPVwlDnr2wbwjwlJNQs7aQ1svCv1oq4hYQrJKpeRq1EHBaS+gStmuv36o8DBjQwn
         K+3jv7cMnvre4LuU3545Z/tXsrgMovh/0yNpirTfi0dGWtEUrAH26La+4D9/n+yFA+cz
         y2MMZBQ/rfLh0xgFyP/VWDrFs1BadLLF6WUXo+COIMJwrXnWWpPqs5YvfAAa/q97RVuL
         EjZaQQsg3vB4luDA0vLHY8wE/CVZxSVs+f6pVY6RDgKSwAS7CCJ03FmMWLTJ2yted70v
         qZZf0DMIy2TKgOr2qIarXA6hFcKmit/CNZ2b7Qy/qbtwnOhNjvoYjy1FT399F1lEF3cQ
         w3EA==
X-Gm-Message-State: AFuF++mDVE6wQ0UzUYel00XAuEHTt0GCakul+DtTw5hOaUmPuwua68Ld
	RyAG8p93lufcInP9P6oOFAiDmBI+OMhP6XLlaBWORC9Y9Wl2tRhPlxhlgb2MRGfkLsEIDk5J9cp
	7AZDOdVyAD5Sa8U+N4hverxjX9q3fhj8=
X-Gm-Gg: AR+sD12T/xIMsuOvAPMi9HkhLRkmMkziULZo+atxqx9zI/68o2fKs+y7tB1TEATpEbJ
	JtZBxSzuE/QCd+AUu50OxhQRbrkAt/qkIbt+GCo2tIBZz1rk+0eSqPpPuoonpF5wVOGnIr7kO60
	Ka6+khk0rWrRV/VNJ54ZPqjncRScai7l1cA+9JhQo+f5NreFOiRYtjDWIjOU+8efPKruLbX58xy
	IXjfby1gvMVN2qYVNBuR0vH07J3xeQOZUJdwiaZK8F8ZvvaZYnuvm62gTCpPlaCiR3oXob95clV
	Ej4L0W93ifKPh5XscVzghDa9hCRPViV5qCPyxIb/7Se4ZJLguKi0CguifQ617xmrtFL30pgDCwF
	S/2WWVY2uXKSevw==
X-Received: by 2002:a05:6214:2601:b0:8f0:3b98:d6af with SMTP id
 6a1803df08f44-90c5eac8e1fmr109262046d6.26.1787221718162; Thu, 20 Aug 2026
 03:28:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260818083402.15727-1-pratik.farkase@est.tech>
In-Reply-To: <20260818083402.15727-1-pratik.farkase@est.tech>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 20 Aug 2026 12:28:27 +0200
X-Gm-Features: AcwNN1URUazcId4Q13lnq10FPpwmO67vyytEraEwAtfut9GaoBXB5p1rHLb6hq0
Message-ID: <CANNYZj-BTPuS5ygN6iyKAZzqjuQP7gb3CQBMP+6Z7VtMi2izdA@mail.gmail.com>
Subject: Re: [OE-core][PATCH v1] procps: ptest: skip flaky pgrep full process
 name match test
To: pratik.farkase@est.tech
Cc: openembedded-core@lists.openembedded.org, pratik.farkase@ericsson.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 10:28:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243850

On Tue, 18 Aug 2026 at 10:34, Pratik Farkase via
lists.openembedded.org
<pratik.farkase=est.tech@lists.openembedded.org> wrote:
> +Subject: [PATCH] testsuite: skip pgrep full process name match test
> +
> +The "pgrep match against full process name" test uses pgrep -f with a
> +regex pattern close to ARG_MAX in size (~100KB). This intermittently
> +fails on qemuriscv64 where the process cmdline may not be fully visible
> +in /proc/<pid>/cmdline at the time pgrep reads it, or the large regex
> +match times out under TCG emulation.
> +
> +Skip this single test case while keeping all other pgrep tests which
> +are reliable.
> +
> +https://bugzilla.yoctoproject.org/show_bug.cgi?id=16290
> +
> +Upstream-Status: Inappropriate [OE-ptest specific: fails only under QEMU TCG emulation]

Hello Pratik,

even though this shows up only under slow software emulation, it's
still a race condition in the test, and should be reported upstream,
so they can figure out how to sync the test properly. Can you please
open a ticket, and update the patch with the link?

Alex

