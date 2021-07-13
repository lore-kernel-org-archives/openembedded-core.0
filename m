Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.2134.1626169313525369627
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jul 2021 02:41:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theyoctojester-info.20150623.gappssmtp.com header.s=20150623 header.b=fV5TCiHF;
 spf=none, err=permanent DNS error (domain: theyoctojester.info, ip: 209.85.221.41, mailfrom: jester@theyoctojester.info)
Received: by mail-wr1-f41.google.com with SMTP id t5so15773022wrw.12
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Jul 2021 02:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=theyoctojester-info.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding;
        bh=CUqV+ZeAeTM6PHCNRRfnvsYqKy1LigYhDIbPa4pv29Y=;
        b=fV5TCiHFjhcHN8o5vdSqdTG/l354vg/b/6sr/4+TquZaOpadHd37B3pMMO7khMU272
         picpTlDV/1FzY3qI2HbghLp7D3hxlYsmFfWYfW0OolkFxgByzlWj7Mwcqlqxg2wMC/r9
         PBOnkbTTEZ42TnCiNFb70eayRk7y4EjjdWsG0AuxCZ+86qbRASOPt0okJtudconJMB1X
         9uNLEQkdvcFuvK0kwS5YsbssXiwNWfMwHVbRJehw/9MQVlSa6cGLBz0EUDYevRv58d3V
         02PYGzEAX20I9H/xDkJ6AHhOdHj7pkfEASxpRvQd65gciuSPZ9IM76dnTbtHGyn7CqIm
         nokQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=CUqV+ZeAeTM6PHCNRRfnvsYqKy1LigYhDIbPa4pv29Y=;
        b=uCSYN/vgmi8k49Av2VbaCy5N7TrorAWjj/SBCR6Ymvrk/8On+c/tLij4kk6ZwVJvRU
         +MCxondQsy411CWtUwUVERl+jAJUEr36ZpHoi+bPvu08Ot/o92SZ6GTnIx9XIoWjgf5N
         EhIM1OvY7MqMKyTfBYHYcQVUhm/WkzaCXwkkG/jPIEUCUYYqrHAsRszI3mhiWoQtnIgY
         32iZmoOLs6eN7XBIvYMhKNgqA/Wv5jIg+4mhYq7mykMLD1RW9phnb0Zdzvlx0u+YCgoH
         JnehUPhDULlTU+EerZSU+z5d8PCQfu9QehLdAlMsUumvcOhts/Cr/OYK3NTMaWERMFGs
         PM4g==
X-Gm-Message-State: AOAM532NCRl6DSqD/1aT09FFdczZQ7YwWY9DtBsrQOPTRt7dDbyPSXBb
	ZXGc7qJnHVDRHN54YplhPRBr+CdKxt3OIRLc
X-Google-Smtp-Source: ABdhPJzhQC6vRieDu2YZvoxn42g5bolv5mDDU7A0NdvE61Yp8YxG2vXXTciN6F4zNE80QORLSVa/og==
X-Received: by 2002:a5d:420b:: with SMTP id n11mr4501805wrq.395.1626169311927;
        Tue, 13 Jul 2021 02:41:51 -0700 (PDT)
Return-Path: <jester@theyoctojester.info>
Received: from [172.16.3.179] (p50933415.dip0.t-ipconnect.de. [80.147.52.21])
        by smtp.gmail.com with ESMTPSA id u12sm17249765wrt.50.2021.07.13.02.41.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jul 2021 02:41:51 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] report-error: Mask AWS credentials to avoid leaking them
To: openembedded-core@lists.openembedded.org
References: <20210713092242.754717-1-dwrobel@ertelnet.rybnik.pl>
From: "Josef Holzmayr" <jester@theyoctojester.info>
Message-ID: <06461e08-cb92-c4f6-ef11-7bfae672cc14@theyoctojester.info>
Date: Tue, 13 Jul 2021 11:41:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713092242.754717-1-dwrobel@ertelnet.rybnik.pl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Howdy!

Am 13.07.2021 um 11:22 schrieb Damian Wrobel:
> From: Adam Romanek <romanek.adam@gmail.com>
> 
> Removes potentially presonal information from error reports.
> 
> Signed-off-by: Adam Romanek <romanek.adam@gmail.com>
> Signed-off-by: Damian Wrobel <dwrobel@ertelnet.rybnik.pl>
> ---
>   meta/classes/report-error.bbclass | 15 ++++++++++-----
>   1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/classes/report-error.bbclass b/meta/classes/report-error.bbclass
> index de48e4ff0f..c17e7e2851 100644
> --- a/meta/classes/report-error.bbclass
> +++ b/meta/classes/report-error.bbclass
> @@ -38,6 +38,15 @@ def get_conf_data(e, filename):
>                       jsonstring=jsonstring + line
>       return jsonstring
>   
> +def errorreport_maskvars(e, logdata):
> +    origenv = e.data.getVar("BB_ORIGENV", False)
> +    vars_to_mask = ("TOPDIR", "TMPDIR", "AWS_ACCESS_KEY_ID", "AWS_SECRET_ACCESS_KEY")
> +    for var_name in vars_to_mask:
> +        var_value = e.data.getVar(var_name, True) or (origenv and origenv.getVar(var_name, True))
> +        if var_value:
> +            logdata = logdata.replace(var_value, var_name)
> +    return logdata
> +
>   python errorreport_handler () {
>           import json
>           import codecs
> @@ -82,11 +91,7 @@ python errorreport_handler () {
>                   try:
>                       with codecs.open(log, encoding='utf-8') as logFile:
>                           logdata = logFile.read()
> -                    # Replace host-specific paths so the logs are cleaner
> -                    for d in ("TOPDIR", "TMPDIR"):
> -                        s = e.data.getVar(d)
> -                        if s:
> -                            logdata = logdata.replace(s, d)
> +                    logdata = errorreport_maskvars(e, logdata)
>                   except:
>                       logdata = "Unable to read log file"
>               else:
> 
> 

This sounds a bit like suggesting that we add a hardcoded magic list of 
masks for possbible places for credentials, and I don't think this is a 
good approach. If at all, then there should be a more generic way that 
doesn't treat S3 as super special.

Greetz

> 
> 
> 
