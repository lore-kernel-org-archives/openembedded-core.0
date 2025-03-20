Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02D53C35FFF
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 13:47:59 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.7844.1742478469360133738
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Mar 2025 06:47:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=f26gpccA;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3912baafc58so689373f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 06:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1742478467; x=1743083267; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3FC8eLNVuS56BDI+726n6W/vepyEvFIJqXEnwBlNOLw=;
        b=f26gpccA1k0F9QGJqq4KECO0hpPvCxTtcuNFNgeVOY+TMGha49Mjtutn+Dgl5LSYir
         8XDSXltTLhKUYZaxQPa2BPlKJ3n3pvz+/5K3HIYGAcDuB8eedDV1KNgwIZmD7giOSySX
         0NGBDw/Fe06Wcfa+8Xt5lvufDzXp6eJI9hKaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742478467; x=1743083267;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3FC8eLNVuS56BDI+726n6W/vepyEvFIJqXEnwBlNOLw=;
        b=xDNY5Y20uOjOZMDigoYCaj5fkvmFhcKKkNSYg+9E3PcFtIP1xDISv2+H9msv9edNAg
         bo2waudDlCrKIdMP4KwfOqVfy9VSYT4qRmrh3H8tcrUf03WKblSXYIKIvkDYOleAvxW9
         O5Jipld4OYjnGJR0ECOOU3z2tgUtEN59d/AsBFWYFwCX+nJQufzUE04bGKwJorDPoHyj
         xVSwjixjpHmGcZYqOjHs7/oPZRsfLj1me3TvN15SHn3Kr5SeyaWUk5iZlvY7nLeN6lmc
         HxqdLxqriZ2ix5hq4eRZ7wCMJZsv2s/svL9eor3SAPKdBEC4Xgw7Nipq6ovpgaqr1ryY
         j+mQ==
X-Gm-Message-State: AOJu0YwGi+Tal+XVNggJKK99cTKO63gl8hvTiqggqjxgeZkxne+m7oE/
	re0QwGv1Y67aIVXU+KzcehOJTU7KMtshpEgIOAblORNO51Q/3FWrcY/UHWgSIqAWUxgmkKZfbqp
	I
X-Gm-Gg: ASbGncuf1a3Qo6OJmZIWlyRGOnEQGqXJeXVG2Rae2lLDRFk3exQc/F3GiUlZKiHgw2q
	YNiPKhYbN70jVTdyLuY8vsGZTu0NsI4fjeGwZ0xrdptsdo5tvxktLDFTtY7BMb59ybbfbYtcJy+
	UcodCVMBBqUycZbDcHxY38A/4zjcw3jhZXLvrZJHn7ofOLOPcOOv6B63OPvVkAosmS4uUTVzXnL
	XXYM44obbZ/uDBPP0G31agmE5sqj/no6cPMyNMwALa2XcSZofdRfx3r1F70VNx5zlzF4jBGVQx0
	Pjn+9Slr/t4aH7I1FAS3RWKdl0/wDGEq6UhBzeWiaA4RPBm+is/XiQG02H5GEzzZOz80GqbggkI
	GXakx4NsZnWEYHyssyEPw6S8sI/XUU6C3
X-Google-Smtp-Source: AGHT+IFIwErmvUXT7QGK51hPHplglb28L3aTAH1B0tYtq+Jy6paVIPyfX0U2crsQinZufGMN3ETdgg==
X-Received: by 2002:a5d:47c9:0:b0:391:13ef:1af5 with SMTP id ffacd0b85a97d-399795e6d96mr3808339f8f.48.1742478467462;
        Thu, 20 Mar 2025 06:47:47 -0700 (PDT)
Received: from [10.1.9.44] (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f47c97sm49076145e9.14.2025.03.20.06.47.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 06:47:47 -0700 (PDT)
Message-ID: <7361568c-2c30-4430-a80d-6a5e87758df9@smile.fr>
Date: Thu, 20 Mar 2025 14:47:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] sanity: Refactor "C++ toolchain support this flag"
 check
To: openembedded-core@lists.openembedded.org
References: <20250320133946.2631311-1-yoann.congal@smile.fr>
Content-Language: en-US
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <20250320133946.2631311-1-yoann.congal@smile.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 13:47:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213397

That should have been a "v2". Resent.
Sorry for the noise.

Le 20/03/2025 à 14:39, Yoann Congal a écrit :
> From: Yoann Congal <yoann.congal@smile.fr>
> 
> This can be use to check for other flags.
> 
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>  meta/classes-global/sanity.bbclass | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
> index 1bae998f74..dc317e846d 100644
> --- a/meta/classes-global/sanity.bbclass
> +++ b/meta/classes-global/sanity.bbclass
> @@ -607,9 +607,9 @@ def drop_v14_cross_builds(d):
>                  bb.utils.remove(stamp + "*")
>                  bb.utils.remove(workdir, recurse = True)
>  
> -def check_cpp_toolchain(d):
> +def check_cpp_toolchain_flag(d, flag, error_message=None):
>      """
> -    it checks if the c++ compiling and linking to libstdc++ works properly in the native system
> +    Checks if the C++ toolchain support the given flag
>      """
>      import shlex
>      import subprocess
> @@ -622,12 +622,12 @@ def check_cpp_toolchain(d):
>      }
>      """
>  
> -    cmd = shlex.split(d.getVar("BUILD_CXX")) + ["-x", "c++","-", "-o", "/dev/null", "-lstdc++"]
> +    cmd = shlex.split(d.getVar("BUILD_CXX")) + ["-x", "c++","-", "-o", "/dev/null", flag]
>      try:
>          subprocess.run(cmd, input=cpp_code, capture_output=True, text=True, check=True)
>          return None
>      except subprocess.CalledProcessError as e:
> -        return f"An unexpected issue occurred during the C++ toolchain check: {str(e)}"
> +        return error_message or f"An unexpected issue occurred during the C++ toolchain check: {str(e)}"
>  
>  def sanity_handle_abichanges(status, d):
>      #
> @@ -802,7 +802,7 @@ def check_sanity_version_change(status, d):
>      status.addresult(check_case_sensitive(tmpdir, "TMPDIR"))
>  
>      # Check if linking with lstdc++ is failing
> -    status.addresult(check_cpp_toolchain(d))
> +    status.addresult(check_cpp_toolchain_flag(d, "-lstdc++"))
>  
>  def sanity_check_locale(d):
>      """

-- 
Yoann Congal
Smile ECS - Tech Expert


