Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web10.15874.1598974632685826510
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2020 08:37:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=A2AWzt3g;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id w2so1607216wmi.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2020 08:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=TkHL94NP+n+NYKYFrv4FaJ6VGMfVkuoa4XiyBECMUPI=;
        b=A2AWzt3gozNTFeYgyKmOrkWW9OfhI580j2qHpn9IB/DbJXeRf4g8QNK0Yj+1oj59Y4
         XW2Y9qy5woQNs68dHRrBis4quH4pB3DBQZtD1OUEefvJORMqe6VDTJiFF7O1IjqanLNP
         tGjqQiUZbdNip9cc6Nj6H4IedpyVEWxl3+I1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=TkHL94NP+n+NYKYFrv4FaJ6VGMfVkuoa4XiyBECMUPI=;
        b=oUeDq1neatI5VJhBhVDwXwZ+7re1DYa076gWFg3EA27EPVc1vmHWM2xZ4V4gT5sJ0e
         yniIo5hzQ0AWozhNNsraH/ungkw0R6qVcT6X6pVq9aV8mDhGkGIerOtK2bXoTSB4c1Vj
         FB+B85j+ZUyakLFUyijyAcUlAv8j1L5MGlJGS3SW6ZulVQamdp4fLKBNMRuwFjssVOOx
         CRdRkc/LH+itkZlM6mMApwZQ+Gt11X/2JDSJgyi600eOhSMh05drBr8jYr0G3yMjqljp
         JDejUF6kqHZPN1bpyOytS5znOQ35lNLmJhAaFVmoCdSgt5lKEICbw46H1zdwQ7arxzRi
         nONw==
X-Gm-Message-State: AOAM533MNap67X99bbEU/OGvJQHYRvWDmC8g3yFoIYoIhHXEP9aYu+KV
	ncqdkuNDB8oEmfLTyMqJVr1dWg==
X-Google-Smtp-Source: ABdhPJztSIb/Ele+3bLlCmOsUGP+cawY7ubBGz+NYRerJapm0wh4tPF2xvge+KMsK9UM7WjzMvEgbQ==
X-Received: by 2002:a1c:e0d4:: with SMTP id x203mr1150205wmg.91.1598974630972;
        Tue, 01 Sep 2020 08:37:10 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from f.d.2.7.a.9.f.9.6.8.f.0.2.a.5.d.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (f.d.2.7.a.9.f.9.6.8.f.0.2.a.5.d.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:d5a2:f86:9f9a:72df])
        by smtp.gmail.com with ESMTPSA id g143sm2240169wme.0.2020.09.01.08.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 08:37:10 -0700 (PDT)
Message-ID: <ced418defbe2bcd66990ac23d1d3cbc22e20607f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] update-alternatives: Do not add dependency on virtual/update-alternatives for INHIBIT_DEFAULT_DEPS
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Tue, 01 Sep 2020 16:37:09 +0100
In-Reply-To: <20200901045630.1753967-1-raj.khem@gmail.com>
References: <20200901045630.1753967-1-raj.khem@gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-08-31 at 21:56 -0700, Khem Raj wrote:
> This allows special recipes e.g. glibc to use update-alternatives,
> glibc-utils e.g. provides packages like iconv, getconf which are also
> provided by other packages e.g. toybox, which uses update-alternatives
> but since glibc-utils does not use it, images which contain glibc-utils
> and toybox fail to build, glibc-utils is commonly pulled into ptest
> related images. This patch therefore will allow glibc-utils or
> musl-utils use u-a
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/classes/update-alternatives.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
> index 8c2b66e7f1..ae393770f8 100644
> --- a/meta/classes/update-alternatives.bbclass
> +++ b/meta/classes/update-alternatives.bbclass
> @@ -86,7 +86,7 @@ def gen_updatealternativesvardeps(d):
>                  d.appendVar('%s_VARDEPS_%s' % (v,p), ' %s:%s' % (flag, d.getVarFlag('%s_%s' % (v,p), flag, False)))
>  
>  def ua_extend_depends(d):
> -    if not 'virtual/update-alternatives' in d.getVar('PROVIDES'):
> +    if not 'virtual/update-alternatives' in d.getVar('PROVIDES') and not d.getVar('INHIBIT_DEFAULT_DEPS'):
>          d.appendVar('DEPENDS', ' virtual/${MLPREFIX}update-alternatives')
>  

https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/2408

(failure in step6b looks related to this)

Cheers,

Richard

