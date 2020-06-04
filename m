Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web12.13177.1591275884875484388
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2020 06:04:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IP3CToNr;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id a25so6000296ejg.5
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2020 06:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2KWn10zfjW+gt/hakWF6q3c01ebJzdZxHip1OBEEc+Q=;
        b=IP3CToNr9zldeqycqlx2sxYLLDiMZfwAAKuMO7eIP0uTF8l8t80I80O1m1UGK4LEvV
         4egVLIj7miL2vMspzj+etKfwedw2vRv+TQDxhJ7iM2O3+Tmz4N27ZuzBSGgGmV6l7GIA
         VwkrSRq3NgNGSleZ8AhJqQxxs+W199lu0SGVUD4CgvfLi3KuE+d4bmeGZpp0niKHM0pg
         RpcAqsDmxvHA+UoQj0hoZFOhapGklsL5XghFh+wJ0ObYnK3t4NxghwXwLQhidzuqCqpP
         f3PIzsiQvqFeOjBLz739Eujej5L+1o14cqgJz5D+PmhcjVz0+wXbtc/u3gKm850jQcfC
         zYxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2KWn10zfjW+gt/hakWF6q3c01ebJzdZxHip1OBEEc+Q=;
        b=FqVSyqeLW53ZwazqwczwmrAubpovdcge+OJFyYy26eNcJmt7yITboF+msux/1de+Y1
         nU1clonCgZOegpGfomJbfe10sqvMT5cRThJd2b+gBDrRG2y20CsBOUmJyeq/LsbtIxEO
         CzVLpetUHapNTONiqHwL6iFDo5Og/Fd/daqRpjRFRpdFVf6DXcctwzQZTvi9JNk9HAOV
         JGXgeHsYQyH4Lf4R7ohSMwN52XNeqxJf6s74Hq1Q3pus6feU2YYXZHdkagNKf6RO4292
         41Pb4KXyn59BJ0uSrn0VK+AIt2aa+Nz8cakyY/WDKczdmR4+Z48wz0ZZQY9B0MkS21Cd
         iCug==
X-Gm-Message-State: AOAM530CgKnbmZvi7QaCSjtDGLJ+TbUmnos5O0VAurLrX7baSjCP+aFm
	8F76OpQYafoqUGzm/+5N6jBLh2K9iGh6xqhFPcE=
X-Google-Smtp-Source: ABdhPJz4oJJwISxViXGdKU61SJUiA/pfChkSEJcl854NcV/Cyjw9eYmuHRLXYPMy25+olztIR6lF5DizfePGEZ8lI8U=
X-Received: by 2002:a17:906:5283:: with SMTP id c3mr3576699ejm.22.1591275883350;
 Thu, 04 Jun 2020 06:04:43 -0700 (PDT)
MIME-Version: 1.0
References: <67e32d06-6dc2-5566-f362-d7c2dd736618@windriver.com>
In-Reply-To: <67e32d06-6dc2-5566-f362-d7c2dd736618@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 4 Jun 2020 09:04:32 -0400
Message-ID: <CADkTA4M+tRVzebByfDPmM2kwALcakrSoS4CQ87zAj759cBksEA@mail.gmail.com>
Subject: Re: The change pointed to by a .scc file not detected when compile kernel
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Robert Yang <liezhi.yang@windriver.com>, zyang <zhangle.yang@windriver.com>, 
	"Asselstine, Mark" <mark.asselstine@windriver.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 4, 2020 at 12:52 AM Yu, Mingli <mingli.yu@windriver.com> wrote:
>
> Hi Bruce,
>
> Currently, the change pointed to by a .scc file not detected when
> compile kernel, for example:
>
> 1, add DISTRO_FEATURES_append = " virtualization" to conf/local.conf to
> enable virtualization DISTRO_FEATURES and also add meta-virtualization
> layer to conf/bblayers.conf
>
> 2, bitbake -cconfigure linux-yocto
>
> 3,
> $ grep -Rn CONFIG_IO_DELAY_0XED
> tmp/work/qemux86_64-wrs-linux/linux-yocto/5.4.43+gitAUTOINC+aafb8f095e_9e1b13d7f9-r0/linux-qemux86_64-standard-build/.config
> 5367:# CONFIG_IO_DELAY_0XED is not set
>
> 4, modify the lxc.cfg which introduced by lxc.scc under
> meta-virtualization layer
> $ git diff
> diff --git a/recipes-kernel/linux/linux-yocto/lxc.cfg
> b/recipes-kernel/linux/linux-yocto/lxc.cfg
> index 3fefc03..b7a19a8 100644
> --- a/recipes-kernel/linux/linux-yocto/lxc.cfg
> +++ b/recipes-kernel/linux/linux-yocto/lxc.cfg
> @@ -1,3 +1,4 @@
> +CONFIG_IO_DELAY_0XED=y
>   CONFIG_CGROUP_DEVICE=y
>   CONFIG_CPUSETS=y
>   CONFIG_PROC_PID_CPUSET=y
>
>
> 5, bitbake -cconfigure linux-yocto
>
> 6,
> $ grep -Rn CONFIG_IO_DELAY_0XED
> tmp-glibc/work/qemux86_64-wrs-linux/linux-yocto/5.4.43+gitAUTOINC+aafb8f095e_9e1b13d7f9-r0/linux-qemux86_64-standard-build/.config
> 5367:# CONFIG_IO_DELAY_0XED is not set
>
> The change for CONFIG_IO_DELAY_0XED doesn't take effect.

Does the same thing happen with a cleanall ? There's an open bug about
the checksuming of those SRC_URI elements, and you are likely hitting
it if there's no cleansstate or cleanall happening.

Also, you've confirmed that CONFIG_IO_DELAY_0XED isn't missing any
config options that it has as dependencies ?

Bruce

>
> Thanks,
> Mingli



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
