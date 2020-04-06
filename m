Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web12.9032.1586174293034779220
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2020 04:58:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CEwzds1u;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id z7so14315989wmk.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2020 04:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=RBXhr7FBI4tfFHWfSQpBs6XuJbn3C9xwUKrDLIJYxkU=;
        b=CEwzds1ugLUc/WrNAdymTWmFb4BpIumhvOnRIMjW/Aa3QDUnyHZBkQH6sqMRJjyQ5q
         nyYqioFz+r+ZIzooDXjKi1PNpCxxF/Uo0oJ8AX325tEVWr7ceEVunXVJYhtEs6Fde2Sg
         wZKF/eW7q1tVgsfCdtOiZNtALv45A9Bz10NL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=RBXhr7FBI4tfFHWfSQpBs6XuJbn3C9xwUKrDLIJYxkU=;
        b=Dwz0g1EicaEZ4xiCv+T5obUNiMgfmq+dbXntcJHVWeC+5c9+TfUFNfjdhGPzOicuSV
         aznzpJLYY3kx6aePLc6SRDsptAnEhdXOBwmVSsD8pLVwEXg98T125ehyZvf8p3m3DSpe
         dBF0XU6dacI5OxwnPtZnRdcAQNaB58GcoRzOuX1dP0TmxX0erp1USadPfDKlPlygBrPd
         DiS5dC3CgzbBAhvpHeld/zpFQw/TG+zWKMG7nVfFz38R41lreHapkRGxUHmy3DMy7CD+
         Olj9OlYoPYrhn/vpsx/Ye7QFH+DIx/k9Eet/6TQTqKwexAKAcbCTQWtokwiseDsypkeT
         orLw==
X-Gm-Message-State: AGi0PuZdWDrT6L0iaNVxeFPcjJiYAxLiaPPX8wFMJLoEzU5cAV7nzJl2
	RGQgYfO1aPl1Tymbs5Qo4OXR1g==
X-Google-Smtp-Source: APiQypJifeqrbv3LDwJibzvXnqzMT1Px9E1KySmlXJtQNnJb/QHu7zwcggwb/oquEw5EZQl08I4xdQ==
X-Received: by 2002:a7b:ce0b:: with SMTP id m11mr21831313wmc.52.1586174291535;
        Mon, 06 Apr 2020 04:58:11 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id d28sm14846718wrb.31.2020.04.06.04.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 04:58:10 -0700 (PDT)
Message-ID: <5ebbb63be39a442c740660ff321338f522dc4b68.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2 v5] coreutils: add ptest
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Trevor Gamblin
 <trevor.gamblin@windriver.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 06 Apr 2020 12:58:09 +0100
In-Reply-To: <CAMKF1spd-onZWc9j+Jx58zYtRUpAPC6X0wm+t0YSmgctmWD6Vg@mail.gmail.com>
References: <20200311113235.61655-1-trevor.gamblin@windriver.com>
	 <20200311113235.61655-2-trevor.gamblin@windriver.com>
	 <CAMKF1spd-onZWc9j+Jx58zYtRUpAPC6X0wm+t0YSmgctmWD6Vg@mail.gmail.com>
User-Agent: Evolution 3.36.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-04-05 at 17:26 -0700, Khem Raj wrote:
> On Wed, Mar 11, 2020 at 4:33 AM Trevor Gamblin
> <trevor.gamblin@windriver.com> wrote:
> > +inherit ptest
> > +
> > +RDEPENDS_${PN}-ptest += "bash findutils gawk liberror-perl libmodule-build-perl make perl perl-module-file-stat python3-core sed shadow"
> > +
> 
> Adding libmodule-build-perl to rdeps here is pulling in whole target
> toolchain components now while building core-image-minimal
> the dependency chain looks like, total task building for this image are 3000+
> 
> "coreutils.do_package_qa" -> "libmodule-build-perl.do_packagedata" ->
> "packagegroup-core-buildessential.do_packagedata" ->
> "gcc.do_packagedata"
> 
> IMO, it's a bad experience for the user when building a simple minimal
> image and it ends up building whole toolchain for target that
> eventually won't even
> be part of the image. perhaps make it dependent on ptest or some such
> knob thats not commonly used.
> 
> Please revert this patch series until we can find a way to not insert
> these build-time dependencies in normal flow.

We were aware of this when it merged. This should already only happen
if ptest is enabled?

(else ${PN}-ptest isn't in PACKAGES and hence the RDEPENDS isn't seen).

I wish we had a better way of handling these dependencies but we sadly
don't.

Cheers,

Richard



