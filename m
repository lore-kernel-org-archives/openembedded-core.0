Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web12.9181.1594210093937782489
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2020 05:08:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fCREd1t+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id f18so2759755wml.3
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2020 05:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=rb5SaMYN2erVWQtRKu19JMZi76Ljuz3ktE4XCC7r3e4=;
        b=fCREd1t+qKXSvTFwWN43qJuZ5yNk87f2ZqcLYelLz35YlVC1ijYZc5n3EndntsHd/n
         R8loXBwLfUFlVK0WRVcqTiq6IqtZeLh7V5lxbsBTrrXcrU3PARWF44jBYA6vl8m0KhAf
         hKk9zF2phTv2Eu0zOfUjEu5O11sjYlnsslEKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=rb5SaMYN2erVWQtRKu19JMZi76Ljuz3ktE4XCC7r3e4=;
        b=l2eBlg1t1aolE84q5/fIXf6iykqOQZyb9U0tUHlcDyXe0iD0/4kotXFEfT3gvrwv0e
         MfD7ZXxnPgisNd6Zad/37kJ4zWelhy7ifsnD7IBGnXdSGZVMocS40lELN6N+mDlI4nUm
         CdYLinXTKU/yMvjGid3R39qFSmRg07n4XUbqC91FJH0mkoiarWxf5eZtFAHL39UCMSPG
         bMoZ7PoxssG5J2yfkaU6SyM1dX28d0mwNR1PLVGhPor+I7KadDspgK5HQUZ7dPAjKBAs
         mqQvRTq5pxdm6K7FE0BAgutRVg6xcNtaX+L7kZRbBtwwdR7gRIZN5/Nw6d2MLn0mr9Yp
         hgcw==
X-Gm-Message-State: AOAM533UDc06mmw/fUDM+tPQVN4RWFLrepQ2aVBUChW3Uzr2zTsrBPhx
	kPHqzx3dJD7jWSRGrP3LQcFnNg==
X-Google-Smtp-Source: ABdhPJz+HrEFM0Cbc/4Rbe34OjP0NJmIPk9YhxEYxW80c/26E8OEZbGLBKMR3NsiHzmhgZ4pljhptQ==
X-Received: by 2002:a1c:ab84:: with SMTP id u126mr8754426wme.43.1594210092387;
        Wed, 08 Jul 2020 05:08:12 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id j24sm6201512wrd.43.2020.07.08.05.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 05:08:11 -0700 (PDT)
Message-ID: <1f6807cd44de94bcf6d9d4eb47a29a3fa3861893.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] rootfs-post: add sanity check for ROOTFS_POSTCMD
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Konrad Weihmann <kweihmann@outlook.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 08 Jul 2020 13:08:10 +0100
In-Reply-To: <AM7PR05MB6881E32F96C6B2D662250CFAA8670@AM7PR05MB6881.eurprd05.prod.outlook.com>
References: <20200708110936.17099-1-kweihmann@outlook.com>
	 <AM7PR05MB6881E32F96C6B2D662250CFAA8670@AM7PR05MB6881.eurprd05.prod.outlook.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-07-08 at 13:09 +0200, Konrad Weihmann wrote:
> It warns about trailing blanks before the delimiter, as otherwise the
> task can't be removed properly
> 
> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
> ---
>  meta/classes/rootfs-postcommands.bbclass | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
> index 984730ebe8..e33715f016 100644
> --- a/meta/classes/rootfs-postcommands.bbclass
> +++ b/meta/classes/rootfs-postcommands.bbclass
> @@ -57,6 +57,14 @@ python () {
>      d.appendVar('ROOTFS_POSTPROCESS_COMMAND', 'rootfs_reproducible;')
>  }
>  
> +addhandler rootfs_postcmd_sanity_eventhandler
> +rootfs_postcmd_sanity_eventhandler[eventmask] = "bb.event.RecipeParsed"
> +python rootfs_postcmd_sanity_eventhandler() {
> +    for x in (d.getVar("ROOTFS_POSTPROCESS_COMMAND") or "").split(";"):
> +        if x.endswith(" "):
> +            bb.warn("'%s' ends with a blank, making the task unremovable" % x.strip())
> +}
> +
>  systemd_create_users () {
>  	for conffile in ${IMAGE_ROOTFS}/usr/lib/sysusers.d/systemd.conf ${IMAGE_ROOTFS}/usr/lib/sysusers.d/systemd-remote.conf; do
>  		[ -e $conffile ] || continue

I think this belongs with other sanity tests in insane.bbclass. I'd
prefer not to have another event handler in the system just for this
(they're high overhead).

Cheers,

Richard

