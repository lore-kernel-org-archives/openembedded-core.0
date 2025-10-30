Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CB5ACCF9F0
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 11:14:16 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web10.23155.1761822853157278396
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Oct 2025 04:14:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OyH9nyv9;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-87d8fa51993so12256586d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 04:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761822852; x=1762427652; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T43ELtE4jyK1N//CYUkcpvcg2Ivt1yTxsoFMJMYsKDM=;
        b=OyH9nyv94E56q9oAaJqTlHjlPVXGF0GYEX5D5suz79PNTjXhTIDUsqh5JfIi1E7S16
         I43ip2jY4vHXITPaHKifNvsoY7MA7/+Gz4A/MDNIMgIbp8tEfTGeHBFALNe0qqs5FXzj
         nIKhxkkm0CNdV1nFIH330duXsghAqUCzfqRHbWF9clP1ys2M3FRC/RONNjg2OKtdAI3V
         JSte4HIgpybIRhzATmIX1+a5m5SQ8a2ImkWePW1H/HPJ6oATizlB4nFisiiF4u0uq2eA
         uQoNK9aUcUEcIdPMjIxjY09GEPvUynNoQnV8TrrW4+CDCgVuUKF7TR/fW/oJpERksKhE
         sr9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761822852; x=1762427652;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T43ELtE4jyK1N//CYUkcpvcg2Ivt1yTxsoFMJMYsKDM=;
        b=VXGK8LE+97yyMLgY/mRfqE6MZfzeV6vFM/W/lcYHNyQNlZoPTFSdKtPtaN/20t+6EH
         JCmFGUSz4IjFtEm+ry7iL84upgFrbXV9KljuTZy94n/ltY3nHNgVcv0K+vMlmItduvnE
         SSlSNUVqhzjw8m21hvMJGN6ElfostzX9XOQp78EXIJUkq5Ip8Bdda9D6mEcPJ/ouNdTa
         tRYJfJ8lGMR1Byc7dVSUuSEOPGKcQ2EgX0hJwtLCDbjiHmc9N58fQL85e1DatbKMt1Rh
         bU7rFO3VeUQEh3UUUdU5qUgE8jyU0ajBWVU5RTsCegE5fdL8eyN1tz1967w4jg4FRi60
         xErQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSPEUmvpEWpz0Ezc8K3lOHxHlRXMwqxSOjhJJJR36Bxz25Y5kZGcd112pu0PYCUyoRwKF2ke8GrEOkFokkQb6pgg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyKytJMq+S5PQmtgqAelkBmwPqgu+s1xfPsHMxv7sWFxWlIDj2C
	/DAv2QhNnNXCgeYSecUwswcYB5JD45mlwCsQS+m9r/wiAkljUTHoiitGdn883n2hL4XGuHUOnTj
	0pQGC0UXVyAORPlb0540dG+w6H6BkKMk=
X-Gm-Gg: ASbGncugsUM83UbPAoN7XpUZtcNU+Qox9cTVQwKNE4v5RrvgRuuHoJyKKhcuyoDtSJB
	+oFDWHN2ElHe3qY/0940y9mr24Vo3Amuqae30hmDrJ3KYM7xJ5ADlhYUGO/TcXQ+gkB7cqrQdJB
	K3RKQfKgfdEyynaNqQ4wiGJv4sZOcH2XoxiXuyei9sSaz/cFoVujl89KGbuUiPc0y02VDJd6vmq
	ojFK5X2nMsCBOmD6eTPdaoWT86IX0A9avjKx3HKkB4+XdW0h8mml0yrW0bT6LiEX6eOAhZt1Ab4
	G7pfpo8UkwZdZCYlVptYeNLA0JZQz8eDQlE9yO9yvLHr+2/fSWE6QtfO0SW+5Mp+wZNAotPmA3n
	H1L9Pu128SPnPxC1l1RkBfoX1wkGB
X-Google-Smtp-Source: AGHT+IGKe3i1s5lRUX1KdNC5rT5IHl/PM1Ebyz91A+cqqkCESLjkcTluhbsp9700dL8DcYQhu286C5e4hfpRpavAHWA=
X-Received: by 2002:a05:6214:2502:b0:87c:22f9:dac4 with SMTP id
 6a1803df08f44-88009b006fbmr81668206d6.15.1761822852134; Thu, 30 Oct 2025
 04:14:12 -0700 (PDT)
MIME-Version: 1.0
References: <20251027231918.3987817-2-rs@ti.com>
In-Reply-To: <20251027231918.3987817-2-rs@ti.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 30 Oct 2025 12:14:01 +0100
X-Gm-Features: AWmQ_bmzoMJRTqHjMhDAwFfLSc1eLyQ15Ml6u-BqlWe4Ml-eb4PZcmurSP_kci0
Message-ID: <CANNYZj_tSHrMnc=3nkbUTFEoKors3Sbfe55t6ud+9OGX7bKaEQ@mail.gmail.com>
Subject: Re: [oe-core][PATCH] x11-volatiles: register x11 volatile directories
To: rs@ti.com
Cc: Ross.Burton@arm.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 11:14:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225488

On Tue, 28 Oct 2025 at 00:20, Randolph Sapp via lists.openembedded.org
<rs=ti.com@lists.openembedded.org> wrote:
> +inherit bin_package features_check

It's not a major issue, but I don't think bin_package is required (and
it's intended for installing prebuilt binaries). On the other hand,
this recipe installs only architecture-independent data, and so should
inherit allarch.

Can you make these changes, test that they work, and send a followup patch?

Alex

