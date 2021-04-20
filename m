Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web09.3027.1618952553932927002
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Apr 2021 14:02:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ctcdXBvN;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id i11so13849416qvu.10
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Apr 2021 14:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ukev08Rq4mfzYE1IUPoVmF0quOzCU/KdfwhKkuBmKvM=;
        b=ctcdXBvNMgQCjI/pe2D/jBr+9ClKMbwzpiAmEZjYH7D4KkJx3c1R9C5Z13HOo0JL1W
         Ab3i7L4Y1SO9BgCe7BFvJGt4wxcjYwYy2huH6nSARSPq1FrKM7aMGjWcSDXu2EMYdsyG
         Yr7YgPAH6wocv6jM5WibXJqMLnHyf7k3JQhz7dyjkFjeaMVo+rfMtuAvWXS36j6o1Mf6
         xnDGWKNa8as+d2uN50czr+93aOqnaO8Qk8jWM+AvdGSfZ89hz3ItK+lhV6gbBOvkf0D/
         PVN03JZ6jP3AOr16NJ+UZzVWJbvVTXteFfDg8G+25fggdIc7Jm2bhTwAXsEO/GAbxhzb
         BFQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ukev08Rq4mfzYE1IUPoVmF0quOzCU/KdfwhKkuBmKvM=;
        b=ezGv4wSw/yjWgpPps/C3JeLohR1YoCNScaCCGRtTDHou0GFsWLkJvldnrSgDUDPHlD
         RuSeg5khFkKV5udsJ7ehX+BUVcURoBoqTA4CqiGkLwZef7/yi92kEN9ksw47yknrkYUY
         ve+vLxK/Beb3qmLLYomOg4iA1Y5fmqGdTPfiQ+IXE4Mw7CpfrnD3uFOMKDg3pQC1kZ0v
         ji9JFGF1xTpxoeQMJom8dhE7QjBm3aB3BpQV6kFqSeYw7uQbmrCl+yY0fFOOMtfOv7kz
         eE0A44edjrNEPZv0mDS2JI5p5/KJTnOe/gSOPg0Z028xXKW9gy0OzUlpjiPyHh/gndVj
         6vtw==
X-Gm-Message-State: AOAM530NVi13i2mPVRhYjiIzOsuYKpGo4NLmA9iBrVE18yGNQ2u2ePrv
	UEzrBCLy0GDm336PqbWXEeXZqIssXm7ZRcmgGj4=
X-Google-Smtp-Source: ABdhPJwahHxB2c/EWPaoo/Zdi+CslbAdeSqikpRlQrOOnizowwww1109WtokH3ycKa8ET9ilShvyev80yodWW3IbbCI=
X-Received: by 2002:ad4:5be1:: with SMTP id k1mr9913495qvc.55.1618952553121;
 Tue, 20 Apr 2021 14:02:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ86T=XGxEyZYc7pH3Me1_Cx+H1+OAjNjo45veLhyPFv+eEWsA@mail.gmail.com>
 <1397.1618951559627472345@lists.openembedded.org>
In-Reply-To: <1397.1618951559627472345@lists.openembedded.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 20 Apr 2021 14:02:07 -0700
Message-ID: <CAMKF1srY+jdGLStTe6uemdubxvB9VnDwpkhtt=QuN8mLa8+GSQ@mail.gmail.com>
Subject: Re: [OE-core] [yocto-security] [PATCH] busybox: use openssl for TLS connections whenever possible
To: Shachar Menashe <shachar@vdoo.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 20, 2021 at 1:46 PM Shachar Menashe <shachar@vdoo.com> wrote:
>
> Last time we talked about this I thought we would need to change something in openssl build settings to make the openssl binary get built just for this solution, and that was what got rejected.
> But actually now I see (or perhaps it got changed) that the openssl binary is built anyways, in any build that already relies on openssl.
> So my suggestion is to enable this feature. Like I said in builds with openssl it will make everything more secure in a transparent manner, and in builds without openssl it will display a warning just like today.

How much does busybox size grow with this? I think we will have to add
openssl dependency on it, or else default wget behavious will be less
than ideal. right now perhaps using gnu wget is a standalone solution
but I do understand that it may not be usable in some cases.

> I wouldn't consider it a hacky solution since this is the official solution for this issue.
> This is also exacerbated due to the fact that there are no other alternatives for secure download from CLI (ex. the sato build doesn't contain the "curl" standalone binary)

certainly, add curl to default reference images would be fine.

> 
>
