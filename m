Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C5DAC05027
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 09:36:11 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.10526.1675935368166254035
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Feb 2023 01:36:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=p4Q7W58U;
 spf=pass (domain: linaro.org, ip: 209.85.218.53, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-ej1-f53.google.com with SMTP id jg8so4539375ejc.6
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 01:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MxoyKz5TbevgQPewBlUrY9hzq4PP6PnQ6sqCuHaMlD0=;
        b=p4Q7W58U5GpMX7PG1xmC6UxJdLc6X7bTz0k61DrF7zPPy23UYqN4zHuSltgVaaGvdX
         FIFgMERMgjUroYykW34arK93ZrYWdPPz1zn4SavMocckeAYIr7eZcaFuZGZ/snq68GuM
         CSUfutM8t/G4mpUxqhhFKNOfTivh+OVAxiTh3x1bqfWpnVyGdqIRKnUrmyqweRGNB2qi
         tKUowsk3rtlUdJp4O+mqtgRSMIcfC3te2Z+FH7T1J7dmza7AZmHspOCvOvbCUDxlyzga
         6czDMwmM+5yrNMgHobdrSWGwskNt3OuPoo6YSLaCidzYhyc9s9kupUZFyvguPTZijEfq
         njAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MxoyKz5TbevgQPewBlUrY9hzq4PP6PnQ6sqCuHaMlD0=;
        b=cKyyTIbZ0U1IJPvr5WeUcgoV5rJufyHpGztSUUxZbsn2meANiMxEkPSqRwxX8jjOR2
         j0fjckIByfmTmuve+H/JhzLZE2Wqt1mpgCzxx7jYzSGxr8uxvoBU1oKi8NVeBgg/Oxxp
         1Doj+8r/VaFH68APl4tCVAxjWLbc6vrEg3qkvc4EfwA8cWwAVlf6lGRbTpEwxj5XOXcc
         Sqccgo/e2fotDCmB1sCgOIDqcLdRmGwBq88wfKM2xS+ojLjup0S95LV4g6GR9n/WJ/vs
         xoaEmNbJVybs1UW8/uqg1PbxATnRqXS22aJosO6ikfDguvNzn44/Cd8bW95PYNsQmUWH
         tBiA==
X-Gm-Message-State: AO0yUKUhXOqmBMCE8KPurKSi739sG9njY/ejnxyGZzg7Uh0RPH3Ka2d9
	8TUQ9BWMsqGOGlKjQwhoBh0M1Q==
X-Google-Smtp-Source: AK7set+jixE1EhrHhNc4Ja3cApvB6w1/udaju+t8ujvh9+xstzzRptUH7r2REFa7trCj34PFFLeLPQ==
X-Received: by 2002:a17:907:1686:b0:844:79b1:ab36 with SMTP id hc6-20020a170907168600b0084479b1ab36mr9201562ejc.25.1675935366302;
        Thu, 09 Feb 2023 01:36:06 -0800 (PST)
Received: from nuoska (dsl-olubng11-54f814-94.dhcp.inet.fi. [84.248.20.94])
        by smtp.gmail.com with ESMTPSA id u15-20020a17090657cf00b008784ecb2dd5sm639471ejr.104.2023.02.09.01.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 01:36:05 -0800 (PST)
Date: Thu, 9 Feb 2023 11:36:03 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2 2/8] oeqa ssh.py: fix hangs in run()
Message-ID: <Y+S+g0W4NZ+0zd5g@nuoska>
References: <20230209080936.148489-1-mikko.rapeli@linaro.org>
 <20230209080936.148489-3-mikko.rapeli@linaro.org>
 <b9dd7731ad6e5e5bbe2a061f87c2d2452ca6524f.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9dd7731ad6e5e5bbe2a061f87c2d2452ca6524f.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 09:36:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176933

Hi,

On Thu, Feb 09, 2023 at 09:15:10AM +0000, Richard Purdie wrote:
> On Thu, 2023-02-09 at 10:09 +0200, Mikko Rapeli wrote:
> > When qemu machine hangs, the ssh commands done by tests
> > are not timing out. do_testimage() task has last logs like this:
> > 
> > DEBUG: time: 1673531086.3155053, endtime: 1673531686.315502
> > 
> > The test process is stuck for hours, or for ever if the
> > executing command or test case did not set a timeout correctly.
> > The default 300 second timeout is not working when target hangs.
> > Note that timeout is really a "inactive timeout" since data returned
> > by the process will reset the timeout.
> > 
> > Make the process stdout non-blocking so read() will always return
> > right away using os.set_blocking() available in python 3.5 and later.
> > 
> > Then change from python codec reader to plain read() and make
> > the ssh subprocess stdout non-blocking. Even with select()
> > making sure the file had input to be read, the codec reader was
> > trying to find more stuff and blocking for ever when process hangs.
> > 
> > While at it, add a small timeout to read data in larger chunks if
> > possible. This avoids reading data one or few characters at a time
> > and makes the debug logs more readable.
> > 
> > close() the stdout file in all cases after read loop is complete.
> > 
> > Then make sure to wait or kill the ssh subprocess in all cases.
> > Just reading the output stream and receiving EOF there does not mean
> > that the process exited, and wait() needs a timeout if the process
> > is hanging. In the end kill the process and return the return value
> > and captured output utf-8 encoded, just like before these changes.
> > 
> > This fixes ssh run() related deadlocks when a qemu target hangs
> > completely.
> > 
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> >  meta/lib/oeqa/core/target/ssh.py | 33 +++++++++++++++++++++++++-------
> >  1 file changed, 26 insertions(+), 7 deletions(-)
> > 
> > diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
> > index 13fd5b2a49..466a795eb4 100644
> > --- a/meta/lib/oeqa/core/target/ssh.py
> > +++ b/meta/lib/oeqa/core/target/ssh.py
> > @@ -229,22 +229,28 @@ def SSHCall(command, logger, timeout=None, **opts):
> >          if timeout:
> >              endtime = starttime + timeout
> >              eof = False
> > +            os.set_blocking(process.stdout.fileno(), False)
> >              while time.time() < endtime and not eof:
> > -                logger.debug('time: %s, endtime: %s' % (time.time(), endtime))
> >                  try:
> > +                    logger.debug('Waiting for process output: time: %s, endtime: %s' % (time.time(), endtime))
> >                      if select.select([process.stdout], [], [], 5)[0] != []:
> > -                        reader = codecs.getreader('utf-8')(process.stdout, 'ignore')
> > -                        data = reader.read(1024, 4096)
> > +                        # wait a bit for more data, tries to avoid reading single characters
> > +                        time.sleep(0.2)
> > +                        data = process.stdout.read()
> >                          if not data:
> > -                            process.stdout.close()
> >                              eof = True
> 
> I'm not sure I understand the use of eof now. If stdout is non-
> blocking, it would be perfectly normal for it to return with no data
> but that doesn't mean we're at eof, it just means there is no data
> ready?

The select() makes sure that there must be data available for read(), or eof when the
file descriptor is closed. But closed file descriptor does not mean that
the subprocess is dead. For that we must wait() with a timeout and
possibly after that kill().

> I suspect the code might be ok but we should stop calling it eof since
> it no longer is?
> 
> I also tend to dislike sleep() codepaths as it usually means the code
> is sub optimal. I was going to make further suggestions but I stepped
> back and looked at the bigger picture of the code.

I think sleep() is ok in this case to reduce busy looping over serial
console and read() more data than what select() initially saw. Reading
single character at a time is a bit silly and just wastes CPU time when
we don't need ms level accuracy.

> The code is basically doing:
> 
>         if timeout:
>             <complex code>
>         else:
>             output = process.communicate()
> 
> 
> Python 3.3 added a timeout parameter to subprocess.communicate(). Can
> we just use that instead? Or is there something special about our needs
> which means we can't?

The current code uses timeout as "inactivity timeout" and thus code
reads output using select() and read() until the end or if there is no
output until timeout.

Code could use communicate() with a timeout but would still need to use
select() and read() loop to check if there was any output. I did not see
a simple way to rewrite this in a more pythonic way. The reader
iterators did the wrong thing and ended up dead locking when subprocess
hangs.

Cheers,

-Mikko

