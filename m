Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web10.18089.1593597266539987054
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2020 02:54:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ap954UhL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id j4so20685215wrp.10
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2020 02:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=giGSptTq7BlyU00vhF6N/Fn/2I6LrzYGuaJk6r7QFyk=;
        b=Ap954UhLLgqk3yRRPHicKx0z8iEYaWlK0B1CnqHO3rNnpy/Z4pcNrC0Nrq4ff89tPH
         PzY3fbxYQESb6g9Q8f3mk7yxZRZKfZqcF/XAhGUsFBG3QfVQjoXPF7e3pDzhk/fOkz6n
         VP6zYtbn/7jVaQR41MEXueyp5b6h3JgawU6TQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=giGSptTq7BlyU00vhF6N/Fn/2I6LrzYGuaJk6r7QFyk=;
        b=bey+8fo0GdcDrdXRpVqsxHkEeGTCP6GaQ1VLJL2xrVceJNmM25jXjGl+eYzkDleYzc
         DtPUcUx76VrsXdCD0svBlAvq3HSM6Xxm+z5Xr0Yp+ZLa5y19tCcE2iIrh+En8KWCNp4/
         mzm0u7hFv4S1f8EhpGEXR4FZKWMa4WRaD16907j0D2hw9lHuOMFJeAStcR8Pej19KQSu
         uNZeFtHImmzeBn4Ar7KeDQpEh3b1AWmArrPTOTsjx9/ZFCyGrvWAUv/KdX+o5b+YkNak
         GcdJKGt51pQ+TQQ4eA7uWRLa/osvI6yroSqBudcyqnUHwBdg2evBx2ckVr9DBtg3812o
         l/gw==
X-Gm-Message-State: AOAM532AgrzUlHeTYb2tdrJ92spRSyRwg1iyXSEPWtWcFeP54VbMNI/v
	usPBvpXrJvYl/6XXZOUW6UW+Ag==
X-Google-Smtp-Source: ABdhPJxDomzQBH9G0UM3hBsC8FBer7p4SK87LVPCbOSWNvLmgt3whJDQbHJ2c5j+JUF3R+uL/MYdyA==
X-Received: by 2002:a5d:6288:: with SMTP id k8mr25285932wru.373.1593597264997;
        Wed, 01 Jul 2020 02:54:24 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id u2sm6176959wml.16.2020.07.01.02.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2020 02:54:24 -0700 (PDT)
Message-ID: <8582c2499cba9467782c3e00822776a6c46f0845.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3] nopackages.bbclass: Get tasks from variable
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Paul Barker <pbarker@konsulko.com>, Fredrik Gustafsson
	 <fredrik.gustafsson@axis.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, 
 tools-cfpbuild-internal <tools-cfpbuild-internal@axis.com>, Fredrik
 Gustafsson <fredrigu@axis.com>
Date: Wed, 01 Jul 2020 10:54:21 +0100
In-Reply-To: <CAM9ZRVvdaVSghGzoFwy6vhHLhzHE-HatJpRwC6LxpuepO_pTxw@mail.gmail.com>
References: <20200701084634.11428-1-fredrigu@axis.com>
	 <20200701084634.11428-2-fredrigu@axis.com>
	 <CAM9ZRVvdaVSghGzoFwy6vhHLhzHE-HatJpRwC6LxpuepO_pTxw@mail.gmail.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-07-01 at 10:48 +0100, Paul Barker wrote:
> On Wed, 1 Jul 2020 at 09:46, Fredrik Gustafsson
> <fredrik.gustafsson@axis.com> wrote:
> > Get tasks from a variable instead of having them hardcoded. This
> > will
> > enable other layers to add tasks that should be deleted when
> > nopackages
> > is used.
> > 
> > Signed-off-by: Fredrik Gustafsson <fredrigu@axis.com>
> > ---
> >  meta/classes/nopackages.bbclass | 19 +++++++------------
> >  1 file changed, 7 insertions(+), 12 deletions(-)
> > 
> > diff --git a/meta/classes/nopackages.bbclass
> > b/meta/classes/nopackages.bbclass
> > index 559f5078bd..4c9fe510c5 100644
> > --- a/meta/classes/nopackages.bbclass
> > +++ b/meta/classes/nopackages.bbclass
> > @@ -1,12 +1,7 @@
> > -deltask do_package
> > -deltask do_package_write_rpm
> > -deltask do_package_write_ipk
> > -deltask do_package_write_deb
> > -deltask do_package_qa
> > -deltask do_packagedata
> > -deltask do_package_setscene
> > -deltask do_package_write_rpm_setscene
> > -deltask do_package_write_ipk_setscene
> > -deltask do_package_write_deb_setscene
> > -deltask do_package_qa_setscene
> > -deltask do_packagedata_setscene
> > +NO_PACKAGES_DELTASKS += "do_package do_package_write_rpm
> > do_package_write_ipk do_package_write_deb do_package_qa
> > do_packagedata do_package_setscene do_package_write_rpm_setscene
> > do_package_write_ipk_setscene do_package_write_deb_setscene
> > do_package_qa_setscene do_packagedata_setscene"
> 
> Not sure if `+=` was present in the previous versions, I only just
> noticed it now. I think `?=` is a better choice so it can be
> overridden easily. Other than that, this looks good.
> 
> > +
> > +python () {
> > +    list = d.getVar("NO_PACKAGES_DELTASKS").split()
> > +    for task in list:
> > +        bb.build.deltask(task, d)
> > +}

I'm just sad this is having to use anonymous python. Its slow and I'd
like to see less of it, not more, given people's complaints about
parsing speed.

I did make a suggestion about how this could be done but that isn't an
option. I might sort out such a patch.

Cheers,

Richard





