Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE4C4C05027
	for <webhook@archiver.kernel.org>; Sun, 29 Jan 2023 15:41:11 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.18052.1675006866351549464
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Jan 2023 07:41:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FQjR3QDm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id o36so455058wms.1
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Jan 2023 07:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rgsvFYU2N1gODHme1ibbzzAqqfnP6Y4jWJnDsMuGgUk=;
        b=FQjR3QDmDZqkF2TW3UkmbS40OmQA5XExg8VpF8GgPqn4tNvU2TgPDQhK0XEqHb88Be
         MjSnFYboGprpnmIuDz06ajXx8CJDdV0LxKgNIUAPHGcw5weCDfCTWvlLSVBMOF/fWD13
         Nn/EjlhWSKfut/swZjMKaJhJPtNy0fSJrKx4A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rgsvFYU2N1gODHme1ibbzzAqqfnP6Y4jWJnDsMuGgUk=;
        b=EMmAopFfe23bmvA108d8tuAhYc1+SQEfS0pPK/2zhZPl6IDO+F+F8LlQfLOBUWuwCI
         iiCLpOOwDtWlOw2Dp92+uV3y5dzx3F8hU2ama0qbnv8NBpfWujuBAiZmsKggl8Vc+zk1
         Utg0JJuK9YoXj87wzUoEubIunecSamN0DWjsuBjQnVRELSo6BHvsW/2hGqj0LxJM+nnh
         baSKwDCEHKzKtLPf+BTZ3ErouahweFUKzy0qDjWLVyjdbXhjLWfgVoCI3vSTj2g5ki3R
         dmrEfuwpFKZxquoxC5IHYY7oG2+7LHNhiyKwA8HIC5vTjy6D5gXAU/aiZP/BnSs73B0b
         AvaA==
X-Gm-Message-State: AFqh2ko5tE4XWGjyY9gxszv0SAzaKNl2378FzpAtazgl3inDMSiYJtPG
	B1IbAiEuaI2wS9YxuHIck6gIPW6rcuXt7gno
X-Google-Smtp-Source: AMrXdXtQV/fBiM8H+WoAJiabjyu3cMszXdevKEn2HG5IFLWz/biAFxvlQmXuiG16ynhS0wgiHj6fUg==
X-Received: by 2002:a05:600c:1c8e:b0:3d9:e5f9:984c with SMTP id k14-20020a05600c1c8e00b003d9e5f9984cmr48634507wms.2.1675006864357;
        Sun, 29 Jan 2023 07:41:04 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:f380:b6b4:14ae:a3d0? ([2001:8b0:aba:5f3c:f380:b6b4:14ae:a3d0])
        by smtp.gmail.com with ESMTPSA id bg6-20020a05600c3c8600b003db06493ee7sm15389865wmb.47.2023.01.29.07.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jan 2023 07:41:03 -0800 (PST)
Message-ID: <aba59b60b8eb52c2963aaaafa0308fbbf80443db.camel@linuxfoundation.org>
Subject: Current QA failure challenges (perf, QA http-server, asyncio
 prserv, bitbake runCommand timeout, unfsd test issue)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, Joshua Watt
	 <JPEWhacker@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Sun, 29 Jan 2023 15:41:03 +0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Jan 2023 15:41:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176476

Hi All,

I've going to be a distracted this next week with other project related
things and the autobuilder is showing a number of problems. I've spent
part of my weekend trying to stabilise things so I could not have the
distraction and whilst I've had partial success, things aren't
resolved. I'm sending this out in the hope others may be able to
help/assist. The issues:

Kernel 6.1 reproducibility issue in perf
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

We've had two fixes which do seem to have fixed the kernel-devsrc issue
but not the perf one. The diffoscope:

http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20230129-8bp_1b_=
z/packages/diff-html/

The autobuilder failure:

https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/2314/ste=
ps/13/logs/stdio

Part of the issue is this seems to be host contamination, so you do
need to build on a different host. The first time the test runs, it
does so on the same host and the output is unchanged which is why we've
had green builds but then failures.

I did try removing the sstate for perf, the issue came back, so it
isn't a cache contamination issue afaik.


bitbake timeout on sending commands
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Bitbake runCommand appears to be able to hang in the send since
there is no timeout set there. This can cause things to block. We need
to put a worse case timeout/exit in there.


unfs tests leave nfs server running
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

After the unfs NFS test runs, we seem to leave an unfs server hanging
around after the builds are long gone. These build up on the
autobuilder workers.


http-server in dnf tests breaking
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D

We've started seeing a lot of short packets with the http-server used
by the dnf package manager tests. dnf retries and succeeds leaving a
failure in the logs which parse_logs picks up.

https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/6592/step=
s/14/logs/stdio
Central error: 2023-01-29T11:43:32+0000 INFO Error during transfer: Curl er=
ror (18): Transferred a partial file for http://192.168.7.1:36183/cortexa15=
t2hf_neon/libc6-2.36-r0.cortexa15t2hf_neon.rpm [transfer closed with 15758 =
bytes remaining to read]
https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/6592/step=
s/14/logs/stdio
Central error: 2023-01-29T11:07:31+0000 INFO Error during transfer: Curl er=
ror (18): Transferred a partial file for http://192.168.7.3:42417/core2_32/=
busybox-1.35.0-r0.core2_32.rpm [transfer closed with 14627 bytes remaining =
to read]

https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/6598/step=
s/13/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/6532

and a load more. Why the sudden increase in frequency, not sure. Could
be 6.1 kernel related.


asyncio issues with PR Serv
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D

I've found at least one bug with what the code was doing and fixing
that should help some of the test failures we've seen. When looking
into that I found more problems though.

If you run "oe-selftest -r prservice -j 3 -K" and then look at the
bitbake-cookerdaemon.log, it shows a load of python asyncio issues. The
first one is:

/usr/lib/python3.10/asyncio/base_events.py:685: ResourceWarning:
unclosed event loop <_UnixSelectorEventLoop running=3DFalse closed=3DFalse
debug=3DFalse>
  _warn(f"unclosed event loop {self!r}", ResourceWarning, source=3Dself)

showing connections to the PR service aren't being cleaned up.

Also:

/home/pokybuild/yocto-worker/oe-selftest-
debian/build/bitbake/lib/bb/codeparser.py:472: ResourceWarning:
unclosed <socket.socket fd=3D15, family=3DAddressFamily.AF_INET,
type=3DSocketKind.SOCK_STREAM, proto=3D6, laddr=3D('127.0.0.1', 47910),
raddr=3D('127.0.0.1', 40751)>
  self.process_tokens(more_tokens)

but the codeparser reference isn't accurate, it is just from the
garbage collection point.

The second issue is that in running the selftests, a PR Service process
often seems to be left behind without bitbake running. It suggests some
kind of lifecycle issue somewhere. It might only be happening in
failure cases, not sure.

The third issue seems to be around event loop shutdown. On debian11
with py 3.9, when bitbake is shutting down we're seeing:

412934 07:12:26.081334 Exiting (socket: True)
/usr/lib/python3.9/signal.py:30: ResourceWarning: unclosed
<socket.socket fd=3D22, family=3DAddressFamily.AF_INET,
type=3DSocketKind.SOCK_STREAM, proto=3D6, laddr=3D('127.0.0.1', 36287), r
addr=3D('127.0.0.1', 36422)>
  return enum_klass(value)
ResourceWarning: Enable tracemalloc to get the object allocation
traceback
/usr/lib/python3.9/asyncio/selector_events.py:704: ResourceWarning:
unclosed transport <_SelectorSocketTransport fd=3D22>
  _warn(f"unclosed transport {self!r}", ResourceWarning, source=3Dself)
ResourceWarning: Enable tracemalloc to get the object allocation
traceback
Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-
debian/build/bitbake/lib/bb/asyncrpc/serv.py", line 71, in
process_requests
    d =3D await self.read_message()
GeneratorExit

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-
debian/build/bitbake/lib/bb/asyncrpc/serv.py", line 201, in
handle_client
    await client.process_requests()
  File "/home/pokybuild/yocto-worker/oe-selftest-
debian/build/bitbake/lib/bb/asyncrpc/serv.py", line 79, in
process_requests
    self.writer.close()
  File "/usr/lib/python3.9/asyncio/streams.py", line 353, in close
    return self._transport.close()
  File "/usr/lib/python3.9/asyncio/selector_events.py", line 700, in
close
    self._loop.call_soon(self._call_connection_lost, None)
  File "/usr/lib/python3.9/asyncio/base_events.py", line 746, in
call_soon
    self._check_closed()
  File "/usr/lib/python3.9/asyncio/base_events.py", line 510, in
_check_closed
    raise RuntimeError('Event loop is closed')
RuntimeError: Event loop is closed
Task was destroyed but it is pending!
task: <Task pending name=3D'Task-2540' coro=3D<AsyncServer.h


If anyone can help with any of these please reply to the email. We
probably need to transfer some into bugzilla, I just wanted to at least
get something written down.

Cheers,

Richard




