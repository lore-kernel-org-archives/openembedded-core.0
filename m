Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web12.3139.1617050332321130342
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Mar 2021 13:38:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EL7IUR1m;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id o16so14182712wrn.0
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Mar 2021 13:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=BY4sQdUPi2UoOX/0ZqY/r4kqEZSUOxkR3eiwOY4gFkg=;
        b=EL7IUR1mPt4iaplkT4/8KmyxjaTvzDgcpLUVOItW7c7Ft8aOCPHDbUVPeNC+bzeAb3
         +qWQFIqPfogvl+Oxb34xRB/SdpXWxpa7LpOjhmudcR+x4U0g8tT+Ntm2G3kQlANgYRyO
         YxttkR+s0ELD/f5bJRaRTY8wPzX+Ttaw+/zmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=BY4sQdUPi2UoOX/0ZqY/r4kqEZSUOxkR3eiwOY4gFkg=;
        b=R5PAWzSzNWlEro3pOejZcsa/MMhP9hgKTFryuKJNhdF5RxveESU4/41/YgtAO9fHaU
         rkyI5n3n/5Io8SKLdDdzyiQYFe365Q7d6BhVMv9EYovyzMrNOTSM145hD9tDW/CvPobE
         eFn28iVvbUkmJ3u55DgEuxwLY4lpJyc2cB0XfHg64frDbWN/oAhnncrExCtDrOzWRGJk
         YQ47wqgxupUApsLFChTekTx6xm/+YBwDwUDHFQzfhUI0iyLGZATVVsiM7ulCy18A7evM
         WVcDyx+udBSylY8nsT5vacy5gfmOQdWIOLB/wVURelUoFwLtz7KdxSr8d1exmvSflNI2
         U3Yg==
X-Gm-Message-State: AOAM533VIFax8jwGef75aUz2DWlnHvx01DhQu8PUFxtilO/ci2RIf2Rv
	dFy6CYpvKEzDmOU+Ijj6E17/Bw==
X-Google-Smtp-Source: ABdhPJxk/vHFyiNIfXp087E/Egt61nbY4aYGSCxlXb8GvVMKF27LyxNBSJ/DRCQzqbip5uViC2WhJQ==
X-Received: by 2002:adf:e843:: with SMTP id d3mr30819002wrn.56.1617050330790;
        Mon, 29 Mar 2021 13:38:50 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:5ca7:7e7c:e7e4:6d07? ([2001:8b0:aba:5f3c:5ca7:7e7c:e7e4:6d07])
        by smtp.gmail.com with ESMTPSA id j14sm30438812wrw.69.2021.03.29.13.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 13:38:50 -0700 (PDT)
Message-ID: <9e81b71466b771c55d8859e7d156b662e1c3d4f7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] Use shutil.move when os.rename fails
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Devendra Tewari <devendra.tewari@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 29 Mar 2021 21:38:47 +0100
In-Reply-To: <20210329151442.86306-1-devendra.tewari@gmail.com>
References: <20210329151442.86306-1-devendra.tewari@gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-03-29 at 12:14 -0300, Devendra Tewari wrote:
> ---
>  meta/classes/sstate.bbclass | 26 ++++++++++++++++++++++----
>  1 file changed, 22 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index f579168162..f94aa96d70 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -384,6 +384,7 @@ def sstate_installpkg(ss, d):
>  def sstate_installpkgdir(ss, d):
>      import oe.path
>      import subprocess
> +    import shutil
>  
> 
>      sstateinst = d.getVar("SSTATE_INSTDIR")
>      d.setVar('SSTATE_FIXMEDIR', ss['fixmedir'])
> @@ -401,7 +402,11 @@ def sstate_installpkgdir(ss, d):
>  
> 
>      for state in ss['dirs']:
>          prepdir(state[1])
> -        os.rename(sstateinst + state[0], state[1])
> +        try:
> +            os.rename(sstateinst + state[0], state[1])
> +            break

That break should definitely not be there, that changes behaviour.

> +        except OSError:
> +            shutil.move(sstateinst + state[0], state[1])
>      sstate_install(ss, d)
>  
> 
>      for plain in ss['plaindirs']:
> @@ -413,7 +418,11 @@ def sstate_installpkgdir(ss, d):
>          dest = plain
>          bb.utils.mkdirhier(src)
>          prepdir(dest)
> -        os.rename(src, dest)
> +        try:
> +            os.rename(src, dest)
> +            break

Same here...

> +        except OSError:
> +            shutil.move(src, dest)
>  
> 
>      return True
>  
> 
> @@ -638,6 +647,7 @@ python sstate_hardcode_path () {
>  
> 
>  def sstate_package(ss, d):
>      import oe.path
> +    import shutil
>  
> 
>      tmpdir = d.getVar('TMPDIR')
>  
> 
> @@ -664,7 +674,11 @@ def sstate_package(ss, d):
>                      continue
>                  bb.error("sstate found an absolute path symlink %s pointing at %s. Please replace this with a relative link." % (srcpath, link))
>          bb.debug(2, "Preparing tree %s for packaging at %s" % (state[1], sstatebuild + state[0]))
> -        os.rename(state[1], sstatebuild + state[0])
> +        try:
> +            os.rename(state[1], sstatebuild + state[0])
> +            break

and again...

> +        except OSError:
> +            shutil.move(state[1], sstatebuild + state[0])
>  
> 
>      workdir = d.getVar('WORKDIR')
>      sharedworkdir = os.path.join(d.getVar('TMPDIR'), "work-shared")
> @@ -674,7 +688,11 @@ def sstate_package(ss, d):
>              pdir = plain.replace(sharedworkdir, sstatebuild)
>          bb.utils.mkdirhier(plain)
>          bb.utils.mkdirhier(pdir)
> -        os.rename(plain, pdir)
> +        try:
> +            os.rename(plain, pdir)
> +            break


and again...

> +        except OSError:
> +            shutil.move(plain, pdir)
>  
> 
>      d.setVar('SSTATE_BUILDDIR', sstatebuild)
>      d.setVar('SSTATE_INSTDIR', sstatebuild)
> 
> 

