Return-Path: <igor.opaniuk@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C58BC02193
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 07:56:36 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.111341.1738655788620455967
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 23:56:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=eRDo+j8a;
 spf=pass (domain: foundries.io, ip: 209.85.167.46, mailfrom: igor.opaniuk@foundries.io)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53e3a227b82so4867900e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 23:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1738655785; x=1739260585; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ky1M3yGm3/xChY21LehTgQq2iGzVBmXLd8V7BjfT1U=;
        b=eRDo+j8a9WOkThPUSJQZf5Yij3pJj56O7TnbEiqvlMPk8d+CMAUw7QN/UFQ2pOP1Hw
         x+j3yaAU5cNZ4tbBWbeZOsjphueWog8/3mn8L+DXDb6gSMQMVX8fuPO215QJHkyORs05
         iRhQGimtxpHOwbytkuNYGBg1hM531aFl3+JyZenxD6wu7DCB+oaFqd1a5NhctoJjyywf
         pYymUppyX2X6ew+9TATV3I3zyHKehwsdWsaWIJVS8yCKqJ35X5T6KkOR/5TGzmisCXw0
         oThm87U0GNBfwjwSS7PawFBPw0zCbrU6VfCH/5kEqCYQSfkx6K1GJ4H6NkS4nG9gjDvH
         hSFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738655785; x=1739260585;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ky1M3yGm3/xChY21LehTgQq2iGzVBmXLd8V7BjfT1U=;
        b=U66X30S6mbw4clcjHI+fndAP3njlwvHmezmIpBaawvBx4aToOS2ZTK2yVzI93BMjvC
         d9iaz/hyD10lj9/Lj3sXK3tC+oTlzmWGtUcEUGe2SBYDHfUgMaNyrEnT5dzEV8egZc5K
         vJP2FEGtLxqXySg+tj0l+W9eGbEYtjE+k9PmdqhmAPNDWILBRAY62qnO+KbM9O/uhiLZ
         Rv5qlssrlBTRagC46AciWYXrATPShXYz5+/pcJNLKRymnfx//oF8OUdv2UlJKjKaicDw
         oXW2fBSOTT8/D2oFtQxkUnC4+lXxindmubHoMQGfyAlZ6DKrc6f4E8nRZDEWY9lvAktD
         IJmw==
X-Gm-Message-State: AOJu0Ywonw8+PcSMmmRcsv6Uo70CsHPMNF7La8p/uZYQnE9ITEfajMOm
	NA5b8ig35IawNX3pqQBRjNFytwnVr35pbZvFtoYPmJYnT4U8GXCALidQAJktq7ZtR7zlln2cQWj
	ronCPP28pE1uxivhW4JKEs5CMWnmYxKtFGIKMEZ5IWv1fteJgKESd2CAu
X-Gm-Gg: ASbGnctllW35F1lnr27DOfR2u1wl6KO7THruTdWeCWboIxn1NfNtYIygh22RQ3W7AvE
	TKWRghjTYCnOg3+HZk/DbIDw6P+9Pyl2Jzmix1H7GhJtxfkvu/zmxVDTFzTeyKpSI4hcZJ7+8/3
	A=
X-Google-Smtp-Source: AGHT+IG5RGecWui9/UIE668QQ/Yx9ron8SXUEaeISO7RrmBuwoVkh3YOF2gAx3nmt7PXI4KrTbnXByRxkf/AO92p8Ok=
X-Received: by 2002:ac2:4d05:0:b0:540:3579:c363 with SMTP id
 2adb3069b0e04-543e4bd958cmr5639976e87.9.1738655785480; Mon, 03 Feb 2025
 23:56:25 -0800 (PST)
MIME-Version: 1.0
References: <181F794284A2B40D.27573@lists.openembedded.org>
In-Reply-To: <181F794284A2B40D.27573@lists.openembedded.org>
From: Igor Opaniuk <igor.opaniuk@foundries.io>
Date: Tue, 4 Feb 2025 08:56:13 +0100
X-Gm-Features: AWEUYZn9pgpOLvt3rs237_IyCe1o89c9J901CIkRUXoO1d2FyJXjrg3tRBWTyaY
Message-ID: <CAL6CDMGyg8YkYs3z4GZME1mkVE41objV3QVsvGAOesUUKk45vw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] wic: bootimg-efi: Support + symbol in filenames
To: openembedded-core@lists.openembedded.org
Cc: igor.opaniuk@foundries.io
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 07:56:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210752

On Thu, Jan 30, 2025 at 1:48=E2=80=AFPM Igor Opaniuk via
lists.openembedded.org
<igor.opaniuk=3Dfoundries.io@lists.openembedded.org> wrote:
>
> From: Igor Opaniuk <igor.opaniuk@foundries.io>
>
> Allow the '+' symbol as a valid character in filenames listed in the
> IMAGE_EFI_BOOT_FILES variable.
>
> The '+' symbol might be used to support boot counting for boot entries,
> as described in the UAPI Boot Loader Specification [1]:
>
> The boot counting data is stored in the name of the boot loader entry.
> A boot loader entry file name may contain a plus (+) followed by a
> number. This may optionally be followed by a minus (-)
> followed by a second number. The dot (.) and file name suffix
> (conf or efi) must immediately follow.
> Boot counting is enabled for entries which match this pattern.
>
> Example:
> IMAGE_EFI_BOOT_FILES:append =3D " entry.conf;loader/entries/entry+3.conf"
>
> [1] https://uapi-group.org/specifications/specs/boot_loader_specification=
/#boot-counting
> Signed-off-by: Igor Opaniuk <igor.opaniuk@foundries.io>
> ---
>  scripts/lib/wic/plugins/source/bootimg-efi.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/=
wic/plugins/source/bootimg-efi.py
> index c05f38f229..96c710bf77 100644
> --- a/scripts/lib/wic/plugins/source/bootimg-efi.py
> +++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
> @@ -252,7 +252,7 @@ class BootimgEFIPlugin(SourcePlugin):
>
>              # list of tuples (src_name, dst_name)
>              deploy_files =3D []
> -            for src_entry in re.findall(r'[\w;\-\./\*]+', boot_files):
> +            for src_entry in re.findall(r'[\w;\-\.\+/\*]+', boot_files):
>                  if ';' in src_entry:
>                      dst_entry =3D tuple(src_entry.split(';'))
>                      if not dst_entry[0] or not dst_entry[1]:
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#210442): https://lists.openembedded.org/g/openembedde=
d-core/message/210442
> Mute This Topic: https://lists.openembedded.org/mt/110896349/6685241
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ig=
or.opaniuk@foundries.io]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

gentle ping, let me know if there is anything else for me to do

--=20
Best regards - Freundliche Gr=C3=BCsse - Meilleures salutations

Igor Opaniuk
Senior Software Engineer, Embedded & Security
E: igor.opaniuk@foundries.io
W: www.foundries.io

