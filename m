Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
 by mx.groups.io with SMTP id smtpd.web12.2536.1608760208672364235
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 13:50:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SvTKSiyt;
 spf=pass (domain: gmail.com, ip: 209.85.166.181, mailfrom: twoerner@gmail.com)
Received: by mail-il1-f181.google.com with SMTP id r17so389134ilo.11
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Dec 2020 13:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=GXk0+S7KT/GhNJBA9XJ8SU/Er4xNDdltJ3b3Mi9n+8w=;
        b=SvTKSiytBULjtsxLNi3wtwLTh8c8ljpW1npIGO/npzIDT0fj1R3qtTIz2eWP30tFXN
         RrwugDPURowg1hT0v7g8dWosIvlN68KRXFps51SJV9WnEW0OVC77LGKVm5DpsXsXYqCv
         IxbuX1i51PsD2p9RTZgcyNk41iv8/UnkEjyp56UfIA2ntej8crTOvE4UkzXRviEMjK9O
         PUpijk1818lKqA7PvoXD7pP9dNZQrG44ys+WJyt4Hxt5qg1TlaA9nQjIL7pNfLc/4ayT
         y6yUk/oPsybJ+lZXlruZX0UYT42kNnKTed33UmcppnGQ7TNmXvA0XzNvwv46N7F8dCDH
         2b9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GXk0+S7KT/GhNJBA9XJ8SU/Er4xNDdltJ3b3Mi9n+8w=;
        b=aqVwuttE1VZZQwtNarfS+c5u6TLaraSUJ1H43cp/HoxRerBRV2XQQk4ToaZRS98Rf1
         HgCC5uj1afY6aEIlXW8fu2IjIMI6nZhPVFLqb1XyATHzpdRmJAmmPtOKe2rZHwl2u2nJ
         2WZgL0hWfbTQ0ZH5YlbT4rTeNHeHxAHVqFmCelUWSUEnU1lBWQl/SZ+DXgh0ZYUDHBjf
         tFjWQsy028q73RAtLVIpLDxukdu9kE5IQzErhmhw+1llLmU0k2IGPjangGxuQWenAWPB
         p4alWqJ3mbEPHAumoAsOssgH4UP+Jyqi19AM24FgmXGQTeLpvi5xYaJHmrW6/y6p4hCY
         QrUA==
X-Gm-Message-State: AOAM531CtQK0EXdPfNPRZ+rZxyTusiJSEPSHmVz0Y9/1hs4Fx6haJD8R
	pT29+6SPe3U6uItbiM+DtuA=
X-Google-Smtp-Source: ABdhPJyP22tDCGAKhCj8ZBDVBd/phO9JEeowBBWnYBDFYWTaGfwBAI0bZCV8+ASHsxJNeKJrVrv6hw==
X-Received: by 2002:a05:6e02:12e4:: with SMTP id l4mr26846725iln.252.1608760208107;
        Wed, 23 Dec 2020 13:50:08 -0800 (PST)
Return-Path: <twoerner@gmail.com>
Received: from localhost ([206.248.190.95])
        by smtp.gmail.com with ESMTPSA id b9sm19246246ill.5.2020.12.23.13.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Dec 2020 13:50:07 -0800 (PST)
Date: Wed, 23 Dec 2020 16:50:05 -0500
From: "Trevor Woerner" <twoerner@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [master-next][PATCH 2/3] psplash: work on first boot (sysvinit)
Message-ID: <20201223215005.GA9542@localhost>
References: <20201223170621.35727-1-twoerner@gmail.com>
 <20201223170621.35727-2-twoerner@gmail.com>
 <743d9e91ea6fb99193e315f8b20778e418109da7.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <743d9e91ea6fb99193e315f8b20778e418109da7.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed 2020-12-23 @ 06:00:21 PM, Richard Purdie wrote:
> Personally, I don't really like the idea of having a top level
> directory called .psplash,

Neither do I, which is why I also added the code to remove the directory once
the psplash program is done running. Whenever psplash is run the directory is
created just before it starts and removed when psplash is done.

> is there a reason it doesn't work in /mnt?

This all works fine (without any changes) on the qemuX machines, but on a real
device (e.g. rpi) when the image is booted for the first time everything is
mounted, initially, RO, when using sysvinit. At the end of the first boot, and
for every subsequent boot, the filesystem is R/W, so everything works on
subsequent boots.

On first boot, the error message I get is:
	mkfifo: read-only filesystem
When the first boot is done, the last message is something along the lines of
not being able to umount.

If the directory exists in the filesystem already (as part of the image) then
psplash can create the fifo in it.
