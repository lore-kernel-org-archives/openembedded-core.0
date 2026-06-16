Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 203E9CD98E3
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 16:10:06 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1417.1781626195902217379
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 09:09:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NNCWg5w8;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8cceaa6f75bso71126066d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 09:09:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781626195; cv=none;
        d=google.com; s=arc-20240605;
        b=cnVAAmC0a6bXahpxIqDpWmcfGmbdr1bQwu6IMsWZLirTwux99ST2b1c6Ad+le7yQBE
         SnpW7yOv0tmDK/Aq0R+WUOQ53W7EaVR9w5qEqex+yIPKWBKoIAhHjISx91yg89N+XcHB
         EHNbXlwBddb7jIaMEAEcHrskLQ/nfdjlur/NVD0c1qkxxudXtMuJe3H5JX157WiF/dJ2
         uk7CAlRxJsP6iVffBfWz9eHTV9KDGYZR+8fU6HvmTXfl+Cn6ioV0hBhulLByb7U9219q
         cojBB89gmRRbdN8TZ5Dn9k7llQ8o1DWOEIJMFBYZCI035dmVGEuUS/33m66NxXUKRbMo
         QPFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cQgGIw6DfENgOTzBDgcfYqPeYvAcrEzlxME0f+IdA64=;
        fh=nQsDoAToQIFrhjT9Ea7gCh3QyTgoJdXpuE/XI6//Qe0=;
        b=NTkC3wEqG7R5mlTuvTYawCU2tda3kdIZ9EdBu44OYIX0eDfoJ9nAtGOBJ0EihWt3z9
         DbtIVPc6HQOMknCrFKmrTv4ZraaL64i3BUYbZh/jvzii4oyFsifndroWTtOAZxB07XMq
         CgZYDkxMoSLjmW3H7CnvskbgGaNhojdA6ZRcTWkl3ox2tUhBxkigtzlMPXD6UJoFghsi
         mnT/n4qh6xykGdjpKbx8Do9nC4abYmyW581/XzRei9nxBGJoBmMmUNGdRszbe3MKfMNb
         s0FFq2UsEiIsMoTP05pv5IK2l3aE2gYFF2GexlvC+3snrD3a1b6D6zV0Alxz2kx7+alh
         kDKA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781626195; x=1782230995; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cQgGIw6DfENgOTzBDgcfYqPeYvAcrEzlxME0f+IdA64=;
        b=NNCWg5w8fXfgOneh6IgWpzG2pP2ntW+A9iTG59y/6TevHrfS4wV6Q7+Wg/h0Sd6iNg
         oFyRBkz4sfT4XhM3/L8xRkqz59aoj06mv79KHbZ65U+Spb6kCLkGB5N+q+jaeo2yndFY
         7Tw5qP970BqkOXK2J5wQRhYGd47tfREsXHaTFU1ThqX331Vir0DgvnGayFPxU0Q0Bp33
         /715/k91T6aDhJ8G7Z/Uv1w/GKD83nEsd+RYhxldZR02iBr/I3FQwORkxJGqlm55bpyu
         4HbojD7TlyImvWZ33uo2HKcsWO0kuyee/bLA7S8Q/BzsphMymnaadCSZrUOT2M933dmz
         UruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781626195; x=1782230995;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cQgGIw6DfENgOTzBDgcfYqPeYvAcrEzlxME0f+IdA64=;
        b=TqqRIuxb/TqrnR1KPiZjW+tXlPxu2csPrC2YMMBprRkK8b1p8AP1xijv+HiPVgWBDM
         7dm7qU/lgW/9/PuP/WNU2XwFgHpBtoa0wCZ/IcBHL9wzhIRMuha1n6xw2ngjVxS6n0ZV
         ThgQ8HzDXsVP7ieLiyhQ8864JTY1l2F5bV4HPzW1LxgjxbzNxsTeUte5aEdeBr3rdhjv
         iBLfnoan3w/7b/Wh4QAchGY8zrA1TpZYyWjqFZ0iy3R9J7zlgmo11Xi3TYP304jQLfXy
         lqbsgVEi3y4qUwFULk9ZwngOCz90j0it4DELvJTMnvDPK/6X5o51Pmk2VmVG0LxPv20h
         ca7Q==
X-Gm-Message-State: AOJu0Yw3j4iG8CBi+UW075OHab9wmf48f+lKNiXoMipZQFPpkgP5l7l0
	9CoWMkZX/ZtuJ1lo4tV63sZdCjUx0VlKKg1Pw46DSgbP2t0/mqzhKauOSgZkkoWKy2yo1ZtOHW2
	TX3nxg/z3wnrQUqln28St2q+4dQ/QdasAbOsl
X-Gm-Gg: Acq92OG+4E3sW8aM8iOcbpbDnXHDM0UGHyNqXWgC05qdwVz5OCtljXH2TpRaJ/zFSKc
	cl0UufOeVJyJtIqazLM5cBCr2jvyGvFLvpvl6/XMdNN4Qqy8ijZweVIC7GdkSBvn6pvy0sHz7YI
	hMSVRyu9x0xNBFLeeWNSzs9roaze8WrTwUNLakp3xMDKIV9I0xCY0NTAA0lOp3MIo7GcvKRLx4O
	nTVb+lKQSdupuCUuTjTOrC6BCnah2bgO0XByNMcsPwQWhv4bDX/SJOgJo4Ydjd8/bw5RHBKNAQe
	bHMaxqWNiMOUIJIIeeWzkCKWLpj35yoeBb9rCSCxlcyCOq2Bgprh
X-Received: by 2002:a05:6214:1c0a:b0:8cc:f135:529e with SMTP id
 6a1803df08f44-8db5d5b12c2mr5341616d6.34.1781626194665; Tue, 16 Jun 2026
 09:09:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1781624800.git.liezhi.yang@windriver.com> <0b67fc315b54be36e0ea82fa54bd22ff1e3d62e8.1781624800.git.liezhi.yang@windriver.com>
In-Reply-To: <0b67fc315b54be36e0ea82fa54bd22ff1e3d62e8.1781624800.git.liezhi.yang@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 16 Jun 2026 18:09:43 +0200
X-Gm-Features: AVVi8Cf6jtrtZ3dFfDdCJ9ZnFlcxJ11rPSehPuDENT1JCdOCwfS0HX2HuvT3LfM
Message-ID: <CANNYZj_t-dgUf_XVxPi9hO80Tz1k=3qEm2q=t3fJ9i4sE1_gbA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 1/2] strace: Append BPN to FILESPATH to help devtool
To: liezhi.yang@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 16:10:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238915

On Tue, 16 Jun 2026 at 17:51, Robert Yang via lists.openembedded.org
<liezhi.yang=windriver.com@lists.openembedded.org> wrote:
> +# To help "devtool finish" can add 0001-Ignore-pwritev-pwrite64-tests-on-musl.patch
> +# into strace/strace rather than strace/files.
> +FILESPATH .= ":${FILE_DIRNAME}/${BPN}"

I'm afraid I have to disagree with this. Devtool does have support for
conditional patches as seen here:

====
alex@Zen2:/srv/storage/alex/yocto/build-riscv64$ devtool modify strace
...
INFO: SRC_URI contains some conditional appends/prepends - will create
branches to represent these
...
WARNING: SRC_URI is conditionally overridden in this recipe, thus
several devtool-override-* branches have been created, one for each
override that makes changes to SRC_URI. It is recommended that you
make changes to the devtool branch first, then checkout and rebase
each devtool-override-* branch and update any unique patches there
(duplicates on those branches will be ignored by devtool
finish/update-recipe)
...

alex@Zen2:/srv/storage/alex/yocto/build-riscv64/workspace/sources/strace$
git branch
* devtool
  devtool-no-overrides
  devtool-override-libc-musl
  master
====

so this strace issue is hitting a bug in that conditional patch
support. Rather, it should be investigated why is devtool writing out
a duplicate of the patch to a different location on 'finish'
operation.

Alex

