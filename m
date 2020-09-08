Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web12.18815.1599566930128517925
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2020 05:08:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OzfY2x6g;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id o5so18801869wrn.13
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2020 05:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=B5BTkFO6LGT9UaXtdVMlDYM298dkwBtIZcZAf3omMBA=;
        b=OzfY2x6g+xQMIHswOqr6QnklHMaWH3XBvqcuFs0NKP3DrkGmJORqfSpv4uRJ50BuQ8
         aWkN2sSdL4PZBijolXO9O0jPj30ZI61NudCTfhW8ozQEMWBi649Bn6lSpqQCXMOcxrEL
         1Bax7qWFA4h1rJyZanhiLIKq7FyhgNP7hSGn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=B5BTkFO6LGT9UaXtdVMlDYM298dkwBtIZcZAf3omMBA=;
        b=IBwnMPNNa22ZfnqytVqXg1LQORMlsxYFq3HX3EE0QDzIEoTwmyxx9HFyBU7/g2Wwq+
         WL7+y+I4VJ5bYKyKhuXUgeHV7ctjP7E+dpLyyXe581LVp78kQgHXxesc40Lp4akiYERv
         pieanIMxQS2Ia74qZsYsZSa6qiB1mssQ55ym7bAbsSolELsFRe8oh1EsOzfJUbGHeDR8
         N/HavPz9ZZpjdgCpKlR9Hyq1wxUUO7mjoshRXgvgW2M6dkHHOk0ZMnA6Ox4sVj/iw2jw
         HvmxtRcpUTPot2De28FinS9hkK+I/oiT2qmBraKaAyX/M8+tZQG0e4CWNHx7udLPvur3
         uyyg==
X-Gm-Message-State: AOAM5318jQQesd1rszDXa8Q6dq8FEKM3IeuadQhCviDETPEsorJ5U1pm
	qCHEeWGKN4AH1xgCQBU3wdFExg==
X-Google-Smtp-Source: ABdhPJxsmnLuOi/VkB47q1Hiwlf4OcMfEmL1x5O2G6WSIYoRuxa0R1Zfat8sv218P00Kdil1fqI7VQ==
X-Received: by 2002:adf:ef48:: with SMTP id c8mr26937394wrp.370.1599566928458;
        Tue, 08 Sep 2020 05:08:48 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from e.4.4.b.0.8.f.4.f.c.f.0.9.0.5.8.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (e.4.4.b.0.8.f.4.f.c.f.0.9.0.5.8.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:8509:fcf:4f80:b44e])
        by smtp.gmail.com with ESMTPSA id r13sm35078962wrj.83.2020.09.08.05.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 05:08:47 -0700 (PDT)
Message-ID: <b58a594638ba6eee29528077831a52ad05dbab4a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3] wic/bootimg-efi: IMAGE_EFI_BOOT_FILES variable added to separate bootimg-efi and bootimg-partition
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Jamaluddin, Khairul Rohaizzat"
 <khairul.rohaizzat.jamaluddin@intel.com>, 
 openembedded-core@lists.openembedded.org
Date: Tue, 08 Sep 2020 13:08:46 +0100
In-Reply-To: <1599539307-52761-1-git-send-email-khairul.rohaizzat.jamaluddin@intel.com>
References: 
	<1599539307-52761-1-git-send-email-khairul.rohaizzat.jamaluddin@intel.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-09-08 at 12:28 +0800, Jamaluddin, Khairul Rohaizzat wrote:
> From: Khairul Rohaizzat Jamaluddin <
> khairul.rohaizzat.jamaluddin@intel.com>
> 
> Due to recent changes in bootimg-efi to include IMAGE_BOOT_FILES,
> when both bootimg-partition and bootimg-efi occur in a single .wks
> and IMAGE_BOOT_FILES are defined, files listed in IMAGE_BOOT_FILES
> will be duplicated in both partition.
> Since IMAGE_BOOT_FILES are crucial for bootimg-partition, but
> optional for bootimg-efi, hence allowing bootimg-efi to have the
> option
> to ignore it.
> 
> The new variable, IMAGE_EFI_BOOT_FILES, was added to help handle this
> issue. Its basic usage is the same as IMAGE_BOOT_FILES.
> Usage example:
>         ${IMGDEPLOYDIR}/${IMAGE_BASENAME}-${MACHINE}.ext4;rootfs.img
> \
> 
> This commit is also squashed with the updated testcase to cover for
> this change.
> 
> [YOCTO #14011]
> 
> Signed-off-by: Khairul Rohaizzat Jamaluddin <
> khairul.rohaizzat.jamaluddin@intel.com>
> ---
>  meta/classes/image_types_wic.bbclass          |  2 +-
>  meta/lib/oeqa/selftest/cases/wic.py           | 12 +++++++++++-
>  scripts/lib/wic/plugins/source/bootimg-efi.py |  8 ++++----
>  3 files changed, 16 insertions(+), 6 deletions(-)

The autobuilder still isn't convinced about this patch unfortunately:

https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/1338
https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/1334
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/1355
and probably
https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/1350
which it finishes.

Cheers,

Richard

