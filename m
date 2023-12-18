Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E131BC35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 11:23:24 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.42003.1702898596562796621
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 03:23:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WxCutXnp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3366827ca79so614270f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 03:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702898595; x=1703503395; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I4Yqm6RC80JEjMVAGrOLCt5kThWsOAa9EDJfUo269ic=;
        b=WxCutXnpI6zAPK9ejsjNp0FghPifPCo9WONfOsgb5OoCpqTwUEgqPK8LVtI2V2/I3b
         LtUBQMFUFSQgaFX9zNTlJCILCADvLrde/7IBfHD+L/LfA7Jzo6EIIz+LY8RDaa23qQIZ
         z2WOuKxUZye0d+u/k180my39ph3TSicwXqARA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702898595; x=1703503395;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I4Yqm6RC80JEjMVAGrOLCt5kThWsOAa9EDJfUo269ic=;
        b=eLK1uKYmzzrp5uhFk8jRUKkpZ8xlPoPjkaLQMZ1ycgJ3EekanNO5M/AoBNlCgcTvgM
         NJ1qJxY/AwUsGFfrzy0V0BBNboC8wzEXTDD1ouFeLIdRogdr9++MgJv7fI5bm7ume87E
         /zaTBZIBzqOpSIfAxW+gW9uSb5OeJSIEw5dlHRvhysVUPexVjlfau5lrtzle/1RrChEz
         C83bSrEymWJBPgbcDPDmzSNWj5Ts1gnPLofAl82VVQabuvG9Tjc/qGgY8IIja1vmUEKr
         HXkd2PCBq0Byj1IKCDBActsoT0InXkhRYUmRHTVh6TJ7MxwBZrJVyTa2lph4sdvq8sYV
         W9nA==
X-Gm-Message-State: AOJu0YxSXPs8mZD+SaWdelAXBqydRIzjaAOwYxU4xZ9OoYIWYArjjL2s
	yOmXPAd4Hcf9LZU4/xUv8GnVPA==
X-Google-Smtp-Source: AGHT+IGCD+8xcXK0wLFjnROL9prKcXcQUfT6jZzrKd5FqKW/+eGuddZa/JQFOGVaFRM++6pf4ubflQ==
X-Received: by 2002:a5d:48c1:0:b0:333:2fd2:4b03 with SMTP id p1-20020a5d48c1000000b003332fd24b03mr7288433wrs.127.1702898594359;
        Mon, 18 Dec 2023 03:23:14 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:a720:6e27:acc4:d591? ([2001:8b0:aba:5f3c:a720:6e27:acc4:d591])
        by smtp.gmail.com with ESMTPSA id q3-20020a5d5743000000b003365bd008a1sm7575533wrw.71.2023.12.18.03.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 03:23:13 -0800 (PST)
Message-ID: <92dd228ae98cff34a72919576e6c9b0b39136218.camel@linuxfoundation.org>
Subject: Re: [RFC PATCH v2] qemurunner.py: continue to drain stdout after
 login:
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, 
	openembedded-core@lists.openembedded.org
Cc: alexandre.belloni@bootlin.com, Mikko Rapeli <mikko.rapeli@linaro.org>
Date: Mon, 18 Dec 2023 11:23:13 +0000
In-Reply-To: <20231211155729.106010-1-alex.bennee@linaro.org>
References: <20231211155729.106010-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 11:23:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192632

On Mon, 2023-12-11 at 15:57 +0000, Alex Benn=C3=A9e wrote:
> If qemurunner doesn't continuously drain stdout we will eventually
> cause QEMU to block while trying to write to the pipe. This can
> manifest itself if the guest has for example configured its serial
> ports to output via stdio even if the test itself is using a TCP
> console or SSH to run things.
>=20
> To do this:
>=20
>   - always create a logging thread regardless of serial_ports
>   - use a semaphore between main and logging threads
>   - move the login detection into the logging thread
>   - wait until the second acquire before continuing
>=20
> This doesn't address a potential overflow of stderr although generally
> stderr from QEMU will be a lot less likely to block due to the volume
> of data.
>=20
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  meta/lib/oeqa/utils/qemurunner.py | 128 ++++++++++++++++++------------
>  1 file changed, 78 insertions(+), 50 deletions(-)
>=20
> diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemu=
runner.py
> index 29fe271976..b768c08f04 100644
> --- a/meta/lib/oeqa/utils/qemurunner.py
> +++ b/meta/lib/oeqa/utils/qemurunner.py
> @@ -207,8 +207,7 @@ class QemuRunner:
>          self.logger.info("QMP Available for connection at %s" % (qmp_por=
t2))
> =20
>          try:
> -            if self.serial_ports >=3D 2:
> -                self.threadsock, threadport =3D self.create_socket()
> +            self.threadsock, threadport =3D self.create_socket()
>              self.server_socket, self.serverport =3D self.create_socket()
>          except socket.error as msg:
>              self.logger.error("Failed to create listening socket: %s" % =
msg[1])
> @@ -243,6 +242,7 @@ class QemuRunner:
>          # to be a proper fix but this will suffice for now.
>          self.runqemu =3D subprocess.Popen(launch_cmd, shell=3DTrue, stdo=
ut=3Dsubprocess.PIPE, stderr=3Dsubprocess.STDOUT, stdin=3Dsubprocess.PIPE, =
preexec_fn=3Dos.setpgrp, env=3Denv, cwd=3Dself.tmpdir)
>          output =3D self.runqemu.stdout
> +        output_drain =3D output
>          launch_time =3D time.time()
> =20
>          #
> @@ -431,21 +431,30 @@ class QemuRunner:
>          self.logger.debug("Target IP: %s" % self.ip)
>          self.logger.debug("Server IP: %s" % self.server_ip)
> =20
> -        if self.serial_ports >=3D 2:
> -            self.thread =3D LoggingThread(self.log, self.threadsock, sel=
f.logger)
> -            self.thread.start()
> -            if not self.thread.connection_established.wait(self.boottime=
):
> -                self.logger.error("Didn't receive a console connection f=
rom qemu. "
> -                             "Here is the qemu command line used:\n%s\na=
nd "
> -                             "output from runqemu:\n%s" % (cmdline, out)=
)
> -                self.stop_thread()
> -                return False
> +        # Create and hold onto the login semaphore, this will block
> +        # the LoggingThread until we are ready
> +        login_semaphore =3D threading.Semaphore()
> +        login_semaphore.acquire()
> +
> +        self.thread =3D LoggingThread(self.log, self.threadsock,
> +                                    self.runqemu.stdout, self.boot_patte=
rns['search_reached_prompt'],
> +                                    self.logger, login_semaphore)
> +
> +        self.thread.start()
> +        login_semaphore.release()
> +
> +        # if not self.thread.connection_established.wait(self.boottime):
> +        #     self.logger.error("Didn't receive a console connection fro=
m qemu. "
> +        #                       "Here is the qemu command line used:\n%s=
\nand "
> +        #                       "output from runqemu:\n%s" % (cmdline, o=
ut))
> +        #     self.stop_thread()
> +        #     return False
> =20
>          self.logger.debug("Output from runqemu:\n%s", out)
>          self.logger.debug("Waiting at most %d seconds for login banner (=
%s)" %
>                            (self.boottime, time.strftime("%D %H:%M:%S")))
>          endtime =3D time.time() + self.boottime
> -        filelist =3D [self.server_socket, self.runqemu.stdout]
> +        filelist =3D [self.server_socket]
>          reachedlogin =3D False
>          stopread =3D False
>          qemusock =3D None
> @@ -464,46 +473,19 @@ class QemuRunner:
>                      filelist.remove(self.server_socket)
>                      self.logger.debug("Connection from %s:%s" % addr)
>                  else:
> -                    # try to avoid reading only a single character at a =
time
> -                    time.sleep(0.1)
> -                    if hasattr(file, 'read'):
> -                        read =3D file.read(1024)
> -                    elif hasattr(file, 'recv'):
> -                        read =3D file.recv(1024)
> -                    else:
> -                        self.logger.error('Invalid file type: %s\n%s' % =
(file))
> -                        read =3D b''
> -
> -                    self.logger.debug2('Partial boot log:\n%s' % (read.d=
ecode('utf-8', errors=3D'backslashreplace')))
> -                    data =3D data + read
> -                    if data:
> -                        bootlog +=3D data
> -                        self.log(data, extension =3D ".2")
> -                        data =3D b''
> -
> -                        if bytes(self.boot_patterns['search_reached_prom=
pt'], 'utf-8') in bootlog:
> -                            self.server_socket.close()
> -                            self.server_socket =3D qemusock
> -                            stopread =3D True
> -                            reachedlogin =3D True
> -                            self.logger.debug("Reached login banner in %=
.2f seconds (%s)" %
> -                                              (time.time() - (endtime - =
self.boottime),
> -                                              time.strftime("%D %H:%M:%S=
")))
> -                    else:
> -                        # no need to check if reachedlogin unless we sup=
port multiple connections
> -                        self.logger.debug("QEMU socket disconnected befo=
re login banner reached. (%s)" %
> -                                          time.strftime("%D %H:%M:%S"))
> -                        filelist.remove(file)
> -                        file.close()
> +                    if login_semaphore.acquire(blocking=3DFalse):
> +                        self.server_socket.close()
> +                        self.server_socket =3D qemusock
>                          stopread =3D True
> +                        reachedlogin =3D True
> +
> +        self.logger.debug("continuing on....")
> =20
>          if not reachedlogin:
>              if time.time() >=3D endtime:
>                  self.logger.warning("Target didn't reach login banner in=
 %d seconds (%s)" %
>                                    (self.boottime, time.strftime("%D %H:%=
M:%S")))
>              tail =3D lambda l: "\n".join(l.splitlines()[-25:])
> -            bootlog =3D self.decode_qemulog(bootlog)
> -            self.logger.warning("Last 25 lines of login console (%d):\n%=
s" % (len(bootlog), tail(bootlog)))
>              self.logger.warning("Last 25 lines of all logging (%d):\n%s"=
 % (len(self.msg), tail(self.msg)))
>              self.logger.warning("Check full boot log: %s" % self.logfile=
)
>              self.stop()
> @@ -539,6 +521,7 @@ class QemuRunner:
>                  self.logger.warning("The output:\n%s" % output)
>          except:
>              self.logger.warning("Serial console failed while trying to l=
ogin")
> +
>          return True
> =20
>      def stop(self):
> @@ -696,14 +679,16 @@ class QemuRunner:
>                      status =3D 1
>          return (status, str(data))
> =20
> -# This class is for reading data from a socket and passing it to logfunc
> -# to be processed. It's completely event driven and has a straightforwar=
d
> -# event loop. The mechanism for stopping the thread is a simple pipe whi=
ch
> -# will wake up the poll and allow for tearing everything down.
> +# This class is for reading data from sockets and QEMU's stdio output
> +# and passing it to logfunc to be processed. It's completely event
> +# driven and has a straightforward event loop. The mechanism for
> +# stopping the thread is a simple pipe which will wake up the poll and
> +# allow for tearing everything down.
>  class LoggingThread(threading.Thread):
> -    def __init__(self, logfunc, sock, logger):
> +    def __init__(self, logfunc, sock, qemu_stdio, prompt, logger, semaph=
ore):
>          self.connection_established =3D threading.Event()
>          self.serversock =3D sock
> +        self.qemu_stdio =3D qemu_stdio
>          self.logfunc =3D logfunc
>          self.logger =3D logger
>          self.readsock =3D None
> @@ -713,9 +698,19 @@ class LoggingThread(threading.Thread):
>          self.errorevents =3D select.POLLERR | select.POLLHUP | select.PO=
LLNVAL
>          self.readevents =3D select.POLLIN | select.POLLPRI
> =20
> +        # tracking until we see prompt
> +        self.prompt =3D prompt
> +        self.prompt_seen =3D False
> +        self.boot_log =3D b''
> +        self.semaphore =3D semaphore
> +        self.boottime =3D time.time()
> +
>          threading.Thread.__init__(self, target=3Dself.threadtarget)
> =20
>      def threadtarget(self):
> +        # we acquire until we see the boot prompt
> +        self.semaphore.acquire()
> +
>          try:
>              self.eventloop()
>          finally:
> @@ -750,6 +745,7 @@ class LoggingThread(threading.Thread):
>          event_read_mask =3D self.errorevents | self.readevents
>          poll.register(self.serversock.fileno())
>          poll.register(self.readpipe, event_read_mask)
> +        poll.register(self.qemu_stdio, event_read_mask)
> =20
>          breakout =3D False
>          self.running =3D True
> @@ -757,8 +753,12 @@ class LoggingThread(threading.Thread):
>          while not breakout:
>              events =3D poll.poll()
>              for event in events:
> +
> +                self.logger.debug(f"event is {event}")
> +
>                  # An error occurred, bail out
>                  if event[1] & self.errorevents:
> +                    self.logger.debug("error event")
>                      raise Exception(self.stringify_event(event[1]))
> =20
>                  # Event to stop the thread
> @@ -767,6 +767,10 @@ class LoggingThread(threading.Thread):
>                      breakout =3D True
>                      break
> =20
> +                # stdio data to be logged
> +                elif self.qemu_stdio.fileno() =3D=3D event[0]:
> +                    self.consume_qemu_stdio()
> +
>                  # A connection request was received
>                  elif self.serversock.fileno() =3D=3D event[0]:
>                      self.logger.debug("Connection request received")
> @@ -783,6 +787,30 @@ class LoggingThread(threading.Thread):
>                      data =3D self.recv(1024)
>                      self.logfunc(data)
> =20
> +
> +    # Consume QEMU's stdio output, checking for login strings
> +    def consume_qemu_stdio(self):
> +        # try to avoid reading only a single character at a time
> +        time.sleep(0.1)
> +        read =3D self.qemu_stdio.read(1024)
> +
> +        # log what we have seen
> +        decoded_data =3D read.decode('utf-8', errors=3D'backslashreplace=
')
> +        if self.prompt_seen:
> +            self.logger.debug2('Post login log:\n%s' % decoded_data)
> +        else:
> +            self.logger.debug2('Pre login log:\n%s' % decoded_data)
> +
> +        if not self.prompt_seen and read:
> +            self.boot_log +=3D read
> +
> +            if bytes(self.prompt, 'utf-8') in self.boot_log:
> +                time_to_login =3D time.time() - self.boottime
> +                self.logger.debug("Reached login banner in %.2f seconds =
(%s)" %
> +                                  (time_to_login,  time.strftime("%D %H:=
%M:%S")))
> +                self.semaphore.release()
> +                self.prompt_seen =3D True
> +
>      # Since the socket is non-blocking make sure to honor EAGAIN
>      # and EWOULDBLOCK.
>      def recv(self, count):


FWIW I tried testing this locally and "bitbake core-image-full-cmdline
-c testimage" just hangs, it can't work out the login prompt.

This code has been the source of a lot of races issues and intermittent
failures which we only "just" got to the bottom of and introducing a
load more isn't something I'm feeling great about. I'll try and find
some time to see if I can work out any better approach.

Cheers,

Richard




