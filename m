Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.11418.1613851390733406549
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Feb 2021 12:03:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aMqeb+H+;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id e9so6272178pjj.0
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Feb 2021 12:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MQHB2O6qU0koCMR6v5YyejCdIg6/895niIaTYEPzsE0=;
        b=aMqeb+H+rfht11uLiQUgF8RozoxPmnkZLBitPSZ1Zf/6JKisOXyvwEPZHT4rWqArZB
         30BSRdTMAnjEm4lZA0NQwarux5h2FnCyIeJdg/OMBGCpho2JuzPqC7i0qMvGj91wTgfE
         kVaG0HKVInnKHMF6L4mJzOXnMXLRz7bC5Jf0ps+9kTVLHrwPy8Hr3YDzBC6lHnf9pU/a
         Fta2vKYyPmtxFH0rbOrPSRqQlud5ItiJfX2xrGUHq7xaycISfjTTgWukQPIFQzwjn0SQ
         VmUh28lOjUvr6PH+c7LBR/TocIK5M3MAaVUs1CktbVTSZtCCBxptvIVFDe4hdOkS9+N2
         iSNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=MQHB2O6qU0koCMR6v5YyejCdIg6/895niIaTYEPzsE0=;
        b=Ub0V1Dx6ZCjFIQhLwc2FL5V4/BiI44ROhT8mJenlT8N0dVAUkshIikLIq7lsCzrbEy
         XDpu03YnvmARHmCdcASG8uGCjLTkz+rNaJ3ewF5/p1Nu0456iPIyIYv0i5AQJiBycjtr
         13A/SakImuQDH5m1HybSAPi4P1uTL1Fx2MY1agusaXOA07tLwc/U4D/jscNKE4kOnUYp
         x/7nd9nRvvaIhTbuhJ2Vowvcpwys0dI3Tf7/Un7zKI4vDdxmG0IdpQ3DGJPVSX9091sx
         7ugFBtVIcYegunBTKD9hD7oSrGU88QMPcH41cppMUkk86dr5hfXgZ8JW51/UsoE3aV1h
         X6Rw==
X-Gm-Message-State: AOAM5312D2I/6eP2ghrOYOZouCyX5PFlQf0qc3IYqKKSbkxwGC6/w5Bh
	utNYIkt1615U7dAytkoyOpbqPtQ0qXg8+A==
X-Google-Smtp-Source: ABdhPJxZuS7ONBdmiFCSFDD7x19BLFjKSwd7QHVieYJl6Trp/G2ky+PHKmMXEJgIlIebgpLzhNvnxQ==
X-Received: by 2002:a17:90a:3e09:: with SMTP id j9mr9900351pjc.120.1613851389898;
        Sat, 20 Feb 2021 12:03:09 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::7bdf? ([2601:646:9200:a0f0::7bdf])
        by smtp.gmail.com with ESMTPSA id z28sm1512417pfr.38.2021.02.20.12.03.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Feb 2021 12:03:09 -0800 (PST)
Subject: Re: [OE-core] [PATCH 1/4] runqemu: Disable vga with nographic
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <20210220190924.3153040-1-raj.khem@gmail.com>
 <CANNYZj-MB3mzzzu91dzaHvP+MdQhN0RK09QaQtJDh7JWMTx4kQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <5c76ef42-79f9-b929-b1a4-e8e5360e301c@gmail.com>
Date: Sat, 20 Feb 2021 12:03:08 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CANNYZj-MB3mzzzu91dzaHvP+MdQhN0RK09QaQtJDh7JWMTx4kQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 2/20/21 11:20 AM, Alexander Kanavin wrote:
> I don't think this is right. You might want to use -nographic, but still 
> keep an emulated graphical device inside the guest for testing the 
> userspace applications without seeing their output. It's better to set 
> -vga none via a dedicated runqemu option.

using -display none is better way to control this kind of behaviour 
where you still want graphic card to be emulated but not display the 
output. perhaps such an option would be better suited and nographic 
runqemu option can be used for qemu being a simple cmdline app.

> 
> Alex
> 
> On Sat, 20 Feb 2021 at 20:09, Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>> wrote:
> 
>     When using nographic, explicitly disable vga since some qemu firmware (
>     OpenFirmware ) defaults to std vga, and when vga is enabled then it
>     disables output to serial and redirects that to vga which is by design,
>     hwoever we expect the console output to go to serial when using
>     nographic, therefore its important to disable vga with nographic
>     especially on qemu based ppc platforms
> 
>     Signed-off-by: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
>     ---
>       scripts/runqemu | 2 +-
>       1 file changed, 1 insertion(+), 1 deletion(-)
> 
>     diff --git a/scripts/runqemu b/scripts/runqemu
>     index dd92a64553..2e31338d8e 100755
>     --- a/scripts/runqemu
>     +++ b/scripts/runqemu
>     @@ -462,7 +462,7 @@ class BaseConfig(object):
>                           raise RunQemuError('Option nographic makes no
>     sense alongside the sdl option.' % (arg))
>                       if ('gtk' in sys.argv):
>                           raise RunQemuError('Option nographic makes no
>     sense alongside the gtk option.' % (arg))
>     -                self.qemu_opt_script += ' -nographic'
>     +                self.qemu_opt_script += ' -nographic -vga none'
>                       self.kernel_cmdline_script += ' console=ttyS0'
>                   elif arg == 'sdl':
>                       if 'gl' in sys.argv[1:]:
>     -- 
>     2.30.1
> 
> 
>     
> 
