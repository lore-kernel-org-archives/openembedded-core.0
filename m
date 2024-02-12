Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C55CC4829B
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 14:06:39 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web11.7099.1707746790477206253
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Feb 2024 06:06:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=0eyWI/eo;
 spf=softfail (domain: sakoman.com, ip: 209.85.160.53, mailfrom: steve@sakoman.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-2191b085639so1239084fac.0
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 06:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1707746790; x=1708351590; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zkNZnIK3f1I3cuqqi9RoJbWLPlAmQ6gzGgj8Cg+c3Uo=;
        b=0eyWI/eo9vSNLzoCrgQnfD1WUjtyTbMwj/ItTEdO7WhHmDpQc2tHeWnuNCIFQHGEzT
         XdLoRSYxshfl6jtjt1b6VlGqlbz6NFBvNd/GstswovDuH49he5P8DNTnSVjrZMcwPHp0
         0a0KiwssAFsQFojlovQW/ALXvf7ErCqj3uGnowpWv6JXunVTA8vfwnYpIhQROVQ6FR9C
         2USst8zZUY2LVGwr6tii7DdNuzAR9mz+RnLMT2T3ITqGBsS87RMAQWiEPZeHkSVVKZCi
         LqXjkx3nXz636swkDjGzFhy/aSWEx/QlPNrDwkd3X2l9tHn+iJb9XUyIwBN6kTUNCCxw
         hJ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707746790; x=1708351590;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zkNZnIK3f1I3cuqqi9RoJbWLPlAmQ6gzGgj8Cg+c3Uo=;
        b=SHyzGzu+K5TuIkrgta4KUIV9EeoYEqcDMSdomaWJ7vbQDG1QX927PBR1gcKL882TdH
         YgzIqKQQEw8ePH4hRgyXBdQBPtHCqwm6NLppkvonCKHX9xSBY1lVjC7Q20A64GMp66nC
         FhYSOnpqbdUjBS/sC4x3rQVnStaswd0kdKSvwWF5z0C1PS2O7a8LpZoKdsUifwvr5Dzt
         JSQw/oYf91jWp4PtIbaJuNKZpRTW3SMtXMyVaMObGhQ89vAPi9QOeVCGXAPiTrYv4Wny
         MAnYZl/dHHlhGmJ9bI0mtUoLIpM5TQZltPyZ3qS6KCOX/oQd5S0/9STkm1VK090vc9U3
         dS3w==
X-Gm-Message-State: AOJu0YzosRqETe2VMWrZScLG/cyf0Pmv//D7D3c8VL65qdO12H37uWEl
	Gh/86ri67GfhyVM0HX4z8MbgFgDjLwWthMEk5+86PwgRJmVMonoV3Q2lAYLzWpHYxa7mZG/ablK
	VvDhz7Q6s891kRzgCd6MpZOzndZOI8mLdqa0YEw==
X-Google-Smtp-Source: AGHT+IFlVAnD7gOCI1TZ/G9pktGwNwKU2O/Qz3L6qNdhe28Vymupq7K/LKwJzBMdcqMPGHbb2zlQc/ZcHwvguhYFHVQ=
X-Received: by 2002:a05:6358:760e:b0:176:8263:9a71 with SMTP id
 r14-20020a056358760e00b0017682639a71mr12047328rwg.13.1707746789642; Mon, 12
 Feb 2024 06:06:29 -0800 (PST)
MIME-Version: 1.0
References: <20240212104647.376386-1-ppjadhav456@gmail.com>
In-Reply-To: <20240212104647.376386-1-ppjadhav456@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 12 Feb 2024 04:06:18 -1000
Message-ID: <CAOSpxdbaZBcMLiPbPr5TZArDfEV04HQmeoGXnd=eSX8gGP2nQA@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH 1/3] scsi-disk: allow MODE SELECT
 block descriptor to set the block size
To: Poonam Jadhav <ppjadhav456@gmail.com>
Cc: openembedded-core@lists.openembedded.org, poonam.jadhav@kpit.com, 
	virendra.thakur@kpit.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 14:06:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195331

I assume that patches 1 and 2 in this series are necessary for the CVE
fix in patch 3?

If so, could you please squash this series into a single CVE fix
commit and include the reasons for the prerequisite patches in the
commit log?

Thanks!

Steve

On Mon, Feb 12, 2024 at 12:47=E2=80=AFAM Poonam Jadhav <ppjadhav456@gmail.c=
om> wrote:
>
> From: Poonam Jadhav <poonam.jadhav@kpit.com>
>
> The MODE SELECT command can contain an optional block descriptor that can=
 be used
> to set the device block size. If the block descriptor is present then upd=
ate the
> block size on the SCSI device accordingly.
>
> This allows CDROMs to be used with A/UX which requires a CDROM drive whic=
h is
> capable of switching from a 2048 byte sector size to a 512 byte sector si=
ze.
> Link: https://github.com/qemu/qemu/commit/356c4c441ec01910314c5867c680bef=
80d1dd373
>
> Signed-off-by: Poonam Jadhav <poonam.jadhav@kpit.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc           |  1 +
>  ...lock-desriptor-to-set-the-block-size.patch | 54 +++++++++++++++++++
>  2 files changed, 55 insertions(+)
>  create mode 100644 meta/recipes-devtools/qemu/qemu/scsi-disk-allow-MODE-=
SELECT-block-desriptor-to-set-the-block-size.patch
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
> index c5fb9b1eab..13355238e8 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -103,6 +103,7 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.t=
ar.xz \
>            file://CVE-2021-3638.patch \
>            file://CVE-2023-1544.patch \
>            file://CVE-2023-5088.patch \
> +           file://scsi-disk-allow-MODE-SELECT-block-desriptor-to-set-the=
-block-size.patch \
>             "
>  UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>
> diff --git a/meta/recipes-devtools/qemu/qemu/scsi-disk-allow-MODE-SELECT-=
block-desriptor-to-set-the-block-size.patch b/meta/recipes-devtools/qemu/qe=
mu/scsi-disk-allow-MODE-SELECT-block-desriptor-to-set-the-block-size.patch
> new file mode 100644
> index 0000000000..d8e48d07dd
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/scsi-disk-allow-MODE-SELECT-block-d=
esriptor-to-set-the-block-size.patch
> @@ -0,0 +1,54 @@
> +From 356c4c441ec01910314c5867c680bef80d1dd373 Mon Sep 17 00:00:00 2001
> +From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> +Date: Wed, 22 Jun 2022 11:53:12 +0100
> +Subject: [PATCH] scsi-disk: allow MODE SELECT block descriptor to set th=
e
> + block size
> +
> +The MODE SELECT command can contain an optional block descriptor that ca=
n be used
> +to set the device block size. If the block descriptor is present then up=
date the
> +block size on the SCSI device accordingly.
> +
> +This allows CDROMs to be used with A/UX which requires a CDROM drive whi=
ch is
> +capable of switching from a 2048 byte sector size to a 512 byte sector s=
ize.
> +
> +Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> +Message-Id: <20220622105314.802852-13-mark.cave-ayland@ilande.co.uk>
> +Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> +
> +Comment: Patch is refreshed
> +Upstream-Status: Backport [https://github.com/qemu/qemu/commit/356c4c441=
ec01910314c5867c680bef80d1dd373]
> +Signed-off-by: Poonam Jadhav <poonam.jadhav@kpit.com>
> +---
> + hw/scsi/scsi-disk.c  | 6 ++++++
> + hw/scsi/trace-events | 1 +
> + 2 files changed, 7 insertions(+)
> +
> +diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
> +index db27e834dae3..f5cdb9ad4b54 100644
> +--- a/hw/scsi/scsi-disk.c
> ++++ b/hw/scsi/scsi-disk.c
> +@@ -1616,6 +1616,12 @@ static void scsi_disk_emulate_mode_select(SCSIDis=
kReq *r, uint8_t *inbuf)
> +         goto invalid_param;
> +     }
> +
> ++    /* Allow changing the block size */
> ++    if (bd_len && p[6] !=3D (s->qdev.blocksize >> 8)) {
> ++        s->qdev.blocksize =3D p[6] << 8;
> ++        trace_scsi_disk_mode_select_set_blocksize(s->qdev.blocksize);
> ++    }
> ++
> +     len -=3D bd_len;
> +     p +=3D bd_len;
> +
> +diff --git a/hw/scsi/trace-events b/hw/scsi/trace-events
> +index 8e927ff62de1..ab238293f0da 100644
> +--- a/hw/scsi/trace-events
> ++++ b/hw/scsi/trace-events
> +@@ -338,6 +338,7 @@scsi_disk_dma_command_READ(uint64_t lba, uint32_t len=
) "Read (sector %" PRId64 ", count %u)"
> + scsi_disk_dma_command_WRITE(const char *cmd, uint64_t lba, int len) "Wr=
ite %s(sector %" PRId64 ", count %u)"
> + scsi_disk_new_request(uint32_t lun, uint32_t tag, const char *line) "Co=
mmand: lun=3D%d tag=3D0x%x data=3D%s"
> + scsi_disk_aio_sgio_command(uint32_t tag, uint8_t cmd, uint64_t lba, int=
 len, uint32_t timeout) "disk aio sgio: tag=3D0x%x cmd=3D0x%x (sector %" PR=
Id64 ", count %d) timeout=3D%u"
> ++scsi_disk_mode_select_set_blocksize(int blocksize) "set block size to %=
d"
> +
> + # scsi-generic.c
> + scsi_generic_command_complete_noio(void *req, uint32_t tag, int statuc)=
 "Command complete %p tag=3D0x%x status=3D%d"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195307): https://lists.openembedded.org/g/openembedde=
d-core/message/195307
> Mute This Topic: https://lists.openembedded.org/mt/104309090/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

