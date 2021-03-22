Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web09.1103.1616428465251259805
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Mar 2021 08:54:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iTTeeKf6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id j7so17692306wrd.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Mar 2021 08:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=dL/SSvO8WmmNhCkD7WR63RbJ3HC8yPh5Bkfe69RIexE=;
        b=iTTeeKf6WISnnczU8Oc2nTLsFnXTTROPwhUl3OPyNZXGx3PgrMJ8KUIZPiOTGadDEe
         icCcewvBYUmGnHi+IAU3pzCCjL8q3/kX57oFPtC0dgOVsPGP0ESKYYhQWExKbCDC+zv1
         vY9CGb0DnsYg8tLvwtvAyl+hkO2GI4VfjdH44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=dL/SSvO8WmmNhCkD7WR63RbJ3HC8yPh5Bkfe69RIexE=;
        b=NwsoSHz1hQOj3q1iYIlU/76dFk6Tf6AInM7mcu4mumktiRB8pbJ+TDRDqrBeguT6At
         5Dujdl+i6QU1y5A4wwulSri61ULrEVXcdEKUa84q5T0oHeoIqflzCwu3iRIO7ny5wAA5
         pJpoxoH2uZE+U1yIEZqKb+lJj8OuLMzNIGz0pCEaEK17VfNMlwJdcUiZIday4pVoCMxh
         4UwVafuSnZ6kjvoj/EEPYQTxhe20Bd9skcZ4NZuunbsLJe+Mz/birlIvj1nYNXHhXYD3
         k+Rrh0P6GO/6QlqaARg69T2PU5bJ3qCGukS/Uzf60kX+T2DlQyba947OBDvZugrOVZSo
         7H/g==
X-Gm-Message-State: AOAM533CSMiZ6J3glVMhAemCtWUgb3UT69uRSy0TUP28fitGTB86O/t2
	tLSKYuoZVPAGpMHkdLelXWZMaA==
X-Google-Smtp-Source: ABdhPJwRE/L/BtASiIaVS47sXCJLBu8Aacw2nAaKMHfNZK3ljhaCvFbV3z00K5vrWmMlVyzZT1f7gw==
X-Received: by 2002:a5d:5047:: with SMTP id h7mr186189wrt.111.1616428463701;
        Mon, 22 Mar 2021 08:54:23 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:5915:a721:ad3c:1822? ([2001:8b0:aba:5f3c:5915:a721:ad3c:1822])
        by smtp.gmail.com with ESMTPSA id g11sm19700343wrw.89.2021.03.22.08.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 08:54:23 -0700 (PDT)
Message-ID: <faa20b16d8ca099262b9ce720a0cc5768707c5ad.camel@linuxfoundation.org>
Subject: Re: [OE-core] [poky][PATCH] package_manager: install versioned postinst scripts
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: gmouse@google.com, openembedded-core@lists.openembedded.org
Date: Mon, 22 Mar 2021 15:54:22 +0000
In-Reply-To: <20210322154557.1591593-1-gmouse@google.com>
References: <20210322154557.1591593-1-gmouse@google.com>
User-Agent: Evolution 3.39.2-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-03-22 at 16:45 +0100, Anton Kachalov via lists.openembedded.org wrote:
> From: "Anton D. Kachalov" <gmouse@google.com>
> 
> When running on read-only rootfs backed with overlayfs, the processed scripts
> are being marked as deleted on upperdir of overlayfs. When it comes to
> upgrade the main read-only image, it might contain new postinst scripts that
> are different from the already processed. Introduced suffix (sha256 of
> the content) allows to distinct updated scripts of the same package.
> 
> Signed-off-by: Anton D. Kachalov <gmouse@google.com>
> ---
>  meta/lib/oe/package_manager/deb/rootfs.py   | 11 ++++++++++-
>  meta/lib/oe/package_manager/ipk/rootfs.py   | 11 ++++++++++-
>  meta/lib/oe/package_manager/rpm/__init__.py |  4 +++-
>  3 files changed, 23 insertions(+), 3 deletions(-)

Isn't this working around an issue with overlayfs?

I'm a bit worried we're adding complexity to all users of the project
for a very specific use case where the issue is really somewhere else?

Cheers,

Richard

