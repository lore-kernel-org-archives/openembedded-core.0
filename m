Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D91CC61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 10:52:51 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.11597.1675939961137879732
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Feb 2023 02:52:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SYBcoj49;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id by3so19530wrb.10
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 02:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QRFXbPHcJKPCsR6Gw8K0lHEFl+dQcaM35qHsv9pEDqA=;
        b=SYBcoj493MMFSOqt8t30O7AiDheEn73lkoe+aXYZl/OUq32Wej4uaXT1W1DiDjjalm
         4nOkAALG/49Ne16TFpOtmmfVx3Oa3u+wmRwuhicUgTTB1nY7vfk8JctGduNfOIVtD8X2
         +NqF3uAnP9Y0/LzgBn9u93wVW+vLfKh61XnIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QRFXbPHcJKPCsR6Gw8K0lHEFl+dQcaM35qHsv9pEDqA=;
        b=Ypq7JB725aSH91RRhgGYL/XpqIqutRWzITNlMF1ZuqA9Psf3mqyQi3MoxJz69prypp
         ezJ8MUIodcPxFCvjMK3odBZqqE3xJ7MNspEYe7j8QrseEv/lu2CIYoweVE6xi0dY8/P5
         SjT2qsoxGOxn2rwQLpqyj1tR4/mLOs0F/cTudLXMgW2HmsMbKKwkZdXAX4h7FIIzVB6o
         NGPEwybv/OzHypOprIFKLWB28yEdggs2mQvqIY+r96Be92CT44Od97Fdx3GsiwZp9MOK
         GHkqi66+EeNNJBTO47oCxAupwh/VAZs4HWdQ5DeY8YOIsNX3RdXXoUlyl8cc3tr211vb
         BHIw==
X-Gm-Message-State: AO0yUKU81uyc1tGYuA9mcxtiCflJ6FNK+lWPDz8/ZDtRWyGUX8xCV39N
	k4YWalHqdh6eGW1Zlzaon0JYxQ==
X-Google-Smtp-Source: AK7set8WbmWIBR3AsH4MfNmD85eenLwsefbZUzdGx7BXJBVKnFDdE4V8Wj6HQKHItBe/zc03oP6Tdg==
X-Received: by 2002:a05:6000:cd:b0:2c3:dc42:524e with SMTP id q13-20020a05600000cd00b002c3dc42524emr9851706wrx.10.1675939959624;
        Thu, 09 Feb 2023 02:52:39 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:29cf:6f5:fc42:8eb4? ([2001:8b0:aba:5f3c:29cf:6f5:fc42:8eb4])
        by smtp.gmail.com with ESMTPSA id v18-20020a5d4a52000000b002c3f210e8c0sm986589wrs.19.2023.02.09.02.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 02:52:39 -0800 (PST)
Message-ID: <0247a2bf6487a3006ddb0e7e680c0884752eb82f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 2/8] oeqa ssh.py: fix hangs in run()
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 09 Feb 2023 10:52:38 +0000
In-Reply-To: <Y+TMYFwTm+oYFAf4@nuoska>
References: <20230209080936.148489-1-mikko.rapeli@linaro.org>
	 <20230209080936.148489-3-mikko.rapeli@linaro.org>
	 <0be6e722c77f3e16e58279b1bcd900f39d71ac9b.camel@linuxfoundation.org>
	 <Y+TMYFwTm+oYFAf4@nuoska>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 10:52:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176941

On Thu, 2023-02-09 at 12:35 +0200, Mikko Rapeli wrote:
> Hi,
>=20
> On Thu, Feb 09, 2023 at 10:20:36AM +0000, Richard Purdie wrote:
> > On Thu, 2023-02-09 at 10:09 +0200, Mikko Rapeli wrote:
> > > When qemu machine hangs, the ssh commands done by tests
> > > are not timing out. do_testimage() task has last logs like this:
> > >=20
> > > DEBUG: time: 1673531086.3155053, endtime: 1673531686.315502
> > >=20
> > > The test process is stuck for hours, or for ever if the
> > > executing command or test case did not set a timeout correctly.
> > > The default 300 second timeout is not working when target hangs.
> > > Note that timeout is really a "inactive timeout" since data returned
> > > by the process will reset the timeout.
> > >=20
> > > Make the process stdout non-blocking so read() will always return
> > > right away using os.set_blocking() available in python 3.5 and later.
> > >=20
> > > Then change from python codec reader to plain read() and make
> > > the ssh subprocess stdout non-blocking. Even with select()
> > > making sure the file had input to be read, the codec reader was
> > > trying to find more stuff and blocking for ever when process hangs.
> > >=20
> > > While at it, add a small timeout to read data in larger chunks if
> > > possible. This avoids reading data one or few characters at a time
> > > and makes the debug logs more readable.
> > >=20
> > > close() the stdout file in all cases after read loop is complete.
> > >=20
> > > Then make sure to wait or kill the ssh subprocess in all cases.
> > > Just reading the output stream and receiving EOF there does not mean
> > > that the process exited, and wait() needs a timeout if the process
> > > is hanging. In the end kill the process and return the return value
> > > and captured output utf-8 encoded, just like before these changes.
> > >=20
> > > This fixes ssh run() related deadlocks when a qemu target hangs
> > > completely.
> > >=20
> > > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > > ---
> > >  meta/lib/oeqa/core/target/ssh.py | 33 +++++++++++++++++++++++++-----=
--
> > >  1 file changed, 26 insertions(+), 7 deletions(-)
> > >=20
> > > diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/ta=
rget/ssh.py
> > > index 13fd5b2a49..466a795eb4 100644
> > > --- a/meta/lib/oeqa/core/target/ssh.py
> > > +++ b/meta/lib/oeqa/core/target/ssh.py
> > > @@ -229,22 +229,28 @@ def SSHCall(command, logger, timeout=3DNone, **=
opts):
> > >          if timeout:
> > >              endtime =3D starttime + timeout
> > >              eof =3D False
> > > +            os.set_blocking(process.stdout.fileno(), False)
> > >              while time.time() < endtime and not eof:
> > > -                logger.debug('time: %s, endtime: %s' % (time.time(),=
 endtime))
> > >                  try:
> > > +                    logger.debug('Waiting for process output: time: =
%s, endtime: %s' % (time.time(), endtime))
> > >                      if select.select([process.stdout], [], [], 5)[0]=
 !=3D []:
> > > -                        reader =3D codecs.getreader('utf-8')(process=
.stdout, 'ignore')
> > > -                        data =3D reader.read(1024, 4096)
> > > +                        # wait a bit for more data, tries to avoid r=
eading single characters
> > > +                        time.sleep(0.2)
> > > +                        data =3D process.stdout.read()
> > >                          if not data:
> > > -                            process.stdout.close()
> > >                              eof =3D True
> > >                          else:
> > > -                            output +=3D data
> > > -                            logger.debug('Partial data from SSH call=
:\n%s' % data)
> > > +                            # ignore errors to capture as much as po=
ssible
> > > +                            string =3D data.decode('utf-8', errors=
=3D'ignore')
> >=20
> > I've been trying to remember why we have the reader here and  I think
> > the issue was you can't call decode on partial data :(.
>=20
> I get this. Sadly readers read more than file has available and they don'=
t have
> timeouts...
>=20
> > If it happens that there is a multi byte character on the stream
> > crossing the boundary then you'll get errors. "ignoring" them just
> > means you'll corrupt data. The case is rare but with long running
> > commands with utf8 data like some of the ptests, it can be an issue.
> >=20
> > That is why the code was written the way it was...
>=20
> For logging purposes errors are fine. Should the raw data be captured to
> output then? Or another conversion to utf-8 after all data has been
> read?

Converting at the end is one option.

The other option would be to feed the reader our own stream object
where it's read method would only return the data we have. I think you
can create dummy "file like" objects in python, it might be easiest
with io.BytesIO(). The codec reader could then interact with that as a
dummy stream.=20


Cheers,

Richard


