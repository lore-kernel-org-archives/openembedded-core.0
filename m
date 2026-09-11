Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 493BFC88E50
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 12:46:28 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38448.1789130782786411613
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2026 05:46:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=F41F7GAg;
 spf=pass (domain: smile.fr, ip: 74.125.225.76, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6351831so432361f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 05:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789130781; x=1789735581; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=C5ZSmauMrtivT1ISseL4CGM++buIBEBlRbXPOV/gw70=;
        b=F41F7GAg9c7IUEJu8XApLyrmlmWWOaOGyH6Cyvm9Qel9a3AQrSg88wXCcXY+MXk3Rj
         j16C8JmiY0n2fbIxWZ1dtsGl+A/oms91Y9rRC0azNmSMDa3KGvXKyjV/WdnLaGwgXMz3
         KszVYOhiUaJ6sWwD70Rqzomvj7xeS5uZU7J5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789130781; x=1789735581;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C5ZSmauMrtivT1ISseL4CGM++buIBEBlRbXPOV/gw70=;
        b=XOWLeXnNO2OqmO/Yxm3DKOE/5N8pogFizvsIUpVN5Vwd5pLuxlXl+M9+MnsLZPn40a
         YlqCP1IXIf86Yz9ufzjEXXY4JJs3UhapPYUxuznYLkaUP+GeZ5VlFzXBefcnOUSxQPxL
         uzax4nDeDp7jDctA6LJxhqfJseMVLNS1gpAPfLKwo3esFSAg5mRmXjefOR7LqNde/Nq0
         WMsEV+SxzBFHYoXmy9LDOCqibvthk2qaN6JzrZnNbouEnwJZ2h9UhV90DKlMGqk5aMlw
         t4G/KO0+zHWov9R0kk1CXIcqalJfpPeVgsXwKg9PDVajq/bKK8FUa2W90AeS+aif/5Ht
         qYdg==
X-Forwarded-Encrypted: i=1; AKwUvByK9Xoa6DCUMMt3PPj34aKEt3gq3sXqxOvSPK+KJ1nhw+PvijcjWCuyZg4/n1JYv9LWmEt7aVtJtrNlvXHFn6KUEw==@lists.openembedded.org
X-Gm-Message-State: AFuF++mJXjpp0/o5lDkv3kAUg9OkiOa++hb20IWBMcstMxfg/YT1BlW/
	wfek5B53emYQyv0AkzYnUR/CLz/V/ftJ1nPabz4oJO6oQ7AJaJF2g8CdAk8v/nBqBBE=
X-Gm-Gg: AYBFou1isCvg8iXXSIyHqt+rAXqzkGNp3h8Np4rBecWOmN8I7jbFjikiqaZOnsDTW/e
	ddTuSlVBYiFVvr8VeiaZDnAV7Uw6B2Gg5NSqd63FrA6Rplr94PypLSqKZ2sJ3V3U8xNz5Shr5cG
	IGSGzRPo4JWdPRR2453BvazPOowp4O8py5AmB/cZJC6t53AgRJGX1VS4GX28fFaZ9eI7hJew6qL
	wZKAlnQvcYAGyd4Ls+k+yQ/Zj+nyUJn8x5amStOauBGOk/6VLGDPUc+ZVkQp/860GG3avZvoslT
	4/OduiQMGhx0StNLOSEqUUpVBSVCPtltR96dTkVIy/eol4dYPBiHbFtDfcBCci26scelxuGWiai
	IAV62SQGFGUyDc1jrnMhbL6TqNU4ZxNHfyH1cXvb1sGgMqhTQOOE94G4+kRwO8V6qm61geFvynI
	LdMzrsExEPkfAR2X7/DYaACT6wpFvUzIpWX5gwPDn0+HqtiqTT26zE3XZUG9XbDRjhgE+j82kPa
	Mp2p6QpybagLKAFH3375Jq7JIczvHiNAec8Rjfxvsui6QJZKsbnKNuX4q2oLkBal1MUN3Vb6Ec=
X-Received: by 2002:a5d:464a:0:b0:485:8f37:79b7 with SMTP id ffacd0b85a97d-486eb31e0cbmr3548506f8f.33.1789130780501;
        Fri, 11 Sep 2026 05:46:20 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34fdd2sm5920315f8f.28.2026.09.11.05.46.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 05:46:19 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Sep 2026 14:46:19 +0200
Message-Id: <DLCHXHGCOH27.3OW22UEZ4WRRG@smile.fr>
Subject: Re: [OE-core][scarthgap][Patch 02/11] u-boot-tools: Ignore
 CVE-2024-42040
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <xe-linux-external@cisco.com>
To: <hthakar@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <cover.1787731424.git.hthakar@cisco.com>
 <240b02378283bcfe760e1902a29fad5361fda380.1787731424.git.hthakar@cisco.com>
In-Reply-To: <240b02378283bcfe760e1902a29fad5361fda380.1787731424.git.hthakar@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 12:46:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245641

On Wed Aug 26, 2026 at 10:12 AM CEST, Hetvi Thakar -X (hthakar - E INFOCHIP=
S PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Hetvi Thakar <hthakar@cisco.com>
>
> Analysis:
> - CVE-2024-42040 affects the U-Boot DHCP client in net/bootp.c [1].
> - u-boot-tools uses tools-only_defconfig, where CONFIG_NET is disabled
>   [2].
> - Hence ignore this CVE for u-boot-tools; the exclusion is
>   configuration-based.
>
> Reference:
> [1] https://nvd.nist.gov/vuln/detail/CVE-2024-42040
> [2] https://github.com/u-boot/u-boot/blob/866ca972d6c3/configs/tools-only=
_defconfig
>
> Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
> ---
>  meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb b/meta/recip=
es-bsp/u-boot/u-boot-tools_2024.01.bb
> index 4b6d89ed4e..b5711e1f97 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb
> @@ -2,3 +2,5 @@ require u-boot-common.inc
>  require u-boot-tools.inc
> =20
>  SRC_URI +=3D "file://CVE-2026-46728.patch"
> +
> +CVE_STATUS[CVE-2024-42040] =3D "not-applicable-config: DHCP client code =
in net/bootp.c is not built by tools-only_defconfig, which disables CONFIG_=
NET."

Hello,

I don't think we need this because, even if the code is not compiled, it
has been fixed earlier in scarthgap:
See 5c086db3f44 (u-boot: fix CVE-2024-42040, 2025-10-29)
Same reasonning apply to other patches in this series. Can you check if
we really need those?

Thanks!
--=20
Yoann Congal
Smile ECS


