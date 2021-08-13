Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.30963.1628816296943039403
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Aug 2021 17:58:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=A40ceUBN;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id e19so9693767pla.10
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Aug 2021 17:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=x7kP6vMBnwYi9jy64FrlIu2FPXSSTrLJe+hVDMPt5NI=;
        b=A40ceUBNZ0Ks9TzV/KK7BaFD7L2c45tCuQsY/X+BS9V5ep7jsH2pLFMWCHMhYwUhb7
         KLtenD7SnefFeA5SlgTlbdySWReAuxF7w6Ys3Ry7l3XowFOHk3CG7ewuVJJ3ajdut3FA
         x6tJcFvqWbhYMUXlxK9pPoPJ2eXdd1Ja3Kobb4fHu+INUuTZ5QvXyePjxylGBHmSD8z+
         28YymVN+wb48nt+0Ql0R6f6PS3kKnNmymvEZlFIvqoZt9Elu8hUHIFT8ZHuBm5q1FqYA
         +o2GGPLdn7XeuZYRbJkqUeduVRcVBD8Vg2okoF0IbSqKL7t+OXzJzl5CSfoFIfi7oWkU
         WbUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=x7kP6vMBnwYi9jy64FrlIu2FPXSSTrLJe+hVDMPt5NI=;
        b=lgD9j4SKeCYOh3FdyMjNiJz2/7pBnepYTfIh0mLOcp70EUv9B+sdXCwA1xnbw/xBDP
         iTpqAXtMO9ovy+v93c5FcFgRbc6VcOQn5EoA/yvu+rD8SD2JtVDMHfAIcgZmUeUVN8yO
         tFYCmfaOLNOJpWX9wU73443rr3q/nvlNMIMNZYpSrtjMSlNvuccI+mspzdeD8f2OkMq1
         +wTcrs26U68k9mY88dTjY8yjTV4HfyKBzKmaxZyYUmkIqwy7SBTGwQ9O7ekUrow7mIvL
         /Zfjwwg06eTwrQOo6VBCDmpTlJNgniQAURSHQ7dkjtrlnWceWeQsjPbs+WH9xZx189rH
         9iVw==
X-Gm-Message-State: AOAM533P+PyUyRXuHsA10nrgHbOdWJLrTOyr9QfCTj7bykdKWQwOfBfs
	InoyvSSPTslR78rCali6DY8s9msdaBOqvA==
X-Google-Smtp-Source: ABdhPJwXvEg3nXEbEU5q+fvbSZ9VdQutFGBcvJOrYnzFohcB/dmVGlpyHnIKU6lIiX7pqVEx5E8Fiw==
X-Received: by 2002:a65:5186:: with SMTP id h6mr6277644pgq.62.1628816295970;
        Thu, 12 Aug 2021 17:58:15 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:c078:a19b:8919:aba? ([2601:646:9200:a0f0:c078:a19b:8919:aba])
        by smtp.gmail.com with ESMTPSA id mr18sm9572pjb.39.2021.08.12.17.58.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Aug 2021 17:58:15 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] pypi: Allow override of PyPI archive name
To: Paul Barker <paul@pbarker.dev>, openembedded-core@lists.openembedded.org
References: <20210810110350.7078-1-paul@pbarker.dev>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <fe659534-214a-0c7e-f407-2da6c3dfb59b@gmail.com>
Date: Thu, 12 Aug 2021 17:58:14 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210810110350.7078-1-paul@pbarker.dev>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 8/10/21 4:03 AM, Paul Barker wrote:
> Some packages on PyPI don't follow the usual expectations for archive
> naming. For example, the archive for asyncio-mqtt 0.10.0 is named
> asyncio_mqtt-0.10.0.tar.gz (with an underscore instead of the dash used
> in the package name).
> 
> To handle these edge cases a new PYPI_ARCHIVE_NAME variable is
> introduced. By default this is set to the expected archive name based on
> the PyPI package name, version and extension but it can be set to a
> different value if needed in a recipe which inherits the pypi class.
> 

how many such packages are there roughly ? does it deserve to be 
addressed via introducing another variable I wonder.

> Signed-off-by: Paul Barker <paul@pbarker.dev>
> ---
>   meta/classes/pypi.bbclass | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/classes/pypi.bbclass b/meta/classes/pypi.bbclass
> index 272c220bca..9405d58601 100644
> --- a/meta/classes/pypi.bbclass
> +++ b/meta/classes/pypi.bbclass
> @@ -8,12 +8,12 @@ def pypi_package(d):
>   
>   PYPI_PACKAGE ?= "${@pypi_package(d)}"
>   PYPI_PACKAGE_EXT ?= "tar.gz"
> +PYPI_ARCHIVE_NAME ?= "${PYPI_PACKAGE}-${PV}.${PYPI_PACKAGE_EXT}"
>   
>   def pypi_src_uri(d):
>       package = d.getVar('PYPI_PACKAGE')
> -    package_ext = d.getVar('PYPI_PACKAGE_EXT')
> -    pv = d.getVar('PV')
> -    return 'https://files.pythonhosted.org/packages/source/%s/%s/%s-%s.%s' % (package[0], package, package, pv, package_ext)
> +    archive_name = d.getVar('PYPI_ARCHIVE_NAME')
> +    return 'https://files.pythonhosted.org/packages/source/%s/%s/%s' % (package[0], package, archive_name)
>   
>   PYPI_SRC_URI ?= "${@pypi_src_uri(d)}"
>   
> 
> 
> 
> 
> 
