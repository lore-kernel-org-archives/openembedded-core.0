Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.1159.1610094393482437667
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Jan 2021 00:26:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eiNWVgDO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id k10so7118465wmi.3
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Jan 2021 00:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=9RDBeqNmeMEUsXiEQvNHiDo059kxa+ksSf2hvs3SvMg=;
        b=eiNWVgDOOWv86P3pIPcEN8z5Hyn2OymYGYXj4Cq0igLyqaHLRHs8/7Ip5ItSHsnvHr
         QnOGdOQGx7xWFYWotC6kERhDituKUGKMBnp76UZ7yBAxpt49WeH1Y0GcsqT5EnV16fF+
         FWDp0dnWfZdgvL1bYKrl2uuOlJJwMwp9jC7TY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=9RDBeqNmeMEUsXiEQvNHiDo059kxa+ksSf2hvs3SvMg=;
        b=sXl2xUqhuUnFUPdvoWoOsXoJn1eRElvfPPkkUi9QFOFxYe7nHv8yXxFFEnCx56yhV0
         Wf6ukYkLmBqteOfqh+eeKG+IEG7IugZlzkAxuc8WMpWfSSBKmSI3b+wuhiHY1SgKrr/6
         3PCLb+0Z3aQYwbGAklp/nEIWpa6eQA7T9NS4MA1kmk22KiUvX7X76haOVHlfg4XksmHy
         j23mSTUQLUv303KHPuD4k7yaKG12AVet4y+hM/hpDW0roIiVZblrqssqpK4MW3SYcALW
         Nvnte+fCebwGbscEsT81qiLYZ8IuTDklvO5pTdjo53S8CS5iLESf0GmGTZCRI9vhzbjg
         uczQ==
X-Gm-Message-State: AOAM530I+RTG38av/MyS3AO9N5qPVJUxeGQ7aoSJH9zmLtPAG95f0qQY
	fwe5kDvqb58w4Wq/AdbSTCs60TQcgeJPZA==
X-Google-Smtp-Source: ABdhPJx19uAv3xGliicbwFFExavAjAIi8TeiqAQE83+Xo753LUckL/h1F9fm/27wgew+m/cUZJYe1A==
X-Received: by 2002:a05:600c:22d9:: with SMTP id 25mr1994456wmg.158.1610094391870;
        Fri, 08 Jan 2021 00:26:31 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:8262:2156:a38b:824c? ([2001:8b0:aba:5f3c:8262:2156:a38b:824c])
        by smtp.gmail.com with ESMTPSA id k6sm11468313wmf.25.2021.01.08.00.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 00:26:31 -0800 (PST)
Message-ID: <bfb21f1ec874e5d9638885885eb2530104c28ac5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [poky][PATCH] bitbake: remove /usr from pseudo ignore paths
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Anton Kachalov <rnouse@google.com>
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 08 Jan 2021 08:26:30 +0000
In-Reply-To: <CADVsX89HCqKYNOyDMK1czkfaOw_TdrwVLK=bi_RanOKgDd=ZuQ@mail.gmail.com>
References: <20210107215121.3901938-1-gmouse@google.com>
	 <CADVsX8-dMLvuccRjzU73=-reDjEBRq5PZZ+S6ZeugSvTy-iqog@mail.gmail.com>
	 <CADVsX8924shMc+PFUQ6jsmnUqsF+VAeRfn0xM+4G406EgvGFCg@mail.gmail.com>
	 <63d70805b829d08faf3e73865ed7f9c2ad9a1366.camel@linuxfoundation.org>
	 <CADVsX89HCqKYNOyDMK1czkfaOw_TdrwVLK=bi_RanOKgDd=ZuQ@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2021-01-08 at 01:56 +0100, Anton Kachalov wrote:
> Hello, Richard.
> Yes, for various reasons we can not move out from /usr/local.
> Before the change it works smoothly and we didn't notice about any
> kind of performance issues.
> May be we can explicitly add various standard subdirs under /usr
> excluding /usr/local?

Can you add local config like:

PSEUDO_IGONRE_PATHS_remove = "/usr/,"

which should allow things to work for you?

Cheers,

Richard

