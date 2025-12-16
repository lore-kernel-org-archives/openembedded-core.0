Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C31CD637A4
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 19:43:20 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2736.1765914190570569590
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 11:43:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bZpC/jsQ;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4ed861eb98cso54945501cf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 11:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765914189; x=1766518989; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5KhBHTN45HWNdguAgGsw3mcQKLoP/70xbdhBAmI39X4=;
        b=bZpC/jsQ4HqjGkr44FwjhtPlDPorTyVn48lLltMp7ARbkSMyB+E71zdIEwsdzDQnKK
         hwEISHAftMHSUcmcsxjzJ95qqh3WQfD23Z6gUiBpNwLAzoFc+l9Q25Ya4kDM/ss7Vaoq
         XQHC4lpxEiDloO4dLLllOAIBwwNyGiXkX+lPEEJ7+RLqm4lGRN5SJpgMsWmAUPtvbLzo
         T3raHX1P3umOoT4I2xvJbgiA11jwUTl/TUbC5zqLTFxdus1onNw1pZ0pIoOQnvCD7Lkx
         VhnAWIgnsXS3kg7Z7CVcmkN/T3CYmjyKpYSA4IBbSFHiq5jp82rUK397bZwcjUcfmN5Y
         0Www==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765914189; x=1766518989;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5KhBHTN45HWNdguAgGsw3mcQKLoP/70xbdhBAmI39X4=;
        b=KuWb1TVYS/l0c/Zw7sFwp3db6bNigdsUG5uXuFpaHfdb8Wm8iHewkWL9YXPJSw4CV9
         n5HbVT3+FFuzF1FfA76XyOuYeYsn+HPW22Wcqi3uPWKVJeVFZAHOfebsfuCHCWdvW4sd
         3rQurjZ4Ya0a8YHqq4Yl4XDYEzxvIf9qOSPwdU7hx2lpeXYRwIYhHbEHWXmNt5ZvgBtI
         d6OMNOBvAdbANcXP3E+xNc0wIZXnOHnpzLKCZNHhFNpFc3cd6orHMKy5Yw+siNlfBP6t
         69VfbyezMjMrIocVFDpzKVUkaHpFBBIqyElFiO2cCtFHJA7k58c08dClVHz+V+o73HFO
         Ob2Q==
X-Gm-Message-State: AOJu0Yyp8rzD1dkP+OMoHkKhsuLguxejvbBtZ7VfbLoxB5yFHeL8Oxno
	IoTGvlKw9/pdiiXObI8XlVorT5DO5DO9Yfz2EFCb/ViIq8X8ejwkOG3KdzuqX0icd+fTsOV/ZE0
	5A16BDKExGRj1sJO94XVjdSpjFKzCRhdwl3c/
X-Gm-Gg: AY/fxX6ldFRuu7nQoBqucn9URCIj2Gm8pLHYR/gd2hPK8KQLE7J0zMkLjm6E/RcKNFt
	L0W5E/tXkSAe4tVPBVYK0emmQkXrPUJYT/pwgk4Z/cUjlBFN8vG9b7J/TunVZWEObbKYOOWmIlS
	SoeteKwZcgiJFdYZ1cta61eDFe+jCAf0YymE+rSTgR9C2OZ6wNkXmCW3/GUD3diX9C0HY6/5XYy
	yVN+0gBMkuHTU1ycxso134mDJqunsUeEbUGYvn7FAxRdyi1sWwotV7sy8EWDZsNKmnK5+EVjjcF
	HfPmtv2ZutmJwx1G4x23DwCN0Go1EA==
X-Google-Smtp-Source: AGHT+IHhJpe1ysVPDyFIO3bf/63BZCpZNtJ/WkTmkwaR9E+vJHv0dYm0Uq/8guqIP0bGMCBmzZt7OadABYLitHt6HBg=
X-Received: by 2002:a05:622a:4189:b0:4d2:4df8:4cb5 with SMTP id
 d75a77b69052e-4f1d04696fbmr217233381cf.4.1765914189435; Tue, 16 Dec 2025
 11:43:09 -0800 (PST)
MIME-Version: 1.0
References: <20251216143901.2542490-1-tgamblin@baylibre.com> <20251216143901.2542490-5-tgamblin@baylibre.com>
In-Reply-To: <20251216143901.2542490-5-tgamblin@baylibre.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 16 Dec 2025 20:42:58 +0100
X-Gm-Features: AQt7F2r0yq2RSoTTqJA7tuzBGLUurEfQDC5hVJuKE8hL2OvG92N_2JcjgCMzyHI
Message-ID: <CANNYZj-7cLJ1PueXRh+SAj6JuF+VYOe+qEczb1zhPjo7geXCBw@mail.gmail.com>
Subject: Re: [OE-core][PATCH 4/6] rpm: handle CMake Python paths in EXTRA_OECMAKE
To: tgamblin@baylibre.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 19:43:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227983

On Tue, 16 Dec 2025 at 15:39, Trevor Gamblin via
lists.openembedded.org <tgamblin=baylibre.com@lists.openembedded.org>
wrote:
>
> With the Python 3.14.0 upgrade, rpm is finding the wrong paths with
> CMake, leading to a QA issue for files that we have listed in FILES
> already:
>
> |ERROR: QA Issue: rpm: Files/directories were installed but not shipped in any package:
> |  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/rpm/4.20.1/recipe-sysroot-native/usr/lib/python3.14/site-packages/rpm-4.20.1-py3.14.egg-info
> |  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/rpm/4.20.1/recipe-sysroot-native/usr/lib/python3.14/site-packages/rpm/_rpm.so
> |  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/rpm/4.20.1/recipe-sysroot-native/usr/lib/python3.14/site-packages/rpm/transaction.py
> |  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/rpm/4.20.1/recipe-sysroot-native/usr/lib/python3.14/site-packages/rpm/__init__.py
> |Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
> |rpm: 4 installed and not shipped files. [installed-vs-shipped]
>
> Add a patch to make it possible to override Python3_SITEARCH in rpm's
> python/CMakeLists.txt by setting PYTHON_INSTALL_DIR in EXTRA_OECMAKE.

I'm still worried that Python3_SITEARCH was correct with the previous
version of python, and is no longer correct. We can't cover it up with
a patch that forcibly passes in the correct value to cmake, without
investigating what is happening.

Specifically, in
recipe-sysroot-native/usr/share/cmake-4.2/Modules/FindPython3.cmake I
see this:

``Python3_SITEARCH``
  Third-party platform dependent installation directory.

  Information returned by ``sysconfig.get_path('platlib')``.

And the code that actually runs python can be found in
recipe-sysroot-native/usr/share/cmake-4.2/Modules/FindPython/Support.cmake

So if "sysconfig.get_path('platlib')" (in presence of
python3targetconfig inherot, which rpm recipe does have) has indeed
regressed, it can't be left unfixed.

Alex

Alex

