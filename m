Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web11.18145.1593598372542527204
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2020 03:12:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iNE3cmGJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id l17so21798318wmj.0
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2020 03:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=4YOTRnac7U+yJpbin1phPcNeaMHpGBr3ulxpX3I4y9s=;
        b=iNE3cmGJ9LfKYC8ciQ1SDtjGKU3Kh2TVutmbwHqqfM/RuQDN92/s8A3HviPLx7lrm0
         v5q+OjwURFe/M1imJXP8acegvPlJoPa/YZa6lEx81JpYYBqGU96TQZvCrUNjmEh0pnM/
         +3VgDf/925sD3UucOK7vpy4CeBkjSnv5jNlXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=4YOTRnac7U+yJpbin1phPcNeaMHpGBr3ulxpX3I4y9s=;
        b=biusgzAQmQ1g+WHnVVRMPKz+ZuVs4cbf6Cv26BlwNnEAVL1tknAvlK3x56oMv97yrD
         93Yp/qG72Ouho9UTcQsXz8XUlyDwDSjPpLfYoUcYyJzZ/9czvwHd+DdRxQBlR3zeRm0t
         DSN3DX5MO3wh339rlcbfhL1aieHH88CEKGv4QHYjqRC1/YErEnaswyoon/ds0xRNnxST
         CE/nMjIeJpxeYJGeNMZQcYNC517VtP9lo74TBI/BNKHmOTnVt0hFSDQhjTzdjlTHotZt
         3G2ZV7yXAXRM3h6Xwm9YdhG9W97r0XcRT+Sx+n25G+Eqf/XCNvOueHEvCOTiG73l3gMv
         NbJw==
X-Gm-Message-State: AOAM530aBRFfgNcgb+tF95e8ZbFV9X68RFjx+0by6/Zc7pvmSCMpOWOg
	W087lNwDXlVwfC8TuBCLUfin4g==
X-Google-Smtp-Source: ABdhPJwEzzJkeJu2IgqvnfQ9UoHDP5E7FY/PSrfocUSXy7TQcimZ2l7Oq702Y1pNqBPjdt48gwvVgA==
X-Received: by 2002:a1c:e355:: with SMTP id a82mr26829234wmh.165.1593598371082;
        Wed, 01 Jul 2020 03:12:51 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id u20sm6349365wmc.44.2020.07.01.03.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2020 03:12:50 -0700 (PDT)
Message-ID: <9fb318a8e5cada4d7671af73bd5dd08e63b244a3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3] nopackages.bbclass: Get tasks from variable
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Paul Barker <pbarker@konsulko.com>, Fredrik Gustafsson
	 <fredrik.gustafsson@axis.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, 
 tools-cfpbuild-internal <tools-cfpbuild-internal@axis.com>, Fredrik
 Gustafsson <fredrigu@axis.com>
Date: Wed, 01 Jul 2020 11:12:45 +0100
In-Reply-To: <161D992D91B5C0EE.29179@lists.openembedded.org>
References: <20200701084634.11428-1-fredrigu@axis.com>
	 <20200701084634.11428-2-fredrigu@axis.com>
	 <CAM9ZRVvdaVSghGzoFwy6vhHLhzHE-HatJpRwC6LxpuepO_pTxw@mail.gmail.com>
	 <161D98456D41D2FE.27211@lists.openembedded.org>
	 <161D992D91B5C0EE.29179@lists.openembedded.org>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-07-01 at 11:11 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Wed, 2020-07-01 at 10:54 +0100, Richard Purdie via
> lists.openembedded.org wrote:
> > On Wed, 2020-07-01 at 10:48 +0100, Paul Barker wrote:
> > > On Wed, 1 Jul 2020 at 09:46, Fredrik Gustafsson
> > > <fredrik.gustafsson@axis.com> wrote:
> > > > Get tasks from a variable instead of having them hardcoded.
> > > > This
> > > > will
> > > > enable other layers to add tasks that should be deleted when
> > > > nopackages
> > > > is used.
> > > > 
> > > > Signed-off-by: Fredrik Gustafsson <fredrigu@axis.com>
> > > > ---
> > > >  meta/classes/nopackages.bbclass | 19 +++++++------------
> > > >  1 file changed, 7 insertions(+), 12 deletions(-)
> > > > 
> > > > diff --git a/meta/classes/nopackages.bbclass
> > > > b/meta/classes/nopackages.bbclass
> > > > index 559f5078bd..4c9fe510c5 100644
> > > > --- a/meta/classes/nopackages.bbclass
> > > > +++ b/meta/classes/nopackages.bbclass
> > > > @@ -1,12 +1,7 @@
> > > > -deltask do_package
> > > > -deltask do_package_write_rpm
> > > > -deltask do_package_write_ipk
> > > > -deltask do_package_write_deb
> > > > -deltask do_package_qa
> > > > -deltask do_packagedata
> > > > -deltask do_package_setscene
> > > > -deltask do_package_write_rpm_setscene
> > > > -deltask do_package_write_ipk_setscene
> > > > -deltask do_package_write_deb_setscene
> > > > -deltask do_package_qa_setscene
> > > > -deltask do_packagedata_setscene
> > > > +NO_PACKAGES_DELTASKS += "do_package do_package_write_rpm
> > > > do_package_write_ipk do_package_write_deb do_package_qa
> > > > do_packagedata do_package_setscene
> > > > do_package_write_rpm_setscene
> > > > do_package_write_ipk_setscene do_package_write_deb_setscene
> > > > do_package_qa_setscene do_packagedata_setscene"
> > > 
> > > Not sure if `+=` was present in the previous versions, I only
> > > just
> > > noticed it now. I think `?=` is a better choice so it can be
> > > overridden easily. Other than that, this looks good.
> > > 
> > > > +
> > > > +python () {
> > > > +    list = d.getVar("NO_PACKAGES_DELTASKS").split()
> > > > +    for task in list:
> > > > +        bb.build.deltask(task, d)
> > > > +}
> > 
> > I'm just sad this is having to use anonymous python. Its slow and
> > I'd
> > like to see less of it, not more, given people's complaints about
> > parsing speed.
> > 
> > I did make a suggestion about how this could be done but that isn't
> > an option. I might sort out such a patch.
> 
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t222&id=46a01aef15b19431bd9f2924537723481e0151e5
> 
> is a patch which lets deltask become a bit more flexible. I've not
> tested it much but see it if works/helps.

Sorry:
http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t222&id=fd24e59fc886e6642bc3c8fb2941a37a1cc4042a

Cheers,

Richard (in need of caffeine)



