Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web08.12406.1613757447955159194
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Feb 2021 09:57:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MwaNPaVa;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id v15so9710728wrx.4
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Feb 2021 09:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=XxToyzmlc1Y95YEOL3tVXq099pX20ytzUVGbfNclibo=;
        b=MwaNPaVatljAfjfrtI19TRvuzNL7bRdcZuXmcNkTMDL4LsBZNCCDlmq3r4I57MQwgE
         uAefeF0j2ieLD21jlk3tCSiItuQvLsuE9bkfgafQx5ITQGvJgmVZNqTOMfy4xeQvb6GY
         9t5CX9m73mhsgJBkrVV2gT/kxrnFWlxbH3CfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=XxToyzmlc1Y95YEOL3tVXq099pX20ytzUVGbfNclibo=;
        b=oAffywUAEU70CKNjA9taH/SyDlYjZcLN/bTacpUTFmGKZpkbLpOS1XzziFSirhIn0n
         /og0qtjLqnS05HnIlsc++eVgCoQpSMUxlcelNf8pbDNNqYMUqfilILM86o0TCQuu31xo
         vhb848zRGHSOYrnXGNYAz1Umui6eQIOl3+iBHrRCkxD3DwyW9Y7Nugx4lklcNVT7q2fF
         CS7tBvZMzZK7EInshIuqnxtAVCzhN82djjlFOP1a+nT+Js96tJuFk83UCaD88IgYjY73
         bEr2S2WIMSUxHNe8VJKNZ0U5GL8JRai7xPP/7Vay3IgpxlHLNNwUgD+ydQkCtsA9x4FO
         75+A==
X-Gm-Message-State: AOAM53332pbSuaBzBp5XiHryYtEaZaIAKRe8fYZF/V+TzAG8IXj6C2KC
	qC9QBqMIxF2vyr8tFgTJtjOm8w==
X-Google-Smtp-Source: ABdhPJwtRlYB8g7rYfgK63Ok5FxlSAddPqiOvFULIsbzjE8nOydq3bXY3HPL7jiVi/321glsq0Ql4g==
X-Received: by 2002:a5d:62d1:: with SMTP id o17mr10526845wrv.111.1613757446575;
        Fri, 19 Feb 2021 09:57:26 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:569e:86b4:55e2:a2e9? ([2001:8b0:aba:5f3c:569e:86b4:55e2:a2e9])
        by smtp.gmail.com with ESMTPSA id o13sm17537409wrs.45.2021.02.19.09.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Feb 2021 09:57:26 -0800 (PST)
Message-ID: <d03dd49676e706f3806dfa902ede127541c5a757.camel@linuxfoundation.org>
Subject: Re: [PATCH v3 2/2] iputils: Fix setcap/setuid of executables
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jate Sujjavanich <jatedev@gmail.com>, 
	openembedded-core@lists.openembedded.org, alex.kanavin@gmail.com, 
	quaresma.jose@gmail.com
Date: Fri, 19 Feb 2021 17:57:25 +0000
In-Reply-To: <20210219175307.46218-2-jatedev@gmail.com>
References: <20210219175307.46218-1-jatedev@gmail.com>
	 <20210219175307.46218-2-jatedev@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-02-19 at 17:53 +0000, Jate Sujjavanich wrote:
> Limit setcap search to PATH for cross builds preventing host
> contamination. Add DEPENDS for libcap-native to supply this for
> PACKAGECONFIG libcap.
> 
> The previous setting of NO_SETCAP_OR_SUID broke setuid or setcap of
> /bin/ping and other executables.
> 
> Signed-off-by: Jate Sujjavanich <jatedev@gmail.com>
> ---
>  ...tcap-search-to-PATH-for-cross-builds.patch | 33 +++++++++++++++++++
>  .../iputils/iputils_s20200821.bb              |  3 +-
>  2 files changed, 35 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-extended/iputils/iputils/0001-Limit-setcap-search-to-PATH-for-cross-builds.patch
> 
> diff --git a/meta/recipes-extended/iputils/iputils/0001-Limit-setcap-search-to-PATH-for-cross-builds.patch b/meta/recipes-extended/iputils/iputils/0001-Limit-setcap-search-to-PATH-for-cross-builds.patch
> new file mode 100644
> index 0000000000..b09cdb5f13
> --- /dev/null
> +++ b/meta/recipes-extended/iputils/iputils/0001-Limit-setcap-search-to-PATH-for-cross-builds.patch
> @@ -0,0 +1,33 @@
> +From aedb7811d1e9b0eae5d33b5bed39f6219a06a8dc Mon Sep 17 00:00:00 2001
> +From: Jate Sujjavanich <jatedev@gmail.com>
> +Date: Thu, 18 Feb 2021 21:35:03 -0500
> +Subject: [PATCH] Limit setcap search to PATH for cross builds
> +
> +Upstream-Status: Pending
> +---
> + meson.build | 9 ++++++++-
> + 1 file changed, 8 insertions(+), 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index aff75a2..16bbfb6 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -215,7 +215,14 @@ config_h = configure_file(
> + 	output : 'config.h',
> + 	configuration : conf)
> + 
> +-setcap = find_program('setcap', '/usr/sbin/setcap', '/sbin/setcap', required : false)
> ++if meson.is_cross_build()
> ++	message('limit setcap search to PATH')
> ++	path_setcap = ['setcap']
> ++else
> ++	message('search for setcap in PATH and admin dirs')
> ++	path_setcap = ['setcap', '/usr/sbin/setcap', '/sbin/setcap']
> ++endif
> ++setcap = find_program(path_setcap, required : false)
> + if cap_dep.found() and setcap.found()
> + 	perm_type = 'caps'
> + 	setcap_path = setcap.path()
> +-- 
> 


This does look like ultimately the better solution, could you send it to 
iputils and see what they make of it? I'm keen to try and reduce the number
of patches we carry and this one looks like a good candiate for them covering
the key edge cases as far as I can tell!

Cheers,

Richard

