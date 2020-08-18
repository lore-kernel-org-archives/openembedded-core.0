Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.76105.1597785204196675830
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2020 14:13:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IqkB2TFC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id a5so19547998wrm.6
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2020 14:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=49bO7/6IMW4pbBE/w3hZnxGUA0EZnxhZdNCLIk+0Z7E=;
        b=IqkB2TFCxdpgt0QUoc3+qd35vwBCceSYENSuQDpsQjoNRJY0J9oBVrbr0pWv7StW3C
         /hVblF0cne/sb99TIgs3PU/l5MSoGUSePoEjVB83bsZxEwxNipZD53I/fGJmwdsA8KZs
         UUrDVbqiNNHNq2kygZK7R4CRdolBCP3wFN61M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=49bO7/6IMW4pbBE/w3hZnxGUA0EZnxhZdNCLIk+0Z7E=;
        b=PUFv7bua5RTQNkuBIia4iayyctzOsEkBXU3ncCQcFaHS078xIqRvOoKG+Y/sjrZElV
         NW/4lSPZpfdgJJ/XHIsWhnJbOHwTR60S3gtX/Ptat9w5mCKRpilxH6Kr+9CVHaKdZhRr
         tNabBMTBkNaqppCz7rQgRi+8mwiHnjx8VdsYVTSgdKvaYbdHw/NVAusR6OAzd0xjuqK3
         n+tnS0BWp2R8OQ+bWNssn8FNce/NPKcln/W1MG8x5B4FSaywcmBHyBZBWOhLopqPjQJm
         T6JfrPgHm/3SNSC0GAJULpWhEK+uhj+EMJvEjnQvvsM9grRFzDCVedVdV9m7JvrpX6N5
         +/UQ==
X-Gm-Message-State: AOAM531rcLxwqlfdNyHSkMSJ/cx6AGVpHWZe6TbbmyzvbWNGVHbJVVka
	Vmu0RnQgbLGXCD9nphNpzyrEzQ==
X-Google-Smtp-Source: ABdhPJyEbt0QXeHobzpoevkojDXYf7Enwe1G/LirJ1OvzfCCbaS/WoAKowi8V2KCa+PADgI87tfo3Q==
X-Received: by 2002:adf:f011:: with SMTP id j17mr12697212wro.335.1597785202527;
        Tue, 18 Aug 2020 14:13:22 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 5.1.6.a.8.6.d.2.a.6.c.7.8.2.0.5.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (5.1.6.a.8.6.d.2.a.6.c.7.8.2.0.5.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:5028:7c6a:2d68:a615])
        by smtp.gmail.com with ESMTPSA id w1sm1570059wmc.18.2020.08.18.14.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2020 14:13:21 -0700 (PDT)
Message-ID: <feb25d5d3f2e852f947d97c770b742c79731c089.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] connman-conf: make connman-conf only available for qemuall
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Li Zhou <li.zhou@windriver.com>, openembedded-core@lists.openembedded.org
Date: Tue, 18 Aug 2020 22:13:20 +0100
In-Reply-To: <1597729301-189377-1-git-send-email-li.zhou@windriver.com>
References: <1597729301-189377-1-git-send-email-li.zhou@windriver.com>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-08-18 at 13:41 +0800, Li Zhou wrote:
> connman-conf is only for qemu machines, so use COMPATIBLE_MACHINE
> to limit that it is only available for qemuall, or else it can be
> built successfully without the package connman-conf generated.
> 
> Signed-off-by: Li Zhou <li.zhou@windriver.com>
> ---
>  meta/recipes-connectivity/connman/connman-conf.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-connectivity/connman/connman-conf.bb
> b/meta/recipes-connectivity/connman/connman-conf.bb
> index 9a519ec..3a6c525 100644
> --- a/meta/recipes-connectivity/connman/connman-conf.bb
> +++ b/meta/recipes-connectivity/connman/connman-conf.bb
> @@ -34,3 +34,5 @@ do_install() {
>  }
>  
>  SYSTEMD_SERVICE_${PN}_qemuall = "wired-connection.service"
> +COMPATIBLE_MACHINE = "null"
> +COMPATIBLE_MACHINE_qemuall = "${MACHINE}"

How was this tested?

The autobuilder goes red with things like:

https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/2345

Cheers,

Richard

