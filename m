Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 088F9D0D175
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 20:53:09 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16513.1767819179293402787
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 12:52:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fmRf8j61;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8908f5ed4aeso6246666d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 12:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767819178; x=1768423978; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dvDxV8/XqMuRFzp41230K8+jcwxlrFXULu2DZVLS0CU=;
        b=fmRf8j61Q714GjA3wsODj6vuxSPA58Ioo6js0R5TTHNuykWf54KQnAuIQmffylR2SD
         B4oD1UrnskPrI1a4Dj63blb0JR7B2TTi2jwa1BGmC7eyriRD7tNG2b4VsJWhXK7cSH22
         XqZwLTpD0QOeoRzjgHT7PZH1WWgiTa32KbHAhFIbjNkJ8aoDcTXM+25245r7BBzq6evc
         gWB4/7tBfxPm22ZI/Uk0pJtN8U5Rbx7CH4I1BlizygsM6dqcGgjbNe0zj29JTpbRfRxj
         hieqqjcXHzDDKqY816PnSXgnEOWAtJkxBOVOsTm73+ylTT8dI/ttdGQ4Vdgcg4EbonR0
         4hig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767819178; x=1768423978;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dvDxV8/XqMuRFzp41230K8+jcwxlrFXULu2DZVLS0CU=;
        b=nRbudFqh8zanD/mVuwoXx5wQ6vVrPw17EcDVgoZW1tvyihd3w54zNYVdK9jFVIpyZ/
         ZrAK/rN3yX5FSvwvjgsU3zxM8uSizkFJllRakwYjlwzY3zHpMnbxGZp44cl4rmXu4gq3
         LFT02aDO7fYhhUC5vdox48osSbn5PpqpNvdQk2Ni8Hs2muWFs6ev53byHeQ8g9aYu/BG
         I54+JIwDg27lwJTuNR/QyqxA8M3+fO/vJV7BEqIIZdO98LZSMHHV3E0AfM5KGPuBvsGQ
         1i5A1dldDBNIsyoPgJdPdPrKz2lxr2GFb9ikqq2r548l73RKgq5zROKKq7z126shH7dk
         8gWA==
X-Gm-Message-State: AOJu0YxWRiPGuByqtYE1m2oHG55sZKR9gkYGOlUeAsDxG8S3HS1p7Aro
	vq1WkmtlXJsx+2JQdAcWb074Uo7qP3xhIXiQYwSROHQZSn7e1OTMUKNR8DhOG159vIgr+0+hrSZ
	tfIJ89ZHuMY00lqtZ2M7T4fc8IEMrMr8=
X-Gm-Gg: AY/fxX4tXXr8yW+5MtiMUCYqwu+qs8phqwRe6rOwneCFh2Z5p88ZleM8QP5J2hp4gW7
	oGxfqN6tOSOMcKd0qujXzXLtuu5zZWaZpeHclife//4zM7WDkL5LLWRwx1LIq6n3FhBQUTPgLmF
	fJA6WFUGf+qKss5c53EBj27cSVbRzHtwlAdwBXjCHZY+F8VayfIyXbpa4dgRz9e2e4nZmOMeMd7
	r3PI790BGXoQDvL8Yzi7jmkIkmiOXbA27sFBE3TWl/YYH5y8rl8Z6cOyhNik9OT2QTwqevsWNe9
	Z4Pu1l/MU2nir5ow9owQ+4wD9mRZfA==
X-Google-Smtp-Source: AGHT+IEC/+xwR1tz+21GTOkiKl3b7UcOCQjpQIkUrf3lY/Jer6zHgUFIxWEnhS/VIz47vMX8rBeeH/imOz2azwVbKgU=
X-Received: by 2002:ad4:5c6d:0:b0:884:5e18:e91a with SMTP id
 6a1803df08f44-890841e45femr61233796d6.2.1767819178207; Wed, 07 Jan 2026
 12:52:58 -0800 (PST)
MIME-Version: 1.0
References: <20260107202553.2965393-3-t.f.g.geelen@gmail.com>
In-Reply-To: <20260107202553.2965393-3-t.f.g.geelen@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 7 Jan 2026 21:52:45 +0100
X-Gm-Features: AQt7F2qFExdG--4uIS1DrmPEENuRJHp2dbJ1iAuhyjKO04TVS0Dd22HBNVwFMdk
Message-ID: <CANNYZj_bQcbhCkZm23y_O5xkv3eVNLMfu=tFEtOXOV8wt-KuqQ@mail.gmail.com>
Subject: Re: [PATCH V2] qemurunner: Improve qmp module detection
 PKG_CONFIG_SYSROOT_DIR for qmp module path
To: Tom Geelen <t.f.g.geelen@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 20:53:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229033

On Wed, 7 Jan 2026 at 21:32, Tom Geelen <t.f.g.geelen@gmail.com> wrote:
>      def launch(self, launch_cmd, get_ip = True, qemuparams = None, extra_bootparams = None, env = None):
> -        # use logfile to determine the recipe-sysroot-native path and
> -        # then add in the site-packages path components and add that
> -        # to the python sys.path so the qmp module can be found.
> -        python_path = os.path.dirname(os.path.dirname(self.logfile))
> -        python_path += "/recipe-sysroot-native/usr/lib/qemu-python"
> +        # Use PKG_CONFIG_SYSROOT_DIR from env as a starting point for finding qmp module
> +        python_path = env.get("PKG_CONFIG_SYSROOT_DIR", "")
> +        python_path += "/../recipe-sysroot-native/usr/lib/qemu-python"

Thanks, I'm okay with this. It's not perfect, but it's short and very
unlikely to break.

Alex

