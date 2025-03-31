Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77EF2C3600B
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 10:17:31 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web11.48444.1743416248470082016
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Mar 2025 03:17:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nKPlbbxx;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6e8f8657f29so34897526d6.3
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 03:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743416247; x=1744021047; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=swXf78WHGBBzuWeWYwvU2b1mOx3kmMeHnnr5lBqFIgA=;
        b=nKPlbbxx1T2vFYkF3gCqc2kPlqSdxcT/mcB396RzutbYkM2v3TQhh/40u8+9P9yGxk
         rwNrywLcrvSJnT+nwrIux/ne30PuGN1qaaO9bMgXuiKjDK5bLFEpwb8eACRGeQu1m9Mp
         RoTQTmG0IkzFHpUywbGfppIPE9XlY5MEoGEKQQsUblINPKaO+0mo7mQbXuP0jDDUGL+D
         mQSrSgBHlRlcpQeQcxcv6DeUBMpwW++Fq12yh8pjJj1R8O2p+zAEegjjXo3PQtg8FUbV
         H9Mj0fe5GfSP8kr10sGGLLyb+K0sVmZH5XjnFIv5jztDlim3ZsccRKOeEKqYUst2TpBa
         juFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743416247; x=1744021047;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=swXf78WHGBBzuWeWYwvU2b1mOx3kmMeHnnr5lBqFIgA=;
        b=aYjJdYqCnmVkYTQfVL9KXkHwghXAyHWuxgLZFOy7Hup+tKDjpI9XTOmmigwEPuq2XR
         /UEsd5+iyltuX7BEhUP/dOEDHlg0F3xjRXqnFp4bjKNg4fC3IIVBsxCRhcb+inUt9xVT
         u9JoIVSPpmc9WpGn9DyVWEIHUr2Mv1v+WejfZJvbsZdcphVyo5eA9eIXEYg7yMSyIirZ
         chiL5vehPYAWIC6oxkyjVzKXW7jxyB1F64/MplvjfuETKapwi0zAiaftOX91Uh9kajTN
         RDy8trThfVoH2hdTBLkNcu0GwGXe0eJQywycTjSHDZuZEOgO59hWpaIWaAxuEcmo/7We
         Z9og==
X-Gm-Message-State: AOJu0Yx0FHZfupQelZmMXz56ssrMHbIJuw513hf/ei3JuirjI8KpO9Ij
	U6QBrC8V5X4nHHlK4nEP4fbb5vJFihWWraraAH289uL+WlD6qTypNIkMR7EFB+y++wXhvao7ZeS
	OsJw83kC1Ox6NMUqquqmlDR/rH+Y=
X-Gm-Gg: ASbGncu42y0FfBx1VG82zJ3nJ+Bor0mmqOb74KwwVcLWubLtSos/DVjOvLzAhKZp6nf
	xIB/qCjPX8FB28JiChveTU7662JlfXWRNW3uAjFmg6htvKuLugEEgy7SL6AiWGVsTXIDHKa7t9C
	CghFfUy6uvAbqcMgMsyphCt9SDhEqS9cT3HU5Bhp6hBo4aU1jiQVtXbhrSBRG2
X-Google-Smtp-Source: AGHT+IER2JBno9E4TIKOvJ1cRvxsMiAmIYV8pUCNnqJGEy0PnDOeue4g4bNnbUHvoOovXE6Xieeg4FHh8SV1/ZtMTBo=
X-Received: by 2002:a05:6214:21cd:b0:6e4:4274:aaf8 with SMTP id
 6a1803df08f44-6eed61cdfecmr135757136d6.17.1743416247426; Mon, 31 Mar 2025
 03:17:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250329-mesa-25-v3-0-f4d0328eb867@oss.qualcomm.com> <20250329-mesa-25-v3-7-f4d0328eb867@oss.qualcomm.com>
In-Reply-To: <20250329-mesa-25-v3-7-f4d0328eb867@oss.qualcomm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 31 Mar 2025 12:17:16 +0200
X-Gm-Features: AQ5f1JrsdL_Fhom_cDIu_be9qfAVjHS5keTuPviL-NSjvrOIjuOmQLz2OPpYOg8
Message-ID: <CANNYZj_4EXbozsd-cWTnJPn=ON6ckOXskyC8vRuivUmKu8Ou+A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 7/9] mesa: upgrade 24.0.7 -> 25.0.2
To: dmitry.baryshkov@oss.qualcomm.com
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 10:17:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213962

On Sat, 29 Mar 2025 at 21:07, Dmitry Baryshkov via
lists.openembedded.org
<dmitry.baryshkov=oss.qualcomm.com@lists.openembedded.org> wrote:
> Changelog:
>      https://docs.mesa3d.org/relnotes/25.0.2.html

This includes only 25.0.1 -> 25.0.2 changes, and so is misleading if
the update itself is from something much older. It's better to link to
the overall release note list:
https://docs.mesa3d.org/relnotes.html

or simply not include the changelog link at all.

Alex

