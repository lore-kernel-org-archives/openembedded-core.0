Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web09.16844.1629905743562991122
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Aug 2021 08:35:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rtFhxT9c;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id m4so3527687pll.0
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Aug 2021 08:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=IG9wOV386qeXKVv7bp6WXDIJaRN9coSxcGX34XoRekE=;
        b=rtFhxT9cSLFC/heltZd2yJftVnY4as/JmljmzOjdfDCSxgvMmJpWi64FCGicqLDNXh
         xt1YGaq+Tf+5KSrA5HoQlej6pCUNh20dDCyZ39qo1ntVTyAGfXoxMHwEe0rGcdQuiQEv
         QNcSOeL02fJCX63gLXoWHCwNks2U84VkD3dkOoc7qkgstde3U8TZoTtBRjxEb31nyE74
         KkrhPJ9BiZcGaHiLxl4GxduNtq/cH03SKJ2stECLu1VF0FQ3zLzrM1UiZE9Y0YsrcVAD
         IYKM6ZEvaN2SVMzYTIH6zljs8Dp8hQ7yHb8Z52zfN8Is2GFONx7uyAvgfE2ghQRCiJpo
         BEfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=IG9wOV386qeXKVv7bp6WXDIJaRN9coSxcGX34XoRekE=;
        b=rdfhdwsXs7uXoo01QMOaWLtqbnrN0ss5dRxjNr/NDeF+FLLjWZxN9NDq8cOCPMSP7F
         i9DYJ///hZJuhHADM5+lkdyzjWJz2hxPVHqTAe6lVEblsdC0CPGeVnAvOic8tuQ89RAv
         nzNZcQOmG1i576nkpdpF+QH+qvcqbgh87Vdav/+emDDuJ4pS+p1dIHXCCnPheIrWCQeh
         1179g8ur+uwKHzxOFwxm9NRb6pvvOJEGbifroJwIhrqdsBCzHxKq1AZP6z1mMGAgmZyo
         cJALu7h4BIPCXiYyodZEqt+1vGlKiQniN+e9HMM4nDcD5U5dRhmCGsQ0hGeuU8fdT3zS
         KqUg==
X-Gm-Message-State: AOAM533Q+BxTQ1xyx2IOebDV1yQG5obE4LYrz0vzUKr63O4bL4VfDuIq
	ijEZHTsddyl71srU79ylf+E=
X-Google-Smtp-Source: ABdhPJyuFob8EeEKaWR6ISnxbZZmJ4JcmrYPDPQXmJJZ6cJwym93yuM8LwGJxIr2H7Jw7o/ynhx9LA==
X-Received: by 2002:a17:90a:3cc6:: with SMTP id k6mr11096997pjd.134.1629905743063;
        Wed, 25 Aug 2021 08:35:43 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPV6:2601:646:9200:a0f0:7cf5:888d:b618:582d? ([2601:646:9200:a0f0:7cf5:888d:b618:582d])
        by smtp.gmail.com with UTF8SMTPSA id 20sm184214pfi.170.2021.08.25.08.35.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Aug 2021 08:35:42 -0700 (PDT)
Message-ID: <d9124478-3ab8-26c8-75d5-e79cb3f17c9a@gmail.com>
Date: Wed, 25 Aug 2021 08:35:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.0.2
Subject: Re: [OE-core] [PATCH] libcgroup: remove static pam library
To: kai <kai.kang@windriver.com>, openembedded-core@lists.openembedded.org
References: <20210825081054.40523-1-kai.kang@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20210825081054.40523-1-kai.kang@windriver.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/25/21 1:10 AM, kai wrote:
> From: Kai Kang <kai.kang@windriver.com>
> 
> libpam disables static build by default, so remove static pam library of
> libcgroup. Otherwise it complains QA issue:
> 
> | ERROR: libcgroup-2.0-r0 do_package: QA Issue: libcgroup:
>           Files/directories were installed but not shipped in any package:
> |  /lib/security/pam_cgroup.a
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>   meta/recipes-core/libcgroup/libcgroup_2.0.bb | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-core/libcgroup/libcgroup_2.0.bb b/meta/recipes-core/libcgroup/libcgroup_2.0.bb
> index bc0a75d46c..f48b8ece9b 100644
> --- a/meta/recipes-core/libcgroup/libcgroup_2.0.bb
> +++ b/meta/recipes-core/libcgroup/libcgroup_2.0.bb
> @@ -31,4 +31,5 @@ FILES:${PN}-dev += "${base_libdir}/security/*.la"
>   do_install:append() {
>   	# Until we ship the test suite, this library isn't useful
>   	rm -f ${D}${libdir}/libcgroupfortesting.*
> +	rm -f ${D}${base_libdir}/security/pam_cgroup.a
>   }
> 

should this be simply packaged into FILES_${PN}-staticdev instead ?

> 
> 
> 
> 
