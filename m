Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 764E1CFD317
	for <webhook@archiver.kernel.org>; Mon, 24 Nov 2025 10:42:37 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13993.1763980955241713459
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Nov 2025 02:42:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XLVMK+Pg;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-88059c28da1so43858626d6.2
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Nov 2025 02:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763980954; x=1764585754; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s6sBjps0AXwFazPle9bOwRAW/pdX74rh1nX//5Jz5JU=;
        b=XLVMK+PgC8R9g8Oa654YiFTHVA8FBCEqipXok0gyGo1RRGhIgi9gRJrszHF5OQ/h5z
         zPAtYJuEs67H0Vz03cObLcXTqjP97wrm29p6UHVRNSXlMQ3viBNE8paOXZA5vH60pEKZ
         nUmLQ1PnV/NKXOEsUvo+04seOtPQb8OKZJgujMzFT2L/q0PucZI4ui8pqR4w1qkw6QX4
         OagVGFUtgqAYAtmDFr4b50C7Syfzbe9eshfb1Gy5h2bjEerB/m7Gke2R3dXD02O5D14w
         rbff/Y8luEtpBYbo7JkzVe1ZY/Dfs0wh6jYZ7iAiE+eqicv/Xw91D/4cmSGaSgEudMoU
         mCIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763980954; x=1764585754;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s6sBjps0AXwFazPle9bOwRAW/pdX74rh1nX//5Jz5JU=;
        b=m5fo/ZbA2umgKWjomflX8FL8G1KnMQGWJ9ENU3Xy3s02WhFFnUUV2PsRm2a53r55FT
         TbFHtImIiyB+PeikXNwPqDVT2xlxUdd6NxDXChoqclHzsduqaecMxrOdoI4HTjZdWww9
         /7RA1UJNmxL57Qv40y4PS4HfZo2ulkDKaMz4+4Lcs9VkfIXRkgjRptFHuBj8looaSWod
         2ox4jU088iLYWTXoma5IBn73J6opbfbS1mBGgCN94vJe4PhGdI9wAkr1RWJHD/V0qOAt
         PmDte1QYXGNPL+MZUJEt4Zf0IKiwhCPbnI4u8HwnQLvgJDIZ/3YyGDUKpplGFdtWArN+
         xU1A==
X-Gm-Message-State: AOJu0Yyc+L5EDx1q/TsLQAyBTQjuQ3snKTZ/KqBTtU/q/+GN9n/ns5EU
	k3xUqGEOgDvZI0muzotVHULMmAAotW9YSQM5+vfzepqxe6sVtu2/7icnd+LMI8f6ijpsJhAM9ip
	r6pQDTvRdhmsDmwFlExgdLyvkBCpRWc8=
X-Gm-Gg: ASbGncsgKdS0LkLpB/in8mGyO8flfc6nDtBPqTsI5XIKJ+DE+0ArUtmBzLzWfIHBRgn
	CzC8wQ2NyjjTXA3ydRmjWOvGLc6wWnB2/GySlTM5D8XJlO+q3zE21a62z+jhhIyxs0EZlW6Yi/8
	v3ONXzUszZb9TcF6SXCf7kxitrCG3yiDguO7z97hXaD3jAD8qHiCK6spaRcfMEJuTS2kOZOZ9Fl
	zMyhh4IYh7s52w5QfgR+26YUy16gUMg4Pnt++IWU7nKpq1JtAjHJKV9zAbYwYZ53REI5miEf6Sr
	yNxe907jSTnNRwz1dkUZPiKgzKR13w==
X-Google-Smtp-Source: AGHT+IE27uvZbc5xlsJy+0Bx8pYUsqoOFNAhbMpCJWncyjMQOjBzEvjAxu+/O1sVlWZmLcKIUW345V2wU2uCOM55C40=
X-Received: by 2002:ad4:5bc3:0:b0:882:7857:a2c1 with SMTP id
 6a1803df08f44-8847c4e410fmr167772656d6.17.1763980954246; Mon, 24 Nov 2025
 02:42:34 -0800 (PST)
MIME-Version: 1.0
References: <20251124080022.2814003-1-vpuar@qti.qualcomm.com>
In-Reply-To: <20251124080022.2814003-1-vpuar@qti.qualcomm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 24 Nov 2025 11:42:23 +0100
X-Gm-Features: AWmQ_blhDGVGkATvWiZdyuC9YduBgdEhxIs8L9UY60ddw7832E62TVnCJlYV35g
Message-ID: <CANNYZj9iSMUDNP7oK7+6Ui=oezHjjk-JhzEpOPA90BKyUMg_cg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] udev-extraconf: Split automount and autonet
 into seperate packages
To: vpuar@qti.qualcomm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Nov 2025 10:42:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226740

On Mon, 24 Nov 2025 at 09:00, Vivek Puar via lists.openembedded.org
<vpuar=qti.qualcomm.com@lists.openembedded.org> wrote:
> Created two subpackages (${PN}-automount and ${PN}-autonet) to separate
> udev rules and scripts for automount and autonet functionality.
>
> If the image only needs storage devices to be auto-mounted or just needs
> network hotplug handling, splitting the packages let us choose automount or
> autonet package without having to care about other rules. This change does not
> save much space but helps avoid installing unnecessary scripts and rules.

I'm still not convinced 'not installing unnecessary files' when amount
of file is small and the files are tiny is a sufficient reason, and
this sets a precedent for any recipe being subject to such
micro-splitting, but maybe others in the patch review will disagree.

What I wanted to point out is this line that isn't changed by the patch:

RDEPENDS:${PN} = "udev util-linux-blkid
${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'util-linux-lsblk',
'', d)}"

which prompts a couple questions:

1. How was this tested? If you install only the new packages, these
dependencies will not be fulfilled.

2. Can you review what and where needs those things and adjust
RDEPENDS accordingly?

Alex

