Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1504DD68B05
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 12:59:49 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.36259.1731589184026374635
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Nov 2024 04:59:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QRg0mZiX;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-539f53973fdso482077e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 04:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731589182; x=1732193982; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oGjZUdwDaC4lPU+nH7dzheco/c6xiDTi2tghJEzIKLc=;
        b=QRg0mZiXBE6mtLT7b+hh3usKcoC+zutTb/vUiq9R/KXHIe/Z/Q9ZhmDQCFd2kgHKuC
         CPh4R4Ft9+X70nwf5436V5QpieobdMB2S4/qvfqE+DpXcPgCtxdeewpK0vnxyIsD5kCe
         8UvTuBJW2FsF4l910HsrgvSq+YmK0CUclEPvGqhr2hRsGzHjKpqtksMGPOyFTthThZhF
         9IDrVImHR16Rr2sFwOKVtmyFpQkmO4PudlbWmW6yqxWkAhcSBBGscgsJVdQ/1w2NR8lL
         ngap+J/3820G4CteVrtvCrIE6KQcLVchA6WDSI8FGVzzx7O91N6dnvFGHSb74s2N2xNJ
         kSQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731589182; x=1732193982;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oGjZUdwDaC4lPU+nH7dzheco/c6xiDTi2tghJEzIKLc=;
        b=jJX4QkVhedBOpcMsV4PTdLzrEEPpw1mHYzQ1C56YfgBh71f1l4UFtcdjYBllhxMCDH
         PbIvGuQy6TOCKuPJPJ4xxxxiGH9qdXTE9mGgc9NnLiXyu49r0bImGdsQrDla+nTxKHsE
         /shTVGcQpb3/WEurwUyRgDLY+zBA3MXwVcClmk4XeGBMOS3DS4yzZ5lofmBDrBTvDWyS
         zHyvQ6G5KNVCUe7JOSws0SN1GfSIueKyp+bwgSsQsK6m0nnESf7k2Hol041gd0apyKmh
         z6M35lulvg56NXG398wNKoSVzM+Fb9UtNKuO9elKIrAp3YsVAMqiTAMP+5C+BT/Ali50
         9SOQ==
X-Gm-Message-State: AOJu0YzW2J3HzbUAKK9v7QIeZ+MAnjq7ITD4YZ/ZduXEGU9iyaF43gaC
	Npxt4WvsrN8ET9a2qRpLv5yXIVC986eutPFnNDekQkqHPCNkEgT7LtUD0BEtOJQ3LDsty4wrPC8
	Fl19A19hRsZomHd5JFcrYcWw/DEE=
X-Google-Smtp-Source: AGHT+IGqbTfB9KacAKJqxqpRnQYIsmpSo5SvQPHDV1v2MpsoGTcPTxm2f15rrv9r5GWBelCUBxvFWtTHnDXWq3epG3E=
X-Received: by 2002:a05:6512:4014:b0:53d:8c0d:8513 with SMTP id
 2adb3069b0e04-53da47a57cbmr1067671e87.8.1731589181873; Thu, 14 Nov 2024
 04:59:41 -0800 (PST)
MIME-Version: 1.0
References: <20241114124856.35716-1-mathieu.dubois-briand@bootlin.com>
In-Reply-To: <20241114124856.35716-1-mathieu.dubois-briand@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 14 Nov 2024 13:59:29 +0100
Message-ID: <CANNYZj-V=TDuXtWGmukPwDbQLeoowoc3wruG1heDAV0qS_r+yw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemtap: Add git revision to PV
To: mathieu.dubois-briand@bootlin.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 12:59:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207159

On Thu, 14 Nov 2024 at 13:49, Mathieu Dubois-Briand via
lists.openembedded.org
<mathieu.dubois-briand=bootlin.com@lists.openembedded.org> wrote:
> -PV = "5.1"
> +PV = "5.1+git"

I'm not sure I understand the reproducible 'magic' this would trigger
in systemtap's usage of 'git describe', but if this does fix things,
you need to leave a comment in the recipe asking people not to remove
"+git". This is because "+git" suffix is typically used for something
else: an indication that we're taking a revision that's several
commits after the tagged version (e.g. containing important fixes).

Alex

