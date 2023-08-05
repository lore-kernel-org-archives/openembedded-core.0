Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44D18C001DB
	for <webhook@archiver.kernel.org>; Sat,  5 Aug 2023 12:58:01 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web11.5290.1691240271083306616
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Aug 2023 05:57:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20221208.gappssmtp.com header.s=20221208 header.b=Og7elU/B;
 spf=pass (domain: ossystems.com.br, ip: 209.85.128.169, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-586147e5ad3so32395287b3.2
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Aug 2023 05:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20221208.gappssmtp.com; s=20221208; t=1691240270; x=1691845070;
        h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
         :references:mime-version:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UxE3U7zWNILgEWJ62Uw+aNyvcHv4f4mCxoM78/gMtZk=;
        b=Og7elU/Bz/IuOMmvLbTCJT9zrR2TOyk5z7v0XT3KZKWrgsya2IGA0aQ9UIF12/RvZ+
         KnPdP/ejvW2i61W2EACCKQ2EM/LysdrAZGSjv1rCjzavkZjs18WVGtWYoxo56n8BLwqB
         qwnUzS8CEgVrcKQjHtXt3Ge1jFVozOtLAaFzGYNK1V+ZRrFWB+05C28x1hP/oYARhGr/
         ocNXFHT9yoKQUq7VJTnkG4jjYroxfQBpnj156tzUPU1mITEuWvEm02c4ZOonn7KImNmR
         UszCv/tfUe6BMsjc7FLTwPcJMFgA/VBlfPrtCgmipsF4V6KaPQCpu2Uvme8i3hQgJRj9
         fVlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691240270; x=1691845070;
        h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
         :references:mime-version:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UxE3U7zWNILgEWJ62Uw+aNyvcHv4f4mCxoM78/gMtZk=;
        b=F+1wB2/sGgZqf7ETLtX20FLgtOpZI4RJY9W2rZLr7U40CYLt3dt/uaGyiiPJKvcx95
         rP7kMNMKU3QjIQOeD6uRT7F+ej5weBHy9h2JCAhnfqw9q54Yv5gRYOX/fKAg3sHlta9s
         dduFBqb4Yd3wyVgj6nm5HqdWp9zYinxVE//+jWzGmDvHsu7ycjKSQYiE2rpAYz5EdKeS
         7kU281tc5EzOIfpqP7a/Rv8KpFNXqvbSyhFD7Mgodb/uoW4IZ6G46uc1q/OnnKf9IQTX
         R+ymjM9QhyZofak07kQeyteBvpXSXppeeeWDJGiqis0gXQcKyt/2fptaKd1UtBxQZ2ns
         CTUA==
X-Gm-Message-State: AOJu0Ywoe8zsNp1BFM6+wzeItgBXYfY+U3Po6xuCv3B8lhxzynKUNBYl
	kDxwG8EdirYVabwpTPuroZ/CW0Ggx4toKhpI/X1u3wyf
X-Google-Smtp-Source: AGHT+IHWForDfTJHhphphxgsQkQ863ucdsOaIEdSinDHASlYWp8sgslB1zHHG/+833uUCRob68pKWA==
X-Received: by 2002:a0d:d792:0:b0:586:a597:a002 with SMTP id z140-20020a0dd792000000b00586a597a002mr4915629ywd.6.1691240269721;
        Sat, 05 Aug 2023 05:57:49 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id v66-20020a0dd345000000b005837b48d16csm1427396ywd.84.2023.08.05.05.57.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Aug 2023 05:57:49 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-58439daf39fso32478367b3.1
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Aug 2023 05:57:49 -0700 (PDT)
X-Received: by 2002:a0d:e254:0:b0:584:4b5f:bac3 with SMTP id
 l81-20020a0de254000000b005844b5fbac3mr4905579ywe.15.1691240268790; Sat, 05
 Aug 2023 05:57:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230805110643.2708376-1-luca.boccassi@gmail.com>
In-Reply-To: <20230805110643.2708376-1-luca.boccassi@gmail.com>
Date: Sat, 5 Aug 2023 09:57:37 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoz-nitOEUfiAfuQd-EU0xkeD8nObiwLu6jGPoJfMV9ZA@mail.gmail.com>
Message-ID: <CAP9ODKoz-nitOEUfiAfuQd-EU0xkeD8nObiwLu6jGPoJfMV9ZA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd: add usrmerge to REQUIRED_DISTRO_FEATURES
To: Luca Bocassi <luca.boccassi@gmail.com>
Cc: openembedded-core@lists.openembedded.org, raj.khem@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Aug 2023 12:58:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185553

Em s=C3=A1b., 5 de ago. de 2023 =C3=A0s 08:06, Luca Bocassi
<luca.boccassi@gmail.com> escreveu:
> From: Luca Boccassi <luca.boccassi@microsoft.com>
>
> Support for unmerged-usr is deprecated upstream, taints the system and
> has been removed for v255 (next release).
> Enforce building merged-usr images when using systemd. This allows one
> release cycle where it can be tested for any remaining issue, and can
> still be overridden, before it stops working completely.
>
> Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>

This makes sense. I also prefer to add this sooner than later.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

