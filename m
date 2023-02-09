Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E95FAC05027
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 09:15:20 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.10236.1675934113512457317
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Feb 2023 01:15:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bjPc+ONT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id j32-20020a05600c1c2000b003dc4fd6e61dso3368020wms.5
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 01:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1yGvI3q1NQETQ3yphMx2ZMDaRV0rDDRbXDQKS66e6R4=;
        b=bjPc+ONTYjVQB3AhqgwJzfI+limIWZ2IxjvVLarcUbqH+rM0f//comvfArvQBNhBEt
         lcQx8qdCYv/KvJElJyf2W+Yiy+5aSBskEGTC96Hi79HnKkLA+VWYpMILwLVdNMhqtgKx
         QwNyhP1ftIspCDq6dl1KkmcgyxhVx8nJMB0+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1yGvI3q1NQETQ3yphMx2ZMDaRV0rDDRbXDQKS66e6R4=;
        b=27A3LpUZje2Sdux4zvFW9eczvN4VKeUbnoQ1f73seKGqlzZFVTLzKsdyAlV3oktBps
         t5gAj7aqnEfbiOF/MtrEPTGLOEs1SfbU94L16gL6V/MId6kCERH8no5RlNoytEtVSV0T
         1mW/WTUIOFhNtd9wBfo8SaA5BTV+GLIi/PjUvL+G0xirSWao/Mr4CRttf8ez2E3Naozi
         JP0WA6qEg8zIBeoKpkS2ZRCOoapNMMBNOXXEcD/rNUcRXk4ORAU8BxYgcejQOGk18BU+
         cpHWte06ID9YIv28OvqsQXNjzW2aDD3wXI49K8qUxplBsRdrZqtHTTRI55xvR2eD6L8q
         hr8w==
X-Gm-Message-State: AO0yUKUUTDWPEP0ARYoFgfCAgSy0T1mFT75TayWu4vq1nrQEQOA+n6Ym
	axJ/jjrGH07gN1G9ZNasicj3Dg==
X-Google-Smtp-Source: AK7set/Y8KLU/TwTS8+D/s2jrAL0zuuXxg/IyBSS5VfOM/aLrjdSTpEUREUsNDQyiSPo46gXU9B4Bg==
X-Received: by 2002:a05:600c:44d3:b0:3dc:4c4f:6dc5 with SMTP id f19-20020a05600c44d300b003dc4c4f6dc5mr9377049wmo.9.1675934111615;
        Thu, 09 Feb 2023 01:15:11 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:29cf:6f5:fc42:8eb4? ([2001:8b0:aba:5f3c:29cf:6f5:fc42:8eb4])
        by smtp.gmail.com with ESMTPSA id h2-20020a05600c350200b003dc434b39c7sm8605260wmq.0.2023.02.09.01.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 01:15:11 -0800 (PST)
Message-ID: <b9dd7731ad6e5e5bbe2a061f87c2d2452ca6524f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 2/8] oeqa ssh.py: fix hangs in run()
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 09 Feb 2023 09:15:10 +0000
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
 <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 09:15:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176930

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

I'm not sure I understand the use of eof now. If stdout is non-
blocking, it would be perfectly normal for it to return with no data
but that doesn't mean we're at eof, it just means there is no data
ready?

I suspect the code might be ok but we should stop calling it eof since
it no longer is?

I also tend to dislike sleep() codepaths as it usually means the code
is sub optimal. I was going to make further suggestions but I stepped
back and looked at the bigger picture of the code.

The code is basically doing:

        if timeout:
            <complex code>
        else:
            output =3D process.communicate()


Python 3.3 added a timeout parameter to subprocess.communicate(). Can
we just use that instead? Or is there something special about our needs
which means we can't?

Cheers,

Richard


