Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web08.10420.1614351754774894409
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 07:02:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HLJwXjOB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id d11so8872287wrj.7
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 07:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=YzKsfm0D0ZbDKMqC2NA3qk97CsQoc6FBC22YpZiJ/EE=;
        b=HLJwXjOBVQfWoA+C2tBUnSFv1ph0P4s3C3HrNktW8V3CgbxbaA8en6OnFilAHVc69T
         GLzcIh0uV59af43o8wEdneVo2YSbC4JZNAgqSceoJ2WDElONf9zw7pEuC/V4ByLJdAHX
         ewDMejbfBIh/4BCg9hzI6aBLzwQqNemnfVwnc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=YzKsfm0D0ZbDKMqC2NA3qk97CsQoc6FBC22YpZiJ/EE=;
        b=KmYq5Rg6i2GCiVCYZemNU3kGhnC3fGzO4w/3akFVGkX/rJPtDj2ni119TCetOFJ0bk
         jwqwt1fAvF1v+Tg19wVA4ptUVP2LhQDtu9N6Bx6ZZE0WMNmeybir0oy805ecW+ciVELz
         zgzyRWsErIsFqU4eXFB2ap5pYBd6a8C1mMba+SbFv7bzWGzDcxU1Kp9vw5bXVkbe1ooA
         zsOeuaYmdAWcXRYNVZJh9w3/5BKA6wzanF6hlvmS2cvDIpziE8PhPs/JW3cdQj/y5DHr
         sjgkPlmEq2AfvvbjwYdiWID/gJWd45wG0fkc3hSZc87clMMGyjydrOfxogdyNRkfHW1Y
         KdWA==
X-Gm-Message-State: AOAM533bgMSdfgywGFw3ilX53ky2WcAwkV5X2WIL893utsJxdtr4whzr
	mnIZbIZmJoQVOnBKE4ceFbrMJQ==
X-Google-Smtp-Source: ABdhPJxoBH+9W3ME48k/XY4TjBCVnR6edssW0GuKAFgHDGFS4thRQoU3wHG7Y8Cti6Ah21emdI+uuw==
X-Received: by 2002:a5d:4b50:: with SMTP id w16mr3596537wrs.34.1614351748160;
        Fri, 26 Feb 2021 07:02:28 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:e9fa:5b01:958e:e80f? ([2001:8b0:aba:5f3c:e9fa:5b01:958e:e80f])
        by smtp.gmail.com with ESMTPSA id i8sm3361490wrx.43.2021.02.26.07.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 07:02:27 -0800 (PST)
Message-ID: <520e6fddc9e908fa14e0d9a68640d00daeab7294.camel@linuxfoundation.org>
Subject: Re: [OE-core][RFC] reproducible: Switch to last chance SDE fallback
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Joshua Watt <jpewhacker@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: jsmoeller@linuxfoundation.org
Date: Fri, 26 Feb 2021 15:02:27 +0000
In-Reply-To: <20210224155032.21220-1-JPEWhacker@gmail.com>
References: <20210224155032.21220-1-JPEWhacker@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-02-24 at 09:50 -0600, Joshua Watt wrote:
> Instead of trying to shove a non-zero SDE into the deployed sstate
> files which has bad interactions, let it naturally resolve to 0 and do a
> "last chance" correction to the fallback SOURCE_DATE_EPOCH.
> 
> Also, stop exporting the fallback source date epoch since we don't want
> to invalidate *all* tasks when it changes. Instead, make do_unpack
> depend on the fallback value to invalidate all the downstream tasks when
> it changes.
> 
> Finally, we need to make sure that do_deploy_source_date_epoch() gets
> rerun when the actual SDE value changes. Introduce a new variable
> (SOURCE_DATE_EPOCH_DEP) that this task (and others like it) can depend
> on when they need to be invalidated by a change in the source date epoch
> value.
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/classes/reproducible_build.bbclass | 23 ++++++++++++++---------
>  meta/lib/oe/reproducible.py             |  8 ++------
>  2 files changed, 16 insertions(+), 15 deletions(-)
> 
> diff --git a/meta/classes/reproducible_build.bbclass b/meta/classes/reproducible_build.bbclass
> index f06e00d70d..74ef8da3c9 100644
> --- a/meta/classes/reproducible_build.bbclass
> +++ b/meta/classes/reproducible_build.bbclass
> @@ -42,7 +42,13 @@ SDE_FILE = "${SDE_DIR}/__source_date_epoch.txt"
>  SDE_DEPLOYDIR = "${WORKDIR}/deploy-source-date-epoch"
>  
> 
> 
> 
>  # A SOURCE_DATE_EPOCH of '0' might be misinterpreted as no SDE
> -export SOURCE_DATE_EPOCH_FALLBACK ??= "1302044400"
> +SOURCE_DATE_EPOCH_FALLBACK ??= "1302044400"
> +
> +# Some tasks do actually depend on the value of the source date epoch, even
> +# though it is generally excluded from task signatures. For those tasks, they
> +# can add a vardep on this variable
> +SOURCE_DATE_EPOCH_DEP = "${SOURCE_DATE_EPOCH}"
> +SOURCE_DATE_EPOCH_DEP[vardepvalue] = "${SOURCE_DATE_EPOCH_DEP}"
> 

Just for the mailing list record, I believe the above would not allow
task checksums to be calculated in advance which is why we didn't do this
originally. It would certainly make some things easier if we could do that
but I'm not sure it would be possible. The sstate tests in oe-selftest
would likely flag this problem as they're designed to detect this.

Cheers,

Richard


