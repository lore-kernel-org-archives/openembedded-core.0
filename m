Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.19932.1588500284496141307
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 May 2020 03:04:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HqhHqGmZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id e16so12170724wra.7
        for <openembedded-core@lists.openembedded.org>; Sun, 03 May 2020 03:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=DbH8u3LZBGCxwAwO/UB5pXwSDjDrWzJWY988oy+p0mk=;
        b=HqhHqGmZWP3NDEJpqpYnfyZdAHxH9ynAT2SKXGFnTUtLQrnP5jCs/r2+D4AxqcA3ts
         2Gt2utIdv4mbQHlMa0UVmlxIA6p3EfxEbl19UD3+UTZlKeg9sx/jVPwH29gkJAUd9vsw
         zyyqpGl4CtwOn3j2JNvU6s5+Cxa9ibCR4J6V0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=DbH8u3LZBGCxwAwO/UB5pXwSDjDrWzJWY988oy+p0mk=;
        b=Q7/cnfC0UjTkum9nD+NnytnZ+ridU8ijz3sprn2VcqCQh2mKON+ApKatpAvOXbck4D
         GQmGauX4fBEELKDJSSCj4k6Lu++SMQ8hhLRfDQmxFmZjA3+nzTtfZzuODNX+JDH5RD78
         D8NHFJH4fJo7H/HjHuUlPxT6afDA31tGrK8Dqw1kLJZSiRduaepYczqmEaOCJl/R12Xc
         OFJ9vyFxMExioXa0VJ14JJtnZHYvN/0YDFHBP9WaRI23SgDvD08NlLfE7rwNNgAkDeKz
         2NYFcdGrCtQ7M36ZYLZ/hmsS2Z7vPN9ppGs2W+IvabEHPP4qpKVFmXymRHQGfWtkzUwZ
         rbfw==
X-Gm-Message-State: AGi0PubejBC6cTGdvsHcviNwxELJ6ByfHKYUkLbWt8XN/epagGbPU/UU
	FNUnHOb7fpbGjrnLZ7AqX+7pxSBVMXI=
X-Google-Smtp-Source: APiQypIFL+iQ6D/siqcb/PIM8jgUbejWBlwwPHrmKZ4krzlL/+VjDj6m4oGMA0ap20ye7yBFFLftZQ==
X-Received: by 2002:adf:fa89:: with SMTP id h9mr5138998wrr.119.1588500282447;
        Sun, 03 May 2020 03:04:42 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id n9sm13191239wrx.61.2020.05.03.03.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2020 03:04:41 -0700 (PDT)
Message-ID: <e9f18f5d8df6e34e0cf7a81f2860b62a795623f4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] Add -fcommon to BUILD_CFLAGS to a number of recipes
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Daniel Mack <daniel@zonque.org>
Date: Sun, 03 May 2020 11:04:40 +0100
In-Reply-To: <20200503082640.3686916-1-daniel@zonque.org>
References: <20200503082640.3686916-1-daniel@zonque.org>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-05-03 at 10:26 +0200, Daniel Mack wrote:
> When building on a gcc 10 enabled host distribution (such as Fedora
> 32),
> a number of recipies need explicit treatment to enable '-fcommon' in
> BUILD_CFLAGS. There might be more of those fixes needed.
> 
> Commit 46827b8616 ("recipes: Use -fcommon explicitly") already
> addressed
> that for some places, but tweaking CFLAGS doesn't seem to suffice.

Thanks for this, its definitely something we need to fid.

The work in the previous patch was fixing gcc 10 target builds, not
host. Your patch changes CFLAGS to BUILD_CFLAGS in places which means
when we upgrade to gcc 10 things will break.

Basically:

CFLAGS should cover build and target
TARGET_CFLAGS should cover target builds (gcc cross as gcc 10)
BUILD_CFLAGS should cover host tools (gcc 10 on the host)

so the correct place should be CFLAGS which should cover target and
build (host).

Its possible that some recipes build native and target components in
which case they might use CFLAGS and BUILD_CFLAGS. Based on what you
say in the commit message, there might be a bug and we might be missing
injecting CFLAGS into BUILD_CFLAGS.

I think this is going to need a little more investigation to get it
right.

Cheers,

Richard

