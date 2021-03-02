Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.270.1614710814393429740
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 02 Mar 2021 10:46:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YYdOQTDv;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id d2so2616476pjs.4
        for <Openembedded-core@lists.openembedded.org>; Tue, 02 Mar 2021 10:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ELqoaLlytIJDWKtRY+AsRhPswJ/VTBlwXrr0TedsFfA=;
        b=YYdOQTDvjSRMOT2vOKH0KY9REaa4HGZ5IkOm79jB5nK9m81wjQQF1ztMcx0nht30/7
         zg9xVdasVs2Wl7zWjjwpL+fGs86gqij4KTTnCv/zD7C/TQuUJSncC33SJ9pjWKpB6gH9
         4Ou1o41D6ldcuFA4X15Jc+OTTvB/tzZvH/1xP3Ccemr91z0azaGY3rhlXwY7ONSU1/Cu
         OG5/FIG+OjaiaJtcfrZhRUPSan+0GbmYe3ZseCuFrpyqcW+eRih4wgLSA0YMmGFI2r0/
         LsSUp29V+aaakTMER0goNjCTll1eESFyPMe648UE0MrAC6eriL01dImjN1dKib9fXteY
         bFOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ELqoaLlytIJDWKtRY+AsRhPswJ/VTBlwXrr0TedsFfA=;
        b=jgm//1gfRFX6z9k+UvQBlt0q/ZKeBysxo+e90lJa8/hN2Z+MAkmIUkS3K4kvnJEg31
         L7sJ6s4NGrtv34HAyVxB2nL4YC2MDXz94bw3P1FtJiDlvhCjoIGyPEICjRxGpWYlxpvf
         y8uw/B35Ewd22TOKlA5X/sbFHi6Xt7vNeYgXwjiSEQJ3MzuTE/bCSHLAgBjJoud1MHLx
         rUNXBdrOP5wkt5SshQfLRpzvYNJEXduDR69bcwtizNbn2IYpQ0mgLDRutLtXePXF7fbb
         eu5OSVjbLHurB1AtrWO9ylYCuTAqggzQ4+U8pH9bBUm0DNgatzijmAbT00Mr2UCh/8Ma
         q7HQ==
X-Gm-Message-State: AOAM532CA66P9XPnHnSDUg1GZid56TX3owO5+YQEYoJnLLlXPNtH/u9o
	IxwNGHbiSqdyl/Y9BG7GzAE=
X-Google-Smtp-Source: ABdhPJxSUrhCZohV25QsW1DJoJa8Odqa6WIvkWQ5agNvunVbII7008RZtBaD0rdJz6nKp5p7Zywn+w==
X-Received: by 2002:a17:902:6b88:b029:df:ff72:7bc6 with SMTP id p8-20020a1709026b88b02900dfff727bc6mr4654013plk.23.1614710813599;
        Tue, 02 Mar 2021 10:46:53 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:8991:b66:15e2:cd87? ([2601:646:9200:a0f0:8991:b66:15e2:cd87])
        by smtp.gmail.com with ESMTPSA id r123sm21979796pfc.211.2021.03.02.10.46.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Mar 2021 10:46:53 -0800 (PST)
Subject: Re: [OE-core] [PATCH 2/3] systemd-container: recommend tar
To: Vivien Didelot <vivien.didelot@gmail.com>,
 Openembedded-core@lists.openembedded.org
Cc: Chen Qi <Qi.Chen@windriver.com>
References: <20210301165325.3987311-1-vdidelot@pbsc.com>
 <20210301165325.3987311-2-vdidelot@pbsc.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <a4329c47-9493-e7b6-039c-84db68f3dc50@gmail.com>
Date: Tue, 2 Mar 2021 10:46:51 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210301165325.3987311-2-vdidelot@pbsc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

we should be enabling CONFIG_LONG_OPTS=y in busybox when using systemd

On 3/1/21 8:53 AM, Vivien Didelot wrote:
> If systemd is configured with importd, "machinectl import-*" can be
> used to add container trees under /var/lib/machines.
> 
> But "machinectl import-tar" makes use of "tar --numeric-owner" which
> is not supported by the busybox binary, as shown below:
> 
>      # machinectl import-tar /tmp/container.tar.xz
>      Enqueued transfer job 1. Press C-c to continue download in background.
>      Importing '/tmp/container.tar.xz', saving as 'container'.
>      Imported 0%.
>      tar: unrecognized option '--numeric-owner'
>      BusyBox v1.31.1 () multi-call binary.
>      Usage: tar c|x|t [-ZzJjahmvokO] [-f TARFILE] [-C DIR] [-T FILE] [-X FILE] [FILE]...
>      Failed to decode and write: Broken pipe
>      Exiting.
> 
> To fix this, recommend the standard tar package.
> 
> Cc: Chen Qi <Qi.Chen@windriver.com>
> Signed-off-by: Vivien Didelot <vdidelot@pbsc.com>
> ---
>   meta/recipes-core/systemd/systemd_247.3.bb | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-core/systemd/systemd_247.3.bb b/meta/recipes-core/systemd/systemd_247.3.bb
> index 1aac754cfc..3454085e5f 100644
> --- a/meta/recipes-core/systemd/systemd_247.3.bb
> +++ b/meta/recipes-core/systemd/systemd_247.3.bb
> @@ -484,10 +484,12 @@ FILES_${PN}-container = "${sysconfdir}/dbus-1/system.d/org.freedesktop.import1.c
>                            ${datadir}/polkit-1/actions/org.freedesktop.machine1.policy \
>                           "
>   
> +# "machinectl import-tar" uses "tar --numeric-owner", not supported by busybox.
>   RRECOMMENDS_${PN}-container += "\
>                            ${PN}-journal-gatewayd \
>                            ${PN}-journal-remote \
>                            ${PN}-journal-upload \
> +                         tar \
>                           "
>   
>   FILES_${PN}-extra-utils = "\
> 
> 
> 
> 
> 
