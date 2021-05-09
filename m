Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web09.24404.1620598294798834272
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 May 2021 15:11:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DbxVMErs;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id d4so14574824wru.7
        for <openembedded-core@lists.openembedded.org>; Sun, 09 May 2021 15:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=aqncOcNj08CLw3bvH0pmU2hYnq/O33uaKNO+jlcZAeo=;
        b=DbxVMErsic5XcHFZ4ilcYmEdzKC4KVSJHior3udhG5TU6hpKGjavDBtNx3sO+1GBOW
         516tXWkZnoVJLvxYhQ0vdTMJXM5UxKNHaacTXqmhTfJAe2bBt6Mxr7kl5S16aWGOzW5Q
         k1iV/EzoGPa15ZpqqIlQqrIQuRRHlZgjvi+Lc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=aqncOcNj08CLw3bvH0pmU2hYnq/O33uaKNO+jlcZAeo=;
        b=BiQ7WEnnEM5trsY9oTVhkkbaCAoOYR/2YmcccPif5S0ruUNkbPMnQ3RzbBgJxLVlOg
         u0PjO4Xxe5OdiIrk8AdYEy0bER5XEj99Conr+RMRXecQKcqjAQ8wft5YKh1TndJHuf6n
         qp/vwacMACUNC/i4QjWV9LJwdD86eG9aUlIQku/qeWG6/eu/Mq47MPNQ9Entclb3srdS
         H9YD6kv8dHHH6yXKGrfjizlIo4VTNc1v1SxzH41DVMM1YNoDu2JZnGOb+2VwmYM+PFzb
         winMLM7sQTm949aexTI8O6rPL6xCgCEUplPIKmscJXkUeLMdZ4bokhqVmYQgO/wg5Knq
         qxXg==
X-Gm-Message-State: AOAM531xPZsTPGYp0ZzDF4J5gD9aLYh2WYrSP0WnbBC3QmH/E+GX41Zl
	iOfiUdggoSqOCeqMZBBnk8AscA==
X-Google-Smtp-Source: ABdhPJw4/GEL07vDeHZoh6+xiujc62K2SyRJ4lzdDL6Qu2M+LvXk0Lgp3suHcYJyiwzY9pwXyMmtJQ==
X-Received: by 2002:adf:f38c:: with SMTP id m12mr26423685wro.282.1620598293120;
        Sun, 09 May 2021 15:11:33 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:67a1:e913:59c9:6aa6? ([2001:8b0:aba:5f3c:67a1:e913:59c9:6aa6])
        by smtp.gmail.com with ESMTPSA id e8sm19507994wrt.30.2021.05.09.15.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 May 2021 15:11:32 -0700 (PDT)
Message-ID: <f7bf7b7708f94dcbc6e4b6c37d89b89f7ac63505.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] cve-extra-exclusions.inc: add exclusion list for intractable CVE's
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 09 May 2021 23:11:32 +0100
In-Reply-To: <20210506171232.2832063-1-steve@sakoman.com>
References: <20210506171232.2832063-1-steve@sakoman.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-05-06 at 07:12 -1000, Steve Sakoman wrote:
> The preferred methods for CVE resolution are:
> 
> 1. Version upgrades where possible
> 2. Patches where not possible
> 3. Database updates where version info is incorrect
> 4. Exclusion from checking where it is determined that the CVE
>    does not apply to our environment
> 
> In some cases none of these methods are possible. For example the
> CVE may be decades old with no apparent resolution, and with broken
> links that make further research impractical.
> 
> This patch creates a mechanism for users to remove this type of
> CVE from the cve-check results via an optional include file.
> 
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  .../distro/include/cve-extra-exclusions.inc    | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 meta/conf/distro/include/cve-extra-exclusions.inc
> 
> diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/conf/distro/include/cve-extra-exclusions.inc
> new file mode 100644
> index 0000000000..956b3a9a3c
> --- /dev/null
> +++ b/meta/conf/distro/include/cve-extra-exclusions.inc
> @@ -0,0 +1,18 @@
> +# This file contains a list of CVE's where resolution has proven to be impractical.
> +# It contains all the information we are aware of about an issue and analysis about
> +# why we believe it can't be fixed/handled. Additional information is welcome through
> +# patches to the file.
> +#
> +# Include this file in your local.conf or distro.conf to exclude these CVE's
> +# from the cve-check results
> +
> +# strace https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2000-0006
> +# CVE is more than 20 years old with no resolution evident
> +# broken links in CVE database references make resolution impractical
> +CVE_CHECK_WHITELIST += "CVE-2000-0006"
> +
> +# groff:groff-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2000-0803
> +# CVE is more than 20 years old with no resolution evident
> +# broken links in CVE database references make resolution impractical
> +CVE_CHECK_WHITELIST += "CVE-2000-0803"

I was thinking of adding a better description for this one and went digging. I 
then found (I think?) that the above was fixed in:

https://git.savannah.gnu.org/cgit/groff.git/commit/?id=07f95f1674217275ed4612f1dcaa95a88435c6a7

which would make it fixed in groff 1.17. We can probably submit a request
to update the CPE on that one...

I do think we're going to need this file and that having it might encourage
people to either document issues or as I maybe found here, get to the bottom 
of one..

Cheers,

Richard





