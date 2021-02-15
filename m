Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web09.31717.1613399966963211651
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Feb 2021 06:39:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EMUIXhKU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id o24so9527070wmh.5
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Feb 2021 06:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=Lt6p+XJjj7SN//EQPuznucA1lbnema0YY3VLKSd8rX0=;
        b=EMUIXhKUEJjaXTKrIS+7yEAsWJwq6bFdibHt9jIKuS6yzaf176Ut+JYOOUiWHvUZT3
         TCa1TRTY1r6x1Jk2uSN+CdFiE5U313va7pWD5l9hzAYdBjUzIJRkCeQsPUPqCrvOGtLT
         OTg2kgzXbg584vbgjRRDZwGheUdl6dsZghciA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Lt6p+XJjj7SN//EQPuznucA1lbnema0YY3VLKSd8rX0=;
        b=gsKJIr6nRcS+tNZclJRWQ91P0+b8sI1e9ET76xLHW3Ol5hdvZWlHLF4y0ieyCfHPVP
         rv9hDDzew3VFQ+HCHvRHLSnO4+uLSweP97ytUdKMbzNQjuhDk0Z5Ky5OwOl9qEUky/Dg
         9gXzNSw33Qiy2/2BBAU1gWQK2L5CO6kWac+uurllhYW78k5ZuTZymZoKRdFyNTV/xXg1
         QPfEm5xymYjDu5vKTHUlKlDzyNxk2IzZ4nzzVD/ieiFyHuHD7L98Fze3jN3yG/iesjWe
         3XI87xdkKT2EmPxvikj8SD1HO2WiD1CeZt+5cnHjiMYYIeTB9Ne5Azll8nRx1NBUasjh
         aGjw==
X-Gm-Message-State: AOAM5325/rRO8FwC4XTFezUua38XlwYiDVOdWgiXt3TlC7CZPtTwDTY8
	yH0oqnrWlYMB+mnFzhYEEiheWw==
X-Google-Smtp-Source: ABdhPJx8FFd6AKa0O0RoZAUXLKS2a66wIVYEoKlyMMU46+6hxMpvHV0onMUYhWZtXBvCBX63G6+cRw==
X-Received: by 2002:a7b:c007:: with SMTP id c7mr3351162wmb.59.1613399965545;
        Mon, 15 Feb 2021 06:39:25 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:3015:c6e2:686f:34ff? ([2001:8b0:aba:5f3c:3015:c6e2:686f:34ff])
        by smtp.gmail.com with ESMTPSA id i15sm22104395wmq.26.2021.02.15.06.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 06:39:25 -0800 (PST)
Message-ID: <99fbfdb4bed1129a6250634688387a54665be35a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [V2][PATCH] buildhistory.bbclass: add cloning
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: akuster <akuster808@gmail.com>, openembedded-core@lists.openembedded.org
Date: Mon, 15 Feb 2021 14:39:22 +0000
In-Reply-To: <20210214191847.2043214-1-akuster808@gmail.com>
References: <20210214191847.2043214-1-akuster808@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2021-02-14 at 19:18 +0000, akuster wrote:
> Provide a method to clone and push to a git repo
> Provide a method to pre-populate buildhistory
> Maybe remove the need for external scripts to do the same
> 
> Three new variables:
> BUILDHISTORY_BRANCH - branch used for checkout and pushing
> BUILDHISTORY_CLONE - git repo uri
> 
> example:
> BUILDHISTORY_BRANCH="${DISTRO}/gatesgarth/${MACHINE}"
> BUILDHISTORY_CLONE = "git@gitlab.com:akuster/oe-buildhistory"
> BUILDHISTORY_PUSH_REPO = "origin ${BUILDHISTORY_BRANCH}"
> 
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> 
> ----
> [V2]
> Use BUILDHISTORY_CLONE instead of BUILDHISTORY_REPO_URI
> 
> Simplified initial clone to one step
> ---
>  meta/classes/buildhistory.bbclass | 47 +++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
> 
> diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
> index 117a44eaf38..d0e918c3d8e 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -44,6 +44,12 @@ BUILDHISTORY_COMMIT_AUTHOR ?= "buildhistory <buildhistory@${DISTRO}>"
>  BUILDHISTORY_PUSH_REPO ?= ""
>  BUILDHISTORY_TAG ?= "build"
>  
> 
> 
> 
> +# Branch for checkout
> +BUILDHISTORY_BRANCH ?= ""
> +
> +# Clone previous buildhistory from repo
> +BUILDHISTORY_CLONE ?= ""
> +
>  SSTATEPOSTINSTFUNCS_append = " buildhistory_emit_pkghistory"
>  # We want to avoid influencing the signatures of sstate tasks - first the function itself:
>  sstate_install[vardepsexclude] += "buildhistory_emit_pkghistory"
> @@ -858,6 +864,42 @@ END
>  		fi) || true
>  }
>  
> 
> 
> 
> +python buildhistory_clone() {
> +    import subprocess
> +
> +    histdir = d.getVar('BUILDHISTORY_DIR')
> +    repo_uri = d.getVar("BUILDHISTORY_CLONE")
> +    bh_branch = d.getVar("BUILDHISTORY_BRANCH")
> +
> +    if not bh_branch:
> +        bb.note("BUILDHISTORY_BRANCH not set")
> +        return
> +
> +    if not os.path.isdir(histdir):
> +        cmd = ['git', 'clone', repo_uri, '-b', bh_branch, histdir]
> +        ret = subprocess.call(cmd)
> +        if ret != 0:
> +            bb.error('Failed to clond %s!' % repo_uri)
> +
> +    if not os.path.isdir(histdir):
> +       rerturn
> +
> +    if os.path.isdir(os.path.join(histdir, '.git')):
> +        cmd =['git', '-C', histdir, 'config', '--get', 'remote.origin.url']
> +        hasurl = subprocess.call(cmd, shell=True)
> +        if hasurl:
> +            cmd = ['git', '-C', histdir, 'remote', 'add', '-f', '-t', bh_branch, '-m', bh_branch, 'origin', repo_uri]
> +            subprocess.call(cmd)
> +
> +            cmd = ['git', '-C', histdir, 'checkout', bh_branch]
> +            ret = subprocess.call(cmd)
> +            if ret != 0:
> +                bb.error('Failed to checkout branch %s' % bh_branch)
> +
> +            cmd = ['git', '-C', histdir, 'branch', '--set-upstream-to=origin/%s' % bh_branch]
> +            subprocess.call(cmd)
> +}
> +
>  python buildhistory_eventhandler() {
>      if (e.data.getVar('BUILDHISTORY_FEATURES') or "").strip():
>          reset = e.data.getVar("BUILDHISTORY_RESET")
> @@ -874,6 +916,11 @@ python buildhistory_eventhandler() {
>                  for entry in entries:
>                      os.rename(os.path.join(rootdir, entry),
>                                os.path.join(olddir, entry))
> +
> +            if e.data.getVar("BUILDHISTORY_CLONE") != "":
> +                localdata = bb.data.createCopy(e.data)

This wasn't tested without it set? Should be just:

if e.data.getVar("BUILDHISTORY_CLONE"):

Cheers,

Richard




