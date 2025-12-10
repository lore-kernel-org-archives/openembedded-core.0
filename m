Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E6CAD2CE17
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 09:19:31 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11510.1765358363506427949
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Dec 2025 01:19:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TzEsjbMr;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-88056cab4eeso47821306d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 01:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765358362; x=1765963162; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PzT3RAmckBYbP5TA/l7BwjgJQIBw/GvPZ/+f/ed2uZI=;
        b=TzEsjbMr6U7FDzU4wrI0rVNWRUR5koPQk1gWNbetskr+zdjpoQ/bRtfOw0wnGDwqqo
         4X8yi2JTGMN8RKdsFyCtorD+TTIthYGxWk193V536kfR5bvUozx8mNJuegFbC/zNBmZx
         IDQsTgNYTkeqoj08cs46opLMyUA5bjO912GIGktQtCoGCfH2yfqrE3def88aBoa+rmQ+
         a5wVM8kmYAqhoScDhaz67djyn4nzA3NitgsU7U8h5AELiTKRuNRz5d1fd6WHb2mtetnp
         elU/7SL7RkfQHxr51UdiKtBracfxusRyRtvTFafCABf5TdJMasfnGw0P8Jz23kSoiv0C
         CY8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765358362; x=1765963162;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PzT3RAmckBYbP5TA/l7BwjgJQIBw/GvPZ/+f/ed2uZI=;
        b=IgcAl4gAtgYgYBjcKI4ihU8Sai/cu9HR3DFXWuFNWbXlgu6RzNXcRATvCVtT341v9k
         LCpPi2Vj1xTJOf2dWM8TDJEIzv8Tc3KpTinwNneJ5dAVnAnlPF6adyCTlt0ACxMPt/dH
         HMrHx56GpVN81v1/WeNKYE9S2EkKGP1/pHHZGpLNq9tDAs3PR3/Vhy69ylV1gtcPp6yq
         yWLytxX9jqB+Loy21g96V/sR5dG2gBark/zjhoM4ABlwYYCx80iF5AtxnRxyDI32g51v
         r5ADfGHXWbbAz4i36rCCssnbY/LSqN8/DFtk0IrhdjaBKnYY8OPSf5gIzi8knCf9nYnI
         KOUQ==
X-Gm-Message-State: AOJu0Yyu5rTFPRVadvQwD2PBsB61ggVJ2QIH2QVTfLswGst/L+XJUbpq
	xRgJxhuvGD9EAAkNoOyY7Azg1QAzKHVqG8z4AKNia1K3lYgzOX6i8EH0da7nGUrYOhsltZTV72M
	0rJo+rlm7HGf09x/iU1t+f61x/XDJqio=
X-Gm-Gg: AY/fxX7ZV5PqmJ++3HCo/lskHYq3mKQwiyN2gKv714UrPwWpF9jeykei1WpJamOeruX
	N/LWZE53QKCImgRSuTvbmsDGYq0rvdgW+9flsAnnRllUvWaYcc14acryjqbCW7oF0EUdnFgyMEJ
	Ny86Xo2+migrq4SqaML9L1vtO6eiTjNWPkyij6jiRxSQ5e3VfkpiCkGz17Dar5VeXxAYOCfraG6
	L94sv5+DtHDFbgonzit6zQHO14VktE8Wv0pu9W5mzPM7WutxZ7zL6iqL7pBC9YU3qlC/dCXwEDa
	GBYqk3MEPsIzPpIqUs3zWgMtBRGy/A==
X-Google-Smtp-Source: AGHT+IGi+a6uRhn7IoQ7ctbRk5IF4UWHVANEw4NRoNylP4DJEGvbhRAuJAURXHt6vv15cu98chUjuPrBD91C1quTzS0=
X-Received: by 2002:a05:6214:3a8c:b0:884:6f86:e096 with SMTP id
 6a1803df08f44-88863a97563mr21807896d6.34.1765358362360; Wed, 10 Dec 2025
 01:19:22 -0800 (PST)
MIME-Version: 1.0
References: <20251210080209.2158502-1-hongxu.jia@windriver.com>
In-Reply-To: <20251210080209.2158502-1-hongxu.jia@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 10 Dec 2025 10:19:11 +0100
X-Gm-Features: AQt7F2q5ZF2MbuGZNsZtZ4ccm4KeYSPb-Nv1WiXa3Er_PmyT_1ebQ0cc0hpHWSk
Message-ID: <CANNYZj9FY8v9s3OeFX1YLe-UbaxMBA-rupyDzNTiCeTzaY6PWw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gstreamer1.0: add mulitlib scripts Gst-1.0.gir
To: hongxu.jia@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 09:19:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227460

On Wed, 10 Dec 2025 at 09:02, hongxu via lists.openembedded.org
<hongxu.jia=windriver.com@lists.openembedded.org> wrote:

> +MULTILIB_SCRIPTS = "${PN}-dev:${datadir}/gir-1.0/Gst-1.0.gir"

This is not an executable script, so please do not misuse MULTILIB_SCRIPTS.

In this case, the file should be installed in libdir/gir-1.0 instead
of datadir, which probably needs a patch, that should be submitted
upstream.

Alex

