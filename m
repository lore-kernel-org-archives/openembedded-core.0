Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 315E4C369D5
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 18:18:41 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web10.55559.1745864312851352047
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Apr 2025 11:18:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RtZwxfaP;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6e8ec399427so48958666d6.2
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 11:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745864312; x=1746469112; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GMNfnfvZmyXVTETkRCca87F+YvCWk7yiJ3BmMN7I29U=;
        b=RtZwxfaPmT6z/hKeMDOVzSZeu2zBzCh8IajexMM261JviyWunfx+S+GK1LApWxAeZi
         W6Z3S6REUE+RjW0O0wVCyoGPhxkSLf9wCQro96YEjT0obxq+FHMReP2IpqfDZpUS3Xta
         rjKFciFXzKXY8+uFdfdb1HQloewiUf73r/tBgOYS+AlYL9QDi1CwCUMquy5GPkQiGkCB
         A8RBKBJE2AGkyAJqNHrKvjHwppTe1X6zPpuN9pQjNiGXoHZ2lRzf8O1HvTjlIMr6uxKP
         naRWt5klcxe4XN87fA71wfjkwzVx4qI9jcvRjf+otUzcPJuBqROLxq8oBykfOe7nTvUW
         txkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745864312; x=1746469112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GMNfnfvZmyXVTETkRCca87F+YvCWk7yiJ3BmMN7I29U=;
        b=M7so4qjTfXh/RrsnAT64bl17jamHdRnKq7LQqJqxB6jQZ8gu3+tPidIVNDYaSohb8d
         Y2iOikte5oR9We13Pfx7t/vq81xrh5rAxySgFlpihFLF3x/74M/FrTKOdnDTMt9XuW2E
         G38mB0O9iE5qO1GhN5AzXPymwtTzluEXSXycAqTrUlSKcm1upViG+CWk+35CM21H7i1x
         7mFg9ZYgmFQ3h9Hc0tiLJPmfLsE8isaCMgCCaB5mE1P5zBFpoOnDiVhrtNzkMbAt72yT
         e65B7EHAbfEvLE8LzB0A9Ypu1fgnIPAES/xLFi5ydc6dp3bnt9BrvxjDMlpYFjkbk0/S
         uPKQ==
X-Gm-Message-State: AOJu0YxinzPKQ3pcGnp+t3XIeEwgl7NZ8NUsfJJGqKx0iGBqIBn2dDlx
	AN8DyDLUPz0Ut8ILoKxsSreSwvOSWv8XYTFAf74UDL+BEBXMzKB5pxnhvxOTCuH6PWNE18Igop3
	9Kp+N5xzh5gF5t4N3Sle14OsAx7SMvQ==
X-Gm-Gg: ASbGnctvdTWT86bXqh5A4WLhQNtzOH2qp5NMpEl7BGP0W1ChsLqKE6kBeSOylp7PBsI
	Em7OqhdxcqHe7ELzE70jCygnfa8k472D9HJ1lAoyRdslxnSTXVVNW3NNy9kAuH8nwpe4f4ht+op
	w5TT+oAMDy+agBKzxIeH8VngA3paERC/noYJiAYdUA7tAmzwjdsNtEdL8S
X-Google-Smtp-Source: AGHT+IEuGmd4uAtH9H2kRHsCwIMAt+SEqgOSTxDP2kYLpubPgN/zGhIh8+vXB1O5Zt5GMiiBaoyzWAja4Vyf2NRa5VI=
X-Received: by 2002:a05:6214:5090:b0:6e4:2dd7:5c88 with SMTP id
 6a1803df08f44-6f4cbb5a6b5mr235310946d6.38.1745864311659; Mon, 28 Apr 2025
 11:18:31 -0700 (PDT)
MIME-Version: 1.0
References: <AE38D3E5-5632-4C2C-ABBD-D213983EBD63@arm.com> <25979.1745859308517888166@lists.openembedded.org>
In-Reply-To: <25979.1745859308517888166@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 28 Apr 2025 20:18:20 +0200
X-Gm-Features: ATxdqUFI1xuTDfwYsfegPhEOzpsDyIOAUcNkPd5uJS6lCg3-6eGl-F9NjNHbUyY
Message-ID: <CANNYZj9uobfv+ny5F-cs_uviznrCzry7z6_kFFqqxjvCWvE5Tg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/2] cdrtools-native: fix booting EFI ISO
 live failed
To: hongxu.jia@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 18:18:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215629

On Mon, 28 Apr 2025 at 18:55, hongxu via lists.openembedded.org
<hongxu.jia=eng.windriver.com@lists.openembedded.org> wrote:
> I will update to Inactive-Upstream. in v3
>
> About schilytools, it could not be built from cdrtools recipe directly,  the reason is schilytools using a bootstrap 'smake' binary for compiling
> which is created in the psmake/ directory from source [1].  We need to create the recipe schilytools from scratch.
>
> Due to cdrtools have license problem[2], we only have cdrtools-native support in Yocto. For schilytools - the fork of cdrtools, I think we should only support schilytools-native also
>
> [1] https://codeberg.org/schilytools/schilytools/commit/a72089c47380426830118d318d59a65e9e1b2aff
> [2] https://lwn.net/Articles/195167/
>
> Hi Ross,
>
> For libisoburn[3], it is not alive since 2023
>
> [3] https://files.libburnia-project.org/
>
> Hi RP,
>
> What is your suggestions, is it necessary to use schilytools or libisoburn to instead of cdrtools in oe-core. It beyond the scope of this bug fix patch

This was discussed in the patch review meeting today. The patches are
okay, and will be merged. Like Ross said, schilytools seems like it's
close to not being maintained either, so I'm not anymore sure if it
makes sense to try to move to it, but if you find a bit of time and
look into it, that'd be appreciated. This whole area covered by
cdrtools/syslinux is an obsolete retro technology that no one really
wants to keep alive.

Alex

