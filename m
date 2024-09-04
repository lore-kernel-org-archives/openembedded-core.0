Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 485D9CD3431
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 13:37:08 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.50240.1725457023215026706
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Sep 2024 06:37:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UYz+S6ZR;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f4f505118fso74563001fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 06:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725457021; x=1726061821; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gUbj8Gr3Jq1hELNzumQHA7TWM2XXKe5OSf3+PLqX1Gs=;
        b=UYz+S6ZRKrqwKACDU5xLh646YGDokZegB97FA0h468m6/uwHCHQFtbJaDGcVoEEGDK
         Adf8GxECSXS4FV9lrtsT2UHQVIfYjBuquUWoqN0daOT8AHGALaG7pz6b3L/DxUUM7llV
         ZhphjceV0vEVcRAyowNg26FWaeC1q2eJRkucFrdme9uDqp09VW3icq5qsI5n5I6FyeBd
         2Six7lVkV2xgtR4OEl3pa9r/9f8xvdu3J8wkFMALTuT8zW2BIjjw6GFrhjIONq62baoX
         7pOgT/KEJyqoUXa11AScMcPQo45PlFrIkXmvVs34yrB3puQX5fobgWBhVm02QZLNfCrc
         pFRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725457021; x=1726061821;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gUbj8Gr3Jq1hELNzumQHA7TWM2XXKe5OSf3+PLqX1Gs=;
        b=GybXzTPpaP+oKG2MqNWsM4hcGxD0hE2IEPWJHkNvsvM+jPaMy/dwXTHWUdoC8xB9Ek
         LXWOvb9dAsg12g/DVSF1CURpOnQs3YyyiRnnYfbwvUnT8PiQXNfZGM5m2RUfiDK5w9dG
         XzLY4rcscnjYVigcrhLLS7qmiTeNRYo0/08j82KSJ6+vZnte09GHr3a8p8J2lD53ExUw
         xz3ir3ODaxRMEiHW4Sz6rP/VwvHmnLWtlf+ZEMUg/262T/OYcRXgTMPisL8q3BAKx2uY
         PFfEI0bnws6DF+GC6an2wAoi5fae2QK9ZLRYQEExrN4wK7W7ZRyLJ0vSfCuFU17zn1IC
         yVJA==
X-Gm-Message-State: AOJu0YzzMWBkXUvh9Wxm2kFhES3wUBXsIGnVupI5iVv8efJInPoSXbps
	2glwSEcr6jo8IuA3laoLJQgRGRpmaTmjr0FZL/lTCl3yA/fWxQkUwsNLuG6fQ6eccEYSY89muKW
	YLD3T1ML522ZAGzebeUNetEQmFOI=
X-Google-Smtp-Source: AGHT+IHqm+w/BlD7dspyphuCgBG713239JeuMHVj2r7ct3G2fffKps3oI7vm4LSWp50ccuq+PXkG/V/ljGlws5QKDyY=
X-Received: by 2002:a2e:be9f:0:b0:2f3:ed34:41c9 with SMTP id
 38308e7fff4ca-2f6265d752cmr108241291fa.37.1725457020283; Wed, 04 Sep 2024
 06:37:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1725456147.git.liezhi.yang@windriver.com> <8f43b5d81fdd28340c6c14fddd307b55ac05883e.1725456147.git.liezhi.yang@windriver.com>
In-Reply-To: <8f43b5d81fdd28340c6c14fddd307b55ac05883e.1725456147.git.liezhi.yang@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 4 Sep 2024 15:36:49 +0200
Message-ID: <CANNYZj-MPo05EF2qRezSXKpK6L8Djg0CZxBv--ozuLM42JbGUg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] buildcfg: Print bitbake branch and revision
 when it is in a separate repo
To: liezhi.yang@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 13:37:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204208

I don't think putting this into get_layer_revisions() is correct.
Bitbake is not a layer, and obtaining its revision should be in a
separate pair of functions:

is_bitbake_in_separate_repo()
get_bitbake_revision()

Alex

On Wed, 4 Sept 2024 at 15:23, Robert Yang via lists.openembedded.org
<liezhi.yang=windriver.com@lists.openembedded.org> wrote:
>
> From: Robert Yang <liezhi.yang@windriver.com>
>
> Clone https://git.openembedded.org/bitbake into poky/bitbake
> Before the patch:
> meta
> meta-poky
> meta-yocto-bsp       = "master:377fd06d86f5f3be80a927ee19c30d9557077a7f"
>
> Now:
> bitbake              = "master:5bd0c65c217394cde4c8e382eba6cf7f4b909c97"
> meta
> meta-poky
> meta-yocto-bsp       = "master:377fd06d86f5f3be80a927ee19c30d9557077a7f"
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/lib/oe/buildcfg.py | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/meta/lib/oe/buildcfg.py b/meta/lib/oe/buildcfg.py
> index 4b22f18f36..5e2de15127 100644
> --- a/meta/lib/oe/buildcfg.py
> +++ b/meta/lib/oe/buildcfg.py
> @@ -73,6 +73,12 @@ def is_layer_modified(path):
>
>  def get_layer_revisions(d):
>      layers = (d.getVar("BBLAYERS") or "").split()
> +    # bitbake may in a separate git repo
> +    bitbake_dir = bb.__file__.rsplit('/', 3)[0]
> +    bitbake_git_dir = os.path.join(bitbake_dir, '.git')
> +    if os.path.exists(bitbake_git_dir):
> +        layers.insert(0, bitbake_dir)
> +
>      revisions = []
>      for i in layers:
>          revisions.append((i, os.path.basename(i), get_metadata_git_branch(i).strip(), get_metadata_git_revision(i), is_layer_modified(i)))
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204207): https://lists.openembedded.org/g/openembedded-core/message/204207
> Mute This Topic: https://lists.openembedded.org/mt/108264652/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

