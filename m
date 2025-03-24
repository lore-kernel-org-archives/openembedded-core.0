Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 254B9C36002
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 18:28:55 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web11.46628.1742840928138733262
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 11:28:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BjvJ9bOM;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6e8fc176825so39830526d6.0
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 11:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742840927; x=1743445727; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1nPc0OZ0cJ7UQFumnXxtGVNi9Ar+VbtPf/pJ43YlW9k=;
        b=BjvJ9bOM204503qAvOibAknDSHrW+1AiPmNWsKwtXcPjW1ZtftS+LXUb3Xm9YnmFbD
         mMoOqOOTIOIg8qHdIkPssHJ9isX7WrQXcC9cUqDY/GczDTikv9I6v51wD3JcLgETMuW6
         PP9MwnOEQG0L3bdUI3BGIG6oUXr8XWkUgHpoWVdBBjEDvWWlyrvCzy1/sScxR6jN3Djs
         eXs4tCaLIt6Q74QbkLQYf8TceF10UNr0zRJyBmTzs/UHFGmBMlfyPdFIyUwN1YiZe0UU
         FLvAZeJrW4+sJ9Lpa0v1fDeCjdNaYscZnRqdaKpap8L5u3eQD6CHATP6vLCiWizdxbFW
         Wqnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742840927; x=1743445727;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1nPc0OZ0cJ7UQFumnXxtGVNi9Ar+VbtPf/pJ43YlW9k=;
        b=kNXE7iP3V8jMZFx+7XEQrN/0YJ3e3e/3YdmIY9Psi1RBmAjNCMP+/QdfezyC1CPGQm
         Y8xF9ndACh6OkBa9dJZL5ONnoB2jGSNI40t4aFD1CeyShyaJ1qY4J79rtyhfLwOpXaAn
         cRv0Tua+jeXjwyFIDfBaddwMhDM/miUPfHHoyZzl92C8PSQVLOgLmMiiIh1reLJpX80f
         exkem/Zb7piTKUGNrpS/XcRW+hfr/0KmLjAZhhuwLgx13rgF2lXveY0zv2ALLQkxNn86
         g+faxew7sE+Tjx7fHmRygxM27YZ9VJp1jVnpYi/xW6rK6WfcdXRmSskQJrQHFixHGbpS
         oOFw==
X-Gm-Message-State: AOJu0YzOIke3jS1zOzQn0Ke1erWmMxiucJA4qtY5IzLjut4dyKgVtdTo
	9o0Vo8O+qCz4bYUwU9T9I2DLWmiWlNeqDvq9LSSSLOeoRAkdN1UYVAamoAJ+Q6ENOMuRoTjCcgq
	uQkqMmAepSs2/26vi7JbajOYQx70=
X-Gm-Gg: ASbGnct7ofoObxNDXBDcdCZVx/NdXRz7n4GAi9IV2FyQ3zyxQSH44iJmrkPIaDrwjBi
	LTf47BUyfnarQMDX1hKmIt1V9ZZwYqwyf70s5vfAmAjq83BVHZ/6iDsN10pnDS+TMPvpTyC2zIH
	K4XEYERXnbw9yghr1Efu/Ha1/ownC/Tf6x9JUfd1BIsefyE7FvQFc9TXUEvX2N
X-Google-Smtp-Source: AGHT+IGfHsE1PCAX1RgjFfHg23rhWLppChS2Xg9RMjaH6wlA/zhcda45x/0LyLbKPIEd5Tz0F04SiyqW7JE5IvstT1M=
X-Received: by 2002:ad4:5ca3:0:b0:6e8:9797:f94e with SMTP id
 6a1803df08f44-6eb3f34460emr197043776d6.35.1742840926939; Mon, 24 Mar 2025
 11:28:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250324170911.391159-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20250324170911.391159-1-richard.purdie@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 24 Mar 2025 19:28:34 +0100
X-Gm-Features: AQ5f1Jo0kICfy1wv6kM1lZzmSZAUuuLFLEMvOxl1cbwCzidWV8K_tF7SgPGXRZM
Message-ID: <CANNYZj-WJXunBcAeE0mm36tKE1R_2fUFcFkz7=vB-PSHkj4NpA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] meta/conf: Start to populate autobuilder config fragments
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 18:28:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213569

On Mon, 24 Mar 2025 at 18:09, Richard Purdie via
lists.openembedded.org
<richard.purdie=linuxfoundation.org@lists.openembedded.org> wrote:
>
> This populates the fragments directory with:
>
> a) the default set of variables used in all autobuilder builds
> b) three different multilib test configurations used by the autobuilder
>
> The aim here is to start to make some of the autobuilder configuration more
> visable and patchable by users, and to allow some test confiturations to
> be user selectable if appropriate and needed for debugging.
>
> The main aautobuilder fragment is probably not directly reusable by most
> users, it contains the resource limits as used on the autobuilder itself. I
> can see arguments both way for whether this should be included in OE-Core or not
> but having an example of how we configure this is probably useful.

I'm glad to see fragments taken into use in one of the most core
places in yocto :)

There are a few notes I'd like to make:

- there's a companion patch to yocto-autobuilder-helper that should be
posted too:
https://git.yoctoproject.org/yocto-autobuilder-helper/commit/?h=master-next&id=accad467ff54ed71a00a1a97ad015195101dd4c2

- that patch keeps "BB_HASHSERVE = '${AUTOBUILDER_HASHSERV}'" in
config.json and doesn't move it to the fragment, that should be
explained.

- the new autobuilder.conf inherits from config.json a variety of
things in addition to build host resource usage. It also has SDK
settings, logging/reporting settings, qemu/testimage settings, unsets
sanity tested distros etc. As a followup, I'd like to structure and
split this up to different fragments under
conf/fragments/yocto-autobuilder/. Some of it could probably move to
poky, so that the delta between what poky users build and what
autobuilder builds is as minimal as possible, and ideally non-existent
(e.g. the difference is only in resource limits and directory/url
settings). All such tweaks should be done in lockstep with changes to
config.json or meta-poky/ to reflect them. And they must take into
account the history of config.json changes, e.g. consider why
something was added to begin with, and whether it is still needed.
It's a lot of delicate work, but I think it's worth doing (I can find
time for it).

Alex

