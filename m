Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.160.1626988410464488915
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 14:13:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JZpRfxh+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id g15so178872wrd.3
        for <Openembedded-core@lists.openembedded.org>; Thu, 22 Jul 2021 14:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=MF2KBpj2ZyiY+QC//fkLWXuCfUH5U0Gp2I/WEck36EU=;
        b=JZpRfxh+W73zPaL/JB2Rh6S0g4jZUjReCjvSfTE0BMIP6zWyeRW+aOC33ocCt0l8Vv
         D1YMKo+KYw8Ls89uuMGt9N3miRlJ68iBmrzegBfChPwqWy6K3Uybz+UgLiVQ8KK+CuBy
         5ni2bR4et6k3z4i4aF3EMbF7A/A12tV5M2c14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=MF2KBpj2ZyiY+QC//fkLWXuCfUH5U0Gp2I/WEck36EU=;
        b=b3Dih42e493IcQYka4kOP7V8cuEiLNfvLH+tmFmbdxev9BJgLVbqr6dZXsHIvDJUj7
         3zBMCuJSgm7ATeFwRrIJSts8aGR2pS+q0UlIKCydAdroIE64BkzXDgY0kVeK0FYoCiQU
         VCTyIoqEMuNEKjm9Bj66hUywHJO6tbE3tA4n+IX9nqNPYkqNB2hcXEq3d7yOTWkFNaHp
         lTa7p5sok2QXyuPGPgmcaOkUbn5546jaTNHCeIndo27JZQQfLAVG3/q9lfkjpUyZhGIy
         q4NIeg5BOmoGEOX+Fmz72XIqlqJM6BYyJrrVQf+JHhkMA4Q9hMMQ2eim2t8feACEJQ1c
         TMFA==
X-Gm-Message-State: AOAM5308z3iiPVSeBH+qbmZcHmFY8BYd1I1Xt6q6XmS/af1X+2xKSFcD
	0Of2XqFKDfP1uq8GZICou9GM+A==
X-Google-Smtp-Source: ABdhPJwRThaZijS33e/nongIuuN24jV1vdQBV69kOj2v9GEA5TMuwYODtNj+3RKXIYzkS9RXSLrGqg==
X-Received: by 2002:adf:dd92:: with SMTP id x18mr1832504wrl.421.1626988408918;
        Thu, 22 Jul 2021 14:13:28 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:e1dd:b42c:9243:6ba8? ([2001:8b0:aba:5f3c:e1dd:b42c:9243:6ba8])
        by smtp.gmail.com with ESMTPSA id b15sm36309977wrr.27.2021.07.22.14.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 14:13:28 -0700 (PDT)
Message-ID: <3374ac50d1997cf849fc5a8d83109dc05cc1926f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 2/8] overlayfs.bbclass: generate overlayfs mount units
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Vyacheslav Yurkov <uvv.mail@gmail.com>, 
	Openembedded-core@lists.openembedded.org
Date: Thu, 22 Jul 2021 22:13:27 +0100
In-Reply-To: <20210715193933.66120-2-uvv.mail@gmail.com>
References: <20210715193933.66120-1-uvv.mail@gmail.com>
	 <20210715193933.66120-2-uvv.mail@gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-07-15 at 21:39 +0200, Vyacheslav Yurkov wrote:
> It's often desired in Embedded System design to have a read-only rootfs.
> But a lot of different applications might want to have a read-write access
> to some parts of a filesystem. It can be especially useful when your update
> mechanism overwrites the whole rootfs, but you want your application data
> to be preserved between updates. This class provides a way to achieve that
> by means of overlayfs and at the same time keeping the base rootfs read-only.
> 
> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> ---
>  meta/classes/overlayfs.bbclass | 133 +++++++++++++++++++++++++++++++++
>  1 file changed, 133 insertions(+)
>  create mode 100644 meta/classes/overlayfs.bbclass
> 
> diff --git a/meta/classes/overlayfs.bbclass b/meta/classes/overlayfs.bbclass
> new file mode 100644
> index 0000000000..40e6107f0d
> --- /dev/null
> +++ b/meta/classes/overlayfs.bbclass
> @@ -0,0 +1,133 @@
> +# Class for generation of overlayfs mount units
> +#
> +# It's often desired in Embedded System design to have a read-only rootfs.
> +# But a lot of different applications might want to have a read-write access to
> +# some parts of a filesystem. It can be especially useful when your update mechanism
> +# overwrites the whole rootfs, but you want your application data to be preserved
> +# between updates. This class provides a way to achieve that by means
> +# of overlayfs and at the same time keeping the base rootfs read-only.
> +#
> +# Usage example.
> +#
> +# Set a mount point for a partition overlayfs is going to use as upper layer
> +# in your machine configuration. Underlying file system can be anything that
> +# is supported by overlayfs. This has to be done in your machine configuration.
> +# QA check fails to catch file existence if you redefine this variable in your recipe!
> +#
> +#   OVERLAYFS_MOUNT_POINT[data] ?= "/data"
> +#
> +# The class assumes you have a data.mount systemd unit defined in your
> +# systemd-machine-units recipe and installed to the image.
> +#
> +# Then you can specify writable directories on a recipe base
> +#
> +#   OVERLAYFS_WRITABLE_PATHS[data] = "/usr/share/my-custom-application"
> +#
> +# To support several mount points you can use a different variable flag. Assume we
> +# want to have a writable location on the file system, but not interested where the data
> +# survive a reboot. Then we could have a mnt-overlay.mount unit for a tmpfs file system:
> +#
> +#   OVERLAYFS_MOUNT_POINT[mnt-overlay] = "/mnt/overlay"
> +#   OVERLAYFS_WRITABLE_PATHS[mnt-overlay] = "/usr/share/another-application"
> +#
> +# Note: the class does not support /etc directory itself, because systemd depends on it
> +
> +REQUIRED_DISTRO_FEATURES += "systemd overlayfs"
> +
> +inherit systemd features_check overlayfs-qa
> +
> +def strForBash(s):
> +    return s.replace('\\', '\\\\')
> +
> +def unitFileList(d):
> +    fileList = []
> +    overlayMountPoints = d.getVarFlags("OVERLAYFS_MOUNT_POINT")
> +
> +    if not overlayMountPoints:
> +        bb.fatal("A recipe uses overlayfs class but there is no OVERLAYFS_MOUNT_POINT set in your MACHINE configuration")
> +
> +    # check that we have required mount points set first
> +    requiredMountPoints = d.getVarFlags('OVERLAYFS_WRITABLE_PATHS')
> +    for mountPoint in requiredMountPoints:
> +        if mountPoint not in overlayMountPoints:
> +            bb.fatal("Missing required mount point for OVERLAYFS_MOUNT_POINT[%s] in your MACHINE configuration" % mountPoint)
> +
> +    for mountPoint in overlayMountPoints:
> +        for path in d.getVarFlag('OVERLAYFS_WRITABLE_PATHS', mountPoint).split():
> +            fileList.append(mountUnitName(path))
> +            fileList.append(helperUnitName(path))
> +
> +    return fileList
> +
> +def helperUnitName(unit):
> +    return escapeSystemdUnitName(unit) + '-create-upper-dir.service'

Again, I'm a little torn on some of the functions. Would some of these
be better as part of a function library in meta/lib/oe/ ?

The downside is that variable dependencies are no longer automatic so
the dependency on OVERLAYFS_WRITABLE_PATHS may be missed, I don't think
it would see OVERLAYFS_MOUNT_POINT as I'm not sure the magic parsing
code understand getVarFlags (compared to getVarFlag which it does).

Cheers,

Richard

