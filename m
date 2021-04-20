Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web12.12966.1618934357878700328
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Apr 2021 08:59:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lFkreU+s;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id 20so15962089pll.7
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Apr 2021 08:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UJ0EGC1dsNnqHauP1jNb7ECHY/pck84/3oL5X4TKy4c=;
        b=lFkreU+sNl6VWWUSBrl/ox9JjCAU7gCGres8NQByw7IGDTKazsD9UVfS7Uztd2mcpg
         nC5iaRAGMzfZpP/PUuiOjTpSBf9Ds+GForliUUwdSUNmYiVjNE1dD4e6GTFQoxtLPAop
         Q/Hc1isQfD6EngqmlJt13bSSS676INY3C5GqB9AIkuBhHR4wHOw/1t46VCQKNR4h76Nk
         aRW7ryOAVqkDQbbXFViqRMGyVU4FqZd9iAVAPrizKsXd9I7xsQPIWOaj5EZ/KoZMNLbF
         /MoMTt2IGSBGEK0Gjm6b8hGWf/rklMQmD+CcRbVIpgWgMliaqmU2PU3vnyGmlplRqK5Q
         g2DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=UJ0EGC1dsNnqHauP1jNb7ECHY/pck84/3oL5X4TKy4c=;
        b=DOnvGi70oV5LiGcYz7hF3RerpkYUELXlcdVkAzcTHpMUkxvCh3VpRlF56HBXqxNh/o
         HWhYosNP0xvmZzNa2AdYCV8nF5guMu+qExmTDx5ybeIQniBPKEnhmoD3+YYBm1qZOfYo
         w4dWCwZZZjLmHQ55T9zb+7ISOWyZTw71tGvB9AF8PDgDAx4zYSMpNsqaw5n8n9zSNBsF
         BRxjGD3fLKSGZg8IU0oIAu/q88hKhYqyus0xwx+9rNNnzDsFS4rJHut+2Hao2k4tH9cK
         CYdhbP168Pw5H+A+gkthjy0YUT6bvWKpCf5CATdLG9eMjvblPUyPjN3Nel6IcnLbT21x
         7TcQ==
X-Gm-Message-State: AOAM532CdmnCSsuEkugt4nGdC4fIGTm5rRUL92UZR4qyAy2kFW1sYJkC
	9hiCi7FXO3ORzlpYVZXdJ3DXqpmaAxvnng==
X-Google-Smtp-Source: ABdhPJyFeU9E65a3c28RNgvX1foLYbxgvwAa/ZjUwvhY1y1CdfHcPSOKCBaoIEUOTBwJ6WITuEIyEA==
X-Received: by 2002:a17:90a:e50a:: with SMTP id t10mr5926285pjy.32.1618934357108;
        Tue, 20 Apr 2021 08:59:17 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:692a:2f5c:cdd4:70fe? ([2601:646:9200:a0f0:692a:2f5c:cdd4:70fe])
        by smtp.gmail.com with ESMTPSA id h22sm15627215pfn.55.2021.04.20.08.59.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Apr 2021 08:59:16 -0700 (PDT)
Subject: Re: [OE-core] [PATCH 1/2] elfutils: correct debuginfod builds on x32
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20210420120549.608450-1-alex.kanavin@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <b79886e0-9872-b957-21b4-587b1858f9b7@gmail.com>
Date: Tue, 20 Apr 2021 08:59:15 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210420120549.608450-1-alex.kanavin@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 4/20/21 5:05 AM, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>   .../elfutils/elfutils_0.183.bb                |  3 +
>   ...infod-client.c-correct-string-format.patch | 60 +++++++++++++++++++
>   2 files changed, 63 insertions(+)
>   create mode 100644 meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-client.c-correct-string-format.patch
> 
> diff --git a/meta/recipes-devtools/elfutils/elfutils_0.183.bb b/meta/recipes-devtools/elfutils/elfutils_0.183.bb
> index 8b1dece200..a4ea8da32e 100644
> --- a/meta/recipes-devtools/elfutils/elfutils_0.183.bb
> +++ b/meta/recipes-devtools/elfutils/elfutils_0.183.bb
> @@ -29,6 +29,9 @@ SRC_URI_append_libc-musl = " \
>              file://0004-Fix-error-on-musl.patch \
>              file://0015-config-eu.am-do-not-use-Werror.patch \
>              "
> +SRC_URI_append_x86-x32 = " \
> +           file://0001-debuginfod-debuginfod-client.c-correct-string-format.patch \
> +           "
>   SRC_URI[sha256sum] = "c3637c208d309d58714a51e61e63f1958808fead882e9b607506a29e5474f2c5"
>   
>   inherit autotools gettext ptest pkgconfig
> diff --git a/meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-client.c-correct-string-format.patch b/meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-client.c-correct-string-format.patch
> new file mode 100644
> index 0000000000..a2737b9fe6
> --- /dev/null
> +++ b/meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-client.c-correct-string-format.patch
> @@ -0,0 +1,60 @@
> +From f4231bfbb61cd4962638766a7072f4295ed39150 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Mon, 19 Apr 2021 23:29:10 +0200
> +Subject: [PATCH] debuginfod/debuginfod-client.c: correct string format on x32
> +
> +Upstream-Status: Inappropriate [x32-specific; few, if any people care about it anymore]

This is worth upstreaming, since 32 bit architectures with 64bit time_t 
will need.

> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + debuginfod/debuginfod-client.c | 10 +++++-----
> + 1 file changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/debuginfod/debuginfod-client.c b/debuginfod/debuginfod-client.c
> +index de26af5..a840f23 100644
> +--- a/debuginfod/debuginfod-client.c
> ++++ b/debuginfod/debuginfod-client.c
> +@@ -229,7 +229,7 @@ debuginfod_init_cache (char *cache_path, char *interval_path, char *maxage_path)
> +   if (fd < 0)
> +     return -errno;
> +
> +-  if (dprintf(fd, "%ld", cache_clean_default_interval_s) < 0)
> ++  if (dprintf(fd, "%lld", cache_clean_default_interval_s) < 0)
> +     return -errno;
> +
> +   /* init max age config file.  */
> +@@ -237,7 +237,7 @@ debuginfod_init_cache (char *cache_path, char *interval_path, char *maxage_path)
> +       && (fd = open(maxage_path, O_CREAT | O_RDWR, DEFFILEMODE)) < 0)
> +     return -errno;
> +
> +-  if (dprintf(fd, "%ld", cache_default_max_unused_age_s) < 0)
> ++  if (dprintf(fd, "%lld", cache_default_max_unused_age_s) < 0)
> +     return -errno;
> +
> +   return 0;
> +@@ -263,7 +263,7 @@ debuginfod_clean_cache(debuginfod_client *c,
> +       if (interval_file == NULL)
> +         return -errno;
> +
> +-      int rc = fprintf(interval_file, "%ld", cache_clean_default_interval_s);
> ++      int rc = fprintf(interval_file, "%lld", cache_clean_default_interval_s);
> +       fclose(interval_file);
> +
> +       if (rc < 0)
> +@@ -275,7 +275,7 @@ debuginfod_clean_cache(debuginfod_client *c,
> +   interval_file = fopen(interval_path, "r");
> +   if (interval_file)
> +     {
> +-      if (fscanf(interval_file, "%ld", &clean_interval) != 1)
> ++      if (fscanf(interval_file, "%lld", &clean_interval) != 1)
> +         clean_interval = cache_clean_default_interval_s;
> +       fclose(interval_file);
> +     }
> +@@ -291,7 +291,7 @@ debuginfod_clean_cache(debuginfod_client *c,
> +   max_unused_file = fopen(max_unused_path, "r");
> +   if (max_unused_file)
> +     {
> +-      if (fscanf(max_unused_file, "%ld", &max_unused_age) != 1)
> ++      if (fscanf(max_unused_file, "%lld", &max_unused_age) != 1)
> +         max_unused_age = cache_default_max_unused_age_s;
> +       fclose(max_unused_file);
> +     }
> 
> 
> 
> 
> 
