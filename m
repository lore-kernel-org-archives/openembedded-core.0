Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.1242.1616687115805221651
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Mar 2021 08:45:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Lu/8bMs3;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id x7so2742504wrw.10
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Mar 2021 08:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=h/66MxXAV8HVqOvYgiYtdVZZDBcYSlOT9Ihi7lHqyOI=;
        b=Lu/8bMs3nskKHNIg88YL2j7h7U8zvbk9/MvqjeMSDs4wkZHL1xae7BELgdEDG6oaNX
         PKlZtvoE0ryuH0fjQ8e7Zsy2sCqfYQ8XBq98KnjdfL5htDvY3HTbVD78AcmqKeoIpmua
         ljA6Frjz7oi5vssVgRXd4r122YRGp7qCVLR+i34OHqPZITOZF6ahkoyn23+iGId39Ogx
         K1xn3evBjhSIwOF04PlE9lQMlgQT6UGgQmJWmSZwqdHiT7Pk5hOvXJ/bcnzXgm4JBSzI
         g4COwzAy4MC4k2SDJ2BC3D4wAQOo5LU5cnvG/1cRc7hjYM1ex4WhDb3GiFhKw+redXxe
         1QQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=h/66MxXAV8HVqOvYgiYtdVZZDBcYSlOT9Ihi7lHqyOI=;
        b=rogn3oGWh72+AB75/V2uB/pAQYb/8rgQTiaaKeL10zRhhZ3IEcN5OsVL4tcA79c+l2
         KbqLo6JxPazY7dp8hN5n6ONL5ICWTsV/DOGcOMc7N2xJCv+meIF5E3YtfK4sF/mi10CB
         Z/oGZHxwMITPhj9D0Z2q8DzSoPP79fk8P9O6G/Pp2Xe9T/hNX3BMLLxg5UaEuNhPRWWA
         OlbY/Vm8uPcjTl9FS+1m6ITZzwWY0hi+Kqu/0SkasNJe3P75+votnvbrIQ3ga2NYkoT3
         HhlInvWV1kZd3GdyQO/fav97YNkxhdQuVkSpODbp5UJLIhp2mcJe2mllYtHJF3jwTT14
         0KvQ==
X-Gm-Message-State: AOAM530/OtGKhOF9z7Qpt5nisb6lDAwPparQmIMImEFqxOyx8LdvHd2f
	KhIXUH3jzxr8cr2P5DUK3eI=
X-Google-Smtp-Source: ABdhPJzXBAcHGBDvAdDbskUfMJ90YDHMKml3VAyFPTMkuSCUzQD/M+1zbQCk8yu6zwHL1RY0qRm1sQ==
X-Received: by 2002:a5d:4fcb:: with SMTP id h11mr8542899wrw.53.1616687114132;
        Thu, 25 Mar 2021 08:45:14 -0700 (PDT)
Return-Path: <luca.boccassi@gmail.com>
Received: from bluca-lenovo ([2a01:4b00:f419:6f00:7a8e:ed70:5c52:ea3])
        by smtp.gmail.com with ESMTPSA id i10sm8156533wrs.11.2021.03.25.08.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 08:45:13 -0700 (PDT)
Message-ID: <c34e80a010fb54e47762534049ff9c80791f0d41.camel@gmail.com>
Subject: Re: [OE-core] [PATCH v11] util-linux: split uuid in separate recipe to allow bootstrapping
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Peter Kjellerstedt
	 <peter.kjellerstedt@axis.com>, "Oleksiy Obitotskyi -X (oobitots -
	GLOBALLOGIC INC at Cisco)"
	 <oobitots@cisco.com>, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: "bluelightning@bluelightning.org" <bluelightning@bluelightning.org>, 
	Khem Raj <raj.khem@gmail.com>
Date: Thu, 25 Mar 2021 15:45:11 +0000
In-Reply-To: <85dec47e7a6bf2533fe619fc391915d838e8924e.camel@linuxfoundation.org>
References: <20201210184632.3448265-1-luca.boccassi@gmail.com>
	 ,<20210311150959.782186-1-luca.boccassi@gmail.com>
	 <PH0PR11MB49023E90CAB5E58C2B603899D7629@PH0PR11MB4902.namprd11.prod.outlook.com>
	 <070d63d34bd6936df1e94c620103e2759dae0427.camel@linuxfoundation.org>
	 <5f37ee174e3f45e094ee2bb71c3c0422@XBOX03.axis.com>
	 <85dec47e7a6bf2533fe619fc391915d838e8924e.camel@linuxfoundation.org>
User-Agent: Evolution 3.30.5-1.2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2021-03-25 at 14:27 +0000, Richard Purdie wrote:
> On Thu, 2021-03-25 at 14:22 +0000, Peter Kjellerstedt wrote:
> > > -----Original Message-----
> > > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > Sent: den 25 mars 2021 10:34
> > > To: Oleksiy Obitotskyi -X (oobitots - GLOBALLOGIC INC at Cisco)
> > > <oobitots@cisco.com>; Luca Bocassi <luca.boccassi@gmail.com>;
> > > openembedded-core@lists.openembedded.org
> > > Cc: bluelightning@bluelightning.org; Peter Kjellerstedt
> > > <peter.kjellerstedt@axis.com>; Khem Raj <raj.khem@gmail.com>
> > > Subject: Re: [OE-core] [PATCH v11] util-linux: split uuid in separate
> > > recipe to allow bootstrapping
> > > 
> > > On Thu, 2021-03-25 at 09:17 +0000, Oleksiy Obitotskyi -X (oobitots -
> > > GLOBALLOGIC INC at Cisco) wrote:
> > > > Could you look into this warning.
> > > > 
> > > > WARNING: util-linux-2.36.2-r0 do_package_qa: QA Issue: util-linux-dev
> > > rdepends on util-linux-libuuid-dev, but it isn't a build dependency?
> > > [build-deps]
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/61/builds/3226
> > > 
> > > That failure was my fault when testing some fixes.
> > > 
> > > I've sent out a patch which renames util-linux-uuid to util-linux-libuuid
> > > and sorts out the license issue Peter reported.
> > 
> > I don't mind the recipe being renamed and cleaned up, but I would prefer 
> > to see my entire patch for the license parts being either integrated before 
> > this or squashed into it, whichever you prefer. It does not make sense to 
> > use the same LIC_FILES_CHKSUM for util-linux-libuuid as for util-linux, 
> > and setting the other LICENSE variables in util-linux.inc no longer makes 
> > sense as they are only relevant for util-linux.
> 
> I'm torn on that. Code with the other licenses is present, just not used
> in the final output and I personally suspect that having one LIC_FILES_CHKSUM 
> is going to be easier to maintain in the future rather than two separate ones.

FWIW, in Debian the license definitions always cover the _sources_, not
the built binaries. IOW: even if you don't build and distribute a
subtool, the license metadata must cover it. I'd think this would be
even more important for Yocto since you exclusively distribute sources,
not binaries.

-- 
Kind regards,
Luca Boccassi

