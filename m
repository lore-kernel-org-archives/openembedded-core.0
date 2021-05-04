Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.6489.1620138283265802145
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 May 2021 07:24:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cYrWgdAl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id m9so9665771wrx.3
        for <openembedded-core@lists.openembedded.org>; Tue, 04 May 2021 07:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=5x5eUhXPV2yKF5kkZJQDvTPvRI9WO08HnuIQY7cQci0=;
        b=cYrWgdAl/hfpBoyie5acyerPaGu+SCumIQEUAHi/DILf1qQ9NBitfPdobUx6PJkZmc
         TeyFp7nHOntDySGxaieL6pFPr2cxq1KLJQKV4Y5azW6lumosMeh4T866b3eKPDWC56rh
         Tv3JRSQzEV9x9efHCFvQUQoZKvq84E4WEHYOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=5x5eUhXPV2yKF5kkZJQDvTPvRI9WO08HnuIQY7cQci0=;
        b=mlJ8O1D9AkvnEPz7vTMjjMrN2T9woxi8aH6SA4xi1Laiv5ObtcNPc+opJVQtLuXOQS
         BsZHEmX1HtnRhuANrDAiBReMhwxbmG6WizPLUVuL5gh0vrYM5++AC+Xc54D8p28Dq9+m
         5HI9Ucm2QVB32ie1DLKxHoIZhNIIysAOe1v5eay+dpv0IJ86yjcyMUKT9GLN4SfqxyHC
         57gub0n5cMwCdEKR8gp2xduf/Epn+DsXHtPjKdDK1Z0PKYQp1emtzt+4e8vO5FdwRURy
         4b3kFkGXDNqPKJHwLyx68UmY7dX91F2bNxyGpZlV91SoLxR099ydynOHT78ZGz+M9wM3
         3tkw==
X-Gm-Message-State: AOAM530QxL+GWq2eID1/OFuY3eLhyHb80uH7ZPa6VHqKKTvvsd8F2JhD
	ruF6hH81R6XuOhzz2oo1EMAW8g==
X-Google-Smtp-Source: ABdhPJxfqBjfOTK3JV4kKDUT1aOaSTlOV4ssnhQOh4lWJydDW13wRdJi99i/PPt1nmUqXneeapf8Sg==
X-Received: by 2002:a5d:610a:: with SMTP id v10mr15667588wrt.399.1620138281712;
        Tue, 04 May 2021 07:24:41 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:bb9:ef1f:254c:99f5? ([2001:8b0:aba:5f3c:bb9:ef1f:254c:99f5])
        by smtp.gmail.com with ESMTPSA id y5sm2780352wmj.25.2021.05.04.07.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 May 2021 07:24:41 -0700 (PDT)
Message-ID: <b2fe670bee26b1d723e9bcdf6cbb3d77fa732a11.camel@linuxfoundation.org>
Subject: Re: [OE-core] making the meaning of "FILES_${PN}-bin" a little more obvious?
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, OE Core mailing list
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 04 May 2021 15:24:38 +0100
In-Reply-To: <bff7177-906f-f4e7-8085-6f245ad9a262@crashcourse.ca>
References: <bff7177-906f-f4e7-8085-6f245ad9a262@crashcourse.ca>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-05-04 at 09:31 -0400, Robert P. J. Day wrote:
>   more nitpickery, but i note in OE's current bitbake.conf the
> initially odd definitions:
> 
>   FILES_${PN} = "${bindir}/* ${sbindir}/* ...'
>      ... snip ...
> 
>   FILES_${PN}-bin = "${bindir}/* ${sbindir}/*"
> 
> i say "odd" since someone perusing that file could be confused, first,
> that that "-bin" package definition overlaps with the base package
> file list and, more, that just above that, the definition of PACKAGES
> doesn't include the "-bin" package:
> 
>   PACKAGES = "${PN}-src ${PN}-dbg ${PN}-staticdev ${PN}-dev \
>       ${PN}-doc ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN}"
> 
> so anyone currently RTFS is likely to stop and think, "what the heck
> is the '-bin' package defined for if it's not even included in the
> normal package list?"
> 
>   of course, one need to consult lib_package.bbclass to finally
> understand what its purpose is:
> 
>   PACKAGE_BEFORE_PN = "${PN}-bin"
> 
> but if that's the only purpose for that package definition, would it
> not make more sense to just move it to lib_package.bbclass so it's
> next to the variable setting that actually causes it to be processed?
> 
>   of course it works as is, it just seems unnecessarily confusing,
> unless there's some subtle ordering requirement happening here.

I suspect such a change may break as some other recipe may use ${PN}-bin
but not the class. We'd need a careful audit to figure it out...

Cheers,

Richard

