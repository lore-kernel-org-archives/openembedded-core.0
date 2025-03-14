Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1E25C282EC
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 09:14:53 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.9740.1741943687741569306
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Mar 2025 02:14:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZhRFQvg+;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6e8efefec89so17062966d6.3
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 02:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741943687; x=1742548487; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WUHRCB/Op/UgEirsn+VHnJB3x8nsPcMnYLSqqM8GROA=;
        b=ZhRFQvg+hb0bGNmxBi5ywK0pYY0bPKJw93JuLcXrH8M+p7Px+8MOA2o0OhdI3IY1os
         /Q+rT730fiJsM11wj+FMo4nkZr93sGp0KhNip666VtqLzIrTSox2UFIPvf7gq8GtaVjQ
         +q5cpOXw7GBhhH7Zg5OtEunxSjdpjkWL62kWXg7dIUyd5sBi91OuMRHENXYCnBS2HzZU
         M9j/qUrSLU/Ju4/Mg5NtfPDBaJDM3ESwkPQuz+rxyq7JeAh5ejRgaSYazYQJ0quS/cU/
         hqDJ/JDoycV++XeAtmm7r3gs/1s7ho9lIYCWEnrGdiH6ujEDzvWPmcflsXaVv7uuilr7
         KwDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741943687; x=1742548487;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WUHRCB/Op/UgEirsn+VHnJB3x8nsPcMnYLSqqM8GROA=;
        b=IbJoIwjRyzF1xIE5NWI1Ly8VnWrf3UQJj6K7Y5W0yGG5F1m78qFCTX5gvwUxFky2lZ
         1Ee5A0fKHFevPQQFz1SzX+HblT3+fneuoCOdojyqYaS1NeGKCYnRpocmayJ8yPhQHGE2
         G/4EJ0lIHjIfH55J5I99XDlEuHnmowxionJ7CyGrFMiCI0cKYjwA1v/dzfLehgY/iRmT
         Q6gqo7LmvlOD/oUkDeM1ZsTdY1J/5mncUma0C/s/lhrZb2soZSEhioqRVxAzbf9iqlnq
         aB4isEhaCiVkqEXjvrw97NAXf941jGPu2X0hq5gGtoIIlLWGGzdLMsuf2usqQPo2nmOe
         NTVA==
X-Forwarded-Encrypted: i=1; AJvYcCWo1FrCuiI6X59swAHSB6EOAkqo96IGHRhVilbIltIspxopwEzj/THU8P+NYncsKVWqGaDX0dDDeVD/Fx32lwPz3Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxspldrGMcauLr8Z54LSqM54lEi2uP8jYUfLdcRFM2jMKl6xaIZ
	thDb8fkAmXkbVsOlmoroKfTjBGO1HuiGMK+9rl4sNfoOQiveRkJk4aJ2oJ8nlWsmYOE9QVeG9Rk
	N6GnjjkmMs4MBdnq+LscTHfAIIFY=
X-Gm-Gg: ASbGnctQ0mIXEc/d7Hd4ij8ahVU2GqyR1Z6VzODMvx9tTMIN4j9jk7e5Dk2eyo1q33C
	AY/Ll4CqvdA3SxorqABI/2D9600rw+XmNy2AIdFh9NfNuyVdZndP7K38WHfY7Qq7tjb/liNrtTW
	IQX3XmRg7V3WrpBplY+BYu5nK+
X-Google-Smtp-Source: AGHT+IFi0H40uUsDaxhRoJJDNLyYNV2Qrszo7twBytErjVQAqjtTJbPyY2zJT8yH84Z+SjuJagF9uWybZjwhJfPDgWg=
X-Received: by 2002:a05:6214:ca3:b0:6e8:9bcd:bba6 with SMTP id
 6a1803df08f44-6eaea9f545fmr21328146d6.7.1741943686696; Fri, 14 Mar 2025
 02:14:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250314002937.672768-1-rs@ti.com>
In-Reply-To: <20250314002937.672768-1-rs@ti.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 14 Mar 2025 10:14:35 +0100
X-Gm-Features: AQ5f1JqLIcN0gppx-Xg6J3FsUjxbpwyvkpKKKFyQdSznCyyUtbFLCOqYCW7AKnM
Message-ID: <CANNYZj98ByWNO+dPwKXGr-9_w5Z_ajwYqMAbWo_u8sdUAsYEWA@mail.gmail.com>
Subject: Re: [oe-core][RFC 0/3] Display manager proposal for x11 and wayland
To: rs@ti.com
Cc: otavio.salvador@ossystems.com.br, richard.purdie@linuxfoundation.org, 
	ross.burton@arm.com, alex@linutronix.de, otavio@ossystems.com.br, 
	kexin.hao@windriver.com, afd@ti.com, detheridge@ti.com, denis@denix.org, 
	reatmon@ti.com, openembedded-core@lists.openembedded.org, vijayp@ti.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 09:14:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212824

On Fri, 14 Mar 2025 at 01:30, <rs@ti.com> wrote:
> Example implementation of emptty for weston-init following the request on the
> previous RFC [1] and previous example [2]. This variant is applicable to master.
>
> This packages emptty and a default configuration for emptty as "emptty" and
> "emptty-conf" respectively. This allows the existing init packages to override
> the configuration similar to the way grub boot configs are handled.
>
> The weston-init package still handles the weston config and weston user setup as
> it always has. The only real difference from a consumer standpoint is that the
> autologin group for the weston user changed from "wayland" to the more generic
> "nopasswdlogin".
>
> [1] https://lists.openembedded.org/g/openembedded-core/message/212640
> [2] https://lists.openembedded.org/g/openembedded-core/message/212785

I quickly checked this locally. There are some issues that need to be
addressed before this goes to the autobuilder:

1. WARNING: emptty-0.13.0-r0 do_recipe_qa: QA Issue: Recipe emptty in
/srv/work/alex/poky/meta/recipes-graphics/emptty/emptty_0.13.0.bb does
not have an assigned maintainer. Please add an entry into
meta/conf/distro/include/maintainers.inc. [missing-maintainer]

2. With default poky config:

ERROR: Nothing RPROVIDES 'pam-plugin-succeed-if' (but
/srv/work/alex/poky/meta/recipes-graphics/emptty/emptty_0.13.0.bb
RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'pam-plugin-succeed-if' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['pam-plugin-succeed-if']
ERROR: Required build target 'emptty' has no buildable providers.
Missing or unbuildable dependency chain was: ['emptty', 'pam-plugin-succeed-if']

You should either make the pam dependency optional (via PACKAGECONFIG
subject to pam in DISTRO_FEATURES), or use REQUIRED_DISTRO_FEATURES.

3. Again, with default poky config:

NOTE: Multiple providers are available for runtime virtual-emptty-conf
(emptty, weston-init)
Consider defining a PREFERRED_RPROVIDER entry to match virtual-emptty-conf


Alex

