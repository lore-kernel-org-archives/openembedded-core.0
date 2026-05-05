Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6C48FF8855
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 17:10:44 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1460.1778001035495896978
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 10:10:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=wJjPmJn9;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48d102471a4so22365825e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 10:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778001034; x=1778605834; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=voJyju7V23g+aqBgDONDfPKnusXJAR3WnO6izTiuf8Y=;
        b=wJjPmJn9bnSsU4MwVqaBHqr8m2G7V2NoKBoGgPd/UObQoE9SwLudTqRyBml+m63O42
         80anXmZdZkxFV4NzJ2tqskFu2vjrf4KmyRasOlkiifR1J76y4orM/+YwLT1Ymt/vpOOQ
         EGWlcfX5dHBYomXdRETULYuBeHBGdfZZ8LMJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778001034; x=1778605834;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=voJyju7V23g+aqBgDONDfPKnusXJAR3WnO6izTiuf8Y=;
        b=GZPXmp6uCTu/hshak/weYqG/utNpZrFHHVJTxU+F60pM4I57I0XDMSAre3picIDn0r
         Q3gO8wKncrnl/F1Nq1SX6heULKEU16J6ggfRxYDFg/wrfWBUTK5GrlGY5nypTi43Ho+q
         dzrcUATzqOiIVo96fRZeOpdSGkfSOlVY7zoup2Kji/rYFoDiqBf0ZbHWCTNmCjATch3t
         txFYqobL7bnHT9Y7B6UWa+4AtY1XvmxYigwNvtqRAj788crwRZeDyK2okg6yLgfLylqO
         CMsolXYFFa4XNpWEFP74cz8ZHuLea/5SfNA15GeZpFxna3d+QoOq8kKNsyB330E34MIA
         752A==
X-Forwarded-Encrypted: i=1; AFNElJ8fTKLOx6gfrMbpKyjC8GiYGRTkzMikFeXpgh06bR/aMpzJzJZksNXmjDSe5M57ddh9XmdH0FtkxdOXLiOVSGOvRg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzdVyplMuV0Cn/0y4fnxjnEKnTwQXr+MF0He8alh6pmbcD4d9Jl
	+WVQ/bo8qRJsS7h3VaT742S2//7edmMaskXvTgpRwygtfDODd6zKd35rw2qjHrOBWhw=
X-Gm-Gg: AeBDiesd8fXZbjiTjGK4uyREuw72QlmQnU1yGOaPRcw2VwBNp6Fj1dEsmc0JnXl6+ZH
	TsdhTWDSKu5KgIPC3hqzXe/DfhmN2DnT4GC9n/QekZbcWk2qVUWMzC63iCI4fY6VqnxwVvjFpJP
	jkPNE478b9AjsS2l05OFk9tw8/q/SQlvYAn3GaMp2S540a/u+/zgRx1t5uNrkX3rLrO3zRqB31p
	n4lHbCCnn+TQ2Xfh/8xeeA3iliJoFR1yCu6Rh3ibtmQqLjJbodOr95Y/PiUx4QrwXhLrUrop+J8
	DUXUXwdoteywC+5mSuMXwbNnTm+aybu8C2Kx77QRubxeVrOCo1vpkFY6KH8EXkXXlP2DKSguUdp
	SLzZGuHJdjbcDWNe7lcpoi6XZEzwr4iw9muDC/cziNjD/wZPB0bPBZMHRpSoedfMBNJwnSAc8h4
	X6Y2lkp06ZZwTyhW03cpfJSGP2pW7fnuUFzzp+KhI0dm6KwAk43bnTZids4kxUii+eIEj51aIVg
	SM8SF7lPKbm5n8/bOV5EmoQQw==
X-Received: by 2002:a05:600c:4e0c:b0:489:e696:8362 with SMTP id 5b1f17b1804b1-48e51f3fa43mr1995555e9.13.1778001033846;
        Tue, 05 May 2026 10:10:33 -0700 (PDT)
Received: from localhost ([2a01:e0a:8cc:5b00:b8fa:c45c:f26d:53a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb3427fsm599439955e9.0.2026.05.05.10.10.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 10:10:32 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 May 2026 19:10:32 +0200
Message-Id: <DIAWRI7WHGTM.1G07US9AITCZE@smile.fr>
To: <fabien.thomas@smile.fr>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap 00/23] Patch review
From: "Fabien Thomas" <fabien.thomas@smile.fr>
X-Mailer: aerc 0.21.0
References: <18ACB9D86B39B3E5.2281050@lists.openembedded.org>
In-Reply-To: <18ACB9D86B39B3E5.2281050@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 17:10:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236518

On Tue May 5, 2026 at 6:57 PM CEST, Fabien Thomas via lists.openembedded.or=
g wrote:
> Please review this set of changes for scarthgap and have comments back by
> end of day Thursday, May 6.
Please note a correction to my previous email.
Comments are expected by Thurday May 7, not 6.

My apologies,
>
> Passed a-full on autobuilder:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3774
>
> The following changes since commit dc2df90b1d4f71023169d492f3819326e0e6c0=
55:
>
>   liburcu: upgrade 0.14.0 -> 0.14.2 (2026-04-24 16:06:21 +0200)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/openembedded-core-contrib stable/scarthgap=
-nut
>   https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/=
scarthgap-nut
>
> for you to fetch changes up to 3c2f2b6f7af2bb743655859b64faae4786080cb9:
>
>   libsoup: fix CVE-2025-32049 (2026-05-05 13:01:04 +0200)
>
> ----------------------------------------------------------------
>
> Adarsh Jagadish Kamini (2):
>   binutils: fix CVE-2025-69647
>   binutils: fix CVE-2025-69648
>
> Bruce Ashfield (3):
>   linux-yocto/6.6: update to v6.6.124
>   linux-yocto/6.6: update to v6.6.126
>   linux-yocto/6.6: update to v6.6.127
>
> Changqing Li (2):
>   libsoup: fix CVE-2025-14523
>   libsoup: fix CVE-2025-32049
>
> Fabien Thomas (1):
>   ghostscript: Pin to C17 std
>
> Himanshu Jadon (1):
>   apt: Add CVE_PRODUCT to support product name
>
> Hitendra Prajapati (3):
>   rsync: fix for CVE-2026-41035
>   systemd: fix for CVE-2026-40225
>   systemd: fix for CVE-2026-40226
>
> Hongxu Jia (3):
>   u-boot: fix CVE-2025-24857
>   ovmf: fix CVE-2025-2296
>   ovmf: fix CVE-2024-38798
>
> Hugo SIMELIERE (3):
>   expat: patch CVE-2026-32776
>   expat: patch CVE-2026-32777
>   expat: patch CVE-2026-32778
>
> Jhonata Poma-Hansen (1):
>   dbus: gate user-session PACKAGECONFIG on systemd in DISTRO_FEATURES
>
> Martin Jansa (1):
>   ghostscript: fix build with gcc-15 on host
>
> Sudhir Dumbhare (1):
>   libpng: fix CVE-2026-33636
>
> Vijay Anusuri (2):
>   avahi: Fix CVE-2026-34933
>   gdk-pixbuf: Fix CVE-2026-5201
>
>  .../u-boot/files/CVE-2025-24857.patch         |  42 +
>  meta/recipes-bsp/u-boot/u-boot-common.inc     |   4 +-
>  meta/recipes-connectivity/avahi/avahi_0.8.bb  |   2 +
>  .../avahi/files/CVE-2026-34933-1.patch        | 108 +++
>  .../avahi/files/CVE-2026-34933-2.patch        |  96 +++
>  meta/recipes-core/dbus/dbus_1.14.10.bb        |   2 +-
>  .../expat/expat/CVE-2026-32776.patch          |  91 +++
>  .../expat/expat/CVE-2026-32777-01.patch       |  49 ++
>  .../expat/expat/CVE-2026-32777-02.patch       |  66 ++
>  .../expat/expat/CVE-2026-32778-01.patch       |  91 +++
>  .../expat/expat/CVE-2026-32778-02.patch       |  61 ++
>  meta/recipes-core/expat/expat_2.6.4.bb        |   5 +
>  ...mdSev-Halt-on-failed-blob-allocation.patch | 159 ++++
>  .../ovmf/ovmf/CVE-2024-38798.patch            | 116 +++
>  .../ovmf/ovmf/CVE-2025-2296-1.patch           | 762 ++++++++++++++++++
>  .../ovmf/ovmf/CVE-2025-2296-2.patch           | 175 ++++
>  .../ovmf/ovmf/CVE-2025-2296-3.patch           |  42 +
>  .../ovmf/ovmf/CVE-2025-2296-4.patch           |  34 +
>  .../ovmf/ovmf/CVE-2025-2296-5.patch           |  36 +
>  .../ovmf/ovmf/CVE-2025-2296-6.patch           |  54 ++
>  .../ovmf/ovmf/CVE-2025-2296-7.patch           | 124 +++
>  .../ovmf/ovmf/CVE-2025-2296-8.patch           | 125 +++
>  .../ovmf/ovmf/CVE-2025-2296-9.patch           | 108 +++
>  meta/recipes-core/ovmf/ovmf_git.bb            |  11 +
>  .../systemd/systemd/CVE-2026-40225-01.patch   | 131 +++
>  .../systemd/systemd/CVE-2026-40225-02.patch   |  39 +
>  .../systemd/systemd/CVE-2026-40226-01.patch   |  63 ++
>  .../systemd/systemd/CVE-2026-40226-02.patch   |  39 +
>  meta/recipes-core/systemd/systemd_255.21.bb   |   4 +
>  meta/recipes-devtools/apt/apt_2.6.1.bb        |   3 +
>  .../binutils/binutils-2.42.inc                |   2 +
>  .../binutils/binutils/CVE-2025-69647.patch    |  85 ++
>  .../binutils/binutils/CVE-2025-69648.patch    | 190 +++++
>  .../rsync/files/CVE-2026-41035.patch          |  39 +
>  meta/recipes-devtools/rsync/rsync_3.2.7.bb    |   1 +
>  ...Fix-compatibility-with-C23-compilers.patch |  67 ++
>  .../ghostscript/ghostscript_10.05.1.bb        |   3 +
>  .../gdk-pixbuf/gdk-pixbuf/CVE-2026-5201.patch |  44 +
>  .../gdk-pixbuf/gdk-pixbuf_2.42.12.bb          |   1 +
>  .../linux/linux-yocto-rt_6.6.bb               |   6 +-
>  .../linux/linux-yocto-tiny_6.6.bb             |   6 +-
>  meta/recipes-kernel/linux/linux-yocto_6.6.bb  |  28 +-
>  .../libpng/files/CVE-2026-33636.patch         |  99 +++
>  .../libpng/libpng_1.6.42.bb                   |   1 +
>  .../libsoup-3.4.4/CVE-2025-14523.patch        | 715 ++++++++++++++++
>  .../libsoup-3.4.4/CVE-2025-32049-1.patch      | 229 ++++++
>  .../libsoup-3.4.4/CVE-2025-32049-2.patch      |  34 +
>  .../libsoup-3.4.4/CVE-2025-32049-3.patch      | 134 +++
>  .../libsoup-3.4.4/CVE-2025-32049-4.patch      | 292 +++++++
>  meta/recipes-support/libsoup/libsoup_3.4.4.bb |   5 +
>  50 files changed, 4601 insertions(+), 22 deletions(-)
>  create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2025-24857.patch
>  create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2026-34933-=
1.patch
>  create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2026-34933-=
2.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-32776.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-32777-01.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-32777-02.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-32778-01.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-32778-02.patch
>  create mode 100644 meta/recipes-core/ovmf/ovmf/0001-AmdSev-Halt-on-faile=
d-blob-allocation.patch
>  create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2024-38798.patch
>  create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2025-2296-1.patch
>  create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2025-2296-2.patch
>  create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2025-2296-3.patch
>  create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2025-2296-4.patch
>  create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2025-2296-5.patch
>  create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2025-2296-6.patch
>  create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2025-2296-7.patch
>  create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2025-2296-8.patch
>  create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2025-2296-9.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/CVE-2026-40225-01.p=
atch
>  create mode 100644 meta/recipes-core/systemd/systemd/CVE-2026-40225-02.p=
atch
>  create mode 100644 meta/recipes-core/systemd/systemd/CVE-2026-40226-01.p=
atch
>  create mode 100644 meta/recipes-core/systemd/systemd/CVE-2026-40226-02.p=
atch
>  create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-6964=
7.patch
>  create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-6964=
8.patch
>  create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-41035.patc=
h
>  create mode 100644 meta/recipes-extended/ghostscript/ghostscript/0001-Bu=
g-708160-Fix-compatibility-with-C23-compilers.patch
>  create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2026-520=
1.patch
>  create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-33636.p=
atch
>  create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-1=
4523.patch
>  create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-3=
2049-1.patch
>  create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-3=
2049-2.patch
>  create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-3=
2049-3.patch
>  create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-3=
2049-4.patch




--=20
Fabien Thomas
Smile ECS


