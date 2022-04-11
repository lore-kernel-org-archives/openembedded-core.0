Return-Path: <ralph.siemsen@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2BD5C47080
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 16:46:38 +0000 (UTC)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com
 [209.85.217.47])
 by mx.groups.io with SMTP id smtpd.web10.807.1649701038583833751
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Apr 2022 11:17:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=D4aRu874;
 spf=pass (domain: linaro.org, ip: 209.85.217.47,
 mailfrom: ralph.siemsen@linaro.org)
Received: by mail-vs1-f47.google.com with SMTP id k17so13877599vsq.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Apr 2022 11:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZiaYRv5/YQkibIlCEXT+4naQpImlJ2Lr6DMqEtJvbOU=;
        b=D4aRu874RQ6wgpY66oLzYzV9RCOeHNBmawOWgwJTWTCTLZ0ibTEz4oGpvJ/fMGqlQA
         Ec7xh4h3wFGfBhAb1D9iM3Sw8I1tSO3s+a0MYUKqxSSH58rsYNtkENWr+IUZvoKOJ/KZ
         bZ43eo1X9rWGJ9m9oTE4OXH2arptWhOhMr3fo8unJkBAzNeqHRU6vfDqgphY6zGbH3o0
         iO7LZb1FZlSSPUQ/zYBjP+y+6dqbZdTvJg70j8aRKlQztjoyXlunK1g2SfNanhBfOabo
         UOmWvuyQM0p/JhJQ9zAbfnXaKWbNLTaMYkHV1n5qrFb41OrbTst7cM4GEDfbccffgj8r
         nIyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZiaYRv5/YQkibIlCEXT+4naQpImlJ2Lr6DMqEtJvbOU=;
        b=sXqIVBDNnWqPdV9RCIZutSCbCsSgPOPJClzviXyZg8an9/Ms4Th18PdeKPuvluIyUz
         6BWz2P3ncVr5UN16QVtJynVUqFEsAALHqEKFRvPgxMXRe/yBXWZchS6h8dojZwmqGerQ
         Tr4JF9wHYbkJqXoN326XYU7RXFBLFkx4Alcyx+6d5vDvQ7TVhH/odS3m/zomKrTToLv4
         QkVIt+0chV1YnSZo0EXgyNk2EbBvGrPhjh3+4aLUO5MSByOxfIoSiocnZfjQ+tRrh0mL
         /DoFgHS68xoS3ZVN5KCaBQEWy8MgAx39bkO5kMQAfsaCo4S04Wt5YkDtSC1pBTUu9BU8
         Tk7w==
X-Gm-Message-State: AOAM531Q3TGbCzzzjm63z4JURoy2YdMYyBKKtIEzB4gfXoEUPw4Eivdr
	Bt7wjfZCbMomrlCQxIv0v6NVDXuYuzZXJvPePt2h3A==
X-Google-Smtp-Source: 
 ABdhPJwnnTy9n/hF/iCudaSwgH8hqW6H6/72u3E96CNmbxBobT/9bH1DzceQAzPBgJL/UDERZgXbHhRy4k3Uzd+Ro4U=
X-Received: by 2002:a05:6102:105e:b0:328:28d4:a7ba with SMTP id
 h30-20020a056102105e00b0032828d4a7bamr4608053vsq.70.1649701037620; Mon, 11
 Apr 2022 11:17:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220329130741.2430737-1-ross.burton@arm.com>
 <CAOSpxdap6UjLpy9M--b_EMYV+m3oYOQJT002Hqw5qcpCwgTVyw@mail.gmail.com>
 <CAAnfSTuHjbiN2NKVwZOut+MjxLhuFMwn+xAWkFHaqAXmM_8Ypg@mail.gmail.com>
 <CAOSpxdZGOwUs86K6bEX3WTgVu-+fFjonKxiGEe+u1OL=ivqx+w@mail.gmail.com>
 <CAOSpxdb+O=iDpDNr7S62wut=GErTXg8cvpYsj0nn6DM9G1CL-A@mail.gmail.com>
 <CANp-EDaVN-4Z_iYXJq7OcJ1QEtpAsHTGOQkCHeW+gJ6u2b=0xQ@mail.gmail.com>
 <CAOSpxdZdi+xiJcFeyOgrLTATOaaD0hf9k-+yQmsH2+GJm8xcQw@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdZdi+xiJcFeyOgrLTATOaaD0hf9k-+yQmsH2+GJm8xcQw@mail.gmail.com>
From: Ralph Siemsen <ralph.siemsen@linaro.org>
Date: Mon, 11 Apr 2022 14:17:06 -0400
Message-ID: 
 <CANp-EDaN76FxTBEjWFe5WD3W+tHbqbfJuA=kcuW8eeyF_O8vHQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][dunfell] zlib: backport the fix for
 CVE-2018-25032
To: Steve Sakoman <steve@sakoman.com>
Cc: Ross Burton <ross@burtonini.com>, "Mittal, Anuj" <anuj.mittal@intel.com>,
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Apr 2022 16:46:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164237

On Mon, Apr 11, 2022 at 1:52 PM Steve Sakoman <steve@sakoman.com> wrote:

> I see from irc that you've discovered INHERIT += "testimage".  I think
> that might help with the above issue.

Indeed, I added that, which solved the missing do_testimage problem.
However even after rebuilding core-image sato, I do not have /etc/apt
nor apt in the image.

Looking at https://git.yoctoproject.org/poky/tree/meta/lib/oeqa/runtime/cases/apt.py?h=dunfell#n43
the apt test should be skipped. Seemingly relevant bits of "bitbake -e":

IMAGE_FEATURES=" debug-tweaks"
IMAGE_PKGTYPE="rpm"
INHERIT=" cve-check testimage poky-sanity uninative reproducible_build
package_rpm buildstats image-mklibs image-prelink debian devshell
sstate license remove-l
ibtool blacklist sanity"
TESTIMAGEDEPENDS=" cpio-native:do_populate_sysroot
dnf-native:do_populate_sysroot createrepo-c-native:do_populate_sysroot
  qemu-native:do_populate_sysroot
qemu-helper-native:do_populate_sysroot
qemu-helper-native:do_addto_recipe_sysroot"

> FWIW, I'm seeing the same error with the xz CVE fix patch too.

Interesting... and without those the tests are successful (with all
other current changes)?

Ralph

