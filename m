Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28F38CF65CF
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 10:17:06 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17118.1769422619990856659
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jan 2026 02:17:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jiQ8X3BU;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5014e1312c6so26757581cf.2
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 02:16:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769422619; cv=none;
        d=google.com; s=arc-20240605;
        b=DcjOEDt/xMRLAAYg7NNSI7L9j44AdJtxHg//Vc9kD/c7mpteePpTY/yC/ZhAsckvg7
         gfeDoZP3Do2QeAl3CphWeUL0BIlVlkZw+7/JTdv9jYgYZAYzktNa3TuIXGmcsdRPuH+y
         oDQrcW1hQgXkV6OIp1tSo0plr9Retvlx5XNByGk+9j7Meop1JjjiXbv+3ON4UuXIkySx
         ajOe4asLaaF3mPh4r3gYgICo9NqHv8TdE3Cp+c4OVFmd0smGihK3eScsERqvl35vYB2v
         IkytvlxDp6IP/N/NhmJ3SDkuoUPGpr2/ZKe7LQzSDVm8GPQXAFyuFZHQMOeqKvta2igl
         8lEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=S1qXeXx5X5r5KsItIybQiecgn8/wxcc/1wPb/62fABk=;
        fh=QG0/1kl/iNDCWfShgAIKRpbEE7JIBRGbrVXnRZODZk4=;
        b=VVKL5M6UVO32WQTopDXTD+uCKE+VpBkqdYAUV39gKTNj5IySIuA0/0eoYihUQf67qv
         Mhuop7fO4+q1hpVBNIcdPQTZiWou4Mb7UQwrIN29MUOFmsfxwi8fxh5W+PzsS63/Zv3W
         U+ZYdEU5Nndgaui1IkkowUDuOkAw6dPpPxEQacmhjA5ky7L7GlcHS2a03POMTV0wGMuh
         I4c6V3UJiiUsrYBBQypXNt2EN6Nkj0doGfd2+2sRKsiyq3T+kDoF6UjyvpCGz6wBPJNA
         yYp0UblSREIg8FJOObLFCXJAHKs5O5H5KBSCy72hb5Hrakd5auklNglJhgrSzLCJ5usH
         l4Og==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769422619; x=1770027419; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S1qXeXx5X5r5KsItIybQiecgn8/wxcc/1wPb/62fABk=;
        b=jiQ8X3BU3vkipkFzU/AomIbGN3VMbRlB7RjVgy8Cey0U//1fgOH06fp7hoCZfqfOZR
         wKFxXqRPHxdn7Vr71iZ06hoBunhM1127p9/1ihHxZgK+NQFDBjx+gA1+aqlQ4DFExT1s
         VFq7YR/zoNhAVrMlBbWLD33vR8WUHqr/vkYa+qhA/PehavO6uOnb0P/kANpGyrP2Jvsm
         taKqpY0VfqKrDlFhZ7MJZYnytckylM3gPpuUcPhKujj151rUAcwOOxLa6RUyiZItQ1pW
         R5E3aD478sWxaAm3qLBNR5MUXFLnz104yCnreubjQtohoryUJmQuQU2AmCRUJ0wsOM9v
         dSpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769422619; x=1770027419;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S1qXeXx5X5r5KsItIybQiecgn8/wxcc/1wPb/62fABk=;
        b=iJfPbmGj/+thS57dfY+LPzZ9w++mbWvk6P+3JyOZ8r7tbInsbJ2PmuUQ0IhzUSs1hD
         uKy+HLzv0LF3sj8epAuxHbJ/NEIcZz9/zQlN6y1k1AYgxulqtgyOYKsoF8i0UYc2vCk/
         eQayH3Kzy53Jf8Pn8w9GzGVHGoPEASmKvKsZqJ4T3k+uSy68s4LJJgvpRO2sPQy1aEhv
         CGCQ7mfQkPMVvqYWzHZRa1w3i92XZ1x1HvCAOEvVp9M35+RbpXMJV5rI95ofqJqZjo6R
         9r9Lv36tm6p3T7YZugZiIHwvOmENIWtAjRFzCsyn2PvQPgPMxmM606Z8RIda/n2n6izx
         04HA==
X-Gm-Message-State: AOJu0YyNXyM5QSir3PrKzswDCKvBwkAV2PiOV9eK76Ndan6OV1RmXjlL
	wBFKTFzupdpgWloYBKgbweyZC6PrXYKO8KBdLDyEoX8+FmLzpDnLHUZE9iwEjuaXwvlxpeUN/FC
	jjITDiMwafh/CERbKeAx7aY0X3lUHW6Q=
X-Gm-Gg: AZuq6aJtRWQhiJ6ei8kGDML6HMzK/qENpsp8m82TO1KAqzg9OPPIIg4MIaEyaozS4fP
	QspkYT0ZNUR3Lx/lMfU7dQ4bky35msQUNxFr2lmyzZe2cXPiFRokdrcN+kdnsHW1JWCTJbGp5DU
	19AK0xvwiMUXUoE9L7lX3KyZGVHng7q2efleOVB8vZysYVf2GrHBnml/UatOQBmFXCqBGL2Rc8E
	y5xZgDQcSmiyYDvIe3JmAm5soQ1vQVpXvfTKo7Hf/8ttEqDJ4Gkgpcp7frj6T8AoNqP5+HT/5n4
	pH9r9tlej2+t7ponD6TeafucqU4uUQ==
X-Received: by 2002:a05:622a:89:b0:503:4bc:c926 with SMTP id
 d75a77b69052e-50314d0afd1mr39270011cf.83.1769422618912; Mon, 26 Jan 2026
 02:16:58 -0800 (PST)
MIME-Version: 1.0
References: <20260123052234.970-1-liuyd.fnst@fujitsu.com> <20260123052234.970-6-liuyd.fnst@fujitsu.com>
In-Reply-To: <20260123052234.970-6-liuyd.fnst@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 26 Jan 2026 11:16:47 +0100
X-Gm-Features: AZwV_QgLA_v-QfLCt2xieUesUVMxNJ3i9SZFi_1i0zTwk3VSzT0JGNbn9hKZ_u8
Message-ID: <CANNYZj_YQAsy+0aMFVwWJy3+Y2XFZMBnaC8wj5hF+TKWg8GeqQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH 5/5] hotdoc : Add new recipe
To: liuyd.fnst@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 10:17:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229978

On Fri, 23 Jan 2026 at 06:22, Yiding Liu (Fujitsu) via
lists.openembedded.org <liuyd.fnst=fujitsu.com@lists.openembedded.org>
wrote:
> 2.Add INSANE_SKIP to solve buildpaths QA check
>   do_package_qa: QA Issue: File /usr/lib/python3.14/site-packages/hotdoc/parsers/cmark.cpython-314-x86_64-linux-gnu.so in package hotdoc contains reference to TMPDIR [buildpaths]
>
> 3.Add hotdoc_fix_sources to solve buildpaths QA check
>   do_package_qa:QA Issue: File /usr/src/debug/hotdoc/0.17.4/hotdoc/parsers/c_comment_scanner/scanner.c in package hotdoc-src contains reference to TMPDIR [buildpaths]

Thanks for looking into this. The above issues need to be resolved, as
reproducibility tests will fail because of them.

The recipe should also be taken into actual use, so it's tested and useful.

Alex

