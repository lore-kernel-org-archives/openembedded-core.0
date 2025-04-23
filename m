Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41075C369D1
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 13:33:47 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.8846.1745415217145957815
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Apr 2025 06:33:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=vfihbCwt;
 spf=pass (domain: linaro.org, ip: 209.85.167.48, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54d6f93316dso5325989e87.2
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 06:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745415215; x=1746020015; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kG5ztGI8dPx7CqW3z6cj+tZZyEZHjL42axwvL9r+Q84=;
        b=vfihbCwt1s0n70NmhZstzjY2Enw519iEi0qYUjuPIo23vV9fxiDcp7gs3Euv62I1eg
         jns0zvWxuJYI+HzDUGUtIZ6uFvHH5J6QqOnirpS+9YV/zii+Hh0BS4EJ4Brr+GPbQS1k
         7uOvs1gFDEdNH+WOG1UBJXZesIZrhZqtEbk/KTyToo0ei6OwwNdV1OZ2yWLOnhyEGwz3
         +3+ZVLoIySQakkn7qV6COjhpE9h1U5x/fhbc/VlhRVyCSA5XK0kb7Fhk0gXTnCDn+P5V
         2zv+TMVB0GKcL7Bt9siCUlaapyWIB9/iHOc+4rGQMeXem6Yglob4mnsUTy87sJnqTK5W
         2Wkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745415215; x=1746020015;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kG5ztGI8dPx7CqW3z6cj+tZZyEZHjL42axwvL9r+Q84=;
        b=jDK9nS0u8qg81qigiut3l6xu2DssUQw0SmA3g4QLDUGygNbn4djYHUdeKtB2ujRHiY
         RFT3ilGdlMQZQKl82Kf777utk2m+p6Sxg81fhW9acnUH6k1U99PdoJ21AfgOMeA/glXw
         jVZF+4aTyabuy/965yhOKCcQM+2k/PgmzJqBlb0wVdJ6IsV/p4eosPQT29nkot0eOCXX
         5D3auVGNxsiLrcHlXzDRiY+RimMQwyKde/FJ2Np/bnjLh0hGE4B6TKHY+2gXvu9NnkPk
         oq5d46EhLgIyOXe++tIMtmTsujQFG2bNE/foZYyInKBB5B1Vp66s5u6s5gAYtUSSI5iN
         ZaGw==
X-Forwarded-Encrypted: i=1; AJvYcCUNPeRLEJ3KG6D1K7QuwcMQ2jkZ//7E1hB9t23RtHlTbwn0lUWePRv9KCtYdMm3jxR05T59Wx19ASKdcJut7saugQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwffbH1u9vDk5ENq8SgfRgwxIxVHhjrvtI29BEub2B8v00nDg37
	S/NZR5iO2vIVa7BoYhUbxFYBHYFhP9Gi+12218mX4VXTZVaTThovz0TqkINEnM4=
X-Gm-Gg: ASbGnctZZt/rqGt9KdEvO2GKalVI3sk6PZ/IfHYE4qDXlfzKKX/Mn4jDVgvzVcPcp81
	muCPyUtY2LJWw2sM+0egRQ65H1/y8qlAt8Ruj423oUAhLgYYF+xPZuUaDS4cbcqQtU8LtyztoQt
	dwkLhpQSG0/2JzqXYaq+4FCCoUbJeS/hYPheDGwLCsN9loseMDv4F7nuP+dbB7pUrHygGUrFcz2
	egv8Xcgeh7K77ijTt3BqwmBqeuB67D7doWFvYQgzmdajWltYG4UdRFSiteKtT9KS82AyCDLp7IG
	Y4xlFbxzKLqWRw7JoGTGFB1D5/GpZjQ36GD2Wg6M0O66OnyyqKzdob7gq2pJq4VMLE3goTHETw=
	=
X-Google-Smtp-Source: AGHT+IF07byGNPBtovucqBkKEFSuG1pofC+cei2B2cQqS/vtSoJDxVTsFVDdaZpfcEKErDJzibR1Eg==
X-Received: by 2002:a05:6512:1323:b0:545:f4b:ed66 with SMTP id 2adb3069b0e04-54d6e62b716mr4981562e87.21.1745415214923;
        Wed, 23 Apr 2025 06:33:34 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e524415sm1523273e87.19.2025.04.23.06.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 06:33:34 -0700 (PDT)
Date: Wed, 23 Apr 2025 16:33:33 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Ross Burton <ross.burton@arm.com>,
	openembedded-core@lists.openembedded.org, bill.mills@linaro.org
Subject: Re: [OE-core] [PATCH RFC walnascar 2/3] systemd: always depend on
 the explicit serial console units
Message-ID: <aAjsLQh0-cQsjpKT@nuoska>
References: <20250422190053.3244331-1-ross.burton@arm.com>
 <20250422190053.3244331-2-ross.burton@arm.com>
 <1838EE88B5ED2807.22956@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1838EE88B5ED2807.22956@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 13:33:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215308

Hi,

On Wed, Apr 23, 2025 at 02:18:42PM +0300, Mikko Rapeli via lists.openembedded.org wrote:
> On Tue, Apr 22, 2025 at 08:00:52PM +0100, Ross Burton wrote:
> > The systemd-serialgetty recipe generates explicit units for consoles
> > that are defined in SERIAL_CONSOLES, and if that variable is not defined
> > then just produces an empty package.
> > 
> > Even when systemd has been configured to use the getty generator, if
> > there are explicit consoles defined then we should respect them.  Don't
> > conditionalise the dependency on systemd-serialgetty so that we always
> > pull in the explicit consoles.
> 
> So all boots of genericarm64 on all HW now wait for the configured
> SERIAL_CONSOLES timeouts.
> 
> How should that be fixed? Unsetting SERIAL_CONSOLES in genericarm64 machine config?
> So systemd-serialgetty is allowed to be machine specific but not systemd itself?

To fix the "poky-altcfg" distro or "poky" with systemd boot slowdown on genericarm64,
systemd-serialgetty should either be removed or see an empty SERIAL_CONSOLES set currently
in the machine config.

A genericarm64 machine specific bbappend could do this, or in genericarm64
machine config could have:

SERIAL_CONSOLES:poky-altcfg ?= ""

This sets for all which may break some other things so maybe it's better to do this only for 
systemd-serialgetty in machine config with:

SERIAL_CONSOLES:poky-altcfg:pn-systemd-serialgetty ?= ""

This would not work for plain "poky" distro if someone enabled systemd as init.
For that, something like:

SERIAL_CONSOLES:pn-systemd-serialgetty ?= "
    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', \
    '', '115200;ttyAMA0 115200;hvc0 115200;ttyS0 115200;ttyS1 115200;ttyS2', d)} \
"

These either make SERIAL_CONSOLES depend on "systemd" in DISTRO_FEATURES inside
machine config, so I'm not sure if this is allowed or not.

A genericarm64 machine specific bbappend to systemd-serialgetty to disable the
package or clear out SERIAL_CONSOLES is "systemd" in DISTRO_FEATURES would be
better then?

systemd would remain machine agnostic but systemd-serialgetty would be machine specific
since it takes SERIAL_CONSOLES as input anyway.

I can't decide between these. :/

Cheers,

-Mikko

