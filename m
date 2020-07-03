Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web11.7686.1593772941769128412
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2020 03:42:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QzP7Qw+6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id 22so31591481wmg.1
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2020 03:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=jGbv+WAmO7J8oQiRj9vw+Fu6U8YObb6DvJmKLMRc9IY=;
        b=QzP7Qw+6JoJkva/c0/PSF9QjKXeDICXYSh34iRVXEFHHpi64w2+DUHl1DJCiKM+6CJ
         c2/gvLxrCg+jnLTS+zDY0oAR6wpsqR26i73HMXqIWPBB2y3sUlydU4RKVHntn7KDK8bh
         zpvuKDypB15zn7kzssS4gQeDPonJTxNaXnLEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=jGbv+WAmO7J8oQiRj9vw+Fu6U8YObb6DvJmKLMRc9IY=;
        b=Pf4yL8mkifrqnccp0w4/sd+r4fFnycPXvk6ermXT8aXQUEAp5v6uEsMNc+L1/QXEB/
         HOfKKykA+hQdWBid+12/N+d7Rp0IGQPWkoWQTu31b8tNJoJFbu+DGijaTTAgI8824f02
         ZtjQd2b9cB3x2UyWdiUhEJEyp9/S++CzlUC2jVhFkYnlvLwBS5FyWfsuUe4WonqWbSnh
         nR5H2RErKrh4uQuQQxJPgdcm6pmMoSHKOrFCE5ftgRWnRamyPdRmp4cE4nbzZiXlrCRP
         kRZNFbNwgFXyWkvm3jfYPOIWnoby55mO0J6XFNEp5pWqX+MHJEcKXQYttRbFcuPBI1O1
         uL7g==
X-Gm-Message-State: AOAM533edfDkKW44Pya6t9Clgs1nbPS7k2El0+AiuoWsvR/aXIH8d72E
	/wGkvwSNo8GsEyJoy/vQcw9O8w==
X-Google-Smtp-Source: ABdhPJwUrwmDytl2hnRs5M4NLsC0HJxX2B/pD9ebrIgxYbz+La2QnVlhGXi2m8BeykYu2ELDG2fhyg==
X-Received: by 2002:a1c:3546:: with SMTP id c67mr36410285wma.102.1593772940262;
        Fri, 03 Jul 2020 03:42:20 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id w7sm13528057wmc.32.2020.07.03.03.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2020 03:42:19 -0700 (PDT)
Message-ID: <ae711e47aeeba494162c6fe7538d589c312c7ad0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] kernel.bbclass: add lz4 dependency and fix the call to lz4
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "T. Ulrich" <timon.ulrich@kabelmail.de>, 
	openembedded-core@lists.openembedded.org
Cc: Timon Ulrich <t.ulrich@anapur.de>
Date: Fri, 03 Jul 2020 11:42:18 +0100
In-Reply-To: <20200703062210.9471-1-timon.ulrich@kabelmail.de>
References: <20200703062210.9471-1-timon.ulrich@kabelmail.de>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-07-03 at 08:22 +0200, T. Ulrich wrote:
> From: Timon Ulrich <t.ulrich@anapur.de>
> 
> If the initramfs image is type lz4, then a native lz4 is needed.
> 
> Additionally an output filename needs to be specified when calling
> lz4, otherwise STDOUT will be used implicitly.
> 
> Signed-off-by: Timon Ulrich <t.ulrich@anapur.de>
> ---
>  meta/classes/kernel.bbclass | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

I really don't like building tools just because we might need them. Is
there a way we can tell which compression format is being used for the
initramfs and make the dependencies conditional?

Cheers,

Richard


