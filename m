Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web09.24475.1620598822127533824
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 May 2021 15:20:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Uo5ZYH/Y;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id m9so14617565wrx.3
        for <openembedded-core@lists.openembedded.org>; Sun, 09 May 2021 15:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=q/uPLeEva5dOSIaAJ8scI58jutx7+LHAihQ1slM9XbQ=;
        b=Uo5ZYH/Yf55agX35EyaPjTemB7Qplt6ZlZiGNJGUN6kjOQtJuXqPGjdnhFC91hOWaj
         1VmojSysRoXAD47Ixv71KUXEeF4bt6PaNRx56+NS9QIWoWpYf2LJkrSfV+h6YzV42SmK
         vC3f6Zilv4PkRXINlPkwMz17pK+zA3Lywf5xU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=q/uPLeEva5dOSIaAJ8scI58jutx7+LHAihQ1slM9XbQ=;
        b=Jd1oDE9TXxg5HcKlLQ6YzLX1GeP4SFHDs43pJmiF07PoeYUtWC7ZNsOPPHKkHihYeR
         scSQbSVNdS1b+IkK1QQo5k3cNSEQ8I2cFntbU8mBnVD/M33tPSYjnMYmzqtEcEnidI6i
         mcl9jR/FHG6MgDPqk2mmp8nbrZdrKXwS4kQWoRH3IKVRyRabYI0aEyVohSmvVXdnebsy
         iw6ws0Tm4++GHH1K3D0uAMahDpakHJqrPkrA67ttCBHQFp+sGHB4M7CyDC3QJhkka785
         GrtAaX7+/Xxi/tXKEA2qvR0Sv48biD51VnRVvc8LUjCc4zm4twH5ODDDF2V8iZTQ4GI1
         TpbQ==
X-Gm-Message-State: AOAM533r4A6i5xV2HKZ6gS0LHa5Z/2OzPMjFTX0GaYNYq5hGwttF1Mwq
	oO9r85zfF5kqatiUz31BirhrvA==
X-Google-Smtp-Source: ABdhPJyednAdZYRksjkRftoHhH3cZMfzJZX/ZMATkn5hi9KjSwVvcuNRv/3OWLrO9pidQAEUFnMZ2Q==
X-Received: by 2002:adf:dcc5:: with SMTP id x5mr27385270wrm.1.1620598820540;
        Sun, 09 May 2021 15:20:20 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:67a1:e913:59c9:6aa6? ([2001:8b0:aba:5f3c:67a1:e913:59c9:6aa6])
        by smtp.gmail.com with ESMTPSA id f3sm19294737wrp.7.2021.05.09.15.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 May 2021 15:20:20 -0700 (PDT)
Message-ID: <0f59b33783d6d31306c4db6721bbba2518e423cd.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] cve-extra-exclusions.inc: add exclusion list for intractable CVE's
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 09 May 2021 23:20:19 +0100
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
> +

One I propose we could add which I'd looked into previously:

# epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2005-0238
# The issue here is spoofing of domain names using characters from other character sets.
# There has been much discussion amongst the epiphany and webkit developers and
# whilst there are improvements about how domains are handled and displayed to the user
# there is unlikely ever to be a single fix to webkit or epiphany which addresses this
# problem. Whitelisted as there isn't any mitigation or fix or way to progress this further
# we can seem to take.
CVE_CHECK_WHITELIST += "CVE-2005-0238"

Cheers,

Richard


