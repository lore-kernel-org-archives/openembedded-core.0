Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF3D0C3DA63
	for <webhook@archiver.kernel.org>; Wed, 24 Jul 2024 16:01:30 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.14434.1721836886151348710
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jul 2024 09:01:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UoK5nc+2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-427ffae0b91so3184395e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 09:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1721836884; x=1722441684; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=g3Pgj57mJEsCS0ViMnRAvxmAvJp2H159/nfjQu+REFw=;
        b=UoK5nc+2ObVHQC2ragyUXYobS/UH58NO/uEAAxdlQJaUtKCMiUdTOxdWZIZp+PXVFF
         FwdMwf5Ap3fBS2ESoo0DkGPZmh+4LH0TlKbcE474oWwcr8j0WBbUYPgMbMzrguV0xcTf
         hobnbT5vVAIzsHfv86HDwDv/b7l8dqz4IcIDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721836884; x=1722441684;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g3Pgj57mJEsCS0ViMnRAvxmAvJp2H159/nfjQu+REFw=;
        b=RGqPP3TL2Oj7x/cus1jzGcDQDAZWUH8OOmP6fgv8UmflhEB7MNiWG6/6Yw+d36wGrV
         BEICw5XGgIP4bM6hQV7+ZcvfT3iAXAri9/BnFIz+bywvHCQGD5+IadxrjSFTjJdT29NW
         ueA6ci3fa/KG997+xg4GTkxLOTAYLNbOX5rSXFAOPtM/dSTvVBfbdEco5/BgnqRIwmz3
         ll8QgmM4O0oM1ZUokg2GjN/h3RzN7MZiZPKdRpG1B1NNwPhrNgAkMph1dVqqc81kpUJp
         uHFowaYkLIhbWo3Y0R/Cbj69IjqvLqRK/kV7p13Vo1UotENvmCLwhe1fYD4lOXlBVXii
         lFLw==
X-Forwarded-Encrypted: i=1; AJvYcCWMTOBKzEVTqR9S2RwjhIVgjuXl/QsN/RjIw+doS+dRp7jrXB8QSPE5hYBYkrb2+IbS5SIqKx/dqSHs55RjX6tmmgnWLqIfRv/+zGPj9ZAJCql5F06RY1Oq
X-Gm-Message-State: AOJu0Yw6nqD21Fu4ftBOgnmOAObtCRZCwPh9zoy95Zxtl/0osksJD7KP
	vAQGD9We0BnCK4sMPkub7m3qdTBPvpYW8PPz1+6q5c+sFlNt5NxR8hasFnr4Uw8=
X-Google-Smtp-Source: AGHT+IE8ygsOylj28nmROJU7dS1NZkLfYfev+AX921NAKz1QbJM2u4IbPstH21LtX151LyKuSr+MAQ==
X-Received: by 2002:a05:600c:468d:b0:427:f196:c549 with SMTP id 5b1f17b1804b1-427f7ad5536mr31485205e9.23.1721836884431;
        Wed, 24 Jul 2024 09:01:24 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a74c:d12c:aa87:d7af? ([2001:8b0:aba:5f3c:a74c:d12c:aa87:d7af])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427f93594e7sm36299095e9.8.2024.07.24.09.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 09:01:24 -0700 (PDT)
Message-ID: <78ec945a12ed570b274041fe8b14568e270fab06.camel@linuxfoundation.org>
Subject: Re: [OE-core] [scarthgap][master][PATCH] python3: provide
 /usr/bin/python as a symlink to python3
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jiaying.Song.CN@windriver.com, openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com
Date: Wed, 24 Jul 2024 17:01:23 +0100
In-Reply-To: <20240717023201.861394-1-jiaying.song.cn@windriver.com>
References: <20240717023201.861394-1-jiaying.song.cn@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 16:01:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202458

On Wed, 2024-07-17 at 10:32 +0800, Song, Jiaying (CN) via lists.openembedde=
d.org wrote:
> From: Jiaying Song <jiaying.song.cn@windriver.com>
>=20
> The /usr/bin/python cannot find the correct Python interpreter, so a symb=
olic
> link is added to point it to the Python3 interpreter.
>=20
> Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
> ---
> =C2=A0meta/recipes-devtools/python/python3/python3-manifest.json | 1 +
> =C2=A0meta/recipes-devtools/python/python3_3.12.4.bb=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> =C2=A02 files changed, 2 insertions(+)

There is a bit of a debate around this change.=C2=A0

We're at a point where we patch anything using "python" to use python3.
This puts us in a fairly good deterministic position where everything
is explicit.

If we add this patch, on the plus side, we can drop some of the patches
we're carrying but we also lose the markup of the python versions. If
there ever was a python4, we'd be back in a mess again.

Adding it, starts discussions about whether it should just be present
unconditionally or whether it should be a configurable link with
update-alternatives. Should it be a separate recipe? Should any recipe
using "python" without a version have a specific dependency on this new
recipe/package?

Having listened to the discussions and given this is pretty much a
solved problem for the majority of our current metadata, I'm in favour
of maintaining the status quo and not taking this change, even if we
have to carry a few patches. It does at least make the situation quite
clear and explicit.

Cheers,

Richard

