Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web10.164.1614796086789157268
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Mar 2021 10:28:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=GTwTj0b/;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.177, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f177.google.com with SMTP id t4so6900449qkp.1
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Mar 2021 10:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TRelsUHPhVtPxr1fEPdx9Hofgo4PdWln+0n0XHb6JYk=;
        b=GTwTj0b/W+SL/GB4dphkoSflbbK7hWj8qgUkYR0v18sxjyd+nKLD/2KxhGCGxshiNQ
         m2w1uBtuDKukQf8Gk/lcYYVFnuZlFzyY3hOVyY1y2c1o/QbB7RDWRUnMP07Y2nA6e8Yt
         XEyAkggrBRJYZ6dp0J9GqWm34SSHwTu7NXS7svzjeEKwhSx9VbW+Q2zsll/MG4C2EzR/
         h/ZzVt+sQqDLhoFd5Yzeh9wVA1KO3ZU99Vn+QYUHVFUTUNUBjbcW4Fx8XoexyXK9Qz0/
         Kda0SfX5wPI2FQwEXMnh50R91mShIY6u0X5Q2/zloJLhYwGAcYVF2y09Vshizcpqr+MH
         UtPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TRelsUHPhVtPxr1fEPdx9Hofgo4PdWln+0n0XHb6JYk=;
        b=oFgL8hl/cb9oo5gM6QpmOSOmjDPSCtr9vkkwmh4nnXCUA4Yb8MfJOgZoLss03uIUO3
         JiU+w8eB0Xr5/zc06EOAt4bMkqQH6uCS0O3ZfGTy9R7u1irDFBTCHxuo38dtdTuWvGpE
         MRGLKy7oO3Nzj17C50T6BCguv5657RB5cCHQGIQxZZ5wQSN+1haqRpEjwfuEP2RhLE71
         5KMISsgHXStZVgStjOoO13donM4uKcRI5044VPIdRUmqgU0F0ip/B4thzmF59c8aILte
         XFEEt0PoFTfhul6GpR0U8LZGKYOiaayKOaZb/svYFwhdovibrpF1D0fPDUs4jBOx3/s8
         AqCw==
X-Gm-Message-State: AOAM530sujZ0pFIAd1m5/GhtdlbOEzu1pmBRgZSLAjLklrDjMiIXDcR3
	fF4ljdMZF+zTis40qDWVRMfJbqsiG3wcBb6Jd0cr1g==
X-Google-Smtp-Source: ABdhPJySaAv2tE3u0jj/8Sbfm2/D94H8SD71uqasY82lSoZyHqyRfT0h/KOLgksDj3P4VOg78rNt2UfRTbqebNDweDg=
X-Received: by 2002:a37:8606:: with SMTP id i6mr300062qkd.130.1614796085820;
 Wed, 03 Mar 2021 10:28:05 -0800 (PST)
MIME-Version: 1.0
References: <16689B45EDE8164B.17298@lists.openembedded.org>
In-Reply-To: <16689B45EDE8164B.17298@lists.openembedded.org>
From: "Jon Mason" <jdmason@kudzu.us>
Date: Wed, 3 Mar 2021 13:27:54 -0500
Message-ID: <CAPoiz9wLAh6pNThkbXckcZKtL76Cy46EfhKqGXqseBLUe6ZPOA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] runqemu: use "raw" instead of "bin" for ovmf
To: Jon Mason <jdmason@kudzu.us>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, Jon Mason <jon.mason@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 2, 2021 at 1:53 PM Jon Mason via lists.openembedded.org
<jdmason=kudzu.us@lists.openembedded.org> wrote:
>
> From: Jon Mason <jon.mason@arm.com>
>
> bin is not an acceptable format for qemu and will throw an error is set.
> The correct format in this case is raw.
>
> Signed-off-by: Jon Mason <jon.mason@arm.com>
> Change-Id: I9d78e356d39ecb15bef886c19870b029d9badd65
> ---
>  scripts/runqemu | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 532f2e338d52..392576bf4997 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -1345,6 +1345,8 @@ class BaseConfig(object):
>
>          for ovmf in self.ovmf_bios:
>              format = ovmf.rsplit('.', 1)[-1]
> +            if format == "bin":
> +                format == "raw"

Well, this is pretty stupid of me.  v2 coming soon with actual
variable assignment!


>              self.qemu_opt += ' -drive if=pflash,format=%s,file=%s' % (format, ovmf)
>
>          self.qemu_opt += ' ' + self.qemu_opt_script
> --
> 2.20.1
>
>
> 
>
