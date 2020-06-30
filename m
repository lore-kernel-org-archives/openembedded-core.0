Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web12.6050.1593547739359225941
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2020 13:08:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HhPwcwO0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id l17so20006956wmj.0
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2020 13:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=Kfi63Q6n4EGnkfAPzvfcwliAdWLQoE1M15uYTgStzxs=;
        b=HhPwcwO0nvTYEI398Y5os15ygODYM1GJqdBjC2AlDJ5owG6PoZKZexMKw6pOxkTiLq
         BVUtALLoWBXNOkOdwQU4XpIfaMOWFP6217K9ullSZvitzEOCzkP5JHnxRWDn4xks8Am3
         JqN1NTpA6oPxSIg+8Bxfh4FDVXhG+XOvlQH3A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Kfi63Q6n4EGnkfAPzvfcwliAdWLQoE1M15uYTgStzxs=;
        b=uRP199W0+V109TpE5od8JRBJb39R38SR2qjIf7Mp/Ud8kU4dJioBNiYtoWAjmvTIJY
         kP5r/rEqMPpruSr8cPLPJz+Ixzyk267olxWwMripEe2PVJSDya1emRpB93thZDaEUTRY
         TOnhK40ymFPkrBTt2sCHnIkISDYY08jTgP9UrJk1N0ZfmlJKmBphl6Tg+39RxfJGI1nA
         mBYTvS/2uIkczrxfMrYmq1EJz5t1f8t8Bq+y88Ipy7CBon39hWrJvj5VfaMO42YWLpJ8
         BIY6cTZuo7ujjretlT8kHar8KuTCotTRHBjadGu2fkRN1G64bqQYrfEmaM4+eTJWrPm7
         2OqQ==
X-Gm-Message-State: AOAM533DTKUSb24J69cjYw0MTy2ikU9sITsJr58tinr+Jk1wsG/z5ibm
	KEHzVrw0YEKMqMAsZMcR+2wU1g==
X-Google-Smtp-Source: ABdhPJx3AJyL1htN1JPANfHnaGunaXApoED2TOR/8gl3A71PcapqEmYTGp3FCgG/rF2vh77sU4hMTw==
X-Received: by 2002:a1c:4c0a:: with SMTP id z10mr15338253wmf.38.1593547735950;
        Tue, 30 Jun 2020 13:08:55 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id s18sm5359588wra.85.2020.06.30.13.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 13:08:55 -0700 (PDT)
Message-ID: <c3e569088010a8242703f559f99de658e427f32b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] netbase: use git fetcher
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Yu, Mingli" <mingli.yu@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 30 Jun 2020 21:08:53 +0100
In-Reply-To: <20200629043119.1798934-1-mingli.yu@windriver.com>
References: <20200629043119.1798934-1-mingli.yu@windriver.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-06-29 at 12:31 +0800, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> Use git repo as the the previous URL only stores
> the latest source file and fails to locate the
> source tar file if we don't upgrade timely.
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta/recipes-core/netbase/netbase_6.1.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-core/netbase/netbase_6.1.bb b/meta/recipes-core/netbase/netbase_6.1.bb
> index bc0049c020..c13685e8ad 100644
> --- a/meta/recipes-core/netbase/netbase_6.1.bb
> +++ b/meta/recipes-core/netbase/netbase_6.1.bb
> @@ -6,10 +6,10 @@ LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://debian/copyright;md5=3dd6192d306f582dee7687da3d8748ab"
>  PE = "1"
>  
> -SRC_URI = "${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}.tar.xz"
> +SRC_URI = "git://salsa.debian.org/md/netbase.git;protocol=https"
> +SRCREV = "0fc1e4ce39328f7388badace0aaf7b7294d5ed61"
>  
> -SRC_URI[md5sum] = "e5871a3a5c8390557b8033cf19316a55"
> -SRC_URI[sha256sum] = "084d743bd84d4d9380bac4c71c51e57406dce44f5a69289bb823c903e9b035d8"
> +S = "${WORKDIR}/git"
>  
>  UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/n/netbase/"
>  do_install () {

This still breaks all oe-selftest:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/1095
https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/1087
https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/1083
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/1098

oe-selftest -r reproducible.ReproducibleTests.test_reproducible_builds

should reproduce but regardless, this *must* be fixed before this can
merge.

Cheers,

Richard

