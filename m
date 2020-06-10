Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web12.13051.1591801549915618343
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2020 08:05:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=O/Eos7Ie;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id q11so2683089wrp.3
        for <Openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2020 08:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=6o+I+YnZ+XZAkUXX6ZOJro2mJYfT8W4XptzYyjgqsE4=;
        b=O/Eos7Ie7FKZ/mfoat4Ea8FeeTkjnIC7HHfgdAFAYUH3RSerfT7n4KuRq3GMbs6QeI
         SQZcn7T6ZB6+h2CIZTfgHsVC7ELlIZMNeCRGCuo8CZkhbss9480QjRaH4L92k5h2bBiJ
         pK69PQ0JNquGo8R67w2HLNyREd5oDMUQavgC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=6o+I+YnZ+XZAkUXX6ZOJro2mJYfT8W4XptzYyjgqsE4=;
        b=CN1s3MBtj6PZ/8ROyM9oPKf3fZnKTkyAIBUmnT0diUJS8PnGNA06veu1LtWu6MmCBF
         EdalTtv6ftiXs8sk7RS9eVvbpYVssNn+VZnvVovZ8S41NIyTZivhqan7S/Lt8bUdW3ae
         kf9+FPe1ued7kYKf+hH2nWW3opm7KwscQV/6Pg4P5HQISKP26BjzakbhjLwXG6AuC76V
         RnomKmTqcr7u7RbWc7RAK5XoRbZMB0kKn+OarUJ1YJf1C2dsw9PDlLGzZ7wBAHurpZiw
         A5lTbMRvH2bdwwTgrybIaew6suZM7SGuTnR7Kv4OA4iaRPvpEY6ixYgegQEh+Sjt6ynu
         xydQ==
X-Gm-Message-State: AOAM532f2o3RXYyIesRubsdRfKCEydeJ/r4D6M3UKD9aDu6jJ78yE3FA
	PR8uuykhwmZFv9+/fuDE2Aknpg==
X-Google-Smtp-Source: ABdhPJxkhQ2XFy5zKOcEu8sQ5ImE6Kpzo0ZukAbAu+fwgZfgMfl4HACKBt8sbgCHg1LBJM2UWO6DBQ==
X-Received: by 2002:a5d:4385:: with SMTP id i5mr4152088wrq.420.1591801548495;
        Wed, 10 Jun 2020 08:05:48 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id h15sm87698wrt.73.2020.06.10.08.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 08:05:47 -0700 (PDT)
Message-ID: <6dd0de0be72028b355cd759e40fee22c9d24ca7b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] dhcp: use included bind version
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Vyacheslav Yurkov <uvv.mail@gmail.com>, 
	Openembedded-core@lists.openembedded.org
Cc: tmark@isc.org, Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
Date: Wed, 10 Jun 2020 16:05:46 +0100
In-Reply-To: <20200610143520.2727827-1-uvv.mail@gmail.com>
References: <20200610143520.2727827-1-uvv.mail@gmail.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-06-10 at 16:35 +0200, Vyacheslav Yurkov wrote:
> From: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
> 
> ISC DHCP should link against BIND9 libraries, which are tailored
> specifically for DHCP. BIND9 package in Yocto core layer has
> different
> configuraiton, in particular it has threads and epoll enabled.
> 
> ISC DHCP isn't a multi-threaded application, running it with bind9
> libraries compiled in with threading enabled is not something ISC can
> vouch for.
> 
> BIND9 libraries support a lot of options specifically geared towards
> optimizing DNS operations, many of which do not play nicely with
> ISC DHCP's "architecture".  It isn't necessarily practical to build
> those libraries for both purposes.
> 
> If threading is enabled, then DHCP sporadically fails/crashes with
> messages like:
> 
> lib/isc/unix/socket.c:1054: epoll_ctl(DEL), 6: Bad file descriptor
> lib/isc/unix/socket.c:3332: INSIST(!sock->pending_send) failed.

You seem to disable parallel make yet no mention of that in the log?

Why doesn't dhcp build and link against a static libbind by default if
these issues are present the the dhcp authors don't want to work with
such libbinds?

Cheers,

Richard

