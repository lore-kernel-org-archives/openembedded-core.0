Return-Path: <alex.bennee@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAFFFC4167D
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 18:51:15 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.4551.1702407070998607756
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 10:51:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=nX1C5lEA;
 spf=pass (domain: linaro.org, ip: 209.85.128.42, mailfrom: alex.bennee@linaro.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40c236624edso60575925e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 10:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702407069; x=1703011869; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TpCwVX7uBiOh80jf85hbO9S/d7OUET+h8ZO9Lq5SeSc=;
        b=nX1C5lEAkTsCWFYGW3obyy5jJf/nNaN1uaKBhlt3eENOF8AYnYDNplQh3u1DhtH78i
         6xrgYzsoCZQ0oMiw7Lqzo6w7g75sFIsaWIhD1vj0yCx9nsCvynLBz/0AkwmYlx+B/bQe
         KIKUVyzfoXCilOXctmO/FzdIfClh0LvzBZOs7Qa7jewoInb/jQHEWMC2lLztvy+UaOSc
         wootUg0ZsUJSWuzrTKlOkOs7MRSs+gc7H/OLKU2zqNtueTXesWR0X/sv3/89vra64ijZ
         PBeodRy3Kqgldlh7JJZCcQD6vzEqg4X7SjE9qfhJZNGEw8UHzfU3CLGByl4sfeqvrRtf
         F9OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702407069; x=1703011869;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TpCwVX7uBiOh80jf85hbO9S/d7OUET+h8ZO9Lq5SeSc=;
        b=OTo1gwU1IKts7JrocyvVd8EdTencWjLBd4Oj4rfScOA5iS8RhTNq3oN/yct/FNLmgT
         SdQn0LuBY6gWDuxEgq6dM5oSuE/LvMczsfY582NWqbb1DWFfxAHJsUilvJDAU0ex1+VY
         HQQ7/79kq69Elm6V7U1rgAOGprx3ryH6J6Q6cqf4Q5RAaSZHVXgeIM0AaG871Kxkvj3y
         cTPcno+qB0wT/Dr0mvObFfo063xQaBYVDay29WMpPLRifLlOSj+fxl3jt1F6H5z0cJta
         TxQv5gQbXHcXcTpVqpyaegR0X0HeJBL2Yvlj6sbEdpu84ww0DmVFhrOdbZXzyF79KuKu
         oBtA==
X-Gm-Message-State: AOJu0YxqGjMTtZo5oM5PSRcxDFUqsy94oR+5lHSWRJfjy/X6zKdvOeoO
	qfmUUwi3SClcH7L+fBd7G2NPuw==
X-Google-Smtp-Source: AGHT+IFD5Ds+yMGJIKORfiveRrruZwdbtJkJFSCz3yFJlfUb7kTmA4ww5wGIMryI9dBoGquT5oo1Ig==
X-Received: by 2002:a1c:770e:0:b0:40c:35b5:701d with SMTP id t14-20020a1c770e000000b0040c35b5701dmr3212866wmi.111.1702407069132;
        Tue, 12 Dec 2023 10:51:09 -0800 (PST)
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id m27-20020a05600c3b1b00b0040b38292253sm19794733wms.30.2023.12.12.10.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 10:51:08 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 6BE0B5F7D3;
	Tue, 12 Dec 2023 18:51:08 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
  richard.purdie@linuxfoundation.org,  alexandre.belloni@bootlin.com,
  Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: Re: [OE-core] [RFC PATCH v2] qemurunner.py: continue to drain
 stdout after login:
In-Reply-To: <CAMKF1spkcbVQj=Mvv37TRnMWEcF5BuEjUYYnOmHmfrQkOqzo1g@mail.gmail.com>
	(Khem Raj's message of "Tue, 12 Dec 2023 10:26:31 -0800")
References: <20231211155729.106010-1-alex.bennee@linaro.org>
	<CAMKF1spkcbVQj=Mvv37TRnMWEcF5BuEjUYYnOmHmfrQkOqzo1g@mail.gmail.com>
User-Agent: mu4e 1.11.26; emacs 29.1
Date: Tue, 12 Dec 2023 18:51:08 +0000
Message-ID: <87fs07b6g3.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 18:51:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192243

Khem Raj <raj.khem@gmail.com> writes:

> this version hangs the run forever.

Do you have a reproducer? In my "make test" case it works fine.

Alternatively you could gdb attach to the hanging python and use py-bt
to generate a python backtrace.

>
> On Mon, Dec 11, 2023 at 7:57=E2=80=AFAM Alex Benn=C3=A9e <alex.bennee@lin=
aro.org> wrote:
>>
>> If qemurunner doesn't continuously drain stdout we will eventually
>> cause QEMU to block while trying to write to the pipe. This can
>> manifest itself if the guest has for example configured its serial
>> ports to output via stdio even if the test itself is using a TCP
>> console or SSH to run things.
>>
>> To do this:
>>
>>   - always create a logging thread regardless of serial_ports
>>   - use a semaphore between main and logging threads
>>   - move the login detection into the logging thread
>>   - wait until the second acquire before continuing
>>
>> This doesn't address a potential overflow of stderr although generally
>> stderr from QEMU will be a lot less likely to block due to the volume
>> of data.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
>> ---
>>  meta/lib/oeqa/utils/qemurunner.py | 128 ++++++++++++++++++------------
>>  1 file changed, 78 insertions(+), 50 deletions(-)
>>
>> diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qem=
urunner.py
>> index 29fe271976..b768c08f04 100644
>> --- a/meta/lib/oeqa/utils/qemurunner.py
>> +++ b/meta/lib/oeqa/utils/qemurunner.py
>> @@ -207,8 +207,7 @@ class QemuRunner:
>>          self.logger.info("QMP Available for connection at %s" % (qmp_po=
rt2))
>>
>>          try:
>> -            if self.serial_ports >=3D 2:
>> -                self.threadsock, threadport =3D self.create_socket()
>> +            self.threadsock, threadport =3D self.create_socket()
>>              self.server_socket, self.serverport =3D self.create_socket()
>>          except socket.error as msg:
>>              self.logger.error("Failed to create listening socket: %s" %=
 msg[1])
>> @@ -243,6 +242,7 @@ class QemuRunner:
>>          # to be a proper fix but this will suffice for now.
>>          self.runqemu =3D subprocess.Popen(launch_cmd, shell=3DTrue, std=
out=3Dsubprocess.PIPE, stderr=3Dsubprocess.STDOUT, stdin=3Dsubprocess.PIPE,=
 preexec_fn=3Dos.setpgrp, env=3Denv, cwd=3Dself.tmpdir)
>>          output =3D self.runqemu.stdout
>> +        output_drain =3D output
>>          launch_time =3D time.time()
>>
>>          #
>> @@ -431,21 +431,30 @@ class QemuRunner:
>>          self.logger.debug("Target IP: %s" % self.ip)
>>          self.logger.debug("Server IP: %s" % self.server_ip)
>>
>> -        if self.serial_ports >=3D 2:
>> -            self.thread =3D LoggingThread(self.log, self.threadsock, se=
lf.logger)
>> -            self.thread.start()
>> -            if not self.thread.connection_established.wait(self.boottim=
e):
>> -                self.logger.error("Didn't receive a console connection =
from qemu. "
>> -                             "Here is the qemu command line used:\n%s\n=
and "
>> -                             "output from runqemu:\n%s" % (cmdline, out=
))
>> -                self.stop_thread()
>> -                return False
>> +        # Create and hold onto the login semaphore, this will block
>> +        # the LoggingThread until we are ready
>> +        login_semaphore =3D threading.Semaphore()
>> +        login_semaphore.acquire()
>> +
>> +        self.thread =3D LoggingThread(self.log, self.threadsock,
>> +                                    self.runqemu.stdout, self.boot_patt=
erns['search_reached_prompt'],
>> +                                    self.logger, login_semaphore)
>> +
>> +        self.thread.start()
>> +        login_semaphore.release()
>> +
>> +        # if not self.thread.connection_established.wait(self.boottime):
>> +        #     self.logger.error("Didn't receive a console connection fr=
om qemu. "
>> +        #                       "Here is the qemu command line used:\n%=
s\nand "
>> +        #                       "output from runqemu:\n%s" % (cmdline, =
out))
>> +        #     self.stop_thread()
>> +        #     return False
>>
>>          self.logger.debug("Output from runqemu:\n%s", out)
>>          self.logger.debug("Waiting at most %d seconds for login banner =
(%s)" %
>>                            (self.boottime, time.strftime("%D %H:%M:%S")))
>>          endtime =3D time.time() + self.boottime
>> -        filelist =3D [self.server_socket, self.runqemu.stdout]
>> +        filelist =3D [self.server_socket]
>>          reachedlogin =3D False
>>          stopread =3D False
>>          qemusock =3D None
>> @@ -464,46 +473,19 @@ class QemuRunner:
>>                      filelist.remove(self.server_socket)
>>                      self.logger.debug("Connection from %s:%s" % addr)
>>                  else:
>> -                    # try to avoid reading only a single character at a=
 time
>> -                    time.sleep(0.1)
>> -                    if hasattr(file, 'read'):
>> -                        read =3D file.read(1024)
>> -                    elif hasattr(file, 'recv'):
>> -                        read =3D file.recv(1024)
>> -                    else:
>> -                        self.logger.error('Invalid file type: %s\n%s' %=
 (file))
>> -                        read =3D b''
>> -
>> -                    self.logger.debug2('Partial boot log:\n%s' % (read.=
decode('utf-8', errors=3D'backslashreplace')))
>> -                    data =3D data + read
>> -                    if data:
>> -                        bootlog +=3D data
>> -                        self.log(data, extension =3D ".2")
>> -                        data =3D b''
>> -
>> -                        if bytes(self.boot_patterns['search_reached_pro=
mpt'], 'utf-8') in bootlog:
>> -                            self.server_socket.close()
>> -                            self.server_socket =3D qemusock
>> -                            stopread =3D True
>> -                            reachedlogin =3D True
>> -                            self.logger.debug("Reached login banner in =
%.2f seconds (%s)" %
>> -                                              (time.time() - (endtime -=
 self.boottime),
>> -                                              time.strftime("%D %H:%M:%=
S")))
>> -                    else:
>> -                        # no need to check if reachedlogin unless we su=
pport multiple connections
>> -                        self.logger.debug("QEMU socket disconnected bef=
ore login banner reached. (%s)" %
>> -                                          time.strftime("%D %H:%M:%S"))
>> -                        filelist.remove(file)
>> -                        file.close()
>> +                    if login_semaphore.acquire(blocking=3DFalse):
>> +                        self.server_socket.close()
>> +                        self.server_socket =3D qemusock
>>                          stopread =3D True
>> +                        reachedlogin =3D True
>> +
>> +        self.logger.debug("continuing on....")
>>
>>          if not reachedlogin:
>>              if time.time() >=3D endtime:
>>                  self.logger.warning("Target didn't reach login banner i=
n %d seconds (%s)" %
>>                                    (self.boottime, time.strftime("%D %H:=
%M:%S")))
>>              tail =3D lambda l: "\n".join(l.splitlines()[-25:])
>> -            bootlog =3D self.decode_qemulog(bootlog)
>> -            self.logger.warning("Last 25 lines of login console (%d):\n=
%s" % (len(bootlog), tail(bootlog)))
>>              self.logger.warning("Last 25 lines of all logging (%d):\n%s=
" % (len(self.msg), tail(self.msg)))
>>              self.logger.warning("Check full boot log: %s" % self.logfil=
e)
>>              self.stop()
>> @@ -539,6 +521,7 @@ class QemuRunner:
>>                  self.logger.warning("The output:\n%s" % output)
>>          except:
>>              self.logger.warning("Serial console failed while trying to =
login")
>> +
>>          return True
>>
>>      def stop(self):
>> @@ -696,14 +679,16 @@ class QemuRunner:
>>                      status =3D 1
>>          return (status, str(data))
>>
>> -# This class is for reading data from a socket and passing it to logfunc
>> -# to be processed. It's completely event driven and has a straightforwa=
rd
>> -# event loop. The mechanism for stopping the thread is a simple pipe wh=
ich
>> -# will wake up the poll and allow for tearing everything down.
>> +# This class is for reading data from sockets and QEMU's stdio output
>> +# and passing it to logfunc to be processed. It's completely event
>> +# driven and has a straightforward event loop. The mechanism for
>> +# stopping the thread is a simple pipe which will wake up the poll and
>> +# allow for tearing everything down.
>>  class LoggingThread(threading.Thread):
>> -    def __init__(self, logfunc, sock, logger):
>> +    def __init__(self, logfunc, sock, qemu_stdio, prompt, logger, semap=
hore):
>>          self.connection_established =3D threading.Event()
>>          self.serversock =3D sock
>> +        self.qemu_stdio =3D qemu_stdio
>>          self.logfunc =3D logfunc
>>          self.logger =3D logger
>>          self.readsock =3D None
>> @@ -713,9 +698,19 @@ class LoggingThread(threading.Thread):
>>          self.errorevents =3D select.POLLERR | select.POLLHUP | select.P=
OLLNVAL
>>          self.readevents =3D select.POLLIN | select.POLLPRI
>>
>> +        # tracking until we see prompt
>> +        self.prompt =3D prompt
>> +        self.prompt_seen =3D False
>> +        self.boot_log =3D b''
>> +        self.semaphore =3D semaphore
>> +        self.boottime =3D time.time()
>> +
>>          threading.Thread.__init__(self, target=3Dself.threadtarget)
>>
>>      def threadtarget(self):
>> +        # we acquire until we see the boot prompt
>> +        self.semaphore.acquire()
>> +
>>          try:
>>              self.eventloop()
>>          finally:
>> @@ -750,6 +745,7 @@ class LoggingThread(threading.Thread):
>>          event_read_mask =3D self.errorevents | self.readevents
>>          poll.register(self.serversock.fileno())
>>          poll.register(self.readpipe, event_read_mask)
>> +        poll.register(self.qemu_stdio, event_read_mask)
>>
>>          breakout =3D False
>>          self.running =3D True
>> @@ -757,8 +753,12 @@ class LoggingThread(threading.Thread):
>>          while not breakout:
>>              events =3D poll.poll()
>>              for event in events:
>> +
>> +                self.logger.debug(f"event is {event}")
>> +
>>                  # An error occurred, bail out
>>                  if event[1] & self.errorevents:
>> +                    self.logger.debug("error event")
>>                      raise Exception(self.stringify_event(event[1]))
>>
>>                  # Event to stop the thread
>> @@ -767,6 +767,10 @@ class LoggingThread(threading.Thread):
>>                      breakout =3D True
>>                      break
>>
>> +                # stdio data to be logged
>> +                elif self.qemu_stdio.fileno() =3D=3D event[0]:
>> +                    self.consume_qemu_stdio()
>> +
>>                  # A connection request was received
>>                  elif self.serversock.fileno() =3D=3D event[0]:
>>                      self.logger.debug("Connection request received")
>> @@ -783,6 +787,30 @@ class LoggingThread(threading.Thread):
>>                      data =3D self.recv(1024)
>>                      self.logfunc(data)
>>
>> +
>> +    # Consume QEMU's stdio output, checking for login strings
>> +    def consume_qemu_stdio(self):
>> +        # try to avoid reading only a single character at a time
>> +        time.sleep(0.1)
>> +        read =3D self.qemu_stdio.read(1024)
>> +
>> +        # log what we have seen
>> +        decoded_data =3D read.decode('utf-8', errors=3D'backslashreplac=
e')
>> +        if self.prompt_seen:
>> +            self.logger.debug2('Post login log:\n%s' % decoded_data)
>> +        else:
>> +            self.logger.debug2('Pre login log:\n%s' % decoded_data)
>> +
>> +        if not self.prompt_seen and read:
>> +            self.boot_log +=3D read
>> +
>> +            if bytes(self.prompt, 'utf-8') in self.boot_log:
>> +                time_to_login =3D time.time() - self.boottime
>> +                self.logger.debug("Reached login banner in %.2f seconds=
 (%s)" %
>> +                                  (time_to_login,  time.strftime("%D %H=
:%M:%S")))
>> +                self.semaphore.release()
>> +                self.prompt_seen =3D True
>> +
>>      # Since the socket is non-blocking make sure to honor EAGAIN
>>      # and EWOULDBLOCK.
>>      def recv(self, count):
>> --
>> 2.39.2
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#192177): https://lists.openembedded.org/g/openembedd=
ed-core/message/192177
>> Mute This Topic: https://lists.openembedded.org/mt/103111135/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [r=
aj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

