Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.9898.1613667037413154279
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Feb 2021 08:50:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=jGkzUZVh;
 spf=pass (domain: burtonini.com, ip: 209.85.208.177, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f177.google.com with SMTP id c8so6109984ljd.12
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Feb 2021 08:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BBN5moUVl4kZzUoPxbz7M50fQ5H1JXUfOH6Y9dgMe68=;
        b=jGkzUZVhHJyFViPL5NZjBymNSWjnn3vsBJDpqirbGZ9o0eLQHbR+kmoYg/adwoPNyt
         rYIjT8O92NgkIewzVZWN1qQzqVXvHd70cDtgWMK4inc6ay0uocUmTlLMvp9EUCp2Q3b6
         7bh7U+d+Ga0ybN91ixVLaLldbTij00qgHYSKWWKPudjFy3jAThZs1zL6UbyUnVzlLUU0
         5FKN8QwavT3iNr9PjrkRC9ldZaguYhFOpScp+9tt89TFHUYXE3pdg54dnsSuPQSen5Se
         +CKLLiZAEbKb7nNlzXS9mvju8P6RLBdNioL3dgrs0P+2RmQ00UfALCA9jsHqYFpN3nif
         lQDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BBN5moUVl4kZzUoPxbz7M50fQ5H1JXUfOH6Y9dgMe68=;
        b=S5RSgbgSV6MuZO6TmDws8RCq96hEaPMkrWzarwpcPrTbuARRTzJ7xkZR9P14rbMrya
         de648xY8V5hVdlpZYQgVr28u9vWnsN5hM+/iT2clCf+rXxdguf6T+yZht3OD7DuVaBUH
         CM7StIuwq3nUdoTlH95SFmCYdV6htMq8sPVe2pXG1M1Jlzh/7dQRUwMa0K9ZuPmtx5CD
         Z7CWAkv9ZhdYLdXHZ/K4Cu1DI46rPn9ukmucW+2Zvr8GWSQivo9H9TBRFbDWc61mHVdy
         5TmlTaqej9gKsz6EdiOVEsayrDMyqug1B8BoMte9KBuVaSN5oFxT0knffWY9YU999UpT
         S3lQ==
X-Gm-Message-State: AOAM532hTQBQST1IotHA7jvWahAL82yGI6E0E4I58y8M3/mM9lTf6lZx
	svqD4LBKBXV9ttzRvf37ZJ9U58oEqt9YaFFdaUUAJw==
X-Google-Smtp-Source: ABdhPJwxm8H8od1yzyMqFwP3AsYM8bd1a5vt3rqZI7I4VCCdok7+BsfCFAk7bymmZ8WccWX0nfOxRQR9r315cyQymxI=
X-Received: by 2002:a05:651c:138a:: with SMTP id k10mr3025738ljb.24.1613667035436;
 Thu, 18 Feb 2021 08:50:35 -0800 (PST)
MIME-Version: 1.0
References: <20210215224133.2550191-1-akuster808@gmail.com>
In-Reply-To: <20210215224133.2550191-1-akuster808@gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Thu, 18 Feb 2021 16:50:24 +0000
Message-ID: <CAAnfSTsYM9QwW6qyLAfC+OnKES0K0nfvH9eoTCZu1zH9-HuObA@mail.gmail.com>
Subject: Re: [OE-core] [[PATCH] cve-check.bbclass: don't skip scanning if file not found
To: akuster <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Why is the file not found though?

Ross

On Mon, 15 Feb 2021 at 22:41, akuster <akuster808@gmail.com> wrote:
>
> This helps avoid these errors:
> ERROR: lockdev-1_1.0.3-r0 do_cve_check: File Not found: /home/build/builds/master/tmp/work/core2-64-poky-linux/lockdev/1_1.0.3-r0/lockdev_1.0.3-1.6.diff
>
> We should continuing to scan other applied patches for CVE info.
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta/classes/cve-check.bbclass | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
> index 1bed815d8e4..e56366579d1 100644
> --- a/meta/classes/cve-check.bbclass
> +++ b/meta/classes/cve-check.bbclass
> @@ -186,8 +186,8 @@ def get_patches_cves(d):
>          patch_file = bb.fetch.decodeurl(url)[2]
>
>          if not os.path.isfile(patch_file):
> -            bb.error("File Not found: %s" % patch_file)
> -            raise FileNotFoundError
> +            bb.warn("File Not found: %s" % patch_file)
> +            continue
>
>          # Check patch file name for CVE ID
>          fname_match = cve_file_name_match.search(patch_file)
> --
> 2.25.1
>
>
> 
>
