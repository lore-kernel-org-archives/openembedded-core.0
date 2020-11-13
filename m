Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web11.5112.1605278088411293752
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2020 06:34:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=U5KHvqZm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id c9so8321490wml.5
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2020 06:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=Ql6CZMXVC8PvfecbP/S/Q2Qeld5hHq3+JHs4eG+XwdE=;
        b=U5KHvqZmx0V1wAjMmBdS4mkMbWBA4VRougIbZqKRdR0ifn2yAAansOxrpbvlWVJKE3
         x/NCSUSjTgNiqICNznrscbHa3SwxjOeTxHexQMx3N3sJ2tOa5Y0IXuunQnRgmSJfP6q3
         RZMFMqzqsJ2wkQ9l+lzAciDlVq0fTJ7R2lLKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Ql6CZMXVC8PvfecbP/S/Q2Qeld5hHq3+JHs4eG+XwdE=;
        b=ZbpXd08eKokW/Pcfk0LaKQEiphWmIVu3zQGv5CeEDydcZBHT2YnRXatY6cd7XXmxsI
         MGUZbtbb6aXa2FV7JN+fFS0uHnYJqLxx/lRHIk0cvOC5wck4yZqI/SG0zAo8hDqS+1Q/
         8XlPgAZzoyZDho+EdfMhz+M7os5GwHT7/vvu6WltionOmrk60ZCesz3AW6zmmn6etizB
         1TlXvLAMnTehVvZ0ThqoLCHysy4jPtYVOyluVugh7KWy4TdSs3bI+XBzxW9vIpo2tjbi
         L2eSumX9wb4CSwTHZpPtZPtkjVV/oClCdKYmbUTFRloA7o+RlvVL7fijfLnt+1L5woEL
         SHuQ==
X-Gm-Message-State: AOAM532fHzN83T7NFiu5S8pVtDzE7QTfEgZlGOJklYETR7heWnlez7Fg
	ykysIrsBHqyDPMl5L8ZZZjD+xQ==
X-Google-Smtp-Source: ABdhPJzW+apMV3iFqHCRrnU7joK1me/zTK3/lOoc4pUq/Wxc3QrzEzfBscVz8SXUD2FihJJhJhuvng==
X-Received: by 2002:a1c:c203:: with SMTP id s3mr2899252wmf.77.1605278086869;
        Fri, 13 Nov 2020 06:34:46 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from e.3.a.b.8.4.f.3.4.e.5.7.b.c.8.4.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (e.3.a.b.8.4.f.3.4.e.5.7.b.c.8.4.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:48cb:75e4:3f48:ba3e])
        by smtp.gmail.com with ESMTPSA id v19sm10150243wmj.31.2020.11.13.06.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 06:34:46 -0800 (PST)
Message-ID: <bb0f046569d419d636a6ca08be6b0b57fa64bfdf.camel@linuxfoundation.org>
Subject: Re: [PATCH v3] dbus: split -common and -tools out of main package
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: luca.boccassi@gmail.com, openembedded-core@lists.openembedded.org
Date: Fri, 13 Nov 2020 14:34:43 +0000
In-Reply-To: <20201113104755.1073202-1-luca.boccassi@gmail.com>
References: <20201102180559.1177417-1-luca.boccassi@gmail.com>
	 <20201113104755.1073202-1-luca.boccassi@gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-11-13 at 10:47 +0000, luca.boccassi@gmail.com wrote:
> From: Luca Boccassi <luca.boccassi@microsoft.com>
> 
> Certain config files and units are shared between dbus-daemon and
> dbus-broker (available in meta-openembedded), so split them out to
> allow installing dbus-broker without pulling in dbus-daemon and its
> dependencies.
> Stand-alone command line tools can also be used regardless of whether
> the buses are provided by dbus-daemon or dbus-broker, so split them
> out into dbus-tools.
> Finally, move the XML schema files out of the main package and into
> the development package.
> 
> All these changes follow the same pattern used by Fedora, which was
> one of the first distro to switch to dbus-broker by default:
> 
> https://src.fedoraproject.org/rpms/dbus/blob/master/f/dbus.spec
> 
> Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> ---
> v2: fix FILES_ regex to correctly include all units but the sockets
>     in the main package
> v3: do not use ${PN} in RDEPENDS, as bitbake expansion is broken and
>     generates wrong values (eg: dbus-native-common-native)

Without testing I can tell this will break multilib.

RDEPENDS and native are a little confusing and tricky, basically due to
legacy. This is why you'll see RDEPENDS_${PN}_class-native = "" and
that is probably what is needed here.

Cheers,

Richard



