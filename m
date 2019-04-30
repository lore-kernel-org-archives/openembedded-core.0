Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id B85217DC65
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 10:19:55 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id n25so3204041wmk.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 03:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=DgAEFiaCb9ENBpNOQN/3DczCYYjhA6pr/hzJPrYCsSA=;
	b=Bw0ZEWC6NJNHUWNswL4KuZsd9ip3wKNpTDnzwsaupAZkhMbijgi1yUwrAKLWd0zgmL
	k8shqAveAuqGdVB3KmsX8zQLrgaYICMrehwUeGTL0WjhWpmxTs2MZTa05tfITNT+tZjg
	N5o63GKG+FCbZpUUrY+wha8ZOJeV/YH7hbWQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=DgAEFiaCb9ENBpNOQN/3DczCYYjhA6pr/hzJPrYCsSA=;
	b=S3FZnn0QRGUmW0DvAOJMB3YUr9Dqy+5krlH294RKIZe27zB9kfk0GKoBHcXnvSnm0W
	6ojJ5zbGbM3/AZRSvc9WUO3/nNdvLAqd2Sdl3PPfkRdKkadhd4XPHwkzQoFsNbMob/1G
	PX6imqbKS8WAJgDCMsTxSZhqqsEwEOIMJJKEc8j6XElapx//F1fk3w3M50U3qygx4GwC
	3VokQNdYU4pVDfIX7hc/2iChqI9bQjbcxh2+5d+bk7iMSr8XWFPgtMeI3Y5tsr4DWG7/
	aUpoSKvRX+h+rAdAz4kFjOqnyD8p4mFVEtYXQpPTVYbDk6RvOHkU4pEOKInfC8aDAyEv
	ku9A==
X-Gm-Message-State: APjAAAUwqLUI9yt+RKACLJdg3MVykDDXyJA4YgHyugRJ/oeD1GwZe/aA
	ohwfm6PFoiF+Zm0z75dw1ZbRkQ==
X-Google-Smtp-Source: APXvYqxwYy+GalcEecbkD3wnehWbYQ0Xvahvv4awQyHJZkfkBj9Hfr7L8sB2K80uRcLb+hnPA69dIA==
X-Received: by 2002:a1c:2743:: with SMTP id n64mr2491767wmn.19.1556619596356; 
	Tue, 30 Apr 2019 03:19:56 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l127sm2693952wml.40.2019.04.30.03.19.54
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 30 Apr 2019 03:19:55 -0700 (PDT)
Message-ID: <719f10333b6dc28ffe36c6f61f28528e7d888ee5.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: kai.kang@windriver.com
Date: Tue, 30 Apr 2019 11:19:53 +0100
In-Reply-To: <20190430071539.145427-2-kai.kang@windriver.com>
References: <20190430071539.145427-1-kai.kang@windriver.com>
	<20190430071539.145427-2-kai.kang@windriver.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] target-sdk-provides-dummy: set nostamp for do_package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Apr 2019 10:19:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-04-30 at 03:15 -0400, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
> 
> It exists a situation that there is a common config file includes
> multilib.conf but variable MULTILIBS is not set by default:
> 
>   require conf/multilib.conf
>   MULTILIBS ?= ""
> 
> When build target-sdk-provides-dummy in the same build project with
> following steps, it fails.
> 
> 1 $ echo 'MACHINE = "qemux86"' >>conf/local.conf
>   $ bitbake target-sdk-provides-dummy
> 2 $ cat <<EOF >>conf/local.conf
>     MACHINE = "qemux86-64"
>     MULTILIBS = "multilib:lib32"
>     DEFAULTTUNE_virtclass-multilib-lib32 = "i586"
>     EOF
>   $ bitbake target-sdk-provides-dummy
>   $ bitbake lib32-target-sdk-provides-dummy
> 
> It fails to build lib32-target-sdk-provides-dummy with error
> messages:
> 
> > ERROR: target-sdk-provides-dummy-1.0-r0 do_packagedata: The recipe
> > target-sdk-provides-dummy
> >  is trying to install files into a shared area when those files
> > already exist. Those files
> >  and their manifest location are:
> >   .../tmp/pkgdata/qemux86-64/lib32-target-sdk-provides-dummy
> >     (matched in manifest-qemux86_64-lib32-target-sdk-provides-
> > dummy.packagedata)
> >   .../tmp/pkgdata/qemux86-64/runtime/lib32-target-sdk-provides-
> > dummy
> >     (matched in manifest-qemux86_64-lib32-target-sdk-provides-
> > dummy.packagedata)
> >   ... snip ...
> > Please verify which recipe should provide the above files.
> 
> Because target-sdk-provides-dummy is a virtual package, its sstate
> caches are same for both qemux86 and qemux86_64. So when build
> target-sdk-provides-dummy for qemux86_64, it re-uses the sstate cache
> from qemux86 and then create file lib32-target-sdk-provides-dummy
> under
> ${PKGDATA_DIR} which should not and then conflicts with lib32-target-
> sdk-provides-dummy.
> 
> Make do_package always be executed to fix the issue. Because it is a
> dummy
> package, it won't cost too much build time.
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/recipes-core/meta/target-sdk-provides-dummy.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-core/meta/target-sdk-provides-dummy.bb
> b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
> index 85472a825c..e09a08bcd7 100644
> --- a/meta/recipes-core/meta/target-sdk-provides-dummy.bb
> +++ b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
> @@ -52,3 +52,5 @@ DUMMYPROVIDES = "\
>  "
>  
>  require dummy-sdk-package.inc
> +
> +do_package[nostamp] = "1"

This isn't the right way to fix it, we should probably whitelist that
particular file for multiple providers. See SSTATE_DUPWHITELIST.

Cheers,

Richard




