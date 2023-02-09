Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41CD1C61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 10:20:41 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.11127.1675938038850952083
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Feb 2023 02:20:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Rccyu8R1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id z13so1081449wmp.2
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 02:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qeWvN5mTC4S8ypoqElVDZ6h4MR38R30YoR4/oyJKFl4=;
        b=Rccyu8R1JPQKu+gxrV9tzOFFMisZKlF8CqUB4t1lxFffMIaifM6gjbFOGXUwDrs8Ub
         UW0ZN7eemahJSD3QCPx8lzjIM5WeA3W3iNBN7qLiq6zHblkaYm8wy/5CQZA24HyTMy3t
         SOybDa2HC8QLr1NnEert4JazT+g1Y/s4bqxWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qeWvN5mTC4S8ypoqElVDZ6h4MR38R30YoR4/oyJKFl4=;
        b=IFZQiVKmCtvnOpH1sPw8YFWh5tQ6iXt9jkjIU2FjytbVCNaVtGfnOU17iwac7Hl2wv
         UwMkTrKhDvJnsQ2c9OFz8uEoywKrasgqao2w1ta26SvXrJP7uBPRe0JH8JRoMtFre+9H
         g8lCR43w/iWiGrkk4Ht32atJP9XBtFCxNErTfR/eVirGJhi9dTZiBJmngKdSrC06OcnO
         EiwHoaJx8wuD1nQoRiO1fZgxt3fqsaTbMi2n+1KIZvV7AKZhedWTCsJI8bVrM8tx4uX/
         BUxINC9Tho1eLBGq2nnmrfeM4jWFqptF3JKiQZY3S41qqY+uSxsoAMniVALA+YnkB71w
         65rg==
X-Gm-Message-State: AO0yUKVCvQyqAQ7gtryC/4cRI33a6XQaAtpObwyMBRrxFFYOINeBIHH6
	xaOX9QWjo8CI6WC/yOVQA2JSnA==
X-Google-Smtp-Source: AK7set/Zb2dGFx1HlTsu0xfXrh2X293aA2g26IgnBHafEUBoj5jLPhkLnC1O9narZ8cphBCl1DwYWg==
X-Received: by 2002:a05:600c:3b06:b0:3df:f85a:46fe with SMTP id m6-20020a05600c3b0600b003dff85a46femr12571807wms.40.1675938037048;
        Thu, 09 Feb 2023 02:20:37 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:29cf:6f5:fc42:8eb4? ([2001:8b0:aba:5f3c:29cf:6f5:fc42:8eb4])
        by smtp.gmail.com with ESMTPSA id i16-20020a05600c4b1000b003dc4fd6e624sm1377447wmp.19.2023.02.09.02.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 02:20:36 -0800 (PST)
Message-ID: <0be6e722c77f3e16e58279b1bcd900f39d71ac9b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 2/8] oeqa ssh.py: fix hangs in run()
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 09 Feb 2023 10:20:36 +0000
In-Reply-To: <20230209080936.148489-3-mikko.rapeli@linaro.org>
References: <20230209080936.148489-1-mikko.rapeli@linaro.org>
	 <20230209080936.148489-3-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 10:20:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176939

On Thu, 2023-02-09 at 10:09 +0200, Mikko Rapeli wrote:
> When qemu machine hangs, the ssh commands done by tests
> are not timing out. do_testimage() task has last logs like this:
>=20
> DEBUG: time: 1673531086.3155053, endtime: 1673531686.315502
>=20
> The test process is stuck for hours, or for ever if the
> executing command or test case did not set a timeout correctly.
> The default 300 second timeout is not working when target hangs.
> Note that timeout is really a "inactive timeout" since data returned
> by the process will reset the timeout.
>=20
> Make the process stdout non-blocking so read() will always return
> right away using os.set_blocking() available in python 3.5 and later.
>=20
> Then change from python codec reader to plain read() and make
> the ssh subprocess stdout non-blocking. Even with select()
> making sure the file had input to be read, the codec reader was
> trying to find more stuff and blocking for ever when process hangs.
>=20
> While at it, add a small timeout to read data in larger chunks if
> possible. This avoids reading data one or few characters at a time
> and makes the debug logs more readable.
>=20
> close() the stdout file in all cases after read loop is complete.
>=20
> Then make sure to wait or kill the ssh subprocess in all cases.
> Just reading the output stream and receiving EOF there does not mean
> that the process exited, and wait() needs a timeout if the process
> is hanging. In the end kill the process and return the return value
> and captured output utf-8 encoded, just like before these changes.
>=20
> This fixes ssh run() related deadlocks when a qemu target hangs
> completely.
>=20
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  meta/lib/oeqa/core/target/ssh.py | 33 +++++++++++++++++++++++++-------
>  1 file changed, 26 insertions(+), 7 deletions(-)
>=20
> diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target=
/ssh.py
> index 13fd5b2a49..466a795eb4 100644
> --- a/meta/lib/oeqa/core/target/ssh.py
> +++ b/meta/lib/oeqa/core/target/ssh.py
> @@ -229,22 +229,28 @@ def SSHCall(command, logger, timeout=3DNone, **opts=
):
>          if timeout:
>              endtime =3D starttime + timeout
>              eof =3D False
> +            os.set_blocking(process.stdout.fileno(), False)
>              while time.time() < endtime and not eof:
> -                logger.debug('time: %s, endtime: %s' % (time.time(), end=
time))
>                  try:
> +                    logger.debug('Waiting for process output: time: %s, =
endtime: %s' % (time.time(), endtime))
>                      if select.select([process.stdout], [], [], 5)[0] !=
=3D []:
> -                        reader =3D codecs.getreader('utf-8')(process.std=
out, 'ignore')
> -                        data =3D reader.read(1024, 4096)
> +                        # wait a bit for more data, tries to avoid readi=
ng single characters
> +                        time.sleep(0.2)
> +                        data =3D process.stdout.read()
>                          if not data:
> -                            process.stdout.close()
>                              eof =3D True
>                          else:
> -                            output +=3D data
> -                            logger.debug('Partial data from SSH call:\n%=
s' % data)
> +                            # ignore errors to capture as much as possib=
le
> +                            string =3D data.decode('utf-8', errors=3D'ig=
nore')

I've been trying to remember why we have the reader here and  I think
the issue was you can't call decode on partial data :(.

If it happens that there is a multi byte character on the stream
crossing the boundary then you'll get errors. "ignoring" them just
means you'll corrupt data. The case is rare but with long running
commands with utf8 data like some of the ptests, it can be an issue.

That is why the code was written the way it was...

Cheers,

Richard



