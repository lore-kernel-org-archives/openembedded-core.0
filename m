Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web12.39696.1629814872575512177
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Aug 2021 07:21:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=XBTjE981;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.51, mailfrom: steve@sakoman.com)
Received: by mail-wr1-f51.google.com with SMTP id n5so19234121wro.12
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Aug 2021 07:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vaRHoCB9r2Z9gC1eneH95z9/SmYNyYTeoS5XSNvkFXE=;
        b=XBTjE981zCsI9oixnP9FmNAKQF8xEKyATZklhwbbFqvaXfvfOYzyDwbkePOw1v4TOM
         3K8z/YMNncRqscFEsntNYRhEJHJxBJSpPVjItLii+GL2mWP35l0SKrDfM245o8tEkayS
         J9ZUNlGXMYgzVrOpY0alujEe2RdualReZLn7W0hTreT/rwzvGhabWfYUtgYON8G0iuf1
         OQ/KyxLWydooEqPxLYkBrAs1Lt8O/+35u973AgQfcdSPNkdWBjaqBZ0a8QVovZ2x161r
         3XWji7y2hb+DuJMNcdgNAVHC3pvvcxfPPMlSd096O7oEwFocZVRiEIh0SOPEMJtBUfEZ
         5oMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vaRHoCB9r2Z9gC1eneH95z9/SmYNyYTeoS5XSNvkFXE=;
        b=cwIDPt0ef8zkSTxeZGXMxCQ8WzrlNdyCLpBMWLs80KihXeJ2eAUksOhAqJuOSJ6+4i
         6n/j520C+lwkaadM8ieXCrYzOyb5rS+GHTqdIgePW1D0aWV3jSRnEoPUVhsPoX4lGzjc
         LLzlBpeoUNmFN+x18979D7fVprTUBiJXNn+MVrWonKOOv9i7LTqVcLsUPnWqz6wNqKqK
         VyKTHKIvJHL+7TxTjwnNqJWt0Vy9yp446wB+vm6DYZtIMVi+Y2MsuTM6S2PbggviEOFE
         2ZVREm6yj4VaEd67VUlJ5OlMm5f+kXo77z2XVK87GnfvzZvc171uEMlBfa+RjmeLgSHn
         OUIQ==
X-Gm-Message-State: AOAM532ziw9/Rx7kI//EyUWlP8zw7QFQ3/yWDXYQn2jmksDNULU1VfUF
	Puj1QOo/213hj8KUXyJ2KIy+tKbDSScBm7LMwd5xlQ==
X-Google-Smtp-Source: ABdhPJwo2IRcLu+6zQe477JqduTv8aADS/3RXcR82ftu6t/FfH2GehA7VxhCxs0nTt3s17FvyTNRshQJVfop3BOAEgY=
X-Received: by 2002:a5d:4010:: with SMTP id n16mr19802173wrp.205.1629814870835;
 Tue, 24 Aug 2021 07:21:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210823135250.767173-1-andrei@gherzan.com>
In-Reply-To: <20210823135250.767173-1-andrei@gherzan.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Tue, 24 Aug 2021 04:20:58 -1000
Message-ID: <CAOSpxdYA6FchYLNRASehUkPcQkdHkjRJyjE6VaX0z--y6m3BWg@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH 1/2] bitbake: fetch2: fix handling of `\` in file:// SRC_URI
To: Andrei Gherzan <andrei@gherzan.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Leif Middelschulte <leif.middelschulte@klsmartin.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 23, 2021 at 3:53 AM Andrei Gherzan <andrei@gherzan.com> wrote:
>
> From: Leif Middelschulte <leif.middelschulte@klsmartin.com>
>
> Using backslashes in file:// URIs was broken.
> Either the resolver would fail or the subsequent `cp` command.
> Try to avoid this by putting the filenames into quotes.
>
> Fixes https://bugzilla.yoctoproject.org/show_bug.cgi?id=8161
>
> (Bitbake rev: aa857fa2e9cf3b0e43a9049b04ec4b0b3c779b11)

Patches for bitbake should be sent to: bitbake-devel@lists.openembedded.org

I tried applying this patch, but found that it caused errors on the autobuilder:

https://errors.yoctoproject.org/Errors/Build/129189/

Steve

> Signed-off-by: Leif Middelschulte <leif.middelschulte@klsmartin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  bitbake/lib/bb/fetch2/__init__.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/bitbake/lib/bb/fetch2/__init__.py b/bitbake/lib/bb/fetch2/__init__.py
> index dc99914cd9..ece07f611c 100644
> --- a/bitbake/lib/bb/fetch2/__init__.py
> +++ b/bitbake/lib/bb/fetch2/__init__.py
> @@ -1525,7 +1525,7 @@ class FetchMethod(object):
>                      if urlpath.find("/") != -1:
>                          destdir = urlpath.rsplit("/", 1)[0] + '/'
>                          bb.utils.mkdirhier("%s/%s" % (unpackdir, destdir))
> -                cmd = 'cp -fpPRH %s %s' % (file, destdir)
> +                cmd = 'cp -fpPRH "%s" "%s"' % (file, destdir)
>
>          if not cmd:
>              return
> --
> 2.31.1
>
>
> 
>
