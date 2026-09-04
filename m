Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91893C79F80
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 08:45:45 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9408.1788511537274747602
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 01:45:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=N6lFrIqb;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so7621185e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 01:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788511535; x=1789116335; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gmiUB1PsUTqvu3Wcs5smoVjk2VDH1cR84O4qh002rCo=;
        b=N6lFrIqbyi4evIusKVCi1OBJBW2Xj8OyVloJ5B1kpKYGkpklfKktYoFYFXuIvUa2tz
         P3u0F64cEhMBqWTc6O4C/M3qZdm/daBqZ+1IVn/TiDI2VDBcpZDEU7DwPUjvWPBxmHJC
         gSu6SQ5tC2Yualvgp62VvMZNX8yxTiXZwr06o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511535; x=1789116335;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gmiUB1PsUTqvu3Wcs5smoVjk2VDH1cR84O4qh002rCo=;
        b=NUxwryuHTqWbxYjJ6zKfTuzJQ2z0JRwYoG68aTlCMRaIY7HujGXMG/3JCBdo+yo+K0
         14+8XJp6RkfxIJM0Pf8ubTEmbIOWSy9gX2qWJhpQyfMfAsEFgLPQ2VONSncFTPRj8yti
         yUyfI30E/T5hFpiM2RwGD20W69wbVKX13mwwnzfhWthZQddMjNHi83yreM5v3jC7hter
         ltYC+qgqiqYOcw6Sg8tBhR59QrXDNbA5XD0vTmTIJctU4QRzBF5B4EGfxWjuNCA2iJD7
         Tjqr4khMUPzpyjP2lmEMf9bdyvbSoJQDMGj0F3Pldkjji+9a2AE5NbylU3rLLTLivBVF
         qBBg==
X-Forwarded-Encrypted: i=1; AKwUvBzuvMRDU8ztkBl5SnXg/+3sMf66kwCK1YF+VRDDdsAPoa8YEkr2KhDmw4DRGgcVLZFjKo6FVIRqP7SJ7+c/GbhVGg==@lists.openembedded.org
X-Gm-Message-State: AFuF++lg+mocdOtJy5X+Rm9VwBiNhubTfeU+Ik7y1HtjJDrLhrZ/l6uI
	Ve0e096G8oEsiG+MuUS42rul+i2F1oZ0fIVnVlRjO/9aVsGvndoKTnmCx5nmkDhMXd8=
X-Gm-Gg: AYBFou3OR8ofLSDeScINEuIqzU4FzYnUewV8QSERzj+Zh94x1I8EkwTcSktfgWW2C6r
	lMDiljvCLKJB8CQ2JZuMbvuDQ9HVPds6I5zx/2oVjWtK1+yQa8McSYLL7KFgCxEcLI4AwBPVrU6
	McBotUhxCVkR+fVEB2h5LmviL9tqNuoPiks/IpvM99f/rBsgCTXwYhUS6zQ5SAKo3G3vRruZWEU
	E4bMHzWaMIbnWohdlOucMEP6YNzYXu8jQqH7Y9RQB2cxpnV2TenIJyFcyrTiMTsN0MLOzWkfZ9h
	RxgTqsdgbIvfVf9VA3kW7Ds+bG12N0X5ck+3hddB72q1LTR2J1iXeeKyrTJCFUWLx34us83iDr8
	H6kZkiKjdygf84iBHz4Yz+0yInf17/Qu2AlnDbQv3sr9zKSMBItYD2rKU7nNjFci+vrvfTJJwc2
	dj096KC8r2+FmeWtYE3TzFb4C+Psl2F7mSoE0TIMkl/oWF/KNQuxJNkJfEajVp3hT1gqSwxtIFa
	M/lYbcAY6gd/pLirqgIPrQ6xTnFcW2cXHEUejjEiUfXSVYsmNc=
X-Received: by 2002:a05:600c:46d5:b0:49c:fc6c:be06 with SMTP id 5b1f17b1804b1-49cfc6cc142mr16594305e9.29.1788511535492;
        Fri, 04 Sep 2026 01:45:35 -0700 (PDT)
Received: from localhost (2a01cb001331aa009911d943005f4464.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:9911:d943:5f:4464])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce55259ecsm139067045e9.2.2026.09.04.01.45.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 01:45:34 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 04 Sep 2026 10:45:34 +0200
Message-Id: <DL6EFC8S1R14.3HIGWZ2NR0JGN@smile.fr>
Subject: Re: [OE-core] [wrynose] wpa-supplicant: upgrade 2.11 to 2.12
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <qli_sdc_iot_wlan_host_oss.external@qti.qualcomm.com>
To: <hangtian.zhu@oss.qualcomm.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260814012719.293852-1-hangtian.zhu@oss.qualcomm.com>
In-Reply-To: <20260814012719.293852-1-hangtian.zhu@oss.qualcomm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 08:45:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245074

On Fri Aug 14, 2026 at 3:27 AM CEST, Hangtian Zhu via lists.openembedded.or=
g wrote:
> Rename the recipe to 2.12 and update the upstream source checksum.
> Refresh LIC_FILES_CHKSUM for README changes in the new release.
>
> Drop local backports no longer needed with 2.12: macsec offload
> header guard fixes, OWE/802.11be defconfig updates, and the
> CVE-2025-24912 RADIUS fixes.
>
> Signed-off-by: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
> ---
>  ...dware-offload-requires-Linux-headers.patch | 53 -------------
>  ...-Opportunistic-Wireless-Encryption-O.patch | 39 ---------
>  ...nt-IEEE-802.11be-as-a-published-amen.patch | 34 --------
>  ...onfig-Uncomment-CONFIG_IEEE80211BE-y.patch | 32 --------
>  .../wpa-supplicant/CVE-2025-24912-01.patch    | 79 -------------------
>  .../wpa-supplicant/CVE-2025-24912-02.patch    | 70 ----------------
>  ...plicant_2.11.bb =3D> wpa-supplicant_2.12.bb} | 10 +--
>  7 files changed, 2 insertions(+), 315 deletions(-)
>  delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/0001-macsec_linux-Hardware-offload-requires-Linux-headers.patch
>  delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/0002-defconfig-Update-Opportunistic-Wireless-Encryption-O.patch
>  delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/0003-defconfig-Document-IEEE-802.11be-as-a-published-amen.patch
>  delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/0004-defconfig-Uncomment-CONFIG_IEEE80211BE-y.patch
>  delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/CVE-2025-24912-01.patch
>  delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/CVE-2025-24912-02.patch
>  rename meta/recipes-connectivity/wpa-supplicant/{wpa-supplicant_2.11.bb =
=3D> wpa-supplicant_2.12.bb} (89%)

Hello,

The 2.12 changelog is in [0] and it contains features changes like:
|* support RSN overriding (e.g., WPA3-Personal Compatibility Mode)
|* improve BSS transition management support
|* EHT/IEEE 802.11be/Wi-Fi 7
|  - more complete support
|  - fix message validation issues that could enable DoS attacks
|* support Wi-Fi Direct R2
|* support Wi-Fi Aware (add synchronized NAN; extend USD support)
|* support Proximity Ranging
|* support SPP A-MSDU negotiation
|* support IEEE 802.11bi functionality
|  - changing SAE password identifiers
|  - EPPKE
|  - IEEE 802.1X/EAP in Authentication frames
|  - Association frame encryption
|  - PMKID privacy
|[...]

All of those (and more) are not acceptable per stable policy. So, I
can't accept this patch.

[0]: https://lists.infradead.org/pipermail/hostap/2026-August/045441.html

Regards,
--=20
Yoann Congal
Smile ECS


