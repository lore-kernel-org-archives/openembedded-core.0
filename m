Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.6448.1615891658924298255
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Mar 2021 03:47:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PzyLMdzg;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: max.oss.09@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id j3so20913763edp.11
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Mar 2021 03:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=w81TVoKIGfKJh6gR97Ya535YEp4a/1gQNmTgECYHQio=;
        b=PzyLMdzgHmqP3DCr0Dc7FlQSMD0aNoucFEpMhsxP4ydlXe+wtbei5uiiB7Kis+9cV2
         wsnp0Pngh22oMKhtVzJqksiwfPCjB4wnyVpHWDFV3aiihG/UabpXZmI7O1JAv6+MuVin
         /1sj+hplGYi5dp6TYLsgXlXd6Y5/fGli8tzc8goaLGHFiCpM40/ShB2G3On32jElDMsl
         4joJItwBEYrGYuIBGYEZxQKRPf2LerdSrxjawlFRU9+5TXlVZZYesGVvYWsWHAjUuolc
         gZWh1qz7Bp+ilb0jvqUh1oP36glB2gRDGoieb+lDIn8hZTSa48Rk0J14k63lpgihkDa4
         vfWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=w81TVoKIGfKJh6gR97Ya535YEp4a/1gQNmTgECYHQio=;
        b=HtF8ArcUYWMjZn6ibj2gkfIF8m2pRVIiUvuKqjFfOm++qJA4Y2xEJj0c4QFquA7432
         z4GitAaTzd/Qz37HmLRekz3Ub1pjfFVD7VbW3f0fY3wbYQteenJDLYaQaSVigWg1hMcX
         riUzLsbhERPu9hloyx0abjDh25bsXZvCEGyei2ac9OtLXSshPJyf/22Q9FH5TGPtMc8G
         jbLeFBks7GA/r9KeGaXmyvAre/ZDl5RtO2KWVZlKoOnHI59LaenzCt9QVExcjlmBfFcq
         +91d6qleUqRCfVPN/+Z1Meeb2zQgDVLzSYfI1F6xINKW//WHILqPS5cczGn4WnW+ndxM
         qqWw==
X-Gm-Message-State: AOAM533KS2Rwbch9encNy02+p5UtPEHpdaYuHoF+vUcIn2dLX9A6k1AY
	RhDQYA2Hz0UNfqn3Im3JPy8=
X-Google-Smtp-Source: ABdhPJy1mLC+2EEgNUBc2s4xAHeVjCdr7BJNiOFlmgt4RtXGzJSo1EoNnP0hGAWGuyZMqMdK2jcnEQ==
X-Received: by 2002:aa7:c4cc:: with SMTP id p12mr34439884edr.325.1615891657280;
        Tue, 16 Mar 2021 03:47:37 -0700 (PDT)
Return-Path: <max.oss.09@gmail.com>
Received: from Saturn.fritz.box ([81.221.211.103])
        by smtp.googlemail.com with ESMTPSA id bx2sm10143845edb.80.2021.03.16.03.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 03:47:36 -0700 (PDT)
Message-ID: <6272b57339e51667b691af97acb70435811e5083.camel@gmail.com>
Subject: Re: [OE-core] unwanted linux kernel image added to /boot directory
From: "Max Krummenacher" <max.oss.09@gmail.com>
To: scott.branden@broadcom.com, openembedded-core@lists.openembedded.org
Date: Tue, 16 Mar 2021 11:47:36 +0100
In-Reply-To: <510db8eb-fcb2-ca15-3813-b3d52e51fce6@broadcom.com>
References: <166CA878538D6557.30053@lists.openembedded.org>
	 <510db8eb-fcb2-ca15-3813-b3d52e51fce6@broadcom.com>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi

Am Montag, den 15.03.2021, 20:13 -0700 schrieb Scott Branden via lists.openembedded.org:
> It appears that inherit of the kernel_do_install routine is called which causes the linux
> image to be installed in /boot.  I added a quick and dirty hack to inhibit this behaviour.
> Could someone please comment on a proper solution:
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index ddff2ddcd2..527f6ca85d 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -428,7 +428,9 @@ kernel_do_install() {
>  
>         for imageType in ${KERNEL_IMAGETYPES} ; do
>                 if [ $imageType != "fitImage" ] || [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ] ; then
> -                       install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType
> ${D}/${KERNEL_IMAGEDEST}/$imageType-${KERNEL_VERSION}
> +                       if [ "${INHIBIT_IMAGE_IN_BOOT}" != "1" ] ; then
> +                               install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType
> ${D}/${KERNEL_IMAGEDEST}/$imageType-${KERNEL_VERSION}
> +                       fi
>                 fi
>         done
> 
> 
> On 2021-03-15 4:39 p.m., Scott Branden via lists.openembedded.org wrote:
> > Hello,
> > 
> > There seems to be a problem when a kernel module is added to an initramfs image.
> > 
> > As soon as I add a recipe which installs an external kernel module into an initramfs image it
> > automatically installs the linux kernel image in a /boot directory.
> > 
> > This is really bad as it increases the size of the initramfs image.
> > 
> > /boot/Image should not be installed in the image when an external kernel module is added to an
> > image.
> > 
> > Can someone suggest a fix to this issue?
> > 

One usually does in the machine configuration:

RDEPENDS_${KERNEL_PACKAGE_NAME}-base = ""

Max

