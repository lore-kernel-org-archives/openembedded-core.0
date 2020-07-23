Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web12.8040.1595493368711634790
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2020 01:36:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XxT2bHm5;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id g26so4627384qka.3
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2020 01:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x4AUilsy/ciYNPKLueMQ1zlkOcwB6dCAWzglZl7DQL0=;
        b=XxT2bHm5c5zFBEM9463bL01TepiT3Jw8cOHp3ndiGAK3ug4o/RJg6mU6HEebbj5X0X
         2TWT8g6pjL1HwYU+G6jJ+THN5bVtq3GUHzLJYXrSCTpJg8l/FnWkSdZoZMHHVHuVFNTT
         bs9VHmVwmf3ELDkjDVhX0A1RPuXGof7kfL4PdzLSdoyccaZrxjaB0k9xjyaa/htr39TS
         I6USjCkoVA269ZNXeluAveq1QPHt9BuKP+DWJl17dAx2yyg4xx85I95k3qVcaRxTrJst
         BcV8SHfDazTb8Xw/ZPUReM7klwH0I4hDeGrrOy0n9OaBBpdnY+Zi7GmNjo+AprMMjRnb
         iF9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x4AUilsy/ciYNPKLueMQ1zlkOcwB6dCAWzglZl7DQL0=;
        b=cxk8vbNCAUWKIh/qRBFcnuP09rpTwMWl5x6C8kL1TdwBZACsl2rcHrZNYfoH2DXWBL
         xt7ehO6IGonn8ZWMroyNccdRfNAwlboJMP+hsygK6oY8pUJFFfungHTfGY51HLrULSVb
         15fTo+hZw7Slll90KeMy5bISv5UiC7p5fxRSWD39PlJmBFSSj4df2/44q5rlFN8dB6Nx
         REGgQxslmiihw3swKUGBxeI34fIDLpSDE9zQRbO179jrAo7jZdONZ3EnJoMt8FT1RHuH
         kJwqwG1eChSD63VxNoN2moxF0/DWI+vYNkMP72MsEec9K5c69oGKY9EAUNAP5ddsw9Yi
         zSvg==
X-Gm-Message-State: AOAM532920F1uLmoMhGTthakqKMBreriJGAD5wEURAmjpIR3jV8YEAJK
	QyczhxwqSTfDYQnVb4adqSobgdQRSma6nDYHRA4=
X-Google-Smtp-Source: ABdhPJzVTFYr9Or0vWZn5NnxEP3N07dsXF0m3f0dABlSEITPCg3QFoOdWVaSS+kaUgozaDlL2vMDvkf5ceelApk8OBI=
X-Received: by 2002:a05:620a:565:: with SMTP id p5mr4168892qkp.215.1595493367776;
 Thu, 23 Jul 2020 01:36:07 -0700 (PDT)
MIME-Version: 1.0
References: <CA+chaQdLigicck-6Q53upOEBNxGei1a_465P6kOb_ZV8ungYMw@mail.gmail.com>
 <20200723065120.2942320-1-changqing.li@windriver.com>
In-Reply-To: <20200723065120.2942320-1-changqing.li@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 23 Jul 2020 01:35:41 -0700
Message-ID: <CAMKF1srLZhLYaK2Lx9+pGSVZzHPzZqGfdZmeTky=CbHikaEhhQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] layer.conf: fix adwaita-icon-theme signature change problem
To: Changqing Li <changqing.li@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

infact the error is not limited to just one theme recipe but all which
inherit this class see

http://jenkins.nas-admin.org/view/OE/job/oe_world_workspace-compare-signatures/980/console

so are we forcing same kind of fix everywhere ? seems a bit of kludge to me

On Wed, Jul 22, 2020 at 11:55 PM Changqing Li
<changqing.li@windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> allarch package adwaita-icon-theme inherit both allarch and
> gtk-icon-cache, since commit 31e3d34c8a9c3e8481aa837aa0bf52adf095fe62
> [gtk-icon-cache.bbclass: add runtime dependency], it start depend on
> non-allarch packages gdk-pixbuf and gtk+3, which make it's signature
> changes when machine changed.
>
> like for task do_prepare_recipe_sysroot:
> "Hash for dependent task
> gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_populate_sysroot changed from
> a72aba8432699c8ce4ca1f71833ef14a89ffde0ea4063e37b9d819fdb1e407f4 to
> 1ad4e1bd76921b71482657f3b017184e9ade8e2a0b9f43ad64ed2dda83b1520f"
>
> the only way to fix this is remove the task dependency.
> SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS not work in class, so add it in
> layer.conf.
>
> Maybe we have other recipes under other layers have similar problem, we
> can only add one by one to its layer.conf, seems not a good idea. but
> add *->pixbuf will influence other packages
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/conf/layer.conf | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
> index 098ef12ac6..c115c87043 100644
> --- a/meta/conf/layer.conf
> +++ b/meta/conf/layer.conf
> @@ -80,6 +80,8 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
>    weston-init->kbd \
>    connman->xl2tpd \
>    lttng-tools->lttng-modules \
> +  adwaita-icon-theme->gdk-pixbuf \
> +  adwaita-icon-theme->gtk+3 \
>  "
>
>  # Avoid adding bison-native to the sysroot without a specific
> --
> 2.17.1
>
> 
