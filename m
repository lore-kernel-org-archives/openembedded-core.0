Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.36302.1599220278171717982
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2020 04:51:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Z42k4y8b;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id c19so7358390wmd.1
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2020 04:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=3NkWi0sEzoy5G5NRjUUNe4J7dk77qXmEHEkkxByu7iI=;
        b=Z42k4y8b3qktH3x6auZofFvvF7XN8QpaxR7RnHtw1a2RhEcnYFWebcJP1pjHNrtK3S
         dhl9yNUGGum2f4J56aOsHX/yPAdm8jghQBEMCjcXerkzviXb8Fev2C3nh5XTRPYMCWd3
         NlYniMIapRFLZ46rfVkaYRHt6N44vqIdsD2G4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=3NkWi0sEzoy5G5NRjUUNe4J7dk77qXmEHEkkxByu7iI=;
        b=WhVnKGpPGZ5rF9fbMwpTcFQpMRyuy5mIXaP4tXcs2P1T0zz+sSQbj/Y+9zOBmkLPGz
         t/KHxvZvC4Ws1dH9+XtsnFha1neCGGimAjhm5wvM9XzQLIaWc9LKYrH+16fxTipIUf8e
         o48icS6QhLSvhiq2MTHbe1ATrd2WlhGxki/WVX2YXlGLJ+2NDEGLhFHA8QhLSNj+cyMR
         K2o6xfxj9McFXYrPHJ8NGn2icP2WkDgzTXcvdHizst9lW5Igg1ZvTuvDZmAwNpvaFH1O
         xK9h6tVoh3qb8jnwo6FjSbJP7dBY7bw4ibHxm0I1kKvX/rkr/H4ovaTUbu9Y917DCe9b
         F8PQ==
X-Gm-Message-State: AOAM533Eklb9Yi6eu4cia1i+fv7Q4GUoEbM5Agv3Dk7lP8pBhSmckL6E
	131OqKbW99Gpnm1i55w9uBjx0g==
X-Google-Smtp-Source: ABdhPJw8FK0T2CYDTFA52WRYtnBkqTVv4zx9mFZP1i2KsGC4YbcRtclz0z3TCYg+DqfllIxyolX+Mg==
X-Received: by 2002:a1c:7912:: with SMTP id l18mr7165934wme.124.1599220276562;
        Fri, 04 Sep 2020 04:51:16 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.f.d.f.5.0.6.0.0.2.6.1.6.b.c.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.f.d.f.5.0.6.0.0.2.6.1.6.b.c.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:7cb6:1620:605:fdfd])
        by smtp.gmail.com with ESMTPSA id h6sm10407359wmb.22.2020.09.04.04.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2020 04:51:15 -0700 (PDT)
Message-ID: <e3847f852942207fcac5d73bd8f97a37e49c2f95.camel@linuxfoundation.org>
Subject: Re: [PATCH] rootfs-postcommands.bbclass: make /etc/timestamp path configurable
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>, 
	openembedded-core@lists.openembedded.org
Cc: chbs@prevas.dk
Date: Fri, 04 Sep 2020 12:51:14 +0100
In-Reply-To: <20200904070807.401-1-rasmus.villemoes@prevas.dk>
References: <20200904070807.401-1-rasmus.villemoes@prevas.dk>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-09-04 at 09:08 +0200, Rasmus Villemoes wrote:
> Not every image necessarily wants a timestamp file,

Wouldn't you just not have rootfs_update_timestamp in
ROOTFS_POSTPROCESS_COMMAND in that case?

>  and even if it does, it's possible to create filesystem images that do not have a
> /etc directory or where some other location for the file is more
> appropriate. So add a ROOTFS_TIMESTAMP_FILE variable weakly defaulting
> to /etc/timestamp - setting that to the empty string opts out of
> creating the timestamp file.
> 
> I wasn't sure whether to spell /etc as ${sysconfdir}, but chose /etc
> to stay completely backwards compatible.
> 
> Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
> ---
>  meta/classes/rootfs-postcommands.bbclass | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
> index 984730ebe8..cf54f22566 100644
> --- a/meta/classes/rootfs-postcommands.bbclass
> +++ b/meta/classes/rootfs-postcommands.bbclass
> @@ -12,6 +12,7 @@ ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'deb
>  ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'post-install-logging' ], "postinst_enable_logging; ", "",d)}'
>  
>  # Create /etc/timestamp during image construction to give a reasonably sane default time setting
> +ROOTFS_TIMESTAMP_FILE ??= "/etc/timestamp"
>  ROOTFS_POSTPROCESS_COMMAND += "rootfs_update_timestamp; "
>  
>  # Tweak the mount options for rootfs in /etc/fstab if read-only-rootfs is enabled
> @@ -275,14 +276,18 @@ python write_image_manifest () {
>  # Can be used to create /etc/timestamp during image construction to give a reasonably
>  # sane default time setting
>  rootfs_update_timestamp () {
> +	if [ -z "${ROOTFS_TIMESTAMP_FILE}" ]; then
> +		return
> +	fi
>  	if [ "${REPRODUCIBLE_TIMESTAMP_ROOTFS}" != "" ]; then
>  		# Convert UTC into %4Y%2m%2d%2H%2M%2S
>  		sformatted=`date -u -d @${REPRODUCIBLE_TIMESTAMP_ROOTFS} +%4Y%2m%2d%2H%2M%2S`
>  	else
>  		sformatted=`date -u +%4Y%2m%2d%2H%2M%2S`
>  	fi
> -	echo $sformatted > ${IMAGE_ROOTFS}/etc/timestamp
> -	bbnote "rootfs_update_timestamp: set /etc/timestamp to $sformatted"
> +	mkdir -p $(dirname ${IMAGE_ROOTFS}${ROOTFS_TIMESTAMP_FILE})
> +	echo $sformatted > ${IMAGE_ROOTFS}${ROOTFS_TIMESTAMP_FILE}
> +	bbnote "rootfs_update_timestamp: set ${ROOTFS_TIMESTAMP_FILE} to $sformatted"
>  }
>  
>  # Prevent X from being started

I have a feeling there are other consumers of this file which would
also need to be changed to reference ROOTFS_TIMESTAMP_FILE?

Cheers,

Richard

