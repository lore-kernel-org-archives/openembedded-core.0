Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 988FFC636CD
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 14:23:02 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.24631.1675261376830732473
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 06:22:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=T6bvBUoj;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: jpewhacker@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id dr8so30299518ejc.12
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 06:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KycrnLq07JOF2ifTt5P7/jnBCXN0EL8xK7/HOrez8kk=;
        b=T6bvBUojABUG1rFRkTA5LQdQlNYSyhmD0cLhybBrWeifqcpU2eXZz3o1yFFiaVBZcN
         VU4a6hG2LvLQBv+Syd4lI5juxPdxn3CAKBMkUdBHkPOOmdgXZWv/JkUDYPBZ5uCYW6Mm
         SHcIbjdZnrktx4dQ/s3hCRg3lXf4ifeufKEshh4JNvckiaucaIrWm/1uhxMzZrOeHz6y
         lu+ZF7xhdxE2wpPd0KJu0s1Y4r7Q9y2hEw8pVTSzmgxrx7qnTB+QhzZHDiOvd5rNNR+n
         r9/ZNUnRNGAW+1fzGW3sAa6BW6Lx3n+a+TLpQDnlMFDlGk0iUGHHMZuvYtcnmMdGWXc6
         yArg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KycrnLq07JOF2ifTt5P7/jnBCXN0EL8xK7/HOrez8kk=;
        b=BvN9SMfLo3g/3HBh7nDPHfMIVtrMG2tqkYLm71cjEhNXsswkiSQ3Qas7nisKmH8rIJ
         r8jTLb5jGzLm5iMnB/1XLQWXH4x+CmcWTDVu4VRJ0BWD3HRw5I1gf6SIVIg4jvzdeN2z
         M+RS7T27Ex5ZfMq6VkfhPEygkB9m5MK/fr+IMy8Dz8LU2xvlNPJh6VumUqcsmsJM8NS+
         VIv0wPR45yNEHYRt1JSr225Gry0tme8DRrEX5eV/T2TX7vNloQxDwRWOYQ4A5EACjZCr
         a900tRYbX/RivZ+e6PV4EFFpTnzaQpSstHzLfhiX3b+QllOuSTYgV3/yWpkLqn89mxXL
         Fm+Q==
X-Gm-Message-State: AO0yUKXHGbejl2hPMyfQgvOvGPJwBjNyo+2XjxeIYqCPtcpGIvoyUyCZ
	bEQY+Zs5OKBC9PI28gRy7xjduHmv9g0WkGvoVLU=
X-Google-Smtp-Source: AK7set8z5piwGfD8DyWmzZ1wh0wtcQcSu+Zus82KYGo/vxfxuCQKWemMl0gepr8/Tq1H3XRO0ZYa697HM5BJIzIIlOY=
X-Received: by 2002:a17:906:9494:b0:885:3129:fa85 with SMTP id
 t20-20020a170906949400b008853129fa85mr725097ejx.51.1675261375156; Wed, 01 Feb
 2023 06:22:55 -0800 (PST)
MIME-Version: 1.0
References: <aba59b60b8eb52c2963aaaafa0308fbbf80443db.camel@linuxfoundation.org>
In-Reply-To: <aba59b60b8eb52c2963aaaafa0308fbbf80443db.camel@linuxfoundation.org>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 1 Feb 2023 08:22:43 -0600
Message-ID: <CAJdd5Gaer__3VAL6Tng2MvHRRrk2uTnwg1tAxKAbb-Hd=Sgs2A@mail.gmail.com>
Subject: Re: Current QA failure challenges (perf, QA http-server, asyncio
 prserv, bitbake runCommand timeout, unfsd test issue)
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, 
	Bruce Ashfield <bruce.ashfield@gmail.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 14:23:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176553

On Sun, Jan 29, 2023 at 9:41 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Hi All,
>
> I've going to be a distracted this next week with other project related
> things and the autobuilder is showing a number of problems. I've spent
> part of my weekend trying to stabilise things so I could not have the
> distraction and whilst I've had partial success, things aren't
> resolved. I'm sending this out in the hope others may be able to
> help/assist. The issues:
>
> Kernel 6.1 reproducibility issue in perf
> ========================================
>
> We've had two fixes which do seem to have fixed the kernel-devsrc issue
> but not the perf one. The diffoscope:
>
> http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20230129-8bp_1b_z/packages/diff-html/
>
> The autobuilder failure:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/2314/steps/13/logs/stdio
>
> Part of the issue is this seems to be host contamination, so you do
> need to build on a different host. The first time the test runs, it
> does so on the same host and the output is unchanged which is why we've
> had green builds but then failures.
>
> I did try removing the sstate for perf, the issue came back, so it
> isn't a cache contamination issue afaik.
>
>
> bitbake timeout on sending commands
> ===================================
>
> Bitbake runCommand appears to be able to hang in the send since
> there is no timeout set there. This can cause things to block. We need
> to put a worse case timeout/exit in there.
>
>
> unfs tests leave nfs server running
> ===================================
>
> After the unfs NFS test runs, we seem to leave an unfs server hanging
> around after the builds are long gone. These build up on the
> autobuilder workers.
>
>
> http-server in dnf tests breaking
> =================================
>
> We've started seeing a lot of short packets with the http-server used
> by the dnf package manager tests. dnf retries and succeeds leaving a
> failure in the logs which parse_logs picks up.
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/6592/steps/14/logs/stdio
> Central error: 2023-01-29T11:43:32+0000 INFO Error during transfer: Curl error (18): Transferred a partial file for http://192.168.7.1:36183/cortexa15t2hf_neon/libc6-2.36-r0.cortexa15t2hf_neon.rpm [transfer closed with 15758 bytes remaining to read]
> https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/6592/steps/14/logs/stdio
> Central error: 2023-01-29T11:07:31+0000 INFO Error during transfer: Curl error (18): Transferred a partial file for http://192.168.7.3:42417/core2_32/busybox-1.35.0-r0.core2_32.rpm [transfer closed with 14627 bytes remaining to read]
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/6598/steps/13/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/6532
>
> and a load more. Why the sudden increase in frequency, not sure. Could
> be 6.1 kernel related.
>
>
> asyncio issues with PR Serv
> ===========================
>
> I've found at least one bug with what the code was doing and fixing
> that should help some of the test failures we've seen. When looking
> into that I found more problems though.
>
> If you run "oe-selftest -r prservice -j 3 -K" and then look at the
> bitbake-cookerdaemon.log, it shows a load of python asyncio issues. The
> first one is:
>
> /usr/lib/python3.10/asyncio/base_events.py:685: ResourceWarning:
> unclosed event loop <_UnixSelectorEventLoop running=False closed=False
> debug=False>
>   _warn(f"unclosed event loop {self!r}", ResourceWarning, source=self)
>
> showing connections to the PR service aren't being cleaned up.

I can take a look at this if no one else gets there first, but not
until next week


>
> Also:
>
> /home/pokybuild/yocto-worker/oe-selftest-
> debian/build/bitbake/lib/bb/codeparser.py:472: ResourceWarning:
> unclosed <socket.socket fd=15, family=AddressFamily.AF_INET,
> type=SocketKind.SOCK_STREAM, proto=6, laddr=('127.0.0.1', 47910),
> raddr=('127.0.0.1', 40751)>
>   self.process_tokens(more_tokens)
>
> but the codeparser reference isn't accurate, it is just from the
> garbage collection point.
>
> The second issue is that in running the selftests, a PR Service process
> often seems to be left behind without bitbake running. It suggests some
> kind of lifecycle issue somewhere. It might only be happening in
> failure cases, not sure.
>
> The third issue seems to be around event loop shutdown. On debian11
> with py 3.9, when bitbake is shutting down we're seeing:
>
> 412934 07:12:26.081334 Exiting (socket: True)
> /usr/lib/python3.9/signal.py:30: ResourceWarning: unclosed
> <socket.socket fd=22, family=AddressFamily.AF_INET,
> type=SocketKind.SOCK_STREAM, proto=6, laddr=('127.0.0.1', 36287), r
> addr=('127.0.0.1', 36422)>
>   return enum_klass(value)
> ResourceWarning: Enable tracemalloc to get the object allocation
> traceback
> /usr/lib/python3.9/asyncio/selector_events.py:704: ResourceWarning:
> unclosed transport <_SelectorSocketTransport fd=22>
>   _warn(f"unclosed transport {self!r}", ResourceWarning, source=self)
> ResourceWarning: Enable tracemalloc to get the object allocation
> traceback
> Traceback (most recent call last):
>   File "/home/pokybuild/yocto-worker/oe-selftest-
> debian/build/bitbake/lib/bb/asyncrpc/serv.py", line 71, in
> process_requests
>     d = await self.read_message()
> GeneratorExit
>
> During handling of the above exception, another exception occurred:
>
> Traceback (most recent call last):
>   File "/home/pokybuild/yocto-worker/oe-selftest-
> debian/build/bitbake/lib/bb/asyncrpc/serv.py", line 201, in
> handle_client
>     await client.process_requests()
>   File "/home/pokybuild/yocto-worker/oe-selftest-
> debian/build/bitbake/lib/bb/asyncrpc/serv.py", line 79, in
> process_requests
>     self.writer.close()
>   File "/usr/lib/python3.9/asyncio/streams.py", line 353, in close
>     return self._transport.close()
>   File "/usr/lib/python3.9/asyncio/selector_events.py", line 700, in
> close
>     self._loop.call_soon(self._call_connection_lost, None)
>   File "/usr/lib/python3.9/asyncio/base_events.py", line 746, in
> call_soon
>     self._check_closed()
>   File "/usr/lib/python3.9/asyncio/base_events.py", line 510, in
> _check_closed
>     raise RuntimeError('Event loop is closed')
> RuntimeError: Event loop is closed
> Task was destroyed but it is pending!
> task: <Task pending name='Task-2540' coro=<AsyncServer.h
>
>
> If anyone can help with any of these please reply to the email. We
> probably need to transfer some into bugzilla, I just wanted to at least
> get something written down.
>
> Cheers,
>
> Richard
>
>
>

