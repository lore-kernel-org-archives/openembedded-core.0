Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web12.4410.1628255093521217439
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Aug 2021 06:04:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UDGBfISU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id m12so10974659wru.12
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Aug 2021 06:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=HrG9f1p2LrOwCE3uo3WR18hBkPikvtHlOHSUF0Gsprw=;
        b=UDGBfISUWnahxvkKcGV3azd6EIDa66VGDg9nNPeUpoiKnwAWlNdMnhvIq+jkk+vTiW
         GIo2n1Dw0PTHEcc4OmDoJgW6UsFNMLNb5WBP4rWagebojG/wFIqkD4SRoIcmR+IYiPAi
         D9JK1GhZ5tu8LatV7wBVPKkLuMDsFFdfQ6Ahc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=HrG9f1p2LrOwCE3uo3WR18hBkPikvtHlOHSUF0Gsprw=;
        b=A4XFlAZbzDKoiL1/Dvo6vQlT4yIJOLN4nPZYpIqR4JKok86JXmel8Zy+mAhRdgo9Q8
         b7rsbW2j4G0zOOP4L1E+7eBgiaEfK5lPd3mUzWeE+YYyweD3jMQj6ITVz8x1KfAF8XrB
         T/pW+87sutl4wp16eBozIYaJBhwgY7DaGGrOhU/ftm/EcxcRxUtcuYbtsK9U4FmPUQ6C
         VPDiMR8iz+V3K5Ast8Ly0iarImRZzS/85b/u2PiGdxERUa6+ct4x/Z2GK517vKZ3AWj3
         2hfw0isthUlDKd1uWfsEPIw2DeSeOI2XlkizBzae7f0LM7yZBDbQ4mBJfAH212xaHKjF
         YR7g==
X-Gm-Message-State: AOAM531N3AETLd42IOj1mf2oC9yerpMhKU6i2ciw+XD2gdbL42NzIWtC
	TiKUHYk5fv6KTRVshKzcu8gdvQ==
X-Google-Smtp-Source: ABdhPJy4aZXwMBDyOqJHOYzNUO7Q8qRPjaXfjupGSrR50IFGldN78NGafjbcK6cLsk2GjPFNFYbH2g==
X-Received: by 2002:a5d:6442:: with SMTP id d2mr10819323wrw.425.1628255091886;
        Fri, 06 Aug 2021 06:04:51 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:9b1a:3a88:2016:c4d0? ([2001:8b0:aba:5f3c:9b1a:3a88:2016:c4d0])
        by smtp.gmail.com with ESMTPSA id q9sm12083122wmj.2.2021.08.06.06.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Aug 2021 06:04:51 -0700 (PDT)
Message-ID: <8f124922d571cd303cc2a6f312e8c1168b53573e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v4 2/7] overlayfs.bbclass: generate overlayfs mount units
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Cc: "Yurkov, Vyacheslav" <Vyacheslav.Yurkov@bruker.com>
Date: Fri, 06 Aug 2021 14:04:48 +0100
In-Reply-To: <ac780428-cee9-c5b0-bec5-4e7578950c0b@bootlin.com>
References: <20210806120611.124246-1-uvv.mail@gmail.com>
	 <20210806120611.124246-2-uvv.mail@gmail.com>
	 <ac780428-cee9-c5b0-bec5-4e7578950c0b@bootlin.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-08-06 at 15:00 +0200, Michael Opdenacker wrote:
> Slava, Richard,
> 
> On 8/6/21 2:06 PM, Vyacheslav Yurkov wrote:
> > It's often desired in Embedded System design to have a read-only rootfs.
> > But a lot of different applications might want to have a read-write access
> > to some parts of a filesystem. It can be especially useful when your update
> > mechanism overwrites the whole rootfs, but you want your application data
> > to be preserved between updates. This class provides a way to achieve that
> > by means of overlayfs and at the same time keeping the base rootfs read-only.
> > 
> > Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> > ---
> >  meta/classes/overlayfs.bbclass | 111 +++++++++++++++++++++++++++++++++
> >  1 file changed, 111 insertions(+)
> >  create mode 100644 meta/classes/overlayfs.bbclass
> > 
> > diff --git a/meta/classes/overlayfs.bbclass b/meta/classes/overlayfs.bbclass
> > new file mode 100644
> > index 0000000000..8d9b59c9bf
> > --- /dev/null
> > +++ b/meta/classes/overlayfs.bbclass
> > @@ -0,0 +1,111 @@
> > +# Class for generation of overlayfs mount units
> > +#
> > +# It's often desired in Embedded System design to have a read-only rootfs.
> > +# But a lot of different applications might want to have a read-write access to
> > +# some parts of a filesystem. It can be especially useful when your update mechanism
> > +# overwrites the whole rootfs, but you want your application data to be preserved
> > +# between updates. This class provides a way to achieve that by means
> > +# of overlayfs and at the same time keeping the base rootfs read-only.
> > +#
> > +# Usage example.
> > +#
> > +# Set a mount point for a partition overlayfs is going to use as upper layer
> > +# in your machine configuration. Underlying file system can be anything that
> > +# is supported by overlayfs. This has to be done in your machine configuration.
> > +# QA check fails to catch file existence if you redefine this variable in your recipe!
> > +#
> > +#   OVERLAYFS_MOUNT_POINT[data] ?= "/data"
> > +#
> > +# The class assumes you have a data.mount systemd unit defined in your
> > +# systemd-machine-units recipe and installed to the image.
> > +#
> > +# Then you can specify writable directories on a recipe base
> > +#
> > +#   OVERLAYFS_WRITABLE_PATHS[data] = "/usr/share/my-custom-application"
> > +#
> > +# To support several mount points you can use a different variable flag. Assume we
> > +# want to have a writable location on the file system, but not interested where the data
> > +# survive a reboot. Then we could have a mnt-overlay.mount unit for a tmpfs file system:
> > +#
> > +#   OVERLAYFS_MOUNT_POINT[mnt-overlay] = "/mnt/overlay"
> > +#   OVERLAYFS_WRITABLE_PATHS[mnt-overlay] = "/usr/share/another-application"
> > +#
> > +# Note: the class does not support /etc directory itself, because systemd depends on it
> 
> 
> Many thanks for this new class and the corresponding documentation.
> Richard, I guess that's something we'll need to document in the manual,
> once it's merge, right?

Ideally, yes, correct.

Cheers,

Richard

