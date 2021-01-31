Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.17363.1612092975189193103
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Jan 2021 03:36:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=A5HIsnfy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id 7so13505473wrz.0
        for <openembedded-core@lists.openembedded.org>; Sun, 31 Jan 2021 03:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=pRFWRo1sOAEgK0xrAczoD7xG55WlQOmhnsINeUR6Wr4=;
        b=A5HIsnfyyEBvQkjjp6rdWcsAmYtzPdJQP628ahraUJvF5EqySd+QFRZKlJ+FFWGXzs
         JpbPGgHSBBuvrkKZrR9o7XJ0Wd3twT7GJ77VuKNpcs5c6l5V4fwZOp0atkKpMwt+x53z
         LmEvfI2fPQYr/vuIffoQhH5QKvoz3NL9d7OoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=pRFWRo1sOAEgK0xrAczoD7xG55WlQOmhnsINeUR6Wr4=;
        b=USdAmwXdXyIsoSQIRk19OuT+KAz+iT8XKjlO4Pi7Q8y4pHUgZF9BkwS4VX0AzNDgv4
         EVUrLxA5doca1d8qu/eNRRq8zEaVFteSTTm+MtVis7bWIvLuvndeInwsxfFPjLWmN6E+
         ElqXiogeMsTJAtlqa6Nwohw/TfqxbNvJlLuX1B0hFCe09H+W5ta1nm9xlPzW0l6q+Ni+
         O5bsrL1rWvDXmkNx36NP++OuemxBZVrgkwIarKgCCLpZeItUEn1D11A0n2SbVXo25kCl
         6egp9iE6LAXnwPWkuYI/FiA8zVm6L2lOW2DmcKw02ZTCMwUoXGgGM4dS+hJ+BL4jgbGP
         Ww3w==
X-Gm-Message-State: AOAM533c7rcfaJarXee0aR8oRteUbqgFNG3nWnz/UBrUdhUSZNX730DZ
	yjU+lQIbxbwjczzRY7DwqCbJbZQeCH1EGg==
X-Google-Smtp-Source: ABdhPJyIJQjOn+OEpBgaI9KSqggX0DY3UbPbXXhi5zzm+Zx43J/JS9/UWjTQWMJYkC1WoQwJ4EFGjQ==
X-Received: by 2002:adf:d1ce:: with SMTP id b14mr13096596wrd.329.1612092973609;
        Sun, 31 Jan 2021 03:36:13 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:29f7:5a4e:c660:258e? ([2001:8b0:aba:5f3c:29f7:5a4e:c660:258e])
        by smtp.gmail.com with ESMTPSA id c62sm3291517wme.16.2021.01.31.03.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jan 2021 03:36:13 -0800 (PST)
Message-ID: <f7309d1d8d3fd2f0c4595ddda3e5abb9c4cb4650.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] bitbake.conf: use ${RECIPE_SYSROOT} for PSEUDO_IGNORE_PATHS
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Yu, Mingli" <mingli.yu@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 31 Jan 2021 11:36:12 +0000
In-Reply-To: <20210120070527.32242-1-mingli.yu@windriver.com>
References: 
	<4e34eedd6cd84c361e5a316325c508499a7d75a6.camel@linuxfoundation.org>
	 <20210120070527.32242-1-mingli.yu@windriver.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-01-20 at 15:05 +0800, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> When multilib enabled, there comes below error for packages which
> inherit useradd bbclass randomly when build eSDK.
>  $ bitbake image-name -c populate_sdk_ext
>  Exception: subprocess.CalledProcessError: Command '/prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-std/1.0-r5/lib32-recipe-sysroot/usr/bin/postinst-useradd-lib32-avahi' returned non-zero exit status 1.
>  Subprocess output:
>  /prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-std/1.0-r5/recipe-sysroot-native/usr/sbin/useradd
>  Running useradd commands...
>  NOTE: lib32-avahi: Performing useradd with [--root /prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-std/1.0-r5/recipe-sysroot --system --home /run/avahi-daemon                               --no-create-home --shell /bin/false                               --user-group avahi]
>  useradd: Warning: missing or non-executable shell '/bin/false'
>  abort()ing pseudo client by server request. See https://wiki.yoctoproject.org/wiki/Pseudo_Abort for more details on this.
>  Check logfile: /prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-std/1.0-r5/pseudo//pseudo.log
>  ERROR: lib32-avahi: useradd command did not succeed.
>  ERROR: Logfile of failure stored in: /prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-std/1.0-r5/temp/log.do_sdk_depends.20567
> 
>  $ cat  /prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-std/1.0-r5/pseudo//pseudo.log
>  [snip]
>  path mismatch [1 link]: ino 26553244 db '/prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-std/1.0-r5/recipe-sysroot/etc/group'
> req '/prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-std/1.0-r5/recipe-sysroot/etc/group.33605'.
>  [snip]
> 
>  Check the PSEUDO_IGNORE_PATHS in [1], the recipe-sysroot part is
>  /prj/tmp-glibc/work/corei7-32-wrsmllib32-linux/lib32-avahi/0.8-r0/recipe-sysroot.
> 
>  Use ${RECIPE_SYSROOT} for PSEUDO_IGNORE_PATHS to guarantee the
>  recipe-syroot part to be /prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-std/1.0-r5/recipe-sysroot
>  to fix the above issue.
> 
>  [1] /prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-std/1.0-r5/lib32-recipe-sysroot/usr/bin/postinst-useradd-lib32-avahi
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Could you retest this with the latest pseudo upgrade in master please?

I'm not convinced this is the correct fix, I suspect there is something
else going on here. We don't see this on the autobuilder and it would
be good to understand why.

Cheers,

Richard

