Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A61BC369A8
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 10:12:50 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web10.22366.1744366365317691627
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Apr 2025 03:12:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JLyoVNsK;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6e8f7019422so15882576d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 03:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744366364; x=1744971164; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IR/oB7hk4PWaJlIGq1ux4F9F1+ouL4gylNt8/PGS06g=;
        b=JLyoVNsKmW+4gGjON4O3Kqc1o7x3j+Azco7quIV/guu+lv9xz7TPAaq9XQUqoQIOuz
         ZZinoddQykIiUy9vQ7UTVvalyBJC71n3hZg8U+LyK9CDaTFSZfpgk0X/ELWuvIaYveDN
         npBxv27nc1/DME9dTmsliKJhDnt5dSEGPMxH4Bl9s7L6V5SGEal8m/ZOtr4MWgBdFp/K
         P4KoCKQIvgpeIEdAj7vrT9r7XASLL/bCJT6vF0lr0wYiTlg4kvkR7us1ioha3qRxtzjI
         5rK4+DaoetKYnmo8SzDHOA3sgd0iuDAtjJyHiKDqfhGv0jDZ1mV6KUYACzC19ctpjnnh
         x3nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744366364; x=1744971164;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IR/oB7hk4PWaJlIGq1ux4F9F1+ouL4gylNt8/PGS06g=;
        b=Ulv71AQ90yNaiGGHaG1bqHW/zTL30s1ImKQdPZTXiI1l/8VazY/leKKI//tTyo9tz9
         EAAhwhiCKePTWA5ccpNv4N9hw+l3Ukah1Xhr2jPEO6uyEyULheaB0PZPZGw08PciYM3P
         E29w158VZNlZKP9eflrmxp5nhAS8Wshx+idxuumYHJF7jzk446zvHeXbcDOwhTUzR6M0
         xu9B2+anrWvw7cEDvcqNDA00b7fTx2FU543EhzJVAfeXAMjVMYXNQYv2sGU/Rq9HCjbK
         0g2TjWcdd6TtJDPatSVBGZ4yC478tImbi9VnEjM3hygb0x1FzFRxtpAKJ9Y+KCmXVZJv
         3H8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUYPibsLWYa9PQqVOfvpQk2EQ9eCKXzXeENT5IZ816/HEAI1vny5vozylt2UChacRv1HkpELE+OdRQ4OPAWUHRXpg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzE5rPnYrSHBFKX59v1Hx0rSUjpzEWwPq3eQjgmY+i1uGHlbXd3
	eZ1Lo0lgrf3t1b2+/nxnrsNY2N5V0TsRY4g/y6grDJqOsIKjeEsd3jjQfVYojB4SboFcV9K7pA6
	ulG2zfWXqUUX8naD5PNtRICw47VM=
X-Gm-Gg: ASbGncttZzLDMGECY8Y9aSXpgKQPFo0+s+/qYpGHSQlQUU4bpO6jB5/wGG6uA5we3uB
	70nCsE4//6KKwmfePYW0fDdWW3vABAOrq7Rsg2s9obZKjLhIsRmDn8wray0DVw5iZF90XWAQh/3
	SVKevlMMw8bRunWdS6DoX+nrn2R7xzqQQj3OMovkVcNyXHFzHc15y8GCuZ
X-Google-Smtp-Source: AGHT+IF+bLImdr5dUn7uM1CPZxLMSFOtxYvb611eokkbRH2lnDGsd/dodb5LrIfUwgcZhJrcsvpbmUSTpfVkVu+ZJII=
X-Received: by 2002:ad4:5761:0:b0:6e4:3c52:d67e with SMTP id
 6a1803df08f44-6f230d50b2bmr35274316d6.18.1744366364400; Fri, 11 Apr 2025
 03:12:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250406180920.262141-1-quic_vkraleti@quicinc.com>
 <CANNYZj-JtbiNz37guCB_mJbOb19GJSDTpmAyY0_ZtDHr7yM7Sg@mail.gmail.com>
 <5xm5ehw5pf5olcfqvlh2t6jqn5bq2uged36gjvoovjj7ihg7r2@fbsiin2cu6wr>
 <CANNYZj_7xdpUO9fAtvgqEi07n5CqEHaqeKaAnUjufmS57oTf6g@mail.gmail.com>
 <3mmfhxscjnsdpimcrsw72sjvumxh5cnjrntro3ko7etgtjmqzc@slvytxctp6lv>
 <CANNYZj_6bKTFQburZyBOq7sO_7coVsh_ZTiu+r2byWYdo4DYxQ@mail.gmail.com> <s2gh445rrjgnljexk25k2k5tnbf2ogkcrtb2twykoujpcsdype@yjgziyjlhdaa>
In-Reply-To: <s2gh445rrjgnljexk25k2k5tnbf2ogkcrtb2twykoujpcsdype@yjgziyjlhdaa>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 11 Apr 2025 12:12:33 +0200
X-Gm-Features: ATxdqUETAHbhhhh2HDngPDEZ1Tmlm5jDax0rNGvs4X0ZAKTDmqKhAYufqqD_1sE
Message-ID: <CANNYZj8yxBZZ9_j6OLKhp4q-1jwudHsikv+sN7EYnk9rG_Ohqw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libinput: split udev rules into a separate package
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: quic_vkraleti@quicinc.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 10:12:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214726

On Thu, 10 Apr 2025 at 20:36, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
> > Can you provide a way to reproduce this with just oe-core/poky?
>
> echo 'RDEPENDS:${PN} += "libinput"' >> ../meta/meta/recipes-graphics/packagegroups/packagegroup-core-weston.bb && bitbake bitbake packagegroup-core-weston
>
> ERROR: packagegroup-core-weston-1.0-r0 do_package_write_ipk: An allarch packagegroup shouldn't depend on packages which are dynamically renamed (libinput to libinput10)

Yes, I can see it. The reasoning still doesn't hold water though - "we
can't put a library package into a packagegroup for <reasons>, but
fortunately it has some stuff that can be split into its own package,
and then that can be used as a proxy".

What's the original reason for wanting to add libinput to a packagegroup?

Alex

