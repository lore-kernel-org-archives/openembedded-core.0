Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE748E8FDB8
	for <webhook@archiver.kernel.org>; Fri, 26 Dec 2025 20:47:09 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.159635.1766782025363294559
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Dec 2025 12:47:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TrfStAa8;
 spf=pass (domain: gmail.com, ip: 209.85.160.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4eda6c385c0so57573201cf.3
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Dec 2025 12:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766782024; x=1767386824; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mdyRwyxdA8eI4C6ltcLunBDW47K/N9UphkZ2y5FrMDU=;
        b=TrfStAa8QIgN/sPxtpdQheZroNGeuKevWc8/YUk2P0gUYUS5Eu149W2q8QDCbGMiLX
         0PBSAVQkXGn5+E8E+EUC29fAgmiiE6i1iDt4UO3x4Wc7CG9gSnzwgf76EgcqdSFnvSXM
         oyBoAeQzh8grMasfO84dYy1F1B7Y7CWJcoJfZhSqCKhbTO9gNwIqEUlxvuyDNLvNJo9X
         VDEbbmnGmh+8IkVoh1p2awnz6B5XV6c4qvzZo7g9FkeNyz+8iNSEVKVOI4c8VuDm1LOZ
         rz8Jh0XMbVdYhTfTwgZOrj/pjdQaaWHN3AuJRT0BDDotPAh2D+6zzEy8s5t7olNO8uAR
         EC1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766782024; x=1767386824;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mdyRwyxdA8eI4C6ltcLunBDW47K/N9UphkZ2y5FrMDU=;
        b=gzCXGxEOa0ANnLaxpGEf2DBRY2ZQWg/Vk6FdfZaSMGn3mWLntRb2CENgV7+lt+tVNG
         Cu54N0cRUEAMc/iObH78u+amGW65I2knempPGeyizSHJiQvT6hahD1eN1eowLgtJ4xJJ
         7VgKoukJE10Cg4YutWU9yTYnUg2B3NqpTuGfwPN40FDx9eLgVgfigBhoDLNmMRlWuJL2
         AnAUxgl6VXLieRjFgV8YkL7kl6m4TDEnpEihcaw7ibxZR2KSYt0S9j1TVjkvUcwOru1t
         TRbyLMDP3h9lnv/lOYn5PJvfIHInGpMlcgO43k1I3IzYv5G8wWe2LBBpOvWu7eNt0Wnv
         atvQ==
X-Gm-Message-State: AOJu0YwoJnkKlNjk81nph5t06HXTD8niqLFYdVSvGDXMJL3bltaS/m07
	0JU1S0GFI56uWQv6NGTQk240W+cYcdmD1bENp8SFmzfRhuaErA8HM9sGmea1WP3biFV7+Po1SnK
	oQ8Yl3K3EE/Ok8A27BZ4Rube0/RQ3dGM=
X-Gm-Gg: AY/fxX5ehnUyJ9r4S4aQ5cQjd++00WkGOoqSPg074pQ8qZvAqEzlRg6mQOdroF08QA5
	8aDKqyKRHo/QfGJgPQCxqHOJKl8oH3XYA56D9HHW58cb1oCVadbtj5dJ8V4n5BiOJ/dcLGlpEch
	/xp5+h0vB6OnGd8tBJIGyRXjtPL2q5/pFzTRX9BzX8jNRYo3Xh6Z8yDwzTDa8MDOXqpqdmohEgO
	zUbLSqk4ZaxxSEK08nbGXlTXIj30O/tKs2oERQ0xJRXIRIQkfwM9ctZFsvPUkEF91cYwQ==
X-Google-Smtp-Source: AGHT+IEFU3TpG0qItQEKsfF80TCbAe5gN/8OzmyovOYyOmyqLSHeHTsAHuZJhbhzGEnkeauE4JAM2LA27f82Sp3FRMU=
X-Received: by 2002:a05:622a:6690:b0:4f4:de7f:c343 with SMTP id
 d75a77b69052e-4f4de7fc415mr124954211cf.48.1766782024374; Fri, 26 Dec 2025
 12:47:04 -0800 (PST)
MIME-Version: 1.0
References: <20251224150805.3312684-1-adrian.freihofer@siemens.com> <20251224150805.3312684-3-adrian.freihofer@siemens.com>
In-Reply-To: <20251224150805.3312684-3-adrian.freihofer@siemens.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 26 Dec 2025 21:46:53 +0100
X-Gm-Features: AQt7F2o1koT1O9_3qrTEyeuRGYzgh6BDOrIj01ZHAdtbWGPlew3p_ZQArmitTTs
Message-ID: <CANNYZj96VasQFeLuaP+T0m8WErDWw_x-wuPSg5SMX05hCPzJKg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] oe-setup-vscode: improve VSCode
 bitbake-setup compatibility
To: adrian.freihofer@siemens.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Dec 2025 20:47:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228551

On Wed, 24 Dec 2025 at 16:08, Adrian Freihofer via
lists.openembedded.org
<adrian.freihofer=siemens.com@lists.openembedded.org> wrote:
> VSCode is started in the workspace folder where the .vscode directory
> is located. With the new bitbake-setup based build layout, this starts
> VSCode in the openembedded-core directory, which means only files in
> that layer are visible. This is not usable for most projects which
> span multiple layers.
...
>  # Generate an initial configuration for VSCode and the yocto-bitbake plugin.
> -if command -v code > /dev/null && [ ! -d "$OEROOT/.vscode" ]; then
> -    oe-setup-vscode "$OEROOT" "$BUILDDIR"

I'm not sure I understand how 'seeing multiple layers' worked before,
or did it? If .vscode is placed into $OEROOT, then only $OEROOT is
visible, e.g. only the former integrated poky repo, but not other
layers.

Otherwise I guess this should be held until we figure out the changes
to bitbake-setup?

Alex

