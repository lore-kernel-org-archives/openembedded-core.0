Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.9784.1620309750476251323
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 May 2021 07:02:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=hzxY+trB;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.41, mailfrom: steve@sakoman.com)
Received: by mail-wr1-f41.google.com with SMTP id a4so5756854wrr.2
        for <openembedded-core@lists.openembedded.org>; Thu, 06 May 2021 07:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CjexoIdRY/Gyz+6sncPzpI2sF0dCkHIoAtG+atc4Zi4=;
        b=hzxY+trB5rANDfkArhYItWQhrs+HtkKWrqLsr0OB2eUGK76ZMuPo8susDPhR8HhWDM
         SKJvSUGaSyLZtSbYDQecDINFakO1GgQHx04IoRIyEoUGMi06Ieraxa3/VwjbbhmaXnY6
         nMiTjT9GBI6Htp+wAtxlOn4PewjF8YnX3hYRvoU+hA5tYbstlrar94gyPXXzGsDoQm+L
         U+FMnW6Nxxe3PN1379imk8FRRu5w6PQkF0gQQnuWeo5F79GBQaVdo8fBxbEjG4Crutjg
         +ih1sVyJbqFcFDgTy4RBjkCIp30ZzzoTzWkOCPwJn0bt/qQaGyGShDEnd2/QCV+8IniV
         /yEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CjexoIdRY/Gyz+6sncPzpI2sF0dCkHIoAtG+atc4Zi4=;
        b=WlmNNhv0sPysiEOSUc08x7tHXwkhV2mkZr/prlU3QnBAmsOSk4q4HlHo0UTl/kt7kK
         SwevH8u3RQ1hb7zBB9B9AWia7qh/HwPGE87ycQJgv+bEzxxYA2EgDClmlC30P4eNzo6N
         EqYhhYhdeOyIsVD/+2aNlAC0hBW5gAtXqWq28AKe5CE0H3HlwrGTxk0ZSKJ6UV51669A
         DUPqwJqNM37D9UNHp8YANf/JZ67046oG9AIGNk2Ccbyuhti7x0G+Wn8V5tD9JnkX2vab
         2ScUM5auvqQrzZcRTqMqmo2U6jjTZy+wZaTOr7mQYqnfWdzmIfl/3Zir8gbv/Clo/Stj
         OGTw==
X-Gm-Message-State: AOAM533WCdK17MK9oaKH8MlnOuFuCXlze+d7cJIj5xXQ59t0w6E/RJgY
	gJrs/TkYI1Pf74uZFk9yHO4218+bSd4XjiSQbiD6jA==
X-Google-Smtp-Source: ABdhPJzqgmRsibcY5Jq13VL+1FFJddGNEVzQQ/8t1pLmtcyhgZ3K5cVj6/zCnUQkjpztoUVrIwD8+igbXW4hCq7f+aQ=
X-Received: by 2002:adf:ee83:: with SMTP id b3mr5294293wro.329.1620309748384;
 Thu, 06 May 2021 07:02:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210505214006.10382-1-JPEWhacker@gmail.com> <5ae0a2df-0ea1-a23f-6932-8088739fee29@gmail.com>
In-Reply-To: <5ae0a2df-0ea1-a23f-6932-8088739fee29@gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Thu, 6 May 2021 04:02:16 -1000
Message-ID: <CAOSpxdasVRPCEmQwcfHN=6xvHaVYgcDF74KxSRe0_0u4aAvwsA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] classes/image: Use xargs to set file timestamps
To: Joshua Watt <jpewhacker@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Anuj Mittal <anuj.mittal@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, May 6, 2021 at 3:39 AM Joshua Watt <jpewhacker@gmail.com> wrote:
>
> Can we backport this to hardknott and dunfell (and gatesgarth if it's
> still active)?

Yes, will backport to dunfell!

Steve

> On 5/5/21 4:40 PM, Joshua Watt wrote:
> > Instead of having find directly invoke touch for each file in the root
> > file system, pass a list to xargs for batching. This significantly
> > reduces the number of times the touch program is invoked and speeds up
> > the do_image task time:
> >
> >      PKG           TASK      ABSDIFF  RELDIFF  CPUTIME1 -> CPUTIME2
> >      my-image      do_image   -45.3s   -94.2%     48.1s -> 2.8s
> >
> >      Cumulative cputime:
> >        -44.3s    -92.3%    00:48.1 (48.1s) -> 00:03.7 (3.7s)
> >
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > ---
> >   meta/classes/image.bbclass | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> > index 013455f492..353cc67175 100644
> > --- a/meta/classes/image.bbclass
> > +++ b/meta/classes/image.bbclass
> > @@ -657,7 +657,7 @@ reproducible_final_image_task () {
> >           fi
> >           # Set mtime of all files to a reproducible value
> >           bbnote "reproducible_final_image_task: mtime set to $REPRODUCIBLE_TIMESTAMP_ROOTFS"
> > -        find  ${IMAGE_ROOTFS} -exec touch -h  --date=@$REPRODUCIBLE_TIMESTAMP_ROOTFS {} \;
> > +        find  ${IMAGE_ROOTFS} -print0 | xargs -0 touch -h  --date=@$REPRODUCIBLE_TIMESTAMP_ROOTFS
> >       fi
> >   }
> >
