Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55852C54E65
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 11:01:59 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web11.21413.1747911715772242633
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 04:01:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Qs9bychP;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6f8aa9e6ffdso82595926d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 04:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747911715; x=1748516515; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v6CdLUZoHGgiekAiyVOOsAw5I9z6eOyocnavJXX1OZw=;
        b=Qs9bychP6gmWqpvK1BDDVFslY7myUCfMu3z2avcJhA/b/YbuUeKfINtAc5UyHhxR4n
         yjByJimfzNbl2FxE6ugcS9VPv9tIirHXVZpEvU4djJJ0KWvpW3isN48ytg6+xmCqyF2F
         IGzqFj5qwdYHZsXYetG1d1nKyrw+XpakLcTu4P3nmOQJCBSsuHiSEy29dqzahjB2q4pE
         mPbzGv+rFqnhOhyYP7v8CiWzvFWFDerLJKz1v397FABLCaBjV9mHwW/afO0sdpG6gh79
         9vNuze0kg9EqOaAi8GE+mNzW0WkM0cv3Gr3HFZxPxZQPduYSwIZi9S+j+MTL6zgrD5YU
         2cpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747911715; x=1748516515;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v6CdLUZoHGgiekAiyVOOsAw5I9z6eOyocnavJXX1OZw=;
        b=Fgx1453VZNqrNfZbQv7XUTBTvTiGLRRuWDkeS3h4e4aV6gQms38cFbVASzglPK2x3B
         lSe5Bu55EyNz1jXIwvUQRd5OIOY45qocP75BptNOVSdCgNf53uONm4Xflr93uMQ1ly6I
         3RdVmYvbtz6vnff6MduFetTVMzxr7L7wCkC0zPaUvACvwqben59DnaLTcCehDRlgZPjq
         OHO9I4SnM7ImaCALUR5O3/Ppgjn0nxPDB/eZbqGfN+PdAYju4TjDWIZIQjOrqXrUUYlD
         srPCTfpxNN7v/AdJ9RlMtHCrX0GoIl3UqH2s39ZKHv4r+F2VmXPXVj+OfptWV5Tup6OQ
         gr3Q==
X-Gm-Message-State: AOJu0YwaMr/PWNnnUnmllqRPj5D4Gb/8Zx8yiDsPT1sStbjroRjy//XF
	/t7cyr4RNYsK2v1aA4Coab0mKN4M9TtntkPpLS2tCpP0J0rY1/oDoZU/GpKSqWtbS5TlXOg5W+r
	k+gwyZ8NCWYmG5ednKLCHPakAkzOAHKc=
X-Gm-Gg: ASbGncs2eEWZYfnDYX/8DOj+QKR/3eaVsfKJLhZVzdLXzACI5YZX390PXE8C3XnKRQ9
	YvnKo/jae0nynDLtN6OSttHB1XJ7YAJAeDtSSKkzL0Y9AyC1QXKdxT4YG5rv/N+Mi/5zGbVl4Mn
	+cILdvkQW/Pc12VVJA5gwUMalvKpVh1BOHSg==
X-Google-Smtp-Source: AGHT+IHl7qDad8zHtcAwI+7DUhZ6dRI9cl0fi0QoIh4Ig9hQp2NrWvv/39JjSY3AACbRB2wGzamKAb9rflHUYVTz1bw=
X-Received: by 2002:a05:6214:16e:b0:6f8:bfbf:5d29 with SMTP id
 6a1803df08f44-6f8bfbf5dc2mr284958906d6.5.1747911714597; Thu, 22 May 2025
 04:01:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250521202337.113556-1-hiagofranco@gmail.com>
In-Reply-To: <20250521202337.113556-1-hiagofranco@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 22 May 2025 13:01:43 +0200
X-Gm-Features: AX0GCFvUXWlhvS0NFwnnY7DxHwUZVjqfzaEXWnPpn_OEdrqBOssc5ilFRm72mfY
Message-ID: <CANNYZj-Tp_s_Bg16bDA6XcDKZOtxjvuYy3h+oup4g40WTCf3Ww@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] base-files: refresh patch to fix fuzz
To: hiagofranco@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Anuj Mittal <anuj.mittal@intel.com>, Hiago De Franco <hiago.franco@toradex.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 11:01:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217086

On Wed, 21 May 2025 at 22:24, Hiago De Franco via
lists.openembedded.org <hiagofranco=gmail.com@lists.openembedded.org>
wrote:
> This is due to changes to nsswitch.conf file on commit 0cb122f17cf2
> ("base-files: add gshadow entry in nsswitch.conf"). Fixes:
>
> ERROR: base-files-3.0.14-r0 do_patch: QA Issue: Fuzz detected:
>
> Applying patch 0001-add-nss-resolve-to-nsswitch.patch
> patching file nsswitch.conf
> Hunk #1 succeeded at 9 with fuzz 2 (offset 1 line).
>
> The context lines in the patches can be updated with devtool:
>
>     devtool modify base-files
>     devtool finish --force-patch-refresh base-files <layer_path>
>
> Don't forget to review changes done by devtool!
>
> Patch log indicates that patches do not apply cleanly. [patch-fuzz]

It helps to mention that the patch is conditional, and that's why the
fuzz thingy isn't seen in default builds:

SRC_URI:append:libc-glibc = "${@bb.utils.contains('DISTRO_FEATURES',
'systemd systemd-resolved', '
file://0001-add-nss-resolve-to-nsswitch.patch', '', d)}"

Which makes me wonder, should we rather ship two versions of
nsswitch.conf in /meta/recipes-core/base-files/ and install one, or
the other?

Alex

