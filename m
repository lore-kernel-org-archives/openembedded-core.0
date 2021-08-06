Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.2342.1628238533306379970
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Aug 2021 01:28:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ox2dCTJY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id k4so10057005wrc.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Aug 2021 01:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=465WGA5TXVAiUbglmn0xryGiyh+DzCUtkdTcGiAZ4q4=;
        b=Ox2dCTJY5V/O8IG4xcRCYXhU7Wyu3qPBTOYXuCLlcGnZp52w4jKt9qaEwDdM6MB/iX
         EIlqmHblLsVwaS/uRp5H5GbWPyzWDYDK79BLHX6vMctmqqo0YQYbf62Oo5NV0XtmgB6g
         uNfLYUXlJ966WSM7KX30ylX6PwT7DBEebDTqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=465WGA5TXVAiUbglmn0xryGiyh+DzCUtkdTcGiAZ4q4=;
        b=i6T18CnSR3Rb2rXUIXxJmZw++CEttPYxkpGsCAg+0XPOrvsqpZGrj23KFfQnQS1DTk
         EyMyDJszMRuoyZUH2hwLyHZhpIFzGkvK2EMHujrjJGshR1TiZuJQS2XArf3RHKRtPVE+
         EEvk6amR+/pjEIFt9FsGk74jTUHldtcoiUhmyavMVA+INxZSgYlHpkLAu7f8aI1WdQDZ
         AifYEz4GlaYr4z0VJnIIsDuY9IeTcr4WuGFmeAFd08zMCCBVy5zRcceczLLC/fy2xRmK
         3z9Z9Cytav7iHOvo6WEc8NnyvXExAoWNz1SdnKju5JNJNa7Y/fqdCSJ4flwMPBwrRSBr
         DYtg==
X-Gm-Message-State: AOAM533U7Ak7aywgnadD8ACWqW8HyudhgNyRy2bMkbL1UEmNlbu8GWOQ
	cH9Y1ndxu5pXwBA3tu0Sl6VM7Q==
X-Google-Smtp-Source: ABdhPJz7h3rdV3AR3uQTqN82ERK2ofh6oqZie0t54wxcGwLfPzUau8iTrFK+tLf5bkbGSY105wJeyA==
X-Received: by 2002:a5d:4392:: with SMTP id i18mr9219789wrq.231.1628238531822;
        Fri, 06 Aug 2021 01:28:51 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:9b1a:3a88:2016:c4d0? ([2001:8b0:aba:5f3c:9b1a:3a88:2016:c4d0])
        by smtp.gmail.com with ESMTPSA id r133sm13820830wma.18.2021.08.06.01.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Aug 2021 01:28:51 -0700 (PDT)
Message-ID: <216aeb0082ee257524a5f8f1d8f807f6d40ff67a.camel@linuxfoundation.org>
Subject: Re: [OE-core] Issue after override syntax change
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Konrad Weihmann <kweihmann@outlook.com>, OE-core
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 06 Aug 2021 09:28:50 +0100
In-Reply-To: <169881DABF23564C.16396@lists.openembedded.org>
References: 
	<AM9PR09MB4642973A068A5ED354160ABAA8F29@AM9PR09MB4642.eurprd09.prod.outlook.com>
	 <169881DABF23564C.16396@lists.openembedded.org>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2021-08-05 at 21:07 +0100, Richard Purdie via lists.openembedded.org wrote:
> Hi,
> 
> On Thu, 2021-08-05 at 18:59 +0200, Konrad Weihmann wrote:
> > I'm currently seeing the following behavior after the latest override 
> > syntax change (tested up to today's poky and meta-openembedded)
> > 
> > Take an image and install any kind of packagegroup, which references 
> > several recipes, which pull in dependencies by their own.
> > 
> > image:
> > 
> > IMAGE_INSTALL:append = " packagegroup-foo"
> > 
> > pkggroup:
> > 
> > RDEPENDS:${PN} += "recipe"
> > 
> > recipe:
> > 
> > RDEPENDS:${PN} += "libxml2"
> > 
> > pkgdata for the recipe
> > 
> > RDEPENDS:recipe: libxml2 (>= 2.9.12)
> > 
> > and the pkggroup are correct
> > 
> > RDEPENDS:packagegroup-foo: recipe
> > 
> > still I don't get libxml2 installed into the final image - there is no 
> > sign of that in log.do_rootfs or anywhere else.
> > 
> > The same thing worked pretty well the week before.
> > 
> > Thoughts?
> 
> There should be no change in the behaviour so that is a little concerning.
> 
> Is there an OE-Core example of this I could look at?

I did debug this a bit with Konrad and locally. The packagedata fix I sent out
addresses the issue. I merged it straight into master as it is a nasty issue
and needs fixing ASAP.

Cheers,

Richard




