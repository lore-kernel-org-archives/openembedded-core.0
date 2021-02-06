Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web11.224.1612569685855972688
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Feb 2021 16:01:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=VDrY5LaH;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.176, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f176.google.com with SMTP id 19so8786495qkh.3
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Feb 2021 16:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h1P2MaksK6Mi5wm4YJPDY9JvCHXP/rQbSXxpqcdOocU=;
        b=VDrY5LaHkwJIsbj9w1AzHikgMtqeASSv4ADLkapdhnwR8AR55JLnFTi3aZnlVUN1Og
         lnJtDujwS7kO8tDKt3HSoyfhMuXWy9P0JVMKRt7vWsXj8lNjOvm6TU8026tE+fI6jd3p
         x0w8Anufg2kiE0nV+lUQHMWcO7fre+ACy0bdF2gFp8xwEiylTxCGMd8Eznu6zEUaVIto
         03iBSgfHYBXXKKSoIHsgZ9Rul2LNX7ZGWdyQ+lQL+It8NiN+y8UV4byJTUCT+CPJWtIf
         bvEmQzN4D/VWPIvnVV8VBihmPUDRrvfAXuphuQmXSFBFBjecvtAecE/x/KUvmrzgBKo6
         T0jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h1P2MaksK6Mi5wm4YJPDY9JvCHXP/rQbSXxpqcdOocU=;
        b=HYepphdwR4Og9lll7Ab58RtbATCY+qC/kOp2laX/qDAemg9Fz7MLzeUZHWnV7FrHcW
         1EUICfdy2KPQjjOMbs7+2mFx6ByMZgj19W+/i66x2qVN/pvLVPIvZN5/KMZ8j9Jz5qbR
         x4sWrkymhLRN/7K20cR70ErZmxJz+RzlfGrVFWuDm5VsRAS2a2tU9JLo8PhCVfnBNUN5
         dDXguZXmMsdll9dqoqDHPeo2bUJveXXvEVOvXUC1k8q+Abjl49WLY62MSDPLsIyxeWJ4
         4a5Adntg6HQQx4Ffb0e+j8vyV+Ds4yS/TXy5XjWWkgVmzMze4IdAsviob3TtxwMsyrmQ
         rEkQ==
X-Gm-Message-State: AOAM532cbqCJsoZt/RjcPoGRl4ZNr4X3p5DKpMU7b6jGqM6ZXDOfmig3
	jmlloJCHTFGWq/mdS9oJPTpvC1kEiuNv+SeaETDGAA==
X-Google-Smtp-Source: ABdhPJyFFTTS0JGsvZW9NNcG3T23CcrSvSQeTYZ65+dSUVIM7zTpTwh0Q8gv3e6QBYTm+56nnt5/KvQrz40MK0qR3d4=
X-Received: by 2002:a37:7cc5:: with SMTP id x188mr6829382qkc.130.1612569685060;
 Fri, 05 Feb 2021 16:01:25 -0800 (PST)
MIME-Version: 1.0
References: <20210205034258.340392-1-douglas.royds@taitradio.com>
In-Reply-To: <20210205034258.340392-1-douglas.royds@taitradio.com>
From: "Jon Mason" <jdmason@kudzu.us>
Date: Fri, 5 Feb 2021 19:01:14 -0500
Message-ID: <CAPoiz9woPh6dbcXjeLhGxSAmB8QX4jE_txbh-R3Hq8YDQvwoQQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] externalsrc: Detect code changes in submodules
To: douglas.royds@taitradio.com
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 4, 2021 at 10:43 PM Douglas via lists.openembedded.org
<douglas.royds=taitradio.com@lists.openembedded.org> wrote:
>
> Further to 50ff9afb39, only detect code changes in submodules that are
> subdirectories of the EXTERNALSRC directory.
>
> Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
> ---

I believe this patch is causing errors in the autobuilder.  See
https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/1801/steps/14/logs/stdio

>  meta/classes/externalsrc.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
> index 64e94e3301..27496bb2db 100644
> --- a/meta/classes/externalsrc.bbclass
> +++ b/meta/classes/externalsrc.bbclass
> @@ -216,7 +216,7 @@ def srctree_hash_files(d, srcdir=None):
>              env['GIT_INDEX_FILE'] = tmp_index.name
>              subprocess.check_output(['git', 'add', '-A', '.'], cwd=s_dir, env=env)
>              git_sha1 = subprocess.check_output(['git', 'write-tree'], cwd=s_dir, env=env).decode("utf-8")
> -            submodule_helper = subprocess.check_output(['git', 'submodule--helper', 'list'], cwd=s_dir, env=env).decode("utf-8")
> +            submodule_helper = subprocess.check_output(['git', 'submodule--helper', 'list', s_dir], cwd=s_dir, env=env).decode("utf-8")
>              for line in submodule_helper.splitlines():
>                  module_dir = os.path.join(s_dir, line.rsplit(maxsplit=1)[1])
>                  proc = subprocess.Popen(['git', 'add', '-A', '.'], cwd=module_dir, env=env, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
> --
> 2.25.1
>
>
> 
>
