Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A6C4C3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 12:13:40 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web11.33019.1744287215891891103
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 05:13:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GJpdqeBr;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6e8fd49b85eso10984896d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 05:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744287215; x=1744892015; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pjyv6jgl97qt+ZegCtL127shxiZvcO4+6ngY2BBf4cU=;
        b=GJpdqeBr7UHb/1ANs8fz/ID4NxYNaBA+GL/VWKLdwGzxCVMEfaW4oMLY3YJLQ/BTb/
         rsnySkW0oQr74tUfvuv4i2oYr4ZR6/IXS5wwoE+dO8u1ltPB3+4wkgzu5j5DFhiPQHBd
         dvW5paAGlc5IfnOVAzFSo0XECc9pYSDKTK/0Qw9B1nrfa+mh48PqabyRjJzye0AgyVDZ
         24dSI9hTqiWl+D+XimPdVtqZoWVWX9w7uwnTT98+LtV98Bj8q2h3D8NbHd0SRafw+BoD
         JUOdwlVcBbCaJI/B8lr/Vs2fpGH2OFM36eY+K2SCcg8lI+G3uvos6/vVkAmMdW6eGr/A
         Ii5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744287215; x=1744892015;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pjyv6jgl97qt+ZegCtL127shxiZvcO4+6ngY2BBf4cU=;
        b=o2F+Pq+U2Rtnt9N2aeErqZQaA8dvNdj17RqIBwbHgYnLjTqk4MawuV1VYFfAJ9BzXV
         OmZZDOA3e2kPyu49pbpVuYovNDX+X7T/B4Iz3HoTRW9oUjKZZg8fZdDc+HVsLOEr4agw
         HNGO+784noJMMPq+/K0nwqRGrCI/ycsVLrqOz4UDa650MsMayGKjVNtQnhjJU2mlKmvd
         dcPbbKWZzrhKcjCXRi3QGiIW03cx9eNX+JTW2W2Xe3+9WVBZJyBM3ytgKIskdWA7IyNC
         AfE+zsWnAUeYW3itLQAI6D0ZAxgNiRVKoDR+S8GuYZK7oN7XfL+uiKkVLcSLisrauAKX
         SS2g==
X-Forwarded-Encrypted: i=1; AJvYcCX0q3BeWkuJYAjACsfkDJI6w737qzFjbKPtnsqK+A0HQtIao2XmhGtrRTuBvtWztBi1idqgFWbso7MJWuxEjee9Sw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw1JuhtDnmshkOAlzKDefQh7ReRc7vNGGuVBLKRrkgQTynw6kY9
	eJCYi/E5F5DemZXj8AWBk19dd+RmANysdwsWBjucDsii5Tum+ZHlVlt3CZJI4kNtxqQRV1jMeXX
	SD/gF8frgpl/GnZADZxYvjwjxfs0=
X-Gm-Gg: ASbGncugFzoGEYU6ecmLG0uVZw0f5wySgsbX4Hr9GgMfuHxUcn2RuLNiqsS1pBrIBXD
	3ElyPrnCEN3sk5j4oE7DRk3e8i+PZWhd8boeBxHoMn8jXA0GZHBUv1fNWXALxTnhk2O22xG5S7D
	tKYEC+DDFUHu2MycXKhbiA
X-Google-Smtp-Source: AGHT+IHSCb22pr4YhXNHoXEjJGvge4iAWYVg8NPsjOOvjhFr+bKVHQpT700Xbh2xhJNpcuQxkkHTB7BX8dNJ+fAFZDo=
X-Received: by 2002:a05:6214:4109:b0:6e5:bc9:95f8 with SMTP id
 6a1803df08f44-6f0e5a4c527mr28296116d6.17.1744287214903; Thu, 10 Apr 2025
 05:13:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
 <20250404162932.447699-2-mikko.rapeli@linaro.org> <f84af1a6585338787539ee5be5826adbe434e8a9.camel@gmail.com>
 <CAC_iWjKTmSEOe6HUcPFUZLaBuA2+6ZwOYaYiqK0_R8KGNPU1Ug@mail.gmail.com>
In-Reply-To: <CAC_iWjKTmSEOe6HUcPFUZLaBuA2+6ZwOYaYiqK0_R8KGNPU1Ug@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 10 Apr 2025 14:13:23 +0200
X-Gm-Features: ATxdqUH1AbJjJzA97g72rZA3O8B73fGq7vGP35yftsADd5I_LvL50P3p0_pNvBs
Message-ID: <CANNYZj_eA4k+pRLG=8-V4WEmsthkh_o75fZKOcoTf+00QW2x2A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 01/11] systemd: enable efi support by default
To: ilias.apalodimas@linaro.org
Cc: Adrian Freihofer <mikko.rapeli@linaro.org>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 12:13:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214658

On Thu, 10 Apr 2025 at 13:50, Ilias Apalodimas via
lists.openembedded.org
<ilias.apalodimas=linaro.org@lists.openembedded.org> wrote:
> >  I would therefore like to see the EFI implementation remain
> > opt-in until it covers at least the most important use cases for robust
> > embedded systems. What I primarily miss with EFI is a reference
> > implementation for an A/B update system without having to rely on a FAT
> > partition without journaling. Please correct me if I'm missing
> > something!
>
> Where does the FAT partition requirement come from?

https://uefi.org/sites/default/files/resources/UEFI%202_5.pdf#page=585

This is what one has to use to store that critical bit of info ('A' or
'B'?) and the bootloader code that picks one or the other, reads the
kernel from it, and hands over the boot process. I'd say these are
extremely critical things, and yet FAT design as hopefully everyone's
aware is a 1980s MS DOS relic that is notorious for lack of metadata
robustness and its frequent corruption.

Alex

