Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web09.2546.1612004478241564910
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Jan 2021 03:01:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dpyMjNrh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id f16so8694616wmq.5
        for <openembedded-core@lists.openembedded.org>; Sat, 30 Jan 2021 03:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=9WvTsQy7JJsiMGb9DEpNNHbs5OOuQnlGeoHyQ8CSVqo=;
        b=dpyMjNrh8cXA3PGwoEWePUkIafY2DiLPTDUzChgB8Wyd46PRJdgS8PGJPiDdri+tOz
         wrBlq9EVXGcf0fb0DcodGZX5vFXcS9mRRgdNe5RAzW3luOFIqry5amirBjrKHIYYGaym
         Vm3HzGyiGQXPyCHzrbsv51PzM6JTo411HWQNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=9WvTsQy7JJsiMGb9DEpNNHbs5OOuQnlGeoHyQ8CSVqo=;
        b=mf3jdczIdyNrUjgfAB5CB7HZpT9R7hAP5+wAxIObRyC9itQfko1rBK/HSTZCU3J/Xn
         /AxrtOWe+9O+4gxAVS+MqfRsqt3DJeu/W5+3ZhCzcMLxbJ5nGP3pZfVMVLY1QJhfF9KM
         OHIR9w8udpQREm5sWuFOE9r5+EFB3QnzZbeq/Emibc/xoUVlEDNi+xSm5PvxeIF6V4aO
         VATIj2PI6HxWKe90acJY7uo7bRn6RmWov7WunUqOy+7JxonLh/5nKZmJJRJW0jw7S9XH
         0vAwxp0wJBl1dAYzcBS/rIHnahQoghFNyBgcWAyJyrLGvHZ8b4d5BayOuLRSMSWqXiK1
         Ii3g==
X-Gm-Message-State: AOAM530QdVfHZPisoWh9b+Iu6jLDPw5+XoUUAciS6yr7K30Zsu7Ror02
	INjgWd1i408gdKS1DZJlsiF5yw==
X-Google-Smtp-Source: ABdhPJzyclwpTcxVg+U0Lg6p24s999JYRlK/FWfZk5Ic2FGqRAI53/iTWVOnx187q/GQU588BdEC9w==
X-Received: by 2002:a1c:6089:: with SMTP id u131mr7400670wmb.99.1612004476565;
        Sat, 30 Jan 2021 03:01:16 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:1e22:34f6:7a80:adbb? ([2001:8b0:aba:5f3c:1e22:34f6:7a80:adbb])
        by smtp.gmail.com with ESMTPSA id u6sm18262338wro.75.2021.01.30.03.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Jan 2021 03:01:15 -0800 (PST)
Message-ID: <509abad9152214d2cb073912e89518082bb92857.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] sanity.bbclass: check if PSEUDO_IGNORE_PATHS and ${S} overlap
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Dorinda <dorindabassey@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: "Qi.Chen" <Qi.Chen@windriver.com>, ip.jango@gmail.com
Date: Sat, 30 Jan 2021 11:01:13 +0000
In-Reply-To: <20210128195108.5247-1-dorindabassey@gmail.com>
References: <20210128195108.5247-1-dorindabassey@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-01-28 at 20:51 +0100, Dorinda wrote:
> added a sanity check for when PSEUDO_IGNORE_PATHS and ${S} overlap to avoid random failures generated.
> 
> [YOCTO #14193]
> 
> Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
> ---
> v2:
> added a condition for when {WORKDIR}={S}
> 
>  meta/classes/sanity.bbclass | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index c6842ff549..63284b7917 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -710,6 +710,16 @@ def check_sanity_version_change(status, d):
>          if i and workdir.startswith(i):
>              status.addresult("You are building in a path included in PSEUDO_IGNORE_PATHS " + str(i) + " please locate the build outside this path.\n")
>  
> 
> 
> 
> +    # Check if PSEUDO_IGNORE_PATHS and ${S} overlap
> +    pseudoignorepaths = d.getVar('PSEUDO_IGNORE_PATHS', expand=True).split(",")
> +    workdir = d.getVar('WORKDIR')
> +    sourcefile = d.getVar('S')
> +    if (workdir == sourcefile):
> +        for i in pseudoignorepaths:
> +            if i and sourcefile:
> +                if sourcefile.startswith(i) or i.startswith(sourcefile):
> +                    status.addresult("a path included in PSEUDO_IGNORE_PATHS " + str(i) + " and ${S} (source files) path " + str(sourcefile) + " are overlapping each other, please set ${S} in your recipe to point to a different directory. \n")
> +
>      # Some third-party software apparently relies on chmod etc. being suid root (!!)
>      import stat
>      suid_check_bins = "chown chmod mknod".split()


This isn't quite solving the problem in bug 14193. In that bug lets
say:

S = "${WORKDIR}/pack"

and this overlaps with ${WORKDIR}/package (PKGD) and
${WORKDIR}/packages-split (PKGDEST) which are set in package.bbclass.

So the sanity test we need here is to test whether any element of
PSEUDO_IGNORE_PATHS overlaps with directories we know need to be under
pseudo control. Qi already had a list of these in a different patch:

${D},${PKGD},${PKGDEST},${IMAGE_ROOTFS},${SDK_OUTPUT}

Cheers,

Richard



