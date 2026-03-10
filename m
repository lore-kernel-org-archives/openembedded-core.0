Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69A87FD4F19
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 18:15:22 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2099.1773166517372710800
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 11:15:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QUzVqRvJ;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-899fbf92bdbso130046676d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 11:15:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773166516; cv=none;
        d=google.com; s=arc-20240605;
        b=YtjWG9GL+jhOd54OLNP6vKcDsvRum3EAVTRD74qkoahWvsvXEao9kod62bmMV4DeS2
         LZGtO7szW09iO0aASp8vRqDkwoED40L5yWyXHm7HF/daTyImwKoC4zebEx/DcFlgdN4M
         ucxrcp4Au+t6HdKdZ/ppVq0+agjti0YKGiGiD9viRswPT+k4CUJn0iUftEWISrsjIXcA
         R1LltTdYQWqwLgMptr+lt0boV0j361nQDmIiPsdtDxG+haKExxOaQ395jaLtbEOJPJ0B
         1tfKOzaINHyn80p8ZrpxKnuzWUmT5mvWo1/OlODumunfNfmtIQxxHo18V2o/DC1308xY
         zE7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4Q6yceRo44o/uJENrGVQh+c/KHytlqKvMeBRbIhz9l0=;
        fh=A9LC2SuFeslKa5fZLg1lVVd+gCtVSH2fNo5gKijnBJs=;
        b=JWMlaB64MJv4dz+duR4GCh5aScG5u7LhoJpThOUheb6q2Db0nMi/5XOf6nEfgujdgV
         Kv+ivsHZVb/LJT5X1wcc2Db52zhFg109gzCRNJN2xoyVBUNN/sRuOMiiMgJXisJMWmp7
         qOumtFhHApcP5m6Fx0ahon1sP9dCTt/QcWBkxWsjBfyD/MEGG9/sODFzlQPDIunbNNdr
         i7yIyPczYYz4OKNOBB4dHxMrK4FzU12vihXMw54aSz+qxSup5ldpX/XU7eUfibAeL6ZK
         sLF85Fk4pyUNEgUqKmH1RKNfTLlB6i6aww+kpO/lUpDKN4IlwlgCZj+CeZYTEvbyIwe9
         akIA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773166516; x=1773771316; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4Q6yceRo44o/uJENrGVQh+c/KHytlqKvMeBRbIhz9l0=;
        b=QUzVqRvJkfcOzxpCjR3BYtLMZj4Qrkjvh9H5JgpzlDCl3dh96R+h6wcx+zFYJegULy
         NcPngbN4bp+ThlyVkB8UqOyqG1Hb+Ot3WLc8++vHC2Yw6ezto/IZL8zJwwk1rHMhlTk3
         3pz+n6Ope0v7m35MVeT/TeA6ksN7vVrNpKJtRZ0E4txCG+MTiwozZNTk1aTPMJnPyHn2
         FClkxblgpyxHkdTRRT8TYj1n1kgedKK/qHDkyRbAkRzTV9/vJT9ym0vhBglBOenYt89m
         BF4pgNdp+HWqVjkb59nMVJz+vNL+ivk/I2pEw1q1Hne6M/SOPGIcfSKZg0FK9DwJZ0NC
         XP8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773166516; x=1773771316;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Q6yceRo44o/uJENrGVQh+c/KHytlqKvMeBRbIhz9l0=;
        b=j3ed4T4OE6/PL7/eGHnj99nP9j93Yv4Jo005qQ9a/SyyRP2PUxrtWMp0OGP9YdoTXb
         3Y4ly2bVjFLXDK5AqhY6fiHiklHuWNpDtFG2WQoYJRIVu0t1ecF3KhXWUBBT1jAH5J40
         wEXhqZ0HWrlzVEzYhlDu0KlVx9Hfti75rGdPI9OzpBTvz+tn3pWGI/Aov6Dt7Tx68pTO
         220wg+Duv9/OBjU7rGP2vxLepUmfbWmq7xxhsKx9iIGYxUozJdSGi9pBcr4gZJLHz3ZX
         4ovg2rAxPrS0KFbGOXQyKauKlm1VoUZ3Bw4xzBzRume8Uel1tWqkSGxMJ7CcEO4Sxrxb
         f/5A==
X-Gm-Message-State: AOJu0YzWJJacCK+JBE8Qho0QQrV9QyPwRnm8YFimBsHlcpHJH2O9Dzeq
	OJNQhe/u+EjTFhWkD05RnDHmqz+pk9rWHpxOZwyKdUKZ5OHRXopG6Q7TE05HoitBl1PZdaTmJQ7
	p5dlCVPniB2ajjPiDp6+MitWYWRajEElhww==
X-Gm-Gg: ATEYQzxUWTQLDGhcZ2l1yBDYIN3YZz/gOXD5OA49pNGJwbaTNDaFCjwnGpw2F5RtFKe
	z9Z93ewyNHJCgimPWHdNKnpY6XebYkaZ8hUDWdE+vTFbU+ISUItMravi1k6HqZ2sQkRfaMIG7AV
	K+NEyV4lQSeRIczNa6gbTPcsTKqW0o+fplTt08d53uPpq24N/MKroS4WXdHGjzS3XgKBDdJpTNL
	0mvxcuNl9BYcjo40q0GW0ICYXgKsatbMLwYEElk553+Pfq97OGPQM5Br0p+h2y2wKzUSUp8QyDR
	2K9firW6FQFs8dT+SoPmWYcqHUAY70bgjKtfuX9MRA==
X-Received: by 2002:a05:6214:2522:b0:89a:1ec:5304 with SMTP id
 6a1803df08f44-89a30a5defamr240755876d6.29.1773166516130; Tue, 10 Mar 2026
 11:15:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260302132815.2922014-1-sunilkumar.dora@windriver.com> <1899EEAA854579E5.971272@lists.openembedded.org>
In-Reply-To: <1899EEAA854579E5.971272@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 10 Mar 2026 19:15:04 +0100
X-Gm-Features: AaiRm52hCNjO9E_hJaESuN06EJ3v6bxpFZqwBUkQ0UxDnaC4uWV57n27OEIiAL8
Message-ID: <CANNYZj8KP7UkQbO3-H15+gB-3yqKoW8hGPREnipAqqh9-wRcJg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: Enable dynamic LLVM linking for nativesdk-rust
To: openembedded-core@lists.openembedded.org
Cc: SunilKumar.Dora@windriver.com, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 18:15:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232810

On Thu, 5 Mar 2026 at 12:32, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
> > -    if d.getVar('PN') == "rust-native":
> > +    if d.getVar('PN') in ("rust-native", "nativesdk-rust"):
>
> Looking at the error, it seems the problematic binary in nativesdk
> builds is rustc-1.93.0-src/build/bootstrap/debug/rustc - does this
> mean building target rust has the same issue? Should we just go back
> to the initial patch, which sets link-shared for all rust variants
> without conditions?

I just sent a patch that does this.

Alex

