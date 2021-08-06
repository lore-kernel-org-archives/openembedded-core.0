Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.3339.1628247492534053942
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Aug 2021 03:58:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Arl03whj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id o7-20020a05600c5107b0290257f956e02dso8623764wms.1
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Aug 2021 03:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=Xy+oYCfZS6kTdFAMQHhvzuO4bNqWCsVgMq1zTJUEA9g=;
        b=Arl03whjJTpqkpoFh3PYwoBycq9V9trqxlS4YSjEhup3FF/VMm4JxxOw9gdMxhjOMb
         DqeBRgBCV6r8BQkV+IfPK438hFhXeiaGNji8m29Fy0J4w/EFVwDLexpXzmpFn5Je4jse
         8sFZFiUFmjWXUq9qg8J52JE8Ufwzvz6od/T7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Xy+oYCfZS6kTdFAMQHhvzuO4bNqWCsVgMq1zTJUEA9g=;
        b=PQoq0c+/m8Vsg4iHhdJ04rzJtlIc/cVqL/oemv+cdFCItxxZN3XPKc2m+vZ46Dqkv8
         eRkxa6BQZ8K4ZIbzC3rfd4WW1n3qPHN39v3ugQ6ISRymttSHofMMzJDuX0Mi2z251Yxp
         nIFvoRYdzlfoalQC8g2Y3mxrZvyShdM4o9CQwmuj5Ku5a/+LVJ8l7YOxAErljmWmlzz0
         7EQ93PtdAzRHCNArcRjOqcTeArCKeHUcICH7DOZGuRN3ZO6dpP5Yi1ve2OR2IJ/Ngh5O
         tHK2Zei1DD9EcBc1koigD8lgbfufnNxxG0Yc1IJnXrhLbs1580PaYvCEku1l5YKuVBug
         MQ6A==
X-Gm-Message-State: AOAM531tZGtgizoHyH2+9k5CHpLUrvW32EZKLVxdIjUjU1ENWVcmIGjg
	4WnDpbHkK7qyni+rfcYyqDFspvWA2xaY6w==
X-Google-Smtp-Source: ABdhPJytwc2XOY7S2YvhNAby7N7Q1bw9M1jl8zbrrGvPWj4UXzmPj43yhQO7P/mqUdI/RGLVLZFH0g==
X-Received: by 2002:a7b:c7d1:: with SMTP id z17mr19654804wmk.50.1628247490941;
        Fri, 06 Aug 2021 03:58:10 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:9b1a:3a88:2016:c4d0? ([2001:8b0:aba:5f3c:9b1a:3a88:2016:c4d0])
        by smtp.gmail.com with ESMTPSA id h9sm9219792wrw.38.2021.08.06.03.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Aug 2021 03:58:10 -0700 (PDT)
Message-ID: <f4d786556497e05c18b6fc147c3a63f2d40f2197.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH 2/2] convert-overrides.py: skip patches
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Date: Fri, 06 Aug 2021 11:58:07 +0100
In-Reply-To: <20210806090332.14065-2-Qi.Chen@windriver.com>
References: <20210806090332.14065-1-Qi.Chen@windriver.com>
	 <20210806090332.14065-2-Qi.Chen@windriver.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-08-06 at 02:03 -0700, Chen Qi wrote:
> If a line specifies a patch, skip it.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  scripts/contrib/convert-overrides.py | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/contrib/convert-overrides.py b/scripts/contrib/convert-overrides.py
> index 4d41a4c475..387e29d66d 100755
> --- a/scripts/contrib/convert-overrides.py
> +++ b/scripts/contrib/convert-overrides.py
> @@ -63,6 +63,7 @@ skips = skips + ["run_loaddata_poky", "determine_if_poky_env", "do_populate_poky
>  skips = skips + ["get_appends_for_files", "test_doubleref_remove", "test_bitbakelayers_add_remove", "elf32_x86_64", "colour_remove", "revmap_remove"]
>  skips = skips + ["test_rpm_remove", "test_bitbakelayers_add_remove", "recipe_append_file", "log_data_removed", "recipe_append", "systemd_machine_unit_append"]
>  skips = skips + ["recipetool_append", "changetype_remove", "try_appendfile_wc", "test_qemux86_directdisk", "test_layer_appends", "tgz_removed"]
> +skips = skips + ["file://"]

This is never simple since this would now skip:

SRC_URI_append = " file://xxxx"

I'm not sure which issue is better/worse...

Cheers,

Richard


