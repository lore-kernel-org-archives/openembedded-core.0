Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web11.40185.1585237493721777663
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 08:44:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=S7xKF72d;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id m3so7559294wmi.0
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2020 08:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=ka0A4+MDo31m+oJEhbvWawLQBSOzgT8C8IG4tgGr8Q0=;
        b=S7xKF72d+XiYxD+oUEFBYacWwgG9pSC65zVdvayAL5iZm0pNnIQWzX6EWuL/cW0p0P
         4LsXdN+exIEAL40YEp1vlDSr5yld8jFu51sN6UfnShrUg7UacgLNuUt4/1UW2Xhg8MEC
         VP8RwlvFrEYs5bQGGRZPwujgE22AjAnJufvcs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=ka0A4+MDo31m+oJEhbvWawLQBSOzgT8C8IG4tgGr8Q0=;
        b=nmDpMbUw0v7KV4D4h/EJfXrqf7KFFPGGtcgmB+ieCXGCQHn3gOulZemwq3YyfslcAI
         WIr1g566Rxg8MniZ6RbKWlj8q/3f5GN3XDXYzh4xjTL4bTwdmTW/O7tF1HpljYtN/K5x
         KFWct2ia024GO1tELh9xrnu5YgEEVldQmHrB0saVQWrwU7llg/J1bzf1YYVi24s+qrum
         z026Tf4YEPbvU0LUtrtJFnnQq378MrQrqIODytO66rljl9UgKl6MmUqIEVUfJVbQGXw7
         cRhoOdphxtRBT+LOjwjuG9NL4xiJNbgAWaEhYE+3sXh2F/n7Hnp+9scCi4ZAC2sx3y/C
         ytKA==
X-Gm-Message-State: ANhLgQ17v2TUSTZlfMEoT5wGxKlffjmF9zgv3N/5CIXLZtXXokonjPH8
	XbMxR0Whmfrp6c+YXFWbC++IGg==
X-Google-Smtp-Source: ADFU+vuMLTb2+xmmyrGeRBC2LPVz/hU83mKRWcxf7Fn99KVoZmq1CczQ4JgQj8PBVXOBNttCf7+xqg==
X-Received: by 2002:a1c:ba04:: with SMTP id k4mr581132wmf.10.1585237492185;
        Thu, 26 Mar 2020 08:44:52 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id r17sm4077159wrx.46.2020.03.26.08.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 08:44:51 -0700 (PDT)
Message-ID: <0b6612fe59631529b92e231400373b93e3396944.camel@linuxfoundation.org>
Subject: Re: [OE-core] [v2 PATCH] base.bbclass: Add COMPATIBLE_OS, useful for non-Linux target recipes
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@kernel.crashing.org>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 26 Mar 2020 15:44:50 +0000
In-Reply-To: <20200326152559.64446-1-mark.hatle@kernel.crashing.org>
References: <20200326152559.64446-1-mark.hatle@kernel.crashing.org>
User-Agent: Evolution 3.35.92-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-03-26 at 10:25 -0500, Mark Hatle wrote:
> Add the ability to generate non-Linux based components, such as
> baremetal, FreeRTOS, Zypher, etc, exist.  There is a need for a way
> to take components as specific to a given OS.
> 
> This is especially important in a multiconfig build where you may be
> targeting different OSes which different sets of recipes in a common
> set of layers.
> 
> Setting a default of (matching bitbake.conf's default TARGET_OS):
> 
>    COMPATIBLE_OS ?= "linux${LIBCEXTENSION}${ABIEXTENSION}"
> 
> will allow all existing recipes to be tagged as Linux specific, so
> only non-Linux recipes would need to be tagged with specific
> compatibility.
> 
> For a baremetal recipes, the following was used to test this code:
> 
>    COMPATIBLE_OS = "elf"
>    COMPATIBLE_OS_arm = "eabi"
> 
> Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
> ---
> V2:
> Only difference to V1 is typograhic fixes to the commit message.
> 
>  meta/classes/base.bbclass    | 7 +++++++
>  meta/conf/documentation.conf | 1 +
>  2 files changed, 8 insertions(+)
> 
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index 45f9435fd8..c123c5dc50 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -509,6 +509,13 @@ python () {
>          d.setVarFlag('do_devshell', 'fakeroot', '1')
>          d.appendVarFlag('do_devshell', 'depends', '
> virtual/fakeroot-native:do_populate_sysroot')
>  
> +    need_os = d.getVar('COMPATIBLE_OS')
> +    if need_os and not d.getVar('PARSE_ALL_RECIPES', False):
> +        import re
> +        this_os = d.getVar('TARGET_OS')
> +        if not re.match(need_os, this_os):
> +            raise bb.parse.SkipRecipe("incompatible with os %s (not
> in COMPATIBLE_OS)" % this_os)
> +
>      need_machine = d.getVar('COMPATIBLE_MACHINE')
>      if need_machine and not d.getVar('PARSE_ALL_RECIPES', False):
>          import re
> diff --git a/meta/conf/documentation.conf
> b/meta/conf/documentation.conf
> index 0b21d1f63e..7a87540f43 100644
> --- a/meta/conf/documentation.conf
> +++ b/meta/conf/documentation.conf
> @@ -111,6 +111,7 @@ COMBINED_FEATURES[doc] = "A set of features
> common between MACHINE_FEATURES and
>  COMMON_LICENSE_DIR[doc] = "Points to meta/files/common-licenses in
> the Source Directory, which is where generic license files reside."
>  COMPATIBLE_HOST[doc] = "A regular expression that resolves to one or
> more hosts (when the recipe is native) or one or more targets (when
> the recipe is non-native) with which a recipe is compatible."

How does COMPATIBLE_OS compare to COMPATIBLE_HOST (documented above)?

Cheers

Richard

