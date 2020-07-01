Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com [209.85.210.68])
 by mx.groups.io with SMTP id smtpd.web10.18021.1593596948702447670
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2020 02:49:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=hP3z5QNL;
 spf=pass (domain: konsulko.com, ip: 209.85.210.68, mailfrom: paul.barker@konsulko.com)
Received: by mail-ot1-f68.google.com with SMTP id w17so13076691otl.4
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2020 02:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=pKZnW+VGajBEodQVyuCC/1T4asPBo8JHAd7eghqHcPo=;
        b=hP3z5QNLFQHQNjKxvr+0xtq3z/klYi2zPVACnx6v5HTb3QQ4Cuo7mwmLXJbFrYR4su
         5QIq74A4iIbNYrhi8jEFn4Bjdio4HQ1vs4dnKhRmbfRhBDRkN4GEtWLwc3YAC4HPHQ0K
         ZbROdHlJrGJLaIeOfZzg6N/2vXvkQIoipjPnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=pKZnW+VGajBEodQVyuCC/1T4asPBo8JHAd7eghqHcPo=;
        b=UTq80DZpTcSiU3OMmEmpfoidOg/shtzGtmB2x+OiW3qiAmV+v5ftqNldUooLfWBDmJ
         x2X7/9UInaQttATeg6UtvdtiRtb9Unls2cUtcuEQhBiHU2FzK5sNGvfBLIVJYm2msnUp
         GINHkS/l+w4oT93dbchSVaviX8a1ds/xrQ1EkzxsPznqCMUDgk9yt/w9rJEyB+zl9J3B
         P6jYFysd0pIau9U2vq9kYVqxikWxsiZkk2hrepGuqPGK/CJdi2Fpv8h6tJDhO/NVO8rA
         DGb8cpp+la0DAp6nkprFiESDUd9P+6tAEpUjMFn7LyYGoNAkBtCr6a7bdvIBLPf56KmI
         MioQ==
X-Gm-Message-State: AOAM532Vxk9Dic0RcxRWXONaTlxjM4urScZcg5qJie/DpxDSY7KqrhPi
	/iF9mtDWmwjlb7NF96gdT9wOz87/mOialDOKAIUD+Q==
X-Google-Smtp-Source: ABdhPJyZaHBJ5GGxxSEG3Jiq/lJ3EFSXgQ4Ch+lTouicUuvu/eqFDuXCpfuF3hq/Ir3xMkqBf4LVhFvJHcoulCJ0Wsc=
X-Received: by 2002:a9d:7f12:: with SMTP id j18mr15913122otq.92.1593596948020;
 Wed, 01 Jul 2020 02:49:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200701084634.11428-1-fredrigu@axis.com> <20200701084634.11428-2-fredrigu@axis.com>
In-Reply-To: <20200701084634.11428-2-fredrigu@axis.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Wed, 1 Jul 2020 10:48:57 +0100
Message-ID: <CAM9ZRVvdaVSghGzoFwy6vhHLhzHE-HatJpRwC6LxpuepO_pTxw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] nopackages.bbclass: Get tasks from variable
To: Fredrik Gustafsson <fredrik.gustafsson@axis.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, 
	tools-cfpbuild-internal <tools-cfpbuild-internal@axis.com>, Fredrik Gustafsson <fredrigu@axis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 1 Jul 2020 at 09:46, Fredrik Gustafsson
<fredrik.gustafsson@axis.com> wrote:
>
> Get tasks from a variable instead of having them hardcoded. This will
> enable other layers to add tasks that should be deleted when nopackages
> is used.
>
> Signed-off-by: Fredrik Gustafsson <fredrigu@axis.com>
> ---
>  meta/classes/nopackages.bbclass | 19 +++++++------------
>  1 file changed, 7 insertions(+), 12 deletions(-)
>
> diff --git a/meta/classes/nopackages.bbclass b/meta/classes/nopackages.bb=
class
> index 559f5078bd..4c9fe510c5 100644
> --- a/meta/classes/nopackages.bbclass
> +++ b/meta/classes/nopackages.bbclass
> @@ -1,12 +1,7 @@
> -deltask do_package
> -deltask do_package_write_rpm
> -deltask do_package_write_ipk
> -deltask do_package_write_deb
> -deltask do_package_qa
> -deltask do_packagedata
> -deltask do_package_setscene
> -deltask do_package_write_rpm_setscene
> -deltask do_package_write_ipk_setscene
> -deltask do_package_write_deb_setscene
> -deltask do_package_qa_setscene
> -deltask do_packagedata_setscene
> +NO_PACKAGES_DELTASKS +=3D "do_package do_package_write_rpm do_package_wr=
ite_ipk do_package_write_deb do_package_qa do_packagedata do_package_setsce=
ne do_package_write_rpm_setscene do_package_write_ipk_setscene do_package_w=
rite_deb_setscene do_package_qa_setscene do_packagedata_setscene"

Not sure if `+=3D` was present in the previous versions, I only just
noticed it now. I think `?=3D` is a better choice so it can be
overridden easily. Other than that, this looks good.

> +
> +python () {
> +    list =3D d.getVar("NO_PACKAGES_DELTASKS").split()
> +    for task in list:
> +        bb.build.deltask(task, d)
> +}
> --
> 2.20.1


--=20
Paul Barker
Konsulko Group
