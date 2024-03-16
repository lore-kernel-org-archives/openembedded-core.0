Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2A81C54E5D
	for <webhook@archiver.kernel.org>; Sat, 16 Mar 2024 16:52:20 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.1009.1710607934260497763
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Mar 2024 09:52:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kLZKivUS;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2d46c44dcc0so38856291fa.2
        for <openembedded-core@lists.openembedded.org>; Sat, 16 Mar 2024 09:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710607932; x=1711212732; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qyKFlv3Wa44myQF3TQo73fS/xtlrzrGwOqxc5AeC6Oo=;
        b=kLZKivUS7VSi6TMc+HU7/ldZ/yJtXYY1PpJdXqPMdhKOAvt7S7oil8ILftIIThiSHO
         ZV1ONBxGRVHxKKTekv/Q0kFkPqhgmfiQhuKt2YtL2Sx7HHpjxo7ml469NZi9vCEd5JpL
         vm+ZfdXw5mZTUGI1P8FFeiNp77G8ULfr+ilzgfC1xn3UoUOvvmcyHbELghjyOwV5qIOZ
         vk0thQHfeT/SsD0SPmvqMl9FHxjrWuOFZTKchPWsde7wh1rbOm8C6s9Grj11MeS9oTq6
         k1T40MNsEyaxuOsYrROJr1SGOdfwvY9MZtVmVYf4HJYsGk9Ng4lmLrBMcqWLtlcHhAjs
         h8pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710607932; x=1711212732;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qyKFlv3Wa44myQF3TQo73fS/xtlrzrGwOqxc5AeC6Oo=;
        b=Hm9w0fkfo+DZQOC6ADVGk5P4CjcHcDmaa5h2BS2/JfEjVFwi1HLKL4NS/gS+UibKI3
         kFPANc6RjivKEyuJSkEc7yw2XVCfD5eN2iGssWqzdFYUxEd2HVXhuPB1yl3X08tSC0LQ
         C7iBnmCkDUTK1aWCa7/nQGoLpfWZFNk3Msst3YpV+y/77JG/ZK5gHQMh4cFlAmKSjeHm
         h8yvG4rl4oI9L+/tT5rr9sWRri6I2PQ27FE9c/230G+Wl5YCjDXi7A97453j2gH9wY4G
         /rkdx4OjPs3UyMUpL+8nMTtDU55Xkkix9qDMVtHnoPRDVepfKEGWRrKck7U38b0w50Bk
         lz3g==
X-Forwarded-Encrypted: i=1; AJvYcCXX1NoB3BmUOMieIAAhN1I5VcOIvxsffLzpsF10OmJpyb3p/cSG27wDD+HYeTwQCB3a7zaL8BXssEPO/epI849PmbSCQ9zkz10vVTmJdHPtRlP0GvqJoIwB
X-Gm-Message-State: AOJu0YzHbiKlUlXkdUErg8HmG+E2jgqiiHXN7bZzRGAaXUuLCZrqsNcZ
	UVubFI6OFh/Jyg5M4PXhRJ1TyLDpV9Qw//5jlvJyluvVMgTyqMQcO5EKVWycIMS/jL8NiEHBmk2
	4ZT/WZ8MG0TTTwDwQvM0K0LDPI9Q=
X-Google-Smtp-Source: AGHT+IHnNmBXjoWgKHDAIOI8kipZz5gwHkr1KgWt4cQZ/9nnSkr6db9A48lyQHjrBpU5SMdBUwtBKM2f7jGHm0bcs0Y=
X-Received: by 2002:a2e:740d:0:b0:2d4:49d0:d20b with SMTP id
 p13-20020a2e740d000000b002d449d0d20bmr4933581ljc.5.1710607932257; Sat, 16 Mar
 2024 09:52:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240316001943.3733687-1-rs@ti.com>
In-Reply-To: <20240316001943.3733687-1-rs@ti.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 16 Mar 2024 17:52:05 +0100
Message-ID: <CANNYZj_qsiHUM08irST1aONGtWARW0FJTA8OdKoFwC7VpstpCA@mail.gmail.com>
Subject: Re: [oe-core][PATCH] bzip2: add libbz2.so.1.0 link for compat
To: rs@ti.com
Cc: richard.purdie@linuxfoundation.org, reatmon@ti.com, denys@konsulko.com, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 16 Mar 2024 16:52:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197255

It's better to backport the upstream patch, as nobody's going to
remember why do_install snippet is there, or to remove it when there's
a new release (if it doesn't cause installation conflicts).

Alex

On Sat, 16 Mar 2024 at 01:19, Randolph Sapp via lists.openembedded.org
<rs=ti.com@lists.openembedded.org> wrote:
>
> From: Randolph Sapp <rs@ti.com>
>
> Add a link from libbz2.so.1.0 to libbz2.so.${PV} for compatibility with
> other distributions.
>
> A handfull of distributions are still using the "Makefile-libbz2_so" to
> generate libbz2 and bzip2-shared. This creates a library with a soname
> of "libbz2.so.1.0". This library link is not provide by default in
> autotools builds so add one here as Gentoo does now [1].
>
> This has been addressed upstream already, but there hasn't been a stable
> release since then [2].
>
> [1] https://bugs.gentoo.org/338321
> [2] https://gitlab.com/bzip2/bzip2/-/merge_requests/42
>
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>  meta/recipes-extended/bzip2/bzip2_1.0.8.bb | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
> index 4e3a06f240..4453171701 100644
> --- a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
> +++ b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
> @@ -62,6 +62,11 @@ do_install_ptest () {
>         sed -i -e "s|^Makefile:|_Makefile:|" ${D}${PTEST_PATH}/Makefile
>  }
>
> +# add the following link for cross-distro compatibility
> +do_install:append () {
> +       ln -s libbz2.so.${PV} "${D}${libdir}/libbz2.so.1.0"
> +}
> +
>  FILES:libbz2 = "${libdir}/lib*${SOLIBS}"
>
>  RDEPENDS:${PN}-ptest += "make bash"
> --
> 2.44.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197252): https://lists.openembedded.org/g/openembedded-core/message/197252
> Mute This Topic: https://lists.openembedded.org/mt/104959821/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

