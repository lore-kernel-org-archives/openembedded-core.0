Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web11.35631.1601906853861985035
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Oct 2020 07:07:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=qTLjke0y;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.65, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f65.google.com with SMTP id cq12so5731062edb.2
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2020 07:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e78I/Hgb/X0xR/7+pbv74LgrfXiB/k53YVM2CtLnKlg=;
        b=qTLjke0yT9pPOzyr9Bsny+6DFSVUQTfu6MhZxoyZqkwVYO8aZIibCSokVmcH4Iq/xV
         FM09Ccfy6txfPEe3vYaRsoF3WJDvOeiNhaSReRkGOL3EO14v1ktrTP51ZmxEefh74cDI
         ZNfyseJaIfLjm1soyim8B/ouKqOKGHCxntAR2fNZE7WZ5qwR3nmQDjX1vv9uP+sLTjMx
         M/1NKOiJVfoWUihTmmW05mgR/JpFQfysMU3mVFdhvP0X2U6SDG1XdjBHXAkWTMJ45Gvh
         /gJySctSnyRO6ttyZZBJhcuuJWznF9tjrYZTuJ2GepdJ1wtwRoPEoXD1+tezGGse362q
         j0Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e78I/Hgb/X0xR/7+pbv74LgrfXiB/k53YVM2CtLnKlg=;
        b=YnWpx8DU2ChUxvJBoRhd4Pz8cV93fhDUNKClTnsOnX3kGx2e1fjPoA3ki+5YxciEBV
         aor5dscS3k4Z/8tDLvZjcJbUdU9rdW4al/dkB+KjYRrarC0nqL2gi63PtRpdxo8pWsfE
         Y4UmZwhRz05AZvBogySc7QilfYgrlKl2pAMp+Yy6mWf19ZIqzV38ofA6WRLviRrC2gvJ
         aBW6Z66bE7rWYgUkKkxTtpT6/hoV5tTIO4OcyAVrY1m8//NfDwgFwewaMtcDyHASWnTl
         /U9ZOVQaNqiqTcwxbt6KdDj3HVk88Xkdc9RvCncIYDyxw2ugfPTDIY945DhiOivQBhIq
         FgiQ==
X-Gm-Message-State: AOAM532O2cE3WKfqRL4c7nOXEBe5Z5+nkmk9DcxQhS922HBsIJ8v8y8R
	7w1d/osgjhESj71cBPrqAS9v/Iy+TVsZWFQ8HpFoBA==
X-Google-Smtp-Source: ABdhPJwg6nFaEKEAuufElK7+LXwFM6Kat5+X/+L2NblpOunpgwq6kvio7/U8m6mpLtbU7nWMi9AATCxiDhnYuldpHGk=
X-Received: by 2002:aa7:dc12:: with SMTP id b18mr4975450edu.295.1601906851993;
 Mon, 05 Oct 2020 07:07:31 -0700 (PDT)
MIME-Version: 1.0
References: <20201005083843.8405-1-chee.yang.lee@intel.com>
In-Reply-To: <20201005083843.8405-1-chee.yang.lee@intel.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Mon, 5 Oct 2020 04:07:20 -1000
Message-ID: <CAOSpxdYaUM=ZFwH5HF8eL4g9zyR0x3QVGp3dg9GG4_V1zC-f=A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][dunfell] perl: fix ptest test count
To: Lee Chee Yang <chee.yang.lee@intel.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Thanks!  I tested this fix on Friday and can confirm that it fixes the problem.

I'll include this in the next batch of dunfell patches.

Steve

On Sun, Oct 4, 2020 at 10:41 PM Lee Chee Yang <chee.yang.lee@intel.com> wrote:
>
> From: Chee Yang Lee <chee.yang.lee@intel.com>
>
> patche added in commit c2710903859a5545aa9dd56251f61667ee8d80bd
> failed ptest perl.t/re/pat. The patch updates incorrect test cases
> count causes the ptest to fail.
> 864 test cases before apply the patch while the patch added only 4
> test cases so it should be 868 instead of 873.
>
> ptest-runner log :-
>   PASS: t/re/overload
>   # Looks like you planned 873 tests but ran 868.
>   FAIL: t/re/pat
>   PASS: t/re/pat_advanced
>
> [YOCTO #14071]
>
> Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
> ---
>  meta/recipes-devtools/perl/files/CVE-2020-12723.patch | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/perl/files/CVE-2020-12723.patch b/meta/recipes-devtools/perl/files/CVE-2020-12723.patch
> index ad195cffab..d25f4d4a74 100644
> --- a/meta/recipes-devtools/perl/files/CVE-2020-12723.patch
> +++ b/meta/recipes-devtools/perl/files/CVE-2020-12723.patch
> @@ -265,7 +265,7 @@ index 6a868f4..2869b58 100644
>   skip_all_without_unicode_tables();
>
>  -plan tests => 864;  # Update this when adding/deleting tests.
> -+plan tests => 873;  # Update this when adding/deleting tests.
> ++plan tests => 868;  # Update this when adding/deleting tests.
>
>   run_tests() unless caller;
>
> --
> 2.17.1
>
>
> 
>
