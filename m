Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web08.10743.1603985545604821899
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 08:32:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=X7iz5Ko0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id i1so3280227wro.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2020 08:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=FPiIE74ySHCEURhpmMpeswM2DYPQR3zblTeZMa2BFEI=;
        b=X7iz5Ko0Aed3SnrS8tZABdHk70F/u4iOa2mjnkGrNmiV6d3V/8e8wrow9R5QaQ/lqT
         WpxYVUKYJoBEmYLN6nCSByl9LSB+22FnC5pUWjeeEqsNQqLPdvqoK8OFeDMadYzvJqNE
         UF8gEYdwj8RHNgunFQ576RqdPs4pKB+k676+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=FPiIE74ySHCEURhpmMpeswM2DYPQR3zblTeZMa2BFEI=;
        b=rQzcMUwDPJdiG22URD+Bcr8RUyiIWpXYWXMQIZGN5kUCTYIOOn5msBQ7CoFeL2Eo48
         VMREQ/T1IbRwSkI4PkjkSI3MvZ4pGM+Uu8fWeDQ7eBC6mwAnZGlsKBvWmXW7IcBGmE5G
         mZ3q58XV3t3Cs9xPTLKi3R/HpsYerk3d8LbjCDpV956BXsbwkoAuIm48IwMtk+MTGsCN
         tPyoWj93YJPEzydSePTV+W7yRrAcsfFB15j6zCvJ2Kr+Iw21jYBaCJ+7lOHLqQ47uI4f
         WZK9xbB783H43iGQy+IgpPMKB0RVEqlGr1k/HHhbuHuxCiVQ1p4zBUQAsiSomJlDZ0Ww
         ujuA==
X-Gm-Message-State: AOAM531kaz6AJqM3sexfDguvYzuZKrhXujv6c+/2qPyzRNMR8WPlRr7e
	9y/FhyWZfHEWFopBvYryDaI+Lg==
X-Google-Smtp-Source: ABdhPJzhnEyyuu14qsAt3JbBEkfqVXVrOve8yUySRNOlXpg6ZfnMV+1N0kzQW0EP0dG8gIjeBXT7dw==
X-Received: by 2002:a5d:660a:: with SMTP id n10mr2888398wru.59.1603985543929;
        Thu, 29 Oct 2020 08:32:23 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 7.7.e.c.f.b.4.b.6.c.1.d.5.8.1.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (7.7.e.c.f.b.4.b.6.c.1.d.5.8.1.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:b185:d1c6:b4bf:ce77])
        by smtp.gmail.com with ESMTPSA id r18sm6314981wrj.50.2020.10.29.08.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 08:32:23 -0700 (PDT)
Message-ID: <7ff661d33eefed532bff3a1509f23fa26cc289a9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v5 01/22] gstreamer1.0: Fix reproducibility issue around libcap
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 29 Oct 2020 15:32:19 +0000
In-Reply-To: <20201029142806.1830504-2-quaresma.jose@gmail.com>
References: <20201029142806.1830504-1-quaresma.jose@gmail.com>
	 <20201029142806.1830504-2-quaresma.jose@gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-10-29 at 14:27 +0000, Jose Quaresma wrote:
> Currently gstreamer configuration depends libcap and on whether
> setcap is found on the host system.
> 
> Removing libcap from DEPENDS and only use it when the 'setcap' is enabled.
> 
>     * capfix.patch
>       Removed as the same goals can be achieved only with the PACKAGECONFIG 'setcap'
> 
> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> ---
>  .../gstreamer/gstreamer1.0/capfix.patch       | 37 -------------------
>  .../gstreamer/gstreamer1.0_1.16.2.bb          |  5 +--
>  2 files changed, 2 insertions(+), 40 deletions(-)
>  delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/capfix.patch
> 
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/capfix.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/capfix.patch
> deleted file mode 100644
> index 7ca3d5ad4a..0000000000
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/capfix.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -Currently gstreamer configuration depends on whether setcap is found on the host
> -system. Turn this into a configure option to make builds deterinistic.
> -
> -RP 2020/2/19
> -Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> -Upstream-Status: Pending
> -
> -Index: gstreamer-1.16.1/libs/gst/helpers/meson.build
> -===================================================================
> ---- gstreamer-1.16.1.orig/libs/gst/helpers/meson.build
> -+++ gstreamer-1.16.1/libs/gst/helpers/meson.build
> -@@ -73,7 +73,12 @@ if have_ptp
> -     endif
> -   endif
> - 
> --  setcap = find_program('setcap', '/usr/sbin/setcap', '/sbin/setcap', required : false)
> -+  setcap_feature = get_option('setcap')
> -+  if setcap_feature.disabled()
> -+    setcap = find_program('dontexist', required : false)
> -+  else
> -+    setcap = find_program('setcap', '/usr/sbin/setcap', '/sbin/setcap', required : false)
> -+  endif
> -

I did have a question about this. I think the problem this patch was
fixing was that <PATH>/setcap was being coded into the headers and
hence the output regardless of whether setcap was enabled or disabled.
Since its looking directly at /usr/sbin/ and /sbin/, this made it
depend on the host system it was built on.

Are you saying that is no longer encoded in the output?

Cheers,

Richard

