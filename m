Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B937C3DA63
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 07:05:10 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.38695.1721718302966603108
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 00:05:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U/MgL6Gw;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52efa9500e0so2907163e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 00:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721718301; x=1722323101; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=f4bqbqp9711ZouIXQpihZV8YxzfooAM0Ekh/Yf29QP8=;
        b=U/MgL6Gw7tFwyCm3EP2+BidkrFyNzqmFZfkiLJqk2XOShR16yJlhrATshwMIRdkgKl
         OgQrWOtexJ0NsnAPrED3Mpd0XhX7F+7Wz4PaTE+/79FW2FgBFD99YnuUHHRat1ZKJG34
         wJ+Spda9o8OEJ5PwbcDN0FRrdvFSzhXTmfa5YdmfCAz3jcCk1LrU66JkVly9/hhANm7M
         m2i1TBRsJQ1xJA1Serdn9jWPSlwpy/5t0sNwdIV92Se9gBXa3kI6LVmxur4BLOEMloc8
         s/ZTus7m4//1W1Hws2LccY+Rtgq5iHlZjFMVn4ZQB+gmzGnQT2utIO7c8jnLEEZDvk0M
         L05A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721718301; x=1722323101;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f4bqbqp9711ZouIXQpihZV8YxzfooAM0Ekh/Yf29QP8=;
        b=vtvP22sPMDW8A8I4IJSRUXVbkgxFf+i+4+07lwH2N+ynlzvlcATwg5tUPEYT3WGs5K
         9sydXtv27xi6CPM5xIqM5+Y1wVwkpU3l3R7tX2OvH8UZDe69GOo8UcSIwPzY9PFOk35C
         9lr4niOg7ViUgZYyawzcs2XQ3XZslFye7yJPCoTwmVnc2lx3qdNojE1AY8iI9tJcg+Wm
         bE48FHxpETOZmE9WPTwUlvLGAyw1tqd1d6gBYfhisn4cQXY8eDCBp0DbzH/XbeAnph/h
         zEN8AgdT7+ncxEDjkJqxg373R7IHXBI9pCBMj/gGPDL4zOUgeaqRJd7JFr4BD6rsBQA+
         jN9w==
X-Gm-Message-State: AOJu0Yy3kDhcThwOX62k3fVyJDonetMpGtC/glYH48u18XbqfzFef3V5
	IIAz+uCvPY/qs4VqrQxHDHWP2plMos2M425Gz7pfz4Y5DCqFUNc7+6l6Bexs2qCbiQzLvqo5Y38
	w71ZNvvpiC5xWN0D3/jR4Ye+S3EI=
X-Google-Smtp-Source: AGHT+IExsHkcgKenQ1Sqe6Q0ikh8ncorG0xyY0pnpYDTPlVNM+n1gD7c77dz5bDnsSkwVTcXRe90E92F4kW34sobXxQ=
X-Received: by 2002:a05:6512:4009:b0:52c:dd0c:4c57 with SMTP id
 2adb3069b0e04-52efb74cf2emr5840979e87.27.1721718300589; Tue, 23 Jul 2024
 00:05:00 -0700 (PDT)
MIME-Version: 1.0
References: <15984.1721025702525262934@lists.openembedded.org> <15389.1721716784240821743@lists.openembedded.org>
In-Reply-To: <15389.1721716784240821743@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 23 Jul 2024 09:04:48 +0200
Message-ID: <CANNYZj_mCmrr2nCfwCAtiUZ3DGZhYOPA6HLqS5-KpGkSfsVvfw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rootfs: run postinst ontarget on ro-rootfs when
 read-only-rootfs-delayed-postinsts set
To: Tobias.Gassner.ext@karlstorz.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 07:05:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202329

It's in staging, so nothing needs to be done:
https://git.yoctoproject.org/poky-contrib/log/?h=abelloni/master-next

Alex

On Tue, 23 Jul 2024 at 08:39, Gassner, Tobias.ext via
lists.openembedded.org
<Tobias.Gassner.ext=karlstorz.com@lists.openembedded.org> wrote:
>
> ping on the patch. Is there anything left to do for me? If not, I would appreciate merging.
>
> Thanks
> -Tobias
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#202328): https://lists.openembedded.org/g/openembedded-core/message/202328
> Mute This Topic: https://lists.openembedded.org/mt/107227142/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

