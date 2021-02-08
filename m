Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.595.1612802550096330645
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 08:42:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eHmr/Pps;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id l12so18010519wry.2
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 08:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=VfjHy0PbDoVuG1wAlm5c72jajghbQj3wnpASu+6ObD4=;
        b=eHmr/PpsFMXMzsD1NSO+Cbg8/StDPSxgJtY7kupcD0kNrONrxoLQt90+2R+mukxb1H
         DRJToLKOKMY8PTJ2qPAOYYjdaBuSatBvSEBYIb/Cak7h0jbSb5ctXh++5S6v7d2Prpb6
         VIEQWLo5NGTsT/eAMzGFySfoNNy0Ci4O3nBBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=VfjHy0PbDoVuG1wAlm5c72jajghbQj3wnpASu+6ObD4=;
        b=EcuVSR1jSo4GPeW21cdgJ89ww1Bw3GAfniJq77Cd0cBEuw2iWEJRjtJEP4fWWozt3G
         /ylQFQPP6DiJ92+tibrlydsTW+nRS+U2lhQvVigXJqfBEP/hMZfOIHAEyMR2FLwvITx2
         MB7HYqSEIoDjxFuw00cmjicqlKcEtFx4Zu7hBKEAzFpZ/gpCUhjMmo/KuAxYwiM5cGcl
         KfDZch+mB3Z/x1XF5A8Z8BHc80lKr8M0GUZeoKxX60YB1zjqPtjopqzS9eOKTVv/4tPy
         WJuev7I47KQthk48q9QRTaAy2EHk1evPjPLKayJgBTAYpUy1COgh1jJ8I6MAIQSNlleu
         6W1A==
X-Gm-Message-State: AOAM533SnyWTygkftUR15sus9BRstLPKpNNPobjOaizB0DzlKyESxCve
	ehWk7lz7AYLGsT1xKpVmKY9XWQ==
X-Google-Smtp-Source: ABdhPJzEUt1iRPvKCdMyrJ/1SGyt1FLFWOYMv3zvqOrcdSCeT2SwcHt1Als2rnaD4JS/hJmtQn134Q==
X-Received: by 2002:adf:a4c8:: with SMTP id h8mr11584800wrb.286.1612802548352;
        Mon, 08 Feb 2021 08:42:28 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:ff1a:4654:ede1:462c? ([2001:8b0:aba:5f3c:ff1a:4654:ede1:462c])
        by smtp.gmail.com with ESMTPSA id i7sm405883wmq.2.2021.02.08.08.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 08:42:27 -0800 (PST)
Message-ID: <cc0a90ba7b46bcd5b51c60374b741c198d401fde.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] oe-pkgdata-util: Check if environment script is initialized
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Dorinda <dorindabassey@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 08 Feb 2021 16:42:26 +0000
In-Reply-To: <20210201144638.15582-1-dorindabassey@gmail.com>
References: <20210201144638.15582-1-dorindabassey@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Dorinda,

On Mon, 2021-02-01 at 09:46 -0500, Dorinda wrote:
> Tinfoil doesn't behave well if environment is not initialized, this check ensures a proper error log if environment is not initialized.
> 
> [YOCTO #12096]
> 
> Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
> ---
> v2:
> -Positioned check under a condition when it cannot determine the pkgdata_dir
> 
>  scripts/oe-pkgdata-util | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
> index 93220e3617..75dd23efa3 100755
> --- a/scripts/oe-pkgdata-util
> +++ b/scripts/oe-pkgdata-util
> @@ -598,6 +598,9 @@ def main():
>              logger.error("Unable to find bitbake by searching parent directory of this script or PATH")
>              sys.exit(1)
>          logger.debug('Found bitbake path: %s' % bitbakepath)
> +        if not os.environ.get('BUILDDIR', ''):
> +            logger.error("This script can only be run after initialising the build environment (e.g. by using oe-init-build-env)")
> +            sys.exit(1)
>          tinfoil = tinfoil_init()
>          try:
>              args.pkgdata_dir = tinfoil.config_data.getVar('PKGDATA_DIR')

I'm a little worried about this patch since it fixes the oe-pkgdata-
util case but what about devtool, or recipetool or anything else which
uses tinfoil.

I'm wondering if there should be a check inside tinfoil itself?

or is this problem really oe-pkgdata-util specific?

Cheers,

Richard

