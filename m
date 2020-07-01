Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web11.18121.1593598263529134795
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2020 03:11:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VNTEWSVV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id s10so23141109wrw.12
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2020 03:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=6FxugnHHI9Ndc5QUyGssj3TMl89GFgwJPPhSwlxQA1g=;
        b=VNTEWSVVYUE+Yi2JUvzhTLt36YXvCJokm6FekrjlnlziXb0fuKLVJa9Mxz2MId6+FX
         VMM5T4HIsnYAXYHNjWkcHP13KP1GBGGMmo75RwodBR0amyu+68ISZxBaLo4fCrnz6ilG
         +NCRgi95VgCvevQ/U6ZXqqIwCC5I0yLAmMdVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=6FxugnHHI9Ndc5QUyGssj3TMl89GFgwJPPhSwlxQA1g=;
        b=uFpKwYiDjkhmPjRcrBPcdw4BVUS4/bcYvaE9Kvk2dk6vM8J9kuHbyjl30+lG0y/AMY
         QGh2cj+J2g1IJvOjVWEIGaQ6WAujo1RIF13kiS/3Hft4k/d3cg7UrCvOWX9uxEjM0YTR
         L7PyfFLZags1NmrPNbkuO7FQqixdwlsbmTaAOicE0f6X/DXIAgaOCmHU6X+5T7WbA7EH
         XjsekpfurfqBNeVBE09JK0tsywRtpahvV0Ug4w1Xt09lWk7RMWY2xkPPwJnqFKwx0Nzu
         lGJq9G/k5BCZyURIfjNSwq0amlxyaN5aqfpjJxqgM1scKroKyFnChMarkU7DAVTr9dGX
         tb6Q==
X-Gm-Message-State: AOAM5312Vnb2QWxfDYnpX7Hapr95qjkReDUmPhFb2Y5AflxhlIXUvbBy
	eyTgnD/oFWr2Fdoqttgu6vEH7Q==
X-Google-Smtp-Source: ABdhPJx41oNQmCLEVl4g3LP+JAUhnesecMPIFx7oMVj2vxPcEoXyvQPz4UYRqM6gEVovFaoJco9Lig==
X-Received: by 2002:adf:db4d:: with SMTP id f13mr25678912wrj.336.1593598262034;
        Wed, 01 Jul 2020 03:11:02 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id m10sm6869502wru.4.2020.07.01.03.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2020 03:11:01 -0700 (PDT)
Message-ID: <fd625be34363324ec7c2841943a2adacd65789d8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3] nopackages.bbclass: Get tasks from variable
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Paul Barker <pbarker@konsulko.com>, Fredrik Gustafsson
	 <fredrik.gustafsson@axis.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, 
 tools-cfpbuild-internal <tools-cfpbuild-internal@axis.com>, Fredrik
 Gustafsson <fredrigu@axis.com>
Date: Wed, 01 Jul 2020 11:11:00 +0100
In-Reply-To: <161D98456D41D2FE.27211@lists.openembedded.org>
References: <20200701084634.11428-1-fredrigu@axis.com>
	 <20200701084634.11428-2-fredrigu@axis.com>
	 <CAM9ZRVvdaVSghGzoFwy6vhHLhzHE-HatJpRwC6LxpuepO_pTxw@mail.gmail.com>
	 <161D98456D41D2FE.27211@lists.openembedded.org>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-07-01 at 10:54 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Wed, 2020-07-01 at 10:48 +0100, Paul Barker wrote:
> > On Wed, 1 Jul 2020 at 09:46, Fredrik Gustafsson
> > <fredrik.gustafsson@axis.com> wrote:
> > > Get tasks from a variable instead of having them hardcoded. This
> > > will
> > > enable other layers to add tasks that should be deleted when
> > > nopackages
> > > is used.
> > > 
> > > Signed-off-by: Fredrik Gustafsson <fredrigu@axis.com>
> > > ---
> > >  meta/classes/nopackages.bbclass | 19 +++++++------------
> > >  1 file changed, 7 insertions(+), 12 deletions(-)
> > > 
> > > diff --git a/meta/classes/nopackages.bbclass
> > > b/meta/classes/nopackages.bbclass
> > > index 559f5078bd..4c9fe510c5 100644
> > > --- a/meta/classes/nopackages.bbclass
> > > +++ b/meta/classes/nopackages.bbclass
> > > @@ -1,12 +1,7 @@
> > > -deltask do_package
> > > -deltask do_package_write_rpm
> > > -deltask do_package_write_ipk
> > > -deltask do_package_write_deb
> > > -deltask do_package_qa
> > > -deltask do_packagedata
> > > -deltask do_package_setscene
> > > -deltask do_package_write_rpm_setscene
> > > -deltask do_package_write_ipk_setscene
> > > -deltask do_package_write_deb_setscene
> > > -deltask do_package_qa_setscene
> > > -deltask do_packagedata_setscene
> > > +NO_PACKAGES_DELTASKS += "do_package do_package_write_rpm
> > > do_package_write_ipk do_package_write_deb do_package_qa
> > > do_packagedata do_package_setscene do_package_write_rpm_setscene
> > > do_package_write_ipk_setscene do_package_write_deb_setscene
> > > do_package_qa_setscene do_packagedata_setscene"
> > 
> > Not sure if `+=` was present in the previous versions, I only just
> > noticed it now. I think `?=` is a better choice so it can be
> > overridden easily. Other than that, this looks good.
> > 
> > > +
> > > +python () {
> > > +    list = d.getVar("NO_PACKAGES_DELTASKS").split()
> > > +    for task in list:
> > > +        bb.build.deltask(task, d)
> > > +}
> 
> I'm just sad this is having to use anonymous python. Its slow and I'd
> like to see less of it, not more, given people's complaints about
> parsing speed.
> 
> I did make a suggestion about how this could be done but that isn't
> an option. I might sort out such a patch.

http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t222&id=46a01aef15b19431bd9f2924537723481e0151e5

is a patch which lets deltask become a bit more flexible. I've not
tested it much but see it if works/helps.

Cheers,

Richard





