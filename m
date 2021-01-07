Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web08.683.1610062486240151050
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 15:34:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Nkf8c0Bz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id k10so6452463wmi.3
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Jan 2021 15:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=ubqmwdInsGVIpMxbCzE0Tdk8yL9DrTM9fWWozocoxlg=;
        b=Nkf8c0BziuEYi+68MnoLmiK5Cx7Xylx9Hpbxl8u70Ye2sLaazifSSgqCi7On+vEFA+
         4yLG+k0Q3cXLUTSr22dZYHyOSSLEnYDTbjAPtAd+kg0Xx96JWdoDV84I53u2fEynS6U3
         KelB4aQLuPCjP9P7MaeWMryFkvD8QYZ0h5I58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=ubqmwdInsGVIpMxbCzE0Tdk8yL9DrTM9fWWozocoxlg=;
        b=miI71s+JCRtSbvz7o5ia9ANhofhURiCw89DOLL6BvXMfQdnwvx0ntr0IotNKVjGZYj
         zQWdR3Ep4M4/m8nm8EFJG7fNacGk4PonO/2o0M5m0PIbFBRe8VjGbEKYJ0V+XVN/b9IN
         sJygrBYskzHXwfHJY3GjO0Oh3SGNEj/umj/pd3aFAqb+EYhJd4yOsS7GOu99289VhV3D
         Gs0h7AMq+Rx5vSbQLI18lPMjpjLAhkOft8uXBhMepuPNSQNnDVUdwDheUuKMUVl7WqJk
         YvAOf4rt1LHLmQ0vvWT7VagRwkYBz0v+UUtXPSmt4iGGzfR4EjzA3MzpE+Q0cgmV12GT
         S46Q==
X-Gm-Message-State: AOAM533ziu0nw0IGcRVoZKa9R20EFFIykyBxQi+emDWskG5ubJNBUVHT
	cYgcxAL+EgffuvvQOk/MhVKxhA==
X-Google-Smtp-Source: ABdhPJwhg+Qk61XlLv76uEAj5rcIDxFC25CkWP3vZPv0aCCtuGbVt+wQhpy88xSif4bvaOusynwUoQ==
X-Received: by 2002:a1c:6056:: with SMTP id u83mr665031wmb.90.1610062484688;
        Thu, 07 Jan 2021 15:34:44 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:8262:2156:a38b:824c? ([2001:8b0:aba:5f3c:8262:2156:a38b:824c])
        by smtp.gmail.com with ESMTPSA id l16sm10638413wrx.5.2021.01.07.15.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jan 2021 15:34:44 -0800 (PST)
Message-ID: <befa22ffc8723763c2bab1084410a2a71f407038.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/1] base.bbclass: Fix dangling NATIVELSBSTRING
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 07 Jan 2021 23:34:41 +0000
In-Reply-To: <753dd31d17c544d8939b6369a5c866ab140ea247.1609934325.git.liezhi.yang@windriver.com>
References: <cover.1609934325.git.liezhi.yang@windriver.com>
	 <753dd31d17c544d8939b6369a5c866ab140ea247.1609934325.git.liezhi.yang@windriver.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-01-06 at 04:04 -0800, Robert Yang wrote:
> Fixed:
> $ rm -fr tmp; bitbake quilt-native -n
> Build Configuration:
> [snip]
> NATIVELSBSTRING      = "ubuntu-18.04"
> [snip]
> 
> And when run bitbake again:
> $ bitbake quilt-native -n
> Build Configuration:
> NATIVELSBSTRING      = "universal"
> 
> It has been changed from ubuntu-18.04 to universal on the same host and build
> directory, this is because it is overridded by NATIVELSBSTRING. This patch
> makes it print the correct value.
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/classes/base.bbclass | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index 78ae28bb0f4..aeb41efd24d 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -208,6 +208,8 @@ BUILDCFG_FUNCS[type] = "list"
>  def buildcfg_vars(d):
>      statusvars = oe.data.typed_value('BUILDCFG_VARS', d)
>      for var in statusvars:
> +        if var == 'NATIVELSBSTRING':
> +            var = 'ORIGNATIVELSBSTRING'
>          value = d.getVar(var)
>          if value is not None:
>              yield '%-20s = "%s"' % (var, value)

I agree the display should be consistent and we perhaps need to look
again at how this code is working. I really don't like pretending one
value is another though so this isn't the correct fix.

Cheers,

Richard

