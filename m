Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6FB9C02193
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 07:54:17 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.83064.1738569250535745664
 for <Openembedded-core@lists.openembedded.org>;
 Sun, 02 Feb 2025 23:54:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=yPTLj88Z;
 spf=pass (domain: linaro.org, ip: 209.85.208.182, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-307c13298eeso2879171fa.0
        for <Openembedded-core@lists.openembedded.org>; Sun, 02 Feb 2025 23:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738569248; x=1739174048; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+3Gj380EU/3Bzlnkp9noU6lmvBvNprDDtZ6Bjsmzp4k=;
        b=yPTLj88Z23bV9h4cceFcNWBuR36U03Utx09fuusrAV0z5jBdoekvrPCr8wcmLOLAAR
         04fTZN7R59BcVEm994UkUNosoIK/nS1BZzAL38TDfh2JC360vZJLfYgyB5nOu7onXqGG
         tLNQsPPnpeZpj2ZzfSAIucB6S5qXPmgaIddKpQYtMapYHHolg/uxfTurKZ7nY1cEvz4w
         5iWGRUoqPNM4vx6ZMh1JXzriiTE9DxLuwZvTh9EuGi2rPyKiUg3+MJV+faAYRew5L6Dx
         jhJELDoRhoEGor1v1RRQuomRwQzDpLfZG55F/7224GMY2PgUYQf8ZlR2z2yS1IcvvIpi
         i1SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738569248; x=1739174048;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+3Gj380EU/3Bzlnkp9noU6lmvBvNprDDtZ6Bjsmzp4k=;
        b=qZcX+JFQIf9vxbzBHuULoeDX5XY7YHUN4xZ5b6+WgGjf6ZKzcpT+75CD0OtS7LBjNd
         JiczxS710/R6qZrqGqUChPvvoimYxyY+zzceDADWarpOQY5uhqW3pNJzlW7CRUeKJUX8
         84SCFaWYZ0PNtIvI+doVAsBLE0q+FZ9eCqucSNHUao3rdxOhBdIDY3HKCsMZmZELE6bb
         IYL6/GZNS5KwyCOx3UNJ7TQqYf1DEdQCl4QouJug3ksNTI2YLjwWTaBVAfWudTlfQXph
         1mJXZOG1TUHVA3sFtSc7paJ02M5ltXjTz4P/O0/jEnufAF9DBy954BWlTUyV6qff2VEu
         XZvA==
X-Gm-Message-State: AOJu0YzNKy+LXwFu74mez3dtMWXkyn8j1e3N2jr0wr+jdBYoSA/xwki4
	zBhoa0cR0TXRk0vfFuUf3I67jAGY6fhxMUoCeLJkUtx3B1sKlSbwu8Bg5sDL5yQ=
X-Gm-Gg: ASbGnctn+U0YwPNR0Wu5i9eET99CrgEycP09WbmNZL9nDf2QHOs+xFA4bKyCY6NBzfw
	oecB+QXlHbNngnnDkmuYc9qzdM9fuMr8KA1OmsnpVlf1mpDV+BeKA+3VErdx9PHe7yL6D2RgL0T
	lOOHXQhGXktCEepeSnDkqK1+/N4rVc2iZrs9GfpQWGPjeaZ9p4SwgNTc5UAZJEUtSHPyxHMrqNh
	DqsKktXakeBWuNEIVSCOgL2h/e+gXSbTGJlGhRxUQWhKa87HL/KtnEf+R8lxxsAx0v5sBTosDuP
	5y3o3eAAHPzYRS/DCEo5rdtBy2ui7stCOke5teG+
X-Google-Smtp-Source: AGHT+IGV6s6p+ROrhU8md1weVxFEtK4aDgLNbdznPeHa7ds2WCi/y4U88cbkMOe1m7BgZX/W4W1Jfg==
X-Received: by 2002:a2e:96c5:0:b0:2ff:4e4b:cbe2 with SMTP id 38308e7fff4ca-307aa424553mr30667281fa.14.1738569248470;
        Sun, 02 Feb 2025 23:54:08 -0800 (PST)
Received: from nuoska (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307a3069a19sm14256871fa.18.2025.02.02.23.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 23:54:07 -0800 (PST)
Date: Mon, 3 Feb 2025 09:54:04 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: uvv.mail@gmail.com
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 3/3] systemd: Build the systemctl executable
Message-ID: <Z6B2HKSlI6k9wNXO@nuoska>
References: <20250202200319.82231-1-uvv.mail@gmail.com>
 <20250202200319.82231-3-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250202200319.82231-3-uvv.mail@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 07:54:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210631

Hi,

On Sun, Feb 02, 2025 at 09:03:19PM +0100, Vyacheslav Yurkov via lists.openembedded.org wrote:
> From: Vyacheslav Yurkov <uvv.mail@gmail.com>
> 
> Instead of the python re-implementation build the actual systemctl from
> the systemd source tree.

Could you elaborate why? Some usecase or feature not supported by the python
wrapper? Which one?

Maybe it makes sense to have a self or runtime test for this usecase.

Then the native toolchain set seems to be increasing. While systemd-boot-native
is also trying to be simple for ukify.py, it could expand if tools like
systemd-measure for TPM calculations would get added. And systemd-sbsign instead of
sbsign for secureboot signatures.

Maybe it would make sense to cambine all in a full systemd-native recipe?

> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> ---
>  .../systemd/systemd-systemctl-native.bb       |  20 +-
>  ...-meson-add-install-tag-for-systemctl.patch |  24 ++
>  .../systemd/systemd-systemctl/systemctl       | 366 ------------------
>  3 files changed, 32 insertions(+), 378 deletions(-)
>  create mode 100644 meta/recipes-core/systemd/systemd-systemctl/0001-meson-add-install-tag-for-systemctl.patch
>  delete mode 100755 meta/recipes-core/systemd/systemd-systemctl/systemctl
> 
> diff --git a/meta/recipes-core/systemd/systemd-systemctl-native.bb b/meta/recipes-core/systemd/systemd-systemctl-native.bb
> index ffa024caef..57bb1ab830 100644
> --- a/meta/recipes-core/systemd/systemd-systemctl-native.bb
> +++ b/meta/recipes-core/systemd/systemd-systemctl-native.bb
> @@ -1,17 +1,13 @@
> -SUMMARY = "Wrapper for enabling systemd services"
> +SUMMARY = "Systemctl executable from systemd"
>  
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> +require systemd.inc
>  
> +DEPENDS = "gperf-native libcap-native util-linux-native python3-jinja2-native"
>  
> -inherit native
> +inherit pkgconfig meson native
>  
> -SRC_URI = "file://systemctl"
> +SRC_URI = "file://0001-meson-add-install-tag-for-systemctl.patch"
>  
> -S = "${WORKDIR}/sources"
> -UNPACKDIR = "${S}"
> -
> -do_install() {
> -	install -d ${D}${bindir}
> -	install -m 0755 ${S}/systemctl ${D}${bindir}
> -}
> +MESON_TARGET = "systemctl:executable"
> +MESON_INSTALL_TAGS = "systemctl"
> +EXTRA_OEMESON:append = " -Dlink-systemctl-shared=false"
> diff --git a/meta/recipes-core/systemd/systemd-systemctl/0001-meson-add-install-tag-for-systemctl.patch b/meta/recipes-core/systemd/systemd-systemctl/0001-meson-add-install-tag-for-systemctl.patch
> new file mode 100644
> index 0000000000..a4b3e5a47e
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd-systemctl/0001-meson-add-install-tag-for-systemctl.patch
> @@ -0,0 +1,24 @@
> +From fe2eb1dde51648b0e5825766e2f27a859de8521c Mon Sep 17 00:00:00 2001
> +From: Vyacheslav Yurkov <uvv.mail@gmail.com>
> +Date: Sun, 2 Feb 2025 10:13:38 +0100
> +Subject: [PATCH] meson: add install tag for systemctl
> +
> +Upstream-Status: Submitted

Would be nice to link the URL here.

Cheers,

-Mikko

