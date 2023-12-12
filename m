Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7D18C4332F
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 19:43:55 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web11.5818.1702410231560508419
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 11:43:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XJr2tx4x;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6d9f514f796so3482352a34.3
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 11:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702410231; x=1703015031; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=edi6aEt3yFT0rntvN3TTpvVguiK590ldIrOhCFdquD0=;
        b=XJr2tx4xKpzLw11nghdGWiaipPjQfVcJyy6Ro+mAih/IxFZQffpB25yfPpvtCt4BDR
         0j3GCBA2ma+yFBPRJl/ASe7dKeJdi6QFIqqE6CguD3CaRv91Y6JK9CYjb2eU3Gm7XvfM
         SzepMGffgIh+kjYYPtlFuY/FzfCdbAm1iHMdhhWHRbTcgDR1ayADdyM4cVponzf3+ZVf
         pTQDy/AWoXHMo2kfg4gSjm6Klqodn9jDVk3EKdWcAXRLYfl9XIUucld3TEGb8uyrz+Pq
         RW+GQiH3NMyB4rIY3FcyXu378lF3Gc1I4nj5iuQcotZPO4rSDV7kcc6PIAAUw5B88zBZ
         6lPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702410231; x=1703015031;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=edi6aEt3yFT0rntvN3TTpvVguiK590ldIrOhCFdquD0=;
        b=uy6Fb1vuEn17iWZlaXPMHd1Rk88TlaZS13DT7/aWIpBbDrlRQ+htGxJf+0xMgvhTWC
         EgTkcLCUbyqDSqVU+1Qq9Lsnw/ISxvWrH+3fnP+F7jEy6BENCw9zuAbysJQfIj3PSq8g
         HF3iZoHmZED0VSstskLR0q6fg0W/u+vRBjbtt8ME8OBCCdW/CaSXxgv5orbyTUDkAVsl
         22jG+aRtjQZE0D/KoVz/h7FjEtCcWWTnU3c1F0AG6V9ztS/kYB1r8xxmT0b5gV4d45b7
         NdwYCVe0yas+6e3ARy6vbQHFUeahCUcZL/Vt3wMGwtew2htTgi7dFcxWa/MzIfgOo9xh
         WDpA==
X-Gm-Message-State: AOJu0YyTN4yxsaBue1yv2xFnV9xcl40CzURFhKEKMiJWkuifqc+fCcm6
	EgDiwW4g+qPnNMBKnphnan2eIHF008sTbTrMSp7UwfUxDr0=
X-Google-Smtp-Source: AGHT+IFfqxWRfBj8AgvHpKro5SZu6+f+X8puytyRjvvkjwQwyVuP+Cb76AjayaA42NPv1ndiEn9D1VVki6brmRJ7iWs=
X-Received: by 2002:a05:6871:4609:b0:203:d46:ff79 with SMTP id
 nf9-20020a056871460900b002030d46ff79mr1050175oab.106.1702410230592; Tue, 12
 Dec 2023 11:43:50 -0800 (PST)
MIME-Version: 1.0
References: <20231211155729.106010-1-alex.bennee@linaro.org>
 <CAMKF1spkcbVQj=Mvv37TRnMWEcF5BuEjUYYnOmHmfrQkOqzo1g@mail.gmail.com> <87fs07b6g3.fsf@draig.linaro.org>
In-Reply-To: <87fs07b6g3.fsf@draig.linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 Dec 2023 11:43:24 -0800
Message-ID: <CAMKF1soweYSeFZ6f-bw7RBDuXyORHOb244YsgpcqzuH47vkbTA@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 19:43:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192245

I am on arch so no py-bt with gdb out of box but here is bt

#0  0x00007fa1e54ee367 in wait4 () from
/mnt/b/yoe/master/build/tmp/sysroots-uninative/x86_64-linux/lib/libc.so.6
#1  0x00007fa1e5a858b9 in ?? () from
/mnt/b/yoe/master/build/tmp/work/qemux86_64-yoe-linux/core-image-ptest-gstr=
eamer1.0/1.0/recipe-sysroot-native/usr/bin/python3-native/../../lib/libpyth=
on3.11.so.1.0
#2  0x00007fa1e598e94a in ?? () from
/mnt/b/yoe/master/build/tmp/work/qemux86_64-yoe-linux/core-image-ptest-gstr=
eamer1.0/1.0/recipe-sysroot-native/usr/bin/python3-native/../../lib/libpyth=
on3.11.so.1.0
#3  0x00007fa1e594bf03 in PyObject_Vectorcall () from
/mnt/b/yoe/master/build/tmp/work/qemux86_64-yoe-linux/core-image-ptest-gstr=
eamer1.0/1.0/recipe-sysroot-native/usr/bin/python3-native/../../lib/libpyth=
on3.11.so.1.0
#4  0x00007fa1e5900063 in _PyEval_EvalFrameDefault () from
/mnt/b/yoe/master/build/tmp/work/qemux86_64-yoe-linux/core-image-ptest-gstr=
eamer1.0/1.0/recipe-sysroot-native/usr/bin/python3-native/../../lib/libpyth=
on3.11.so.1.0
#5  0x00007fa1e5a1da40 in ?? () from
/mnt/b/yoe/master/build/tmp/work/qemux86_64-yoe-linux/core-image-ptest-gstr=
eamer1.0/1.0/recipe-sysroot-native/usr/bin/python3-native/../../lib/libpyth=
on3.11.so.1.0
#6  0x00007fa1e5a1daf5 in PyEval_EvalCode () from
/mnt/b/yoe/master/build/tmp/work/qemux86_64-yoe-linux/core-image-ptest-gstr=
eamer1.0/1.0/recipe-sysroot-native/usr/bin/python3-native/../../lib/libpyth=
on3.11.so.1.0
#7  0x00007fa1e5a5deb3 in ?? () from
/mnt/b/yoe/master/build/tmp/work/qemux86_64-yoe-linux/core-image-ptest-gstr=
eamer1.0/1.0/recipe-sysroot-native/usr/bin/python3-native/../../lib/libpyth=
on3.11.so.1.0
#8  0x00007fa1e5a5e0d6 in ?? () from
/mnt/b/yoe/master/build/tmp/work/qemux86_64-yoe-linux/core-image-ptest-gstr=
eamer1.0/1.0/recipe-sysroot-native/usr/bin/python3-native/../../lib/libpyth=
on3.11.so.1.0
#9  0x00007fa1e5a5e1b0 in ?? () from
/mnt/b/yoe/master/build/tmp/work/qemux86_64-yoe-linux/core-image-ptest-gstr=
eamer1.0/1.0/recipe-sysroot-native/usr/bin/python3-native/../../lib/libpyth=
on3.11.so.1.0
#10 0x00007fa1e5a60b9b in _PyRun_SimpleFileObject () from
/mnt/b/yoe/master/build/tmp/work/qemux86_64-yoe-linux/core-image-ptest-gstr=
eamer1.0/1.0/recipe-sysroot-native/usr/bin/python3-native/../../lib/libpyth=
on3.11.so.1.0
#11 0x00007fa1e5a6111c in _PyRun_AnyFileObject () from
/mnt/b/yoe/master/build/tmp/work/qemux86_64-yoe-linux/core-image-ptest-gstr=
eamer1.0/1.0/recipe-sysroot-native/usr/bin/python3-native/../../lib/libpyth=
on3.11.so.1.0
#12 0x00007fa1e5a7ddf0 in Py_RunMain () from
/mnt/b/yoe/master/build/tmp/work/qemux86_64-yoe-linux/core-image-ptest-gstr=
eamer1.0/1.0/recipe-sysroot-native/usr/bin/python3-native/../../lib/libpyth=
on3.11.so.1.0
#13 0x00007fa1e5a7e32a in Py_BytesMain () from
/mnt/b/yoe/master/build/tmp/work/qemux86_64-yoe-linux/core-image-ptest-gstr=
eamer1.0/1.0/recipe-sysroot-native/usr/bin/python3-native/../../lib/libpyth=
on3.11.so.1.0
#14 0x00007fa1e5423efb in __libc_start_call_main () from
/mnt/b/yoe/master/build/tmp/sysroots-uninative/x86_64-linux/lib/libc.so.6
#15 0x00007fa1e5423fb9 in __libc_start_main () from
/mnt/b/yoe/master/build/tmp/sysroots-uninative/x86_64-linux/lib/libc.so.6
#16 0x00005581e2c53075 in _start ()

since its using native libs and bins there is no debug info perhaps
due to it being stripped and not kept around as well.

On Tue, Dec 12, 2023 at 10:51=E2=80=AFAM Alex Benn=C3=A9e <alex.bennee@lina=
ro.org> wrote:
>
> Khem Raj <raj.khem@gmail.com> writes:
>
> > this version hangs the run forever.
>
> Do you have a reproducer? In my "make test" case it works fine.
>
> Alternatively you could gdb attach to the hanging python and use py-bt
> to generate a python backtrace.
>
> >
> > On Mon, Dec 11, 2023 at 7:57=E2=80=AFAM Alex Benn=C3=A9e <alex.bennee@l=
inaro.org> wrote:
> >>
> >> If qemurunner doesn't continuously drain stdout we will eventually
> >> cause QEMU to block while trying to write to the pipe. This can
> >> manifest itself if the guest has for example configured its serial
> >> ports to output via stdio even if the test itself is using a TCP
> >> console or SSH to run things.
> >>
> >> To do this:
> >>
> >>   - always create a logging thread regardless of serial_ports
> >>   - use a semaphore between main and logging threads
> >>   - move the login detection into the logging thread
> >>   - wait until the second acquire before continuing
> >>
> >> This doesn't address a potential overflow of stderr although generally
> >> stderr from QEMU will be a lot less likely to block due to the volume
> >> of data.
> >>
> >> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >> Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
> >> ---
> >>  meta/lib/oeqa/utils/qemurunner.py | 128 ++++++++++++++++++-----------=
-
> >>  1 file changed, 78 insertions(+), 50 deletions(-)
> >>
> >> diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/q=
emurunner.py
> >> index 29fe271976..b768c08f04 100644
> >> --- a/meta/lib/oeqa/utils/qemurunner.py
> >> +++ b/meta/lib/oeqa/utils/qemurunner.py
> >> @@ -207,8 +207,7 @@ class QemuRunner:
> >>          self.logger.info("QMP Available for connection at %s" % (qmp_=
port2))
> >>
> >>          try:
> >> -            if self.serial_ports >=3D 2:
> >> -                self.threadsock, threadport =3D self.create_socket()
> >> +            self.threadsock, threadport =3D self.create_socket()
> >>              self.server_socket, self.serverport =3D self.create_socke=
t()
> >>          except socket.error as msg:
> >>              self.logger.error("Failed to create listening socket: %s"=
 % msg[1])
> >> @@ -243,6 +242,7 @@ class QemuRunner:
> >>          # to be a proper fix but this will suffice for now.
> >>          self.runqemu =3D subprocess.Popen(launch_cmd, shell=3DTrue, s=
tdout=3Dsubprocess.PIPE, stderr=3Dsubprocess.STDOUT, stdin=3Dsubprocess.PIP=
E, preexec_fn=3Dos.setpgrp, env=3Denv, cwd=3Dself.tmpdir)
> >>          output =3D self.runqemu.stdout
> >> +        output_drain =3D output
> >>          launch_time =3D time.time()
> >>
> >>          #
> >> @@ -431,21 +431,30 @@ class QemuRunner:
> >>          self.logger.debug("Target IP: %s" % self.ip)
> >>          self.logger.debug("Server IP: %s" % self.server_ip)
> >>
> >> -        if self.serial_ports >=3D 2:
> >> -            self.thread =3D LoggingThread(self.log, self.threadsock, =
self.logger)
> >> -            self.thread.start()
> >> -            if not self.thread.connection_established.wait(self.boott=
ime):
> >> -                self.logger.error("Didn't receive a console connectio=
n from qemu. "
> >> -                             "Here is the qemu command line used:\n%s=
\nand "
> >> -                             "output from runqemu:\n%s" % (cmdline, o=
ut))
> >> -                self.stop_thread()
> >> -                return False
> >> +        # Create and hold onto the login semaphore, this will block
> >> +        # the LoggingThread until we are ready
> >> +        login_semaphore =3D threading.Semaphore()
> >> +        login_semaphore.acquire()
> >> +
> >> +        self.thread =3D LoggingThread(self.log, self.threadsock,
> >> +                                    self.runqemu.stdout, self.boot_pa=
tterns['search_reached_prompt'],
> >> +                                    self.logger, login_semaphore)
> >> +
> >> +        self.thread.start()
> >> +        login_semaphore.release()
> >> +
> >> +        # if not self.thread.connection_established.wait(self.boottim=
e):
> >> +        #     self.logger.error("Didn't receive a console connection =
from qemu. "
> >> +        #                       "Here is the qemu command line used:\=
n%s\nand "
> >> +        #                       "output from runqemu:\n%s" % (cmdline=
, out))
> >> +        #     self.stop_thread()
> >> +        #     return False
> >>
> >>          self.logger.debug("Output from runqemu:\n%s", out)
> >>          self.logger.debug("Waiting at most %d seconds for login banne=
r (%s)" %
> >>                            (self.boottime, time.strftime("%D %H:%M:%S"=
)))
> >>          endtime =3D time.time() + self.boottime
> >> -        filelist =3D [self.server_socket, self.runqemu.stdout]
> >> +        filelist =3D [self.server_socket]
> >>          reachedlogin =3D False
> >>          stopread =3D False
> >>          qemusock =3D None
> >> @@ -464,46 +473,19 @@ class QemuRunner:
> >>                      filelist.remove(self.server_socket)
> >>                      self.logger.debug("Connection from %s:%s" % addr)
> >>                  else:
> >> -                    # try to avoid reading only a single character at=
 a time
> >> -                    time.sleep(0.1)
> >> -                    if hasattr(file, 'read'):
> >> -                        read =3D file.read(1024)
> >> -                    elif hasattr(file, 'recv'):
> >> -                        read =3D file.recv(1024)
> >> -                    else:
> >> -                        self.logger.error('Invalid file type: %s\n%s'=
 % (file))
> >> -                        read =3D b''
> >> -
> >> -                    self.logger.debug2('Partial boot log:\n%s' % (rea=
d.decode('utf-8', errors=3D'backslashreplace')))
> >> -                    data =3D data + read
> >> -                    if data:
> >> -                        bootlog +=3D data
> >> -                        self.log(data, extension =3D ".2")
> >> -                        data =3D b''
> >> -
> >> -                        if bytes(self.boot_patterns['search_reached_p=
rompt'], 'utf-8') in bootlog:
> >> -                            self.server_socket.close()
> >> -                            self.server_socket =3D qemusock
> >> -                            stopread =3D True
> >> -                            reachedlogin =3D True
> >> -                            self.logger.debug("Reached login banner i=
n %.2f seconds (%s)" %
> >> -                                              (time.time() - (endtime=
 - self.boottime),
> >> -                                              time.strftime("%D %H:%M=
:%S")))
> >> -                    else:
> >> -                        # no need to check if reachedlogin unless we =
support multiple connections
> >> -                        self.logger.debug("QEMU socket disconnected b=
efore login banner reached. (%s)" %
> >> -                                          time.strftime("%D %H:%M:%S"=
))
> >> -                        filelist.remove(file)
> >> -                        file.close()
> >> +                    if login_semaphore.acquire(blocking=3DFalse):
> >> +                        self.server_socket.close()
> >> +                        self.server_socket =3D qemusock
> >>                          stopread =3D True
> >> +                        reachedlogin =3D True
> >> +
> >> +        self.logger.debug("continuing on....")
> >>
> >>          if not reachedlogin:
> >>              if time.time() >=3D endtime:
> >>                  self.logger.warning("Target didn't reach login banner=
 in %d seconds (%s)" %
> >>                                    (self.boottime, time.strftime("%D %=
H:%M:%S")))
> >>              tail =3D lambda l: "\n".join(l.splitlines()[-25:])
> >> -            bootlog =3D self.decode_qemulog(bootlog)
> >> -            self.logger.warning("Last 25 lines of login console (%d):=
\n%s" % (len(bootlog), tail(bootlog)))
> >>              self.logger.warning("Last 25 lines of all logging (%d):\n=
%s" % (len(self.msg), tail(self.msg)))
> >>              self.logger.warning("Check full boot log: %s" % self.logf=
ile)
> >>              self.stop()
> >> @@ -539,6 +521,7 @@ class QemuRunner:
> >>                  self.logger.warning("The output:\n%s" % output)
> >>          except:
> >>              self.logger.warning("Serial console failed while trying t=
o login")
> >> +
> >>          return True
> >>
> >>      def stop(self):
> >> @@ -696,14 +679,16 @@ class QemuRunner:
> >>                      status =3D 1
> >>          return (status, str(data))
> >>
> >> -# This class is for reading data from a socket and passing it to logf=
unc
> >> -# to be processed. It's completely event driven and has a straightfor=
ward
> >> -# event loop. The mechanism for stopping the thread is a simple pipe =
which
> >> -# will wake up the poll and allow for tearing everything down.
> >> +# This class is for reading data from sockets and QEMU's stdio output
> >> +# and passing it to logfunc to be processed. It's completely event
> >> +# driven and has a straightforward event loop. The mechanism for
> >> +# stopping the thread is a simple pipe which will wake up the poll an=
d
> >> +# allow for tearing everything down.
> >>  class LoggingThread(threading.Thread):
> >> -    def __init__(self, logfunc, sock, logger):
> >> +    def __init__(self, logfunc, sock, qemu_stdio, prompt, logger, sem=
aphore):
> >>          self.connection_established =3D threading.Event()
> >>          self.serversock =3D sock
> >> +        self.qemu_stdio =3D qemu_stdio
> >>          self.logfunc =3D logfunc
> >>          self.logger =3D logger
> >>          self.readsock =3D None
> >> @@ -713,9 +698,19 @@ class LoggingThread(threading.Thread):
> >>          self.errorevents =3D select.POLLERR | select.POLLHUP | select=
.POLLNVAL
> >>          self.readevents =3D select.POLLIN | select.POLLPRI
> >>
> >> +        # tracking until we see prompt
> >> +        self.prompt =3D prompt
> >> +        self.prompt_seen =3D False
> >> +        self.boot_log =3D b''
> >> +        self.semaphore =3D semaphore
> >> +        self.boottime =3D time.time()
> >> +
> >>          threading.Thread.__init__(self, target=3Dself.threadtarget)
> >>
> >>      def threadtarget(self):
> >> +        # we acquire until we see the boot prompt
> >> +        self.semaphore.acquire()
> >> +
> >>          try:
> >>              self.eventloop()
> >>          finally:
> >> @@ -750,6 +745,7 @@ class LoggingThread(threading.Thread):
> >>          event_read_mask =3D self.errorevents | self.readevents
> >>          poll.register(self.serversock.fileno())
> >>          poll.register(self.readpipe, event_read_mask)
> >> +        poll.register(self.qemu_stdio, event_read_mask)
> >>
> >>          breakout =3D False
> >>          self.running =3D True
> >> @@ -757,8 +753,12 @@ class LoggingThread(threading.Thread):
> >>          while not breakout:
> >>              events =3D poll.poll()
> >>              for event in events:
> >> +
> >> +                self.logger.debug(f"event is {event}")
> >> +
> >>                  # An error occurred, bail out
> >>                  if event[1] & self.errorevents:
> >> +                    self.logger.debug("error event")
> >>                      raise Exception(self.stringify_event(event[1]))
> >>
> >>                  # Event to stop the thread
> >> @@ -767,6 +767,10 @@ class LoggingThread(threading.Thread):
> >>                      breakout =3D True
> >>                      break
> >>
> >> +                # stdio data to be logged
> >> +                elif self.qemu_stdio.fileno() =3D=3D event[0]:
> >> +                    self.consume_qemu_stdio()
> >> +
> >>                  # A connection request was received
> >>                  elif self.serversock.fileno() =3D=3D event[0]:
> >>                      self.logger.debug("Connection request received")
> >> @@ -783,6 +787,30 @@ class LoggingThread(threading.Thread):
> >>                      data =3D self.recv(1024)
> >>                      self.logfunc(data)
> >>
> >> +
> >> +    # Consume QEMU's stdio output, checking for login strings
> >> +    def consume_qemu_stdio(self):
> >> +        # try to avoid reading only a single character at a time
> >> +        time.sleep(0.1)
> >> +        read =3D self.qemu_stdio.read(1024)
> >> +
> >> +        # log what we have seen
> >> +        decoded_data =3D read.decode('utf-8', errors=3D'backslashrepl=
ace')
> >> +        if self.prompt_seen:
> >> +            self.logger.debug2('Post login log:\n%s' % decoded_data)
> >> +        else:
> >> +            self.logger.debug2('Pre login log:\n%s' % decoded_data)
> >> +
> >> +        if not self.prompt_seen and read:
> >> +            self.boot_log +=3D read
> >> +
> >> +            if bytes(self.prompt, 'utf-8') in self.boot_log:
> >> +                time_to_login =3D time.time() - self.boottime
> >> +                self.logger.debug("Reached login banner in %.2f secon=
ds (%s)" %
> >> +                                  (time_to_login,  time.strftime("%D =
%H:%M:%S")))
> >> +                self.semaphore.release()
> >> +                self.prompt_seen =3D True
> >> +
> >>      # Since the socket is non-blocking make sure to honor EAGAIN
> >>      # and EWOULDBLOCK.
> >>      def recv(self, count):
> >> --
> >> 2.39.2
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#192177): https://lists.openembedded.org/g/openembe=
dded-core/message/192177
> >> Mute This Topic: https://lists.openembedded.org/mt/103111135/1997914
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[raj.khem@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>
> --
> Alex Benn=C3=A9e
> Virtualisation Tech Lead @ Linaro

