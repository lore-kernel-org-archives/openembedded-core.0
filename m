Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C028C4332F
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 18:27:05 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web11.3962.1702405618467537102
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 10:26:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lvx4SR77;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-203198c9aa5so32765fac.2
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 10:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702405618; x=1703010418; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sfcghEKxn3l3uHWbDXbAV3qxhq9rr3auUrdWIYky43c=;
        b=lvx4SR77BtNzv2WpGlMDRq5RauundA/VAts8rMPwAKJUh/n+QgymzzvTAN7YsM1/rm
         s+mXQdn5gjWk1t50xJAK05RdIqSDTf+df7xyFzdP8Pt09fpVMBatplNGZS/S9erwmpvo
         85AfeUZqVd/eh3cTuey8oVKrjUqYbs/a/w7iTq+NRkvfnyO3puvVbp5OmQt3bSuJarDd
         V1NXt6x9vPhR5Srs6GPhhHwPiyfinB5RdK0Gk04ThZVY8P1kG2bpujgnXnhXD1blFkeC
         Ov2ztkolTJXbtjp6tCrih/ZtwxYjLFsrLBymUHlK7dib0hA0Jol61yaCB0uDRqTaXZLS
         tQzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702405618; x=1703010418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sfcghEKxn3l3uHWbDXbAV3qxhq9rr3auUrdWIYky43c=;
        b=DPs1nOXfP6H6sGqTJatvxhm32Kl8UBhxFnTPlovEo2t8AgzZfgmQe/izXViqGNh4HC
         Qg3fkg45P54eAJ1rIR6rcjCcSPtIoX56AheidsTmeedxiMeAsXAFHEModhxs652+5WRp
         4PKPi1b7e2U3dKBS1Q/cJrI6BVmg/4NCAlweeHelGzNWbaTDXrugmJVFiVHka7/3N+Fh
         XtVwavpIH+lwA/XKGdv3EZcuHJFb9lKtc3cVi+9Ay+/xpwGAPaNUj+5iRbA7nypYY53k
         t0oMv+Aazsr3ySIO13EyWvFfR6qL6ZkDC45kfanrntg8so/jY8qsNbgfzuPIuoHehpVg
         zmoA==
X-Gm-Message-State: AOJu0YxD5HtU5sRQzpF3bRiNCV/nJMZfOQVpywIBAo6Mcr1Bi8vdsECK
	QzmmI79osbEf7IAQ2oANYTVZKMLzrWqgkkXqQdU=
X-Google-Smtp-Source: AGHT+IEP2OqfhZ9OUBNEWAVz++LQvbunopZk7k/NrBP1ECvJFWnweyJJxeUv7EiIjdQ8Kkn9B8Omf2O4vOD619G+E+U=
X-Received: by 2002:a05:6870:a454:b0:1fa:f170:bf27 with SMTP id
 n20-20020a056870a45400b001faf170bf27mr7987946oal.40.1702405617533; Tue, 12
 Dec 2023 10:26:57 -0800 (PST)
MIME-Version: 1.0
References: <20231211155729.106010-1-alex.bennee@linaro.org>
In-Reply-To: <20231211155729.106010-1-alex.bennee@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 Dec 2023 10:26:31 -0800
Message-ID: <CAMKF1spkcbVQj=Mvv37TRnMWEcF5BuEjUYYnOmHmfrQkOqzo1g@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH v2] qemurunner.py: continue to drain stdout
 after login:
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: openembedded-core@lists.openembedded.org, 
	richard.purdie@linuxfoundation.org, alexandre.belloni@bootlin.com, 
	Mikko Rapeli <mikko.rapeli@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 18:27:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192241

this version hangs the run forever.

On Mon, Dec 11, 2023 at 7:57=E2=80=AFAM Alex Benn=C3=A9e <alex.bennee@linar=
o.org> wrote:
>
> If qemurunner doesn't continuously drain stdout we will eventually
> cause QEMU to block while trying to write to the pipe. This can
> manifest itself if the guest has for example configured its serial
> ports to output via stdio even if the test itself is using a TCP
> console or SSH to run things.
>
> To do this:
>
>   - always create a logging thread regardless of serial_ports
>   - use a semaphore between main and logging threads
>   - move the login detection into the logging thread
>   - wait until the second acquire before continuing
>
> This doesn't address a potential overflow of stderr although generally
> stderr from QEMU will be a lot less likely to block due to the volume
> of data.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  meta/lib/oeqa/utils/qemurunner.py | 128 ++++++++++++++++++------------
>  1 file changed, 78 insertions(+), 50 deletions(-)
>
> diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemu=
runner.py
> index 29fe271976..b768c08f04 100644
> --- a/meta/lib/oeqa/utils/qemurunner.py
> +++ b/meta/lib/oeqa/utils/qemurunner.py
> @@ -207,8 +207,7 @@ class QemuRunner:
>          self.logger.info("QMP Available for connection at %s" % (qmp_por=
t2))
>
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
>
>          #
> @@ -431,21 +431,30 @@ class QemuRunner:
>          self.logger.debug("Target IP: %s" % self.ip)
>          self.logger.debug("Server IP: %s" % self.server_ip)
>
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
>
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
>
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
>
>      def stop(self):
> @@ -696,14 +679,16 @@ class QemuRunner:
>                      status =3D 1
>          return (status, str(data))
>
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
>
> +        # tracking until we see prompt
> +        self.prompt =3D prompt
> +        self.prompt_seen =3D False
> +        self.boot_log =3D b''
> +        self.semaphore =3D semaphore
> +        self.boottime =3D time.time()
> +
>          threading.Thread.__init__(self, target=3Dself.threadtarget)
>
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
>
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
>
>                  # Event to stop the thread
> @@ -767,6 +767,10 @@ class LoggingThread(threading.Thread):
>                      breakout =3D True
>                      break
>
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
>
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
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192177): https://lists.openembedded.org/g/openembedde=
d-core/message/192177
> Mute This Topic: https://lists.openembedded.org/mt/103111135/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

