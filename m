Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F161BC27C53
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 09:37:52 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.16887.1718789865062844562
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jun 2024 02:37:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q04CB5iI;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52c819f6146so8384582e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 02:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718789863; x=1719394663; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hU/k7PXNzd4l/loNYvd0n19/DiTzcGH/7ROpmd+epos=;
        b=Q04CB5iIUFdCNw1/yxe1OTiDdiAThK3JHXkYOMBuIy2dp+SD/dijouIUgdTHfF0MsL
         cszTF9NA74FbXOYNQ8pAxasbfRDX2dYptXCNxXX4NNfEJwQ/kPQFPsiAWMnPbtpQ02g7
         horkeJVRK9zuOirwR/ftX97FEB+Jl0y6SMYDGS8AbWnobgFyOFYKzbqX3eg3EF7bf4mB
         Mmjn8qmsEX13T1vLfAX5OyiyvfT+1fndPWrRqUArTPue+gvF9T2WIP9LkEYirdRE+uhb
         h3KfAEnW0F4kVWq3q52DeT+6qV6ZRHa+NHVuu51XFo9M4OecXTiqCLqd/FR1EdyRxa5t
         DDEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718789863; x=1719394663;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hU/k7PXNzd4l/loNYvd0n19/DiTzcGH/7ROpmd+epos=;
        b=DXub9IGmUfNC1uWADnHcGyhPeSxyc9F93kP5dBEcasQPd2fFKK34KoOLbJVAWZfHpf
         FNzZcHtJaXQAEHyN5O3wdAjjiIoyGp9pxYY43lv3wtsi6+k+SisVo7Wvug/XYsPIGbB4
         nMjXY3Cx7pc7MXV+LRGHNF8BwW2P701RJnsWviXBm5bIxBkSkODACpZIQGsQOBIuQIFi
         DGIVjqYIlkgA8Sc19xGJipej/SmNTUXrlqx+GE98/cbno9unFk3hrdumkZ614AK4BZKb
         s4s4lJeYxU/mpeOYr/KlVmZvO5SbD3RqiKI3bTSBjKAq0UJn6TC/29S+A80iMjSPnsvf
         CI6w==
X-Gm-Message-State: AOJu0YzGuXZWoiRzK1qqexoxWCyWjNDkR/gPfhUVCppxANRK/ZRSWDGn
	a+XQe8umNDYNaRoS/BsjxVv+6qjyldF+Th3OOPPaVfApGw+wLS2ctTpw6HTxgBZ6gktl42ggD7l
	GPlkLy1LOhP6g89Tay3DHTVu2f/M=
X-Google-Smtp-Source: AGHT+IEBppgfQJYM+TSVxkm0AivXhpnDZHvibk0e52QBC8C7oEsZ36GCefLcExsbsZZuTf2iM7o6mHSej61D9Fsr5SQ=
X-Received: by 2002:a05:6512:3da7:b0:52c:6d10:3ae4 with SMTP id
 2adb3069b0e04-52ccaa59529mr1567471e87.2.1718789862822; Wed, 19 Jun 2024
 02:37:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240619085957.2787700-1-alex.kanavin@gmail.com>
 <20240619085957.2787700-10-alex.kanavin@gmail.com> <CANPvuRkyyjavWQn2gynunhJpXxAG42+DmKNZ6+eTyumCoUCQog@mail.gmail.com>
In-Reply-To: <CANPvuRkyyjavWQn2gynunhJpXxAG42+DmKNZ6+eTyumCoUCQog@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 19 Jun 2024 11:37:38 +0200
Message-ID: <CANNYZj-ZUTSpxwpycadiwnAyWkK2SbvX7BguE5hr3ZY0Kq6XWQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 10/15] glslang: mark 0001-generate-glslang-pkg-config.patch
 as Inappropriate
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 09:37:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200904

On Wed, 19 Jun 2024 at 11:34, Jose Quaresma <quaresma.jose@gmail.com> wrote:
>> -Upstream-Status: Pending
>> +Upstream-Status: Inappropriate [independently developed patch submitted at https://github.com/KhronosGroup/glslang/pull/3371]
>
>
> Maybe we can switch to the upstream submission. It is mostly the same with the exception of the -lHLSL -lSPVRemapper we have in yocto.

We can't because it hardcodes usr/lib and usr/include. I left a
comment in the PR asking to fix that.

Alex

