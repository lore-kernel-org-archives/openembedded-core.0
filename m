Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
 by mx.groups.io with SMTP id smtpd.web11.22281.1613926295793351211
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Feb 2021 08:51:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=SklVEn7I;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.195, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f195.google.com with SMTP id r23so51346863ljh.1
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Feb 2021 08:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=uRoIjNL9d5fdwwMB44fdTnA3AayTdnmKpUR+vFEEUxc=;
        b=SklVEn7IlevaOOeaYguX7Yz3Duukr8Ok4atH/Kl90eeAb52u9xprR+GVO3mXb3WAC/
         BJfFPULMNP9nO+szJot6JMNsEniyQ6CBlUGpBe8LBQpg6ralvsuZSBubtofNmNxWZmy9
         dntyfVjDvykFovwOr0XS3c9oKSzGuEM84pOYUrC41TyIE50enWpVoq4ospVmZCPwjCUX
         Vrofn+AyH8hpqDyphwjx6xGcDtBD3SesR9j6PmQJ1lp6O3Mmwjy9jZI2+/uBNLYI8plg
         3FN1A8KR0okoqcNROH/g/Yf6K4d8nJ4ke0VcX7JqQtmWJmFfToyx3OWX2uY39Q3ApshP
         Bv/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=uRoIjNL9d5fdwwMB44fdTnA3AayTdnmKpUR+vFEEUxc=;
        b=JQ6dYNIx6cTmcxPAa7c5kmBEDzS1ojRu9esirLJsmI9D0SQETj20G+XisuX9kotmUy
         ze9EEmEEcwZTarQAiqkib6AFhKc6r7yGx4gv+pmRfOukbSrgCwt9I342j85YgiTJAtjJ
         VNZSoZgN9BaKDaMIDAd127KU2ActjJ/ymJ5358CVVODPo+x1Mkv1MJYlZ1+qHD1pp2nl
         uSLd4k7z1mQlgiLrzRHByEvDC2evRukS1bGyVvmkHeRjzicut3iNgYA8uwY+sZUPKIjB
         WktCPyR5DZItQ4KonToQZyK+VcUTl6zdtgeAHyep8N2ctypzcSHjnIZeGk/jmgrD00HR
         yitg==
X-Gm-Message-State: AOAM533N2JhappxweHCMuzM/2EH2ZzZN45/rLOJsh9PWGFOCmfmHMT95
	JFK2BC2vebW1/86dTgJbd/t9rg==
X-Google-Smtp-Source: ABdhPJxTxB3rUbM7XWgMRdM5a2PT+b4PMlMzPU85QY/S4xpeD/EyAlOQpGaqQS2NYrTnAhg+rR/zmg==
X-Received: by 2002:a19:8503:: with SMTP id h3mr11049538lfd.488.1613926293817;
        Sun, 21 Feb 2021 08:51:33 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from [192.168.0.8] (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id w6sm503328lfn.136.2021.02.21.08.51.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Feb 2021 08:51:33 -0800 (PST)
Subject: Re: [PATCH] cups: set rundir to /run/cups if systemd is used
To: openembedded-core@lists.openembedded.org
Cc: kai.kang@windriver.com
References: <20210221164919.389109-1-open.source@oleksandr-kravchuk.com>
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
Message-ID: <007cf865-82b2-d5c4-6720-76e9009e8e6c@oleksandr-kravchuk.com>
Date: Sun, 21 Feb 2021 17:51:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210221164919.389109-1-open.source@oleksandr-kravchuk.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Kai -

Could you please verify and confirm the fix is correct?

On 21/02/2021 17:49, Oleksandr Kravchuk wrote:
> When running under systemd, cups needs to be configured with
> '--with-rundir=/run/cups', as systemd takes an exception to the
> activation socket being under /var/run and relocates it.
>
> This leads to fd duplication in cupsd and an inadvertent closure of the
> activation socket when the daemon exits due to inactivity, so that the
> daemon cannot be activated again.
>
> [YOCTO #14152]
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>   meta/recipes-extended/cups/cups.inc | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
> index e7a704134c..a8e8d115da 100644
> --- a/meta/recipes-extended/cups/cups.inc
> +++ b/meta/recipes-extended/cups/cups.inc
> @@ -56,8 +56,11 @@ EXTRA_OECONF = " \
>                  --enable-libusb \
>                  --with-domainsocket=/run/cups/cups.sock \
>                  DSOFLAGS='${LDFLAGS}' \
> +               ${EXTRA_OECONF_SYSTEMD} \
>                  "
>   
> +EXTRA_OECONF_SYSTEMD = "${@bb.utils.contains('DISTRO_FEATURES','systemd','--with-rundir=/run/cups','',d)}"
> +
>   EXTRA_AUTORECONF += "--exclude=autoheader"
>   
>   do_compile () {
> @@ -105,6 +108,8 @@ RDEPENDS_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'procps',
>   FILES_${PN} += "${libexecdir}/cups/ \
>   	       "
>   
> +FILES_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '/run/cups/certs', '', d)}"
> +
>   FILES_${PN}-lib = "${libdir}/libcups.so.*"
>   
>   FILES_${PN}-libimage = "${libdir}/libcupsimage.so.*"
