Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 183B1C46CD2
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 14:35:51 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.18027.1704810944777470532
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jan 2024 06:35:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=brphLqG0;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-50e7b273352so3018696e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 06:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704810943; x=1705415743; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iw+GZLONud+Rx1Aaj+GtJQTaVcXSP+MsyJznYyJBQI0=;
        b=brphLqG0/Z06MfUz997tOYg+mjJtWX4LYKd9422JgyfpddA+23g9GM/vPeecGlZsga
         DfzBrXzlgslwFRylrZpl/Xrf1cnZqsVZ4riArhUi9h7YAYpXL71zwbEor8CKcAbcQ6hz
         scMJJ0yhOxjz8NABpwPWNMEqhYznc8RGfrFjOOZPQakzkdRbMy6l+s5WhL1PkpSNkMw/
         TnW+MkqE/UEAeuF44HAvkPg/rl0640l1zOrvcFP+g7f+/AYERuNXBlQzeeLpaqWBWBSR
         zFnT0ZVJ4zhTZ/OCGH+UqHr9jDdBjTihiy6qX3fHg9+E2P0pxVCWAyFft0gMC3geiJwz
         Fk4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704810943; x=1705415743;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iw+GZLONud+Rx1Aaj+GtJQTaVcXSP+MsyJznYyJBQI0=;
        b=rL/eZ1HLNt4MpprV+KRXBuJVOw9GoFeXVBbHPa7Xs28Jqj4+8zN4WQoeWuQtxkyqwn
         QxLOoP23JF2vnGGK1E2CVWtby04y1SCgEY1RjqP5aQEG1AOYTQdnFsz39HDoPv2eIa4B
         oElTBnHKFsBF7Pzd09xQ1ypI84HgjMdC/RKsTupVGkk4xUX6kp1h/sv9ldIWdZnTiBve
         Ql6OeU80eYaKCojxgfk6aUQ2k6IITVw+0j6eVUE+Zij05pNSjymycxMebYCxRK6yr2QX
         2YtUaG1D8NheZ0pftXxc/6K1sE8rWbREYs9rwNmIix3SGNvtXSBWt7aN7+uCwukF+jTv
         Q6RQ==
X-Gm-Message-State: AOJu0YxksFSC8vLPyblYEeqUSyR1crG20q3thfcFPNKjXwLiAIlUDsVI
	w+6e4u0q0EjNgmtjd83fyDSDl6MFsJmGabLu5XQ=
X-Google-Smtp-Source: AGHT+IGXbmzpwvXDeEZ54Fy1tUUfkJy3/qYEWwBdZQwmB7+qlpDXJLuRk+Qc4HO+VMZCdHdbwiAm+OV8PX+aQWEvJX0=
X-Received: by 2002:a05:6512:246:b0:50e:4acb:3d0d with SMTP id
 b6-20020a056512024600b0050e4acb3d0dmr1971573lfo.47.1704810942558; Tue, 09 Jan
 2024 06:35:42 -0800 (PST)
MIME-Version: 1.0
References: <20240109132826.2445412-1-f_l_k@t-online.de> <ddc2301e942a551d895943886fd69da4038341a7.camel@linuxfoundation.org>
In-Reply-To: <ddc2301e942a551d895943886fd69da4038341a7.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 9 Jan 2024 15:35:30 +0100
Message-ID: <CANNYZj84J-juOM9Og=ZAADhW4bm32p-hT=C0PpueksM4GL-iUg@mail.gmail.com>
Subject: Re: [RFC][oe-core][PATCH] webp: switch recipe to cmake buildsystem
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 14:35:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193461

On Tue, 9 Jan 2024 at 15:10, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> The trouble is things can end up in the sysroot via indirect
> dependencies so this change allows unintended changes to creep in (a
> dependency adds jpeg so the config of webp could change too). I'm
> therefore not happy about having "floating" dependencies this
> introduces.
>
> Could we submit a patch upstream to avoid floating dependencies and
> allow things to be specific?

I checked the source code. Checking the presence of gif/png/jpeg/tiff
libraries is conditional on WEBP_FIND_IMG_LIBS being true, and that
variable is set thusly:

# Include dependencies.
if(WEBP_BUILD_ANIM_UTILS
   OR WEBP_BUILD_CWEBP
   OR WEBP_BUILD_DWEBP
   OR WEBP_BUILD_EXTRAS
   OR WEBP_BUILD_GIF2WEBP
   OR WEBP_BUILD_IMG2WEBP)
  set(WEBP_FIND_IMG_LIBS TRUE)
else()
  set(WEBP_FIND_IMG_LIBS FALSE)
endif()

So perhaps we can add PACKAGECONFIG for all six of these WEBP_BUILD
things, and each would include the full set of image libraries as
dependencies.

The opengl dependency is needed only if WEBP_BUILD_VWEBP is set to
true, so that would be another PACKAGECONFIG.

This would avoid the need for new cmake options, but we would still
need a patch to turn floating library dependencies into hard ones
subject to the existing options listed above being enabled.

Alex

