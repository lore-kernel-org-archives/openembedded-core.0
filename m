Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70E22C25B4E
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 09:48:37 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.70779.1674208113439699202
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 01:48:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QZ4brnRi;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id g14so4911657ljh.10
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 01:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AQsxePWfNo/CxIX1LJpFaln8NoTgztHN6Q4hqroY+xI=;
        b=QZ4brnRiFIBsziAcFca15M5CRKRMoCMjqq6PLFo1WtOCOtRYqTl8GdSHPggDit+Ks9
         Ak1ptne5Skn6JAseJgJ+9NX5CRarvCVju8LDzuEOrDcMyaSsxIsNlKocOoXtv5ilFKVj
         KffHGIovYMjSu5cmF8xfSFXW3UQpXLgyof1Nu+vjROwk5eaWbu5FU4AmdxcDmnPjZo3f
         XC1MkruybvYPGhtZRrA3e8RMvoOZU31L1/do1Xf+lB022OZVFV4g2gyeaWXfqzzRzh9H
         rPntsfmVCmqSKW7nCBJme/kcvrqUczsFdXbTaJKFZt3DHcITSpYlBASAkffq/47rIDxP
         2Dug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AQsxePWfNo/CxIX1LJpFaln8NoTgztHN6Q4hqroY+xI=;
        b=cXqG45UjoTfn6vcsDqRiyNfb6EQuclntKDBE6C1iClo4+V606MPIvpfZFnE754fi0p
         NNKuqo3egmSTe3uadw0C0lpGhQHU+y3kbeqSpyrS88DTOHoCDkYeikw8coYOWOsgscEJ
         SjHpZhmzH4HYN5Yst+4ongs2C5EQp8RTpzWEpWSZZzTLvGcTG1fQYd66rwgPt7zsRHia
         SxqUn07uLIMmniPCzf+x8qSCAMT22EUz1bY/cEzTHNBPqdmzR2AftJQWvOiiubIF/0Dr
         4zBalQ+mlImJCbrqULYEl4c4/g6goDNWi0lFsAvvd+0h4Y6/DVo5PXGOeLyjCeNCrMl5
         /D2g==
X-Gm-Message-State: AFqh2kokEhPTyCZ7FENQ6+nDLlri+nMCn9wLNMEUCbTGHiC9ud4dSt+R
	mjFe091kbeUGo+aTyMZlel7DKfCtxCuM2Knmjag=
X-Google-Smtp-Source: AMrXdXtLDl8R+uG9kZdC8gP4NN0Cy5BZ6y/zI2hNnOkr1ZiFHY72+qNRvfGXPS2OmGSdenLeADcMN/M7o1G9o2z9eZ0=
X-Received: by 2002:a2e:824b:0:b0:28b:94fd:1bdb with SMTP id
 j11-20020a2e824b000000b0028b94fd1bdbmr754355ljh.108.1674208111031; Fri, 20
 Jan 2023 01:48:31 -0800 (PST)
MIME-Version: 1.0
References: <CAO5Uq5RftGpqzF1=6NUhQChCqCyp2D-ud8KUB69u6+9=N1VkAg@mail.gmail.com>
 <CANNYZj_9rpnJrSLp_oRvXsRzAXhA=W3ybEmQxrUtdcJtNq18rA@mail.gmail.com>
 <173BAB2A8E99CD9F.14781@lists.openembedded.org> <CAO5Uq5QRK-5AXVmD9XpVMe-5O-zqqN8Lmm0wj8VtV-YeU+mMnQ@mail.gmail.com>
In-Reply-To: <CAO5Uq5QRK-5AXVmD9XpVMe-5O-zqqN8Lmm0wj8VtV-YeU+mMnQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 20 Jan 2023 10:48:19 +0100
Message-ID: <CANNYZj9zduNA9P39zmUJGvOfaLY=R-ezymJVWHUG=sKAdrdBkQ@mail.gmail.com>
Subject: Re: [OE-core] Rust crate checksums
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 09:48:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176182

On Fri, 20 Jan 2023 at 10:17, Alex Kiernan <alex.kiernan@gmail.com> wrote:

> But if you list a crate as the primary source, rather than pulling it
> from git, something like this:
>
> LICENSE = "MIT"
> LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d426d11f66aaa533f62910f3bd79dfb6"
>
> SRC_URI = "crate://crates.io/binary-security-check/1.2.7"
>
> inherit cargo cargo-update-recipe-crates
>
> require binary-security-check-crates.inc
>
> You end up down this code path
> (https://git.openembedded.org/bitbake/tree/lib/bb/fetch2/crate.py#n100)
> and the checksum isn't verified.
>
> So not terrible, but could do with fixing at some point since the
> crate binary starting point is clearly the "tarball" starting point.

Should there be a ticket for checking the primary crate?

Alex

