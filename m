Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD501C36002
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 09:46:31 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web11.35294.1742809585220008883
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 02:46:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I/5pdPHe;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c54b651310so659185885a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 02:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742809584; x=1743414384; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MdJwRpcmadX5niLUWFlrpjBwF9klJxC2/DeCTOXryOQ=;
        b=I/5pdPHe+MdgOjIlASa449hSWtFU8alIaKFszIjCEhKAaWDzcOEGXxI3+ObxxpW/3l
         SrxUJhnGZrODuX7POWRiXzalfeW66XR3lWklyilaJN+OpuWfFpqUQKwb2RZVGhPBrZmA
         6SmCUsyMpkvZkepVHjHT8Rpc2lydCNQJ2zH5shjryNmpX1Z1hEL7tO3WE4XjZAyLcrW/
         2snJoW784nd/Rk6dakD7FPwqVe4bkPxNVmNdArvoX8V0qDFGuMRevwrzM5dH0d3Sd0V4
         t3TMBYYuI4UMkDV2ZffSwAQTGxeTfExp+7p0edgBUuYFpn+QB0LkDevrsgG5jcHYbWiT
         qq2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742809584; x=1743414384;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MdJwRpcmadX5niLUWFlrpjBwF9klJxC2/DeCTOXryOQ=;
        b=Ra1fFUodDnhFt//Fy1h/jnOrCQUbIhcnCmz2Oghl335W58T7M2Td7q2U6H9lkM60cU
         z5juVjrbFdcOo9nF2FMXt7tUpbyHNuHDncJk6BWbakHkDdk4wtAuuyGqEwkLCOSXk/hL
         Y02ikmCgcBqNIiFt5uARTkhIObFXrGpueFJ6b/H2VnNKvaYg9Dj0zM3W03CNcwSh0OZx
         PqOkk2rNr+5ihts4JRfFpd1yWCDDsqkbJQEFQHz8CHcX8d5DYAgOeDKDyNPaE6jMakb3
         tMsT6x3zae6bKROVbAj/Vx7Bo5rShSJXippBOYMCvehuqi6UHNPgFzy2RKykOzZkEIUq
         RrPg==
X-Gm-Message-State: AOJu0YxacUyImUBzycgaoZf3Fd84Jvezy4YNyq0WcvucP/Q5Y5wrLgeZ
	/nvrzekB8Jki1GLflq3+i9LsTtVKPIPwEzaoAQ0bdm5HXA/Yq4fEzG5Gyr35xxz4XfOwNfhnIiU
	pvbBVK4YJQzd5yY9S53HIS3+C6W4=
X-Gm-Gg: ASbGncuUwcTXlOXRS16VMLcctt8CvlNqqeEq91T3v/BM24WdmhJuuYC+MXvsBpfEnz2
	4KvqzS6vX/TkuNeBY39lUn8x9ukqxzCFTC6/9xTZIs1TPmfUqLQyAQqfMOBKVjo2FQMSw3QSSat
	KPkgAizsjb3YNc0QrFSK1LcUNM3vLKfFcxed42dckVvfRZpiSyjEEgYiORICTX
X-Google-Smtp-Source: AGHT+IFgCJvW5JebTT3CUwdCL22VIjBSVCCdaHUfXV/yz0ueXVuq5JK4JlSUFH61cYXY2gstIghHx072FmnVGRpO774=
X-Received: by 2002:a05:620a:4141:b0:7c5:5fa0:460c with SMTP id
 af79cd13be357-7c5ba1989cbmr1777554285a.31.1742809584040; Mon, 24 Mar 2025
 02:46:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250322005552.603108-1-joaohf@gmail.com>
In-Reply-To: <20250322005552.603108-1-joaohf@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 24 Mar 2025 10:46:12 +0100
X-Gm-Features: AQ5f1Jo47eIAtuZReonpTtbJjJ6dY4skPYY6U7NYxL6RfQCRavm-A9XwqQ8RZuE
Message-ID: <CANNYZj9NBth1rVynd=SDAzjdsm2VX=bEPGGrsOZ207SykUmjaA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] neard: use WIRELESS_DAEMON
To: joaohf@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 09:46:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213521

WIRELESS_DAEMON variable is now set separately from three different
recipes. Can you make rather make it a PREFERRED_PROVIDER setting?

Alex

On Sat, 22 Mar 2025 at 01:56, Jo=C3=A3o Henrique Ferreira de Freitas via
lists.openembedded.org <joaohf=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Honor WIRELESS_DAEMON when wifi is enable for DISTRO_FEATURE.
>
> Signed-off-by: Jo=C3=A3o Henrique Ferreira de Freitas <joaohf@gmail.com>
> ---
>  meta/recipes-connectivity/neard/neard_0.19.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-connectivity/neard/neard_0.19.bb b/meta/recipes=
-connectivity/neard/neard_0.19.bb
> index 94df1ac3d6..b04187bcc5 100644
> --- a/meta/recipes-connectivity/neard/neard_0.19.bb
> +++ b/meta/recipes-connectivity/neard/neard_0.19.bb
> @@ -40,9 +40,10 @@ do_install:append() {
>  RDEPENDS:${PN} =3D "dbus"
>
>  # Bluez & Wifi are not mandatory except for handover
> +WIRELESS_DAEMON ??=3D "wpa-supplicant"
>  RRECOMMENDS:${PN} =3D "\
>                       ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth'=
, 'bluez5', '', d)} \
> -                     ${@bb.utils.contains('DISTRO_FEATURES', 'wifi','wpa=
-supplicant', '', d)} \
> +                     ${@bb.utils.contains('DISTRO_FEATURES', 'wifi','${W=
IRELESS_DAEMON}', '', d)} \
>                      "
>
>  INITSCRIPT_NAME =3D "neard"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#213490): https://lists.openembedded.org/g/openembedde=
d-core/message/213490
> Mute This Topic: https://lists.openembedded.org/mt/111838820/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

