Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web10.1200.1602104466640465227
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2020 14:01:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=L/dUDEEy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id t10so3952248wrv.1
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2020 14:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=kmbOGP3xLM7btuPx231/yj0yE/mJjgzxRTG19fL9yh0=;
        b=L/dUDEEy0xV8M3DqWo/s7uBJyKaF6a8Ja1yQNeb3J7pQyoW7MDWd41qZtFUSV+U9LO
         y4GDmcBI6Hsdbeo+wsmZEHGUeFrG3dIjIShgrBCD77sPfPajtOM90L53PDTbXxgKsgee
         17S1aEVlGcPuz66WxvPzB7eMCxWjLjw/EMuAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=kmbOGP3xLM7btuPx231/yj0yE/mJjgzxRTG19fL9yh0=;
        b=P8MqC4r+GsxGE0EUhNbvIFWAOyme4GMvLw3MYJM9g+4d1hFvv3OgMg6MQgJlhS0W9k
         oHZsVgfQNlA9WqaLRmwEhEmjGDt/nlLk6IYMrKrmEwSMwB5+sQUCz2kLxq9DWGNq9cHR
         2IaK8ZlMhLhH2UeGfo/L18lza1Y33475uVyZOBk+bo0PYz7NykrZ2U9iDoonrFZ4aZGt
         SrwMeGgSQLYBfAdV389Hfoqkk14laHUoRnIK4WfsR25KCztYGgz4AAA9Gq9jfNH2rpPm
         MW8Jsj1xFQtC0h1i6J9EpS4wcv7+R6pa8jCk8BElTOeWIcyW6yV6WiXeyUzBkH2YpJvD
         HvpA==
X-Gm-Message-State: AOAM531kUrUe6F2kaV/5IB0CMi4kkRKlKErD3EpMOHDO3AAlRDsQFFlY
	vfS0j2iibIO8pIT6TzEohBvUFA==
X-Google-Smtp-Source: ABdhPJwcvKtM5jhdS3YsI5r7hMACi454CwY+fgrW+dL6vnzhXzbiIQWgJa4AZr7U8RFCCHwGBlaqKw==
X-Received: by 2002:adf:f30a:: with SMTP id i10mr5831208wro.296.1602104464877;
        Wed, 07 Oct 2020 14:01:04 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from f.c.8.7.1.0.8.4.a.6.c.a.3.f.8.f.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (f.c.8.7.1.0.8.4.a.6.c.a.3.f.8.f.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:f8f3:ac6a:4801:78cf])
        by smtp.gmail.com with ESMTPSA id q9sm4276065wrd.57.2020.10.07.14.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 14:01:04 -0700 (PDT)
Message-ID: <f4645924503fb12bd092e48a0c0ea7f20de88dbf.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] pseudo: do not expand symlinks in /proc
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Sakib Sajal <sakib.sajal@windriver.com>, 
	openembedded-core@lists.openembedded.org
Cc: seebs@seebs.net, Matt Cowell <matt.cowell@nokia.com>
Date: Wed, 07 Oct 2020 22:01:03 +0100
In-Reply-To: <20200925170532.19685-1-sakib.sajal@windriver.com>
References: <20200925170532.19685-1-sakib.sajal@windriver.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-09-25 at 13:05 -0400, Sakib Sajal wrote:
> From: Matt Cowell <matt.cowell@nokia.com>
> 
> Some symlinks in /proc, such as those under /proc/[pid]/fd,
> /proc/[pid]/cwd, and /proc/[pid]/exe that are not real and should not
> have readlink called on them.  These look like symlinks, but behave
> like
> hardlinks.  Readlink does not return actual paths.  Previously
> pseudo_fix_path would expand files such as /dev/stdin to paths such
> as
> /proc/6680/fd/pipe:[1270830076] which do not exist.
> 
> This issue affects:
> - deleted files
> - deleted directories
> - fifos
> - sockets
> - anon_inodes (epoll, eventfd, inotify, signalfd, timerfd, etc)
> 
> Testing:
> timed builds before and after applying patch, without significant
> measurable difference.
> $ bitbake -c compile <image>; time bitbake <image>
> 
> installed pseudo on an image and was unable to reproduce the test
> on bug report after applying the patch.
> 
> FIXES: Bug 13288
> 
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>

I added this on top of the other recent pseudo patches and
unfortunately, it threw a lot of errors. One example:

path mismatch [2 links]: ino 44446916 db '/home/pokybuild/yocto-worker/edgerouter-alt/build/build/tmp/work/all-poky-linux/volatile-binds/1.0-r0/package/sbin' req '/proc/self/fd/3/./sbin'.

which shows it ended up passing an invalid path into the database.

I'm going to have to back this change out until we can figure out how
to reconcile this with path mismatch errors now being fatal.

Cheers,

Richard



