Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C934CCA474
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 11:02:00 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web11.22692.1759230118170034827
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Sep 2025 04:01:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NlEHH5Rg;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-869ecba3bd2so265349085a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Sep 2025 04:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759230117; x=1759834917; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tbNln4DrjVMkx4ImZ7XXoy55iVRQCgHM8c0WDST3luM=;
        b=NlEHH5Rgi5iTri2d6seOWTlyUAgs1G50LT4YzsEruxLZdZVdrZkePYxIaf4hAWnJtJ
         U61KsYg58o0dMJOR0amWZjkkVNgNVdhGbcL+jcoHw9JMDTKnewSGwJb6qetowIHAOlAZ
         MUJ4Tt1I+E/5D0hWtvY9qHJscToy6qoJYxgRNfwULWomKbp7u25EawbJhPG/UwSoPbBl
         9x3cLRjALjG9Rs1j90b89lK1QJMeFHYMmWjVci4l5vlNGrR+uCKlbloqOaXIwhUnN95+
         sk0rDU9ywNbleE9y77OPZdW04BkeTcSoxFc4k3sk68rHwrDLC0hQAtnP4cRlCK4MMCSM
         I64Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759230117; x=1759834917;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tbNln4DrjVMkx4ImZ7XXoy55iVRQCgHM8c0WDST3luM=;
        b=GOaf1sBm2oUhdddrAkS4WS1C8iZYaPzuJdZvVFRvpn8jCjWq81htldPcynASHFABRF
         Ro1l2dEJ83X3TCnMclstCgQtNbWYVXm7k60GnCFrnKIAZ2GAdmEKmmdOhkKnRlKrkj2K
         FQG8T+elAKR/ZOBr8f3rlqbMx7qYxJbUIHjwJeRf6UYImUGA+FU4H35MmLSFD2wcZDPK
         B+pG+lZDTm6HbHZ/s2kvBVt+yv5vdQ0QR5pRqSr+UeRd4RkvR8kzm2+8ZG0h0/F4ncIo
         IG75CDa4pHvNCCT/d+2Apx99wThXCKbibS4qlvlQkZEVmMFoyixmB6pvF4MgI1meqfcT
         TpqQ==
X-Gm-Message-State: AOJu0YwOxWBcDTvWDWL0wVIO392SlcPCurV+Hg45VsRNxlkI/kOrwW2E
	tls9i1kDiuNY8po7gZAeCxFrkJy/rJKCy+Fw7hrk4jNzpVy0XqX5HZNrg5OlDvNhDrhjKxraQIC
	4eOBFcN0IqugyqwWR0n9vvKcBRHN82Vg=
X-Gm-Gg: ASbGncvqFB9HoX2UtFeemH3FncfebmDO6Xbiwp3AAV+cpftaUzj23+4ayaObw7U6Di8
	E7YYo+nQXetW5CtcmRANKUjOiUlKUfs/HO1tyY5wPbmPJoejT01xKjS8hv5DxMzfizPYH1vOeOw
	GzQ8UoS+Z55lrRC9H47HGx32Na5sxq7O9KBqCh0X///G4HCItowJC3oscWRnWytCuSE6akCz6nX
	6+vXJ4u3W4dadXMg+WYGc7mkMu6sPssAZnSci2GSK8xTm7dqfdIrDmuuDbPvk5iOHwVCMKXvR2l
	YQ5qPMOMy2VnaASObhWDnvBpC0rRGWeMBw/Mh8Z6AlWKvNIL1+1jwy6zdX1WJcya
X-Google-Smtp-Source: AGHT+IFMdvYzo4tDfgplURthqfKSeWqXc6YLYKAiG8bm7XmJMM+URlci9P6QiC5hkXPqIE91tJS/rFQiRLvjbbSZnKc=
X-Received: by 2002:a05:6214:5196:b0:787:8e43:5761 with SMTP id
 6a1803df08f44-7fc4066e490mr237042326d6.56.1759230116648; Tue, 30 Sep 2025
 04:01:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250930065117.2625998-1-kavinaya@qti.qualcomm.com> <20250930065117.2625998-2-kavinaya@qti.qualcomm.com>
In-Reply-To: <20250930065117.2625998-2-kavinaya@qti.qualcomm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 30 Sep 2025 13:01:45 +0200
X-Gm-Features: AS18NWD0UYtsdxM_HR7IGCTjAgfQB-dOc71bUDLb693QEAiHm2ZJ_sIqjekyRdg
Message-ID: <CANNYZj_x87wtyYxT3jh0VkGYSViM05=tPy0wAALNCAMrqsNGRw@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] fitimage: Add support for custom compatible string
 via optional parameter
To: Kavinaya S <kavinaya@qti.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org, 
	Adrian Freihofer <adrian.freihofer@siemens.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Sep 2025 11:02:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224183

On Tue, 30 Sept 2025 at 08:51, Kavinaya S <kavinaya@qti.qualcomm.com> wrote:

> --- a/meta/lib/oeqa/selftest/cases/fitimage.py
> +++ b/meta/lib/oeqa/selftest/cases/fitimage.py
> @@ -778,6 +778,8 @@ FIT_CONF_PREFIX = "foo-"
>          1. bitbake bbb-dtbs-as-ext
>          2. Check if symlink_points_below returns the path to the DTB
>          3. Check if the expected compatible string is found by get_compatible_from_dtb()
> +        4. Verify that a custom compatible string can be passed
> +
>          """
>          DTB_RECIPE = "bbb-dtbs-as-ext"
>          DTB_FILE = "am335x-bonegreen-ext.dtb"
> @@ -788,6 +790,7 @@ FIT_CONF_PREFIX = "foo-"
>          config = """
>  DISTRO = "poky"
>  MACHINE = "beaglebone-yocto"
> +FIT_DTB_COMPATIBLE_OVERRIDE_am335x-bonegreen-ext.dtb = "custom,board custom,variant"
>  """
>          self.write_config(config)
>
> @@ -819,6 +822,11 @@ MACHINE = "beaglebone-yocto"
>          # The alias is a symlink, therefore the compatible string is equal
>          self.assertEqual(comp_alias, comp)
>
> +        # Test custom compatible string override via FIT_DTB_COMPATIBLE_OVERRIDE variable
> +        custom_override = get_bb_var("FIT_DTB_COMPATIBLE_OVERRIDE_am335x-bonegreen-ext.dtb", DTB_RECIPE)
> +        self.assertTrue(custom_override)
> +        self.assertEqual(str(custom_override).split(), ["custom,board", "custom,variant"])
> +

I took a closer look at the selftest, and actually this is not right.
This modifies a test that is intended specifically for testing
get_compatible_from_dtb() (so it's not the right test to modify), and
it doesn't check that passing in a custom compatible will result in a
correct .its output, it only checks that getting a bitbake variable
(after it's been set) works ok - not a useful check.

Rather, I think you should take a look at test_fitimage_py_default()
and test_fitimage_py_default_dtb(), and add one more test that sets
the custom compatible. Adrian could probably give more authoritative
advice.

Alex

