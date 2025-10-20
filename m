Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D523ACCD199
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 12:10:26 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web10.16384.1760962217005391894
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Oct 2025 05:10:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GpZghUDu;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-88f26db50b4so590499085a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 05:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760962216; x=1761567016; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tYzpWDdL5LbIdyBv0PO+YLeRWoqoqcD5yQmYr9ji5uo=;
        b=GpZghUDujanms2H3qq+O0ail4Y2zxAVUmK3UwWH/btPnY4PeNDltgS/ypcsOdfpwWX
         TM4qVScW7XFdoVwai+wib1NlnESpgVwMEK3BjkAmcM7z+smNOxE8YLhpdH21dXIekOHO
         hl+u4bozLnRc07jWk7y1oLsW7R+srYap3dQUN/AlloWbKemDR1DXzqiM1ai0CGMNpE8k
         mf9futwXsiOlWbmCLIzRZ9HFU0unhh/icsUnGlBEmP1MkmRf+yjByvG+6DeRq6Zmp3rZ
         PMdZfbBH9ExjLcbpaDOwawJcBlukl7EtbgaEXZmbiurVU/7NvKwiLJK5Km24iTrHRaQt
         3JvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760962216; x=1761567016;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tYzpWDdL5LbIdyBv0PO+YLeRWoqoqcD5yQmYr9ji5uo=;
        b=mu1C5aUXd4Gt5MTiCBB05PVBYZuBI8sh38b3TYzfABtTSZR7RiHoOOsTx0KO6U++nY
         ncKaKXB6r0nMUirm5jOsOSRG8A2bIdMdrhlMZ4KGhM6d/cAYUaadzMOm4/KlsJM1PF+f
         7WYj8zUOzIEpUbZ45YhjZpJrveVJIBTU+O4005DmPLmbPaIv0UU/dJhbz3JqcYTi+HAm
         spqZNogiH0LfMeEXr+ZHSlwOX2Tz2W0TerXdif1Bleg3M66sLLpt4pOCkdyPq4e74AW0
         bmpjehYpWNTb+dlI/UIb1DpXfyD7dBvexflOP+O5GD0lTFuYo/By1/hGYPbsrKuBQC83
         2zIg==
X-Gm-Message-State: AOJu0YyQgexhbZzF/3y3qHcu2m/DOh0ES9WC6jdsNg3ADWOA/OL4gSSg
	d/5CM0PKwikvxcOG+CsO4u+sKP1ghsjpmPOJErXzp2Zg2e8TxvWhc6yPGaBkC1HL5f28EgfYNim
	kYF9dlElPIyV+oA83zGLbnW0ZsXALcYo=
X-Gm-Gg: ASbGncs5Gg8VE65jJ/pMejV80w6vy8dLUAmuQpw0VT68s/ghYlBVgpOu8D7HuvSCAhT
	b6yHMj+8qFpVD5piPf565vF1r9HCB84NkvP5dQRK5ELfWffSi5cDZk6cZzbVQYbBhQvFCGLTG7r
	HxUPSoi0Jz+NyR3vr3OUCQm6Xr3/50CX5AMTjpr3aqJJ11ClqVEQb+wgdXNVFc9oIcKtljCCppT
	UbbFXNPSlKcX0NqeGKI5e+d/1nSpd7UaUyeP5PmFdQy6slGA1FhCLRImRPN2HMPK6lwnSr35AM3
	MF0WKISbyHJedyGKFZFOl3G4n7ASsfG9ypQotAVN0jtEuMxj3B7kc/c9uzf3++zo/0oBrTOel54
	T7oCSte8w/mP+FpFQOA==
X-Google-Smtp-Source: AGHT+IEi8qpaG+Xf5b1rLpwJCrMWB21dNpBLqVzN36qYKFMDaEEv996SXNh6wqjJ1c53u5ysQVMVH6d0JazGWDir/EE=
X-Received: by 2002:ac8:5a11:0:b0:4e8:b55f:af22 with SMTP id
 d75a77b69052e-4e8b55fb2d4mr78817421cf.53.1760962215776; Mon, 20 Oct 2025
 05:10:15 -0700 (PDT)
MIME-Version: 1.0
References: <20251020023955.2962-1-liuyd.fnst@fujitsu.com> <20251020023955.2962-3-liuyd.fnst@fujitsu.com>
In-Reply-To: <20251020023955.2962-3-liuyd.fnst@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 20 Oct 2025 14:10:04 +0200
X-Gm-Features: AS18NWCAbdp59x-1CjhPDI__C2OAdbgH5Ty3DIyQVZ20CDVmjdh3IA-nIK0Bnj0
Message-ID: <CANNYZj-hCneg70xvctsDq-0u0vySg==AtfJEHRtZKO8phRJvcQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH 2/2] kea: fix installation umask to 0022 of meson.
To: liuyd.fnst@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 12:10:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225117

Thanks, this patchset is good.

Alex

On Mon, 20 Oct 2025 at 04:40, Yiding Liu (Fujitsu) via
lists.openembedded.org <liuyd.fnst=fujitsu.com@lists.openembedded.org>
wrote:
>
> The default installation umask is 0027 for Kea-built artifacts.
>
> And it caused package conflicts as following:
> Error: Transaction test error:
>   file /usr/lib/pkgconfig conflicts between attempted installs of kea-dev-3.0.1-r0.x86_64_v3 and btrfs-tools-dev-6.16-r0.x86_64_v3
>   file /usr/lib/pkgconfig conflicts between attempted installs of libgcrypt-dev-1.11.2-r0.x86_64_v3 and kea-dev-3.0.1-r0.x86_64_v3
>
> I submitted an issue to the upstream and found upstream alreadly known this issue.
> https://gitlab.isc.org/isc-projects/kea/-/issues/4171
> https://gitlab.isc.org/isc-projects/kea/-/issues/3993
>
> Then I follow the method in the SPEC file of upstream to fix this problem in Yocto.
> https://gitlab.isc.org/isc-projects/kea-packaging/-/blob/master/rpm/kea.spec?ref_type=heads
> meson setup build \
>         --buildtype release \
>         --install-umask 0022 \
>         --bindir %{_bindir} \
>
> Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> ---
>  meta/recipes-connectivity/kea/kea_3.0.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-connectivity/kea/kea_3.0.1.bb b/meta/recipes-connectivity/kea/kea_3.0.1.bb
> index 06f1a5edc3..4a6623f94a 100644
> --- a/meta/recipes-connectivity/kea/kea_3.0.1.bb
> +++ b/meta/recipes-connectivity/kea/kea_3.0.1.bb
> @@ -26,7 +26,7 @@ SRC_URI[sha256sum] = "ec84fec4bb7f6b9d15a82e755a571e9348eb4d6fbc62bb3f6f1296cd7a
>
>  inherit meson pkgconfig systemd update-rc.d upstream-version-is-even
>
> -EXTRA_OEMESON += "-Dcrypto=openssl -Drunstatedir=${runtimedir} -Dkrb5=disabled -Dnetconf=disabled"
> +EXTRA_OEMESON += "-Dcrypto=openssl -Drunstatedir=${runtimedir} -Dkrb5=disabled -Dnetconf=disabled --install-umask=0022"
>
>  INITSCRIPT_NAME = "kea-dhcp4-server"
>  INITSCRIPT_PARAMS = "defaults 30"
> --
> 2.43.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225092): https://lists.openembedded.org/g/openembedded-core/message/225092
> Mute This Topic: https://lists.openembedded.org/mt/115848091/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

