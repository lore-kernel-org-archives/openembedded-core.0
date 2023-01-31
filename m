Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCDB8C38142
	for <webhook@archiver.kernel.org>; Tue, 31 Jan 2023 15:06:54 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web10.14375.1675177606045952489
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Jan 2023 07:06:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lesAfqlZ;
 spf=pass (domain: gmail.com, ip: 209.85.166.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f172.google.com with SMTP id m8so6582310ili.7
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Jan 2023 07:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=djsJxTIvGtVb47KZj9n3fljAvttAYr/JaQqxh5n2za4=;
        b=lesAfqlZXbfE1fiiJunKrkE2PaNJNswgaeI9LjJDKnFqPMiYijSIbR5xIqPY/ntBOX
         aWvP9+tl5zdlPekT5AoesPJd64M7aT1unrNDJBNa/vMd99+ZURy2evzgjPtD2HGOO9kP
         96+0ugGoPy0Lo0w7eZJqJ1kNT9OXYQaU7uXIMUMFs5I+01XXJiPehjDXIDBDZy1gHs2U
         Gth+Nb5OAOzY7j01YY06Wkjz0F8KM+dtMvhgLeOYnYFLHBFddBACS93KRWnn2IviiG+Z
         RByak3RMmZP2Ax81dCq9yOb+JpWAozMhsdVm9LlxoX5lUObq9HEGScf4JctWsbxw2aFn
         S4XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=djsJxTIvGtVb47KZj9n3fljAvttAYr/JaQqxh5n2za4=;
        b=xQZuBJik54cuflfAJ1KTiqDBvuZ7yRB3IpNPdxE41TwHHGxW4RAqwJRcbMepRdhrSu
         /8H6/4kaqQ3yKtz7z6CgnOvJtdTVXwwgknGbsLpuQgoDckKi/StkifQBdh+/Yl1CBhUb
         jArq75WwPrQBVnMXsiUXhXSg2cyMLuciMkwS+0eSCJPIqMDNf7eBmkT0N9e33S7KBIOX
         UnLxlnuRcgFZl8dXf1HdSGZnnw4RaUhEmTu8OAQhdXrxSI1+V9mJxJnvYdYtCzpjgHIB
         phzupNSfEs7b++ENPJfYBN3xicidx8Xrz4d5AgWDipMXF/fca27Uti2befzKbDRQU2aG
         ad4g==
X-Gm-Message-State: AFqh2kprAnyeXRi3anoJOFVEEKBcBeRJBsEIAdzvyGTLJOZ2UThe9Opv
	ndYTM6FyG8wbG7gEQUhECUOdK9uomNYZ4buzY+o=
X-Google-Smtp-Source: AMrXdXvwa1/4XwFRv1n4Y1odPq7U1ZZAiCUVkKC9zBp+SMFK2gnJoIiRpeQSlD+/tA8S7u4eeDppkasxgEw7zYaMHkQ=
X-Received: by 2002:a05:6e02:1014:b0:30f:614a:207b with SMTP id
 n20-20020a056e02101400b0030f614a207bmr5693260ilj.117.1675177604482; Tue, 31
 Jan 2023 07:06:44 -0800 (PST)
MIME-Version: 1.0
References: <aba59b60b8eb52c2963aaaafa0308fbbf80443db.camel@linuxfoundation.org>
In-Reply-To: <aba59b60b8eb52c2963aaaafa0308fbbf80443db.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 31 Jan 2023 10:06:33 -0500
Message-ID: <CADkTA4O33Q=Z7vHhxvcn7FYwFKgHmVVVjPmgs8TqC5NjkiDq4A@mail.gmail.com>
Subject: Re: Current QA failure challenges (perf, QA http-server, asyncio
 prserv, bitbake runCommand timeout, unfsd test issue)
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, 
	Joshua Watt <JPEWhacker@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Jan 2023 15:06:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176520

On Sun, Jan 29, 2023 at 10:41 AM Richard Purdie
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


I don't have a great local setup for looking at reproducibility
issues, but once I'm through my current kernel upgrade issues, I'll
start looking at this.

Bruce

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


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

