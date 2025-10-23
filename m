Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A9D2CCD1BE
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 11:03:32 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web10.17361.1761217408593919583
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 04:03:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ip21v/cj;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-87c148fb575so7314396d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 04:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761217407; x=1761822207; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qkZySqFPhRhZnsoF3q/3dg9P7JQ1ZMzN6CNJVDgG7f0=;
        b=Ip21v/cj5WMXHTrilPGncx2CvoL0oCqd7aze8yhdbXbf2ea6nGoPql/l3n9L/jj/wt
         /zs3Lx6fURphDIYHtWepe1nnoAMtnURFHGBSqDfQcMM9Am1rrVBh8h898YUpbtGU6RbT
         QbEwi+JXgCloafaiSFhW12Lew9+/q3bE2nofHLd2wHhz3yK9OrrTmwkhpbNkltdEGEua
         peYnC6mJ+9htYE29QMX6Zdp+jfC6SA6/Tph5Jct6KEdlWvZtylZei4mgQHAfvu0TEE8l
         TFioUmbshainSHDDEUj9FD2g8GWgNXKjuVitT6KOTGtfjqnItIMSgUbV1joFNKLfJZFU
         svoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761217407; x=1761822207;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qkZySqFPhRhZnsoF3q/3dg9P7JQ1ZMzN6CNJVDgG7f0=;
        b=Luss+7MIWXpEXMN7tcOzBJo6y5MX0KQ8jHv6OQJu9WUGXrf+BiVNRrhHJyA19HfnBV
         7EEHN14QfG/OAG2Za1Pm6x8NcRvJhKOgC7+mYafS4vuZavlLl4IqaO0EZ9bS4fht95tS
         3sUuJKMv7aFWR7eFUPNb0Er9Yu1K094W9iSfSsDdrEfbS3s8rjma9QkEdWjdOzYCrx7u
         QsVrk5T6FxhCLZaEbf6WuPjQEd+PqA+sJUUijE8bPEJYESyTUXPjxbD2GFsoIobqOjZt
         2/G2iWksN/bhQNSmg8JTA7VlfV0qAO9hgr0jyiOmP+xdmyvNo0X57RKos6II3yIvXyWl
         7Bhg==
X-Gm-Message-State: AOJu0YzhnZFLH+3KHVb4CbOXlUHH4AlCkrC927JPveQ9L9rtcUca5fY6
	GxCF5WBHLfUA415biHHSL7M8TSKLCUhPVbP9kCZHAiYy8KaP/MkVxz/dr39YWDcTtw5PGv+x4Wr
	TNi4CHqkWoCVCtLGkgvfl/3UsZ6rt3nDJg5Xa
X-Gm-Gg: ASbGncsuUamo2MitwcVVI5FbT0U1TvZrE49+G8hx9HMu4f+Xm9rCm5WUQ2oX5kNZZ6M
	i7RMcaGeuRxmcyUGBunho9iqLGLSeN8XUkpNLgn88IZdDvcOQwo2MHMTNPOfSjjr9oPreiwwwL6
	IVBFcQU+icFJOsnPS+uPTA0mtnvWXOxpi2z27ks37UBjvBF07Z5MEOFn7/QeB8u4CWASW3ExkuG
	60/CdV7lWWGizppuDMinc4S+ElSXWINVRjqaKIVj5QaLF0KxCBxDRVK42tXPJARbkiL9aJ0mj4J
	puic2ehWQGrY/AeZpdHecUcuo7yoBPgRPEIB63Y/Z6V4xZBSxS/RakUqOA==
X-Google-Smtp-Source: AGHT+IG2v/ty4cJE64Z31D3+Yk0wmx0N6ogOeMJOXxf1tYFbv6Ot0nd88t2Fej2mblj/rj2XOwxT7/gHKBd+mCKgBm0=
X-Received: by 2002:a05:6214:2aaa:b0:80b:11b7:210b with SMTP id
 6a1803df08f44-87c205ed463mr309888096d6.43.1761217407505; Thu, 23 Oct 2025
 04:03:27 -0700 (PDT)
MIME-Version: 1.0
References: <20251022132307.2905011-1-hongxu.jia@windriver.com>
In-Reply-To: <20251022132307.2905011-1-hongxu.jia@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 23 Oct 2025 13:03:16 +0200
X-Gm-Features: AWmQ_bkNTWwtUyBT_Keso7EpIsJdPKHteV_RhuNIN2oTNdxC0YknMl_qBf8mz6w
Message-ID: <CANNYZj9bV9k=h0xHWSh82w8JV5qOC8Ym9_gYA6+CcNuejZvvcQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] util-linux: fix uuidd failed with /run/uuidd
 not found
To: hongxu.jia@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 11:03:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225233

On Wed, 22 Oct 2025 at 15:23, hongxu via lists.openembedded.org
<hongxu.jia=eng.windriver.com@lists.openembedded.org> wrote:
>
> It failed to run uuidd
> ...
> root@qemux86-64:~# uuidd
> uuidd: cannot open /run/uuidd/uuidd.pid: No such file or directory
> ...
>
> Create dir /run/uuidd for both of systemd and sysvinit

The commit does quite a bit more than this, and I think a bit of
further research is needed.

> +    /etc/tmpfiles.d/uuidd.conf \
> +    /etc/default/volatiles/99_uuidd \

 Specifically, how are these this handled in common binary distros?
What do Debian/Fedora do? Presumably they contain the same files in
the root filesystem, how and when those are created?


> +pkg_postinst:${PN}-uuidd() {
> +       if [ -z "$D" ] && [ -e ${sysconfdir}/init.d/populate-volatile.sh ] ; then
> +               ${sysconfdir}/init.d/populate-volatile.sh update
> +       fi
> +}

What is this for? Why does it need to be run? Why is it conditional on
both $D and existence of the file it wants to run?

> +       if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
> +               install -d ${D}${sysconfdir}/tmpfiles.d
> +               echo "d /run/uuidd 0755 root root - -" > ${D}${sysconfdir}/tmpfiles.d/uuidd.conf
> +       fi
> +
> +       if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
> +               install -d ${D}${sysconfdir}/default/volatiles
> +               echo "d root root 0755 /run/uuidd none" > ${D}${sysconfdir}/default/volatiles/99_uuidd
> +       fi

This looks like it should be solved with a patch to upstream, but
again, first we need to find out what binary distros do.

Alex

