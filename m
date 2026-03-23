Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F086F46111
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 13:35:45 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17548.1774272937276831359
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2026 06:35:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KKx4hR/I;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-899fac9caabso1428546d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 06:35:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774272936; cv=none;
        d=google.com; s=arc-20240605;
        b=S+a7Li/kftL6+YEPQuf/KeFn3Xsmd6tmDlZ0b4r8g9misFg/D74rG+jLIDwj81cgJa
         qynJMHO2Zia3I7aUPoCDocsYMehTyzBMaqxmthJpSG0gYZkSIs/l2I9h1ckchblGL4XI
         rG3eLFo2we8kglQHYLWeBkEmaazUWIldBYTHCEHtse+biHrO9b9i7p4LMzNDLicC9qw1
         2yf5MZuuRbFYDPcl48XiVpk4QTkHeSzMlYxaRlxD2Un5iN3OF/IoG7jAEB3TwS53Bb7X
         74Ud5TVqtGf9h8/nKxQlJdCkzRMsxLWebHZFF10TEJBTbcCvLgl7bJBKmONWLneKkc7A
         CYkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YtMmO7LQujfQHKBo/M9t4xfGhG5AohCWzN8wp2o7cDw=;
        fh=4/VLzmdsB67b5QS3gAGn5SFlubdIP7IZdjQDpgAPwSE=;
        b=XwXZHYRkWhrRK3QDaYGq6v1o6I8YZpuZrfp6tsY7JUlex6i1JSwRxMrCCUzPquktik
         U61/iQVfKnazjMDiBzwkRFeOKi5ez624fR+t9oZ41hm8674k4N9OVWM7gqysFXMdmR7I
         VN/08/j01EneRwZQ9LwdiOS75XQpY2bkOrLISUHs/4+wBq5I09DFbyANzufyeawq8B08
         ySlMIYLRiBjcJwsGNC2Vy8ekLIXbgw8KRlPafCm4+ex5wPSChy20OV6JHFFMf19RYPrM
         IdRgI20TJUmO3beXZi0PsJy8khujVkXvYJs5wWVMqEyzjeuHbKQP8B7t0cacfvQ4/hqc
         1HTA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774272936; x=1774877736; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YtMmO7LQujfQHKBo/M9t4xfGhG5AohCWzN8wp2o7cDw=;
        b=KKx4hR/ICiRVTOBn8TWeSdEnwfyEaIitXX7V3090R605OguX1h3TAPV6GD+Y//kuCO
         gj+Gg6InUd8c9fnO2VDI3nVU4uC7XWIeJJROdBgmxSHWc+32VIBIU37gq/HKJZ8H+Wn/
         +7ABu4bh1a4ZWRx71t2w1zKXBG7ssbUkYSDfFUu9jHdKjrDyy7glxitVOxJAhXwSxd24
         uhRji/vjsLw9Pmimil26a13Zd4hswc9q8O85ZRBlbimsS6Uw5zWf302M15mg3GCot6Es
         RSCvCgtMD9KWfp5DVHKpgvyIKuBxdygVQkH/61QBkVmqJAo4uO7BncCyNEKpPb66OLjI
         UsRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774272936; x=1774877736;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YtMmO7LQujfQHKBo/M9t4xfGhG5AohCWzN8wp2o7cDw=;
        b=Y09uMpPEh4cf03dhvOAUEyUnRjVCJv8iPlUJwQkvFXl7sGrssS8gbFIopEFf2QrKoR
         OrTVYNH+L0RKGUwsMkyT4A44Xywrn+9ahgfAyBstN9lT5REU6OX8JxLhAct7eiGz++lj
         rZyprwRzEZ/bRoyLFU6UnIv2qMwUpJD1yBoQ+y/IlSpA0vgEEieHz4aRDaGYX5xQKASb
         XbqxqdhD7W58teDkZpvIZfUhqEL6yNI4Sei1tB6QxDVAt58KSecurtVCY7cZIHhuipBB
         /9wguNxcjNomDxooUxRHREW5LukrEMkr0PF11ttAuHlB7/rmerlPFH00VgzpDPXDEEDr
         0qZQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9Kzk4yxKuHv7WnUyzU0hj9gEMEyUh7pW9E/ujO2eDm2RuqqONfQmyE71AN5g0AvDnLuRQDS6nV/Be1kXPt/WBHA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw3PWUdZv5fO6LxheIjsxWLFUdfehU4uAS8UJEiV8BGyoxcjPYl
	Cy5Qs6NCugifmJx81Kld1w+C+SWiQGefoyBzJAVCeQ/9Zp/nsS6k7gFHX42nB7MK7C2/os9IMz7
	hiPdRSR1RuzUxkt0s41MQaxhILys/stg=
X-Gm-Gg: ATEYQzzzVCtHaC83moNBGOsJ4DIDSrCSYMyJ6Uc4vfa9jpIwskbZUsSkgmyqjesg9ry
	SdqxGttfaZwKttVyu/dV2R4punT6VSCIUsh9J7ZjfjLJjp8avf675pTFaRraNnwthZfoK5KZa0D
	9reXklx/aP7b/hUMOy0BTmqr0nvNilRQF+GbOrwgdHdJqMdUJeQefg/paVBgeAtgp+05rmhIx1G
	jFyVlQcsn3e9ARhjljKUuCmxas8sTe6ULc+GXyMxOmlcBCYE9kh++HvlSvM97xyUE7EuXRy2HsM
	bqpzkI6tnArfa6iJA/CrS5FoJQnDUtFj8BwRLkDmiA==
X-Received: by 2002:a0c:f101:0:b0:89a:90e:3a1b with SMTP id
 6a1803df08f44-89c859fa7e0mr151446716d6.25.1774272936205; Mon, 23 Mar 2026
 06:35:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260312120024.3745232-1-zboszor@gmail.com> <CAMRc=MeFZMGjW-KXngLwq3kjbA9ic4KaOaPjhPd4Be0DMJ+yTg@mail.gmail.com>
In-Reply-To: <CAMRc=MeFZMGjW-KXngLwq3kjbA9ic4KaOaPjhPd4Be0DMJ+yTg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 23 Mar 2026 14:35:24 +0100
X-Gm-Features: AQROBzAqmpRSwwtKhgn0S5ktvTYyCi3nM10QM6fe6mN40QGPsfSLiym39jk3TrA
Message-ID: <CANNYZj-DEfSop2zjDmqh5JjKq805hySTZQ29NSAjoJFskHP34Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] python3: Add a new PACKAGECONFIG knob for
 free threading
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: zboszor@gmail.com, 
	"Zoltan Boszormenyi via lists.openembedded.org" <zboszor=gmail.com@lists.openembedded.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 13:35:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233718

On Mon, 23 Mar 2026 at 14:29, Bartosz Golaszewski <brgl@kernel.org> wrote:

> ERROR: python3-3.14.3-r0 do_install: oe_multilib_header: Unable to
> find header python3.14/pyconfig.h.
> Any hints on what could be wrong? The same config builds fine without the
> new option. It's just a core-image-minimal on poky with a few python packages
> from meta-openembedded.

This is the error? ^^^

Alex

