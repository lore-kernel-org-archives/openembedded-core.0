Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93E9DC5B572
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 10:53:19 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16293.1786618391286702931
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 03:53:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UtB0JLrC;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-51c0c45c580so12948791cf.0
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 03:53:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786618390; cv=none;
        d=google.com; s=arc-20260327;
        b=pSfyZtNd54kvvben8lh2ZbbrOGg7rGN3DQW6KjqsCcRtCZzPkhpe+2x9GpZq+279Tv
         QSCxNkXc9gLy1EJV/XEca+9hRUdtogyrzQkiNq8GuIvUOIGZPLrv4CVDhY+JHs10fypD
         yTG7TOQ2y2YDDpcqVq/eL2cZMfczzDmHrJuQVQG/etonR1va7mez1D/Zqnd9yTqtw8TA
         tex9qRlic3ISdinta8f2zTuy0c14DTGR4mkBgbpzcObD9ZjWUyGXPWQUuFm/Z1w40IXW
         U3ZArLJwHaRSXJUHFQ8LyATojb19Hb1/yVy3NgvL85QMESAf0H/B7hMoZdxPX4K2GF/9
         xOzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oBj2Ss8kQDn7Gws7/NWzdqMR2Y2hq4bXyVyxQg+NjTk=;
        fh=6Z4xUuTqkcxNv6cvnn0HdSGcZYvnhz2BRm++iEwx924=;
        b=nEuazclH6OWiv9bwSLKp612jlL3GBOHAoK4DfbWfoJZ8z/KAgqVg2WyboDdEBRue2x
         tagV4JdTnkIdSMG521VVPPqhaIkd0a0T+RgriAAV+0fHb6TzkNvTRltSs/69SJK31BjE
         L+AhzvTYm5WdQnEc1hxMQ6/1lTtedYqkq8+O4xoq7+LkJcebjNrP4jNXH81woUperEgN
         Zkm9OsCGSjAJzTGhZVFnA8FWyl80tqiIj0bdqdKChnGMTfGPyTqvy/ZzuDwhM81AuOrR
         ZahzwEHR1t88uETTONB6q7O3PhXusBPYBGJ6TDjHfq+D7+w0tZ5WfPKltkTs0VSeo9m9
         Wbsg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786618390; x=1787223190; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oBj2Ss8kQDn7Gws7/NWzdqMR2Y2hq4bXyVyxQg+NjTk=;
        b=UtB0JLrCyXvub/Gw0QmqV5exfBqbIdHjq+z3MHpWz5ASG6KBlMfnEd0nA/FWoxwPG9
         HAs2UpbP6O+ARMwgGxbFWcbkOeSOMhQjAsUobxlHYstq1V99GEkK9BKnCFQJ4f4+mqQG
         f1mi5+16MXMAeMEKn3APwpWdXdA4Db1H7SLpYTaEGDjVsgig5IXLMq5coRwGi8w72kwY
         0piQN9p+LHrs/3HxJ2qNIFs/l1f7G/Xlc/4DgT2m+o/grWcb8AX/8A0o1J9JXrqYdAkP
         2minczW7ZWNXOLuewKa1thTfTFVXB5CWYAn3/cxK7ZI2lxyRMLOAJN+yL4+z0a22OLqj
         s+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786618390; x=1787223190;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oBj2Ss8kQDn7Gws7/NWzdqMR2Y2hq4bXyVyxQg+NjTk=;
        b=nLHn18l4sIPyepeUZ5omnbX+KRuD0VdeUHb1J/Lzn6YukQgrJqgxzU1iVeHZMWoT2/
         WvdGXz7A3WQrpNhf780cQSDUuO3Spf4YTx/TyAoUpYwgLShjkHJGUYaTtnji1Ed159iq
         98kKC7ROGLoXAGZltU1HlfHt2mgNcXAHgZVDBarXolbp2OHviwez3Br780psegJtwC5x
         tsrFLryY54FJHDzYanh8DMJITbFOQiAcEkePquJ1r0dW0uExZ1uTOGcyaoQc06lGDJ1S
         nMByqjv6UI8Fy9N2dizpDKrm9U2KMcmC1AocnOvapErlFdzxAq9G97OBT6pDjyngNE6u
         ZRJQ==
X-Gm-Message-State: AOJu0Yx1CL6g4CygUWPeg4/d5szaWoeCudDzhCAgzzfoclaNzVTlo+w0
	9TXmqBfp/qFDodNu+3l6W+wAkHlPy2sJ5Hh6uTctqStv3wCxiufB6sx/YZkpmSc4i+fZu69NnAc
	U57sRrtC6+H+k4hhNLNnFV2QBHzV0P+4Zsw==
X-Gm-Gg: AR+sD10Kc+axVTNFTgy9hINTG3eyfA2U5v2jQmS7sg997/hfUbL1xdmV9r5TIKJiFTR
	xiW7X0kb9WnSYJg2oWssX0YZKkEmKADg0pZyNEw3foVx/KNw6OLo0rgXxqc6lYIkmeQ9V340zHN
	frwiFQRMtqldX6ZRv8C/PkE2Mq5mMmkhUxRlCi7cR1MWl7vS1Z1dIYsTIJDG0XA37U7LEJbzJnA
	/NSqEeOjabWy0RU9CtC+uMpFs1kHcvcEIhkqa+MNqt8DFvviZyF6cu4AHpaDQ+8j/iVMicxJ64k
	jIf17FV1gt5e10mPDUdutExZr1Pwk4nsvk74haHNvQJr3XeXAQ5B+Dt+r4afpZu4FzS2MthjS2g
	afMg=
X-Received: by 2002:a05:622a:1344:b0:51c:2633:9ddd with SMTP id
 d75a77b69052e-52d73e3ebe1mr47910881cf.41.1786618390197; Thu, 13 Aug 2026
 03:53:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260717091912.1752666-1-Deepesh.Varatharajan@windriver.com> <1500499.1786618088330989780@lists.openembedded.org>
In-Reply-To: <1500499.1786618088330989780@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 13 Aug 2026 12:52:59 +0200
X-Gm-Features: AUfX_mxmGAleGO6BH-NwdQ2UpuaIFMigA6QrnMRUNcni_HnQQchPkiwZqK3LvkE
Message-ID: <CANNYZj9cTUg+Q5JF3GcpXGVOtNHn_TYvKUjj4mQdsyVfiBjLRA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: Upgrade 1.96.1 -> 1.97.1
To: jaipaul.cheernam@est.tech
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 10:53:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243345

On Thu, 13 Aug 2026 at 12:48, Jaipaul Cheernam via
lists.openembedded.org
<jaipaul.cheernam=3Dest.tech@lists.openembedded.org> wrote:
> I see this patch got "Changes Requested" on patchwork =E2=80=94 do you kn=
ow what needs to be fixed?
> I'm asking because I'm upgrading OpenSSL to 4.0.1 and cargo-native fails =
to build without Rust 1.97.1 (the vendored openssl-sys in 1.96.1 doesn't su=
pport OpenSSL 4.x).

This is not related to rust, but last time I tried to add openssl 4.x,
that quickly ran into python support issues, as currently released
python does not support openssl 4.x even in the latest commit on the
stable branch, and we need to wait for a new major release sometime in
the autumn. Did you check that? Has the situation changed?

Alex

