Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web12.1492.1587162961519353408
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Apr 2020 15:36:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BuZAuE4O;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id o81so4448588wmo.2
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Apr 2020 15:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=T2ihURD8zid0FOg1UozkPRQ7ga3zaTzrFJ598OivkjA=;
        b=BuZAuE4OJdst4pa5MLaFrG5n2KQWWQ5byq77dPRipb7NvsU3lio1F6yxVst9dAE8vM
         Vwx9U1SWEhADmGlUcmFl8CgJigjKhzO8wg9ivwyZLc53ePWIcDgJy+g4saL1d6rWoyfR
         tFtJegX6tkQgZg9YA+IICf1N55Vs40Hkwkwms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=T2ihURD8zid0FOg1UozkPRQ7ga3zaTzrFJ598OivkjA=;
        b=pkePQN+80BOva9n65ro2WW7Xrv6GAtNm4PKEMP9W2cDNwM1DMcAqLUiBNRKBRVZv70
         WmcFZeMPIlesoQTNXE46l/U7umq5Fx8a5gZPKIJFjJh/F8KCcNwOJiEhT9spAMUaGaDe
         5hW3JNuTHkSIkm+yMJg7gmh5lkxZao92YEsWefEPhXCMA4SRClSPwf7v1+Ur8pzcMccU
         cdX/L2awprKGO4oyvcE0TjYIoXeC7bg7zf+DGgW/vQ9st5MRpfenAgWsPmiV5tkOFgjz
         QjJn35PafY3C6Z+vmPUkw+zi0qfD0CbgcIhFiGz1SJ9CIdBpS1yCsM3LAvpiCEWreI5H
         ebOA==
X-Gm-Message-State: AGi0PuaWeMwzCmQWvKBhv8wOH4D4GtU+QxHo2vq9JjsaRHuNIKiDdS/i
	xNNyAuUC/1IaihLDVlFfWHOdqA==
X-Google-Smtp-Source: APiQypIBJrJ9D5flLq2Rk6ThPM9ItpjdwGgdZOte3X0eRYa6NS5/9L9Nd1glg0v+TLEoAGa36vLT7A==
X-Received: by 2002:a05:600c:2c53:: with SMTP id r19mr5882795wmg.40.1587162960012;
        Fri, 17 Apr 2020 15:36:00 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id v19sm28726809wra.57.2020.04.17.15.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2020 15:35:59 -0700 (PDT)
Message-ID: <211d2fcef51a08b5dd0c8918afcef94abc98ee41.camel@linuxfoundation.org>
Subject: Re: [OE-core] missing(?) numerous ptest packages building core-image-minimal for arm64
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, Alexander Kanavin
	 <alex.kanavin@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Date: Fri, 17 Apr 2020 23:35:58 +0100
In-Reply-To: <alpine.LFD.2.21.2004171736390.1967725@localhost.localdomain>
References: <alpine.LFD.2.21.2004171715340.1963843@localhost.localdomain>
	 <CANNYZj9hjn28fQqLpbML7=SOdERUBGfFDCSir29sTz1nprgQEQ@mail.gmail.com>
	 <alpine.LFD.2.21.2004171736390.1967725@localhost.localdomain>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-04-17 at 17:39 -0400, Robert P. J. Day wrote:
> On Fri, 17 Apr 2020, Alexander Kanavin wrote:
> 
> > ptest-pkgs is complementary; it pulls in ptests only for those
> > packages that are explicitly included in the image. (similar to how
> > dev-pkgs or doc-pkgs work).
> > 
> > Generally, it is not recommended to use ptest-pkgs as you never
> > know
> > what you end up with, and how long running ptests will take; list
> > ptests you want explicitly (core-image-sato-sdk-ptest is an example
> > of how).
> 
>   ah, that clears things up, and definitely flies in the face of the
> advice given in the current dev manual:
> 
> "To add package testing to your build, add the DISTRO_FEATURES and
> EXTRA_IMAGE_FEATURES variables to your local.conf file, which is
> found
> in the Build Directory:
> 
>      DISTRO_FEATURES_append = " ptest"
>      EXTRA_IMAGE_FEATURES += "ptest-pkgs"
> 
>   i'll make a note of that and adjust the dev manual at some point to
> clarify this, thanks.

I'm not sure that it "flies in the face of", that reads correctly to
me, its just open to misinterpretation. It functions the same way the
dev or dbg image features work and adds ptests for the things already
in the image.

So yes, it obviously needs more explanation but it is consistent with
the behaviour of other IMAGE_FEATURES.

Cheers,

Richard

