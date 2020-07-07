Received: from mail-vk1-f195.google.com (mail-vk1-f195.google.com [209.85.221.195])
 by mx.groups.io with SMTP id smtpd.web12.600.1594159079749966361
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2020 14:57:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UpuNACN+;
 spf=pass (domain: gmail.com, ip: 209.85.221.195, mailfrom: armccurdy@gmail.com)
Received: by mail-vk1-f195.google.com with SMTP id n137so9771026vkf.7
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2020 14:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J1g/mYAbazODNYz7r9F2vkaCgmTp//u+GfaLn0Tt3Nk=;
        b=UpuNACN+wBUcfZr5WIdj3OsZgeq587hRQeVdqHWeymIVhNKUUgUq5apxmI9wbDX5hu
         /yXYH4QNEP49taDSpqL/WEHY7V87PTtmy8UaM9Qd/GJpGUaSfrMVBxGhjzyWGlRMyI+Z
         09wq0giPM/jb5FtV/oLOgQdM6t8ExJW014UBaHBpM8xu7YBb+HtjaMZTMnOPVTfK4HsZ
         B7zniPcBUdgrf0z8t9bPp8juKl7qh9MEAj/9Ny09wMkbT+c0bimVFtSxe7DsCrF+COmE
         m1z33j23h/zVyJydGw7m60pzsRN+6UQbUveh+B96zxkQANSdi+dOrn3YzQCOddtG0Avs
         mqdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J1g/mYAbazODNYz7r9F2vkaCgmTp//u+GfaLn0Tt3Nk=;
        b=PckVvIXIxGHvjIy2HLO2kQr76/re13v86jm3wXhE9cptjv60DdijO1IYa73KECFHtS
         zYe3nuoF+Ds9Nni0ABKkQgpuHd0uQl0vwYw6Kx6Qt3zlp9sINbvA+Ik84Xox3iQGHZo2
         cSE5Uuj3mWWouSnA8jeIgGIxrbh8r436igOsbU9mzAthgIRAm0u77NSJdUtSL9xX4G4r
         eN9ya2DniIgul9TpXRmMkLHlWRM5HiN8FSiRAFClrsaAtTn8BgngBoWJFySQ9G1O+41p
         AE8GPDkuR4d+G/yiIzwAaWsYdlnCSkfX/ILNhddt9eA0+iSKQiI1nY0URoJhjUVi/WRu
         TL7A==
X-Gm-Message-State: AOAM531zf/xJ6iVDoKBUrIbzJK4F9CKHy6FRluTMgbeyGXiGiFh3lpaP
	ZveM0wzRR+vNhvQ+Rpi2W7nhSBdeL8ZtF7Fwr00=
X-Google-Smtp-Source: ABdhPJxi7l0bikWRDWCsO6yzQMseqrGBVbe1u/dymR7UJ1iHKKPgRTBL7EJTFjZ6mwk34swDEMSnTQW60xHZCyUs0SU=
X-Received: by 2002:a1f:1182:: with SMTP id 124mr24036802vkr.75.1594159078728;
 Tue, 07 Jul 2020 14:57:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200707092511.7781-1-timon.ulrich@kabelmail.de>
 <CAJ86T=XYCDAD1jG2JTODSc-Oz9JmpPeNd0jXg9aeJbo88pciWw@mail.gmail.com> <4380ad1a86fbdf5a181105226230089755dd6b6a.camel@linuxfoundation.org>
In-Reply-To: <4380ad1a86fbdf5a181105226230089755dd6b6a.camel@linuxfoundation.org>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Tue, 7 Jul 2020 14:57:47 -0700
Message-ID: <CAJ86T=XaD7SzRS_MBHmwJqEck7J0eE4N8f9iN6Xqbyu8XPUM8g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel.bbclass: make dependency on lzop-native conditional
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "T. Ulrich" <timon.ulrich@kabelmail.de>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>, 
	Timon Ulrich <t.ulrich@anapur.de>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 7, 2020 at 2:10 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2020-07-07 at 12:47 -0700, Andre McCurdy wrote:
> > On Tue, Jul 7, 2020 at 2:25 AM T. Ulrich <timon.ulrich@kabelmail.de>
> > wrote:
> > > From: Timon Ulrich <t.ulrich@anapur.de>
> > >
> > > a native lzop is only needed when an lzo compressed initramfs is
> > > actually present
> >
> > Is the logic actually that native lzop is only needed if an lzo
> > compressed initramfs is present AND and a plain .cpio or .cpio.gz is
> > NOT present?
>
> This patch improves things but as you point out there appears to be
> further room for improvement. Not sure how much more ugly implementing
> that logic would be and whether its worth it...

Then we should at least add a comment explaining the real dependency,
even if coding it is too ugly.

Alternatively we could simplify the code significantly and remove all
the -native dependencies by just stating that if you want to bundle an
initramfs then you need to include "cpio" or "cpio.gz" in
INITRAMFS_FSTYPES...
