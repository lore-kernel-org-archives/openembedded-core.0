Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 650B7C61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 10:35:21 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.11287.1675938916465839019
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Feb 2023 02:35:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=GciWDLgQ;
 spf=pass (domain: linaro.org, ip: 209.85.218.48, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-ej1-f48.google.com with SMTP id hx15so4920875ejc.11
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 02:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PAC9/3YLj4xCT69e+zx3rGcIU09UQtI+aeBXaD+80rQ=;
        b=GciWDLgQWgOzCVf4nnqANrtmzkxSHLrM7i21lJsTvqrI3dTRTf3LL/27KvCED1RCR3
         /ZY4e126+LuUQhFGuGsn7TvyNMjnX+P/D2o00LlZCPB+lrPevSQEObKDPKsNcYDI8n60
         aXnpkOZhSWa8r4xDg2+q7yWeXXyTdH+eP2FrKwsioC3tfCck8lb5qagiott3YOhD31DG
         i8Xj88OvrNERyX0IW75Xa3PUJoG7eHbL3a3fTlLnRHNVdAt7RbUg78pGCUGRpXe0MAhi
         hEEWANstvTc3JSIT1j2adz/GgmebMYAGLqbN+jHSf4FfSIb4NJ91Vo+mgdMpET6PtFsr
         adEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PAC9/3YLj4xCT69e+zx3rGcIU09UQtI+aeBXaD+80rQ=;
        b=rKNd+dwgQSvnvWBqV92wUSv+31IKRKCLjDlRHz9rVnNEhqYrYEcpjB1OunMLK654KY
         hGMAmRTuSfziBcgiW7M91tQQh0hF4Euc+5zgEPHR4iLcsyyVnpkAnU4fDAJTZK2NU4Qs
         heAkLGOsbH6jwpUMRDkIXEnsXLIq7gAV1Gg1Xs478Ww5hTsMQ/S3q3Ow4t+Dq8M5hIS5
         8O2ji5Tt8Dj1FBbLF8IAeyMWP/vN00AIX+LZrQkKhlt2icUuv4w7R1lhIs1qqiIh8hfm
         EcOD5E7i1rtgy/3QHyUXGxi6Nc/8BeSyQ6GGhNxwR5CSor9Bq3NRUm/lX4LbpJlEJOME
         RJYw==
X-Gm-Message-State: AO0yUKVTkjljytVY5Ow1CN0f9OMqAEjp3OrS3l+p0wv+81lGO5oNm9Fp
	UpGY5puYWt6FjHuuRXd3zBDD7A==
X-Google-Smtp-Source: AK7set8UZP3JmOS7LogoHcANWZSDq25MajP31EniD/l3qqYHTgtqfj8DjvsCXCZheAcOwYYthsEkUg==
X-Received: by 2002:a17:906:dd9:b0:884:3707:bd83 with SMTP id p25-20020a1709060dd900b008843707bd83mr10365973eji.69.1675938914931;
        Thu, 09 Feb 2023 02:35:14 -0800 (PST)
Received: from nuoska (dsl-olubng11-54f814-94.dhcp.inet.fi. [84.248.20.94])
        by smtp.gmail.com with ESMTPSA id s8-20020a170906168800b00887a23bab85sm685328ejd.220.2023.02.09.02.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 02:35:14 -0800 (PST)
Date: Thu, 9 Feb 2023 12:35:12 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2 2/8] oeqa ssh.py: fix hangs in run()
Message-ID: <Y+TMYFwTm+oYFAf4@nuoska>
References: <20230209080936.148489-1-mikko.rapeli@linaro.org>
 <20230209080936.148489-3-mikko.rapeli@linaro.org>
 <0be6e722c77f3e16e58279b1bcd900f39d71ac9b.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0be6e722c77f3e16e58279b1bcd900f39d71ac9b.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 10:35:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176940

Hi,

On Thu, Feb 09, 2023 at 10:20:36AM +0000, Richard Purdie wrote:
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
> >                          else:
> > -                            output += data
> > -                            logger.debug('Partial data from SSH call:\n%s' % data)
> > +                            # ignore errors to capture as much as possible
> > +                            string = data.decode('utf-8', errors='ignore')
> 
> I've been trying to remember why we have the reader here and  I think
> the issue was you can't call decode on partial data :(.

I get this. Sadly readers read more than file has available and they don't have
timeouts...

> If it happens that there is a multi byte character on the stream
> crossing the boundary then you'll get errors. "ignoring" them just
> means you'll corrupt data. The case is rare but with long running
> commands with utf8 data like some of the ptests, it can be an issue.
>
> That is why the code was written the way it was...

For logging purposes errors are fine. Should the raw data be captured to
output then? Or another conversion to utf-8 after all data has been
read?

Reading more than one character at a time for sure helps here but
granted there may be windows where we hit the in character bytes..

Cheers,

-Mikko

